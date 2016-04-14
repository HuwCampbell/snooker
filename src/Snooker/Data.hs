{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE NoImplicitPrelude #-}
module Snooker.Data (
    ClassName(..)
  , Header(..)
  , CompressedBlock(..)
  ) where

import           Crypto.Hash (Digest, MD5)

import           Data.ByteString (ByteString)

import           GHC.Generics (Generic)

import           P

import           X.Text.Show (gshowsPrec)


newtype ClassName =
  ClassName {
      unClassName :: Text
    } deriving (Eq, Ord, Generic)

instance Show ClassName where
  showsPrec =
    gshowsPrec

data Header =
  Header {
      headerKeyType :: !ClassName
    , headerValueType :: !ClassName
    , headerMetadata :: ![(Text, Text)]
    , headerSync :: !(Digest MD5)
    } deriving (Eq, Ord, Show, Generic)

data CompressedBlock =
  CompressedBlock {
      compressedCount :: !Int
    , compressedKeySizes :: !ByteString
    , compressedKeys :: !ByteString
    , compressedValueSizes :: !ByteString
    , compressedValues :: !ByteString
    } deriving (Eq, Ord, Show, Generic)

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2F34C638E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 08:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233527AbiB1HGi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 02:06:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233502AbiB1HGg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 02:06:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F9566211;
        Sun, 27 Feb 2022 23:05:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D670E6101B;
        Mon, 28 Feb 2022 07:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6C6C340F2;
        Mon, 28 Feb 2022 07:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646031956;
        bh=a9w8OxGDPrZWrrdXUlHDZikjqGEvX6+nZH+B7Zrmdoc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RchH+BZ6WWsZwbC0S2X5hBZUnWsicxhmf1NmzUrG/YRRuiuM+SLB58X1Al07Zyrry
         skwBgvi7ii6xZcT203qS3iB3WcV7YnmtF3OHHs1UiwwW/+9E+iT6m3eLj8hmScfdQw
         DjyCearvxeuFa7Eenyr464LsLvidgOUVVequtqp2glDKgJdxmZvUei0OKxenCfDzaH
         vj2dr+rM5xT/ZUJuzNpw33XbOy8cQf4kgfgUWwNu77mgIND0LMvTBXJyfaIUFhkYbk
         wcSAOkSS1nRGEIvOZmvbIPDC79ko8tvQRlsIH3ZOW5f7kQF3XMtBNfuPyCEER3soVg
         WSgXQfDc6LW9Q==
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        kernel-team@android.com,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        Israel Rukshin <israelr@nvidia.com>
Subject: [PATCH v5 1/3] block: add basic hardware-wrapped key support
Date:   Sun, 27 Feb 2022 23:05:18 -0800
Message-Id: <20220228070520.74082-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228070520.74082-1-ebiggers@kernel.org>
References: <20220228070520.74082-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

To prevent keys from being compromised if an attacker acquires read
access to kernel memory, some inline encryption hardware can accept keys
which are wrapped by a per-boot hardware-internal key.  This avoids
needing to keep the plaintext keys in kernel memory, without restricting
the number of keys that can be used.  Such keys can be initially
generated either by software (in which case they must be imported to
hardware to be wrapped) or directly by the hardware.  There is also a
mechanism to derive a "software secret" for cryptographic tasks that
can't be handled by inline encryption.

To support this hardware, allow struct blk_crypto_key to represent a
hardware-wrapped key as an alternative to a standard key, and make
drivers set flags in struct blk_crypto_profile to indicate which types
of keys they support.  Also add the derive_sw_secret() low-level
operation, which drivers supporting wrapped keys must implement.

For more information, see the detailed documentation which this patch
adds to Documentation/block/inline-encryption.rst.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/block/inline-encryption.rst | 221 +++++++++++++++++++++-
 block/blk-crypto-fallback.c               |   5 +-
 block/blk-crypto-internal.h               |   1 +
 block/blk-crypto-profile.c                |  44 +++++
 block/blk-crypto.c                        |  45 ++++-
 drivers/md/dm-table.c                     |   1 +
 drivers/mmc/host/cqhci-crypto.c           |   2 +
 drivers/scsi/ufs/ufshcd-crypto.c          |   1 +
 fs/crypto/inline_crypt.c                  |   4 +-
 include/linux/blk-crypto-profile.h        |  26 +++
 include/linux/blk-crypto.h                |  70 ++++++-
 11 files changed, 397 insertions(+), 23 deletions(-)

diff --git a/Documentation/block/inline-encryption.rst b/Documentation/block/inline-encryption.rst
index 4d151fbe20583..5d43ba36634a8 100644
--- a/Documentation/block/inline-encryption.rst
+++ b/Documentation/block/inline-encryption.rst
@@ -77,10 +77,10 @@ Basic design
 ============
 
 We introduce ``struct blk_crypto_key`` to represent an inline encryption key and
-how it will be used.  This includes the actual bytes of the key; the size of the
-key; the algorithm and data unit size the key will be used with; and the number
-of bytes needed to represent the maximum data unit number the key will be used
-with.
+how it will be used.  This includes the type of the key (standard or
+hardware-wrapped); the actual bytes of the key; the size of the key; the
+algorithm and data unit size the key will be used with; and the number of bytes
+needed to represent the maximum data unit number the key will be used with.
 
 We introduce ``struct bio_crypt_ctx`` to represent an encryption context.  It
 contains a data unit number and a pointer to a blk_crypto_key.  We add pointers
@@ -302,3 +302,216 @@ kernel will pretend that the device does not support hardware inline encryption
 When the crypto API fallback is enabled, this means that all bios with and
 encryption context will use the fallback, and IO will complete as usual.  When
 the fallback is disabled, a bio with an encryption context will be failed.
+
+.. _hardware_wrapped_keys:
+
+Hardware-wrapped keys
+=====================
+
+Motivation and threat model
+---------------------------
+
+Linux storage encryption (dm-crypt, fscrypt, eCryptfs, etc.) traditionally
+relies on the raw encryption key(s) being present in kernel memory so that the
+encryption can be performed.  This traditionally isn't seen as a problem because
+the key(s) won't be present during an offline attack, which is the main type of
+attack that storage encryption is intended to protect from.
+
+However, there is an increasing desire to also protect users' data from other
+types of attacks (to the extent possible), including:
+
+- Cold boot attacks, where an attacker with physical access to a system suddenly
+  powers it off, then immediately dumps the system memory to extract recently
+  in-use encryption keys, then uses these keys to decrypt user data on-disk.
+
+- Online attacks where the attacker is able to read kernel memory without fully
+  compromising the system, followed by an offline attack where any extracted
+  keys can be used to decrypt user data on-disk.  An example of such an online
+  attack would be if the attacker is able to run some code on the system that
+  exploits a Meltdown-like vulnerability but is unable to escalate privileges.
+
+- Online attacks where the attacker fully compromises the system, but their data
+  exfiltration is significantly time-limited and/or bandwidth-limited, so in
+  order to completely exfiltrate the data they need to extract the encryption
+  keys to use in a later offline attack.
+
+Hardware-wrapped keys are a feature of inline encryption hardware that is
+designed to protect users' data from the above attacks (to the extent possible),
+without introducing limitations such as a maximum number of keys.
+
+Note that it is impossible to **fully** protect users' data from these attacks.
+Even in the attacks where the attacker "just" gets read access to kernel memory,
+they can still extract any user data that is present in memory, including
+plaintext pagecache pages of encrypted files.  The focus here is just on
+protecting the encryption keys, as those instantly give access to **all** user
+data in any following offline attack, rather than just some of it (where which
+data is included in that "some" might not be controlled by the attacker).
+
+Solution overview
+-----------------
+
+Inline encryption hardware typically has "keyslots" into which software can
+program keys for the hardware to use; the contents of keyslots typically can't
+be read back by software.  As such, the above security goals could be achieved
+if the kernel simply erased its copy of the key(s) after programming them into
+keyslot(s) and thereafter only referred to them via keyslot number.
+
+However, that naive approach runs into the problem that it limits the number of
+unlocked keys to the number of keyslots, which typically is a small number.  In
+cases where there is only one encryption key system-wide (e.g., a full-disk
+encryption key), that can be tolerable.  However, in general there can be many
+logged-in users with many different keys, and/or many running applications with
+application-specific encrypted storage areas.  This is especially true if
+file-based encryption (e.g. fscrypt) is being used.
+
+Thus, it is important for the kernel to still have a way to "remind" the
+hardware about a key, without actually having the raw key itself.  This would
+ensure that the number of hardware keyslots only limits the number of active I/O
+requests, not other things such as the number of logged-in users, the number of
+running apps, or the number of encrypted storage areas that apps can create.
+
+Somewhat less importantly, it is also desirable that the raw keys are never
+visible to software at all, even while being initially unlocked.  This would
+ensure that a read-only compromise of system memory will never allow a key to be
+extracted to be used off-system, even if it occurs when a key is being unlocked.
+
+To solve all these problems, some vendors of inline encryption hardware have
+made their hardware support *hardware-wrapped keys*.  Hardware-wrapped keys
+are encrypted keys that can only be unwrapped (decrypted) and used by hardware
+-- either by the inline encryption hardware itself, or by a dedicated hardware
+block that can directly provision keys to the inline encryption hardware.
+
+(We refer to them as "hardware-wrapped keys" rather than simply "wrapped keys"
+to add some clarity in cases where there could be other types of wrapped keys,
+such as in file-based encryption.  Key wrapping is a commonly used technique.)
+
+The key which wraps (encrypts) hardware-wrapped keys is a hardware-internal key
+that is never exposed to software; it is either a persistent key (a "long-term
+wrapping key") or a per-boot key (an "ephemeral wrapping key").  The long-term
+wrapped form of the key is what is initially unlocked, but it is discarded as
+soon as it is converted into an ephemerally-wrapped key.  In-use
+hardware-wrapped keys are always ephemerally-wrapped, not long-term wrapped.
+
+As inline encryption hardware can only be used to encrypt/decrypt data on-disk,
+the hardware also includes a level of indirection; it doesn't use the unwrapped
+key directly for inline encryption, but rather derives both an inline encryption
+key and a "software secret" from it.  Software can use the "software secret" for
+tasks that can't use the inline encryption hardware, such as filenames
+encryption.  The software secret is not protected from memory compromise.
+
+Key hierarchy
+-------------
+
+Here is the key hierarchy for a hardware-wrapped key::
+
+                       Hardware-wrapped key
+                                |
+                                |
+                          <Hardware KDF>
+                                |
+                  -----------------------------
+                  |                           |
+        Inline encryption key           Software secret
+
+The components are:
+
+- *Hardware-wrapped key*: a key for the hardware's KDF (Key Derivation
+  Function), in ephemerally-wrapped form.  The key wrapping algorithm is a
+  hardware implementation detail that doesn't impact kernel operation, but a
+  strong authenticated encryption algorithm such as AES-256-GCM is recommended.
+
+- *Hardware KDF*: a KDF (Key Derivation Function) which the hardware uses to
+  derive subkeys after unwrapping the wrapped key.  The hardware's choice of KDF
+  doesn't impact kernel operation, but it does need to be known for testing
+  purposes, and it's also assumed to have at least a 256-bit security strength.
+  All known hardware uses the SP800-108 KDF in Counter Mode with AES-256-CMAC,
+  with a particular choice of labels and contexts; new hardware should use this
+  already-vetted KDF.
+
+- *Inline encryption key*: a derived key which the hardware directly provisions
+  to a keyslot of the inline encryption hardware, without exposing it to
+  software.  In all known hardware, this will always be an AES-256-XTS key.
+  However, in principle other encryption algorithms could be supported too.
+  Hardware must derive distinct subkeys for each supported encryption algorithm.
+
+- *Software secret*: a derived key which the hardware returns to software so
+  that software can use it for cryptographic tasks that can't use inline
+  encryption.  This value is cryptographically isolated from the inline
+  encryption key, i.e. knowing one doesn't reveal the other.  (The KDF ensures
+  this.)  Currently, the software secret is always 32 bytes and thus is suitable
+  for cryptographic applications that require up to a 256-bit security strength.
+  Some use cases (e.g. full-disk encryption) won't require the software secret.
+
+Example: in the case of fscrypt, the fscrypt master key (the key used to unlock
+a particular set of encrypted directories) is made hardware-wrapped.  The inline
+encryption key is used as the file contents encryption key, while the software
+secret (rather than the master key directly) is used to key fscrypt's KDF
+(HKDF-SHA512) to derive other subkeys such as filenames encryption keys.
+
+Note that currently this design assumes a single inline encryption key per
+hardware-wrapped key, without any further key derivation.  Thus, in the case of
+fscrypt, currently hardware-wrapped keys are only compatible with the "inline
+encryption optimized" settings, which use one file contents encryption key per
+encryption policy rather than one per file.  This design could be extended to
+make the hardware derive per-file keys using per-file nonces passed down the
+storage stack, and in fact some hardware already supports this; future work is
+planned to remove this limitation by adding the corresponding kernel support.
+
+Kernel support
+--------------
+
+The inline encryption support of the kernel's block layer ("blk-crypto") has
+been extended to support hardware-wrapped keys as an alternative to standard
+keys, when hardware support is available.  This works in the following way:
+
+- A ``key_types_supported`` field is added to the crypto capabilities in
+  ``struct blk_crypto_profile``.  This allows device drivers to declare that
+  they support standard keys, hardware-wrapped keys, or both.
+
+- ``struct blk_crypto_key`` can now contain a hardware-wrapped key as an
+  alternative to a standard key; a ``key_type`` field is added to
+  ``struct blk_crypto_config`` to distinguish between the different key types.
+  This allows users of blk-crypto to en/decrypt data using a hardware-wrapped
+  key in a way very similar to using a standard key.
+
+- A new method ``blk_crypto_ll_ops::derive_sw_secret`` is added.  Device drivers
+  that support hardware-wrapped keys must implement this method.  Users of
+  blk-crypto can call ``blk_crypto_derive_sw_secret()`` to access this method.
+
+- The programming and eviction of hardware-wrapped keys happens via
+  ``blk_crypto_ll_ops::keyslot_program`` and
+  ``blk_crypto_ll_ops::keyslot_evict``, just like it does for standard keys.  If
+  a driver supports hardware-wrapped keys, then it must handle hardware-wrapped
+  keys being passed to these methods.
+
+blk-crypto-fallback doesn't support hardware-wrapped keys.  Therefore,
+hardware-wrapped keys can only be used with actual inline encryption hardware.
+
+Currently, the kernel only works with hardware-wrapped keys in
+ephemerally-wrapped form.  No generic kernel interfaces are provided for
+generating or importing hardware-wrapped keys in the first place, or converting
+them to ephemerally-wrapped form.  In Android, SoC vendors are required to
+support these operations in their KeyMint implementation (a hardware abstraction
+layer in userspace); for details, see the `Android documentation
+<https://source.android.com/security/encryption/hw-wrapped-keys>`_.
+
+Testability
+-----------
+
+Both the hardware KDF and the inline encryption itself are well-defined
+algorithms that don't depend on any secrets other than the unwrapped key.
+Therefore, if the unwrapped key is known to software, these algorithms can be
+reproduced in software in order to verify the ciphertext that is written to disk
+by the inline encryption hardware.
+
+However, the unwrapped key will only be known to software for testing if the
+"import" functionality is used.  Proper testing is not possible in the
+"generate" case where the hardware generates the key itself.  The correct
+operation of the "generate" mode thus relies on the security and correctness of
+the hardware RNG and its use to generate the key, as well as the testing of the
+"import" mode as that should cover all parts other than the key generation.
+
+For an example of a test that verifies the ciphertext written to disk in the
+"import" mode, see the "generic/900" and "generic/901" tests in xfstests, or
+`Android's vts_kernel_encryption_test
+<https://android.googlesource.com/platform/test/vts-testcase/kernel/+/refs/heads/master/encryption/>`_.
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index c87aba8584c64..3bd1f02ddef6b 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -87,7 +87,7 @@ static struct bio_set crypto_bio_split;
  * This is the key we set when evicting a keyslot. This *should* be the all 0's
  * key, but AES-XTS rejects that key, so we use some random bytes instead.
  */
-static u8 blank_key[BLK_CRYPTO_MAX_KEY_SIZE];
+static u8 blank_key[BLK_CRYPTO_MAX_STANDARD_KEY_SIZE];
 
 static void blk_crypto_fallback_evict_keyslot(unsigned int slot)
 {
@@ -539,7 +539,7 @@ static int blk_crypto_fallback_init(void)
 	if (blk_crypto_fallback_inited)
 		return 0;
 
-	prandom_bytes(blank_key, BLK_CRYPTO_MAX_KEY_SIZE);
+	prandom_bytes(blank_key, BLK_CRYPTO_MAX_STANDARD_KEY_SIZE);
 
 	err = bioset_init(&crypto_bio_split, 64, 0, 0);
 	if (err)
@@ -552,6 +552,7 @@ static int blk_crypto_fallback_init(void)
 
 	profile->ll_ops = blk_crypto_fallback_ll_ops;
 	profile->max_dun_bytes_supported = BLK_CRYPTO_MAX_IV_SIZE;
+	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_STANDARD;
 
 	/* All blk-crypto modes have a crypto API fallback. */
 	for (i = 0; i < BLK_ENCRYPTION_MODE_MAX; i++)
diff --git a/block/blk-crypto-internal.h b/block/blk-crypto-internal.h
index 2fb0d65a464ca..d36ae71afed3f 100644
--- a/block/blk-crypto-internal.h
+++ b/block/blk-crypto-internal.h
@@ -13,6 +13,7 @@
 struct blk_crypto_mode {
 	const char *cipher_str; /* crypto API name (for fallback case) */
 	unsigned int keysize; /* key size in bytes */
+	unsigned int security_strength; /* security strength in bytes */
 	unsigned int ivsize; /* iv size in bytes */
 };
 
diff --git a/block/blk-crypto-profile.c b/block/blk-crypto-profile.c
index 96c511967386d..8699d24e6a0d3 100644
--- a/block/blk-crypto-profile.c
+++ b/block/blk-crypto-profile.c
@@ -350,6 +350,8 @@ bool __blk_crypto_cfg_supported(struct blk_crypto_profile *profile,
 		return false;
 	if (profile->max_dun_bytes_supported < cfg->dun_bytes)
 		return false;
+	if (!(profile->key_types_supported & cfg->key_type))
+		return false;
 	return true;
 }
 
@@ -463,6 +465,42 @@ bool blk_crypto_register(struct blk_crypto_profile *profile,
 }
 EXPORT_SYMBOL_GPL(blk_crypto_register);
 
+/**
+ * blk_crypto_derive_sw_secret() - Derive software secret from hardware-wrapped
+ *				   key
+ * @profile: the crypto profile of the device the key will be used on
+ * @wrapped_key: the hardware-wrapped key
+ * @wrapped_key_size: size of @wrapped_key in bytes
+ * @sw_secret: (output) the software secret
+ *
+ * Given a hardware-wrapped key, ask the hardware to derive the secret which
+ * software can use for cryptographic tasks other than inline encryption.  This
+ * secret is guaranteed to be cryptographically isolated from the inline
+ * encryption key, i.e. derived with a different KDF context.
+ *
+ * Return: 0 on success, -EOPNOTSUPP if the given @profile doesn't support
+ *	   hardware-wrapped keys (or is NULL), -EBADMSG if the key isn't a valid
+ *	   hardware-wrapped key, or another -errno code.
+ */
+int blk_crypto_derive_sw_secret(struct blk_crypto_profile *profile,
+				const u8 *wrapped_key,
+				unsigned int wrapped_key_size,
+				u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	int err = -EOPNOTSUPP;
+
+	if (profile &&
+	    (profile->key_types_supported & BLK_CRYPTO_KEY_TYPE_HW_WRAPPED) &&
+	    profile->ll_ops.derive_sw_secret) {
+		blk_crypto_hw_enter(profile);
+		err = profile->ll_ops.derive_sw_secret(profile, wrapped_key,
+						       wrapped_key_size,
+						       sw_secret);
+		blk_crypto_hw_exit(profile);
+	}
+	return err;
+}
+
 /**
  * blk_crypto_intersect_capabilities() - restrict supported crypto capabilities
  *					 by child device
@@ -486,10 +524,12 @@ void blk_crypto_intersect_capabilities(struct blk_crypto_profile *parent,
 			    child->max_dun_bytes_supported);
 		for (i = 0; i < ARRAY_SIZE(child->modes_supported); i++)
 			parent->modes_supported[i] &= child->modes_supported[i];
+		parent->key_types_supported &= child->key_types_supported;
 	} else {
 		parent->max_dun_bytes_supported = 0;
 		memset(parent->modes_supported, 0,
 		       sizeof(parent->modes_supported));
+		parent->key_types_supported = 0;
 	}
 }
 EXPORT_SYMBOL_GPL(blk_crypto_intersect_capabilities);
@@ -522,6 +562,9 @@ bool blk_crypto_has_capabilities(const struct blk_crypto_profile *target,
 	    target->max_dun_bytes_supported)
 		return false;
 
+	if (reference->key_types_supported & ~target->key_types_supported)
+		return false;
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(blk_crypto_has_capabilities);
@@ -556,5 +599,6 @@ void blk_crypto_update_capabilities(struct blk_crypto_profile *dst,
 	       sizeof(dst->modes_supported));
 
 	dst->max_dun_bytes_supported = src->max_dun_bytes_supported;
+	dst->key_types_supported = src->key_types_supported;
 }
 EXPORT_SYMBOL_GPL(blk_crypto_update_capabilities);
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index ec9efeeeca918..ebd9cf12f6547 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -21,16 +21,19 @@ const struct blk_crypto_mode blk_crypto_modes[] = {
 	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
 		.cipher_str = "xts(aes)",
 		.keysize = 64,
+		.security_strength = 32,
 		.ivsize = 16,
 	},
 	[BLK_ENCRYPTION_MODE_AES_128_CBC_ESSIV] = {
 		.cipher_str = "essiv(cbc(aes),sha256)",
 		.keysize = 16,
+		.security_strength = 16,
 		.ivsize = 16,
 	},
 	[BLK_ENCRYPTION_MODE_ADIANTUM] = {
 		.cipher_str = "adiantum(xchacha12,aes)",
 		.keysize = 32,
+		.security_strength = 32,
 		.ivsize = 32,
 	},
 };
@@ -68,7 +71,10 @@ static int __init bio_crypt_ctx_init(void)
 
 	/* Sanity check that no algorithm exceeds the defined limits. */
 	for (i = 0; i < BLK_ENCRYPTION_MODE_MAX; i++) {
-		BUG_ON(blk_crypto_modes[i].keysize > BLK_CRYPTO_MAX_KEY_SIZE);
+		BUG_ON(blk_crypto_modes[i].keysize >
+		       BLK_CRYPTO_MAX_STANDARD_KEY_SIZE);
+		BUG_ON(blk_crypto_modes[i].security_strength >
+		       blk_crypto_modes[i].keysize);
 		BUG_ON(blk_crypto_modes[i].ivsize > BLK_CRYPTO_MAX_IV_SIZE);
 	}
 
@@ -308,8 +314,9 @@ int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
 /**
  * blk_crypto_init_key() - Prepare a key for use with blk-crypto
  * @blk_key: Pointer to the blk_crypto_key to initialize.
- * @raw_key: Pointer to the raw key. Must be the correct length for the chosen
- *	     @crypto_mode; see blk_crypto_modes[].
+ * @raw_key: the raw bytes of the key
+ * @raw_key_size: size of the raw key in bytes
+ * @key_type: type of the key -- either standard or hardware-wrapped
  * @crypto_mode: identifier for the encryption algorithm to use
  * @dun_bytes: number of bytes that will be used to specify the DUN when this
  *	       key is used
@@ -318,7 +325,9 @@ int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
  * Return: 0 on success, -errno on failure.  The caller is responsible for
  *	   zeroizing both blk_key and raw_key when done with them.
  */
-int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
+int blk_crypto_init_key(struct blk_crypto_key *blk_key,
+			const u8 *raw_key, unsigned int raw_key_size,
+			enum blk_crypto_key_type key_type,
 			enum blk_crypto_mode_num crypto_mode,
 			unsigned int dun_bytes,
 			unsigned int data_unit_size)
@@ -331,8 +340,19 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 		return -EINVAL;
 
 	mode = &blk_crypto_modes[crypto_mode];
-	if (mode->keysize == 0)
+	switch (key_type) {
+	case BLK_CRYPTO_KEY_TYPE_STANDARD:
+		if (raw_key_size != mode->keysize)
+			return -EINVAL;
+		break;
+	case BLK_CRYPTO_KEY_TYPE_HW_WRAPPED:
+		if (raw_key_size < mode->security_strength ||
+		    raw_key_size > BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE)
+			return -EINVAL;
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	if (dun_bytes == 0 || dun_bytes > mode->ivsize)
 		return -EINVAL;
@@ -343,9 +363,10 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 	blk_key->crypto_cfg.crypto_mode = crypto_mode;
 	blk_key->crypto_cfg.dun_bytes = dun_bytes;
 	blk_key->crypto_cfg.data_unit_size = data_unit_size;
+	blk_key->crypto_cfg.key_type = key_type;
 	blk_key->data_unit_size_bits = ilog2(data_unit_size);
-	blk_key->size = mode->keysize;
-	memcpy(blk_key->raw, raw_key, mode->keysize);
+	blk_key->size = raw_key_size;
+	memcpy(blk_key->raw, raw_key, raw_key_size);
 
 	return 0;
 }
@@ -358,8 +379,10 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 bool blk_crypto_config_supported(struct request_queue *q,
 				 const struct blk_crypto_config *cfg)
 {
-	return IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
-	       __blk_crypto_cfg_supported(q->crypto_profile, cfg);
+	if (IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) &&
+	    cfg->key_type == BLK_CRYPTO_KEY_TYPE_STANDARD)
+		return true;
+	return __blk_crypto_cfg_supported(q->crypto_profile, cfg);
 }
 
 /**
@@ -382,6 +405,10 @@ int blk_crypto_start_using_key(const struct blk_crypto_key *key,
 {
 	if (__blk_crypto_cfg_supported(q->crypto_profile, &key->crypto_cfg))
 		return 0;
+	if (key->crypto_cfg.key_type != BLK_CRYPTO_KEY_TYPE_STANDARD) {
+		pr_warn_once("tried to use wrapped key, but hardware doesn't support it\n");
+		return -EOPNOTSUPP;
+	}
 	return blk_crypto_fallback_start_using_mode(key->crypto_cfg.crypto_mode);
 }
 
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index e43096cfe9e22..502a36398b1aa 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1297,6 +1297,7 @@ static int dm_table_construct_crypto_profile(struct dm_table *t)
 	profile->max_dun_bytes_supported = UINT_MAX;
 	memset(profile->modes_supported, 0xFF,
 	       sizeof(profile->modes_supported));
+	profile->key_types_supported = ~0;
 
 	for (i = 0; i < dm_table_get_num_targets(t); i++) {
 		ti = dm_table_get_target(t, i);
diff --git a/drivers/mmc/host/cqhci-crypto.c b/drivers/mmc/host/cqhci-crypto.c
index d5f4b6972f63e..6652982410ec5 100644
--- a/drivers/mmc/host/cqhci-crypto.c
+++ b/drivers/mmc/host/cqhci-crypto.c
@@ -210,6 +210,8 @@ int cqhci_crypto_init(struct cqhci_host *cq_host)
 	/* Unfortunately, CQHCI crypto only supports 32 DUN bits. */
 	profile->max_dun_bytes_supported = 4;
 
+	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_STANDARD;
+
 	/*
 	 * Cache all the crypto capabilities and advertise the supported crypto
 	 * modes and data unit sizes to the block layer.
diff --git a/drivers/scsi/ufs/ufshcd-crypto.c b/drivers/scsi/ufs/ufshcd-crypto.c
index 67402baf6faee..0ed82741f9810 100644
--- a/drivers/scsi/ufs/ufshcd-crypto.c
+++ b/drivers/scsi/ufs/ufshcd-crypto.c
@@ -190,6 +190,7 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 	hba->crypto_profile.ll_ops = ufshcd_crypto_ops;
 	/* UFS only supports 8 bytes for any DUN */
 	hba->crypto_profile.max_dun_bytes_supported = 8;
+	hba->crypto_profile.key_types_supported = BLK_CRYPTO_KEY_TYPE_STANDARD;
 	hba->crypto_profile.dev = hba->dev;
 
 	/*
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index c57bebfa48fea..ecb0cda469880 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -105,6 +105,7 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	crypto_cfg.crypto_mode = ci->ci_mode->blk_crypto_mode;
 	crypto_cfg.data_unit_size = sb->s_blocksize;
 	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
+	crypto_cfg.key_type = BLK_CRYPTO_KEY_TYPE_STANDARD;
 	num_devs = fscrypt_get_num_devices(sb);
 	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
 	if (!devs)
@@ -143,7 +144,8 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	blk_key->num_devs = num_devs;
 	fscrypt_get_devices(sb, num_devs, blk_key->devs);
 
-	err = blk_crypto_init_key(&blk_key->base, raw_key, crypto_mode,
+	err = blk_crypto_init_key(&blk_key->base, raw_key, ci->ci_mode->keysize,
+				  BLK_CRYPTO_KEY_TYPE_STANDARD, crypto_mode,
 				  fscrypt_get_dun_bytes(ci), sb->s_blocksize);
 	if (err) {
 		fscrypt_err(inode, "error %d initializing blk-crypto key", err);
diff --git a/include/linux/blk-crypto-profile.h b/include/linux/blk-crypto-profile.h
index bbab65bd54288..706de8c91ec9e 100644
--- a/include/linux/blk-crypto-profile.h
+++ b/include/linux/blk-crypto-profile.h
@@ -57,6 +57,21 @@ struct blk_crypto_ll_ops {
 	int (*keyslot_evict)(struct blk_crypto_profile *profile,
 			     const struct blk_crypto_key *key,
 			     unsigned int slot);
+
+	/**
+	 * @derive_sw_secret: Derive the software secret from a hardware-wrapped
+	 *		      key.
+	 *
+	 * This only needs to be implemented if BLK_CRYPTO_KEY_TYPE_HW_WRAPPED
+	 * is supported.
+	 *
+	 * Must return 0 on success, -EBADMSG if the key is invalid, or another
+	 * -errno code on other errors.
+	 */
+	int (*derive_sw_secret)(struct blk_crypto_profile *profile,
+				const u8 *wrapped_key,
+				unsigned int wrapped_key_size,
+				u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
 };
 
 /**
@@ -84,6 +99,12 @@ struct blk_crypto_profile {
 	 */
 	unsigned int max_dun_bytes_supported;
 
+	/**
+	 * @key_types_supported: Supported types of keys --
+	 * BLK_CRYPTO_KEY_TYPE_STANDARD and/or BLK_CRYPTO_KEY_TYPE_HW_WRAPPED.
+	 */
+	unsigned int key_types_supported;
+
 	/**
 	 * @modes_supported: Array of bitmasks that specifies whether each
 	 * combination of crypto mode and data unit size is supported.
@@ -154,6 +175,11 @@ void blk_crypto_reprogram_all_keys(struct blk_crypto_profile *profile);
 
 void blk_crypto_profile_destroy(struct blk_crypto_profile *profile);
 
+int blk_crypto_derive_sw_secret(struct blk_crypto_profile *profile,
+				const u8 *wrapped_key,
+				unsigned int wrapped_key_size,
+				u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE]);
+
 void blk_crypto_intersect_capabilities(struct blk_crypto_profile *parent,
 				       const struct blk_crypto_profile *child);
 
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 69b24fe92cbf1..3a0b834869207 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -16,7 +16,58 @@ enum blk_crypto_mode_num {
 	BLK_ENCRYPTION_MODE_MAX,
 };
 
-#define BLK_CRYPTO_MAX_KEY_SIZE		64
+/*
+ * Supported types of keys.  Must be bit-flags due to their use in
+ * blk_crypto_profile::key_types_supported.
+ */
+enum blk_crypto_key_type {
+	/*
+	 * Standard keys (i.e. "software keys").  These keys are simply kept in
+	 * raw, plaintext form in kernel memory.
+	 */
+	BLK_CRYPTO_KEY_TYPE_STANDARD = 1 << 0,
+
+	/*
+	 * Hardware-wrapped keys.  These keys are only present in kernel memory
+	 * in ephemerally-wrapped form, and they can only be unwrapped by
+	 * dedicated hardware.  For details, see the "Hardware-wrapped keys"
+	 * section of Documentation/block/inline-encryption.rst.
+	 */
+	BLK_CRYPTO_KEY_TYPE_HW_WRAPPED = 1 << 1,
+};
+
+/*
+ * Currently the maximum standard key size is 64 bytes, as that is the key size
+ * of BLK_ENCRYPTION_MODE_AES_256_XTS which takes the longest key.
+ *
+ * The maximum hardware-wrapped key size depends on the hardware's key wrapping
+ * algorithm, which is a hardware implementation detail, so it isn't precisely
+ * specified.  But currently 128 bytes is plenty in practice.  Implementations
+ * are recommended to wrap a 32-byte key for the hardware KDF with AES-256-GCM,
+ * which should result in a size closer to 64 bytes than 128.
+ *
+ * Both of these values can trivially be increased if ever needed.
+ */
+#define BLK_CRYPTO_MAX_STANDARD_KEY_SIZE	64
+#define BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE	128
+
+/* This should use max(), but max() doesn't work in a struct definition. */
+#define BLK_CRYPTO_MAX_ANY_KEY_SIZE \
+	(BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE > \
+	 BLK_CRYPTO_MAX_STANDARD_KEY_SIZE ? \
+	 BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE : BLK_CRYPTO_MAX_STANDARD_KEY_SIZE)
+
+/*
+ * Size of the "software secret" which can be derived from a hardware-wrapped
+ * key.  This is currently always 32 bytes.  Note, the choice of 32 bytes
+ * assumes that the software secret is only used directly for algorithms that
+ * don't require more than a 256-bit key to get the desired security strength.
+ * If it were to be used e.g. directly as an AES-256-XTS key, then this would
+ * need to be increased (which is possible if hardware supports it, but care
+ * would need to be taken to avoid breaking users who need exactly 32 bytes).
+ */
+#define BLK_CRYPTO_SW_SECRET_SIZE	32
+
 /**
  * struct blk_crypto_config - an inline encryption key's crypto configuration
  * @crypto_mode: encryption algorithm this key is for
@@ -25,20 +76,23 @@ enum blk_crypto_mode_num {
  *	ciphertext.  This is always a power of 2.  It might be e.g. the
  *	filesystem block size or the disk sector size.
  * @dun_bytes: the maximum number of bytes of DUN used when using this key
+ * @key_type: the type of this key -- either standard or hardware-wrapped
  */
 struct blk_crypto_config {
 	enum blk_crypto_mode_num crypto_mode;
 	unsigned int data_unit_size;
 	unsigned int dun_bytes;
+	enum blk_crypto_key_type key_type;
 };
 
 /**
  * struct blk_crypto_key - an inline encryption key
- * @crypto_cfg: the crypto configuration (like crypto_mode, key size) for this
- *		key
+ * @crypto_cfg: the crypto mode, data unit size, key type, and other
+ *		characteristics of this key and how it will be used
  * @data_unit_size_bits: log2 of data_unit_size
- * @size: size of this key in bytes (determined by @crypto_cfg.crypto_mode)
- * @raw: the raw bytes of this key.  Only the first @size bytes are used.
+ * @size: size of this key in bytes.  The size of a standard key is fixed for a
+ *	  given crypto mode, but the size of a hardware-wrapped key can vary.
+ * @raw: the bytes of this key.  Only the first @size bytes are significant.
  *
  * A blk_crypto_key is immutable once created, and many bios can reference it at
  * the same time.  It must not be freed until all bios using it have completed
@@ -48,7 +102,7 @@ struct blk_crypto_key {
 	struct blk_crypto_config crypto_cfg;
 	unsigned int data_unit_size_bits;
 	unsigned int size;
-	u8 raw[BLK_CRYPTO_MAX_KEY_SIZE];
+	u8 raw[BLK_CRYPTO_MAX_ANY_KEY_SIZE];
 };
 
 #define BLK_CRYPTO_MAX_IV_SIZE		32
@@ -89,7 +143,9 @@ bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
 				 unsigned int bytes,
 				 const u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE]);
 
-int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
+int blk_crypto_init_key(struct blk_crypto_key *blk_key,
+			const u8 *raw_key, unsigned int raw_key_size,
+			enum blk_crypto_key_type key_type,
 			enum blk_crypto_mode_num crypto_mode,
 			unsigned int dun_bytes,
 			unsigned int data_unit_size);
-- 
2.35.1


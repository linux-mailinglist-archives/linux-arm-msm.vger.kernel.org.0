Return-Path: <linux-arm-msm+bounces-40137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C769E2A5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 19:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D15116690A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9931F75B7;
	Tue,  3 Dec 2024 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppJOnaei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDD61E868;
	Tue,  3 Dec 2024 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733249182; cv=none; b=FqF2qfkCqjatbCJ/UI82ut1v1HQnX4EpeJ2uV8XQjfXJsuEaDFMUF2ZROuuxRFpPRxQ8WAc94gTaecz0tefWnKTmmIf6W0O+02/sqZlCJB/EEdr/IQd2sxxNAoDD9gTCOSu2E+mZDE5RXw7Mvs274nETKO3pcENq/F/n9rf4O5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733249182; c=relaxed/simple;
	bh=9u8s989myFYKkCTUJP7d/Zm+rUGH/bp1uHDBHysWMoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c4mIyAHjMpFylPQ/rlJPkX5Jcb9CAuSCgZ8PSqQ0QS2W0bbC30J6N0MiBOK7x3jY9ZxkUQydg5T4OYPxskfPY0zcWrW6P3M2ODk8S0XMNfjtMEt/Id7r7CTn/w6PMSsCZeKw1ownl+9p0DT/H4qlf/o2VORtfyaIT3aoAGVb3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppJOnaei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85818C4CECF;
	Tue,  3 Dec 2024 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733249180;
	bh=9u8s989myFYKkCTUJP7d/Zm+rUGH/bp1uHDBHysWMoo=;
	h=From:To:Cc:Subject:Date:From;
	b=ppJOnaei+r0Ur3Iind5aY73YsTNdh2oJW6qhF1Pz16ihSZNj3OzHJjeRlX/CdI0Ja
	 2b9HFOg59PtH+thgmQg7COpAAbQzfseIkG0aTZErLSXtbOka17c07VhGYosvVgQnAL
	 kzTXIoKaZ48l6PTm6Fbjvddx9NShOkYdL+c8YcEWHT94mjKpfwftSKrhzI23txvtpW
	 3bHIgdp1ZLcFmlnApKHMZBoMK2yhrXHtuuccyfkt3x3/HjereugCbLIHK3r6pMp/Rk
	 j6x/OCQfXJXHXlu/33XPp/kYttRqF3ozNU1MgF635O65rG/vT9J33S+cVXIAlRKL9s
	 FG2VrviMb008Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH] crypto: qce - fix priority to be less than ARMv8 CE
Date: Tue,  3 Dec 2024 10:05:53 -0800
Message-ID: <20241203180553.16893-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

As QCE is an order of magnitude slower than the ARMv8 Crypto Extensions
on the CPU, and is also less well tested, give it a lower priority.
Previously the QCE SHA algorithms had higher priority than the ARMv8 CE
equivalents, and the ciphers such as AES-XTS had the same priority which
meant the QCE versions were chosen if they happened to be loaded later.

Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Cc: stable@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/crypto/qce/aead.c     | 2 +-
 drivers/crypto/qce/sha.c      | 2 +-
 drivers/crypto/qce/skcipher.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 7d811728f047..97b56e92ea33 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -784,11 +784,11 @@ static int qce_aead_register_one(const struct qce_aead_def *def, struct qce_devi
 	alg->encrypt			= qce_aead_encrypt;
 	alg->decrypt			= qce_aead_decrypt;
 	alg->init			= qce_aead_init;
 	alg->exit			= qce_aead_exit;
 
-	alg->base.cra_priority		= 300;
+	alg->base.cra_priority		= 275;
 	alg->base.cra_flags		= CRYPTO_ALG_ASYNC |
 					  CRYPTO_ALG_ALLOCATES_MEMORY |
 					  CRYPTO_ALG_KERN_DRIVER_ONLY |
 					  CRYPTO_ALG_NEED_FALLBACK;
 	alg->base.cra_ctxsize		= sizeof(struct qce_aead_ctx);
diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index fc72af8aa9a7..71b748183cfa 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -480,11 +480,11 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 	else if (IS_SHA256(def->flags))
 		tmpl->hash_zero = sha256_zero_message_hash;
 
 	base = &alg->halg.base;
 	base->cra_blocksize = def->blocksize;
-	base->cra_priority = 300;
+	base->cra_priority = 175;
 	base->cra_flags = CRYPTO_ALG_ASYNC | CRYPTO_ALG_KERN_DRIVER_ONLY;
 	base->cra_ctxsize = sizeof(struct qce_sha_ctx);
 	base->cra_alignmask = 0;
 	base->cra_module = THIS_MODULE;
 	base->cra_init = qce_ahash_cra_init;
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 5b493fdc1e74..ffb334eb5b34 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -459,11 +459,11 @@ static int qce_skcipher_register_one(const struct qce_skcipher_def *def,
 					  IS_DES(def->flags) ? qce_des_setkey :
 					  qce_skcipher_setkey;
 	alg->encrypt			= qce_skcipher_encrypt;
 	alg->decrypt			= qce_skcipher_decrypt;
 
-	alg->base.cra_priority		= 300;
+	alg->base.cra_priority		= 275;
 	alg->base.cra_flags		= CRYPTO_ALG_ASYNC |
 					  CRYPTO_ALG_ALLOCATES_MEMORY |
 					  CRYPTO_ALG_KERN_DRIVER_ONLY;
 	alg->base.cra_ctxsize		= sizeof(struct qce_cipher_ctx);
 	alg->base.cra_alignmask		= 0;

base-commit: ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1
-- 
2.47.1



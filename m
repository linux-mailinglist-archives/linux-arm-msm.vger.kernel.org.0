Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A615363051
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 15:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236367AbhDQNZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 09:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236409AbhDQNZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 09:25:39 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B538BC061345
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 06:25:10 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id d23so19623919qko.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Apr 2021 06:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=proDyJ1d4U1x+ZlVCt1OCcGSvzjB64tpyUmpUkmwqNM=;
        b=lOhQSIyz3ir6kmtq7oRgdosSmW4n5rGlRH9UJzQw0Yf7XfCB+3gXiME9dAFp9TlmbP
         TfacheMQhR40IzTZ7NNRsMpxWIDjn+79N7O0P+UAwGz9c2OD495vg+x/ZPppuLRlDPCT
         wkNPhC1Ikv4otU3SRkcFnChP2h9X8TcRkK05QkcKdIcYAimdUi3HUT5WbnbKCkmGDPPd
         hIAx8QatAR99mu9OOFvqrgdA+uu9ryqtHRh1uKasClMfqSespg5C5zFvgtibxU0WAlMb
         KUjwUSqFBQEiucFW02Rx7OeEx+H29y2KBEMiFv3fytpC8u2YxQe9zADaWdnQQuJzyb4C
         UzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=proDyJ1d4U1x+ZlVCt1OCcGSvzjB64tpyUmpUkmwqNM=;
        b=cGEwVB1a/T0EQnxJUddnecbsIOQO2iu8+GIyfU+aA9UR1dMqPEk8pXyM0vK8FuYsz+
         4HZTnDGr8Ye5kko+iFj1smia+rX1F8X9/JKmvxSW/IyW+lLHLBUTgL5Ow8MacHuPtt65
         gK8guVbpYgXAeV8FDbXzCtDIvJaJWhjnhvDxC2Udxx0d5JpJDSLh8YG4jluMNzyaiwRb
         JnE3g7EAnXoMAi77ytqJz41IhjVKrcAVdSplC5rsXWqZbjmIM0XqcjXB0d0t50/ab6R/
         hpVFbUKqr1Od/dF4ZAKBwcJAFqfER3A7YLly+TlUIYIdjoq/ob2hJwrbZ9RalxaYQn1w
         9B6w==
X-Gm-Message-State: AOAM531Ie8bB9qgirjHzWTCVBZaAOcnNkNu8/3DelnwazOcCql/rlKlC
        /iBc5anPuavVLf/0zPSjrXd+Cw==
X-Google-Smtp-Source: ABdhPJyM/emEAzy8TcK58ch/3POeIae1hSY3Mfi/RveIF/Zbe47ylhQlZCI0dMZtW8nuAhvX197mGQ==
X-Received: by 2002:a05:620a:e16:: with SMTP id y22mr4005558qkm.310.1618665909944;
        Sat, 17 Apr 2021 06:25:09 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id o25sm1988327qtl.37.2021.04.17.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:25:09 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v2 6/7] crypto: qce: common: Add support for AEAD algorithms
Date:   Sat, 17 Apr 2021 09:25:02 -0400
Message-Id: <20210417132503.1401128-7-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210417132503.1401128-1-thara.gopinath@linaro.org>
References: <20210417132503.1401128-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add register programming sequence for enabling AEAD
algorithms on the Qualcomm crypto engine.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---

v1->v2:
	- Minor fixes like removing not needed initializing of variables
	  and using bool values in lieu of 0 and 1 as pointed out by Bjorn.
	- Introduced qce_be32_to_cpu_array which converts the u8 string in big
	  endian order to array of u32 and returns back total number of words,
	  as per Bjorn's review comments. Presently this function is used only by
	  qce_setup_regs_aead to format keys, iv and nonce. cipher and hash 
	  algorithms can be made to use this function as a separate clean up patch.

 drivers/crypto/qce/common.c | 164 +++++++++++++++++++++++++++++++++++-
 1 file changed, 162 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 7b3d6caec1b2..ffbf866842a3 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -15,6 +15,16 @@
 #include "core.h"
 #include "regs-v5.h"
 #include "sha.h"
+#include "aead.h"
+
+static const u32 std_iv_sha1[SHA256_DIGEST_SIZE / sizeof(u32)] = {
+	SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4, 0, 0, 0
+};
+
+static const u32 std_iv_sha256[SHA256_DIGEST_SIZE / sizeof(u32)] = {
+	SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
+	SHA256_H4, SHA256_H5, SHA256_H6, SHA256_H7
+};
 
 static inline u32 qce_read(struct qce_device *qce, u32 offset)
 {
@@ -76,6 +86,21 @@ void qce_cpu_to_be32p_array(__be32 *dst, const u8 *src, unsigned int len)
 	}
 }
 
+static unsigned int qce_be32_to_cpu_array(u32 *dst, const u8 *src, unsigned int len)
+{
+	__be32 *d = (__be32 *)dst;
+	const u8 *s = src;
+	unsigned int n;
+
+	n = len / sizeof(u32);
+	for (; n > 0; n--) {
+		*d = cpu_to_be32p((const __u32 *)s);
+		s += sizeof(u32);
+		d++;
+	}
+	return DIV_ROUND_UP(len, sizeof(u32));
+}
+
 static void qce_setup_config(struct qce_device *qce)
 {
 	u32 config;
@@ -96,7 +121,7 @@ static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
 		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
 }
 
-#ifdef CONFIG_CRYPTO_DEV_QCE_SHA
+#if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
 static u32 qce_auth_cfg(unsigned long flags, u32 key_size, u32 auth_size)
 {
 	u32 cfg = 0;
@@ -139,7 +164,9 @@ static u32 qce_auth_cfg(unsigned long flags, u32 key_size, u32 auth_size)
 
 	return cfg;
 }
+#endif
 
+#ifdef CONFIG_CRYPTO_DEV_QCE_SHA
 static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 {
 	struct ahash_request *req = ahash_request_cast(async_req);
@@ -225,7 +252,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
 }
 #endif
 
-#ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
+#if defined(CONFIG_CRYPTO_DEV_QCE_SKCIPHER) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
 static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
 {
 	u32 cfg = 0;
@@ -271,7 +298,9 @@ static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
 
 	return cfg;
 }
+#endif
 
+#ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
 static void qce_xts_swapiv(__be32 *dst, const u8 *src, unsigned int ivsize)
 {
 	u8 swap[QCE_AES_IV_LENGTH];
@@ -386,6 +415,133 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
 }
 #endif
 
+#ifdef CONFIG_CRYPTO_DEV_QCE_AEAD
+static int qce_setup_regs_aead(struct crypto_async_request *async_req)
+{
+	struct aead_request *req = aead_request_cast(async_req);
+	struct qce_aead_reqctx *rctx = aead_request_ctx(req);
+	struct qce_aead_ctx *ctx = crypto_tfm_ctx(async_req->tfm);
+	struct qce_alg_template *tmpl = to_aead_tmpl(crypto_aead_reqtfm(req));
+	struct qce_device *qce = tmpl->qce;
+	u32 enckey[QCE_MAX_CIPHER_KEY_SIZE / sizeof(u32)] = {0};
+	u32 enciv[QCE_MAX_IV_SIZE / sizeof(u32)] = {0};
+	u32 authkey[QCE_SHA_HMAC_KEY_SIZE / sizeof(u32)] = {0};
+	u32 authiv[SHA256_DIGEST_SIZE / sizeof(u32)] = {0};
+	u32 authnonce[QCE_MAX_NONCE / sizeof(u32)] = {0};
+	unsigned int enc_keylen = ctx->enc_keylen;
+	unsigned int auth_keylen = ctx->auth_keylen;
+	unsigned int enc_ivsize = rctx->ivsize;
+	unsigned int auth_ivsize;
+	unsigned int enckey_words, enciv_words;
+	unsigned int authkey_words, authiv_words, authnonce_words;
+	unsigned long flags = rctx->flags;
+	u32 encr_cfg, auth_cfg, config, totallen;
+	u32 *iv_last_word;
+
+	qce_setup_config(qce);
+
+	/* Write encryption key */
+	enckey_words = qce_be32_to_cpu_array(enckey, ctx->enc_key, enc_keylen);
+	qce_write_array(qce, REG_ENCR_KEY0, (u32 *)enckey, enckey_words);
+
+	/* Write encryption iv */
+	enciv_words = qce_be32_to_cpu_array(enciv, rctx->iv, enc_ivsize);
+	qce_write_array(qce, REG_CNTR0_IV0, (u32 *)enciv, enciv_words);
+
+	if (IS_CCM(rctx->flags)) {
+		iv_last_word = (u32 *)&enciv[enciv_words - 1];
+		qce_write(qce, REG_CNTR3_IV3, (*iv_last_word) + 1);
+		qce_write_array(qce, REG_ENCR_CCM_INT_CNTR0, (u32 *)enciv, enciv_words);
+		qce_write(qce, REG_CNTR_MASK, ~0);
+		qce_write(qce, REG_CNTR_MASK0, ~0);
+		qce_write(qce, REG_CNTR_MASK1, ~0);
+		qce_write(qce, REG_CNTR_MASK2, ~0);
+	}
+
+	/* Clear authentication IV and KEY registers of previous values */
+	qce_clear_array(qce, REG_AUTH_IV0, 16);
+	qce_clear_array(qce, REG_AUTH_KEY0, 16);
+
+	/* Clear byte count */
+	qce_clear_array(qce, REG_AUTH_BYTECNT0, 4);
+
+	/* Write authentication key */
+	authkey_words = qce_be32_to_cpu_array(authkey, ctx->auth_key, auth_keylen);
+	qce_write_array(qce, REG_AUTH_KEY0, (u32 *)authkey, authkey_words);
+
+	/* Write initial authentication IV only for HMAC algorithms */
+	if (IS_SHA_HMAC(rctx->flags)) {
+		/* Write default authentication iv */
+		if (IS_SHA1_HMAC(rctx->flags)) {
+			auth_ivsize = SHA1_DIGEST_SIZE;
+			memcpy(authiv, std_iv_sha1, auth_ivsize);
+		} else if (IS_SHA256_HMAC(rctx->flags)) {
+			auth_ivsize = SHA256_DIGEST_SIZE;
+			memcpy(authiv, std_iv_sha256, auth_ivsize);
+		}
+		authiv_words = auth_ivsize / sizeof(u32);
+		qce_write_array(qce, REG_AUTH_IV0, (u32 *)authiv, authiv_words);
+	}
+
+	/* Write nonce for CCM algorithms */
+	if (IS_CCM(rctx->flags)) {
+		authnonce_words = qce_be32_to_cpu_array(authnonce, rctx->ccm_nonce, QCE_MAX_NONCE);
+		qce_write_array(qce, REG_AUTH_INFO_NONCE0, (u32 *)authnonce, authnonce_words);
+	}
+
+	/* Set up ENCR_SEG_CFG */
+	encr_cfg = qce_encr_cfg(flags, enc_keylen);
+	if (IS_ENCRYPT(flags))
+		encr_cfg |= BIT(ENCODE_SHIFT);
+	qce_write(qce, REG_ENCR_SEG_CFG, encr_cfg);
+
+	/* Set up AUTH_SEG_CFG */
+	auth_cfg = qce_auth_cfg(rctx->flags, auth_keylen, ctx->authsize);
+	auth_cfg |= BIT(AUTH_LAST_SHIFT);
+	auth_cfg |= BIT(AUTH_FIRST_SHIFT);
+	if (IS_ENCRYPT(flags)) {
+		if (IS_CCM(rctx->flags))
+			auth_cfg |= AUTH_POS_BEFORE << AUTH_POS_SHIFT;
+		else
+			auth_cfg |= AUTH_POS_AFTER << AUTH_POS_SHIFT;
+	} else {
+		if (IS_CCM(rctx->flags))
+			auth_cfg |= AUTH_POS_AFTER << AUTH_POS_SHIFT;
+		else
+			auth_cfg |= AUTH_POS_BEFORE << AUTH_POS_SHIFT;
+	}
+	qce_write(qce, REG_AUTH_SEG_CFG, auth_cfg);
+
+	totallen = rctx->cryptlen + rctx->assoclen;
+
+	/* Set the encryption size and start offset */
+	if (IS_CCM(rctx->flags) && IS_DECRYPT(rctx->flags))
+		qce_write(qce, REG_ENCR_SEG_SIZE, rctx->cryptlen + ctx->authsize);
+	else
+		qce_write(qce, REG_ENCR_SEG_SIZE, rctx->cryptlen);
+	qce_write(qce, REG_ENCR_SEG_START, rctx->assoclen & 0xffff);
+
+	/* Set the authentication size and start offset */
+	qce_write(qce, REG_AUTH_SEG_SIZE, totallen);
+	qce_write(qce, REG_AUTH_SEG_START, 0);
+
+	/* Write total length */
+	if (IS_CCM(rctx->flags) && IS_DECRYPT(rctx->flags))
+		qce_write(qce, REG_SEG_SIZE, totallen + ctx->authsize);
+	else
+		qce_write(qce, REG_SEG_SIZE, totallen);
+
+	/* get little endianness */
+	config = qce_config_reg(qce, 1);
+	qce_write(qce, REG_CONFIG, config);
+
+	/* Start the process */
+	qce_crypto_go(qce, !IS_CCM(flags));
+
+	return 0;
+}
+#endif
+
 int qce_start(struct crypto_async_request *async_req, u32 type)
 {
 	switch (type) {
@@ -396,6 +552,10 @@ int qce_start(struct crypto_async_request *async_req, u32 type)
 #ifdef CONFIG_CRYPTO_DEV_QCE_SHA
 	case CRYPTO_ALG_TYPE_AHASH:
 		return qce_setup_regs_ahash(async_req);
+#endif
+#ifdef CONFIG_CRYPTO_DEV_QCE_AEAD
+	case CRYPTO_ALG_TYPE_AEAD:
+		return qce_setup_regs_aead(async_req);
 #endif
 	default:
 		return -EINVAL;
-- 
2.25.1


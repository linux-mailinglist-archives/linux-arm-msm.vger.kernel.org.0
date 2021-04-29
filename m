Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFFDD36ED16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240611AbhD2PI2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 11:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240706AbhD2PIE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 11:08:04 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2A6C061342
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:17 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id v20so12583467qkv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EAJclNu5gCfIMzIcfLRFLOY6aPCs84wagw7Ng4g4WPE=;
        b=aHldvDBxe0q18B3BPRssa004Y8f+LA+eNfmC343d8B7v9zweaJYeO3v5lbbcpxpFdD
         zxUVgiedCqBuWpYmo5ozuMTYfZtT8ncqy22fRs/ZNXYLu1597O4A8yp7X/ZuLePuZjYD
         5RG6bm27Y1Gk8N5BjYq10sJVVNBnY46UzPkTepRGwdEuROlMnN6vRYk1unGfegeDh0SR
         OpNPfeyWRwzTui61dDupg6K+10Z0FeVqiVON/PUXYusIaytQmg3LhtVrtP9YEZWbxf5P
         lauDMl6M8Gw635e0e4Iuwp/8LaXwJvv77OOLVOqi2yEOIy1wM0PPghGbNv1Hmd3P0d8W
         vmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EAJclNu5gCfIMzIcfLRFLOY6aPCs84wagw7Ng4g4WPE=;
        b=Z2zF67tKbgbFyVVZ9vN9UB+nzM1zHd9Od2ibngfnQIwcsWhhbtpvIheAG12ADyfzMx
         Ko1oBoSQbF4Xrh0mVK5hhX0L140XLcL48T8ZPSul/N83xtKuYNmFcVGrPBPSi4RQdzbI
         xWZJ2YJrYHvxA0njIBkF2cbKEteO5yKOEunMUswdTkwZ40LdEGpKMbZbb9+RSnP3kcjg
         gB1HHJA6HJZtijPE5n4PGv3m509UHwd6qFdt09JGu4/UCyJzEWV+V/3mA0VwaKh+slA5
         /KFtNrQqbr+ec+czRvCRB4pWA5+R62loPB4kwm0cbuPIuSA0GcWJwbcOfUOrWZqno5qy
         OCdg==
X-Gm-Message-State: AOAM530S1xD8gmjnEoaRlz4tdWlxvoHJ2Uy2iOUZvJriW0EVJ9O1kzt0
        a7XWDbu5y7z+4JC4bOcJeUw+6Q==
X-Google-Smtp-Source: ABdhPJynTvhxR+rkdsECq11IqLL5FpLJSpryGxpvw+9lu+AtYYUuQ7KCw1ybLe4ADcT+GRZFglj2Qg==
X-Received: by 2002:a37:f509:: with SMTP id l9mr129609qkk.172.1619708836520;
        Thu, 29 Apr 2021 08:07:16 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id j191sm2223822qke.131.2021.04.29.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:07:15 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v4 7/7] crypto: qce: aead: Schedule fallback algorithm
Date:   Thu, 29 Apr 2021 11:07:07 -0400
Message-Id: <20210429150707.3168383-8-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429150707.3168383-1-thara.gopinath@linaro.org>
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm crypto engine does not handle the following scenarios and
will issue an abort. In such cases, pass on the transformation to
a fallback algorithm.

- DES3 algorithms with all three keys same.
- AES192 algorithms.
- 0 length messages.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/crypto/qce/aead.c | 64 ++++++++++++++++++++++++++++++++-------
 drivers/crypto/qce/aead.h |  3 ++
 2 files changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index ef66ae21eae3..6d06a19b48e4 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -512,7 +512,23 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	/* CE does not handle 0 length messages */
 	if (!rctx->cryptlen) {
 		if (!(IS_CCM(rctx->flags) && IS_DECRYPT(rctx->flags)))
-			return -EINVAL;
+			ctx->need_fallback = true;
+	}
+
+	/* If fallback is needed, schedule and exit */
+	if (ctx->need_fallback) {
+		/* Reset need_fallback in case the same ctx is used for another transaction */
+		ctx->need_fallback = false;
+
+		aead_request_set_tfm(&rctx->fallback_req, ctx->fallback);
+		aead_request_set_callback(&rctx->fallback_req, req->base.flags,
+					  req->base.complete, req->base.data);
+		aead_request_set_crypt(&rctx->fallback_req, req->src,
+				       req->dst, req->cryptlen, req->iv);
+		aead_request_set_ad(&rctx->fallback_req, req->assoclen);
+
+		return encrypt ? crypto_aead_encrypt(&rctx->fallback_req) :
+				 crypto_aead_decrypt(&rctx->fallback_req);
 	}
 
 	/*
@@ -553,7 +569,7 @@ static int qce_aead_ccm_setkey(struct crypto_aead *tfm, const u8 *key,
 		memcpy(ctx->ccm4309_salt, key + keylen, QCE_CCM4309_SALT_SIZE);
 	}
 
-	if (keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256)
+	if (keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256 && keylen != AES_KEYSIZE_192)
 		return -EINVAL;
 
 	ctx->enc_keylen = keylen;
@@ -562,7 +578,12 @@ static int qce_aead_ccm_setkey(struct crypto_aead *tfm, const u8 *key,
 	memcpy(ctx->enc_key, key, keylen);
 	memcpy(ctx->auth_key, key, keylen);
 
-	return 0;
+	if (keylen == AES_KEYSIZE_192)
+		ctx->need_fallback = true;
+
+	return IS_CCM_RFC4309(flags) ?
+		crypto_aead_setkey(ctx->fallback, key, keylen + QCE_CCM4309_SALT_SIZE) :
+		crypto_aead_setkey(ctx->fallback, key, keylen);
 }
 
 static int qce_aead_setkey(struct crypto_aead *tfm, const u8 *key, unsigned int keylen)
@@ -593,20 +614,21 @@ static int qce_aead_setkey(struct crypto_aead *tfm, const u8 *key, unsigned int
 		 * The crypto engine does not support any two keys
 		 * being the same for triple des algorithms. The
 		 * verify_skcipher_des3_key does not check for all the
-		 * below conditions. Return -EINVAL in case any two keys
-		 * are the same. Revisit to see if a fallback cipher
-		 * is needed to handle this condition.
+		 * below conditions. Schedule fallback in this case.
 		 */
 		memcpy(_key, authenc_keys.enckey, DES3_EDE_KEY_SIZE);
 		if (!((_key[0] ^ _key[2]) | (_key[1] ^ _key[3])) ||
 		    !((_key[2] ^ _key[4]) | (_key[3] ^ _key[5])) ||
 		    !((_key[0] ^ _key[4]) | (_key[1] ^ _key[5])))
-			return -EINVAL;
+			ctx->need_fallback = true;
 	} else if (IS_AES(flags)) {
 		/* No random key sizes */
 		if (authenc_keys.enckeylen != AES_KEYSIZE_128 &&
+		    authenc_keys.enckeylen != AES_KEYSIZE_192 &&
 		    authenc_keys.enckeylen != AES_KEYSIZE_256)
 			return -EINVAL;
+		if (authenc_keys.enckeylen == AES_KEYSIZE_192)
+			ctx->need_fallback = true;
 	}
 
 	ctx->enc_keylen = authenc_keys.enckeylen;
@@ -617,7 +639,7 @@ static int qce_aead_setkey(struct crypto_aead *tfm, const u8 *key, unsigned int
 	memset(ctx->auth_key, 0, sizeof(ctx->auth_key));
 	memcpy(ctx->auth_key, authenc_keys.authkey, authenc_keys.authkeylen);
 
-	return 0;
+	return crypto_aead_setkey(ctx->fallback, key, keylen);
 }
 
 static int qce_aead_setauthsize(struct crypto_aead *tfm, unsigned int authsize)
@@ -632,15 +654,33 @@ static int qce_aead_setauthsize(struct crypto_aead *tfm, unsigned int authsize)
 			return -EINVAL;
 	}
 	ctx->authsize = authsize;
-	return 0;
+
+	return crypto_aead_setauthsize(ctx->fallback, authsize);
 }
 
 static int qce_aead_init(struct crypto_aead *tfm)
 {
-	crypto_aead_set_reqsize(tfm, sizeof(struct qce_aead_reqctx));
+	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
+
+	ctx->need_fallback = false;
+	ctx->fallback = crypto_alloc_aead(crypto_tfm_alg_name(&tfm->base),
+					  0, CRYPTO_ALG_NEED_FALLBACK);
+
+	if (IS_ERR(ctx->fallback))
+		return PTR_ERR(ctx->fallback);
+
+	crypto_aead_set_reqsize(tfm, sizeof(struct qce_aead_reqctx) +
+				crypto_aead_reqsize(ctx->fallback));
 	return 0;
 }
 
+static void qce_aead_exit(struct crypto_aead *tfm)
+{
+	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
+
+	crypto_free_aead(ctx->fallback);
+}
+
 struct qce_aead_def {
 	unsigned long flags;
 	const char *name;
@@ -738,11 +778,13 @@ static int qce_aead_register_one(const struct qce_aead_def *def, struct qce_devi
 	alg->encrypt			= qce_aead_encrypt;
 	alg->decrypt			= qce_aead_decrypt;
 	alg->init			= qce_aead_init;
+	alg->exit			= qce_aead_exit;
 
 	alg->base.cra_priority		= 300;
 	alg->base.cra_flags		= CRYPTO_ALG_ASYNC |
 					  CRYPTO_ALG_ALLOCATES_MEMORY |
-					  CRYPTO_ALG_KERN_DRIVER_ONLY;
+					  CRYPTO_ALG_KERN_DRIVER_ONLY |
+					  CRYPTO_ALG_NEED_FALLBACK;
 	alg->base.cra_ctxsize		= sizeof(struct qce_aead_ctx);
 	alg->base.cra_alignmask		= 0;
 	alg->base.cra_module		= THIS_MODULE;
diff --git a/drivers/crypto/qce/aead.h b/drivers/crypto/qce/aead.h
index 3d1f2039930b..efb8477cc088 100644
--- a/drivers/crypto/qce/aead.h
+++ b/drivers/crypto/qce/aead.h
@@ -19,6 +19,8 @@ struct qce_aead_ctx {
 	unsigned int enc_keylen;
 	unsigned int auth_keylen;
 	unsigned int authsize;
+	bool need_fallback;
+	struct crypto_aead *fallback;
 };
 
 struct qce_aead_reqctx {
@@ -39,6 +41,7 @@ struct qce_aead_reqctx {
 	u8 ccm_nonce[QCE_MAX_NONCE];
 	u8 ccmresult_buf[QCE_BAM_BURST_SIZE];
 	u8 ccm_rfc4309_iv[QCE_MAX_IV_SIZE];
+	struct aead_request fallback_req;
 };
 
 static inline struct qce_alg_template *to_aead_tmpl(struct crypto_aead *tfm)
-- 
2.25.1


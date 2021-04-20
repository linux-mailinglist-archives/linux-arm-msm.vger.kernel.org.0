Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0749C3650F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 05:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbhDTDgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 23:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbhDTDgm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 23:36:42 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B8EC061763
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 20:36:10 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id f12so27801699qtf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Apr 2021 20:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4IeWKJ2VDXK23aQDGRH5P3zYP432uQGXjnd/HYomCQ=;
        b=oCNpE8vWA3unLVA2xBYGfiYGYkprrFk/Xd/91oJYCny1crHxY4x41gPeWWHWoaic+n
         a5VoqMGo944HPC+8ZtlxLMbf/UKFqtLOmjMqp8R1narVUVaFJb8JTRKqc0wcIdfeAwwA
         nFM8xeamd9/LX46Cr+3VQN0ePFXY8D3vsVkxNc2PkZt6RmRUIBAERsGWYSCW0Y0Wb8WX
         UGL4BefG8ZS8KkCLcf1dE68vPQxwRmTExStJq7y4fUPER/woUMdFH+rUpTGOXEwJNRG/
         WFtZl1QwM/W1dWOvZ75gw6OwHO+Rz5TXAeXVSR5pfp30YNdEgJAAUnCpk7NK6iiFWmxy
         ifBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4IeWKJ2VDXK23aQDGRH5P3zYP432uQGXjnd/HYomCQ=;
        b=kt1xzuVpsaXTstNABhOvs2hCYNb+rIsRNZ7UnH0GkKVQ2SaLUVb0IqcEnT9UMoibMo
         rZiGeXv6pEB0nOgfNsHiVH0KsGhc3VMGw6A6gkadYvGy5bp2j3jGeocvU5j0lR6AGAku
         Gs2ZnGz8bQz4/VQ2u6jt+wq3e/avCG/Kdw7VEyOnKrGVAnZBbxnwv32SA7cjx36vaONt
         HWqIHf/Kq+NBI7BgZ/C+guXjrc9wZQJF2cU8ES5JEBD5debQtsvdqWmNVKfqW+u/CPxL
         uCz/eiAHYrURrC+U8lPRFzjo0jw37/JOQ12MAjtpamK6Ty2+wskrlhCXoPkk4tUXzkTg
         JhkA==
X-Gm-Message-State: AOAM533+eTzNXjSVaUhgAh2x8bT6njTtdVs7VM4jaFS9NryKnmNKO1fL
        mkyC53S/r6bPy3mgkcr22GmrIA==
X-Google-Smtp-Source: ABdhPJzDC4v5+3rpzeu40KKQBCwgkQAFGsjMJtGiEMrEiRb2NFq0pyRt13rnAnE4MTfulfeANd7FqA==
X-Received: by 2002:ac8:7157:: with SMTP id h23mr15349305qtp.246.1618889769364;
        Mon, 19 Apr 2021 20:36:09 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id b8sm3562643qka.117.2021.04.19.20.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 20:36:08 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     herbert@gondor.apana.org.au, davem@davemloft.net,
        bjorn.andersson@linaro.org
Cc:     ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [Patch v3 7/7] crypto: qce: aead: Schedule fallback algorithm
Date:   Mon, 19 Apr 2021 23:36:02 -0400
Message-Id: <20210420033602.1729947-8-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420033602.1729947-1-thara.gopinath@linaro.org>
References: <20210420033602.1729947-1-thara.gopinath@linaro.org>
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

v1->v2:
	- Updated crypto_aead_set_reqsize to include the size of fallback
	  request as well.

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


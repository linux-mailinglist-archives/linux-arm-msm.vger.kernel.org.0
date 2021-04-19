Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760E33639B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 05:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237395AbhDSDRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Apr 2021 23:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbhDSDRc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Apr 2021 23:17:32 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E38C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 20:17:00 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id i25-20020a4aa1190000b02901bbd9429832so7457359ool.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 20:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/7XicklAF0cmE7VVaBTBXRLlcMh5x5tVGOb9HOZXcV8=;
        b=LWWxRKd3Brj04zJlfXKHlAzXtXasS5FrWwBrXg9OMK1xpPHTZWPzvhakcxidyvvRbx
         1jz2uxv23Hg2YBiwqEBTr+JryJDcFtCbpF+jU+HsBAF9CMz6uLe0lzjyaUQWkAicO+JO
         SD414zDu25cCLZeu15RWn0kdrIH7zEjFmx3wfy/YV+gLsqrhozDKiHZECo1/vLfd392T
         sfJZ/EuPKR1iYZSk3AfeYx2wr9t79fFAOCqksp0jJfiwnZUQA/akEZrFDUoPnlgQsD0V
         laCRs+AP46EOwgzgjQjLJdi4k96kmaMbVW03XagUVafeFWiO/4Cr3Ok50bPIdpz6bxbn
         RVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/7XicklAF0cmE7VVaBTBXRLlcMh5x5tVGOb9HOZXcV8=;
        b=NXPW7AR7g5RK7RVJamC5EYBuIQkjajF6Ua9hrWSpOmkqlG7aqexkysmT53xMt9KJqX
         JjJFhF4OBfzgesgzOHyJrzyHkIFscgihKNiHLuCWkpWR0L26T36+byfVb4AowHCb45PY
         YkZum0Tn+fmHZVqP91VDGjaLeed4sPOjQ0zz/Lj40gVXioS0TqhFspr8iA8XuOnxIRQU
         +V5wfELMX3933HSVD+YmN6Gy/VSaW+NcojJGw5LB77E0DEKRVZeKz4Wqu9Ll61reNiMD
         chc2VxLEv1oRv+28XDHlSOUrh3TOL5aeL/cYlPu922LNvEcLw/jzrGggi1TH1jPhbx1w
         l5pw==
X-Gm-Message-State: AOAM533H/2VHBLhm/iTmGvKiL+181qgSZnFB6MF9injIcWyigqzKUO0F
        03KG4yPdpqO3niNbOq0yIpzSBQ==
X-Google-Smtp-Source: ABdhPJxeS5hBR588CLPR75dPkLL5TvDO1UdVrTccIg+3f4biqs3qzc8MDCtidNdYpQyYxF2/IbPScw==
X-Received: by 2002:a4a:a341:: with SMTP id u1mr11792307ool.81.1618802219506;
        Sun, 18 Apr 2021 20:16:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b26sm3158084otf.66.2021.04.18.20.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 20:16:59 -0700 (PDT)
Date:   Sun, 18 Apr 2021 22:16:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     herbert@gondor.apana.org.au, davem@davemloft.net,
        ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [Patch v2 6/7] crypto: qce: common: Add support for AEAD
 algorithms
Message-ID: <20210419031656.GK1538589@yoga>
References: <20210417132503.1401128-1-thara.gopinath@linaro.org>
 <20210417132503.1401128-7-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417132503.1401128-7-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Apr 08:25 CDT 2021, Thara Gopinath wrote:

> Add register programming sequence for enabling AEAD
> algorithms on the Qualcomm crypto engine.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
> 
> v1->v2:
> 	- Minor fixes like removing not needed initializing of variables
> 	  and using bool values in lieu of 0 and 1 as pointed out by Bjorn.
> 	- Introduced qce_be32_to_cpu_array which converts the u8 string in big
> 	  endian order to array of u32 and returns back total number of words,
> 	  as per Bjorn's review comments. Presently this function is used only by
> 	  qce_setup_regs_aead to format keys, iv and nonce. cipher and hash 
> 	  algorithms can be made to use this function as a separate clean up patch.

Thanks for reworking the patch Thara, I think it looks much more
reasonable now, just a few small questions/nits below.

> 
>  drivers/crypto/qce/common.c | 164 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 162 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
> index 7b3d6caec1b2..ffbf866842a3 100644
> --- a/drivers/crypto/qce/common.c
> +++ b/drivers/crypto/qce/common.c
> @@ -15,6 +15,16 @@
>  #include "core.h"
>  #include "regs-v5.h"
>  #include "sha.h"
> +#include "aead.h"
> +
> +static const u32 std_iv_sha1[SHA256_DIGEST_SIZE / sizeof(u32)] = {
> +	SHA1_H0, SHA1_H1, SHA1_H2, SHA1_H3, SHA1_H4, 0, 0, 0
> +};
> +
> +static const u32 std_iv_sha256[SHA256_DIGEST_SIZE / sizeof(u32)] = {
> +	SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
> +	SHA256_H4, SHA256_H5, SHA256_H6, SHA256_H7
> +};
>  
>  static inline u32 qce_read(struct qce_device *qce, u32 offset)
>  {
> @@ -76,6 +86,21 @@ void qce_cpu_to_be32p_array(__be32 *dst, const u8 *src, unsigned int len)
>  	}
>  }
>  
> +static unsigned int qce_be32_to_cpu_array(u32 *dst, const u8 *src, unsigned int len)
> +{
> +	__be32 *d = (__be32 *)dst;
> +	const u8 *s = src;
> +	unsigned int n;
> +
> +	n = len / sizeof(u32);
> +	for (; n > 0; n--) {
> +		*d = cpu_to_be32p((const __u32 *)s);

The output is CPU endian, so this should be be32_to_cpup()

That also means that 'd' is u32 and you don't have to play tricks and
cast dst to a __be32*.

> +		s += sizeof(u32);
> +		d++;
> +	}
> +	return DIV_ROUND_UP(len, sizeof(u32));
> +}
> +
>  static void qce_setup_config(struct qce_device *qce)
>  {
>  	u32 config;
> @@ -96,7 +121,7 @@ static inline void qce_crypto_go(struct qce_device *qce, bool result_dump)
>  		qce_write(qce, REG_GOPROC, BIT(GO_SHIFT));
>  }
>  
> -#ifdef CONFIG_CRYPTO_DEV_QCE_SHA
> +#if defined(CONFIG_CRYPTO_DEV_QCE_SHA) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
>  static u32 qce_auth_cfg(unsigned long flags, u32 key_size, u32 auth_size)
>  {
>  	u32 cfg = 0;
> @@ -139,7 +164,9 @@ static u32 qce_auth_cfg(unsigned long flags, u32 key_size, u32 auth_size)
>  
>  	return cfg;
>  }
> +#endif
>  
> +#ifdef CONFIG_CRYPTO_DEV_QCE_SHA
>  static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
>  {
>  	struct ahash_request *req = ahash_request_cast(async_req);
> @@ -225,7 +252,7 @@ static int qce_setup_regs_ahash(struct crypto_async_request *async_req)
>  }
>  #endif
>  
> -#ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
> +#if defined(CONFIG_CRYPTO_DEV_QCE_SKCIPHER) || defined(CONFIG_CRYPTO_DEV_QCE_AEAD)
>  static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
>  {
>  	u32 cfg = 0;
> @@ -271,7 +298,9 @@ static u32 qce_encr_cfg(unsigned long flags, u32 aes_key_size)
>  
>  	return cfg;
>  }
> +#endif
>  
> +#ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
>  static void qce_xts_swapiv(__be32 *dst, const u8 *src, unsigned int ivsize)
>  {
>  	u8 swap[QCE_AES_IV_LENGTH];
> @@ -386,6 +415,133 @@ static int qce_setup_regs_skcipher(struct crypto_async_request *async_req)
>  }
>  #endif
>  
> +#ifdef CONFIG_CRYPTO_DEV_QCE_AEAD
> +static int qce_setup_regs_aead(struct crypto_async_request *async_req)
> +{
> +	struct aead_request *req = aead_request_cast(async_req);
> +	struct qce_aead_reqctx *rctx = aead_request_ctx(req);
> +	struct qce_aead_ctx *ctx = crypto_tfm_ctx(async_req->tfm);
> +	struct qce_alg_template *tmpl = to_aead_tmpl(crypto_aead_reqtfm(req));
> +	struct qce_device *qce = tmpl->qce;
> +	u32 enckey[QCE_MAX_CIPHER_KEY_SIZE / sizeof(u32)] = {0};
> +	u32 enciv[QCE_MAX_IV_SIZE / sizeof(u32)] = {0};
> +	u32 authkey[QCE_SHA_HMAC_KEY_SIZE / sizeof(u32)] = {0};
> +	u32 authiv[SHA256_DIGEST_SIZE / sizeof(u32)] = {0};
> +	u32 authnonce[QCE_MAX_NONCE / sizeof(u32)] = {0};
> +	unsigned int enc_keylen = ctx->enc_keylen;
> +	unsigned int auth_keylen = ctx->auth_keylen;
> +	unsigned int enc_ivsize = rctx->ivsize;
> +	unsigned int auth_ivsize;
> +	unsigned int enckey_words, enciv_words;
> +	unsigned int authkey_words, authiv_words, authnonce_words;
> +	unsigned long flags = rctx->flags;
> +	u32 encr_cfg, auth_cfg, config, totallen;
> +	u32 *iv_last_word;
> +
> +	qce_setup_config(qce);
> +
> +	/* Write encryption key */
> +	enckey_words = qce_be32_to_cpu_array(enckey, ctx->enc_key, enc_keylen);
> +	qce_write_array(qce, REG_ENCR_KEY0, (u32 *)enckey, enckey_words);

Do you really need this (u32 *) cast now?

PS. Returning the number of words turned out much better, looks good.

> +
> +	/* Write encryption iv */
> +	enciv_words = qce_be32_to_cpu_array(enciv, rctx->iv, enc_ivsize);
> +	qce_write_array(qce, REG_CNTR0_IV0, (u32 *)enciv, enciv_words);
> +
> +	if (IS_CCM(rctx->flags)) {
> +		iv_last_word = (u32 *)&enciv[enciv_words - 1];

iv_last_word can be a u32 (not a pointer) and this would simply be:
		iv_last_word = enciv[enciv_words - 1];

> +		qce_write(qce, REG_CNTR3_IV3, (*iv_last_word) + 1);
> +		qce_write_array(qce, REG_ENCR_CCM_INT_CNTR0, (u32 *)enciv, enciv_words);
> +		qce_write(qce, REG_CNTR_MASK, ~0);
> +		qce_write(qce, REG_CNTR_MASK0, ~0);
> +		qce_write(qce, REG_CNTR_MASK1, ~0);
> +		qce_write(qce, REG_CNTR_MASK2, ~0);
> +	}
> +
> +	/* Clear authentication IV and KEY registers of previous values */
> +	qce_clear_array(qce, REG_AUTH_IV0, 16);
> +	qce_clear_array(qce, REG_AUTH_KEY0, 16);
> +
> +	/* Clear byte count */
> +	qce_clear_array(qce, REG_AUTH_BYTECNT0, 4);
> +
> +	/* Write authentication key */
> +	authkey_words = qce_be32_to_cpu_array(authkey, ctx->auth_key, auth_keylen);
> +	qce_write_array(qce, REG_AUTH_KEY0, (u32 *)authkey, authkey_words);
> +
> +	/* Write initial authentication IV only for HMAC algorithms */
> +	if (IS_SHA_HMAC(rctx->flags)) {
> +		/* Write default authentication iv */
> +		if (IS_SHA1_HMAC(rctx->flags)) {
> +			auth_ivsize = SHA1_DIGEST_SIZE;
> +			memcpy(authiv, std_iv_sha1, auth_ivsize);
> +		} else if (IS_SHA256_HMAC(rctx->flags)) {
> +			auth_ivsize = SHA256_DIGEST_SIZE;
> +			memcpy(authiv, std_iv_sha256, auth_ivsize);
> +		}
> +		authiv_words = auth_ivsize / sizeof(u32);
> +		qce_write_array(qce, REG_AUTH_IV0, (u32 *)authiv, authiv_words);
> +	}
> +
> +	/* Write nonce for CCM algorithms */
> +	if (IS_CCM(rctx->flags)) {

Now I see what we where discussing in the last iteration...can't this
line just be:
	} else {

or perhaps:
	} else if (IS_CCM(rctx->flags)) {

I'm not saying that it's necessarily better, but if they are mutually
exclusive then it should be fine - and "self documenting".

Regards,
Bjorn

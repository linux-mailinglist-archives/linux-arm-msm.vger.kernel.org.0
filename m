Return-Path: <linux-arm-msm+bounces-40193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEE69E372E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DA75164C19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB461A9B5D;
	Wed,  4 Dec 2024 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9JuDOfx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F219F40E;
	Wed,  4 Dec 2024 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306860; cv=none; b=AUa5y5LN8mTq01CFkCJe8N0P6Xsnp9ozAO1Nu8QD/VoSIDfxbYLIzyyg4IDaG36+pqjqopStDtHmLxCfEveKtQaKo3UWP/ut+8dtlgUeLcdcXnCm+zksBWAlhSr7dhnkIlstJe04EtUGDR6uwmrYzDIlZ2vKz4LUCeERDY6LcRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306860; c=relaxed/simple;
	bh=OUTf5c0z1+SrUX7KnHGxI7CCBH1X18kmqd5sXJWZJTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3+NPn/HxprfjeegtxbOKqMVTqAT4n3WbZfUGF1SB1UBreBkjOyB6MFAT5twWgdmixATCbwOBhGyALNznhUe6RY4YarJZwYseCoFwZlT1HEnbfazTEPlEPGo1N9AVx4WWNpeefoiAm2QbmIoAzSXzxBoThTxqA7QMs6PqCq1+BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9JuDOfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DABBC4CED6;
	Wed,  4 Dec 2024 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733306860;
	bh=OUTf5c0z1+SrUX7KnHGxI7CCBH1X18kmqd5sXJWZJTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i9JuDOfx903Z+A69s+Vnn4GL3fBfNq1qimgQaKq/fZbOV+WvZcH2i2BqXcxgd3TxH
	 Z+ggupU9FFwn6BnHTp/cRuU1YcWy/J1xhBoiuop2ousV/QGswldCK18pmPnrMnG9p5
	 lG8NK+MgyI1IOcTSKB19ln9Lj8XIi5iCsBfoCeuHVa0Rkwqp4/ckVs5vvO/WktrcSK
	 GwatqcmLX89dWv7aLTrSpy5P0JSVnfxTIXhAGkQyJZ0xK7CNGxacVWyTrSw3eKOv7K
	 buB/dH5xeQAtogdLdEKyX3T/SK9Xt7U645Etj0VKdJvb3hwswrp8i1yjXAgWmIA4dY
	 Ii+PAqhMDp9sw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de8ecafeeso6995848e87.1;
        Wed, 04 Dec 2024 02:07:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHqMfDM1Rs+tYuwGUDTUk8mZGSXPHkv7eRr2gS+uMPta2+O81t+l8w9w5GRf9me0xacBXVOamGCWlvJyX9@vger.kernel.org, AJvYcCWnJ4cbPhJYQ+upzpCwfGKfA5/UTTTrln/F4EkCTFPMWe9DpGaWufjrUPAE5aHEmAPr27JRQNcF@vger.kernel.org, AJvYcCXkWGAAkVvlJGunSm46SMs/HvAO/zlpizXVtblbfDhmcRQt2mbX8RmKVteUzqIu5Q/E4jXSIT/UR9O6qzWm@vger.kernel.org
X-Gm-Message-State: AOJu0YxAUKSeiDzKxuVrzqjdVccyqjRp4IBQ6edMP4j8ttd+MP6Y8N41
	dQ8cSPDBSjwefPnqP8m+Uwm+YJpKl42XfCWgM0bPxJvkPyBB07JWAUqM0OmALOmew5BueDFgbJH
	IdR8Y/ab9YQrDUZYXw0Fn0m0nu9M=
X-Google-Smtp-Source: AGHT+IHWU+a7+eCom7OBfN7Jt2k2ech+5Jy8Q5QnscsoGZ+UCLjTOgPkoCZjR0oroWTIWLIXcb7v/jr+uOwaJTgZc7s=
X-Received: by 2002:ac2:4f01:0:b0:53e:1c47:f2c2 with SMTP id
 2adb3069b0e04-53e1c47f2fdmr737022e87.37.1733306858565; Wed, 04 Dec 2024
 02:07:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203180553.16893-1-ebiggers@kernel.org>
In-Reply-To: <20241203180553.16893-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 4 Dec 2024 11:07:26 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFg0mapBt9=EJ+dMcYfeYcnHy0PjTpwfi2JNYTu2UAZVQ@mail.gmail.com>
Message-ID: <CAMj1kXFg0mapBt9=EJ+dMcYfeYcnHy0PjTpwfi2JNYTu2UAZVQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - fix priority to be less than ARMv8 CE
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 19:06, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> As QCE is an order of magnitude slower than the ARMv8 Crypto Extensions
> on the CPU, and is also less well tested, give it a lower priority.
> Previously the QCE SHA algorithms had higher priority than the ARMv8 CE
> equivalents, and the ciphers such as AES-XTS had the same priority which
> meant the QCE versions were chosen if they happened to be loaded later.
>
> Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> Cc: stable@vger.kernel.org
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Thara Gopinath <thara.gopinath@gmail.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  drivers/crypto/qce/aead.c     | 2 +-
>  drivers/crypto/qce/sha.c      | 2 +-
>  drivers/crypto/qce/skcipher.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
> index 7d811728f047..97b56e92ea33 100644
> --- a/drivers/crypto/qce/aead.c
> +++ b/drivers/crypto/qce/aead.c
> @@ -784,11 +784,11 @@ static int qce_aead_register_one(const struct qce_aead_def *def, struct qce_devi
>         alg->encrypt                    = qce_aead_encrypt;
>         alg->decrypt                    = qce_aead_decrypt;
>         alg->init                       = qce_aead_init;
>         alg->exit                       = qce_aead_exit;
>
> -       alg->base.cra_priority          = 300;
> +       alg->base.cra_priority          = 275;
>         alg->base.cra_flags             = CRYPTO_ALG_ASYNC |
>                                           CRYPTO_ALG_ALLOCATES_MEMORY |
>                                           CRYPTO_ALG_KERN_DRIVER_ONLY |
>                                           CRYPTO_ALG_NEED_FALLBACK;
>         alg->base.cra_ctxsize           = sizeof(struct qce_aead_ctx);
> diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
> index fc72af8aa9a7..71b748183cfa 100644
> --- a/drivers/crypto/qce/sha.c
> +++ b/drivers/crypto/qce/sha.c
> @@ -480,11 +480,11 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
>         else if (IS_SHA256(def->flags))
>                 tmpl->hash_zero = sha256_zero_message_hash;
>
>         base = &alg->halg.base;
>         base->cra_blocksize = def->blocksize;
> -       base->cra_priority = 300;
> +       base->cra_priority = 175;
>         base->cra_flags = CRYPTO_ALG_ASYNC | CRYPTO_ALG_KERN_DRIVER_ONLY;
>         base->cra_ctxsize = sizeof(struct qce_sha_ctx);
>         base->cra_alignmask = 0;
>         base->cra_module = THIS_MODULE;
>         base->cra_init = qce_ahash_cra_init;
> diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
> index 5b493fdc1e74..ffb334eb5b34 100644
> --- a/drivers/crypto/qce/skcipher.c
> +++ b/drivers/crypto/qce/skcipher.c
> @@ -459,11 +459,11 @@ static int qce_skcipher_register_one(const struct qce_skcipher_def *def,
>                                           IS_DES(def->flags) ? qce_des_setkey :
>                                           qce_skcipher_setkey;
>         alg->encrypt                    = qce_skcipher_encrypt;
>         alg->decrypt                    = qce_skcipher_decrypt;
>
> -       alg->base.cra_priority          = 300;
> +       alg->base.cra_priority          = 275;
>         alg->base.cra_flags             = CRYPTO_ALG_ASYNC |
>                                           CRYPTO_ALG_ALLOCATES_MEMORY |
>                                           CRYPTO_ALG_KERN_DRIVER_ONLY;
>         alg->base.cra_ctxsize           = sizeof(struct qce_cipher_ctx);
>         alg->base.cra_alignmask         = 0;
>
> base-commit: ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1
> --
> 2.47.1
>


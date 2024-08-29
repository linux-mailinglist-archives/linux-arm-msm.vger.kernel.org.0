Return-Path: <linux-arm-msm+bounces-30055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BCF964AC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE17828409A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 15:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCFA1B4C49;
	Thu, 29 Aug 2024 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk9ICepu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3A51B3F07;
	Thu, 29 Aug 2024 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724947117; cv=none; b=hrZ8TKc1tdTMJmtQOCbiy8j6wUsZQKD0TuKbBy2+xQk4+5NMzzxxXHnteEtUPYa4coNC/UI2XJD6HovuVK/9JdTQBT8XuvtYsQqy9IXqyRe+3pdI+EhLqMNm7qY3LTEG2D8FgyslsIp8nV6d40M0n3XP0yJenJFULI356bivGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724947117; c=relaxed/simple;
	bh=lcW1Fr8nT1yLudggBf7OO8h3Q4/x1DlPqjN6rek0GGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U96rersoA0WpNu9QrKGAgfjI+3ZWgLYbG0UdGgDfvIYZ8H0o4F++nWLJpBLmPMZvmBMZ3s3sMRv6UbRy1ryKBglPFYEap32Vsyrwlk2MeQW54wCRutkQE10FQFR7F0abwHTepcatrLDx3ODIvUDiLTNy6TKHkJ5PVNh+LJvX3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uk9ICepu; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-70968db52d0so769812a34.3;
        Thu, 29 Aug 2024 08:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724947115; x=1725551915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8SUS2sti1DatQX5oI9Q4F22VsksxpH0yRfWZTktViQ=;
        b=Uk9ICeputHQHlzzrUQqYXr0MCBEmJg2cl8UqSXVLDCMVJC4kpRa0Hbno256MO9X0vy
         cCsGzlO4BsFPgiDrtfffkcA4X8j49y8ygrqYmRDa7Gg6ioTYwCKz8ebqUt3AQ8aCsTh8
         56Itf0/LSud0utjrSiS3DdX9nUvQoT8KgvloAsZE59zyhdt/3H4uOLxvG9o9JVyecDkT
         NunImLvtoQs9bHH6ACLV6+U2zXQMJxxpk5Jrd4GJWPY+zulLL6kfB/ens/lRbxn3glZ+
         JIeavxBLWCo95Va8sYBffZWYt87ZugLqecq/gK3skrAysqd7hle63ksjfRwQ2nTdyrLX
         /1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724947115; x=1725551915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8SUS2sti1DatQX5oI9Q4F22VsksxpH0yRfWZTktViQ=;
        b=dSCwl5Ur4MfT/mfj3JFtcPBO5MCsNtiFRXTDVbcEYCyTFKk7WL71+HXeFJya+8UMwk
         ISjmVgQeBQBSddJvojgYRfleqPf1OYLsJyK/SstHxF1B+82Mpn3CfJS7fS/q0eTVPdG1
         8Ewolnz6p9+UuL8jmbX8xMKA0jngiEuEp3YIkmvd8oQBe2zsCF8/BINhRJZr/AyjigbO
         FMhYgtp00CGHOPyGcdvLLqoZNvxA8MY01aIuRW61Lp6GdxLC+GP2ESjLljD4sBra8Lse
         puJqEQM2+Ok1TmcVbK6pWkEgvQJi7iK42y2ecA9Yo19HlVCK/OUiWrW3ecF+kLc4ncyM
         ObZw==
X-Forwarded-Encrypted: i=1; AJvYcCVuzJkn9FL/njTIjDkZdq3GQhGP/zaTJJkNG3Oy0j7eX6svxbE14jMLAoRCUmvpIGAWzd4DzjhDOtZtXs8m@vger.kernel.org, AJvYcCWwmWFjVEYmsAQodAYyrdwO2Xt1qyRAdIyMYwG8pncoP+9t9NP6E4Jc5/RrV/oTUXb9s/q9p6oEs+pQn31c@vger.kernel.org, AJvYcCWysfLIWiJRPCaaH99bvr7HLqdgHZ6Y14SFcqQryXz2WBWyUY3pQnR8zawQ8wfMLkSM+cTj0b0vjAk/rm0j@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8f0b6DoJATrtobApKXNmTy1IYgByvdqALNpLigVMWE7wh96T
	qPMpsolWLg6WZK000NQB35tmcQEx/cYxZCE8PmdOvVU8PUs6RyJM
X-Google-Smtp-Source: AGHT+IEmKmJPQO4B38zaWzkb0S8/l+pJwy1vmcrxzdHGLGAZ7Yzv7ADKfo+OZVemW5ah5PWd2mY+XQ==
X-Received: by 2002:a05:6359:4592:b0:1a6:799b:b06c with SMTP id e5c5f4694b2df-1b603f1598cmr461914955d.23.1724947115153;
        Thu, 29 Aug 2024 08:58:35 -0700 (PDT)
Received: from eaf ([2800:40:39:2b6:7cb1:da28:8837:b7fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e9be476sm1356974a12.69.2024.08.29.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:58:34 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:58:29 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Brian Masney <bmasney@redhat.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	quic_omprsing@quicinc.com, neil.armstrong@linaro.org,
	quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] crypto: qcom-rng: fix support for ACPI-based systems
Message-ID: <20240829155829.GA6489@eaf>
References: <20240829012005.382715-1-bmasney@redhat.com>
 <20240829012005.382715-3-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829012005.382715-3-bmasney@redhat.com>

Hi,

thanks for the patch. I have one doubt:

On Wed, Aug 28, 2024 at 09:20:05PM -0400, Brian Masney wrote:
> The qcom-rng driver supports both ACPI and device tree based systems.
> ACPI support was broken when the hw_random interface support was added.
> Let's go ahead and fix this by checking has_acpi_companion().
> 
> This fix was boot tested on a Qualcomm Amberwing server.
> 
> Fixes: f29cd5bb64c2 ("crypto: qcom-rng - Add hw_random interface support")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/crypto/qcom-rng.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
> index 4ed545001b77..470062cb258c 100644
> --- a/drivers/crypto/qcom-rng.c
> +++ b/drivers/crypto/qcom-rng.c
> @@ -176,6 +176,21 @@ static struct rng_alg qcom_rng_alg = {
>  	}
>  };
>  
> +static struct qcom_rng_match_data qcom_prng_match_data = {
> +	.skip_init = false,

So with acpi, skip_init will be set to false now, right? But before
f29cd5bb64c2 broke it, skip_init used to be set to true. Was that wrong
before, or now?

Ernesto

> +	.hwrng_support = false,
> +};
> +
> +static struct qcom_rng_match_data qcom_prng_ee_match_data = {
> +	.skip_init = true,
> +	.hwrng_support = false,
> +};
> +
> +static struct qcom_rng_match_data qcom_trng_match_data = {
> +	.skip_init = true,
> +	.hwrng_support = true,
> +};
> +
>  static int qcom_rng_probe(struct platform_device *pdev)
>  {
>  	struct qcom_rng *rng;
> @@ -196,7 +211,11 @@ static int qcom_rng_probe(struct platform_device *pdev)
>  	if (IS_ERR(rng->clk))
>  		return PTR_ERR(rng->clk);
>  
> -	rng->match_data = (struct qcom_rng_match_data *)of_device_get_match_data(&pdev->dev);
> +	if (has_acpi_companion(&pdev->dev))
> +		rng->match_data = &qcom_prng_match_data;
> +	else
> +		rng->match_data =
> +			(struct qcom_rng_match_data *)of_device_get_match_data(&pdev->dev);
>  
>  	qcom_rng_dev = rng;
>  	ret = crypto_register_rng(&qcom_rng_alg);
> @@ -231,21 +250,6 @@ static void qcom_rng_remove(struct platform_device *pdev)
>  	qcom_rng_dev = NULL;
>  }
>  
> -static struct qcom_rng_match_data qcom_prng_match_data = {
> -	.skip_init = false,
> -	.hwrng_support = false,
> -};
> -
> -static struct qcom_rng_match_data qcom_prng_ee_match_data = {
> -	.skip_init = true,
> -	.hwrng_support = false,
> -};
> -
> -static struct qcom_rng_match_data qcom_trng_match_data = {
> -	.skip_init = true,
> -	.hwrng_support = true,
> -};
> -
>  static const struct acpi_device_id __maybe_unused qcom_rng_acpi_match[] = {
>  	{ .id = "QCOM8160", .driver_data = 1 },
>  	{}
> -- 
> 2.46.0
> 


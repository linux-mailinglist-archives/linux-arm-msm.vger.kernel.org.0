Return-Path: <linux-arm-msm+bounces-38482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF59D3A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FB4C1F26C05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD7E1A070E;
	Wed, 20 Nov 2024 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGYO0ntr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E711919CC31
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103949; cv=none; b=kHGKYcWIRAlfenlsgZQI+XZnNGmE3U39AUGbtB9dqlgHt8MhV+URylnG7WUM26IGHAoP8j/8UjahktAsoe/dZGQupx5W0UOGSBxKxq/JbEHX+e04I4fanyMtbwOdfPL8iBzf09ac/5fLnRi7FRfmmP49XL3oRH+70qrZgB6swVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103949; c=relaxed/simple;
	bh=oxKj7f9CN77EleHfDRz7Kfg//qJR7ze/Y6LscpqC2yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLSTIDQE+haP9mw5Fb5IMfrq6JYC5xRH23ug+O+RJcM8vHe05onZ9JdvhJ7NMKt6hntCQiia3SLr6RA518lBuxA+VfaBKreYRm+D4o242U3lNmgZNB0Tm3gduwVyDwiFgbBhsNSjErokQaWUOqkj5GuAUUgPSPIdy9XgoNKrefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGYO0ntr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso5210099e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732103946; x=1732708746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCHaodn+Zuc0IF8Q26c7qF1Ujde2yrClwtrLR8ao1wg=;
        b=LGYO0ntrU/GUmN1SqxiLlOUxcmGUtPlLm90nlNtnrhMPFcUhDudzqULNehRPRCM/K2
         iHISJkHcV20Hhr00dzp4zmbzF0zWswrd8Jx2SV5exbCw1CYPOEm1QTHn60TZ4tL0k78+
         /bPZUqjFn8L67bcV4pYLGXa0YZ8UvwVH2CMB2jVg62Y7dEKoddxjx8HSjDDcXvOf7Fph
         9BGL3BYzUC8M0/c+tamJSqjz+YDXnd6JA8EemjOh8DmuxaezNpPDC+DAyTsVWCa29sSs
         AsZsxQgiMuUZM5i/kUAZPZDoMupG3GmOmH6XFgpOWt7v/X2ehFFOHjY/YUxiVfSqmasX
         PnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103946; x=1732708746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCHaodn+Zuc0IF8Q26c7qF1Ujde2yrClwtrLR8ao1wg=;
        b=LB910VFPg/Jzok8TQ791L61EBHZHfLGBLxMSwMHMeks/AqyZ96BfZ8RRM/ZzYz0rsh
         hxRzr1g/Fc/5tAPDT3SEf7JWYiqTWXSxyRougx7RBiUslm+UV0wHti9Q9w4Mfc1UyBO6
         FyuidYIJwWy4EpRp72XIC1psoQdwvrLdlKdD5VgMd1EE9smEzVujmmYELnNjTorebbDm
         /x2/fmBqRvG2vuKuZH1qNBgIfdrpY9rvtzzP/U0h0Q1m2ViajZ0sBPVj3oXn0z6gz1l8
         Zp/bJalHp+6Fgzg7hixdOwu9G2d/hGyrcaAJ8BY6ApOcSiZdKx29dKaKzImgkYRb6ap4
         Zseg==
X-Forwarded-Encrypted: i=1; AJvYcCUeTsDe2XFM+aYkPBuGwW4t1eiShpSgsdkgD1Cj4EY3d/c582Gus/XdXL2jvenN5xGCDvime0BY4ri2KeYJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxfHD+IrB6ahavtxjhj76rz2+T6M/jVLvmtvl6J/dRo+AOiqH7L
	QmDXfcTOWID65D0+ehNWliXt9GL9oc0ngtN1JCOKIpK+ufxZs9TQ/OknRAO+3Zc=
X-Google-Smtp-Source: AGHT+IHu2p3lhAczqCvViCUcozUjCTiyMdmd3I0f89+CS/M1jyncHnfbGOtdXv9IdhVNZRyDg9zYzQ==
X-Received: by 2002:a19:5e4a:0:b0:539:9505:7e5 with SMTP id 2adb3069b0e04-53dc1363820mr836694e87.36.1732103946157;
        Wed, 20 Nov 2024 03:59:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd4671fasm607472e87.150.2024.11.20.03.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:59:05 -0800 (PST)
Date: Wed, 20 Nov 2024 13:59:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, bp@alien8.de, tony.luck@intel.com, 
	james.morse@arm.com, mchehab@kernel.org, rric@kernel.org, andy.gross@linaro.org, 
	vnkgutta@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] qcom: llcc/edac: Correct interrupt enable register
 configuration
Message-ID: <zkqjyuem3ykeona7p7n6ejkndaxrnpfxjbk33nkzqjjyktoqpw@3b77c4jjdqhd>
References: <20241119064608.12326-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119064608.12326-1-quic_kbajaj@quicinc.com>

On Tue, Nov 19, 2024 at 12:16:08PM +0530, Komal Bajaj wrote:
> The previous implementation incorrectly configured the cmn_interrupt_2_enable
> register for interrupt handling. Using cmn_interrupt_2_enable to configure Tag,
> Data RAM ECC interrupts would lead to issues like double handling of the
> interrupts (EL1 and EL3) as cmn_interrupt_2_enable is meant to be configured
> for interrupts which needs to be handled by EL3.

This reads as if it was possible to write EL3-related register from EL1.
Is it true?

> 
> EL1 LLCC EDAC driver needs to use cmn_interrupt_0_enable register to
> configure Tag, Data RAM ECC interrupts instead of cmn_interrupt_2_enable.
> 
> Fixes: 27450653f1db ("drivers: edac: Add EDAC driver support for QCOM SoCs")
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  drivers/edac/qcom_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> index a9a8ba067007..0fd7a777fe7d 100644
> --- a/drivers/edac/qcom_edac.c
> +++ b/drivers/edac/qcom_edac.c
> @@ -95,7 +95,7 @@ static int qcom_llcc_core_setup(struct llcc_drv_data *drv, struct regmap *llcc_b
>  	 * Configure interrupt enable registers such that Tag, Data RAM related
>  	 * interrupts are propagated to interrupt controller for servicing
>  	 */
> -	ret = regmap_update_bits(llcc_bcast_regmap, drv->edac_reg_offset->cmn_interrupt_2_enable,
> +	ret = regmap_update_bits(llcc_bcast_regmap, drv->edac_reg_offset->cmn_interrupt_0_enable,
>  				 TRP0_INTERRUPT_ENABLE,
>  				 TRP0_INTERRUPT_ENABLE);
>  	if (ret)
> @@ -113,7 +113,7 @@ static int qcom_llcc_core_setup(struct llcc_drv_data *drv, struct regmap *llcc_b
>  	if (ret)
>  		return ret;
> 
> -	ret = regmap_update_bits(llcc_bcast_regmap, drv->edac_reg_offset->cmn_interrupt_2_enable,
> +	ret = regmap_update_bits(llcc_bcast_regmap, drv->edac_reg_offset->cmn_interrupt_0_enable,
>  				 DRP0_INTERRUPT_ENABLE,
>  				 DRP0_INTERRUPT_ENABLE);
>  	if (ret)
> --
> 2.46.0
> 

-- 
With best wishes
Dmitry


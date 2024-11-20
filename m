Return-Path: <linux-arm-msm+bounces-38414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BC9D33EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 08:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B56281A58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 07:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2021802DD;
	Wed, 20 Nov 2024 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSoPGQFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8BF17BB38
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 07:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732086083; cv=none; b=fbCKL48h4ZNt9/1j6x+3yyDYDcHaxwVOutbkcNalOrAwR0h3FPOk/UJCtjG1OyZI3mwPwXPvtn5ZTo1LPjKPVFxjYeF5iaIiGR6+qgCy9lcjxOtHIptZwqmzPObqPSqFp7FVRHsvoaVj9orAN8iI2jU77f3OvZOxJTKr853KB78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732086083; c=relaxed/simple;
	bh=+8wlx+M47iI8fZbBgvDNoDloXyci5FRGHHEtcbUg8WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDvirYiYwk7r+U6+mFZTzvS4Y2jBErb/H6W1Hom20yeB+dzSrpq7H81mjC+VrLds6M1/dO6MvdcQXcmkIPo2b583/B90t8sYyDGqhPSamJk9YBg2tMkTxLoPFZ72kGIUkLWpGv3HzUx8EU8KO7DyCsyu+MwR6GRVg69YOKjVfew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSoPGQFw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ea1c455d0eso3662952a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732086081; x=1732690881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ViYzAc9WLK6jLOPltHnzdk750GZoNYIYgpGNbpi34M=;
        b=PSoPGQFwH/NwDmYvruAzXsAcIySKGxVClBorFuVx20NGKo3b7+TCpUuw3Y6id0gafU
         FXOP8SHnnXD3nhwhtjcit/RNQeh2C5mChzTdxU7IEWRL0o1pjsSGKtlMcO4CDSiuNdta
         7v1F3SmCNleJqehrYlJiZbkJKqBPb3PIR0wnriDTCDI9Il7/ZtJ8Ny3UKTulCBv1JOut
         AzrCBuvouRL+XbSVogoELMlVKfHBFxsDfIIxezAeIDRMRb50JFcEEMQSDTgQ0FZ8JZWt
         Uv6194GdaGZ8bHgwNS2gUEBEP6Va8CEZNCIToIyhJtvRM08qAkh7IEOtr21SmXB/F80X
         dmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732086081; x=1732690881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ViYzAc9WLK6jLOPltHnzdk750GZoNYIYgpGNbpi34M=;
        b=dd2ESBOGc/aOeMYdIhhUA4uk1q1pBphd2q/UWdiqWJvD6WKOQeBZUloa4bkZYi6jxM
         ZGqVr0If6mJrZlMTsjpIfAs235wBgisLvOARxj6EilZD6MeZ7OcIs4ovM5xlRCYZimQf
         Ec1bjNUKsuCmtC61SaevGp/EUxp8k2Psba/mUhK5ay0Lm3WWGo/0QBgfbHgIFZcqZYMP
         0xBREZ/hNWMqqLi3/1AE3CwqWgze6aWqw4ranSow/sW/a4M3VQX9yljmSGs0bswQFYk/
         irr9kY0s35iXoxCsOKameRAS/XSmBQ+8I+RzXRDPHunVMOM/21FDLx5lMUM4EHbug0fc
         RzBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4nBNpc5l5zgWWh8q/LH1oNakqHDmFaiwsIcci1nKYdn20lmrqrkHO109kKGImBRtNNjyw611PMTATZlaZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+aPUjMjaP12ejiEwFKA2rZ+l5R2Q0gcrj8t0gHlm17s9sIneg
	upG8G4vYsJMTw7IySkmTeDu+McHc0WRC8g9ZyRe5oGRp+n7951jcgHKUsgHKbg==
X-Google-Smtp-Source: AGHT+IHj2cuOOlfcohUcdNygmcvikQt71/Syr1p8dbOWgBZHbuuarNyAfZM+UbV1oden1U8Pt0wBMQ==
X-Received: by 2002:a17:90b:4c04:b0:2ea:6d7a:d6bc with SMTP id 98e67ed59e1d1-2eaca738f91mr1932814a91.19.1732086080860;
        Tue, 19 Nov 2024 23:01:20 -0800 (PST)
Received: from thinkpad ([120.60.129.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead031448csm561848a91.20.2024.11.19.23.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 23:01:20 -0800 (PST)
Date: Wed, 20 Nov 2024 12:31:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 1/2] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20241120070115.qox54zr3yhnkqgmd@thinkpad>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119092058.480363-2-quic_mdalam@quicinc.com>

On Tue, Nov 19, 2024 at 02:50:57PM +0530, Md Sadre Alam wrote:
> Currently we are configuring lower 24 bits of address in descriptor
> whereas QPIC design expects 18 bit register offset from QPIC base

You mean 'QPIC IP' here? But is it QPIC or NANDc? I guess the later.

> address to be configured in cmd descriptors. This is leading to a
> different address actually being used in HW, leading to wrong value
> read.
> 

This doesn't clearly say what the actual issue is. IIUC, the issue is that the
NANDc base address is different from the QPIC base address. But the driver
doesn't take it into account and just used the QPIC base as the NANDc base. This
used to work as the NANDc IP only considers the lower 18 bits of the address
passed by the driver to derive the register offset. Since the base address of
QPIC used to contain all 0 for lower 18 bits (like 0x07980000), the driver ended
up passing the actual register offset in it and NANDc worked properly. But on
newer SoCs like SDX75, the QPIC base address doesn't contain all 0 for lower 18
bits (like 0x01C98000). So NANDc sees wrong offset as per the current logic.

> Older targets also used same configuration (lower 24 bits) like sdxpinn,

Please use actual product names and not internal names. I believe you are
referring to SDX55/SDX65 here.

> ipq etc. but issue is masked in older targets due to lower 18 bits of QPIC
> base address being zero leading to expected address generation.
> 
> Sdxpinn     : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
> Sdxnightjar : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
> older targets.

Same here.

> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Please add relevant Fixes tag.

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index b8cff9240b28..34ee8555fb8a 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
>  #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>  
>  /* Returns the NAND register physical address */
> -#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
> +#define nandc_reg_phys(chip, offset)  ((nandc)->props->offset_from_qpic + (offset))
>  
>  /* Returns the dma address for reg read buffer */
>  #define reg_buf_dma_addr(chip, vaddr) \
> @@ -561,6 +561,7 @@ struct qcom_nandc_props {
>  	bool is_qpic;
>  	bool qpic_v2;
>  	bool use_codeword_fixup;
> +	u32 offset_from_qpic;

nandc_offset?

>  };
>  
>  /* Frees the BAM transaction memory */
> @@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
>  	.is_bam = false,
>  	.use_codeword_fixup = true,
>  	.dev_cmd_reg_start = 0x0,
> +	.offset_from_qpic = 0x30000,

How 0x30000 is supposed to work? You said the NANDc ignores lower 18 bits, but
this has 17th and 18th bits set.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


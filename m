Return-Path: <linux-arm-msm+bounces-8955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEB841C38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 07:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E05F1F25A24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9C33F9EF;
	Tue, 30 Jan 2024 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLq/DByo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC33CF66
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706597714; cv=none; b=pwuedjhhRkai+g9i2UW/hiDKNbwYoagWLClodwFTaa8iHxJte/iJNajuiC6Ewfd7daScktO1XaY3WPkv3iWnqgYNQuL/c9o50TCs0VunL88gs3m+vuLqI02cRw2z3TG0dNILX7YOAE2zxivfnRGxT06QiWzHTlSP4ac44oaUpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706597714; c=relaxed/simple;
	bh=EkTqePDnNNyNFnIyaLgdsTnaerx5Rl5JacQROhGX8hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQLkwuuCMbFdMTFWu/lXplYJjG5H8kANNl9IX9M+3U1J9IMRaDcZSNZyn+jU2jnwbayR4VdcsMnyRxF302AHw2301eAm6QfdTinGV2uyw31kPxAo7hITv6E+pozeQVGU91FO+yEj/p7ayHZyUBhMsT5RE99g2pP9SjC/RjjQwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLq/DByo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ddc5faeb7fso2750400b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597712; x=1707202512; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fOCYfEkoC2QCe8jutzidzqDGcrnmYG0jwgxAFd3FC1Q=;
        b=iLq/DByorYq9Lf33mXuhkN3lpGjA5vB3UI4GfKwRebOg6LUSVfA2aPEE7kvRL+K5pm
         3sptrrvy/PsZ2gLKdgG2m/6v/UOFJGgYuAV/syLckemXR5q4JPhpgav5A1CE3dbgkoPa
         2TVyon8j74r4BZvVI2RY5tbARVvX65FsNOF8B96dNB4qwMnmntELNDjUefk2vBwJMvyj
         EAkTt2q3VOynEBn87K3/5afyH4u4nHeR32owi25QXXEIWZ2eXNOYPcZWCKw/aKn7ESit
         ePQT9QS8zgsC8jFqvf693R8v168R+bXfnbKNSZCt6OhO5NX+wP8x5BDra49M8XZyJ/Vo
         MXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597712; x=1707202512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOCYfEkoC2QCe8jutzidzqDGcrnmYG0jwgxAFd3FC1Q=;
        b=W866TwFI9U/iLRcMLDD+LaOZqIWk8qS5ZxqGwzAE36lsiMrbFaVCyvOZr751bkEoUE
         8mxBaxEZ6ppws/Qlzou+SMRhdjVw20f5pCGdmBw6RiZUADe2gOMRZQ8Nc26fIFcFwDUy
         07RhEq58JkAUM1jPKuqW7MoYV8YWTTljtzxfI2hjkSCXGqJSPeOedieud15h2xMhVek0
         Vi8NKvun2D/hvvkUDKMzYli9oBubvw5/JRgvGPuClAJy3lF+YZn0DnwxglX3ouSfrWdL
         2wq6suhXtL6D7a3gkGheXpRf0QmCAf3FxZh7RlMZZlNe8z93dq/6OejdtxMGhpW8cxOv
         rjuw==
X-Gm-Message-State: AOJu0YylhseEZkSS5fW3qeawmzkHHGRPI++nEaApNTxDcvMaBBfJ2u0l
	+n57BifwwV7RVf7/bj6Y/x2ROftEuaECdePM9AcMAXMc27xpN16nh1Hhr64DzJ6KskcD8JAuQ78
	=
X-Google-Smtp-Source: AGHT+IFHCY64sy0FfJm5owYE0QeTqXLHkOWLmTCFbUd6gfTEpZRJ/WaOf85v6uwmght9xcZGQDfqCQ==
X-Received: by 2002:aa7:93d1:0:b0:6de:8ad:dad1 with SMTP id y17-20020aa793d1000000b006de08addad1mr5595313pff.19.1706597712383;
        Mon, 29 Jan 2024 22:55:12 -0800 (PST)
Received: from thinkpad ([117.202.188.6])
        by smtp.gmail.com with ESMTPSA id hq24-20020a056a00681800b006dbdbe7f71csm7214997pfb.98.2024.01.29.22.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:55:12 -0800 (PST)
Date: Tue, 30 Jan 2024 12:25:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Message-ID: <20240130065506.GE32821@thinkpad>
References: <20240129-x1e80100-pci-v2-0-5751ab805483@linaro.org>
 <20240129-x1e80100-pci-v2-2-5751ab805483@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129-x1e80100-pci-v2-2-5751ab805483@linaro.org>

On Mon, Jan 29, 2024 at 04:41:20PM +0200, Abel Vesa wrote:
> Add the compatible and the driver data for X1E80100.
> 

If you happen to respin the series, please add info about the PCIe controller
found on this SoC. Like IP version, Gen speed, max. link width etc...

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 10f2d0bb86be..2a6000e457bc 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>  	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
>  	{ }
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


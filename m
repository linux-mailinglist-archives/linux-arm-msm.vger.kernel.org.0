Return-Path: <linux-arm-msm+bounces-30246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA8966110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 13:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20352820E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 11:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AA019882E;
	Fri, 30 Aug 2024 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClwvBHk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDFB18F2D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018929; cv=none; b=juhxwCEe2cXNBB6Czx2mCigLSG7NE9rBxk1LDTVUkMTRCW27LStyOt828lbnIsFCdOAZv15ZElkXEEUXNCA+C6LEswUJlWdNqqlY5+cHU+ECN92qf5f7n9vrY4/I+E+BsCsMYhz6aji5d7PxPec24sSizM8C8UZd4QiRHsHNXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018929; c=relaxed/simple;
	bh=rGJabSH1WjGrwPyUZvO8SIhkBqF284ClrE8qaXkEwU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTcnCOgOjSuryoQI62m+e0dF34KY3EakAHA8JW0GnscI4Pyr6A0pnT3EA2uwYe7Z6N3lT6bPXRfablUcpkYwMm8ks+SFRrR+V04xFSl8TreQDM8GA2eIFO1dwto9A9Ag5bmwu8q4HVxucwfP+5YqqE3BHmBt070m5pLX/hXvllI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClwvBHk/; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5df9c34c890so1018963eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725018926; x=1725623726; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kXXjyoQkOSIGIfDRWOMPNe7ntaakkXVTK3kq6Qxk2A=;
        b=ClwvBHk/WBUYgmBFNCANRNc9u98r85EiYTRleP0gl7m5yUCdhZYOCmptRPPVyyo+FG
         cmC9iTEto7mZQi839hnUE3mo+R/L5MAenQautgTaAwinoAiRwlHTm/mma7HMRL3bg8iF
         vRtDiOzSLAtBJZaWAJd3l6g4fe+pJ1v1EppUG10j9JLzpu+ayQHoeu4FqNW6UXR6rL0A
         qUzyxQaCIe0HnBlyRfn0C/h4UqfR5ceFNiZAAxWIWNnKei4eL0gh6xttZRWbTPt+j/g7
         h2IXkauYYoGKfrXBX7/uTWRTvxga4J1z+xUWzsJw+hBdjQ/xPm1o7PLgwvusPZH5BtzJ
         wmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725018926; x=1725623726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kXXjyoQkOSIGIfDRWOMPNe7ntaakkXVTK3kq6Qxk2A=;
        b=EQGrfvCxWoCI9m6CxOEMq+cKSwH2eddAiNZ+PRi/p/c1GUURPP9LzlAyZO20xW+2UY
         EsKJYdSP3zKQdFzF8O4Ap8mcVeOoy1xmO2B7XrWq8O2mtMtUxAU7Y9ozgM1PRxA2izD7
         M+VWQH/08wuJGtTYZgA51km2L+BqUYDMjcwHMoO0h2XBUySOqHcRnH2D5YaqgoBjPXKy
         j8s+OyhRvm3DUuMSQMmAuMbVCpHnJIYNZTfWiG5PQt4O+8Eki6cCOY6r9E+v83BdfPlm
         cNmP3Y/L+1Z+abK8glFEJSBlsvbPcWnY7LBc0JFIBo7lULtTdiBNa1ruLaBD2d7goK/B
         +U0A==
X-Forwarded-Encrypted: i=1; AJvYcCVj7b3Zf7q4wnG3d/Z7Vg+24D+03IgRlQAkMSDANIhGfJAuMWcwhx+mV+bS68gs5TKOHCGj3hsufjXAb40J@vger.kernel.org
X-Gm-Message-State: AOJu0YzNz7Sjx61Cy+GF+Ni2hWQCZDggZXQGfGJ4OoMF1YCTRVGN+6Fh
	zYYcJNPfDdcpZiJXtFyDTPhDyvvWbK8o9+kijn+0Y0TKoC5GOLmDJKFa3RbwWQ==
X-Google-Smtp-Source: AGHT+IH/BxJwIxRjq4Ftk2utGPO5gE372yrfaYPPrKkvTKKraSTvq03DzON9Ri0ykoGoYqRcozC2MA==
X-Received: by 2002:a05:6871:e25d:b0:25e:129c:2223 with SMTP id 586e51a60fabf-277900f62cfmr5786865fac.19.1725018926065;
        Fri, 30 Aug 2024 04:55:26 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5773733sm2584959b3a.217.2024.08.30.04.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 04:55:25 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:25:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path
 for Foxconn SDX55/SDX72
Message-ID: <20240830115519.nun52bselrkc77qy@thinkpad>
References: <20240725022941.65948-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240725022941.65948-1-slark_xiao@163.com>

On Thu, Jul 25, 2024 at 10:29:40AM +0800, Slark Xiao wrote:
> To separate the images of Foxconn from other vendors, adding a
> new foxconn subfolder under qcom/<platform> for edl image path.
> And delete the fw patch since it's useless for Foxconn devices.
> 
> Fixes: bf30a75e6e00 ("bus: mhi: host: Add support for Foxconn SDX72 modems")
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v2: change the folder path architecture
> ---
>  drivers/bus/mhi/host/pci_generic.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 14a11880bcea..f159a9dd53e7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -433,8 +433,7 @@ static const struct mhi_controller_config modem_foxconn_sdx72_config = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -444,8 +443,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  	.name = "foxconn-t99w175",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -455,8 +453,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w175_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5930e_info = {
>  	.name = "foxconn-dw5930e",
> -	.fw = "qcom/sdx55m/sbl1.mbn",
> -	.edl = "qcom/sdx55m/edl.mbn",
> +	.edl = "qcom/sdx55m/foxconn/prog_firehose_sdx55.mbn",
>  	.config = &modem_foxconn_sdx55_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> @@ -502,7 +499,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
>  	.name = "foxconn-t99w515",
> -	.edl = "fox/sdx72m/edl.mbn",
> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
>  	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx72_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> @@ -513,7 +510,7 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
>  
>  static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
>  	.name = "foxconn-dw5934e",
> -	.edl = "fox/sdx72m/edl.mbn",
> +	.edl = "qcom/sdx72m/foxconn/edl.mbn",
>  	.edl_trigger = true,
>  	.config = &modem_foxconn_sdx72_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-msm+bounces-30249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DEA966167
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 14:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420201F250F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBAF18EFDD;
	Fri, 30 Aug 2024 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xcvxnSkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D381D1312
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020294; cv=none; b=Yy33wkjp/bngMdwqWh1A5bLapCFIFEf2hBWgxJJQZY8PbrtZvQ/1DRNNzmMTEU1QEGEq2kHcvTC1fuZuYCuVtagxAipW4wr13MQmnezoYeGQ9FtirC3qiAe+fpZIfop4CGh6pSxvTOL7TjfBTiAqzF3sdSXY9TWxWxB0dbG5o+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020294; c=relaxed/simple;
	bh=lgfx6GwDKoZM/4nC7D3oRCk62Tejbqlai0EzUVs5XgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNzP2SlAlF+1u9ltbJZ8IYaiskN2rziMSVfNjCETxz5EmgkC8Epl5urbg6QepRHwvhZZIjKwsoGq6MuXTGzvyMLLGwZsJSvvdWiRe+uhEL0h3tp1UOaRN51CvY7FPxZIhlzc/5DxEoPBqD/axidjQU+PH+xbt4nWt2mmgrTJ1tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xcvxnSkS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d3e44b4613so1311577a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 05:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725020292; x=1725625092; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Id4w7NNA8moHIg99Nv0TMFKrSz/R2qoiMO7qyLMBeaY=;
        b=xcvxnSkSNV2bGEdDuLKWfaYlLe22K5tM9e9qDmoMdsLbHY4HYA1B0BoeOnqKRqhxDd
         JRu9WL7R3Y7OddTAE22H/JrbpwUemDcrnHaz0uTjgdkkI7HLnh9GNlJdacGtodiAkqZr
         noR6jjeShDZe8chM+3kRn6zHATmII4LRfl+u+cNLuCu+9sBgF8k2pRSLVH/lWKbEWDNG
         EKdO+KJK8dKKWQvUp/yKe3Kq+AZRuJ/y26zOllniRa4IBakxKjWYAheMmCEKD0nJsSd9
         p/duxEkLFF/VRImt04LCGU4lfMZiGu7BD3y8ebt+tQ4EPBnZ0qP9RMjcmSIYw3J81YYg
         vmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725020292; x=1725625092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Id4w7NNA8moHIg99Nv0TMFKrSz/R2qoiMO7qyLMBeaY=;
        b=Q1itoi2ct0NsRNrx374KMp2P9t6SV9leHcqjgxnqWUjklpNBa0DqqrbiQg0yN2dnwu
         DGxdji3cmrcyGe7YGdiQTW45upgQifGuu8KpWEozGcxvqS9T2Kf4Lkq259FJyCUjpMs2
         jK73jumvdsrHU1Q8rtnjEYKscfkRHXdSnnTOAPOX24I2i3jQCtdsbqLHWKRpdzoOT/9l
         Az4p3vJOz9xVyrQ8HNKy/o6fddmaHlQAqXOW071lBAoC5Mt2oNOHaSXBTacIZtaP96fq
         wWbUwt+lbupS2bXoh+6zFaHnQYsw+V08OZ68MXg0u0bd58GOKBan1GFkqjpxWEmJm+/d
         bqYg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q/DoYQ8yNpeqJ3XDVu8hUyNHXPA/lQ+ZfO/L4PVMDCMJp1p5mUyxV7WJTTEIdGhn8oXhc7JqCRJ4kNmb@vger.kernel.org
X-Gm-Message-State: AOJu0YzP0xdkr6BrpD9rmnSQJwxULLFq63WT2Iwrd1I097pN5QpT8ZLD
	3MTWPpo4Dr69dHCG3C4IBqLCdk9n4UtGkEwKE+XYwUd+qkFBWieS43NWH7aMr725dC3/e4c9RJg
	=
X-Google-Smtp-Source: AGHT+IG5/ZWFAjSG6uNdUFmC0sk12wJugx6UZ9BZD71Ucu4X4w99uOTL+UHPQZ4ynSm0cGmDA4y3cA==
X-Received: by 2002:a17:90b:3e84:b0:2c1:9892:8fb with SMTP id 98e67ed59e1d1-2d85618881dmr6007999a91.5.1725020292391;
        Fri, 30 Aug 2024 05:18:12 -0700 (PDT)
Received: from thinkpad ([117.193.213.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0ffce5sm3663374a91.3.2024.08.30.05.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 05:18:12 -0700 (PDT)
Date: Fri, 30 Aug 2024 17:48:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path
 for Foxconn SDX55/SDX72
Message-ID: <20240830121807.noxfo6fy2nsd4ohi@thinkpad>
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

Applied to mhi-next!

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


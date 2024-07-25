Return-Path: <linux-arm-msm+bounces-27006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5493BB5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 06:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8101F219A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 04:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB78717C91;
	Thu, 25 Jul 2024 04:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKuNOcqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8671758F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 03:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721880000; cv=none; b=hGUOinEfeyIVmeSigU8Sv89NNcZbUF1dMok2yU0n3i9XZT3zK4Vw6vATYVUIQXFVS+TIuug7Srd6WQZaLEp3dSr4xrSba1uom1iDiVPRRjHv0dd+4Omn5W7LU7C0aoZMnWwwiUInt0ca37CjGQsiHseihh+RAM5MWRnoRs2LqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721880000; c=relaxed/simple;
	bh=rk66/rqzhkPoV2QLLxcJFZD6M7EVmlzgLKOeZcNT5T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jl5hkwoX0FHCYOV/Tzm1dP4vHZ6zJWo3o+tcRAFK9gZpPhuWGn8LysJoQ0nx4vj49Qn21gBK3u7peGpFcsV61C6bfqnKKuXqzDte91/8PuSybesdiGYeDmyKnDw1pN/2/toOsyAGLthQfdmJagTp55UrwbOjF1i61DlKKzGm4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HKuNOcqj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc611a0f8cso3666405ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 20:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721879998; x=1722484798; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rHcZx2GC/cLELT7bHwkzIBGxphqrx5awAaW2kc+oR08=;
        b=HKuNOcqjT1ANrc5B7Cbpvr1WwaOzoNC6fvi37lANw6PR+wXQYyyXDHQZ+GuQzk5hVe
         1irf0w0N1BKc/0D5UlK0isuo4radCmlAC/K+d5V4ZcD1vYOvlyBOR/OO1oY/uzzOEZ98
         nNqd3pr2dbd6TXby7gWKo+1eDKdPz50ijYK1NUyHOt+1SXcTfzo9bV0skRvd+Sj59jIX
         Ujjzv/T/tumCy0etn24vdp/s82+lCBXkorw69EV7k4SVxomn0D+eKqwvlqyGOPC6Icgr
         /k57q1/vDYXIs2fEf9LaxSik30pvpnT24pcEjz6adjRuGqqJs+g1iw5NsleoScUVNGB6
         E3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721879998; x=1722484798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHcZx2GC/cLELT7bHwkzIBGxphqrx5awAaW2kc+oR08=;
        b=pEQ2kV64G/c6HXgdersHI/pcnqGJ7JKc2s2gzKi27dkr/firYfS7G76cohtfA8pqTH
         yHcPv6VTK0zmDkz7CsV8/dhVd2mal4q2Gyv3sO+v9voh6mSc40bgZzrxSakCT1lxp/CM
         7LXX3p7t4AbKi2n/SEmC2ds2HuJZZjKGCerNtRT9sAJHkPMaY+qsd4ztp52QwZ83AmzT
         UMUvoGglfX9bvybFoJNIkWpurvHkV2kEopGcB8uyveleH2ERhVYihpDPcupf4Dt9I/XM
         3Seu9N1HqdP8imISafliGZ5o3KguK3lOXrtisS4XVzB9+Sh2IbFqq1RkExlXl/OyifgG
         2yEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGf1vQhjtnN7qElrVNOczDxgBS97jQxq+U8NEku6JTYpmesHnlAh0sD/9SgqiCTzNPpapXTkxl5ECFYqztlCYxs83kM2BVTheHry7MAQ==
X-Gm-Message-State: AOJu0YxPWhNun9Vd9r09O0a4bB7xuuC4RkXmvN/sDBsfbKHHM35LWoBQ
	3Kq91DjRUGvEEm/0F9DONrijl9xVeRolnyHTdxG4p4rcsPkMT6A/GMAuaAC0WA==
X-Google-Smtp-Source: AGHT+IEaDi+BtDwssOplBvIcSv4l24dycsadnULUO1j1JwRC3JvSxlkzIS6ar2Yofkamxzyr+Xu2pA==
X-Received: by 2002:a17:902:ec91:b0:1fd:8904:ecf6 with SMTP id d9443c01a7336-1fed9259301mr6241935ad.21.1721879998304;
        Wed, 24 Jul 2024 20:59:58 -0700 (PDT)
Received: from thinkpad ([103.244.168.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c8cd90sm3694515ad.44.2024.07.24.20.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 20:59:57 -0700 (PDT)
Date: Thu, 25 Jul 2024 09:29:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] bus: mhi: host: pci_generic: Update the file path
 for Foxconn SDX55/SDX72
Message-ID: <20240725035954.GA2317@thinkpad>
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

I think you misunderstood what I suggested in earlier revision. You should add
the Foxconn specific fw only if it is different from the qcom one. Is it really
different for all these modems? Otherwise, what is the point of adding them?

- Mani

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


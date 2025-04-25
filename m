Return-Path: <linux-arm-msm+bounces-55558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05CA9BFAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65973B37B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99EE1F4CAC;
	Fri, 25 Apr 2025 07:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrFCN4hA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5D735963
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565719; cv=none; b=XY+GeZ2zADCWenZkKxKPP8vDn0VkKyIxXWKdkcJihGI6F+uc2x44kU1gfoLFF9FdvdoVp40s4h5cOZ9ojZhcsKHC6/N3QBHtq6sZmKwl+OB0ouSYOinSH+hzMX9pro/gPa4u0o28qFf8M1Vgw2+BVhuEbXoETH2GbjT0SiwH9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565719; c=relaxed/simple;
	bh=OVYLMqdeN9JePfZ+3tRyCwBv8IW+C3j3nRU2YOal6To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khsHYk97fLY5KZ9zLGyAxo/0HJBaDmg9XospP2C9N9ujtjq1A1vDPihDEfFBhGFfSyOL0s1PvvVJpWo9sboi2hQDc0z0qAyfZuW/sarG4i0vrRRaz7crDuMSlsDOdWaMLMTRu5fbgS6Fi9xwpDlCIOufHlAymInxRzG0Eqq+xUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrFCN4hA; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1710368a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 00:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745565717; x=1746170517; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWmw/e+yp+buQszRg7iMmind/4WdatLNhW4iVUDUoLA=;
        b=VrFCN4hA59a+u3KSbi3pRnaAKrqu51BpNfoiFVVm5FieQwfdDrUlTPPGkZafuuNjhz
         meTagkesb31xSagSFUTI0ca1Gkd7E4EAQUUV8DNDthJk9RErl9pDmQGI58qv1kTGeFKk
         NPAnqmXD5Ryy8QEv/2Hw8qxAx0d3uz0H7O7XILu9c9vn0BQu/BPUR9MzTq/MixJunWIz
         Mf4KDlq2NBOonvjjT8ILuMcNlAEeA2iNjuAoE55ibqi2PcxOg7Rk3XmYqnBzS86fSWDQ
         MFvpOmYdLWIgruODfp1fk1iVvRwd2puoBkYnyWEfyIpGf4Pz37mD/ud5OyMej8dz7pfC
         LDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745565717; x=1746170517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWmw/e+yp+buQszRg7iMmind/4WdatLNhW4iVUDUoLA=;
        b=Nn7y3Wl49AAQvIHJIpOWp80rHldhdb/LViEfkV6GXzW3uHvH+R/KpxuYWV4NuzgS/D
         gXOZsbijis3Pnd2Rjbc4wcgm2yM04X3shNtY/Y/MuSD32DKPAu2TYH4gNaEMEK/46dzM
         9nohzN31hWMFQ6t89Zubr4o+1M5Y4FavpsKqNiB6GTGotyKZkBumTcoDkhxssp31qEN1
         NSl7HedZLwfv58+D6QVnSaczGDIg3amXc4kI2G1vuBZTYXE/wChR8KDUKTwzHOQHLmMr
         /NM29gNb0gf6hRflAJIpuCzXgI3sueqPFU9KgEBOnVPWaQlvPHTF3ue4vDVJ+VZ+/W6H
         3C/A==
X-Forwarded-Encrypted: i=1; AJvYcCUewNIsUMjEwz1Dv3fYLUifqb7g2r+QUTKQ8N9plZXZsgpKbg8vbqorHYdrp6pwavykCxPAFOrX0m9Aj4I1@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjbuCLnO6W/O7HqHZwk9GOUJNL8C+sX86JgyHeyPACuM6RYJc
	pRW6NcRf3NUURUZwZShPmsj+bO4XP7hrIYVODUDBbjyMk0bnFnj/VJuydca4E+ucPAHxqYbqnFA
	=
X-Gm-Gg: ASbGnctXS3UVITvPYREHnVqCAzqhsh8SVLcV7a1QldwmAzaPsBgO0WFxiMcIk4WzMSF
	z3px487HGHiIODmx3MYwlJuvfKxDAQVv1jL37N/0dkJWUbvhrI0oSPtp32hBjOBw7EH4IlA0fI2
	CTRktYu3lizHvqwwqcc/OspKvcnQLtvoBwNgL3op2fjUz1x1tqSVHMTUStOco25dHOmOH1Ms4Jp
	00LiO0731zZ/5qcoo+LPh9k19+50UBeA7C0WjCJHQT+6qi1mtVudWc6QPa+7s6MkIANzo+uBMGk
	hHpXmkVQBMyGeZ4yhRuHs6xJ6sLha9l29mgtnmPEcdOCJTBsYsQ=
X-Google-Smtp-Source: AGHT+IGCzDfSM+rX6rCv0LKlVKN7HheXt0gu+Ub5Tjp8NB3SBL++anF8IgmYvWuP5Dts2OoziFEWdQ==
X-Received: by 2002:a05:6a20:7f9a:b0:1f3:1ebc:ea4a with SMTP id adf61e73a8af0-2045b5f604dmr1773723637.20.1745565717217;
        Fri, 25 Apr 2025 00:21:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a17csm2523876b3a.111.2025.04.25.00.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:21:56 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:51:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN920C04
 modem support
Message-ID: <zuyh7fso5f5cmbdez3gt2s3vlmwtzo2wtojirdzq6br7mbaecu@qu7dtmc4xmip>
References: <20250401093458.2953872-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401093458.2953872-1-dnlplm@gmail.com>

On Tue, Apr 01, 2025 at 11:34:58AM +0200, Daniele Palmas wrote:
> Add SDX35 based modem Telit FN920C04.
> 
> $ lspci -vv
> 01:00.0 Unassigned class [ff00]: Qualcomm Device 011a
>         Subsystem: Device 1c5d:2020
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 39 ++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index efe43592e170..57e2360c397b 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -782,6 +782,42 @@ static const struct mhi_pci_dev_info mhi_telit_fe990a_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_channel_config mhi_telit_fn920c04_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static const struct mhi_controller_config modem_telit_fn920c04_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 50000,
> +	.num_channels = ARRAY_SIZE(mhi_telit_fn920c04_channels),
> +	.ch_cfg = mhi_telit_fn920c04_channels,
> +	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
> +	.event_cfg = mhi_telit_fn990_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_telit_fn920c04_info = {
> +	.name = "telit-fn920c04",
> +	.config = &modem_telit_fn920c04_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +	.mru_default = 32768,
> +	.edl_trigger = true,
> +};
> +
>  static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
>  	.name = "netprisma-lcur57",
>  	.edl = "qcom/prog_firehose_sdx24.mbn",
> @@ -806,6 +842,9 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sa8775p_info },
> +	/* Telit FN920C04 (sdx35) */
> +	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
> +		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்


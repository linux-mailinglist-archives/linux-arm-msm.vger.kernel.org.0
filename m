Return-Path: <linux-arm-msm+bounces-24812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9FE91E542
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 721E31C2149A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 16:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C4816631C;
	Mon,  1 Jul 2024 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTL4ZWXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5916D4FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719851134; cv=none; b=gVk9oUTZs9y7sHoCsr67L+3b1Na6XNSuHsVWdCGGloU99+t+P/SyESros2nYMVYmeMbnzdqQQSQSbFIFJhM5bz9WOXNw5xKPU/vIUP9DMybYfjZlZ6nCpsg0Sj6igTzFke57SZqVTS0rLNyXrNcV546DBVlhOx9ISKxEUU6nojg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719851134; c=relaxed/simple;
	bh=XDu/zULtFMJ3ubnoRSGQdHATwdrFiKjInl6qOvhSlYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=USCbFNEJF4An+TeQVjzN25NySRuc4j0fczk3bA5h3hHXmE1m6/JuKcntYX8YHpKN5pLkSc/9Jbu1rnB76D3RxYIE5BAbc15DRdDHIbxzAtAF9UZW+LxvXlyqNOedO1Bl3ttzGu1abNHRqlxh034Lm9kMEd3DwPt9tvX6uMGEKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTL4ZWXz; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d846837408so195886b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719851131; x=1720455931; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QykNWiH+wRG8kjVO3tnbHTnsuvhtcPFuk3wpjRJiWvI=;
        b=QTL4ZWXzJUwYQ+cTibi9qWfTw1pxEQjWoLAL/SChn6JA0miDhHQihYCeogFjWoTBiG
         LYOyfA5l9xSXOFmvs9iG8b8X6yMtOW3An00mTjoAYzHexze5Z3w113YcbjLhEdhS9fCr
         YKBLPscxw6PaYLQgEPQI3kdtu0WPLBwFada7oSQz01hA7ANn3XlgQ3BTb3vALym0n8Fa
         4DHCili12K+7dSMvhiDeXsRj2S73AxntfScfJ8DkTejIpQCUsLaCCFJZtb8DI90fhaiT
         GV85O052HjQ8b3P/mQ5ySQyRCirFDujGJ8sVVj6jwARRXM9mipU98Ze+hv3tgeJyDCX5
         WPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719851131; x=1720455931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QykNWiH+wRG8kjVO3tnbHTnsuvhtcPFuk3wpjRJiWvI=;
        b=RO0fx7GcYBW0SAaUKaoLz+F45Xz+43tpSzBKBK27ht4RdPEFoAJbcR5Gru7StWzOrr
         I507MT9hREvQKk3gPrpaJ8HvyFkGcMJgb53cgFYwIvcbCSLlBK6lTeSiXKsg919UcC1q
         dTqGmokgWfDVTbZ8k0HYcXQo9HSa6K+3CQRQYBZx746he/Xtll/fZFa5BkErcvuusXOR
         iyW0eDWIFwhaYzfKQ+h+54dcqn5C/OWRHxSuCGmlU2oajhbx1y1plnevmOaydh/qdPf/
         VZUp5i3kqgtOCyUnIuLpe/k3oeNTSdEwkoI2qpi475rt73FZLgcmf8SMYB5wLFyw56rp
         Lq7g==
X-Forwarded-Encrypted: i=1; AJvYcCXC7F3ZZzTr2QDUOotB4ZQjyNPjyK/5OQJeK0azbGpaEQCuO+vSPkbuwCnBbUKgAa+EagobqAQjQqZ7OLbOVUseDS9I9jl6W4vAP3YOvQ==
X-Gm-Message-State: AOJu0Yy3sou/sA+sQbZbtu5wVzCY+iomD3QhlBQSdYYC//dT2HGHRbF3
	TLO1f2hTyasGTAQaxjGqeLd01P9ytP10UgsJ7q3pU9s3pO3YE/bwgIuQlsZH4w==
X-Google-Smtp-Source: AGHT+IFg2hBkT1DtGiTlxRWpXwmILRxn6yyO/VcGgIs2uJ+We7PMQdTwOt9t0CH4OW/Vn3qq11rVKQ==
X-Received: by 2002:a05:6808:2011:b0:3d5:6332:7077 with SMTP id 5614622812f47-3d6b3c86b03mr9116638b6e.33.1719851130016;
        Mon, 01 Jul 2024 09:25:30 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7080246bcacsm6722521b3a.55.2024.07.01.09.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:25:28 -0700 (PDT)
Date: Mon, 1 Jul 2024 21:55:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net, quic_jhugo@quicinc.com,
	netdev@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240701162523.GC133366@thinkpad>
References: <20240701021216.17734-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701021216.17734-1-slark_xiao@163.com>

On Mon, Jul 01, 2024 at 10:12:14AM +0800, Slark Xiao wrote:
> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> And also, add firehose support since SDX72.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: (1). Update the edl file path and name (2). Set SDX72 support
> trigger edl mode by default
> v3: Divide into 2 parts for Foxconn sdx72 platform
> ---
>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 35ae7cd0711f..1fb1c2f2fe12 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
>  	.event_cfg = mhi_foxconn_sdx55_events,
>  };
>  
> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.ready_timeout_ms = 50000,
> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> +	.event_cfg = mhi_foxconn_sdx55_events,

Weird. Why this modem is using all SDX55 configs? Reusing is fine, but it is
strange to see only this SDX72 modem using different config than the others
added below.

- Mani

> +};
> +
>  static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.name = "foxconn-sdx55",
>  	.fw = "qcom/sdx55m/sbl1.mbn",
> @@ -488,6 +500,28 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
> +	.name = "foxconn-t99w515",
> +	.edl = "fox/sdx72m/edl.mbn",
> +	.edl_trigger = true,
> +	.config = &modem_foxconn_sdx72_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
> +	.name = "foxconn-dw5934e",
> +	.edl = "fox/sdx72m/edl.mbn",
> +	.edl_trigger = true,
> +	.config = &modem_foxconn_sdx72_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> @@ -720,6 +754,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* DW5932e (sdx62), Non-eSIM */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
> +	/* T99W515 (sdx72) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w515_info },
> +	/* DW5934e(sdx72), With eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
> +	/* DW5934e(sdx72), Non-eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11e),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
>  	/* MV31-W (Cinterion) */
>  	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
>  		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்


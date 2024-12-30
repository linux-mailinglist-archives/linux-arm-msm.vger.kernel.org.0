Return-Path: <linux-arm-msm+bounces-43647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A525C9FE6F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:17:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3C453A12E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355141AA792;
	Mon, 30 Dec 2024 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ln4A1LGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D541AA1CC
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568212; cv=none; b=LI51SckgtMgeMJdcHmjG/8el/Nh15djari98m8nzf3au89MiCWu6mMqBbJvcFIy8nehBbXr/7QkE1Q5m+wQMYMiOroksKT87t9unFQbY66nO4QHx7l2cNKA6VrhUi7w3md4GWPDKAISy99UVI0PPyfb30HU3EgA7cpuk4ZsElBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568212; c=relaxed/simple;
	bh=NAWkcRz1xJvoL/sqhfndxD9TxOxRRagPFi1Fdfl4XzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARwZYyb4uRMFpMFV+FXeipvVF+pgNeCUYpwZWHtqKopJtBAYnAKp6+qouPCEbMRUqM9u/f2N8f2p6NswQvSxq1N18N2SG+xIbKzz2KqoeKEYcS5AFIeUBj7jhFL/m4iRIOrttvrzfY1K44AUbycMRswBDp6h+AGN/67rShNgxaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ln4A1LGS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216426b0865so116574155ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735568208; x=1736173008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hlJ+Uw90GU7HpevHe+ix+w6zDzPdLCzEUyg3wlqdmAs=;
        b=Ln4A1LGSP5zwe7A+2DJEG8RpOnZEXfg6fvk/9FOXa2u8RgPzwsaX0kI3uwfvttqPvP
         Eo/MBTz3cYNFiawrB1w6wVWWir/IhilG75l40mLc1oan3u1YhWEELTOy+FyoXupWMACl
         FB/DDvnJC4aU3wp55mZECz/wm2lx95oev+VYIg8zjWuOxYYPqxpZ8fuKwwd2bCr8qDRT
         bdm2Vn7c+DT/IBUBeB3fYhuMqkYNlaBu0ptitXSRQM7XEmbwgKQsh8MmUX2Wtdm1zQMA
         IXS1/zTlGFUtQ/IAYn+GH1InTHKDW1wyBQ+/0hndIxa0xZjNlF+3DcCoJly0A73zoPdE
         2dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735568208; x=1736173008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlJ+Uw90GU7HpevHe+ix+w6zDzPdLCzEUyg3wlqdmAs=;
        b=w7omrVrn3MUhT/8KYpHlkeZpw6B7Jl52kQe3WDGCd3cIiTXpZ1saY89b1g6hIoUR/2
         MkoPu/wGqXRUDrBCjq5nQilQfU2e5Q3yzrRvEHmzBMd449S2ga+ZEplryfjxfftWhvxW
         twC4YCmaLGf57Aw8NuT6oYo61fsxCTb3wqrj5bI/0kBQsGNuHFD49Q+UgukWDQQIUDHh
         6wm2pCpqyCOxNrvLgn4A7EczNcisFOEORTP/nNKqziOY/f34KiStys6kLn26/fhFaMW5
         OroQD245PUdrCwDn5MfQvkHcZQtLoUMNgrZJu99rwMa8b1Q6uOR0D5OI54/lZMbMwG84
         7QsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOIXf4XnFM9hBPDjqlh3VF2zoL89PSXs0K5cIDw349USqPwuKL64vxe/ZgFIEMYJ8r/BRx1Vgr+QZKs5Qu@vger.kernel.org
X-Gm-Message-State: AOJu0YzCa6hz7ybRySAHPYzlZ59+kAg9Eqjh9EDW1qIN8USOE+oqssaC
	ZK8lpUPEO4XNaVxhIdGVxRf9BB2kXfOftdmyL+6tNftkJnBtFaw1bt1Z5bPiVw==
X-Gm-Gg: ASbGnctXIyNxS1ibrqYI8J4com8Uk23ilerPIjrd7UPXlcafiUk5nLTkkHc/p0pOZ5t
	FwrbkgL9NfyHcDg29EX5+jpvF0cspoawiw/UHaThknG7EkwpeWp78UAB5Pbpktfa7KNLwy+2JvW
	93vSltY2MF7tdpDe9YVZdVJLAjYazlztdDxatHoi1juj6aW1PFoX/7EOtMzwakZ33dVbIQHNJAy
	2m2V49mEj4pWMPuvfaAQFayqCXAYLK38BO6Mhnf5tgdCk1uegSW6xji9hlBFEq/3ImM
X-Google-Smtp-Source: AGHT+IEH1T6+Xnl4CvOerewnKkb2WUs0M6/CSQfags5VwkKN1m/zh8Wl4svgUoMVEO9UpRjhhi15EA==
X-Received: by 2002:a17:902:ea08:b0:216:84e9:d334 with SMTP id d9443c01a7336-219e6ebca26mr452680235ad.33.1735568208212;
        Mon, 30 Dec 2024 06:16:48 -0800 (PST)
Received: from thinkpad ([120.60.139.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca0282fsm179322425ad.259.2024.12.30.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:16:47 -0800 (PST)
Date: Mon, 30 Dec 2024 19:46:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: quic_krichai@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] bus: mhi: host: pci_generic: Add support for QDU100
 device
Message-ID: <20241230141643.rkbaway3dwlwwbhm@thinkpad>
References: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212-qdu100_us-v5-1-3349fb23512a@quicinc.com>

On Thu, Dec 12, 2024 at 05:27:27PM +0530, Vivek Pernamitta wrote:
> Add MHI controller configuration for QDU100 device.
> 
> The Qualcomm X100 5G RAN Accelerator card is designed to enhance Open vRAN
> servers by offloading CPUs from intensive 5G baseband functions.
> 
> Link: https://docs.qualcomm.com/bundle/publicresource/87-79371-1_REV_A_Qualcomm_X100_5G_RAN_Accelerator_Card_Product_Brief.pdf
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> changes from V4:
> - Updated QDU100 VID as per order in mhi_pci_id_table.
> - Link to v4: https://lore.kernel.org/r/20241209-qdu100_us-v4-1-f9010b2a09a2@quicinc.com
> 
> changes from V3:
> - Removed IP_SW1 and IP_SW2 support currently, will add once
>   SW_IP1/2 channels support are added to mhi-net driver.
> - Removed qdu100 edl images, as EDL images are not needed.
> - Added space inbetween kernel_ulong_t and mhi_qcom_qdu100_info.
> - QDU100 XBL FW images were pushed to linux-firmware git repo
>   https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/qdu100
> 
> changes from V2:
> - updated commit text.
> 
> changes from V1:
> - Changing naming convention from modem_qcom_qdu100*
>   to mhi_qcom_qdu100*.
> - Updated commit text.
> - Fixed and corrected by passing mhi_pci_dev_info struct
>   instead of mhi_controller_config.
> ---
> 
> ---
>  drivers/bus/mhi/host/pci_generic.c | 55 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a71c9277356e962252b840379cd81..aa5118dbe2e5de3f3d13a168ebe2d3d2d5930295 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -245,6 +245,58 @@ struct mhi_pci_dev_info {
>  		.channel = ch_num,		\
>  	}
>  
> +static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 128, 1),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(9, "QDSS", 64, 3),
> +	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(16, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(17, "CSM_CTRL", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(40, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
> +	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
> +	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
> +};
> +
> +static struct mhi_event_config mhi_qcom_qdu100_events[] = {
> +	/* first ring is control+data ring */
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
> +	/* SAHARA dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(1, 256),
> +	/* Software channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(2, 64),
> +	MHI_EVENT_CONFIG_SW_DATA(3, 256),
> +	MHI_EVENT_CONFIG_SW_DATA(4, 256),
> +	/* Software IP channels dedicated event ring */
> +	MHI_EVENT_CONFIG_SW_DATA(5, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(6, 512),
> +	MHI_EVENT_CONFIG_SW_DATA(7, 512),
> +};
> +
> +static const struct mhi_controller_config mhi_qcom_qdu100_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 120000,
> +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_channels),
> +	.ch_cfg = mhi_qcom_qdu100_channels,
> +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_events),
> +	.event_cfg = mhi_qcom_qdu100_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
> +	.name = "qcom-qdu100",
> +	.fw = "qcom/qdu100/xbl_s.melf",
> +	.edl_trigger = true,
> +	.config = &mhi_qcom_qdu100_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
> @@ -742,6 +794,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
> +	/* QDU100, x100-DU */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0601),
> +		.driver_data = (kernel_ulong_t) &mhi_qcom_qdu100_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1001), /* EM120R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QUECTEL, 0x1002), /* EM160R-GL (sdx24) */
> 
> ---
> base-commit: 28955f4fa2823e39f1ecfb3a37a364563527afbc
> change-id: 20241127-qdu100_us-abd7d1613c8b
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்


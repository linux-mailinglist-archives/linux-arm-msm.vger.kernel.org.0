Return-Path: <linux-arm-msm+bounces-21703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AC8FC352
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3818C28710F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 06:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA0421C192;
	Wed,  5 Jun 2024 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8oPOHTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D80157A47
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 06:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717568116; cv=none; b=E0eZF4p8r/RjxxTOCaSJ9i+brfkjFyOxIt14VzvE9kR5ke5Wf6JX4TLAzfj9m/HC1dyKa7QVuXpzu4v8rBmFEWk0m68n2whWbeGKwkdt95GXZBkBYpkQYWS/zEqBD/p2FZl4I+qGn+ED217r8Vn7G4WjQsWd5ZjRlUAc/75PlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717568116; c=relaxed/simple;
	bh=FH7/CdAzTjPVb3HTxwH4Z482YZ11x8BQKSxl511snAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBw1AigEV5b29ZcoWW8kn/fuEEUl9G9a7oUHgItr30qkG6x1RKA6wNAFytjnIhG2N2FD8iGTBGZyPW2lPfmIppqd/9J7d6mCCN3D+j9Bt5DMmytHMAWsKfWXXvl+cWZtcXd5KPN7Tkr6qRhYQVFbUFsOY9zAVfmAmDh52wFT9t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8oPOHTN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f62a628b4cso43137245ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 23:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717568114; x=1718172914; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAu4SgsSJhhPH/cgZne7lMMDfMb41rkj8xyePWbHmPo=;
        b=X8oPOHTNrZkqgvJYia/UOaE+4QRj46MFigwWTW8EO1dorbx69zgCnwF3snApkx7FE0
         UuKqT9YCQGO6yHpJKbHtTjNOoNw8Sj/hoTojvuoTZ+QtixVNF30RwzULaXZSliNGo2mF
         YAGzMbwX2ZvVb5irgkQwUjpMiWSjbOwEwGNYZcFuF3x0Q2UML7JCjL7xMD5QtXupofet
         9INZAJnpTa+1tJj2PJ7Sc3WG4SpIdPRuDA/GBnK81cy3vkCdF1Pt7praMYE8BbL5Odzj
         //X95EvCcoB/COnwN6sioeHx/rJB9sX8ar2yUkJjBbeq92I05drcp77XRwYtJsaoAxTF
         ga0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717568114; x=1718172914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAu4SgsSJhhPH/cgZne7lMMDfMb41rkj8xyePWbHmPo=;
        b=JHRb7QZwMvWvP6BRGEPU58etaJ6HHjHLcuHHu+AMaMBs78B8el+PAdhwpiFMeQqr96
         IJ2aj9t0/mJfAQFiRRcic+ks/T9ggmc14mlmgo3rYdMLf1EjWJLaBUHzQmu8STftpFzU
         CiEoLRo9oLwFiOVRYXUvRJlL+iqTS5A79sl5N2zM+snjkDrTEd5hQ282n6JNi+Rqbfx/
         h+y8/QZPcCvHYIUto+8zgmiP8Hk1A/HfwWguL7qDh0p2G+RC5WogfreBSS42bValqo8r
         p3QTKkOhHuwnT/VHvo1P3bM0+dF9/DpVzQAufGimtBXciy3EPI8QgxFbjH6lXaAnTIqU
         9lMg==
X-Forwarded-Encrypted: i=1; AJvYcCWWmMTHJzfWXf6B1ga7MB7OtBzRxqSI+Z4CGE4D9yCdkuqu/ld0tta9miWFEoJb677JGyWxlwoalGLkJg0vtQQXh3k/w23DiwPxfG9j9Q==
X-Gm-Message-State: AOJu0YzaIOOhQVOy4QRGvKrCnLkaqStD3KTNKzVRE1btEnLz0+K+mnqz
	IZrp0Egk0WRujRE+WzTrFb8aYpYr+Z4dXfRojjiLVdBpltXOJn1Z4VNaU0rQXg==
X-Google-Smtp-Source: AGHT+IH1r98BP+YeyFiil1aj9qCQowl82TMcJ/FFFdyHro+wBM2epKCpN9R5EB8uhJBH88SsvEFIsw==
X-Received: by 2002:a17:902:da8f:b0:1f4:8faa:cd68 with SMTP id d9443c01a7336-1f6a5a12e06mr18071135ad.29.1717568114029;
        Tue, 04 Jun 2024 23:15:14 -0700 (PDT)
Received: from thinkpad ([120.60.137.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232e0ddsm93673055ad.51.2024.06.04.23.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 23:15:13 -0700 (PDT)
Date: Wed, 5 Jun 2024 11:45:08 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: mank <mank@netprisma.us>
Cc: "duke_xinanwen@163.com" <duke_xinanwen@163.com>,
	"loic.poulain@linaro.org" <loic.poulain@linaro.org>,
	"quic_qianyu@quicinc.com" <quic_qianyu@quicinc.com>,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add support for Netprisma
 LCUR57 and FCUN69
Message-ID: <20240605061508.GG2417@thinkpad>
References: <LV3PR22MB5104C27AD25D51B08C455B6CB0F92@LV3PR22MB5104.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LV3PR22MB5104C27AD25D51B08C455B6CB0F92@LV3PR22MB5104.namprd22.prod.outlook.com>

On Wed, Jun 05, 2024 at 12:53:31AM +0000, mank wrote:
> Add Netprisma LCUR57 and FCUN69 hardware revision:
> 
> LCUR57:
> 02:00.0 Unassigned class [ff00]: Device 203e:1000
> 	Subsystem: Device 203e:1000
> 
> FCUN69:
> 02:00.0 Unassigned class [ff00]: Device 203e:1001
> 	Subsystem: Device 203e:1001
> 
> Signed-off-by: Mank Wang <mank@netprisma.us>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 61 ++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 08844ee79654..e2b88699ce9e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -26,6 +26,7 @@
>  /* PCI VID definitions */
>  #define PCI_VENDOR_ID_THALES	0x1269
>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
> +#define PCI_VENDOR_ID_NETPRISMA	0x203E

lower case please.

>  
>  #define MHI_EDL_DB			91
>  #define MHI_EDL_COOKIE			0xEDEDEDED
> @@ -606,6 +607,60 @@ static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
>  	.mru_default = 32768,
>  };
>  
> +static const struct mhi_channel_config mhi_netprisma_lcur57_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_netprisma_lcur57_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static const struct mhi_controller_config modem_netprisma_lcur57_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_netprisma_lcur57_channels),
> +	.ch_cfg = mhi_netprisma_lcur57_channels,
> +	.num_events = ARRAY_SIZE(mhi_netprisma_lcur57_events),
> +	.event_cfg = mhi_netprisma_lcur57_events,
> +};
> +

The config looks similar to 'modem_quectel_em1xx_config', so you can just reuse
it.

- Mani

> +static const struct mhi_pci_dev_info mhi_netprisma_lcur57_info = {
> +	.name = "netprisma-lcur57",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	.config = &modem_netprisma_lcur57_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
> +	.name = "netprisma-fcun69",
> +	.edl = "qcom/prog_firehose_sdx6x.elf",
> +	/* FCUN69 uses the same controller configuration as LCUR57 */
> +	.config = &modem_netprisma_lcur57_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the last entry */
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -695,6 +750,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* T99W175 (sdx55), HP variant */
>  	{ PCI_DEVICE(0x03f0, 0x0a6c),
>  		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* NETPRISMA LCUR57 (SDX24) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1000),
> +		.driver_data = (kernel_ulong_t) &mhi_netprisma_lcur57_info },
> +	/* NETPRISMA FCUN69 (SDX6X) */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_NETPRISMA, 0x1001),
> +		.driver_data = (kernel_ulong_t) &mhi_netprisma_fcun69_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.34.1
> 



-- 
மணிவண்ணன் சதாசிவம்


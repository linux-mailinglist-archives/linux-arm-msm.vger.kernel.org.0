Return-Path: <linux-arm-msm+bounces-55533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C631A9BDB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1372927666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 05:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CD31487E1;
	Fri, 25 Apr 2025 05:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DSYU8inA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8BE19BBC
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557254; cv=none; b=MUYrnKtmAVhCC31RHTh3NwJtEJTT35OGp+xhKO8RslxDTawrRzBwM6YToJTSCl3Dbwh50SiSSPDbPkzz8O9EKNdw9w1mL4WprFGx0cpuLgJoaoi98/7cjLZfVi9YquQFo45m2ErsO3iDg4drDO8aS/WFKfNt0oyrD8oatvSSqy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557254; c=relaxed/simple;
	bh=jsRsBQqqYuTiofqMBPr9zN2f/zxOJI3wwSvBcHgiFh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgtNFDaE2H3zEBrNeNyQ6pZ9rnSC3Z17nNJuvSQeb3rMuc29vok0H9U/XivUKNnmVnPwu7ltslB04oJJwqI+iCdly3EBft3J72Enzfd9vTcpAwOwY8GgasrUiPJt8CU9SDQeUKcecm7kiQq8Vwh2xtse2JH1p8PZDLNwrEuCZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DSYU8inA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so1190311a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745557252; x=1746162052; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bWUQw7BF6qOFvrmK64yOAiyAfdhX/yyNlejjZhluoEE=;
        b=DSYU8inAH2BC3U7L0T9wGB9YJLmFw39y3odO5HV+O3DwkWu/FZLOeq2X2qwr2Qe6KS
         qhVkuR6JLAZfFNUWAw0VkBpQk63Pi/q7tvYACmclQd/XUxenFkSGHS2PcNa7ZFQQDpuz
         +LxkbibJk+NCekEbwrzrm39k9jDUUwrFT1WtQarRLJM+Wrtz149kMPwrJc+T/eK4fdI8
         kX3ECCyJnBjBEWB8gntAGa8kJ5Vx94KNkvdpR3rdMXum1Rm5Jnl96sByxC4zrhqdkA4x
         7rpriQCREvmEPVzpeUbUYr488vWXUwvRaQR9M9A5VFRec6mRStUBfWLkirGUbF2fuBpL
         36Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745557252; x=1746162052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWUQw7BF6qOFvrmK64yOAiyAfdhX/yyNlejjZhluoEE=;
        b=iJeyjIOKMg6qCWe4HrGKDyaoD8cBh5JRnZ1hEMvO9rdUttiVYQfPBLqlky+iUzEtAP
         Z1dAnhsPAU5lzmN1Uu+/5YDULN9iCgGtZFFsV1/suGqAqZ7XkQhijdkBZsgd7Z09PDJQ
         OA6X9Hpha5c9xhPZ0NPK2VSNCQAeUOcIzDEJOaA+gpS0HKbUmwDVII8jUQRvdpybjWbO
         h8rwePG0q950vCqQam8XWP6qM5QZMOqAVg3SMjiIV8YN/BCizkm6bXM8xQbkRrA9cekV
         ZDUGa+TUwdDBErnU8YTYnrU1Hk5L4r7FEkd/rRTj6mT/D31FhBiopDQXIUtmykQn+6AC
         xCAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkfzVdiW7rW7V1uxEGHVCAae8wmoQDZSe4F5OPaJDEwURP8xDIQh9ZJmi3lqh92goWJ1Rpo5em9FiW95rw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj3f9+mhSdhLWp8j2FwXqVaOcOltUG9VgW5R9bhuV7Y/tRcR1I
	UNeynv7GyDJkRScnRAOP8R5b/5rG1Xxs4R9XLNry4PIIp94QVbRpRFO/EnhYur9JdxfNXcduwQs
	=
X-Gm-Gg: ASbGnctiTkbHD6ew7K18KmtX1bbTBbOD4cUOxuMk45BBM1ettYSB3bsqaMpf9wGC+sh
	/aTV9cGcYMyB9A0BCXAE3dl15Bq27vK6cvOfdFI1j61/9H6enlMXPUqxq8WwsKb64nLGd6pnEHu
	BDrFF6RRZwGFmXibtBx2mZfjftot6g/CQmfO0RMjdhw7vyrQRaL6+rFq29xMmmbqWiJmby+9mb2
	5u66d1Vuu07N4aNhiAKeEU4t39REjkKaUzRaN9aMpVRQoNSOauMs5pif/GXiuBByGUCXv6351UK
	169QOap8XYYFVPqTnipoTapA8ksb5phmfg9qtXanwmOfcqaf9qc=
X-Google-Smtp-Source: AGHT+IF+93Ze77YPoxfYOKdLnId7W7NxopgQ2nyluNktxUyk1Ns9mSAmPljJWg3qdOqk/ApQDZATqQ==
X-Received: by 2002:a05:6a20:d04a:b0:1f5:80a3:afe8 with SMTP id adf61e73a8af0-2045b9fa8a0mr1169419637.39.1745557251625;
        Thu, 24 Apr 2025 22:00:51 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412a0sm2292743b3a.49.2025.04.24.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:00:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:30:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/1] bus: mhi: host: pci_generic: Add Telit FN920C04
 modem support
Message-ID: <6amoyqyaxbvcfzgqmsjeo2isao3ijrle4krda66ellfrd6ondq@upwnk43vlnpr>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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


Return-Path: <linux-arm-msm+bounces-61573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E2ADC6C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBE0A1885116
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DD528F508;
	Tue, 17 Jun 2025 09:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9SnfLJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ABF179BD;
	Tue, 17 Jun 2025 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153158; cv=none; b=P/G0xmE1vw12kBQfzURt0BM5VzigJmvA0FiDY4PfBTDL88HQpAJAsbXaVVqxQcNoJMs6OkLgrG09JBeIvvkk9fe94dmct7LOohQ1JCqPgMnwUwf/yGEhSSOKILbLLr8Y0tfFX8xE9CRYIh6kp4zP5vbmF3+xtb8ubBrBCEgpfVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153158; c=relaxed/simple;
	bh=BN+BG+Egj5hmEaPRsr5xomxA25oN6dNrWmEOIW5nhkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ3TaDnembv5D55WyGhVk171BVQeD+CAEtH6JG4ayS5i9enlQqhPtikR9zL8P1HqGXSXHy8UaJxZyhkBCk+JRYUIt2T2lLM+Zi2wdtfkAiYTufcjK0Wu/M5M0+dSpMOLVNjI3RvzIsEW/pZl2HI45rx24PUwAW54CYC5UIfJp3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9SnfLJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607AEC4CEE3;
	Tue, 17 Jun 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750153157;
	bh=BN+BG+Egj5hmEaPRsr5xomxA25oN6dNrWmEOIW5nhkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9SnfLJusdCZuKL2k+Rp/GPyZ86f0ubl01iXJY/oUDz4eQHI+8qdFaySo+I8CgUBh
	 T56MzkX3FtXqUWpHoidAcaNu4WSbtOFjusg8/mftXvmIiTPdqgjOHqgkIeIUbl3JrL
	 7qRJKdxe5WJ6IEP6cRtxXi/mwynyEHklCOwzmLzklofYNeb7FdPvYXmyq1locJJNLt
	 YFLP5yHZSwjeA2/OZHX3Eh80XFi4v8TiP4rclFTAzteWrkfkGiR8rxWuvkjUYns30S
	 2lDsImKOI88CwIhzTNkEHWA/BU4cIHB8HAoIP+qigcp9cBmzYfeGlrrNKIppTJDPo5
	 RNGC9CWWLuX3w==
Date: Tue, 17 Jun 2025 15:09:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: manivannan.sadhasivam@linaro.org, johan+linaro@kernel.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add Foxconn T99W696
Message-ID: <4k7426oxhrnfoshkcqwwilq5lqldjovvtrwfownllwxwgudwjo@a3i47vma4lhr>
References: <20250528092232.16111-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528092232.16111-1-slark_xiao@163.com>

On Wed, May 28, 2025 at 05:22:32PM +0800, Slark Xiao wrote:
> T99W696 is designed based on Qualcomm SDX61 chip which is a cost
> down chip refer to previous SDX62/SDX65. Though we have a support
> on SDX62/SDX65, we create a new channel config for SDX61 since
> we add a NMEA channel support from this product.
> For new products we are allowed to customize the subVID and
> subPID only.
> 

Could you please push the firmware to linux-firmware? I don't expect the users
of the products to upstream the firmware, but I do expect the vendors to do so.

FYI: Qcom was able to upstream the firmware for one of their modems:
https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/qcom/qdu100/xbl_s.melf?id=01842da45df0a9f862098d1597f6ae5774b3e48a

So there should be no licensing issues. Going forward, I want both Qcom and
vendors to upstream the firmware before the modem support gets in.

- Mani

> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
> v2: Correct the ch_cfg as sdx61 channels
> ---
>  drivers/bus/mhi/host/pci_generic.c | 52 ++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index a4a62429c784..a90ab31c46a9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -490,6 +490,23 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
>  
> +static const struct mhi_channel_config mhi_foxconn_sdx61_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(50, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(51, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
>  static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
>  	MHI_EVENT_CONFIG_CTRL(0, 128),
>  	MHI_EVENT_CONFIG_DATA(1, 128),
> @@ -506,6 +523,15 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
>  	.event_cfg = mhi_foxconn_sdx55_events,
>  };
>  
> +static const struct mhi_controller_config modem_foxconn_sdx61_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx61_channels),
> +	.ch_cfg = mhi_foxconn_sdx61_channels,
> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> +	.event_cfg = mhi_foxconn_sdx55_events,
> +};
> +
>  static const struct mhi_controller_config modem_foxconn_sdx72_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 20000,
> @@ -615,6 +641,17 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
>  	.sideband_wake = false,
>  };
>  
> +static const struct mhi_pci_dev_info mhi_foxconn_t99w696_info = {
> +	.name = "foxconn-t99w696",
> +	.edl = "qcom/sdx61/foxconn/prog_firehose_lite.elf",
> +	.edl_trigger = true,
> +	.config = &modem_foxconn_sdx61_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.mru_default = 32768,
> +	.sideband_wake = false,
> +};
> +
>  static const struct mhi_channel_config mhi_mv3x_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> @@ -863,6 +900,21 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* Telit FE990A */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
> +	/* Foxconn T99W696.01, Lenovo Generic SKU */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe142),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.02, Lenovo X1 Carbon SKU */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe143),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.03, Lenovo X1 2in1 SKU */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe144),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.04, Lenovo PRC SKU */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe145),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
> +	/* Foxconn T99W696.00, Foxconn SKU */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்


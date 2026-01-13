Return-Path: <linux-arm-msm+bounces-88674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C4D16FAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ECC7303E28F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE2836A009;
	Tue, 13 Jan 2026 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ingFkQwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B98336EC7;
	Tue, 13 Jan 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768288842; cv=none; b=AXkevpSVl56qrajXOBGSTflHoIYi0nN2CbHbpuZk82Q3Yg9CywbSQ4SfNwnAKtCwI6ysNfJ6zqceFZ9K3o5AgtbC/kFz0+5YNi+9chKEeOjC+YgKgv688E7UvQXF43E/Y80j+BTqIHOpwmFRFAPT2EvtFUxC2f/5MIixp3Hr38w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768288842; c=relaxed/simple;
	bh=8yDWPgJ6kBkWS42Au9iudZhBUxV2z920hNmIPsojAuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXBlaMBtyvt7B2BdtZ+J/e52trcPjYYiB7jRa3SrHPe9vkOSHO03l/lr6Hhco0sVxHpBWqzi5MiWdlU6ytgL3gRn7vv94oLxYAW9i0P/y2+MBa4VrlAAr2UnmNSe1RiJItUHAXAIF6QECa/TLAzoQwrP2hCKbv5iTAv66a01aZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ingFkQwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721ABC19421;
	Tue, 13 Jan 2026 07:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768288841;
	bh=8yDWPgJ6kBkWS42Au9iudZhBUxV2z920hNmIPsojAuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ingFkQwgWcs32St+H0XvktNvl2dlT23KKlLdzFZBwl/TEVq0jrglLl6UMD8g/NSLt
	 RvVsDLGENfdpOqN4a3+ypjkCDa+DaggjE9zLW1eD4x+IRUv+KGT2chlWltseOy1/WP
	 bLMPnp2rmmhuRD1sVT02HRcScmGl0yTl9LZXS2OU95B9waKLJ8xGDizax7TnNbAXS2
	 rdRAN/TuASGzyIv3PXujIR9PB9y7eztoQBU0ZllXv7v+B6H5SpO9IALiK+cZ+zxKT2
	 3zOx693ZIwpU2qroKzD2RxJpBljlcKKW0KtUMT57V7bM/i/N50apiWmRv5QG16jvk+
	 SuIEUHIkWS0jQ==
Date: Tue, 13 Jan 2026 12:50:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 02/11] bus: mhi: pci_generic: Add Data plane channels for
 QDU100 VF's
Message-ID: <4b4venqe6cflvdbu7b4qbwskufnvsvjb7orhk6zfm65zvq2764@i5ghkpajhdhm>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-2-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-2-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:34PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Add Data plane channels and event ring for QDU100 VF's. Disable
> IRQ moderation for HW channels.
> 
> IP_HW1: Control configuration procedures over the L1 FAPI P5 interface
> include initialization, termination, restart, reset, and error
> notification. These procedures transition the PHY layer through IDLE,
> CONFIGURED, and RUNNING states.
> 
> IP_HW2: Data plane configuration procedures control DL and UL frame
> structures and transfer subframe data between L2/L3 software and PHY.
> Supported procedures include subframe message transmission, SFN/SF
> synchronization, and various transport channel operations.
> 

These IP_HW channels are intented for carrying IP packets and exposed as
netdevs. I don't know how the netdevs are used for the above mentioned usecases.
Especially the 'configuration procedures'.

- Mani

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index b64b155e4bd7..bb3c5350a462 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -253,6 +253,20 @@ struct mhi_pci_dev_info {
>  		.channel = ch_num,		\
>  	}
>  
> +#define MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(ev_ring, el_count, ch_num, cl_manage) \
> +	{					\
> +		.num_elements = el_count,	\
> +		.irq_moderation_ms = 0,		\
> +		.irq = (ev_ring) + 1,		\
> +		.priority = 1,			\
> +		.mode = MHI_DB_BRST_DISABLE,	\
> +		.data_type = MHI_ER_DATA,	\
> +		.hardware_event = true,		\
> +		.client_managed = cl_manage,	\
> +		.offload_channel = false,	\
> +		.channel = ch_num,		\
> +	}
> +
>  static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>  	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 2),
>  	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 2),
> @@ -278,6 +292,14 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>  
>  };
>  
> +static const struct mhi_channel_config mhi_qcom_qdu100_vf_channels[] = {
> +	/* HW channels */
> +	MHI_CHANNEL_CONFIG_UL(104, "IP_HW1", 2048, 1),
> +	MHI_CHANNEL_CONFIG_DL(105, "IP_HW1", 2048, 2),
> +	MHI_CHANNEL_CONFIG_UL(106, "IP_HW2", 2048, 3),
> +	MHI_CHANNEL_CONFIG_DL(107, "IP_HW2", 2048, 4),
> +};
> +
>  static struct mhi_event_config mhi_qcom_qdu100_events[] = {
>  	/* first ring is control+data ring */
>  	MHI_EVENT_CONFIG_CTRL(0, 64),
> @@ -294,6 +316,17 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
>  	MHI_EVENT_CONFIG_SW_DATA(8, 512),
>  };
>  
> +static struct mhi_event_config mhi_qcom_qdu100_vf_events[] = {
> +	/* first ring is control+data ring */
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
> +	/*  HW channels dedicated event ring */
> +	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(1, 4096, 104, 0),
> +	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(2, 4096, 105, 1),
> +	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(3, 4096, 106, 0),
> +	MHI_EVENT_CONFIG_HW_DATA_NO_IRQ_MOD(4, 4096, 107, 0),
> +
> +};
> +
>  static const struct mhi_controller_config mhi_qcom_qdu100_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 120000,
> @@ -303,11 +336,21 @@ static const struct mhi_controller_config mhi_qcom_qdu100_config = {
>  	.event_cfg = mhi_qcom_qdu100_events,
>  };
>  
> +static const struct mhi_controller_config mhi_qcom_qdu100_vf_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 120000,
> +	.num_channels = ARRAY_SIZE(mhi_qcom_qdu100_vf_channels),
> +	.ch_cfg = mhi_qcom_qdu100_vf_channels,
> +	.num_events = ARRAY_SIZE(mhi_qcom_qdu100_vf_events),
> +	.event_cfg = mhi_qcom_qdu100_vf_events,
> +};
> +
>  static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>  	.name = "qcom-qdu100",
>  	.fw = "qcom/qdu100/xbl_s.melf",
>  	.edl_trigger = true,
>  	.config = &mhi_qcom_qdu100_config,
> +	.vf_config = &mhi_qcom_qdu100_vf_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
>  	.vf_dma_data_width = 40,
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


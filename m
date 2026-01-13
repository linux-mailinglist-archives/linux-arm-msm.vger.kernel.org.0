Return-Path: <linux-arm-msm+bounces-88689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B55D7D1734C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624833045CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EFC378D8B;
	Tue, 13 Jan 2026 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQ0pDAz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80CA3793AB;
	Tue, 13 Jan 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291557; cv=none; b=RLQq0mdLxlvluiiXbTITUUy0ng7Di/BHRIOePXS5P6KDWT3Woye0WEobIwpxeSBXz0hIm1eDqcgBUoV4XgziHDT48Yw5Rd4vU8Aod8nC8zDOjZOG0CY0S9rRx/CrlgIBf0cFo1T/W48nxy0jwdPWkCTLeDK+0Rxs0+LkBbDSrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291557; c=relaxed/simple;
	bh=+6H1vyeML0kou03ZqGusDP2oJ3PumQlIsJ7l9UwKy+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4ZfVaCXhzpNiB2wtz82Ee8Xco9mKLv1y6gmbKEPzMZPcCVNlmBs50Ed8O7KAKfqsAIHuZUBvWbiJPlXVPt/E5XY5GZ5mdfjzE9BLVEz8ZqBEXpEO0/VHOYuDzjdtgHIFb9dFZ1zs2ep4zAhmOrB9Q33MZGtj2h+gNXu4COb04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQ0pDAz1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438B4C19421;
	Tue, 13 Jan 2026 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768291556;
	bh=+6H1vyeML0kou03ZqGusDP2oJ3PumQlIsJ7l9UwKy+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rQ0pDAz12oQKjXI91SODF3wdGRvfFcF4nPvYDX9PdoJZ9ltSem92fSi6vkkQEHbxh
	 cULrkv66iZPRzHsrHkR8HgQHx19yheWpv1WxRmU4p+k37+mCzGj8xEAw7DXE80jeUY
	 DOd0yiIgDa9G8e9rdYkbuy0BFAV9dlHmO32Iurv/hyZ7o2+yfUxTgH4ryU0xTCZSyh
	 z1zzgjyJ/R/0H6ASq2cmUrFszAU6Yf6w8zxthyU8EwDJof3RoZdyCp8V5JhmReVnVO
	 7oz0JMXylqlwTjNoW0GK03q77/xYYIGQB/JMczKKC5D7wnrHikBFl7jc0jQC89w/UR
	 CkC8QNPELERtw==
Date: Tue, 13 Jan 2026 13:35:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] bus: mhi: host: pci: Add overflow disable flag for
 QDU100 H/W channels
Message-ID: <ghggubfqnfdncjh32artxhznim5sdo7kanw4beu54m55koz47l@eg4o3njh5eii>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-6-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-6-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:38PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Add overflow disable flag for QDU100 H/W channels.
> 

Add some context on why the channel require this flag and how it is used.

- Mani

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index bb3c5350a462..814f8fdae378 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -94,6 +94,22 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = false,		\
>  	}
>  
> +#define MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_FROM_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_AMSS),		\
> +		.pollcfg = 0,				\
> +		.ovf_disable = true,			\
> +		.doorbell = MHI_DB_BRST_DISABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}
> +
>  #define MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(ch_num, ch_name, el_count, ev_ring) \
>  	{						\
>  		.num = ch_num,				\
> @@ -295,9 +311,9 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
>  static const struct mhi_channel_config mhi_qcom_qdu100_vf_channels[] = {
>  	/* HW channels */
>  	MHI_CHANNEL_CONFIG_UL(104, "IP_HW1", 2048, 1),
> -	MHI_CHANNEL_CONFIG_DL(105, "IP_HW1", 2048, 2),
> +	MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(105, "IP_HW1", 2048, 2),
>  	MHI_CHANNEL_CONFIG_UL(106, "IP_HW2", 2048, 3),
> -	MHI_CHANNEL_CONFIG_DL(107, "IP_HW2", 2048, 4),
> +	MHI_CHANNEL_CONFIG_DL_OVF_DISABLE(107, "IP_HW2", 2048, 4),
>  };
>  
>  static struct mhi_event_config mhi_qcom_qdu100_events[] = {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


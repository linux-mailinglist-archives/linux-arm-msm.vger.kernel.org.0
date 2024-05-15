Return-Path: <linux-arm-msm+bounces-19878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA468C65EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 13:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC929284E20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043476F073;
	Wed, 15 May 2024 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgGzwMOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B5E6EB4D;
	Wed, 15 May 2024 11:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715773963; cv=none; b=U9UfTH7sBplE5kI5am1eE2A82wLABRj3puKgKi9IvdOfpHQeMNcdosEMH6r5obqttY2XcijTWR4qB1/xDuhY5+94Yrh+eLWumQDmkt2sjxONMEs/vrnRGRg16fo+n84YNIQdn8BSGv+222U9mVOtPsNX5JXhIU5fiFTezV0zfqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715773963; c=relaxed/simple;
	bh=6/w6PXuqTKJkCkKH+o49ec5fUjWDa/wTnoKCbxVJAWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoreX66M5L2vvcQVD5XTrPI43lW1lXZdu+VlBStuAArUm6LPCK+keest/Tj2uzr3V2lCGjEgijHQg0urMeYRaLa2F8n+tkdg0spzCCRkliIGVi2RANGAYu8jyhwVU3OrXjzrYfC4BQscSIP/mkmR/zsHbyKbcgJAHsCs/Wzg8J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgGzwMOS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA203C116B1;
	Wed, 15 May 2024 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715773963;
	bh=6/w6PXuqTKJkCkKH+o49ec5fUjWDa/wTnoKCbxVJAWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgGzwMOS2L7p7LfzwCrjMxtTPPLiStcG7C6IigkFtBXfGAk6EwHZMdrJwy1jE3KAv
	 1mi6QPgfRLangA+iTPCxoITKHVz+jrq/EjtV3y2eMI+Vg0jGSfmWASTqk2xBSut5tK
	 9O8rmcMs4fWWgYDx7xG24vWoHnl3yO7sgFGMZPse2orPLHbvyFbPo+z2ay/r6CHW9i
	 fPTB35oPCWVdPqR2NXdXxpxK1oxQJ4RZC+UUfx40s7UIvryKKAbBGtvyvFKhth5++a
	 7paGhkCUUeVTo6hxtKtWHUEO1A9+AGbtQzWW1heQZqqsEsSrfCZK8NTFUmQ2ZrMLOg
	 DM01uhXrPuCAA==
Date: Wed, 15 May 2024 13:52:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	loic.poulain@linaro.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_qianyu@quicinc.com
Subject: Re: Re: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
Message-ID: <20240515115239.GD4488@thinkpad>
References: <20240510032657.789629-1-slark_xiao@163.com>
 <20240514143741.GA2306@thinkpad>
 <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <20240515074119.GA2445@thinkpad>
 <5eee5967.7bdf.18f7b4567b7.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5eee5967.7bdf.18f7b4567b7.Coremail.slark_xiao@163.com>

On Wed, May 15, 2024 at 04:01:37PM +0800, Slark Xiao wrote:
> 
> At 2024-05-15 15:41:19, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >+ Qiang
> >
> >On Wed, May 15, 2024 at 09:29:20AM +0800, Slark Xiao wrote:
> >> At 2024-05-14 22:37:41, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >> >On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
> >> >> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >> >> And also, add firehose support since SDX72.
> >> >> 
> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >> ---
> >> >>  drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
> >> >>  1 file changed, 31 insertions(+)
> >> >> 
> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> >> index 08844ee79654..0fd94c193fc6 100644
> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >> >>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >> >>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >> >>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >> >> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> >> >> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> >> >
> >> >This means SDX55 is also supporting FIREHOSE channels, which is not true I
> >> >believe.
> >> Actually, I just verified it with my sdx55 and the answer is Yes. These channels
> >> are common settings for Qcom device which support PCIe mode. BTW, the
> >> default settings of Qcom and Quectel support firehose for their sdx55 products.
> >
> >Qiang, can you please confirm that SDX55 supports FIREHOSE channels?
> >
> >> >
> >> >>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >> >>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >> >>  };
> >> >> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> >> >>  	.event_cfg = mhi_foxconn_sdx55_events,
> >> >>  };
> >> >>  
> >> >> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >> >> +	.max_channels = 128,
> >> >> +	.timeout_ms = 20000,
> >> >> +	.ready_timeout_ms = 50000,
> >> >> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> >> >> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> >> >> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> >> >> +	.event_cfg = mhi_foxconn_sdx55_events,
> >> >> +};
> >> >> +
> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> >> >>  	.name = "foxconn-sdx24",
> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> >> >>  	.sideband_wake = false,
> >> >>  };
> >> >>  
> >> >> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> >> >> +	.name = "foxconn-sdx72",
> >> >> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
> >> >
> >> >What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
> >> >it to linux-firmware?
> >> >
> >> This file similar with "edl.mbn". In SDX72 product, the default "edl" file name is
> >> "xbl_s_devprg_ns.melf". Currently we don't plan to upstream it to linux-firmware
> >> since 2 reasons: 1: we share the same fold name sdx72m with qcom or other vendors
> >> 2: this file may be changed since sdx72 product still under developing in our side. we
> >> may change the base line according to QCOM release.
> >
> >Then I would ask you to add support when you have a stable firmware. I do not
> >want to change the firmware name after some time as it will confuse users.
> >
> >- Mani
> If a stable firmware must be provided, I think I shall change the folder name from qcom to
> fox, do you agree this?

Even in that case, where can the user find the firmware?

> BTW, I need to check if it works after updating 'edl fw' from  xbl_s_devprg_ns.melf to
> edl.mbn. 

Okay. IMO, we should upstream the product support only after a stable firmware
release (well stable in the sense a stable name at least).

- Mani

-- 
மணிவண்ணன் சதாசிவம்


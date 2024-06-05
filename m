Return-Path: <linux-arm-msm+bounces-21702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674CF8FC332
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 07:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A045287146
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 05:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6660921C17F;
	Wed,  5 Jun 2024 05:58:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E5FF9E9;
	Wed,  5 Jun 2024 05:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717567087; cv=none; b=KT6MVj/X98/VPS0hVvpTK9cW8/pyhMYXnvlK1sSDbtT3ttj+GBQqi6S/z/QWWJmc8Xuv0VbR8wsVhbstFVxYKjbPS/9n5ZrhNGq6laS4EiAuAS6S+VzeF5lOVRipxRkHkV78KQ+vVayGUt2Rb5wSQayJwKCu5Xq+hhfxw/bEOTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717567087; c=relaxed/simple;
	bh=6GxX408iDcjhjYQDGUkRUJqXZyrINIunqpkSUHjASBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twTDaoN1PNwnLBJzk1Gjg1AeoTwY8GQ/jT6qngKUPEpKNh5NAOIYgNpmBvjArRqXWhg7R/PyAngptJ8XVn3TApjt0BtlI1tiX0Fz78HtU+vQk4JlGx0r1I3B3WByYFQGyX9TW9gyE2ghR1feiI0nyva+hokVTMlecy0lWlr6nLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFEFC32781;
	Wed,  5 Jun 2024 05:58:04 +0000 (UTC)
Date: Wed, 5 Jun 2024 11:27:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, loic.poulain@linaro.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_qianyu@quicinc.com
Subject: Re: Re: Re:Re: Re: Re: Re: [PATCH] bus: mhi: host: Add Foxconn SDX72
 related support
Message-ID: <20240605055756.GE2417@thinkpad>
References: <541de8e4.1600.18f79de44f3.Coremail.slark_xiao@163.com>
 <20240515074119.GA2445@thinkpad>
 <5eee5967.7bdf.18f7b4567b7.Coremail.slark_xiao@163.com>
 <20240515115239.GD4488@thinkpad>
 <58fb648d.ab03.18f7c2f90bd.Coremail.slark_xiao@163.com>
 <20240516142346.GA6922@thinkpad>
 <20b11ca1.101c.18f8418706b.Coremail.slark_xiao@163.com>
 <6f6143b2.9e05.18f85fda5f9.Coremail.slark_xiao@163.com>
 <20240517104947.GA41015@thinkpad>
 <4c4eb491.13b6.18f9396ae58.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c4eb491.13b6.18f9396ae58.Coremail.slark_xiao@163.com>

On Mon, May 20, 2024 at 09:21:16AM +0800, Slark Xiao wrote:
> 
> 
> At 2024-05-17 18:49:47, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >On Fri, May 17, 2024 at 05:59:03PM +0800, Slark Xiao wrote:
> >> 
> >> At 2024-05-17 09:09:05, "Slark Xiao" <slark_xiao@163.com> wrote:
> >> >
> >> >At 2024-05-16 22:23:46, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >> >>On Wed, May 15, 2024 at 08:17:23PM +0800, Slark Xiao wrote:
> >> >>> 
> >> >>> 
> >> >>> At 2024-05-15 19:52:39, "Manivannan Sadhasivam" <mani@kernel.org> wrote:
> >> >>> >On Wed, May 15, 2024 at 04:01:37PM +0800, Slark Xiao wrote:
> >> >>> >> 
> >> >>> >> At 2024-05-15 15:41:19, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >> >>> >> >+ Qiang
> >> >>> >> >
> >> >>> >> >On Wed, May 15, 2024 at 09:29:20AM +0800, Slark Xiao wrote:
> >> >>> >> >> At 2024-05-14 22:37:41, "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org> wrote:
> >> >>> >> >> >On Fri, May 10, 2024 at 11:26:57AM +0800, Slark Xiao wrote:
> >> >>> >> >> >> Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
> >> >>> >> >> >> And also, add firehose support since SDX72.
> >> >>> >> >> >> 
> >> >>> >> >> >> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >> >>> >> >> >> ---
> >> >>> >> >> >>  drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
> >> >>> >> >> >>  1 file changed, 31 insertions(+)
> >> >>> >> >> >> 
> >> >>> >> >> >> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> >> >>> >> >> >> index 08844ee79654..0fd94c193fc6 100644
> >> >>> >> >> >> --- a/drivers/bus/mhi/host/pci_generic.c
> >> >>> >> >> >> +++ b/drivers/bus/mhi/host/pci_generic.c
> >> >>> >> >> >> @@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> >> >>> >> >> >>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> >> >>> >> >> >>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> >> >>> >> >> >>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> >> >>> >> >> >> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> >> >>> >> >> >> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> >> >>> >> >> >
> >> >>> >> >> >This means SDX55 is also supporting FIREHOSE channels, which is not true I
> >> >>> >> >> >believe.
> >> >>> >> >> Actually, I just verified it with my sdx55 and the answer is Yes. These channels
> >> >>> >> >> are common settings for Qcom device which support PCIe mode. BTW, the
> >> >>> >> >> default settings of Qcom and Quectel support firehose for their sdx55 products.
> >> >>> >> >
> >> >>> >> >Qiang, can you please confirm that SDX55 supports FIREHOSE channels?
> >> >>> >> >
> >> >>> >> >> >
> >> >>> >> >> >>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> >> >>> >> >> >>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> >> >>> >> >> >>  };
> >> >>> >> >> >> @@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
> >> >>> >> >> >>  	.event_cfg = mhi_foxconn_sdx55_events,
> >> >>> >> >> >>  };
> >> >>> >> >> >>  
> >> >>> >> >> >> +static const struct mhi_controller_config modem_foxconn_sdx72_config = {
> >> >>> >> >> >> +	.max_channels = 128,
> >> >>> >> >> >> +	.timeout_ms = 20000,
> >> >>> >> >> >> +	.ready_timeout_ms = 50000,
> >> >>> >> >> >> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> >> >>> >> >> >> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> >> >>> >> >> >> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> >> >>> >> >> >> +	.event_cfg = mhi_foxconn_sdx55_events,
> >> >>> >> >> >> +};
> >> >>> >> >> >> +
> >> >>> >> >> >>  static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
> >> >>> >> >> >>  	.name = "foxconn-sdx24",
> >> >>> >> >> >>  	.config = &modem_foxconn_sdx55_config,
> >> >>> >> >> >> @@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
> >> >>> >> >> >>  	.sideband_wake = false,
> >> >>> >> >> >>  };
> >> >>> >> >> >>  
> >> >>> >> >> >> +static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
> >> >>> >> >> >> +	.name = "foxconn-sdx72",
> >> >>> >> >> >> +	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
> >> >>> >> >> >
> >> >>> >> >> >What is '.melf'? Is the firmware available somewhere? Did you plan to upstream
> >> >>> >> >> >it to linux-firmware?
> >> >>> >> >> >
> >> >>> >> >> This file similar with "edl.mbn". In SDX72 product, the default "edl" file name is
> >> >>> >> >> "xbl_s_devprg_ns.melf". Currently we don't plan to upstream it to linux-firmware
> >> >>> >> >> since 2 reasons: 1: we share the same fold name sdx72m with qcom or other vendors
> >> >>> >> >> 2: this file may be changed since sdx72 product still under developing in our side. we
> >> >>> >> >> may change the base line according to QCOM release.
> >> >>> >> >
> >> >>> >> >Then I would ask you to add support when you have a stable firmware. I do not
> >> >>> >> >want to change the firmware name after some time as it will confuse users.
> >> >>> >> >
> >> >>> >> >- Mani
> >> >>> >> If a stable firmware must be provided, I think I shall change the folder name from qcom to
> >> >>> >> fox, do you agree this?
> >> >>> >
> >> >>> >Even in that case, where can the user find the firmware?
> >> >>> >
> >> >>> I think this edl file could help user let device enter into edl mode(wwan0firehose0).
> >> >>> For PCIE device, there is no opensource tool to support PCIE edl download. If user
> >> >>> could get the tool to do the firehose download, I think it's not hard to get complete firmware
> >> >>> from PC vendor or somewhere else.
> >> >>
> >> >>I was told that Qcom will upstream the PCI support for QDL in the coming weeks.
> >> >>Once that happens (even if a PR), I'll share that with you. Please test it and
> >> >>let me know if that works or not.
> >> >>
> >> >Sure. But I think this shall not the block cause for merging this patch, right?
> >> >Before that PR, we have verified the firehose function in our local with our
> >> >firehose tool which is not open. 
> >
> >Yeah, QDL is not a blocker for this device.
> If there is no other issue, I will release a V2 version based on the edl file path and name.
> Also, I will add the ".edl_trigger=true" for my sdx72 devices.
> For previous sdx55 and sdx65 firehose support, I think a new commit would be better 
> to cover that.
> >
> >> >>And for entering EDL mode, we have recently added support to trigger EDL mode
> >> >>from host [1]. Could you also test that? You just need to add `edl_trigger =
> >> >>true` to the `mhi_pci_dev_info` struct of SDX72 and trigger EDL mode from host
> >> >>by:
> >> >>
> >> >>echo 1 > /sys/bus/mhi/devices/.../trigger_edl
> >> >>
> >> >Do you remember that I told you I want to merge such function from qualcomm driver
> >> >in last year? I merge the commit from QUD driver in my local. Actually it's same as the
> >> >commit [1], it's called "force_edl". And sure, the result is yes, it works well.
> >> >
> >> Latest test, it doesn't work in Linux V6.9 since there is a patch missing. In my local previous
> >> test, there is no mhi_cntrl->edl_trigger condition to set up dev_attr_trigger_edl.
> >> Seems patch [2] is missed.
> >> 
> >> [2]-https://lore.kernel.org/mhi/1713928915-18229-4-git-send-email-quic_qianyu@quicinc.com/
> >
> >You need to apply the whole series. But anyway, thanks for testing it out.
> >
> >> >>> >> BTW, I need to check if it works after updating 'edl fw' from  xbl_s_devprg_ns.melf to
> >> >>> >> edl.mbn. 
> >> >>> 
> >> >>> >
> >> >>> >Okay. IMO, we should upstream the product support only after a stable firmware
> >> >>> >release (well stable in the sense a stable name at least).
> >> >>> >
> >> >>> >- Mani
> >> >>> The check result is we can rename it to align with previous format. Until now, 
> >> >>> I didn't see any mhi device has upstream their firmware to /lib/firmware/qcom folder.
> >> >>
> >> >>It is not mandatory, but it is a best practise that I recently started asking
> >> >>for.
> >> >>
> >> >>> If it's a must, I think we can upstream the edl file later.  Anyway, we hope we can
> >> >>> merge this sdx72 support into 6.10 since customer(Dell) would use this kernel for official
> >> >>> release. But no worry, we can make sure this firehose download method works well in
> >> >>>  our local side.
> >> >>> And also, please help a review about my previous email about fix sdx72 ping failure issue.
> >> >>> There is a fix solution from us. 
> >> >>> 
> >> >>
> >> >>Qiang is working on that.
> >> >Good to hear that. BTW, may I know the feature merge window in V6.10? I don't worry about
> >> >merge window of the network fix commit, since it's a fix with higher priority. But I want to
> >> >merge the basic support of my SDX72 before merge window close. This is important for us.
> >> >
> >
> >MHI tree is closed during -rc6, so there is no way this patch can make 6.10.
> I saw you tag mhi-for-6.10 which was created in 4/25,  before linux 6.9-RC6.
> But V6.9 was just released in 5/13, and there is a lot of time before V6.10.
> Why close the merge window for V6.10 so early?

I need to send the PR to Greg at the -rc6 timeframe. Greg will mostly close his
tree post -rc6 as he needs to pull from different sub trees before sending the
PR to Linus during merge window. That's the reason.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


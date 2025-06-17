Return-Path: <linux-arm-msm+bounces-61561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E818BADC625
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 206E21899328
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED8F28FFFB;
	Tue, 17 Jun 2025 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgIkpeNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811628BAAD;
	Tue, 17 Jun 2025 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152191; cv=none; b=mq9CGM7pSkoiBVYJl76kwTU7aZUsuTxrhlAmrDjKRcMdU+2ivvOTHG99uAx6CdX6et3NxkfpDyVEY1UQeqh30whCG/50YFKn6rgHkpSE9pRgYSnf6xXVdp+3OlkhvJg/PexSzaRPLXM/4sV5AXHsWSLQwDxQMT+b/gotYlEuJWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152191; c=relaxed/simple;
	bh=iwobDMTP14MT073l3r6w7NaFeAJNSNdSdh8lG+b6y/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jm3b/4V5J3MopGMPUVVaiLAa1MlIt2I6IT1Td1uOMtwyn9KXVYhpCK2rklR0rK6SbQNIxKiAjQ3q7jFKLeqTVIsTAF0Hfzk9k8t/rQ8dAmuaB+DJVwV5PJPe22nUWk5YjXmnwnDcniXP6lIBrHXTFbuWIk9NjfGvwzuwSu1ZZw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgIkpeNn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F11C4CEE3;
	Tue, 17 Jun 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750152190;
	bh=iwobDMTP14MT073l3r6w7NaFeAJNSNdSdh8lG+b6y/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgIkpeNnH6xif35u9hjFGmrKr/R6QiO7gCZyEi5o+T21JgzCvV6OD5yklhI/xVQmj
	 OW9JVwJLKlnCylolzqkxN+bWpNhoih0rElvqdm9vGjMIRzOlbskF6Ux1FnYC17gKy4
	 lRzURBmcj21abZR7RIaaNpLEJ5uguFupgume38DoyZwmTwhmgKaVG41jAvTt3jryEv
	 PL8eddYgBDnozEUoNdSBhAG44EeCxC+eR8h4kh6U8NpcUorZJDwcIu16FZpZQBhssK
	 nrQgOyX7dcrdO+1gu1OysPNCD/cquwIjPcy49QGKhGgnV/VY9TbFwR2yCHXOYts4Fj
	 U+uYY9e7XLwTg==
Date: Tue, 17 Jun 2025 14:53:02 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, can.guo@oss.qualcomm.com, 
	Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <q3uxu5cki7c3nkv65kozibiz7ofjcm3clelog3oaqcya32kph4@ntvsqbshmeuw>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
 <9ab8e8f8-e176-44ab-b8e5-0c27e5eff30b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ab8e8f8-e176-44ab-b8e5-0c27e5eff30b@quicinc.com>

On Fri, Jun 06, 2025 at 09:58:06AM +0800, Baochen Qiang wrote:
> 
> 
> On 6/6/2025 1:04 AM, Manivannan Sadhasivam wrote:
> > On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> >> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> >>
> >> Currently, the FBC image is a non-standard ELF file that contains a single
> >> ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> >> unable to process this non-standard ELF format and therefore require
> >> special handling during image loading.
> >>
> > 
> > What are those "some devices"? Why are they not able to process this format
> > which is used across the rest of the Qcom devices?
> > 
> >> Add standard_elf_image flag to determine whether the device can process
> >> the non-standard ELF format. If this flag is set, a standard ELF image
> >> must be loaded, meaning the first 512 KB of the FBC image should be
> >> skipped when loading the AMSS image over the BHIe interface.
> > 
> > Please explain what is present in the first 512KiB and why skipping that is
> > required.
> > 
> >> Note that
> >> this flag does not affect the SBL image download process.
> >>
> >> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> >> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - V1 patch is paused because of no user. WLAN team plan to add support for
> >>   new WLAN chip that requires this patch, so send v2.
> >> - Change author and SOB with new mail address.
> >> - Reword commit message.
> >> - Place standard_elf_image flag after wake_set in struct mhi_controller
> >> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> >> ---
> >>  drivers/bus/mhi/host/boot.c | 7 +++++++
> >>  include/linux/mhi.h         | 4 ++++
> >>  2 files changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> >> index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> >> --- a/drivers/bus/mhi/host/boot.c
> >> +++ b/drivers/bus/mhi/host/boot.c
> >> @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >>  	 * device transitioning into MHI READY state
> >>  	 */
> >>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> >> +		dev_dbg(dev, "standard_elf_image:%s\n",
> >> +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > 
> > This print is just a noise even for debug.
> > 
> >> +		if (mhi_cntrl->standard_elf_image) {
> >> +			fw_data += mhi_cntrl->sbl_size;
> >> +			fw_sz -= mhi_cntrl->sbl_size;
> > 
> > Is it possible to detect the image type during runtime instead of using a flag?
> > Also, the flag is currently unused. So it should come along an user.
> 
> The flag would be used when a new WLAN device getting upstream. So either we merge this
> patch alone, or we get it grouped within the WLAN patches. Kindly share your thoughts?
> 

For the reason I mentioned in my previous reply, I don't think we should rely on
the flag unless the WLAN device is shipped with *only* the new FW. If that is
the case, then please send this patch when the ath driver support shows up. I
do not want to merge a patch with an unused interface.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


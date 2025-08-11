Return-Path: <linux-arm-msm+bounces-68266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AABB2018D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED89D189E9F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 08:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1C721772A;
	Mon, 11 Aug 2025 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UI48hWft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D4D1E834B;
	Mon, 11 Aug 2025 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900228; cv=none; b=E9ymAyDIZMBxuqTI4mA1y6fTzY+B5fPhS5lIQyxWq+uYsHOx67xNsDqHwdWFw1emJpunFi0PhsAjFXnYj5+ZkuZpoNGnN3RCFQZdbP+3MGIyRBU1r+e6ssL6n0HpFtdG1ULTKa7jfA4I7iY7DCCrdCh3xNzMVk62VD568lirGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900228; c=relaxed/simple;
	bh=yL/qUikanLs+aGEmFjlLt7vxOWxjOZmEwCqPg0afrV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kngh4iWH4Bh9MTSzLfmY9k05Jr+jM5Bhe/SGoQEX2opK8FvjK2egKNq6q+2LfeDsgBRmM1Ap1OMCpp1ZNKu10ppuuCKu7VpcaFZvBa7nvYXKKfo5YyTRbcefZ9NVaN271zLt+k9H3W6EpUgrXFTCcTm3BpjFoihyTE3/3iF6oEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UI48hWft; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2AC4CEF6;
	Mon, 11 Aug 2025 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754900227;
	bh=yL/qUikanLs+aGEmFjlLt7vxOWxjOZmEwCqPg0afrV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UI48hWft/oTk2ppV8lEBCRugT2YlIFQQaaS2fdZwl/4hq5z6Al8aeBmZhUQy9qDIV
	 oWE1/rQxs5lZI20al/Kzhp23oW49q6idQJTpxGMBTJz6bxVwxDba0N81Xq6YiLgOve
	 HFHnOpUA0dQoZmVuax6F7T2awFOoAkaGaFBvemFcrTUvKLapi1qwuEYZpXNK0FZhai
	 64kXHx9qwq+kZw41mLJRl0kh85GWcdbNxPa71l8Mc3mDTF3DAEFIQT73x7gFUF2Lft
	 nFuwfc81MeOtQX7BkBVjapukZkBIik1uIiGroU3msCHO0spiMal7f5Y5tK5v1aQ9kt
	 QplmBTHv/ExQg==
Date: Mon, 11 Aug 2025 13:46:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
Message-ID: <edrf3bobjnknwydzeitfwns7lehgf65p5prcohmc7eexhzoami@ywlamyweunmn>
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
 <2e655067-cd7e-4584-aa07-998b517ac314@quicinc.com>
 <pewnau4ltrf2yu3xxdq6rs6xhz45zlo3dt3jnkzhxitmezz2ft@2k7pgpoz5iey>
 <3601cdce-a269-4d29-bc21-b925fcc499e2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3601cdce-a269-4d29-bc21-b925fcc499e2@quicinc.com>

On Thu, Aug 07, 2025 at 03:50:58PM GMT, Palash Kambar wrote:
> 
> 
> On 8/6/2025 11:19 PM, Manivannan Sadhasivam wrote:
> > On Wed, Aug 06, 2025 at 06:11:09PM GMT, Palash Kambar wrote:
> >>
> >>
> >> On 8/6/2025 4:44 PM, Manivannan Sadhasivam wrote:
> >>> On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
> >>>> Disable of AES core in Shared ICE is not supported during power
> >>>> collapse for UFS Host Controller V5.0.
> >>>>
> >>>> Hence follow below steps to reset the ICE upon exiting power collapse
> >>>> and align with Hw programming guide.
> >>>>
> >>>> a. Write 0x18 to UFS_MEM_ICE_CFG
> >>>> b. Write 0x0 to UFS_MEM_ICE_CFG
> >>>>
> >>>> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> >>>> ---
> >>>>  drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
> >>>>  drivers/ufs/host/ufs-qcom.h |  2 ++
> >>>>  2 files changed, 26 insertions(+)
> >>>>
> >>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> >>>> index 444a09265ded..2744614bbc32 100644
> >>>> --- a/drivers/ufs/host/ufs-qcom.c
> >>>> +++ b/drivers/ufs/host/ufs-qcom.c
> >>>> @@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
> >>>>  	if (ufs_qcom_is_link_off(hba) && host->device_reset)
> >>>>  		ufs_qcom_device_reset_ctrl(hba, true);
> >>>>  
> >>>> +	host->vdd_hba_pc = true;
> >>>
> >>> What does this variable correspond to?
> >> Hi Manivannan,
> >>
> >> It corresponds to power collapse, will rename it for better readability.
> >>
> > 
> > What is 'power collapse' from UFS perspective?
> 
> As part of UFS controller power collapse, UFS controller and PHY enters HIBERNATE_STATE
> during idle periods .The UFS controller is power-collapsed with essential registers 
> retained (for ex ICE), while PHY maintains M-PHY compliant signaling. Upon data transfer
> requests, software restores power and exits HIBERNATE_STATE without requiring re-initialization, 
> as configurations and ICE encryption keys are preserved.
> 

AFAIK, Hibern8 is a UFS *link* specific feature, not controller specific. In
other peripherals, power collapse means powering off the controller entirely and
then relying on the hardware logic to retain the register states. I believe the
same behavior applies to UFS also.

In that case, I would expect you to check for the power collapse in
ufs_qcom_resume() using some logic and toggle the relevant bits in UFS_MEM_ICE.

The current logic you proposed doesn't really make sure that the controller is
power collapsed. You just assume that ufs_qcom_suspend() would allow the
controller to enter power collapse state, but it won't. If the user has opted
for 'spm_lvl' to be '0', then I don't think the controller can enter power
collapse state.

> > 
> >>>
> >>>> +
> >>>>  	return ufs_qcom_ice_suspend(host);
> >>>>  }
> >>>>  
> >>>> @@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >>>>  	return ufs_qcom_ice_resume(host);
> >>>>  }
> >>>>  
> >>>> +static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
> >>>> +				    enum uic_cmd_dme uic_cmd,
> >>>> +				    enum ufs_notify_change_status status)
> >>>> +{
> >>>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >>>> +
> >>>> +	/* Apply shared ICE WA */
> >>>
> >>> Are you really sure it is *shared ICE*?
> >>
> >>  Yes Manivannan, I am.
> >>
> > 
> > Well, there are two kind of registers defined in the internal doc that I can
> > see: UFS_MEM_ICE and UFS_MEM_SHARED_ICE. And hence the question.
> > 
> >>>
> >>>> +	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
> >>>> +	    status == POST_CHANGE &&
> >>>> +	    host->hw_ver.major == 0x5 &&
> >>>> +	    host->hw_ver.minor == 0x0 &&
> >>>> +	    host->hw_ver.step == 0x0 &&
> >>>> +	    host->vdd_hba_pc) {
> >>>> +		host->vdd_hba_pc = false;
> >>>> +		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);
> >>>
> >>> Define the actual bits instead of writing magic values.
> >>
> >> Sure.
> >>
> >>>
> >>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
> >>>> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
> >>>> +		ufshcd_readl(hba, UFS_MEM_ICE);
> >>>
> >>> Why do you need readl()? Writes to device memory won't get reordered.
> >>
> >> Since these are hardware register, there is a potential for reordering.
> >>
> > 
> > Really? Who said that? Please cite the reference.
> > 
> >>>
> >>>> +	}
> >>>> +}
> >>>> +
> >>>>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
> >>>>  {
> >>>>  	if (host->dev_ref_clk_ctrl_mmio &&
> >>>> @@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
> >>>>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
> >>>>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
> >>>>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
> >>>> +	.hibern8_notify		= ufs_qcom_hibern8_notify,
> >>>
> >>> This callback is not called anywhere. Regardeless of that, why can't you use
> >>> ufs_qcom_clk_scale_notify()?
> >>>
> >>
> >> According to the HPG guidelines, as part of this workaround, we are required to reset the ICE controller during the Hibern8 exit sequence when the UFS controller resumes from power collapse. Therefore, this reset logic has been added to the H8 exit notifier callback.
> >>
> > 
> > Please wrap the replies to 80 column.
> > 
> > Well, we do call ufshcd_uic_hibern8_exit() from these callbacks. So why can't
> > you reset the ICE after calling ufshcd_uic_hibern8_exit() here?
> 
> As per HPG guidance, the ICE Reset workaround is required only after the
> controller undergoes a power collapse. In the UFS subsystem, power collapse
> is managed via the GDSC (GCC_UFS_MEM_PHY_GDSC), which is part of GenPD
> (power domains). Since GenPD is tied to runtime suspend operations, we are
> setting the power collapse flag during runtime suspend and checking this
> flag during hibernate exit.
> 
> 
> > 
> >> The ufs_clk_scale_notify function is invoked whenever clock scaling (up or down) occurs, regardless of whether a power collapse has taken place. Hence, the ICE controller reset was specifically added to the H8 exit notifier to ensure it is executed only in the appropriate context.
> >>
> > 
> > Please define what 'power collapse' mean here. And as I said before, you are
> > not at all calling this newly introduced callback.
> 
> This is not a newly introduced callback, Mani. We are registering for
> an already existing notifier. You may refer to ufshcd.c, where this
> notifier is invoked.
> 

Okay, my bad. You could've mentioned something about this callback in the commit
message to make others aware that you are reusing an existing callback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


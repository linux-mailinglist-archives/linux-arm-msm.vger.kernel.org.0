Return-Path: <linux-arm-msm+bounces-67946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE605B1CB6A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692C23A3707
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C954764;
	Wed,  6 Aug 2025 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hlp6coGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B65634;
	Wed,  6 Aug 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754502561; cv=none; b=t54gcWNPGZubllQode3AqvcsmH8JPB8q7hcoR/0aeXaSGz449grTRvfbSdQucfyFSns569+aGlfDMEJnkr8nA7WWE7hdtcdSi74l9kUQu0nwMkDCO5zwpLk6iIrbscvEFZgym/WbKusd6Pm2sbqzZvupsZ8081VX1veOgzk5yM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754502561; c=relaxed/simple;
	bh=1XuKuQPoRatXYC0JAhqStEGHpl8a4HU1klarVKGNcsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxpHQuAwdnCxJ5xtQNxrVkPnsFUiVgD7RZENFZpu/RlJqe6XPpYATgSV6R6hdntvhFY9ehfY5Wqjr736DA/MFD7XZhHyLXH08wPkeQmZEFcFDCRx181BZTSRqZioDAuALtmStozn+vrb9IUmaR0XsGVRECfS4+YrdSal2x07UYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hlp6coGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665D7C4CEE7;
	Wed,  6 Aug 2025 17:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754502559;
	bh=1XuKuQPoRatXYC0JAhqStEGHpl8a4HU1klarVKGNcsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hlp6coGJNIpV9F4kjb817nCv5/Ucldnw7WMFMVFgoaWNghjs07bqNWkrYg53kNQov
	 OszTBgYGRDyWmahxZxECAKIQA2FUvxvslZb3Fy9jrRJ/FqxXxYEf3J8WLo5bpT3wWM
	 IuTuR0+lWjuAxeMoD60H5c9+geXER1VAAsduZser46G/94opNdoSsxFUgZvFOMy20x
	 zPQ4VGoEP3zKfBblf+GEQ+UWi6DPD7uSkPGfx+vt6SqR+S95fpVYAwfszcY8h4dHxh
	 iTLYxjc9d6hwTO5ZsFE8x0hM9aehuaiXGS1nd8+bhgopoLSFereXP8RElN7HVegDjU
	 uVO6zEof+ALoQ==
Date: Wed, 6 Aug 2025 23:19:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for UFS controller v5
Message-ID: <pewnau4ltrf2yu3xxdq6rs6xhz45zlo3dt3jnkzhxitmezz2ft@2k7pgpoz5iey>
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
 <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
 <2e655067-cd7e-4584-aa07-998b517ac314@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e655067-cd7e-4584-aa07-998b517ac314@quicinc.com>

On Wed, Aug 06, 2025 at 06:11:09PM GMT, Palash Kambar wrote:
> 
> 
> On 8/6/2025 4:44 PM, Manivannan Sadhasivam wrote:
> > On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
> >> Disable of AES core in Shared ICE is not supported during power
> >> collapse for UFS Host Controller V5.0.
> >>
> >> Hence follow below steps to reset the ICE upon exiting power collapse
> >> and align with Hw programming guide.
> >>
> >> a. Write 0x18 to UFS_MEM_ICE_CFG
> >> b. Write 0x0 to UFS_MEM_ICE_CFG
> >>
> >> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> >> ---
> >>  drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
> >>  drivers/ufs/host/ufs-qcom.h |  2 ++
> >>  2 files changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> >> index 444a09265ded..2744614bbc32 100644
> >> --- a/drivers/ufs/host/ufs-qcom.c
> >> +++ b/drivers/ufs/host/ufs-qcom.c
> >> @@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
> >>  	if (ufs_qcom_is_link_off(hba) && host->device_reset)
> >>  		ufs_qcom_device_reset_ctrl(hba, true);
> >>  
> >> +	host->vdd_hba_pc = true;
> > 
> > What does this variable correspond to?
> Hi Manivannan,
> 
> It corresponds to power collapse, will rename it for better readability.
> 

What is 'power collapse' from UFS perspective?

> > 
> >> +
> >>  	return ufs_qcom_ice_suspend(host);
> >>  }
> >>  
> >> @@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >>  	return ufs_qcom_ice_resume(host);
> >>  }
> >>  
> >> +static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
> >> +				    enum uic_cmd_dme uic_cmd,
> >> +				    enum ufs_notify_change_status status)
> >> +{
> >> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >> +
> >> +	/* Apply shared ICE WA */
> > 
> > Are you really sure it is *shared ICE*?
> 
>  Yes Manivannan, I am.
> 

Well, there are two kind of registers defined in the internal doc that I can
see: UFS_MEM_ICE and UFS_MEM_SHARED_ICE. And hence the question.

> > 
> >> +	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
> >> +	    status == POST_CHANGE &&
> >> +	    host->hw_ver.major == 0x5 &&
> >> +	    host->hw_ver.minor == 0x0 &&
> >> +	    host->hw_ver.step == 0x0 &&
> >> +	    host->vdd_hba_pc) {
> >> +		host->vdd_hba_pc = false;
> >> +		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);
> > 
> > Define the actual bits instead of writing magic values.
> 
> Sure.
> 
> > 
> >> +		ufshcd_readl(hba, UFS_MEM_ICE);
> >> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
> >> +		ufshcd_readl(hba, UFS_MEM_ICE);
> > 
> > Why do you need readl()? Writes to device memory won't get reordered.
> 
> Since these are hardware register, there is a potential for reordering.
> 

Really? Who said that? Please cite the reference.

> > 
> >> +	}
> >> +}
> >> +
> >>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
> >>  {
> >>  	if (host->dev_ref_clk_ctrl_mmio &&
> >> @@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
> >>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
> >>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
> >>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
> >> +	.hibern8_notify		= ufs_qcom_hibern8_notify,
> > 
> > This callback is not called anywhere. Regardeless of that, why can't you use
> > ufs_qcom_clk_scale_notify()?
> > 
> 
> According to the HPG guidelines, as part of this workaround, we are required to reset the ICE controller during the Hibern8 exit sequence when the UFS controller resumes from power collapse. Therefore, this reset logic has been added to the H8 exit notifier callback.
> 

Please wrap the replies to 80 column.

Well, we do call ufshcd_uic_hibern8_exit() from these callbacks. So why can't
you reset the ICE after calling ufshcd_uic_hibern8_exit() here?

> The ufs_clk_scale_notify function is invoked whenever clock scaling (up or down) occurs, regardless of whether a power collapse has taken place. Hence, the ICE controller reset was specifically added to the H8 exit notifier to ensure it is executed only in the appropriate context.
> 

Please define what 'power collapse' mean here. And as I said before, you are
not at all calling this newly introduced callback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


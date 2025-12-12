Return-Path: <linux-arm-msm+bounces-85083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8992ECB778D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 01:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CADF300F588
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 00:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC9819D074;
	Fri, 12 Dec 2025 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozBOwH9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBA226299;
	Fri, 12 Dec 2025 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765500325; cv=none; b=BTXuVAUPuvgSOZ8ybmTmwtiIheAAYKH/j6f4mS9HE/S4ggbvFlLkrusuZW2UhLk9w4eFB4nvfWBkZh8xP0PaIymPcNkxOvEkh5qKXaeQtzTzLCHAxkgik/gcNno9gAC6vYXkSOIbQCQqKxQ6xEnR3No3tRtKGwSUXgkrMVutsnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765500325; c=relaxed/simple;
	bh=f6cB55aVH6/c0pD1Bfy2lcpivDC0tLdR4mIpekoOwMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLxSG5dU0u8W0pUXm+5XQMSS6m/OYivsHE3WMw/2HF5aWkq64tln84y6TBnmFnyMSBYEt4C0VRhsQYgF40v7+0vqUdFIJ4+IiKSZWkHP9oO06IUopgd8AswTczWQlfp2jwzj2eUj0gx6t8ChU4/w0MdFb4kSbuhv2iqpF7jQMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozBOwH9J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E968C4CEF7;
	Fri, 12 Dec 2025 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765500325;
	bh=f6cB55aVH6/c0pD1Bfy2lcpivDC0tLdR4mIpekoOwMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozBOwH9JktWNiBkOOEGDQcxNLTSIJBAWSmLL0HGPUpKOEaRC5+yF3OJuYYEkx6K1j
	 dmDIkR1LYX4lgJo6E0JQ/s1+Y1snpoUU28BKeqOoUDqp07vUC3858q/NZGD8MyLlVs
	 7S4hlZ4+a9ACB2IK1YOpT4eoyWL16vMT/teNmIDi0n65JsW6iHImAV/IAqxluG3fcb
	 L2uNOmxLUhsZq9OUcppxxpcxOYVBdjU4bxcFvRz/wAMrlmx/Pt3R4M/BKIpXIZMaHU
	 c22dppDN2cPUzsVxJGiC79ybn6F0ZhdAtK+ohRZSe9ZPNibtLbduoaWcKp+DR6w9bt
	 ttf4wPdvqEn6w==
Date: Fri, 12 Dec 2025 09:45:10 +0900
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, quic_ahari@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH V1 3/3] ufs: ufs-qcom: Add support for firmware-managed
 resource abstraction
Message-ID: <64hjdpdc745gazdzz7vuauhl5cohbfz2cgxb2yz2bt6mpezyb7@i2fyze7ozbc4>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
 <20251114145646.2291324-4-ram.dwivedi@oss.qualcomm.com>
 <avpwp57yqkljxkld7dsqdsc7m26wvmwwhvph6ljv43yjjdyqof@szlfmik6betd>
 <fcdeea3b-f20e-4b6c-9c64-5479f75b05b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcdeea3b-f20e-4b6c-9c64-5479f75b05b9@oss.qualcomm.com>

On Wed, Dec 10, 2025 at 09:33:08PM +0530, Ram Kumar Dwivedi wrote:
> 
> 
> On 20-Nov-25 11:23 AM, Manivannan Sadhasivam wrote:
> > On Fri, Nov 14, 2025 at 08:26:46PM +0530, Ram Kumar Dwivedi wrote:
> >> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >>
> >> Add a compatible string for SA8255p platforms where resources such as
> >> PHY, clocks, regulators, and resets are managed by firmware through an
> >> SCMI server. Use the SCMI power protocol to abstract these resources and
> >> invoke power operations via runtime PM APIs (pm_runtime_get/put_sync).
> >>
> >> Introduce vendor operations (vops) for SA8255p targets to enable SCMI-
> >> based resource control. In this model, capabilities like clock scaling
> >> and gating are not yet supported; these will be added incrementally.
> >>
> >> Co-developed-by: Anjana Hari <quic_ahari@quicinc.com>
> >> Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
> >> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> >> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> >> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >> ---
> >>  drivers/ufs/host/ufs-qcom.c | 161 +++++++++++++++++++++++++++++++++++-
> >>  drivers/ufs/host/ufs-qcom.h |   1 +
> >>  2 files changed, 161 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> >> index 8d119b3223cb..13ccf1fb2ebf 100644
> >> --- a/drivers/ufs/host/ufs-qcom.c
> >> +++ b/drivers/ufs/host/ufs-qcom.c
> >> @@ -14,6 +14,7 @@
> >>  #include <linux/of.h>
> >>  #include <linux/phy/phy.h>
> >>  #include <linux/platform_device.h>
> >> +#include <linux/pm_domain.h>
> >>  #include <linux/reset-controller.h>
> >>  #include <linux/time.h>
> >>  #include <linux/unaligned.h>
> >> @@ -619,6 +620,27 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
> >>  	return err;
> >>  }
> >>  
> >> +static int ufs_qcom_fw_managed_hce_enable_notify(struct ufs_hba *hba,
> >> +						 enum ufs_notify_change_status status)
> >> +{
> >> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >> +
> >> +	switch (status) {
> >> +	case PRE_CHANGE:
> >> +		ufs_qcom_select_unipro_mode(host);
> >> +		break;
> >> +	case POST_CHANGE:
> >> +		ufs_qcom_enable_hw_clk_gating(hba);
> >> +		ufs_qcom_ice_enable(host);
> >> +		break;
> >> +	default:
> >> +		dev_err(hba->dev, "Invalid status %d\n", status);
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >>  /**
> >>   * ufs_qcom_cfg_timers - Configure ufs qcom cfg timers
> >>   *
> >> @@ -789,6 +811,38 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >>  	return ufs_qcom_ice_resume(host);
> >>  }
> >>  
> >> +static int ufs_qcom_fw_managed_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
> >> +				       enum ufs_notify_change_status status)
> >> +{
> >> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >> +
> >> +	if (status == PRE_CHANGE)
> >> +		return 0;
> >> +
> >> +	if (hba->spm_lvl != UFS_PM_LVL_5) {
> >> +		dev_err(hba->dev, "Unsupported spm level %d\n", hba->spm_lvl);
> >> +		return -EINVAL;
> >> +	}
> > 
> > You should consider moving this check to ufs-sysfs.c where the sysfs write is
> > handled. Failing due to unsupported suspend level at the last moment could be
> > avoided.
> 
> Hi Mani,
> 
> We have planned to support other spm levels also in follow up series
> once the basic UFS SCMI functionality is upstreamed.  This spm_lvl check
> is intended as a temporary safeguard while we only support SPM level 5. 
> If you'd still prefer a change, I caupdate this in the next patchset.
> 

Please do it now as I don't see it logical to error out in suspend callback.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


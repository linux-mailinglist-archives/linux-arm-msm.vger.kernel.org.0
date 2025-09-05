Return-Path: <linux-arm-msm+bounces-72289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1CFB45886
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4052A7B5502
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BFE1D86FF;
	Fri,  5 Sep 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbyVlZEC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635B1BCA07;
	Fri,  5 Sep 2025 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757078025; cv=none; b=Wm1OvyXL1rzQs8n0PpNKzyWgfwDue+Jx03OGcyloBcqnJ1Xj6SvgG4mGlS87wxPq/KhiH18d+BUMa8sKIaDf3B4dXCCZvalnWXc78gWnZoEP1jLXgFz08PElyud26PYKKBcFvJmIvlCZIKhhxPLUqsMm87nyaQC+EF9pSG8qXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757078025; c=relaxed/simple;
	bh=psnf4hQKAp2Cx9mom1Q/QVqcoKJXFno8iWz7CTh6G1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVSQcHHvXfZ2D7JRFDESZ95X4BmPzovkO/Xb8JRTQqWgSTEAe7adfbmpac1QEw4z6Nba70qljcdHZe+TpWA3bhP7n1F3qLhqPYk6z3UKNpSm4nB+kndXxZZCv0mTGOFyhWKLhJIRWp1tDExicnmIhZK/WmPbLeSofudd5Gwey7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbyVlZEC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55DFBC4CEF1;
	Fri,  5 Sep 2025 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757078024;
	bh=psnf4hQKAp2Cx9mom1Q/QVqcoKJXFno8iWz7CTh6G1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbyVlZECJKfoODfPM/rXM+bFQ01/iGarOubsg1z/hjDn9oEGfCuewlUa3XZPmrhqh
	 cqutQ7770wchsayQAWXiFP6lxnj5zNLr14klSO+mWbxgXwF4eQII4X9i+YAB88FEx3
	 suQKqz2p7g0AgMozp2hsYbZFFQSC3C9ItcPZsRMLPrucqjkcvVPNQk5Ts+MQ4Ge5mR
	 m4mxrwTVr2vr5TzIXWQN3gUBIM+Chb/UlzomWdrjwCjr+gaB5an2ScUg9+fPG77N+E
	 8Jt+czJcDgwYLG5jAB4TlOrO/2lsq7bldRZ1pk0aHZ++3ROPF2NEy/0d1a4hrcqGe3
	 pjFgXMqnPf1BA==
Date: Fri, 5 Sep 2025 18:43:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH v5] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for  UFS controller v5
Message-ID: <a7vqktgfrfr2u53e7vnr5mqhty5l5entmtsoafnewk3ess4evx@442o73xkmdio>
References: <20250818040905.1753905-1-quic_pkambar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818040905.1753905-1-quic_pkambar@quicinc.com>

On Mon, Aug 18, 2025 at 09:39:05AM GMT, Palash Kambar wrote:
> Disabling the AES core in Shared ICE is not supported during power
> collapse for UFS Host Controller v5.0, which may lead to data errors
> after Hibern8 exit. To comply with hardware programming guidelines
> and avoid this issue, issue a sync reset to ICE upon power collapse
> exit.
> 
> Hence follow below steps to reset the ICE upon exiting power collapse
> and align with Hw programming guide.
> 
> a. Assert the ICE sync reset by setting both SYNC_RST_SEL and
>    SYNC_RST_SW bits in UFS_MEM_ICE_CFG
> b. Deassert the reset by clearing SYNC_RST_SW in  UFS_MEM_ICE_CFG
> 
> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> changes from V1:
> 1) Incorporated feedback from Konrad and Manivannan by adding a delay
>    between ICE reset assertion and deassertion.
> 2) Removed magic numbers and replaced them with meaningful constants.
> 
> changes from V2:
> 1) Addressed Manivannan's comment and moved change to ufs_qcom_resume.
> 
> changes from V3:
> 1) Addressed Manivannan's comments and added bit field values and
>    updated patch description.
> 
> change from V4:
> 1) Addressed Konrad's comment and fixed reset bit to zero.
> ---
>  drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 +-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 444a09265ded..242f8d479d4a 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -38,6 +38,9 @@
>  #define DEEMPHASIS_3_5_dB	0x04
>  #define NO_DEEMPHASIS		0x0
>  
> +#define UFS_ICE_SYNC_RST_SEL	BIT(3)
> +#define UFS_ICE_SYNC_RST_SW	BIT(4)
> +
>  enum {
>  	TSTBUS_UAWM,
>  	TSTBUS_UARM,
> @@ -751,11 +754,29 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>  	int err;
> +	u32 reg_val;
>  
>  	err = ufs_qcom_enable_lane_clks(host);
>  	if (err)
>  		return err;
>  
> +	if ((!ufs_qcom_is_link_active(hba)) &&
> +	    host->hw_ver.major == 5 &&
> +	    host->hw_ver.minor == 0 &&
> +	    host->hw_ver.step == 0) {
> +		ufshcd_writel(hba, UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW, UFS_MEM_ICE_CFG);
> +		reg_val = ufshcd_readl(hba, UFS_MEM_ICE_CFG);
> +		reg_val &= ~(UFS_ICE_SYNC_RST_SEL | UFS_ICE_SYNC_RST_SW);
> +		/*
> +		 * HW documentation doesn't recommend any delay between the
> +		 * reset set and clear. But we are enforcing an arbitrary delay
> +		 * to give flops enough time to settle in.
> +		 */
> +		usleep_range(50, 100);
> +		ufshcd_writel(hba, reg_val, UFS_MEM_ICE_CFG);
> +		ufshcd_readl(hba, UFS_MEM_ICE_CFG);
> +	}
> +
>  	return ufs_qcom_ice_resume(host);
>  }
>  
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 6840b7526cf5..81e2c2049849 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -60,7 +60,7 @@ enum {
>  	UFS_AH8_CFG				= 0xFC,
>  
>  	UFS_RD_REG_MCQ				= 0xD00,
> -
> +	UFS_MEM_ICE_CFG				= 0x2600,
>  	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
>  	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


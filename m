Return-Path: <linux-arm-msm+bounces-67892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D0B1C4AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 13:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B278B3A286F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8B1289803;
	Wed,  6 Aug 2025 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlbv/7NT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAE1DE89B;
	Wed,  6 Aug 2025 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754478861; cv=none; b=bVjedaClkuXuug/7gbXJTptuiglH8XrH2koXuPmW41tJ9bU0RuuKzJGajZ7sh1Yd71XXKwh9IRhRhHeAwvQ+i3xKuhK8QZWRn71UmSsNJykk9iBksVhG6Jdaie5Zd8ELPPWmj9vqs35YM3AX7naiAntYWM6aju4UpGHVyVeJnAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754478861; c=relaxed/simple;
	bh=mNe25aTo3XYao1BlrSYDRvkkEi8DqHgrJvgLOBQ+9H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGW6fP/a9XAamfjHjugxvNtJ0SdXOAvL2wI6WnsBsTr5CJ26Mm73rfC06TYlPdAMJK9N2iosFCTy0tx/NzFchc09t67dciWfP3EemW121l4MMGaTNbZLBFayGa8byik29bj6BFXsvDKDx8B9coMilVajTpz/YsqKUXcrHPLgsl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlbv/7NT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB80C4CEE7;
	Wed,  6 Aug 2025 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754478861;
	bh=mNe25aTo3XYao1BlrSYDRvkkEi8DqHgrJvgLOBQ+9H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlbv/7NTFliu1A7FMJ+jSoONJT/l4Gf9kt5Eo/nee7UHqFPtxqIMkID15z06ePOX6
	 5rLDYr9lyZ+HJ7Tqfi6/kULPztklxU3uNgG8G6JUFyV9ZW8see3TT6haBvMZ1VXqWL
	 0Ac4vNDwLBxOVGFga33yV2VQivJDputwTcECBFG9B9UNu+e8HbMgdjMJZ6SbD0FQ7f
	 TZcRb+CTDFBdslFxFL4njQxpxX8U8wzJFyBOmIjNcZXAwWKgvRqEMX8LoT8pGkeMsT
	 S/bpGElHajhHaT3nPj4+7gIkOK1xugc2p3kdgFTr+qSohoUZbHYrfKqb8vT+AC3eMi
	 av2XtHJiVdy5Q==
Date: Wed, 6 Aug 2025 16:44:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH v1] ufs: ufs-qcom: Align programming sequence of Shared
 ICE for  UFS controller v5
Message-ID: <ucr4imzntw6ghcvpeioprmva7gxrqnkphjirjppnqgdpq5ghss@y5nwjzzpvluj>
References: <20250806063409.21206-1-quic_pkambar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806063409.21206-1-quic_pkambar@quicinc.com>

On Wed, Aug 06, 2025 at 12:04:09PM GMT, Palash Kambar wrote:
> Disable of AES core in Shared ICE is not supported during power
> collapse for UFS Host Controller V5.0.
> 
> Hence follow below steps to reset the ICE upon exiting power collapse
> and align with Hw programming guide.
> 
> a. Write 0x18 to UFS_MEM_ICE_CFG
> b. Write 0x0 to UFS_MEM_ICE_CFG
> 
> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 ++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 444a09265ded..2744614bbc32 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -744,6 +744,8 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  	if (ufs_qcom_is_link_off(hba) && host->device_reset)
>  		ufs_qcom_device_reset_ctrl(hba, true);
>  
> +	host->vdd_hba_pc = true;

What does this variable correspond to?

> +
>  	return ufs_qcom_ice_suspend(host);
>  }
>  
> @@ -759,6 +761,27 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	return ufs_qcom_ice_resume(host);
>  }
>  
> +static void ufs_qcom_hibern8_notify(struct ufs_hba *hba,
> +				    enum uic_cmd_dme uic_cmd,
> +				    enum ufs_notify_change_status status)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	/* Apply shared ICE WA */

Are you really sure it is *shared ICE*?

> +	if (uic_cmd == UIC_CMD_DME_HIBER_EXIT &&
> +	    status == POST_CHANGE &&
> +	    host->hw_ver.major == 0x5 &&
> +	    host->hw_ver.minor == 0x0 &&
> +	    host->hw_ver.step == 0x0 &&
> +	    host->vdd_hba_pc) {
> +		host->vdd_hba_pc = false;
> +		ufshcd_writel(hba, 0x18, UFS_MEM_ICE);

Define the actual bits instead of writing magic values.

> +		ufshcd_readl(hba, UFS_MEM_ICE);
> +		ufshcd_writel(hba, 0x0, UFS_MEM_ICE);
> +		ufshcd_readl(hba, UFS_MEM_ICE);

Why do you need readl()? Writes to device memory won't get reordered.

> +	}
> +}
> +
>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
>  {
>  	if (host->dev_ref_clk_ctrl_mmio &&
> @@ -2258,6 +2281,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>  	.hce_enable_notify      = ufs_qcom_hce_enable_notify,
>  	.link_startup_notify    = ufs_qcom_link_startup_notify,
>  	.pwr_change_notify	= ufs_qcom_pwr_change_notify,
> +	.hibern8_notify		= ufs_qcom_hibern8_notify,

This callback is not called anywhere. Regardeless of that, why can't you use
ufs_qcom_clk_scale_notify()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


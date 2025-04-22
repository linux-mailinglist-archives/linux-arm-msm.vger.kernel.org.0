Return-Path: <linux-arm-msm+bounces-54955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC3A96ABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 14:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533CF3BFDC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 12:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3A227CCF2;
	Tue, 22 Apr 2025 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiigICZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1D27C177;
	Tue, 22 Apr 2025 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325948; cv=none; b=LY5E4i0JglTnuXQJ8nDHCQZFYp7WuhL+llV5Qws7TVKeG4WuY4lb2dxpXelywOOT6aujqZu41CfCoiyU/p7L2g0GQZ5Rgpl5yfcmNcJXNAHDPCcu8mqquxE2DvGkZ18N4iV9W55stQIAFvIib6DTSosx8UfSGOrYwSXOx9cuGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325948; c=relaxed/simple;
	bh=3e73V+L5xW9ZTTLWy6FpC4egDQdkuqoSP1shJDGBlL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnshC1+i6M0Z/OIJi2VdVvfeb/Bm+sY09TDThIzdETLRGkuky/YfD45tfl7BrKzVjBmUqLkH/v8JIeK3aYWLImiOsNIDAgYFEDWgWQNTgtj7lJOsSFAn6AIzmdCw+DdFX/fkkLKq7HN1n6VSdTjyn1Pgl1CtHgT4z0sLfPh0y70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiigICZv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E48C5C4CEE9;
	Tue, 22 Apr 2025 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745325948;
	bh=3e73V+L5xW9ZTTLWy6FpC4egDQdkuqoSP1shJDGBlL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiigICZvIWLipETco2mnMB5J0rxBz0MWK0QWa9VUw6ytL53t3gmtmuBo5gdfNTVbT
	 YDZhRnGWD9v/oN+72ZFnCTuJPpVBfMCmXMjiGqxYZinrtPFRgjj6KZhktOlDbg4uYR
	 qjPy3d45SsPim32ZZEfo7k9gBo85n7TvzfKYbj5XNT6gB04r/IoPHkdyLT4ewMdPHf
	 mnfww5UhMo6Gbk6PMMNzMndoyorgdyQ2sytgGrfbU25nzbZlYKxZ42kM9qER6FvMz7
	 hSF+KcVK3O936qpouUciG9tBGvXmzfqayIcnUPpb+6YC3adAUM4sRSfiKPel5yyNqT
	 MPG9CvhwYCPLA==
Date: Tue, 22 Apr 2025 07:45:46 -0500
From: Rob Herring <robh@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
	krzk+dt@kernel.org, mani@kernel.org, conor+dt@kernel.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	beanhuo@micron.com, peter.wang@mediatek.com,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
Message-ID: <20250422124546.GB896279-robh@kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-4-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417124645.24456-4-quic_nitirawa@quicinc.com>

On Thu, Apr 17, 2025 at 06:16:45PM +0530, Nitin Rawat wrote:
> There are emulation FPGA platforms or other platforms where UFS low
> power mode is either unsupported or power efficiency is not a critical
> requirement.
> 
> Disable all low power mode UFS feature based on the "disable-lpm" device
> tree property parsed in platform driver.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 1b37449fbffc..1024edf36b68 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1014,13 +1014,14 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
> 
>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>  {
> -	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> -	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
> -	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
> -	hba->caps |= UFSHCD_CAP_WB_EN;
> -	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
> -	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> -
> +	if (!hba->disable_lpm) {
> +		hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
> +		hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
> +		hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
> +		hba->caps |= UFSHCD_CAP_WB_EN;
> +		hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
> +		hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
> +	}

Doesn't RuntimePM already have userspace controls? And that's a Linux 
feature that shouldn't really be controlled by DT. I think this property 
should still to things defined by the UFS spec.

Rob


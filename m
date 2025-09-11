Return-Path: <linux-arm-msm+bounces-73169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B7B539ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 19:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E67A16DC9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 17:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364712E8B60;
	Thu, 11 Sep 2025 17:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HChqNQwZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0009022AE45;
	Thu, 11 Sep 2025 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757610357; cv=none; b=UEZmZRLzmZRX2AhAmXyWruUF/BVcsv2v4qNqP544gOr7XGTs+txP0xdPdrVhi+hgOFTIdGEw0c2JxGKyPyN96/DWIBl9gQidEZONO+qPbtu1pMFZ359UNXcQb11Cpt2z0qSt4StiZEqM4eWVa9f0fktq/CMTeHsBHJUi5gx4ex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757610357; c=relaxed/simple;
	bh=UCP4l+ePO9V9JvXhGoSlqVr4Thxy4s2Q/7YityqrEJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2hpvmyk4uWlJVnRIPxDXkDS9XysNFpAGfdwWTW8H0L7uW/Y/SbG+RUU1f++X69L7WnH5lrT6jrqhtBHTj+oanBrB5Q4Rv+UV3bGC4ImwziCE19awEORRCwQGeywYrZPGo+nvWjOVsUqNq7e8cVLbJ2G7lyrAuXfcDSqlP3S6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HChqNQwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107ABC4CEF0;
	Thu, 11 Sep 2025 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757610356;
	bh=UCP4l+ePO9V9JvXhGoSlqVr4Thxy4s2Q/7YityqrEJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HChqNQwZ9j7MKmL3/36PZ3PF+wQSEDS45AodMPLBTZiuZeApR63p9u01CM04U3QJZ
	 63H0h6ILGAEf01qKGgRMDDH9Xa2EFgWhS3q78tYO+roO/wE5cM2jMth9pSFC69gjhi
	 aYy9Q7cBVQQleaCESL/E82QW9pWxpIwOUtkR0gt6+dhRMk3GnNC9nxBzOZY9nbmSyh
	 KTSzvMxaT3LgAwH2iQ38N+rl1VIHJLy9qbnNCnM9fro0tpUdYQMVUTGNuJHWuTopjW
	 9tAzIkXAZYlNvnwfjjqcIPRUG2de2dsINRKXxDbvom3rE43IBJfEb3f901EOD42sPt
	 UJt/twgwLcRig==
Date: Thu, 11 Sep 2025 22:35:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH V2] ufs: ufs-qcom: disable lane clocks during phy hibern8
Message-ID: <isafba2w6ddl2wqiescae6a5dab66ezuinuq7aaivriz3pnixt@j6ymwk3itcka>
References: <20250909055149.2068737-1-quic_pkambar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909055149.2068737-1-quic_pkambar@quicinc.com>

On Tue, Sep 09, 2025 at 11:21:49AM GMT, Palash Kambar wrote:
> Currently, the UFS lane clocks remain enabled even after the link
> enters the Hibern8 state and are only disabled during runtime/system
> suspend.This patch modifies the behavior to disable the lane clocks
> during ufs_qcom_setup_clocks(), which is invoked shortly after the
> link enters Hibern8 via gate work.
> 
> While hibern8_notify() offers immediate control, toggling clocks on
> every transition isn't ideal due to varied contexts like clock scaling.
> Since setup_clocks() manages PHY/controller resources and is invoked
> soon after Hibern8 entry, it serves as a central and stable point
> for clock gating.
> 
> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> ---
> changes from V1:
> 1) Addressed Manivannan's comments and added detailed justification.
> ---
>  drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index c0761ccc1381..83ad25ce053d 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1092,6 +1092,13 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  	case PRE_CHANGE:
>  		if (on) {
>  			ufs_qcom_icc_update_bw(host);
> +			if (ufs_qcom_is_link_hibern8(hba)) {
> +				err = ufs_qcom_enable_lane_clks(host);
> +				if (err) {
> +					dev_err(hba->dev, "enable lane clks failed, ret=%d\n", err);
> +					return err;
> +				}
> +			}
>  		} else {
>  			if (!ufs_qcom_is_link_active(hba)) {
>  				/* disable device ref_clk */
> @@ -1105,6 +1112,9 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  			if (ufshcd_is_hs_mode(&hba->pwr_info))
>  				ufs_qcom_dev_ref_clk_ctrl(host, true);
>  		} else {
> +			if (ufs_qcom_is_link_hibern8(hba))
> +				ufs_qcom_disable_lane_clks(host);
> +
>  			ufs_qcom_icc_set_bw(host, ufs_qcom_bw_table[MODE_MIN][0][0].mem_bw,
>  					    ufs_qcom_bw_table[MODE_MIN][0][0].cfg_bw);
>  		}
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


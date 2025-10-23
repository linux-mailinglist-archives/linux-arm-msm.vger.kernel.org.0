Return-Path: <linux-arm-msm+bounces-78454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCBBBFF397
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 07:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C678B357E00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 05:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DD3264638;
	Thu, 23 Oct 2025 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLOglbJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D898D262FDD;
	Thu, 23 Oct 2025 05:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196151; cv=none; b=XBCZtcQivD/O7T2QY5HA8mxEfGTeUNIHjnSs4Q2DAOLi3AwbvM81gDjTUC9SpagDjvg0RXOPSXv7NdXBBIvLM+fEIAJgIupFzMQsObCs8+MlF3pOk5PbSpoEtaeEkBt8kCjtWxY/WMgKX6NonZCAWI/XFPxGmy+0Z0y1uYLkYzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196151; c=relaxed/simple;
	bh=FyjRpBeYFT67/gyCyrlrMx2WiI6e9HPkH1XYB+MG1oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtRho+mJFFwMIW4JJUelWzisz+HlTKXPjtEnSfbRnDOBT4UwmuEjHG5c0Lv6MwLS7bQ0MTfVpust97iA262bNrUgSrUqoJn4cj4VuODUkUp3KHwt8ukW56aM5KYIjJMrf6+TmOP6/zQDKoO9l+Yke6n5xH/WBXKun9Uw/6haxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLOglbJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06381C4CEE7;
	Thu, 23 Oct 2025 05:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761196147;
	bh=FyjRpBeYFT67/gyCyrlrMx2WiI6e9HPkH1XYB+MG1oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLOglbJRy1A0ajYKT2q2hyJd3Kz6kHQ7aGupPJzHEbzRWo7n4L1KLIi1hizR2SDQn
	 A4xmOBoJJw/cTZpQfchaHCNib8PzLZSZLI2KOa1NhR0AxORj9uDiDI4HwlLL4kxgF9
	 HY1KHsGJlHgRx6Rzh1R4zR05E7FyZAxMi6l8+p4s+WX9e0MN9gDFwtt4BU/+7Ev3S8
	 E7uDYr7kyMBHdJjNALuQJFitymhtvG+YKfbsJdU3Q9plN8dIlYRF4TihyJusTIKKz5
	 1dALmvO7FTFXC9Ydmz3cStbhq0H0fSFhVVTtbE1HEHCJuXD1JPF+fVxiJ2W514bZzJ
	 rNWODuekvnBfQ==
Date: Thu, 23 Oct 2025 10:38:53 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	bvanassche@acm.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V1] ufs: ufs-qcom: Fix UFS OCP issue during UFS power
 down(PC=3)
Message-ID: <ugyg2k4typuw6btpcxtbxs4bv5oisuor37m6efu5mnsvirqyvo@yqzwm2t6bm7i>
References: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251012173828.9880-1-nitin.rawat@oss.qualcomm.com>

On Sun, Oct 12, 2025 at 11:08:28PM +0530, Nitin Rawat wrote:
> According to UFS specifications, the power-off sequence for a UFS
> device includes:
> 
> - Sending an SSU command with Power_Condition=3 and await a
>   response.
> - Asserting RST_N low.
> - Turning off REF_CLK.
> - Turning off VCC.
> - Turning off VCCQ/VCCQ2.
> 
> As part of ufs shutdown , after the SSU command completion, asserting
> hardware reset (HWRST) triggers the device firmware to wake up and
> execute its reset routine. This routine initializes hardware blocks
> and takes a few milliseconds to complete. During this time, the
> ICCQ draws a large current.
> 
> This large ICCQ current may cause issues for the regulator which
> is supplying power to UFS, because the turn off request from UFS
> driver to the regulator framework will be immediately followed by
> low power mode(LPM) request by regulator framework. This is done
> by framework because UFS which is the only client is requesting
> for disable. So if the rail is still in the process of shutting down
> while ICCQ exceeds LPM current thresholds, and LPM mode is activated
> in hardware during this state, it may trigger an overcurrent
> protection (OCP) fault in the regulator.
> 
> To prevent this, a 10ms delay is added after asserting HWRST. This
> allows the reset operation to complete while power rails remain active
> and in high-power mode.
> 
> Currently there is no way for Host to query whether the reset is
> completed or not and hence this the delay is based on experiments
> with Qualcomm UFS controllers across multiple UFS vendors.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 89a3328a7a75..cb54628be466 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -744,8 +744,21 @@ static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
> 
> 
>  	/* reset the connected UFS device during power down */
> -	if (ufs_qcom_is_link_off(hba) && host->device_reset)
> +	if (ufs_qcom_is_link_off(hba) && host->device_reset) {
>  		ufs_qcom_device_reset_ctrl(hba, true);
> +		/*
> +		 * After sending the SSU command, asserting the rst_n
> +		 * line causes the device firmware to wake up and
> +		 * execute its reset routine.
> +		 *
> +		 * During this process, the device may draw current
> +		 * beyond the permissible limit for low-power mode (LPM).
> +		 * A 10ms delay, based on experimental observations,
> +		 * allows the UFS device to complete its hardware reset
> +		 * before transitioning the power rail to LPM.
> +		 */
> +		usleep_range(10000, 11000);
> +	}
> 
>  	return ufs_qcom_ice_suspend(host);
>  }
> --
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்


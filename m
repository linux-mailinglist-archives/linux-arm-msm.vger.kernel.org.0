Return-Path: <linux-arm-msm+bounces-95362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE7TN+lRqGnUtAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:38:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CFE202ECF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A60230FBE04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BB1331A43;
	Wed,  4 Mar 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRozwjX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD433121F;
	Wed,  4 Mar 2026 15:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637637; cv=none; b=fOpVySlgJnSqTvat7UIfFR/JiqOYUzDtsPVcjpxEyfXW/guuy1VBbNvCN8+vAqrPIMLt49MyDOUF8CikDsGKieodG8EMlM4DfxxNz7TbwFBpTcvAsHOUrNW4BrEekG7v6CXRVXNBKUnx/6hUe1l1y/MlpTys47p+hg414dE1hV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637637; c=relaxed/simple;
	bh=lbNhH/cdOWVOv0hoQh2SiUucMhK/gL8qIkSi1wMeBQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcFLCJ5qGiMtA6AO8qWxjIo8X+AK1bY9kZuttZFxqVzWHF3YSriUDhztX7YPEJrdS84CV6QcuQ8bcYa9wiOjN88w+/4kCDGk/RIwKl2bDyM0PDYmIvgm1moGHPYPiyvD+8VRN2NRa0PopRVIccrp2JWy6vZlk2mDgDgSwYchZSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRozwjX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C4CC4CEF7;
	Wed,  4 Mar 2026 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772637637;
	bh=lbNhH/cdOWVOv0hoQh2SiUucMhK/gL8qIkSi1wMeBQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vRozwjX+Gv1G1vWt/CohlzqmGBdoCTOD3z8131ZjgYK3YOUh4vFFufgYS8+ucHRSz
	 yAC1TmdOGNXGT+drUiwBn26SAHDJ/YqDJz9JXb3zpItpLtgY1l5uvAEns8RQv14oQ6
	 ZnxTJ3qh8OmumDJyRbJT8zppbg5IxyasGsbIT1qjgF0P8aE0RQCMwgnaZ7fbTHO8fO
	 56nEu8Z8TWDuF9imRpt7vkPhnX5IiVXLmHXixe+MGx/tihj7FzYEDKc63+gTJkfQxN
	 u80wMqYrercPxKBCzbIFMqUJ6sb8bWEhMx/2eooMfjS8ARoiUWy+36DEzUGoMXfyLK
	 GYvY+qgkKMK6g==
Date: Wed, 4 Mar 2026 20:50:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <can.guo@oss.qualcomm.com>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com, 
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/11] scsi: ufs: ufs-qcom: Implement vops
 tx_eqtr_notify()
Message-ID: <fpcbidjthsvsxszyqhd6qwydjilquq76pkexjcqiis5wzdplzx@6ap7gopmudqu>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-9-can.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304135313.413688-9-can.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 62CFE202ECF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95362-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 05:53:10AM -0800, Can Guo wrote:
> On some platforms, HW does not support triggering TX EQTR from the most
> reliable High-Speed (HS) Gear (HS Gear1), but only allows to trigger TX
> EQTR for the target HS Gear from the same HS Gear. To work around the HW
> limitation, implement vops tx_eqtr_notify() to change Power Mode to the
> target TX EQTR HS Gear prior to TX EQTR procedure and change Power Mode
> back to HS Gear1 (the most reliable gear) post TX EQTR procedure.
> 
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 63 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 3a9279066192..1e074058f23d 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2512,6 +2512,68 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
>  	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
>  }
>  
> +static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
> +				      struct ufs_pa_layer_attr *pwr_mode,
> +				      enum ufshcd_pmc_policy pmc_policy)
> +{
> +	int ret;
> +
> +	ret = ufs_qcom_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
> +	if (ret) {
> +		dev_err(hba->dev, "Power change notify (PRE_CHANGE) failed: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = ufshcd_change_power_mode(hba, pwr_mode, pmc_policy);
> +	if (ret)
> +		return ret;
> +
> +	ufs_qcom_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
> +
> +	return ret;

return 0;

> +}
> +
> +static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
> +				   enum ufs_notify_change_status status,
> +				   struct ufs_pa_layer_attr *pwr_mode)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_pa_layer_attr pwr_mode_hs_g1 = {
> +		.gear_rx = UFS_HS_G1,
> +		.gear_tx = UFS_HS_G1,
> +		.lane_rx = pwr_mode->lane_rx,
> +		.lane_tx = pwr_mode->lane_tx,
> +		.pwr_rx = FAST_MODE,
> +		.pwr_tx = FAST_MODE,
> +		.hs_rate = pwr_mode->hs_rate,
> +	};
> +	u32 gear = pwr_mode->gear_tx;
> +	u32 rate = pwr_mode->hs_rate;
> +	int ret;
> +
> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
> +		return 0;
> +
> +	if (status == PRE_CHANGE) {
> +		/* PMC to target HS Gear. */
> +		ret = ufs_qcom_change_power_mode(hba, pwr_mode,
> +						 UFSHCD_PMC_POLICY_DONT_FORCE);
> +		if (ret)
> +			dev_err(hba->dev, "%s: Failed to change power mode to target HS-G%u, Rate-%s: %d\n",

Same comment as other patch. Goes over 100 column.

> +				__func__, gear, UFS_HS_RATE_STRING(rate), ret);

Can we please not specify the function name in error log?

- Mani

-- 
மணிவண்ணன் சதாசிவம்


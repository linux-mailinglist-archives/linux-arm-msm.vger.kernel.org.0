Return-Path: <linux-arm-msm+bounces-95361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL4sGkBRqGnUtAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:35:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA9202DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E09FB30DF393
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407D8322B83;
	Wed,  4 Mar 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZoo4wFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACA286A4;
	Wed,  4 Mar 2026 15:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637049; cv=none; b=qv+AdFd50S970f4VuznJofO/tjs98Jp12vNcu4M3Aa682w8ofa5lOiSaApfCJYSGzMjSbzUq/t0Bgl03VjK6Vlp4QxiQoQ8ENBcjUDDLO9OIueEBTHebNcxJ4M4N53emPMW1lYi5YhIwV4e6RVEhR+SpDKZzLZ7PAxYR/yQL4f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637049; c=relaxed/simple;
	bh=CG9KzzVM26ZNq02wY4JVHL0QJ6N+XoeJH8G9nUEKn9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LU/2JcPxkaW/WqMce2sfff1KyQCyXXx741qwauQLuUTOiMgPuBzFcEEk5U2GDtHelyGmyzF0g1Izvrx8+C2EorND7PbxFt3HA6DIg0rg2qSGpnaCzjO5eFKmdgvM4QD7usXWJKytMtR5VHrJ+yC/0JUvdZbsZthx36xz7Am5zzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZoo4wFM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F17C19423;
	Wed,  4 Mar 2026 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772637049;
	bh=CG9KzzVM26ZNq02wY4JVHL0QJ6N+XoeJH8G9nUEKn9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZoo4wFMIhNMBzWmq01DZ50Sf+gHWv5lk4GK5MBA2Y5PbXRT2me2OKrRv/81mOuFs
	 NjGx6GOmCGjPmBKn0btird4EchdI4sGtGz4d02+ImTOB58PKzSJWJIKyGczGRpgHx+
	 NVanVHvvz4oXiz1sPI68Rz4B3wAv+JE/jUT5G0UU2ik3SJOYP8T/zqOA/NUwxUzLO6
	 UMInZ/JpXKnSD7wOx+1eYKm5eyaA4GN0/YKPhEMb3xSY93czvbq0WyUH7Va+8igX/B
	 cXW7fI6PVqoq4AZvp5hNAL7VrI0gyNzQWjcs5NiSD1RIdbkB6gR5jrkHDO6nywS8qx
	 7wojiH8lmzjaQ==
Date: Wed, 4 Mar 2026 20:40:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <can.guo@oss.qualcomm.com>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com, 
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/11] scsi: ufs: ufs-qcom: Fixup PAM-4 TX L0_L1_L2_L3
 adaptation pattern length
Message-ID: <5jri65eq7jc4p3bd2tcgvlgctqf4c2v4sthotkqvavp4rjyzha@hkhw7maeftq3>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-8-can.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304135313.413688-8-can.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 11DA9202DAF
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
	TAGGED_FROM(0.00)[bounces-95361-lists,linux-arm-msm=lfdr.de];
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

On Wed, Mar 04, 2026 at 05:53:09AM -0800, Can Guo wrote:
> If HS-G6 Power Mode change handshake is successful and outbound data Lanes
> are expected to transmit ADAPT, M-TX Lanes shall be configured as
> 
> if (Adapt Type == REFRESH)
>   TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 = PA_PeerRxHsG6AdaptRefreshL0L1L2L3.
> else if (Adapt Type == INITIAL)
>   TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 = PA_PeerRxHsG6AdaptInitialL0L1L2L3.
> 
> On some platforms, the ADAPT_L0_L1_L2_L3 duration on Host TX Lanes is only
> a half of theoretical ADAPT_L0_L1_L2_L3 duration TADAPT_L0_L1_L2_L3 (in
> PAM-4 UI) calculated from TX_HS_ADAPT_LENGTH_L0_L1_L2_L3.
> 
> For such platforms, the workaround is to double the ADAPT_L0_L1_L2_L3
> duration by uplifting TX_HS_ADAPT_LENGTH_L0_L1_L2_L3. UniPro initializes
> TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 during HS-G6 Power Mode change handshake,
> it would be too late for SW to update TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 post
> HS-G6 Power Mode change. Update PA_PeerRxHsG6AdaptRefreshL0L1L2L3 and
> PA_PeerRxHsG6AdaptInitialL0L1L2L3 post Link Startup and before HS-G6
> Power Mode change, so that the UniPro would use the updated value during
> HS-G6 Power Mode change handshake.
> 
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 175 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 175 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 5eb12a999eb1..3a9279066192 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1079,10 +1079,185 @@ static void ufs_qcom_override_pa_tx_hsg1_sync_len(struct ufs_hba *hba)
>  		dev_err(hba->dev, "Failed (%d) set PA_TX_HSG1_SYNC_LENGTH\n", err);
>  }
>  
> +/**
> + * ufs_qcom_double_t_adapt_l0l1l2l3 - Create a new adapt that doubles the
> + * adaptation duration TADAPT_L0_L1_L2_L3 derived from the old adapt.
> + *
> + * @old_adapt: Original ADAPT_L0_L1_L2_L3 capability
> + *
> + * ADAPT_length_L0_L1_L2_L3 formula from M-PHY spec:
> + * if (ADAPT_range_L0_L1_L2_L3 == COARSE) {
> + *   ADAPT_length_L0_L1_L2_L3 = [0, 12]
> + *   ADAPT_L0_L1_L2_L3 = 215 x 2^ADAPT_length_L0_L1_L2_L3
> + * } else if (ADAPT_range_L0_L1_L2_L3 == FINE) {
> + *   ADAPT_length_L0_L1_L2_L3 = [0, 127]
> + *   TADAPT_L0_L1_L2_L3 = 215 x (ADAPT_length_L0_L1_L2_L3 + 1)
> + * }
> + *
> + * To double the adaptation duration TADAPT_L0_L1_L2_L3:
> + * 1. If adapt range is COARSE (1'b1), new adapt = old adapt + 1.
> + * 2. If adapt range is FINE (1'b0):
> + *   a) If old adapt length is < 64, (new adapt + 1) = 2 * (old adapt + 1).
> + *   b) If old adapt length is >= 64, set new adapt to 0x88 using COARSE
> + *      range, because new adapt get from equation in a) shall exceed 127.
> + *
> + * Examples:
> + * ADAPT_range_L0_L1_L2_L3 | ADAPT_length_L0_L1_L2_L3 | TADAPT_L0_L1_L2_L3 (PAM-4 UI)
> + *		0			3			131072
> + *		0			7			262144
> + *		0			63			2097152
> + *		0			64			2129920
> + *		0			127			4194304
> + *		1			8			8388608
> + *		1			9			16777216
> + *		1			10			33554432
> + *		1			11			67108864
> + *		1			12			134217728
> + *
> + * Return: new adapt.
> + */
> +static inline u32 ufs_qcom_double_t_adapt_l0l1l2l3(u32 old_adapt)

No need of 'inline' keyword in a .c file. Same comment to other helpers.

Also, can you change the '_l0l1l2l3' suffix to something like '_level' or
'_length'?

> +{
> +	u32 adapt_length = old_adapt & 0x7F;

Please add a define for 0x75

> +	u32 new_adapt;
> +
> +	/* Adapt range == COARSE */
> +	if (old_adapt & 0x80) {

This one also.

> +		new_adapt = (adapt_length + 1) | 0x80;
> +	} else {
> +		if (adapt_length < 64)

And this one.

> +			new_adapt = (adapt_length << 1) + 1;
> +		else
> +			new_adapt = 0x88;
> +	}
> +
> +	return new_adapt;
> +}
> +
> +static inline void ufs_qcom_limit_max_gear(struct ufs_hba *hba,
> +					   enum ufs_hs_gear_tag gear)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_pa_layer_attr *pwr_info = &hba->max_pwr_info.info;
> +	struct ufs_host_params *host_params = &host->host_params;
> +
> +	host_params->hs_tx_gear = gear;
> +	host_params->hs_rx_gear = gear;
> +	pwr_info->gear_tx = gear;
> +	pwr_info->gear_rx = gear;
> +
> +	dev_warn(hba->dev, "Limited max gear of both sides to HS-G%d\n", gear);

s/both sides/host and device

> +}
> +
> +static void ufs_qcom_fixup_tx_adapt_l0l1l2l3(struct ufs_hba *hba)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_pa_layer_attr *pwr_info = &hba->max_pwr_info.info;
> +	struct ufs_host_params *host_params = &host->host_params;
> +	u32 adapt_l0l1l2l3, new_adapt, actual_adapt;

Can you shorten adapt_l0l1l2l3?

> +	bool limit_speed = false;
> +	int err;
> +
> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1 ||
> +	    host_params->hs_tx_gear <= UFS_HS_G5 ||
> +	    pwr_info->gear_tx <= UFS_HS_G5)
> +		return;
> +
> +	err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3), &adapt_l0l1l2l3);
> +	if (err)
> +		goto out;
> +
> +	if (adapt_l0l1l2l3 > ADAPT_L0L1L2L3_LENGTH_MAX) {
> +		dev_err(hba->dev, "PA_PeerRxHsG6AdaptInitialL0L1L2L3 value (0x%x) exceeds MAX.\n",

Nit: remove full stop at the end

> +			adapt_l0l1l2l3);
> +		err = -EINVAL;

-ERANGE

> +		goto out;
> +	}
> +
> +	new_adapt = ufs_qcom_double_t_adapt_l0l1l2l3(adapt_l0l1l2l3);
> +	dev_dbg(hba->dev, "Original PA_PeerRxHsG6AdaptInitialL0L1L2L3 value = 0x%x, new value = 0x%x\n",
> +		adapt_l0l1l2l3, new_adapt);
> +
> +	/*
> +	 * 0x8C is the max possible value allowed by UniPro v3.0 spec, some HWs
> +	 * can accept 0x8D but some cannot.
> +	 */
> +	if (new_adapt <= ADAPT_L0L1L2L3_LENGTH_MAX ||
> +	    (new_adapt == ADAPT_L0L1L2L3_LENGTH_MAX + 1 && host->hw_ver.minor == 0x1)) {
> +		err = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3),
> +				     new_adapt);
> +		if (err)
> +			goto out;
> +
> +		err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3),
> +				     &actual_adapt);
> +		if (err)
> +			goto out;
> +
> +		if (actual_adapt != new_adapt) {
> +			limit_speed = true;
> +			dev_warn(hba->dev, "Failed to update host PA_PeerRxHsG6AdaptInitialL0L1L2L3 to new value 0x%x, actual value = 0x%x\n",

This goes beyond 100 column width. Please consider shortening up. Applies to
other prints as well.

> +				 new_adapt, actual_adapt);
> +		}
> +	} else {
> +		limit_speed = true;
> +		dev_warn(hba->dev, "New PA_PeerRxHsG6AdaptInitialL0L1L2L3 value (0x%x) is too large!\n",
> +			 new_adapt);
> +	}
> +
> +	err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3), &adapt_l0l1l2l3);
> +	if (err)
> +		goto out;
> +
> +	if (adapt_l0l1l2l3 > ADAPT_L0L1L2L3_LENGTH_MAX) {
> +		dev_err(hba->dev, "PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value (0x%x) exceeds MAX.\n",
> +			adapt_l0l1l2l3);
> +		err = -EINVAL;

-ERANGE

> +		goto out;
> +	}
> +
> +	new_adapt = ufs_qcom_double_t_adapt_l0l1l2l3(adapt_l0l1l2l3);
> +	dev_dbg(hba->dev, "Original PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value = 0x%x, new value = 0x%x\n",
> +		adapt_l0l1l2l3, new_adapt);
> +
> +	/*
> +	 * 0x8C is the max possible value allowed by UniPro v3.0 spec, some HWs
> +	 * can accept 0x8D but some cannot.
> +	 */
> +	if (new_adapt <= ADAPT_L0L1L2L3_LENGTH_MAX ||
> +	    (new_adapt == ADAPT_L0L1L2L3_LENGTH_MAX + 1 && host->hw_ver.minor == 0x1)) {
> +		err = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3),
> +				     new_adapt);
> +		if (err)
> +			goto out;
> +
> +		err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3),
> +				     &actual_adapt);
> +		if (err)
> +			goto out;
> +
> +		if (actual_adapt != new_adapt) {
> +			limit_speed = true;
> +			dev_warn(hba->dev, "Failed to update host PA_PeerRxHsG6AdaptRefreshL0L1L2L3 to new value 0x%x, actual value = 0x%x\n",
> +				 new_adapt, actual_adapt);
> +		}
> +	} else {
> +		limit_speed = true;
> +		dev_warn(hba->dev, "New PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value (0x%x) is too large!\n",
> +			 new_adapt);

I'm assuming it is safe to continue despite the warnings.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


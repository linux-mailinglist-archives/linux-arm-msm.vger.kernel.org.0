Return-Path: <linux-arm-msm+bounces-95365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB0IGPJbqGmZtgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:21:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ABF2041D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45137337C2A7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3093563FB;
	Wed,  4 Mar 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yn0IldHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5754C3563EA;
	Wed,  4 Mar 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638809; cv=none; b=L3jwzjcIXWLPpC8u7Fa8ntMEaIgQJlYvhnhyXLyu41jfskGlb9q2RalG6ZEmavo3AdsyhiMSy5+jgRfyB6LsvSS6zmI5ebRTPZPmkzrC5BrNYSZ4M35rDoBET1yFpgrkfJyrRGFPMavbfe2GuWuzgpWo9zql6MsZJKyRplGBLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638809; c=relaxed/simple;
	bh=x2GFsWUAXVV+143T8OkPA+H5dyk+qg28t8r9xm3JhX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JREOicHsjpFdr1rF+Qz0WqHwsUJPz4iZRwQ665/R4tPoxGMaQOMFzHy++yA9XIRM+iHe2CW/nXUT8cC6soxVQ5oHsFqcrdKEqiwuKwvp4+iUGtmXmjCCF+twJ5RylA50zohz/hn/GZ7XbVDGVA62tiuAft9Fq+LlzXHaP++jztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yn0IldHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9EFC19423;
	Wed,  4 Mar 2026 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772638809;
	bh=x2GFsWUAXVV+143T8OkPA+H5dyk+qg28t8r9xm3JhX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yn0IldHNgZINLiTnuH0mbEp72zbKpNo6Cw3EcrWyAb8zivGrF+mxaqrCZsfxTfw6q
	 R+CGEoCUHEPHYfEqiWRqY9vCZqXUvkEYAFhcUMvgKvTZw3dd2ckOE0P8kxTyfKYKGG
	 aIw4jZg7KMi6qulIKrGJjofI/vR0ZTE+jGkmQN7lpcu+t7ZRECFopm4eAWi+H6UDDT
	 gvjsU/SqfNkZFnM/9W6TsAM0V/c0XKKaRqm+aQp+fi8KXz3gLEdLzmBQTN9yy97iUs
	 +QcU1cKLaiE97QVnPA8de7r0Kz5bNJ1L0uEpUdXqZ6rZBJbs2jgPf9uqXzRtV87hWo
	 IzVyVrIiztGoQ==
Date: Wed, 4 Mar 2026 21:09:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <can.guo@oss.qualcomm.com>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com, 
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 09/11] scsi: ufs: ufs-qcom: Implement vops get_rx_fom()
Message-ID: <ffijub727efmyhatukpqlridfdknwzbsc2dedeohx3snosxqzs@os7ddqrmziqd>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-10-can.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304135313.413688-10-can.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: C4ABF2041D4
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
	TAGGED_FROM(0.00)[bounces-95365-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 05:53:11AM -0800, Can Guo wrote:
> On some platforms, host's M-PHY RX_FOM Attribute always reads 0, meaning
> SW cannot rely on Figure of Merit (FOM) to identify the optimal TX
> Equalization settings for device's TX Lanes. Implement the vops
> ufs_qcom_get_rx_fom() such that SW can utilize the UFS Eye Opening Monitor
> (EOM) to evaluate the TX Equalization settings for device's TX Lanes.
> 
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
> ---
>  drivers/ufs/core/ufs-txeq.c |   6 +-
>  drivers/ufs/host/ufs-qcom.c | 315 ++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  42 +++++
>  include/ufs/ufshcd.h        |   3 +
>  include/ufs/unipro.h        |  16 ++
>  5 files changed, 379 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
> index 2cd2d5156607..02c1a8479910 100644
> --- a/drivers/ufs/core/ufs-txeq.c
> +++ b/drivers/ufs/core/ufs-txeq.c
> @@ -227,9 +227,8 @@ ufshcd_compose_tx_eq_setting(struct ufshcd_tx_eq_settings *settings,
>   *
>   * Returns 0 on success, negative error code otherwise
>   */
> -static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
> -				       struct ufshcd_tx_eq_params *params,
> -				       u32 gear)
> +int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
> +				struct ufshcd_tx_eq_params *params, u32 gear)
>  {
>  	u32 setting;
>  	int ret;
> @@ -259,6 +258,7 @@ static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(ufshcd_apply_tx_eq_settings);
>  
>  /**
>   * ufshcd_evaluate_fom - Update TX EQ params based on FOM results
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 1e074058f23d..b8fa4670ddd6 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2534,6 +2534,320 @@ static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
>  	return ret;
>  }
>  
> +static int ufs_qcom_host_eom_config(struct ufs_hba *hba, int lane, int v_step,
> +				    int t_step, enum ufs_eom_eye_pos eye_pos,
> +				    u32 target_test_count)
> +{
> +	u32 volt_step, timing_step;
> +	int ret;
> +
> +	if (v_step > 127 || v_step < -127) {
> +		dev_err(hba->dev, "Invalid EOM Voltage Step: %d\n", v_step);
> +		return -EINVAL;

-ERANGE

> +	}
> +
> +	if (t_step > 63 || t_step < -63) {
> +		dev_err(hba->dev, "Invalid EOM Timing Step: %d\n", t_step);
> +		return -EINVAL;

-ERANGE

> +	}
> +
> +	if (v_step < 0)
> +		volt_step = BIT(6) | (u32)(-v_step);

What does BIT(6) correspond to? Create a define maybe?

> +	else
> +		volt_step = (u32)v_step;
> +
> +	if (t_step < 0)
> +		timing_step = BIT(6) | (u32)(-t_step);
> +	else
> +		timing_step = (u32)t_step;
> +
> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     BIT(eye_pos) | BIT(6));
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to enable Host EOM on Lane %d: %d\n",
> +			lane, ret);
> +		return ret;
> +	}
> +
> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TIMING_STEPS,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     timing_step);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to set Host EOM timing step on Lane %d: %d\n",
> +			lane, ret);
> +		return ret;
> +	}
> +
> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_VOLTAGE_STEPS,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     volt_step);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to set Host EOM voltage step on Lane %d: %d\n",
> +			lane, ret);
> +		return ret;
> +	}
> +
> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TARGET_TEST_COUNT,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     target_test_count);
> +	if (ret)
> +		dev_err(hba->dev, "Failed to set Host EOM target test count on Lane %d: %d\n",
> +			lane, ret);
> +
> +	return ret;
> +}
> +
> +static int ufs_qcom_host_eom_may_stop(struct ufs_hba *hba, int lane,
> +				      u32 target_test_count, u32 *err_count)
> +{
> +	u32 start, tested_count, error_count;
> +	int ret;
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_START,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     &start);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to get Host EOM start status on Lane %d: %d\n",
> +			lane, ret);
> +		return ret;
> +	}
> +
> +	if (start & 0x1)
> +		return -EAGAIN;
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TESTED_COUNT,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     &tested_count);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to get Host EOM tested count on Lane %d: %d\n",
> +			lane, ret);
> +		return ret;
> +	}
> +
> +	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ERROR_COUNT,
> +				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +			     &error_count);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to get Host EOM error count on Lane %d: %d\n",
> +			lane, ret);
> +		return ret;
> +	}
> +
> +	/* EOM can stop */
> +	if ((tested_count >= target_test_count - 3) || error_count > 0) {
> +		*err_count = error_count;
> +
> +		/* Disable EOM */
> +		ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
> +					UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
> +				     0x0);
> +		if (ret) {
> +			dev_err(hba->dev, "Failed to disable Host EOM on Lane %d: %d\n",
> +				lane, ret);
> +			return ret;
> +		}
> +	} else {
> +		return -EAGAIN;
> +	}
> +
> +	return ret;

return 0;

> +}
> +
> +static int ufs_qcom_host_eom_scan(struct ufs_hba *hba, int num_lanes,
> +				  const struct ufs_eom_coord *eom_coord,
> +				  u32 target_test_count, u32 *err_count)
> +{
> +	bool eom_stopped[PA_MAXDATALANES] = { 0 };
> +	enum ufs_eom_eye_pos eye_pos;
> +	int lane, v_step, t_step, ret;
> +	u32 setting;
> +
> +	if (!err_count || !eom_coord)
> +		return -EINVAL;
> +
> +	if (target_test_count < 8) {
> +		dev_err(hba->dev, "%s: Target test count (%u) too small for Host EOM\n",
> +			__func__, target_test_count);

No __func__ please.

> +		return -EINVAL;

-ERANGE

> +	}
> +
> +	v_step = eom_coord->v_step;
> +	t_step = eom_coord->t_step;
> +	eye_pos = eom_coord->eye_pos;
> +
> +	for (lane = 0; lane < num_lanes; lane++) {
> +		ret = ufs_qcom_host_eom_config(hba, lane, v_step, t_step,
> +					       eye_pos, target_test_count);
> +		if (ret) {
> +			dev_err(hba->dev, "Failed to config Host EOM: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Trigger a PACP_PWR_req to kick start EOM, but not to really change
> +	 * the Power Mode.
> +	 */
> +	ret = ufshcd_uic_change_pwr_mode(hba, FAST_MODE << 4 | FAST_MODE);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to change power mode to kick start Host EOM: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +more_burst:
> +	/* Create burst on Host RX Lane. */
> +	ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_LOCALVERINFO), &setting);
> +
> +	for (lane = 0; lane < num_lanes; lane++) {
> +		if (eom_stopped[lane])
> +			continue;
> +
> +		ret = ufs_qcom_host_eom_may_stop(hba, lane, target_test_count,
> +						 &err_count[lane]);
> +		if (!ret) {
> +			eom_stopped[lane] = true;
> +		} else if (ret == -EAGAIN) {
> +			/* Need more burst to excercise EOM */
> +			goto more_burst;
> +		} else {
> +			dev_err(hba->dev, "Failed to stop Host EOM: %d\n", ret);
> +			return ret;
> +		}
> +
> +		dev_dbg(hba->dev, "%s: Host RX Lane %d EOM, v_step %d, t_step %d, error count %u\n",
> +			__func__, lane, v_step, t_step, err_count[lane]);
> +	}
> +
> +	return ret;

return 0;

> +}
> +
> +static int ufs_qcom_host_sw_rx_fom(struct ufs_hba *hba, int num_lanes, u32 *fom)
> +{
> +	const struct ufs_eom_coord *eom_coord = sw_rx_fom_eom_coords_g6;
> +	u32 eom_err_count[PA_MAXDATALANES] = { 0 };
> +	u32 curr_ahit;
> +	int lane, i, ret;
> +
> +	if (!fom)
> +		return -EINVAL;
> +
> +	/* Stop the auto hibernate idle timer */
> +	curr_ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +	if (curr_ahit)
> +		ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +
> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXHSADAPTTYPE), PA_NO_ADAPT);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to select NO_ADAPT before starting Host EOM: %d\n",
> +			__func__, ret);
> +		goto out;
> +	}
> +
> +	for (i = 0; i < SW_RX_FOM_EOM_COORDS; i++, eom_coord++) {
> +		ret = ufs_qcom_host_eom_scan(hba, num_lanes, eom_coord, 0x3F,
> +					     eom_err_count);
> +		if (ret) {
> +			dev_err(hba->dev, "%s: Failed to run Host EOM scan: %d\n",
> +				__func__, ret);
> +			break;
> +		}
> +
> +		for (lane = 0; lane < num_lanes; lane++) {
> +			/* Bad coordinates have no weights */
> +			if (eom_err_count[lane])
> +				continue;
> +			fom[lane] += SW_RX_FOM_EOM_COORDS_WEIGHT;
> +		}
> +	}
> +
> +out:
> +	/* Restore the auto hibernate idle timer */
> +	if (curr_ahit)
> +		ufshcd_writel(hba, curr_ahit, REG_AUTO_HIBERNATE_IDLE_TIMER);
> +
> +	return ret;
> +}
> +
> +static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
> +			       struct ufs_pa_layer_attr *pwr_mode,
> +			       struct tx_eqtr_iter *h_iter,
> +			       struct tx_eqtr_iter *d_iter)
> +{
> +	struct ufshcd_tx_eq_params *params __free(kfree) =
> +		kzalloc(sizeof(*params), GFP_KERNEL);
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	struct ufs_pa_layer_attr old_pwr_info;
> +	u32 fom[PA_MAXDATALANES] = { 0 };
> +	u32 gear = pwr_mode->gear_tx;
> +	u32 rate = pwr_mode->hs_rate;
> +	int lane, ret;
> +
> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1 ||
> +	    gear <= UFS_HS_G5 || !d_iter || !d_iter->is_new)
> +		return 0;
> +
> +	if (gear < UFS_HS_G1 || gear >= UFS_HS_GEAR_MAX)
> +		return -EINVAL;

-ERANGE

> +
> +	if (!params)
> +		return -ENOMEM;
> +
> +	memcpy(&old_pwr_info, &hba->pwr_info, sizeof(struct ufs_pa_layer_attr));
> +
> +	memcpy(params, &hba->tx_eq_params[gear - 1], sizeof(struct ufshcd_tx_eq_params));
> +	for (lane = 0; lane < d_iter->num_lanes; lane++) {
> +		params->device[lane].preshoot = d_iter->preshoot;
> +		params->device[lane].deemphasis = d_iter->deemphasis;
> +	}
> +
> +	/* Use TX EQTR settings as Device's TX Equalization settings. */
> +	ret = ufshcd_apply_tx_eq_settings(hba, params, gear);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
> +			__func__, gear, ret);
> +		return ret;
> +	}
> +
> +	/* Force PMC to target HS Gear to use new TX Equalization settings. */
> +	ret = ufs_qcom_change_power_mode(hba, pwr_mode, UFSHCD_PMC_POLICY_FORCE);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
> +			__func__, gear, UFS_HS_RATE_STRING(rate), ret);
> +		return ret;
> +	}
> +
> +	ret = ufs_qcom_host_sw_rx_fom(hba, d_iter->num_lanes, fom);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to get Host SW FOM for Device TX Lane (PreShoot: %u, DeEmphasis: %u): %d\n",
> +			d_iter->preshoot, d_iter->deemphasis, ret);
> +		return ret;
> +	}
> +
> +	/* Restore Device's TX Equalization settings. */
> +	ret = ufshcd_apply_tx_eq_settings(hba, &hba->tx_eq_params[gear - 1], gear);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
> +			__func__, gear, ret);
> +		return ret;
> +	}
> +
> +	/* Restore Power Mode. */
> +	ret = ufs_qcom_change_power_mode(hba, &old_pwr_info, UFSHCD_PMC_POLICY_FORCE);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to retore power mode to HS-G%u: %d\n",
> +			__func__, old_pwr_info.gear_tx, ret);
> +		return ret;
> +	}
> +
> +	for (lane = 0; lane < d_iter->num_lanes; lane++)
> +		d_iter->fom[lane] = fom[lane];
> +
> +	return ret;

return 0;

- Mani

-- 
மணிவண்ணன் சதாசிவம்


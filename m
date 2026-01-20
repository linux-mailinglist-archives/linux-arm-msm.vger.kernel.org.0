Return-Path: <linux-arm-msm+bounces-89839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMAcCIFrcGkVXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:00:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8047F51D20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F339D900743
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 13:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EC1428487;
	Tue, 20 Jan 2026 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwlNWz3R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EEA22B8A9;
	Tue, 20 Jan 2026 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768915877; cv=none; b=RBt9tbsfprvkiXZeoo52lZvD7HH/WDAMhZsWAc00ZHMV0yk3fIOvmskj312nA2+lg5ZelFUjsKyIHrt1RFcutBUaKooMmcUtorMzJWTqGwU43vP86FLtDk/a46IcMiZYnOX0LWYhrJPHYGGI4lj13V0C1Oy60chGM65gPOiOU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768915877; c=relaxed/simple;
	bh=6j+idBzclO+0D7z9TUe/L16qx6Y+s3uoBK82KF7kVGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYON74Mqdub2tBICz7poYFdEXl9i8o6EJWHN+WXiKINmMHdDALbAApU4V6/bRxfffidBJtzAMOjvpPB7//Z40XRrIIu7oD65fGs1cLAPtNqoUDXvqajC1MLHZ+E1AM57w6FfFTpwTAjHhcLvAsUUeJsdY7EmSBUK2CVjTZYSewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwlNWz3R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7C2C19424;
	Tue, 20 Jan 2026 13:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768915876;
	bh=6j+idBzclO+0D7z9TUe/L16qx6Y+s3uoBK82KF7kVGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwlNWz3RI+LjPnfvu2Ma1if/mJzanEF+f9b4s7QmfLXFS9xJKudPnImF9u8TlONQa
	 +JK0mCJTHrGwAqAQiipfPsJweo+ctOFPB8/YmBI1J53ZXrDvCT/PFkGT9C1CLDTJu3
	 HLJQd9bqKzSyiiBW/AiPLa7UvljoMgMxZrlGfkcJV4cUgQofsM9lE2fXDaVvWjKu1/
	 ERbdZFqP+hLqzdTlDg0dN99xiW1ju9Z2hTvqOmXwi2buFMrclfYZNQc8WSu5zFtBUp
	 0h4DzQd/mKl2/3Ap4s2dG2XW/H/zQvI4HOw9ACj7WW3UigobdvoQGcdk6VpNzFK3J8
	 azO4DqcuA3MlQ==
Date: Tue, 20 Jan 2026 19:01:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anjana Hari <anjana.hari@oss.qualcomm.com>, Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: Re: [PATCH V5 4/4] ufs: ufs-qcom: Add support for firmware-managed
 resource abstraction
Message-ID: <2wxvdpiq4ng5yrvsnog6dwhs5z367xm2wvx5lers62p6fxbc5t@7ydwmlwzvaej>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
 <20260113080046.284089-5-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113080046.284089-5-ram.dwivedi@oss.qualcomm.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89839-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8047F51D20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 13, 2026 at 01:30:46PM +0530, Ram Kumar Dwivedi wrote:
> Add a compatible string for SA8255p platforms where resources such as
> PHY, clocks, regulators, and resets are managed by firmware through an
> SCMI server. Use the SCMI power protocol to abstract these resources and
> invoke power operations via runtime PM APIs (pm_runtime_get/put_sync).
> 
> Introduce vendor operations (vops) for SA8255p targets to enable SCMI-
> based resource control. In this model, capabilities like clock scaling
> and gating are not yet supported; these will be added incrementally.
> 
> Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 156 +++++++++++++++++++++++++++++++++++-
>  drivers/ufs/host/ufs-qcom.h |   1 +
>  2 files changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8ebee0cc5313..375fd24ba458 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/reset-controller.h>
>  #include <linux/time.h>
>  #include <linux/unaligned.h>
> @@ -619,6 +620,27 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>  	return err;
>  }
>  
> +static int ufs_qcom_fw_managed_hce_enable_notify(struct ufs_hba *hba,
> +						 enum ufs_notify_change_status status)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	switch (status) {
> +	case PRE_CHANGE:
> +		ufs_qcom_select_unipro_mode(host);
> +		break;
> +	case POST_CHANGE:
> +		ufs_qcom_enable_hw_clk_gating(hba);
> +		ufs_qcom_ice_enable(host);
> +		break;
> +	default:
> +		dev_err(hba->dev, "Invalid status %d\n", status);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * ufs_qcom_cfg_timers - Configure ufs qcom cfg timers
>   *
> @@ -789,6 +811,33 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	return ufs_qcom_ice_resume(host);
>  }
>  
> +static int ufs_qcom_fw_managed_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
> +				       enum ufs_notify_change_status status)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +
> +	if (status == PRE_CHANGE)
> +		return 0;
> +
> +	pm_runtime_put_sync(hba->dev);
> +
> +	return ufs_qcom_ice_suspend(host);
> +}
> +
> +static int ufs_qcom_fw_managed_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(hba->dev);
> +	if (err) {
> +		dev_err(hba->dev, "PM runtime resume failed: %d\n", err);
> +		return err;
> +	}
> +
> +	return ufs_qcom_ice_resume(host);
> +}
> +
>  static void ufs_qcom_dev_ref_clk_ctrl(struct ufs_qcom_host *host, bool enable)
>  {
>  	if (host->dev_ref_clk_ctrl_mmio &&
> @@ -1421,6 +1470,54 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
>  	phy_exit(host->generic_phy);
>  }
>  
> +static int ufs_qcom_fw_managed_init(struct ufs_hba *hba)
> +{
> +	struct device *dev = hba->dev;
> +	struct ufs_qcom_host *host;
> +	int err;
> +
> +	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	host->hba = hba;
> +	ufshcd_set_variant(hba, host);
> +
> +	ufs_qcom_get_controller_revision(hba, &host->hw_ver.major,
> +					 &host->hw_ver.minor, &host->hw_ver.step);
> +
> +	err = ufs_qcom_ice_init(host);
> +	if (err)
> +		goto out_variant_clear;
> +
> +	ufs_qcom_get_default_testbus_cfg(host);
> +	err = ufs_qcom_testbus_config(host);
> +	if (err)
> +		/* Failure is non-fatal */
> +		dev_warn(dev, "Failed to configure the testbus %d\n", err);
> +
> +	hba->caps |= UFSHCD_CAP_WB_EN;
> +
> +	ufs_qcom_advertise_quirks(hba);
> +	host->hba->quirks &= ~UFSHCD_QUIRK_REINIT_AFTER_MAX_GEAR_SWITCH;
> +
> +	hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min = UFS_PM_LVL_5;
> +
> +	ufs_qcom_set_host_params(hba);
> +	ufs_qcom_parse_gear_limits(hba);
> +
> +	return 0;
> +
> +out_variant_clear:
> +	ufshcd_set_variant(hba, NULL);
> +	return err;
> +}
> +
> +static void ufs_qcom_fw_managed_exit(struct ufs_hba *hba)
> +{
> +	pm_runtime_put_sync(hba->dev);
> +}
> +
>  /**
>   * ufs_qcom_set_clk_40ns_cycles - Configure 40ns clk cycles
>   *
> @@ -1950,6 +2047,37 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> +/**
> + * ufs_qcom_fw_managed_device_reset - Reset UFS device under FW-managed design
> + * @hba: pointer to UFS host bus adapter
> + *
> + * In the firmware-managed reset model, the power domain is powered on by genpd
> + * before the UFS controller driver probes. For subsequent resets (such as
> + * suspend/resume or recovery), the UFS driver must explicitly invoke PM runtime
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int ufs_qcom_fw_managed_device_reset(struct ufs_hba *hba)
> +{
> +	static bool is_boot = true;
> +	int err;
> +
> +	/* Skip reset on cold boot; perform it on subsequent calls */
> +	if (is_boot) {
> +		is_boot = false;
> +		return 0;
> +	}
> +
> +	pm_runtime_put_sync(hba->dev);
> +	err = pm_runtime_resume_and_get(hba->dev);
> +	if (err < 0) {
> +		dev_err(hba->dev, "PM runtime resume failed: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  					struct devfreq_dev_profile *p,
>  					struct devfreq_simple_ondemand_data *d)
> @@ -2229,6 +2357,20 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>  	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
>  };
>  
> +static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
> +	.name                   = "qcom-sa8255p",
> +	.init                   = ufs_qcom_fw_managed_init,
> +	.exit                   = ufs_qcom_fw_managed_exit,
> +	.hce_enable_notify      = ufs_qcom_fw_managed_hce_enable_notify,
> +	.pwr_change_notify      = ufs_qcom_pwr_change_notify,
> +	.apply_dev_quirks       = ufs_qcom_apply_dev_quirks,
> +	.fixup_dev_quirks       = ufs_qcom_fixup_dev_quirks,
> +	.suspend                = ufs_qcom_fw_managed_suspend,
> +	.resume                 = ufs_qcom_fw_managed_resume,
> +	.dbg_register_dump      = ufs_qcom_dump_dbg_regs,
> +	.device_reset           = ufs_qcom_fw_managed_device_reset,
> +};
> +
>  /**
>   * ufs_qcom_probe - probe routine of the driver
>   * @pdev: pointer to Platform device handle
> @@ -2239,9 +2381,16 @@ static int ufs_qcom_probe(struct platform_device *pdev)
>  {
>  	int err;
>  	struct device *dev = &pdev->dev;
> +	const struct ufs_hba_variant_ops *vops;
> +	const struct ufs_qcom_drvdata *drvdata = device_get_match_data(dev);
> +
> +	if (drvdata && drvdata->vops)
> +		vops = drvdata->vops;
> +	else
> +		vops = &ufs_hba_qcom_vops;
>  
>  	/* Perform generic probe */
> -	err = ufshcd_pltfrm_init(pdev, &ufs_hba_qcom_vops);
> +	err = ufshcd_pltfrm_init(pdev, vops);
>  	if (err)
>  		return dev_err_probe(dev, err, "ufshcd_pltfrm_init() failed\n");
>  
> @@ -2269,10 +2418,15 @@ static const struct ufs_qcom_drvdata ufs_qcom_sm8550_drvdata = {
>  	.no_phy_retention = true,
>  };
>  
> +static const struct ufs_qcom_drvdata ufs_qcom_sa8255p_drvdata = {
> +	.vops = &ufs_hba_qcom_sa8255p_vops
> +};
> +
>  static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,ufshc" },
>  	{ .compatible = "qcom,sm8550-ufshc", .data = &ufs_qcom_sm8550_drvdata },
>  	{ .compatible = "qcom,sm8650-ufshc", .data = &ufs_qcom_sm8550_drvdata },
> +	{ .compatible = "qcom,sa8255p-ufshc", .data = &ufs_qcom_sa8255p_drvdata },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, ufs_qcom_of_match);
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 380d02333d38..1111ab34da01 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -313,6 +313,7 @@ struct ufs_qcom_host {
>  struct ufs_qcom_drvdata {
>  	enum ufshcd_quirks quirks;
>  	bool no_phy_retention;
> +	const struct ufs_hba_variant_ops *vops;
>  };
>  
>  static inline u32
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


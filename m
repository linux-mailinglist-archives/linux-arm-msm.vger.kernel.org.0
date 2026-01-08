Return-Path: <linux-arm-msm+bounces-87981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A985ED00FCD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 05:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CE7A301EFDC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 04:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C55299A8F;
	Thu,  8 Jan 2026 04:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJUKcP/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B6298CA5;
	Thu,  8 Jan 2026 04:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767847366; cv=none; b=oytFZuJaBDzYHbstu/jrfKIrHh30l9JS3/bHk7Zi/OWKvxewVfDc48++IZc/0pn0lMszNuxl4CWgl3kAu41KkzDmJbE/5Gv8wurpFrWuZLTz6THTbPXp3CGGkvwbat2Ps+yoRU5ZICpyzWrkOanF57BG0VtSFDBDiYZilIETlss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767847366; c=relaxed/simple;
	bh=PiDWB5DtELjwIteo2F2lQ3194uoAdX1J/wX6/XGSmK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1euaqKruyEnAcyXuGFHTkBpOrItKnIRmyRw0wMDDLk4NpGF6E5gBcSK6itXHZraAyzTNZLejieftzEvmbMXBdfLEm4NH4AMQiUpHv6qetE7DLRUdnCFyWd0rw7G9aCdRj/WmD7fJ7xe3rtmOj9JqkMeddCkTSu9Kxer8FGQgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJUKcP/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A92C116C6;
	Thu,  8 Jan 2026 04:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767847366;
	bh=PiDWB5DtELjwIteo2F2lQ3194uoAdX1J/wX6/XGSmK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sJUKcP/4DVWZnjujo6yZZ0BeUWY3t5pnmkqIEB6jk8SPA35Syp6hMs7GH4IGmObWF
	 ZEv5JKWc2q6LDJLAOGgZYMwotlfGcC++bM7RzZ8a8MZJEWl17NE2pTN11hgjY2jFYQ
	 ZrK7YqFpem6VPnzChn6nwOyxFwLEczEBEQ5jPYz2/U/gf4EiQ7xLeRvIWwkxP9n9u5
	 YDOAsHm3fOz3X883zjV9yQpXHmVORjTkfX737v9L2sPw005QLxbGfykdO94sdwnuqp
	 7WEHUiyn5jE+1afDTDw9TOWC5NfnxmcybthLHwWM6TND2cQg1YHDExwlrih3ZGM9eI
	 WG4ipq9lLhYTQ==
Date: Thu, 8 Jan 2026 10:12:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, 
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anjana Hari <anjana.hari@oss.qualcomm.com>, Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Subject: Re: [PATCH V4 4/4] ufs: ufs-qcom: Add support for firmware-managed
 resource abstraction
Message-ID: <c2cb45n5gg2zlwwwzffjb2ycsksguhykoi7gghmaq3gfr3lf5t@6kvcteqptskq>
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-5-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260106134008.1969090-5-ram.dwivedi@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 07:10:08PM +0530, Ram Kumar Dwivedi wrote:
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
> ---
>  drivers/ufs/host/ufs-qcom.c | 164 +++++++++++++++++++++++++++++++++++-
>  drivers/ufs/host/ufs-qcom.h |   1 +
>  2 files changed, 164 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8ebee0cc5313..ddca7b344642 100644
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
> @@ -789,6 +811,38 @@ static int ufs_qcom_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
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
> +	if (hba->spm_lvl != UFS_PM_LVL_5) {
> +		dev_err(hba->dev, "Unsupported spm level %d\n", hba->spm_lvl);
> +		return -EINVAL;

After the sysfs change, do you still need this check?

> +	}
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
> @@ -1421,6 +1475,55 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
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
> +	hba->pm_lvl_min = UFS_PM_LVL_5;
> +	hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min;

hba->spm_lvl = hba->rpm_lvl = hba->pm_lvl_min = UFS_PM_LVL_5; ?

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
> @@ -1950,6 +2053,39 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> +/**
> + * ufs_qcom_fw_managed_device_reset - Reset UFS device under FW-managed design
> + * @hba: pointer to UFS host bus adapter
> + *
> + * In the firmware-managed reset model, cold boot power-on is handled
> + * automatically by the PM domain framework during SCMI protocol init,

No. genpd handles the power on for the power domain before UFS controller driver
probes. SCMI protocol init has nothing to do with it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linux-arm-msm+bounces-82613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122EC7248A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 06:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4489A4E5415
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 05:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EF22BD024;
	Thu, 20 Nov 2025 05:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgNYciMg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53526A1B5;
	Thu, 20 Nov 2025 05:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763618024; cv=none; b=prMxsXMHyw4WhuxSIUfS/LxfPM6blmKdcOH1WueFBOr8ZqjzyKiPj+EQfUcVRijhUCdXrZF1kgtvtKIebf3KWrCFL5N1ReRR+kP1eOnjSy5h0l1VO9vPclFoiM1GZKVug1ANNpCqr2g8njMdVtqpg0anF17M5ILJWsnmK6+w0PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763618024; c=relaxed/simple;
	bh=ZxSLBt7y7kqXZURIsohmOU3ZTYO209PLn7aCv4WTc8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiX3K7uaB9mE4LAyvOkykgwlcIu4w0l87by42n4vUpE+XfN89Y1shMiXyMLU4aZ4N9DBhsbHHzHYWXmaP3933DOG/kforX4d3l4ZBrDEnynYPJqCQbCyYPxiLNqilSpE4aZOw8VfzTp6Zoc2kF4uuOAPiuGZ+EUR/xEt8/3EyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgNYciMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D06BC4CEF1;
	Thu, 20 Nov 2025 05:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763618024;
	bh=ZxSLBt7y7kqXZURIsohmOU3ZTYO209PLn7aCv4WTc8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgNYciMgWOtX/7PxD9HWGs9m0VH9dI9UQvRX7WhvJGJUoq/BHdh5mOVRbgKHS6Szz
	 Chx5TuojqyKoN52Pici2nUfByaZoTuhRjyrW0+HceEhNU5CGJ3DFwROvyMCG1Qtp4g
	 oVR9TPwQPdE93D35TtoY6AmqxqR5+8RVwrZEn337VAwgyASK20O5FtsDl5O+ITRsh8
	 w6vmNNtowxab8rnmIPaK6HBgVmSJ8ruSxr2g41c3An3XOgB6MVp+atE7RP4TKs1uE+
	 DNvbp/7HWXebz8TfkKlOJcGGyXZUzyx1va/4y86UyG4+iARaA0+gYXlBh4tXVGsHWE
	 zio7SghEtUzkg==
Date: Thu, 20 Nov 2025 11:23:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, quic_ahari@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shazad Hussain <quic_shazhuss@quicinc.com>
Subject: Re: [PATCH V1 3/3] ufs: ufs-qcom: Add support for firmware-managed
 resource abstraction
Message-ID: <avpwp57yqkljxkld7dsqdsc7m26wvmwwhvph6ljv43yjjdyqof@szlfmik6betd>
References: <20251114145646.2291324-1-ram.dwivedi@oss.qualcomm.com>
 <20251114145646.2291324-4-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114145646.2291324-4-ram.dwivedi@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 08:26:46PM +0530, Ram Kumar Dwivedi wrote:
> From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> 
> Add a compatible string for SA8255p platforms where resources such as
> PHY, clocks, regulators, and resets are managed by firmware through an
> SCMI server. Use the SCMI power protocol to abstract these resources and
> invoke power operations via runtime PM APIs (pm_runtime_get/put_sync).
> 
> Introduce vendor operations (vops) for SA8255p targets to enable SCMI-
> based resource control. In this model, capabilities like clock scaling
> and gating are not yet supported; these will be added incrementally.
> 
> Co-developed-by: Anjana Hari <quic_ahari@quicinc.com>
> Signed-off-by: Anjana Hari <quic_ahari@quicinc.com>
> Co-developed-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 161 +++++++++++++++++++++++++++++++++++-
>  drivers/ufs/host/ufs-qcom.h |   1 +
>  2 files changed, 161 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8d119b3223cb..13ccf1fb2ebf 100644
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
> +	}

You should consider moving this check to ufs-sysfs.c where the sysfs write is
handled. Failing due to unsupported suspend level at the last moment could be
avoided.

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
> @@ -1421,6 +1475,52 @@ static void ufs_qcom_exit(struct ufs_hba *hba)
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
> @@ -1952,6 +2052,39 @@ static int ufs_qcom_device_reset(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> +/**
> + * ufs_qcom_fw_managed_device_reset - Reset UFS device under FW-managed design

I believe this is not just device reset but both controller + device reset. So
not pretty sure that this is the right place to reset both.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


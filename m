Return-Path: <linux-arm-msm+bounces-35676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE669AE3C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F95E1F21675
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 11:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205551CF28B;
	Thu, 24 Oct 2024 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WBKywO1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874E148838;
	Thu, 24 Oct 2024 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769089; cv=none; b=aHBnvyVn0oB4vjep6Z09LFInLU9gRw8sQToTtrk9q80luz/ljk/q93/1oymBUT/ZYocjgVeXgB4Z9Lti7ypjRmUZ2W19EM/XxLGB49/muRsh5iv51quWzQWmKix1tbfNtapW5JelecKZvSU4n3SsypR6pXRcr2EU6RKGOTLvEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769089; c=relaxed/simple;
	bh=bKn1zWxfQ+atPPXQ2airthHAbMPyOIETHQqWmdUEkMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDZ6VSNsooim5e1tCE9IOXMNhYNARASlRe8urgYc3SnZLD1GmtVJfx7hyDZy2E7Vkj2E2GDI2H7C/e9YssUoM0rJsBw5Yx86yQWkqEBBczEUJEjqih9T2odl0pFMsq6/7g7+Cm+t8cAz2z8jVqtY/+IrkRejnVmoK/uIkDUq1iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WBKywO1P; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729769087; x=1761305087;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bKn1zWxfQ+atPPXQ2airthHAbMPyOIETHQqWmdUEkMo=;
  b=WBKywO1Pm1NH3hvIB2fG/6rNZ0kqx/QPX41SBI96VdkKuohi+0YjcjZT
   IiU5U2ozjmwQAKfJwISrj0zC2DgcEwMWQcKPr97uPFvpkHIATUSfZo1Db
   oxff63ZFG0VjKI2bM6NRB+0yDRG9ViUg02VARKBptmNmtCXSlDn+JFT+B
   6qRvqiBYmQwnM5diRPZmL2/o6c7gFm9T1BmUDGHSiE6QFauPLMjqQjPao
   Ld46plKc1Pl71DIfpOrJCIeIFSa1uHr/G2VeScrEwsVXH91JO9z9EZ5lR
   bAODVCEWt7++PyoilsCtrct4To0V7jQFG4khQsoQeNGiNTcOj4OisCO40
   g==;
X-CSE-ConnectionGUID: ISOuK6Q5SU+WHX6vejvkmA==
X-CSE-MsgGUID: mrWAhxaKQzyKkLPb8MjJCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33192631"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33192631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:24:46 -0700
X-CSE-ConnectionGUID: 9fViNcHISpWdpdOkUE7INA==
X-CSE-MsgGUID: WOBsemSpSI+Pq49VF0YsRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80735898"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:24:42 -0700
Message-ID: <ed236a63-6505-4cd9-8ccf-97a1035e2848@intel.com>
Date: Thu, 24 Oct 2024 14:24:36 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Add sysfs attribute for error state in
 SDHCI MSM driver
To: Sachin Gupta <quic_sachgupt@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
 quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
References: <20241022141659.18764-1-quic_sachgupt@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241022141659.18764-1-quic_sachgupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/10/24 17:16, Sachin Gupta wrote:
> Introduce a new sysfs attribute err_state to the SDHCI MSM driver.
> The attribute allows users to query the error state of the SDHCI host controller.

We already have err_stats and err_state in debugfs.  That seems
more appropriate.

> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e113b99a3eab..a256e3569a92 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -290,6 +290,7 @@ struct sdhci_msm_host {
>  	u32 dll_config;
>  	u32 ddr_config;
>  	bool vqmmc_enabled;
> +	bool err_occurred;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -2255,6 +2256,8 @@ static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>  	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>  
> +	msm_host->err_occurred = true;
> +
>  	SDHCI_MSM_DUMP("----------- VENDOR REGISTER DUMP -----------\n");
>  
>  	SDHCI_MSM_DUMP(
> @@ -2398,6 +2401,41 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>  	return ret;
>  }
>  
> +static ssize_t err_state_show(struct device *dev,
> +			struct device_attribute *attr, char *buf)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	if (!host || !host->mmc)
> +		return -EINVAL;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", !!msm_host->err_occurred);
> +}
> +
> +static DEVICE_ATTR_RO(err_state);
> +
> +static struct attribute *sdhci_msm_sysfs_attrs[] = {
> +	&dev_attr_err_state.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group sdhci_msm_sysfs_group = {
> +	.name = "qcom",
> +	.attrs = sdhci_msm_sysfs_attrs,
> +};
> +
> +static void sdhci_msm_init_sysfs(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = sysfs_create_group(&dev->kobj, &sdhci_msm_sysfs_group);
> +	if (ret)
> +		dev_err(dev, "%s: Failed to create qcom sysfs group (err = %d)\n",
> +				__func__, ret);
> +}
> +
>  static int sdhci_msm_probe(struct platform_device *pdev)
>  {
>  	struct sdhci_host *host;
> @@ -2442,6 +2480,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	sdhci_get_of_property(pdev);
>  	sdhci_msm_get_of_property(pdev, host);
>  
> +	sdhci_msm_init_sysfs(&pdev->dev);
> +
>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>  
>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);



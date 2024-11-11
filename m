Return-Path: <linux-arm-msm+bounces-37452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 909029C3A0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 09:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2334B1F220AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 08:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BE916B75C;
	Mon, 11 Nov 2024 08:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md+reXsE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23402158520;
	Mon, 11 Nov 2024 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731315084; cv=none; b=SodN0ncEV3sqPVpR8XEBF9z1eaSHAVPyRibISrfMUe3FfeA2ARb+0EzDkiTBaVZfG3Ik/VwMhjqVu9QApzTOo4CQVRHMyR6xZnzsFDLddAoqu/skcp7Bd11kSqfN/TAbwMem6Svqz+gJq3DpSgbXzTe4A4GQPIZhdwiorQvtQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731315084; c=relaxed/simple;
	bh=HRMmBN1pXte79XcyI39yX0w4WWuQRllWbQZ9jWsmwck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUfbqSrMtKTDyDsyPz2k95w0AX+MEDvS1BKO8pPQk9l8liErcFseiE8wjlL1spZxILDC/ViAXCYzAX4LgNYweZbFVQMjG4dG+hj1YGTxEHN04MEpMVaGtpY+8iQwA5GmmvjWZZ+sDzdYTQqfi0S4OLQT9IdVGbgE4PT7FeGhaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md+reXsE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731315082; x=1762851082;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HRMmBN1pXte79XcyI39yX0w4WWuQRllWbQZ9jWsmwck=;
  b=md+reXsEtGblQOqdT86yXB584g+WMluQWuRf84ELpyjhgE+ztpHmw+CZ
   xF6gikI0tGsIS4WtrDdH7S9WXj1L+MSNaDlKcN6E+X2FJG2M2XOZ9bsgC
   rbxOOwMPvgL07fbQ0pIWFoI4INLTirP4NrFXKysZ+FCalhe+ncmU6RBIb
   wYs9JRWxsJOYzrOQ+iWNyWABO79oCZUdsNbCZBA53fFNUvbd8umw/qvpr
   2ePjlE9aLPsg8/DwmJJvW1UFuMaaECGg/MD8JW+RCId5A3qupSUJj+YuK
   RvvpkrktVFnM0vfT6wo3dxmVFvFGaY1wDlml3fI0z9cFJFW1AqyXOTImR
   w==;
X-CSE-ConnectionGUID: vlDY4y2jTkOTWVHBYWM6IQ==
X-CSE-MsgGUID: X8xf9NYMSweTuOOs1BoBAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31272663"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31272663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:51:22 -0800
X-CSE-ConnectionGUID: 0HhvCOoBRsaBaTqBG8QYQg==
X-CSE-MsgGUID: F0bATbuXRCiG0k7fNo679Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86759263"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.89.141])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 00:51:16 -0800
Message-ID: <4e4870b5-4491-4f65-9a41-1a5e9e1bdf68@intel.com>
Date: Mon, 11 Nov 2024 10:51:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] mmc: sdhci-msm: Enable tuning for SDR50 mode for
 SD card
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com, kernel@quicinc.com
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-3-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20241107080505.29244-3-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/24 10:05, Sarthak Garg wrote:
> For Qualcomm SoCs which needs level shifter for SD card, extra delay is
> seen on receiver data path.
> 
> To compensate this delay enable tuning for SDR50 mode for targets which
> has level shifter.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..16325c21de52 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -81,6 +81,7 @@
>  #define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
>  #define CORE_IO_PAD_PWR_SWITCH	BIT(16)
>  #define CORE_HC_SELECT_IN_EN	BIT(18)
> +#define CORE_HC_SELECT_IN_SDR50	(4 << 19)
>  #define CORE_HC_SELECT_IN_HS400	(6 << 19)
>  #define CORE_HC_SELECT_IN_MASK	(7 << 19)
>  
> @@ -1124,6 +1125,10 @@ static bool sdhci_msm_is_tuning_needed(struct sdhci_host *host)
>  {
>  	struct mmc_ios *ios = &host->mmc->ios;
>  
> +	if (ios->timing == MMC_TIMING_UHS_SDR50 &&
> +			host->flags & SDHCI_SDR50_NEEDS_TUNING)

Please do line up code as suggested by checkpatch:

CHECK: Alignment should match open parenthesis
#35: FILE: drivers/mmc/host/sdhci-msm.c:1129:
+       if (ios->timing == MMC_TIMING_UHS_SDR50 &&
+                       host->flags & SDHCI_SDR50_NEEDS_TUNING)

CHECK: Alignment should match open parenthesis
#55: FILE: drivers/mmc/host/sdhci-msm.c:1219:
+       if (ios.timing == MMC_TIMING_UHS_SDR50 &&
+                       host->flags & SDHCI_SDR50_NEEDS_TUNING) {

total: 0 errors, 0 warnings, 2 checks, 40 lines checked


> +		return true;
> +
>  	/*
>  	 * Tuning is required for SDR104, HS200 and HS400 cards and
>  	 * if clock frequency is greater than 100MHz in these modes.
> @@ -1192,6 +1197,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	struct mmc_ios ios = host->mmc->ios;
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> +	u32 config;
>  
>  	if (!sdhci_msm_is_tuning_needed(host)) {
>  		msm_host->use_cdr = false;
> @@ -1208,6 +1215,15 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  	 */
>  	msm_host->tuning_done = 0;
>  
> +	if (ios.timing == MMC_TIMING_UHS_SDR50 &&
> +			host->flags & SDHCI_SDR50_NEEDS_TUNING) {

Ditto alignment

> +		config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec);
> +		config |= CORE_HC_SELECT_IN_EN;
> +		config &= ~CORE_HC_SELECT_IN_MASK;
> +		config |= CORE_HC_SELECT_IN_SDR50;

Perhaps clear bits first, then set bits e.g.

		config &= ~CORE_HC_SELECT_IN_MASK;
		config |= CORE_HC_SELECT_IN_EN | CORE_HC_SELECT_IN_SDR50;

> +		writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
> +	}
> +
>  	/*
>  	 * For HS400 tuning in HS200 timing requires:
>  	 * - select MCLK/2 in VENDOR_SPEC



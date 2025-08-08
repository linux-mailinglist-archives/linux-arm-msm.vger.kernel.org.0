Return-Path: <linux-arm-msm+bounces-68123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACAB1E86E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 14:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 356437B0247
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 12:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36F8279DAD;
	Fri,  8 Aug 2025 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5Ejamfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4761EA84;
	Fri,  8 Aug 2025 12:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754656452; cv=none; b=Oo4fIIealtTF7k3928OGEBJllSyUISwGugRb/mwR+v/YRUCUctBnBSCib2f7/RRoDUbzoEOoIMxN579QXjFJGX7vRk03AqAdkYIfrnX7iYKHGGrMzCJCvSRbr0Gr39CruJBUw3Ne4huHp4BsEO2zYj/qm0cUf0sglrCHj9SIAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754656452; c=relaxed/simple;
	bh=bsBWuWydjwV6gpToYD0UMemkzbOVgo4dHyaxM95+a24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvvyjXcQluZVQLiSbGSs26OF+Cvl5Otbk6Ceug2XIKmPxBBEIXJZroboLxt5hC1qbndhO8wcQLXxQBKhK7MqOD9tWAGEm8RYUqNUZzBcQJcTRJc7FrAvnam5m4Dp1i+A0SWbmSkIN9sMXELDV/syM9p/+uAElD61sv8oTKLAENA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5Ejamfu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FEDC4CEF4;
	Fri,  8 Aug 2025 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754656452;
	bh=bsBWuWydjwV6gpToYD0UMemkzbOVgo4dHyaxM95+a24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5Ejamfu2Gi5t0Qk9/oMf87Ab0zV+Wo05mqeUuf+8751FQtXtm4epsLg+1kVLl3vm
	 GN4phyce5gkDEAN1oD/0D1fI+foS4v6nGQsfljlh/WS3Tu1l2mcfIVWYhCIWXAqCd8
	 Yix5rmgPEG21gSUhwpr8P0xIjvE7YlQI9uKDuCfxGqjG8Sa+bPywAlv+P9nDBNZz30
	 xHnlxTv/cFvwlZnyZd5b9dmd4R3V3WPkTZUdKfCNuO5FJha+j1uBM45ztyjrW2yCMl
	 rFZEbTaNR2GIqwNXkBBUPr/6f8r9owNnS2Ukk6briqUjKixqWmvqmbux2GZTvFgcu1
	 LxeLeuV9JrThQ==
Date: Fri, 8 Aug 2025 18:03:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, conor+dt@kernel.org, 
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 4/4] phy: qcom-qmp-ufs: read max-microamp values from
 device tree
Message-ID: <xrarnbg2qmhuivqgl7vzhmvfi6sc4zp6wa6zvpv4r4nufllc3p@u4wed2orm2cq>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-5-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250806154340.20122-5-quic_nitirawa@quicinc.com>

On Wed, Aug 06, 2025 at 09:13:40PM GMT, Nitin Rawat wrote:
> Add support in QMP PHY driver to read optional vdda-phy-max-microamp
> and vdda-pll-max-microamp properties from the device tree.
> 
> These properties define the expected maximum current (in microamps) for
> each supply. The driver uses this information to configure regulators
> more accurately and ensure they operate in the correct mode based on
> client load requirements.
> 
> If the property is not present, the driver defaults load to
> `QMP_VREG_UNUSED`.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 9c69c77d10c8..6e116f7370c3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -39,6 +39,8 @@
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>  
>  #define NUM_OVERLAY				2
> +#define QMP_VREG_UNUSED				-1
> +#define MAX_PROP_NAME				32
>  
>  /* set of registers with offsets different per-PHY */
>  enum qphy_reg_layout {
> @@ -1894,15 +1896,29 @@ static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	struct device *dev = qmp->dev;
> +	struct device_node *np = dev->of_node;
> +	char prop_name[MAX_PROP_NAME];
>  	int num = cfg->num_vregs;
> -	int i;
> +	const char *supply;
> +	int i, ret;
>  
>  	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
>  	if (!qmp->vregs)
>  		return -ENOMEM;
>  
> -	for (i = 0; i < num; i++)
> -		qmp->vregs[i].supply = cfg->vreg_list[i];
> +	for (i = 0; i < num; i++) {
> +		supply = cfg->vreg_list[i];
> +		qmp->vregs[i].supply = supply;
> +
> +		/* Defaults to unused */
> +		qmp->vregs[i].init_load_uA = QMP_VREG_UNUSED;

You don't need to initialize the load. It will be zero initialized at this point
and if the property parsing fails below, it's value still be zero. And the
regulator core will apply the load only if it is > 0.

> +
> +		snprintf(prop_name, sizeof(prop_name), "%s-max-microamp", supply);
> +		ret = of_property_read_u32(np, prop_name, &qmp->vregs[i].init_load_uA);
> +		if (ret)
> +			dev_dbg(qmp->dev, "No max microamp for %s, using default %d\n",
> +				supply, QMP_VREG_UNUSED);

This print doesn't make sense as it will print the default value of -1. Please
drop it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


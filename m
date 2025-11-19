Return-Path: <linux-arm-msm+bounces-82596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F7C71353
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 22:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id F335829B45
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 21:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF9B309F0B;
	Wed, 19 Nov 2025 21:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DD7DpsoX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20740309DAB;
	Wed, 19 Nov 2025 21:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589562; cv=none; b=LPa/a6MQ1yBx+JSuDKOMxG/StS2eF/fSS9F7FIeZWv23axtSpZx3eUg3vqgmf4Hq6GT0vH0LK9nxvF31pnqcNJHvi55p2/2fDmZg6UhOB4akqviZ5EdP+jvJH0eNJAkeUjrxiomH5d4M3ES5l/f2pHsTO6swqgBwjb3R0R/diG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589562; c=relaxed/simple;
	bh=XAi64EVzkxvppyMabUrbkAn2iQFHDQRdmnTwIHbynnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTmry6V1ogl6LSAzP7YgoiFjmk6uvhNOibZZVKLDX5Ww6qWFjRgfrQnrJh9wVw2QUWmCRrq9iJ2i89kO2jIYN/3JdOGP17I9M5q6m1B8c/8sm6aw+8TrCm0RIZWAhqZFRv8a39FY3TbDHPnWUklg9GpZlYPHlVsXjuz7mZmrZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DD7DpsoX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3A1C4CEF5;
	Wed, 19 Nov 2025 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763589561;
	bh=XAi64EVzkxvppyMabUrbkAn2iQFHDQRdmnTwIHbynnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DD7DpsoX9cFCcolGKDPRmCefxe1juxuq1LRxZLLP4wM7wU+3Hb6n5/7RGFrhvQUrj
	 khnlUvBFigxyxrFYytMUOi2C2c81beHVY7nSRKc1KH4rgcnYug2rVFscquNTjtKUHq
	 U5cUE1Z+ZegKTNNuejavcoZsLeV+JVSsHoY1ziyhacY3RJEELxmAe/jtjcc+r9CeNW
	 LAycBqmHDB2zCJYF4KLLqv/mpZSIi7U4e1MfmGujmyXma/dhP4JKnZt3nlI7CD5x9T
	 yX8Ng85LRb311j6+KyOA0ok7XZNyZfs4ylCorWd5CEkCP76cTwFbzXe+Qi4rrXDV/N
	 A0mbl5QFqYW0Q==
Date: Wed, 19 Nov 2025 16:04:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-combo: Use regulator_bulk_data with
 init_load_uA for regulator setup
Message-ID: <kjbzit7pkhxjlzy53gkkoiufilxajoi2crjiijvtg76zfajeg6@wndnfdc3v4zj>
References: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922135901.2067-1-faisal.hassan@oss.qualcomm.com>

On Mon, Sep 22, 2025 at 07:29:01PM +0530, Faisal Hassan wrote:
> Replace the custom qmp_regulator_data structure with the standard
> regulator_bulk_data and use the init_load_uA field to set regulator
> load during initialization.
> 
> This change simplifies the regulator setup by removing manual
> allocation and load configuration logic, and leverages
> devm_regulator_bulk_get_const() to automatically apply load settings
> before enabling regulators.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 49 +++--------------------
>  1 file changed, 6 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index f07d097b129f..97262ed63700 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1636,14 +1636,9 @@ static const struct qmp_phy_init_tbl x1e80100_usb43dp_pcs_usb_tbl[] = {
>  };
>  
>  /* list of regulators */
> -struct qmp_regulator_data {
> -	const char *name;
> -	unsigned int enable_load;
> -};
> -
> -static struct qmp_regulator_data qmp_phy_vreg_l[] = {
> -	{ .name = "vdda-phy", .enable_load = 21800 },
> -	{ .name = "vdda-pll", .enable_load = 36000 },
> +static struct regulator_bulk_data qmp_phy_vreg_l[] = {
> +	{ .supply = "vdda-phy", .init_load_uA = 21800, },
> +	{ .supply = "vdda-pll", .init_load_uA = 36000, },
>  };
>  
>  static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
> @@ -1801,7 +1796,7 @@ struct qmp_phy_cfg {
>  	const char * const *reset_list;
>  	int num_resets;
>  	/* regulators to be requested */
> -	const struct qmp_regulator_data *vreg_list;
> +	const struct regulator_bulk_data *vreg_list;
>  	int num_vregs;
>  
>  	/* array of registers with different offsets */
> @@ -3403,39 +3398,6 @@ static const struct dev_pm_ops qmp_combo_pm_ops = {
>  			   qmp_combo_runtime_resume, NULL)
>  };
>  
> -static int qmp_combo_vreg_init(struct qmp_combo *qmp)
> -{
> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
> -	struct device *dev = qmp->dev;
> -	int num = cfg->num_vregs;
> -	int ret, i;
> -
> -	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
> -	if (!qmp->vregs)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < num; i++)
> -		qmp->vregs[i].supply = cfg->vreg_list[i].name;
> -
> -	ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
> -	if (ret) {
> -		dev_err(dev, "failed at devm_regulator_bulk_get\n");
> -		return ret;
> -	}
> -
> -	for (i = 0; i < num; i++) {
> -		ret = regulator_set_load(qmp->vregs[i].consumer,
> -					cfg->vreg_list[i].enable_load);
> -		if (ret) {
> -			dev_err(dev, "failed to set load at %s\n",
> -				qmp->vregs[i].supply);
> -			return ret;
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>  static int qmp_combo_reset_init(struct qmp_combo *qmp)
>  {
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -4003,7 +3965,8 @@ static int qmp_combo_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ret = qmp_combo_vreg_init(qmp);
> +	ret = devm_regulator_bulk_get_const(dev, qmp->cfg->num_vregs,
> +					qmp->cfg->vreg_list, &qmp->vregs);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.17.1
> 
> 


Return-Path: <linux-arm-msm+bounces-48039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3549A360C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A89E7A172E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D946A263C9D;
	Fri, 14 Feb 2025 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/p8TvJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3542566D9;
	Fri, 14 Feb 2025 14:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739544393; cv=none; b=UreQOdh0vdg8f6gOlCrwvE+z3EgvbFAxVdDWkY1h1SCuXxal/bJTrLL2clKe0MU8AZpTwVbwKKzKcseBDyIJtvfF1hJ3dhFFFDMnne16fPPjStoi7R8v2FdML5eHlNYN9XwULYyro+PhoaUp9vtPHo46mkFVwJy9dUV9CpDr1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739544393; c=relaxed/simple;
	bh=1ZIAdu+aSSt1qC8VM5ZVLtO6FmpvBX1T9i94FheNL/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYALHJtJTdwtvYieoYf7czB46eqmRjkJ/ezYi7sZHr5hy7XHE1xVFGLOrOWMN3mrJIQ8rL+EuaDv8C5eEzE7bi9QcEIRFPm1l30++/VcpoClf6mqHG3To+IM/rpcbDxU7OKXreF4uoTWLRhVNvS0M5i8NbGKqADWezwPWtADXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/p8TvJm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233ADC4CED1;
	Fri, 14 Feb 2025 14:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739544393;
	bh=1ZIAdu+aSSt1qC8VM5ZVLtO6FmpvBX1T9i94FheNL/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/p8TvJmNnyb/FDEwTABnBmhygKIYcRvdQkPr9V6S2Cj4WKiHk+gAAeXdG9pba5ae
	 r5UoipNEZQlz7bjEHruuyVSodzZquFtQUyEi3Cd1aGE3V8DWwa9deGh41ib77pJkff
	 GGes0f2dVmm9FWNfkVIuIodx7wVT7ftw9cA/VU2mhBWDUUa4zQT9OlhhFMpS2BuJRb
	 ME4M7dTaJXcz3/2SOf5ioENWk48PnEhNOjrwgOQrmmDICslKZcWdeymXXlzA2Xflk2
	 bV9Yr6V5T7LbaD540hmWF3YuYjaDrYh1K6K45s4v/LRq/Onknmh3O/0jVzb8W9APSU
	 HC6yxiL507AOg==
Date: Fri, 14 Feb 2025 20:16:23 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
	manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250214144623.fvjr2bytliqhektr@thinkpad>
References: <20250214104539.281846-1-quic_wenbyao@quicinc.com>
 <20250214104539.281846-3-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214104539.281846-3-quic_wenbyao@quicinc.com>

On Fri, Feb 14, 2025 at 06:45:39PM +0800, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> whole PHY (hardware and register), no_csr reset only resets PHY hardware
> but retains register values, which means PHY setting can be skipped during
> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
> after that.
> 
> Hence, determine whether the PHY has been enabled in bootloader by
> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> available, skip BCR reset and PHY register setting to establish the PCIe
> link with bootloader - programmed PHY settings.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 96 ++++++++++++++++--------
>  1 file changed, 63 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 219266125cf2..b3912c1a6de8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2805,6 +2805,7 @@ struct qmp_pcie {
>  
>  	const struct qmp_phy_cfg *cfg;
>  	bool tcsr_4ln_config;
> +	bool skip_init;
>  
>  	void __iomem *serdes;
>  	void __iomem *pcs;
> @@ -3976,7 +3977,9 @@ static int qmp_pcie_init(struct phy *phy)
>  {
>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *pcs = qmp->pcs;
>  	int ret;
> +	bool phy_initialized;
>  
>  	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>  	if (ret) {
> @@ -3984,10 +3987,18 @@ static int qmp_pcie_init(struct phy *phy)
>  		return ret;
>  	}
>  
> -	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> -	if (ret) {
> -		dev_err(qmp->dev, "reset assert failed\n");
> -		goto err_disable_regulators;
> +	phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
> +	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
> +	/*
> +	 * Toggle BCR reset for phy that doesn't support no_csr

s/phy/PHY. Here and below.

> +	 * reset or has not been initialized
> +	 */
> +	if (!qmp->skip_init) {
> +		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +		if (ret) {
> +			dev_err(qmp->dev, "reset assert failed\n");
> +			goto err_disable_regulators;
> +		}
>  	}
>  
>  	ret = reset_control_assert(qmp->nocsr_reset);
> @@ -3998,10 +4009,12 @@ static int qmp_pcie_init(struct phy *phy)
>  
>  	usleep_range(200, 300);
>  
> -	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> -	if (ret) {
> -		dev_err(qmp->dev, "reset deassert failed\n");
> -		goto err_assert_reset;
> +	if (!qmp->skip_init) {
> +		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> +		if (ret) {
> +			dev_err(qmp->dev, "reset deassert failed\n");
> +			goto err_assert_reset;
> +		}
>  	}
>  
>  	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
> @@ -4011,7 +4024,8 @@ static int qmp_pcie_init(struct phy *phy)
>  	return 0;
>  
>  err_assert_reset:
> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +	if (!qmp->skip_init)
> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  err_disable_regulators:
>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>  
> @@ -4023,7 +4037,10 @@ static int qmp_pcie_exit(struct phy *phy)
>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  
> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +	if (!qmp->nocsr_reset)
> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +	else
> +		reset_control_assert(qmp->nocsr_reset);

I'd flip the if condition for readability:

	if (qmp->nocsr_reset)
		...
	else
		...
>  
>  	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>  
> @@ -4042,16 +4059,22 @@ static int qmp_pcie_power_on(struct phy *phy)
>  	unsigned int mask, val;
>  	int ret;
>  
> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> -			cfg->pwrdn_ctrl);
> +	/*
> +	 * Write CSR register for phy that doesn't support no_csr
> +	 * reset or has not been initialized
> +	 */
> +	if (!qmp->skip_init) {

How about:
	if (qmp->skip_init)
		goto skip_phy_init;

This is my personal preference btw. If anyone feels the other way, feel free
to drop this suggestion.

> +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> +				cfg->pwrdn_ctrl);
>  
> -	if (qmp->mode == PHY_MODE_PCIE_RC)
> -		mode_tbls = cfg->tbls_rc;
> -	else
> -		mode_tbls = cfg->tbls_ep;
> +		if (qmp->mode == PHY_MODE_PCIE_RC)
> +			mode_tbls = cfg->tbls_rc;
> +		else
> +			mode_tbls = cfg->tbls_ep;
>  
> -	qmp_pcie_init_registers(qmp, &cfg->tbls);
> -	qmp_pcie_init_registers(qmp, mode_tbls);
> +		qmp_pcie_init_registers(qmp, &cfg->tbls);
> +		qmp_pcie_init_registers(qmp, mode_tbls);
> +	}
>  
>  	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
>  	if (ret)
> @@ -4063,15 +4086,16 @@ static int qmp_pcie_power_on(struct phy *phy)
>  		goto err_disable_pipe_clk;
>  	}
>  
> -	/* Pull PHY out of reset state */
> -	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +	if (!qmp->skip_init) {

	if (qmp->skip_init)
		goto skip_serdes_start;

> +		/* Pull PHY out of reset state */
> +		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>  
> -	/* start SerDes and Phy-Coding-Sublayer */
> -	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
> -
> -	if (!cfg->skip_start_delay)
> -		usleep_range(1000, 1200);
> +		/* start SerDes and Phy-Coding-Sublayer */
> +		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
>  
> +		if (!cfg->skip_start_delay)
> +			usleep_range(1000, 1200);
> +	}
>  	status = pcs + cfg->regs[QPHY_PCS_STATUS];
>  	mask = cfg->phy_status;
>  	ret = readl_poll_timeout(status, val, !(val & mask), 200,
> @@ -4096,16 +4120,22 @@ static int qmp_pcie_power_off(struct phy *phy)
>  
>  	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
>  
> -	/* PHY reset */
> -	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +	/* If a PHY supports no_csr reset but isn't enabled in the bootloader,
> +	 * phy settings can be reused during the D3cold -> D0 cycle. So it is

I cannot parse this sentence. If PHY is not initialized, how can you reuse the
settings? Also what is the D3cold->D0 reference?

> +	 * unnecessary to check qmp->skip_init.
> +	 */
> +	if (!qmp->nocsr_reset) {

	if (qmp->nocsr_reset)
		goto skip_phy_reset;

- Mani

-- 
மணிவண்ணன் சதாசிவம்


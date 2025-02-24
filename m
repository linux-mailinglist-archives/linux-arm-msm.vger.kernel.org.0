Return-Path: <linux-arm-msm+bounces-49128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C91E3A4165E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76FCF3AFB97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D53D143736;
	Mon, 24 Feb 2025 07:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zoZ+xxdW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2A61BC3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740382389; cv=none; b=hDPh8QiWjGK3++TKfoshOVTCpFF1Opoa29z7vJKOVIHRjq1RqTH2471WnKHR/62Ygj+9Dp3wIECksj+BuiHDQ+qL7pIdPFO7TQRZtGchc5aqU6OjbY00WZMD5tIa+4ZqWiIs5ItlzDnBHh9N7YBD6H3Wu7E0DCvP9waFnqtkSq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740382389; c=relaxed/simple;
	bh=WS2Xig2WyhAhzj5+lQ8xUA+19w/CUm1yNOEBd4bt/8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpJeITSLcaJEXs1DuPfSqreKf0tGy1v/10j7CoaFxy4Hwyd/uBwO30IE01A30c7xmVplLRRtH//5JTb6oDNgKzzoblATFUOGM0VMFjT/ai3nNHvpnHNL+lK8rxqlwhInq/NO1VRhNvWZuFnPRr8GwQK8eYrjUR6U19pvp0YFYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zoZ+xxdW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2211acda7f6so87227475ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 23:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740382387; x=1740987187; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qr+tjt+UIrk1yts5VK/tepdgWKh8IRps5QWJXwgEbZ0=;
        b=zoZ+xxdW/Irv7TMZVNsT/2hQWToUyKTynwkxMuzXt30YKJzJq2/xSCec2bDnxLio41
         KHwzF+uobAIPwH0f+3X9bL7ahMPZU2KYR62nWEKQq3iAi567eaz8CM8VmJWSTP8Yh0Uu
         kcGxseENcrI/lZlqmR27lPatGgDqaC1cFoQEpKxzJasaOoIpF0mFRnfn/TS3tbO2cX8D
         6FgyJQvPoRs9O1eDVJkIoEcgyTRsjPPTednzNqBEWrFslCfnsJmk6cjtyocz6crWKc0e
         7VaP1msWTyfnQzDa8/DiCfY6LB0jWR1qqqacrN0So/SSeGDNoYxSPa4JVaPWefHIZi20
         r2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740382387; x=1740987187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qr+tjt+UIrk1yts5VK/tepdgWKh8IRps5QWJXwgEbZ0=;
        b=tOw3H38XyqEcOeXtJdiHSghIDrWLvGlo/VPt986htDiznc9R70He28rlbLYRo+QY1y
         l/ZvgKQfyWvE4IOEnybhyVHdWkMl1FXoLBigL0Gkh6BVrD8LwUQuL9ZCbSS6xHqIcv0O
         cUkZHR6Pjd6YWM6AHOGB3wK+YzEMuA7P99EZTr27f9TlzfnpJcOWlMtUW1BeF6UuKCrU
         3ybgLJUyOrHaNRXr+QRGLtyaIfjiQOUL0jIC9QioZDh13NrV3xuD4857lPbhmUjdoLHp
         2CSMuu5W32HHAzhp+YZSr62KxtKjQKCvVFbQmG7fPJ26YfZt3DrSxMu3jceJDVUPw7AG
         M8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVPUub5IcZ16OwzCLLrZvARgGMOCJRA8Qn8HNzDnCxUIeLi3ISXKgqG33fZQ+aWy+vGfqEVldk51nxZ71tf@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIn9o08n7s5CXaYzdpQa6amBXx7aAPMuVkwoNECtkBJUwDyEw
	OouAggT2Snau8C0ovunEdpXq5EUROqz3qEkqRtkBpbTSUWZRjyU26erAisfjHQ==
X-Gm-Gg: ASbGncsEMASGgBmEh1gW6B0JXnv0x6Jqu0VjM1xWor27rITyD7ytxqkhHmnfl354HQr
	ognbCsY3eW2SyHtv4cxaeCH6c+pGu0uT3xCujDL1Qt3HUceiOG2C500dJbm9SW9dNbUuXASRS/a
	FbwXvEsWdemPUyRjwh4cVVXb5ru5OQl31/Dn5L/1sf84cj6GevAAWxrOmL894lCKl3KTgxHclKK
	l8ROXMtOJ9dqTwcOAVH+rZkNIXRL/CoKSg2n23+wZyrOewR1Zh7zIQ5KQrfelrs+jpNauz736Xe
	FoNuhFLTqm4l0Kl09thEX3j7eAF+5UvmGm+m
X-Google-Smtp-Source: AGHT+IFbLd8cCuwa1xEr6it4PU+oeXmq35IvmwDlwqXzqneh56tsExMzzaPxVidrxDy/REEG2ZPIpw==
X-Received: by 2002:a17:902:da8c:b0:220:c813:dfda with SMTP id d9443c01a7336-2219ffa7636mr203604335ad.41.1740382386884;
        Sun, 23 Feb 2025 23:33:06 -0800 (PST)
Received: from thinkpad ([36.255.17.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265f98e18sm17046763b3a.106.2025.02.23.23.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:33:06 -0800 (PST)
Date: Mon, 24 Feb 2025 13:03:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
	quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <20250224073301.aqbw3gxjnupbejfy@thinkpad>
References: <20250220102253.755116-1-quic_wenbyao@quicinc.com>
 <20250220102253.755116-3-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250220102253.755116-3-quic_wenbyao@quicinc.com>

On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
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

Some nitpicks below.

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 60 +++++++++++++++++++-----
>  1 file changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 219266125cf2..6938b72df7fa 100644
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
> +	 * Toggle BCR reset for PHY that doesn't support no_csr
> +	 * reset or has not been initialized

Please make use of 80 column width.

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
> +	if (qmp->nocsr_reset)
> +		reset_control_assert(qmp->nocsr_reset);
> +	else
> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>  
>  	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>  
> @@ -4042,6 +4059,13 @@ static int qmp_pcie_power_on(struct phy *phy)
>  	unsigned int mask, val;
>  	int ret;
>  
> +	/*
> +	 * Write CSR register for PHY that doesn't support no_csr
> +	 * reset or has not been initialized

Same here.

> +	 */
> +	if (qmp->skip_init)
> +		goto skip_tbls_init;
> +
>  	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>  			cfg->pwrdn_ctrl);
>  
> @@ -4053,6 +4077,7 @@ static int qmp_pcie_power_on(struct phy *phy)
>  	qmp_pcie_init_registers(qmp, &cfg->tbls);
>  	qmp_pcie_init_registers(qmp, mode_tbls);
>  
> +skip_tbls_init:
>  	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
>  	if (ret)
>  		return ret;
> @@ -4063,6 +4088,9 @@ static int qmp_pcie_power_on(struct phy *phy)
>  		goto err_disable_pipe_clk;
>  	}
>  
> +	if (qmp->skip_init)
> +		goto skip_serdes_start;
> +
>  	/* Pull PHY out of reset state */
>  	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>  
> @@ -4072,6 +4100,7 @@ static int qmp_pcie_power_on(struct phy *phy)
>  	if (!cfg->skip_start_delay)
>  		usleep_range(1000, 1200);
>  
> +skip_serdes_start:
>  	status = pcs + cfg->regs[QPHY_PCS_STATUS];
>  	mask = cfg->phy_status;
>  	ret = readl_poll_timeout(status, val, !(val & mask), 200,
> @@ -4096,7 +4125,15 @@ static int qmp_pcie_power_off(struct phy *phy)
>  
>  	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
>  
> -	/* PHY reset */
> +	/* When PHY is powered off, only qmp->nocsr_reset needs to be checked.

s/'When PHY is powered off,'/'While powering off the PHY,'

> +	 * In this way, no matter whether the PHY settings were initially
> +	 * programmed by bootloader or PHY driver itself, we can reuse them

It is really possible to have bootloader not programming the init sequence for
no_csr reset platforms? The comment sounds like it is possible. But I heard the
opposite.

> +	 * when PHY is powered on next time.
> +	 */
> +	if (qmp->nocsr_reset)
> +		goto skip_phy_deinit;
> +
> +		/* PHY reset */

Spurious tab before the start of the comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


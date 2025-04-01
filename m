Return-Path: <linux-arm-msm+bounces-52974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E694A77EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 17:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9526D3AC438
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 15:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC5420AF73;
	Tue,  1 Apr 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb7UhVIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA220AF9A;
	Tue,  1 Apr 2025 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520869; cv=none; b=E6KWDqLFuUXSQfpqQCTKqGZpOhSMd1lpGcmoEjBYkHAj/xLe5HBuxXrCVbbuzn1Dv9IZs4pVZ/WIt1uP6v9HhNTO5wcSDbUbSN4nZkOUmxQQbv/L9wWhlMGqTLIDWSwej53J1n+bQtfTS65NVPRWaNOGDcjzT9YiwnrTu4Teqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520869; c=relaxed/simple;
	bh=1/KF+D6klV7C6U0C79QvK9E/wnDyQsBP+TSs/l3KfJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZFVvnfle6QPOehEO9WLKWXlFG6Y7uwIPHtytld03ymMXM2cv3ZxExSx76aUv2v1pQ+Yxlyiom2SoV315VB/xwGseZRb6ewE2Hk7gEEZ2TdIVu4M7PUqOXKBnwd+JujkAL8gKHgvgUhMUQgUW9hKIZ1YiCXod/q2DmZsUSuQYjAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb7UhVIR; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3965c995151so3129313f8f.1;
        Tue, 01 Apr 2025 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743520865; x=1744125665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FULHloGe7p7dzCSBpkWJ6JYEQEYwLsnQIGkgtUI+S/8=;
        b=Gb7UhVIRdd8ZHJi986AflN4yhuw9sewztJATLx1JiNvjNoYbBl3/e8rc9c33xfdzNY
         OhV3+WzF0fVNWXAh1VlXiyYshWxzWmLUghL7aA7OqWaSGPAnlHzUFYuN0hpEn5PA3ytc
         uWLy8wRcZufnWqcNNQhqlxvJXSzM6PFO2Eu0DDD8YdXa2kLwH+QvM5qoXVcTwYGBAAvA
         5HOFYn67k8M1Xg7PYJ0zGBt55Qwipz49amHs0337uXpxp+LhGEtoCZvQGYDgz7PU+9zP
         QWSeheOqgb3gQRWM+dU75dR2aHcWt1RGUlxOAVcBFxFC2Uqh9SvbuzlHRRHkqjTex047
         632w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520865; x=1744125665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FULHloGe7p7dzCSBpkWJ6JYEQEYwLsnQIGkgtUI+S/8=;
        b=hY40a8PKZeKmjsx4qRAXN6GYgvQH51s98dNYM3eXgNwy2BVOLfkpaKg+sDMeXYW1ZU
         pYiN5sBrKO5SlRNWMXRLQeXheXHIDNPEu4mgqAgqY0nVjqbdqvvbJ9c+0BDEYnLUhoUI
         1Cr3thyq33Hbnv8Iut5iAZ2eEkSPoj50H6LJWSAgNkCX8sMJpmW5G41jC6iSmg8ajAT/
         61qVqsGwaoUeXF2yUFw21Pls2/1oeMvp4emfrEf2N9ThSNNJMGdJWUygMXCGIkIt3B/l
         YH4eKlFgL/k5XRVWC6CINNanJj+k0eBSpYOO7+JD4QmP/lpFzrlEELzDgETk1kHgLM9H
         9z0w==
X-Forwarded-Encrypted: i=1; AJvYcCWj8k/mVJrZSDsA89/uBQsAyK1QdBrfDI5lIRmfgK2anVilrX3F0UAgDcWOYa6aepr/EcbLUAr37ikCyr7u@vger.kernel.org, AJvYcCXoeVfiPd1g4wW9x+o6YLz2ECrkUa+v2equA8xVogtJNM8x4uH36M/YY7QR/c5JSxn1CLCe9/nafYbzAOEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxNJYz476oCDegPmDjHJihJInQ+ZPAjYI16xmtHbZbIv3FU6lhA
	Ynoc7GL0H7T8xPhgFEK5116YRqOZYEbm38vBpFB3j7BW1/PQjm0=
X-Gm-Gg: ASbGnctCPQ4QhypqsZTYxtr0RZc60ehxU2hZ/YbMNPaFUj3sGi+d8BIcgz2QOzYbgi4
	DpvfTxnHE9H35F9QD+560JGlXJDy07uneGAy9faxRev67mzMt7ZycsfsTlR1EKk0j1IqMagZnm8
	xoWaYXOgRX8DesVK9SYS7RAz5+FkaCn4+Z5UjupVE2RlrNMnJl84+fpYRzQ3Uzu68+g8m9LGlpI
	Qu8lOZtIZGYHrhpRPmhXJ/Qs00Ad8wVj7gqdVciEUcefqNhhqVm8iieMzMdF5AEGtLurv3QZIua
	rQQs5V/ppI+fJpiCZz+sfVCcaBYnkoqUNgfDhk7K7UX/zwRSXCqREj+rGWy4sIpkXl6b/5KxrFh
	4s+JWBzI8Uz+i0GdtHNE=
X-Google-Smtp-Source: AGHT+IHGmmW/AnkMwcnMBG7+0sAMxS++hIFunwS9tQEbSmykuJYCfQjmdxekG9uOrk5AgH2wTvCw7Q==
X-Received: by 2002:a05:6000:40cf:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39c120e3ef7mr9611841f8f.31.1743520865331;
        Tue, 01 Apr 2025 08:21:05 -0700 (PDT)
Received: from [172.21.167.71] (mob-194-230-148-227.cgn.sunrise.net. [194.230.148.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663470sm14309214f8f.27.2025.04.01.08.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:21:05 -0700 (PDT)
Message-ID: <152fd6fc-41a3-4a2b-bc84-04e309db87cc@gmail.com>
Date: Tue, 1 Apr 2025 17:21:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Wenbin Yao <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, p.zabel@pengutronix.de, dmitry.baryshkov@linaro.org,
 abel.vesa@linaro.org, quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
 manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250319094544.3980357-1-quic_wenbyao@quicinc.com>
 <20250319094544.3980357-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250319094544.3980357-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/19/25 10:45, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> whole PHY (hardware and register), no_csr reset only resets PHY hardware
> but retains register values, which means PHY setting can be skipped during
> PHY init if PCIe link is enabled in bootloader and only no_csr is toggled
> after that.
> 
> Hence, determine whether the PHY has been enabled in bootloader by
> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> available, skip BCR reset and PHY register setting to establish the PCIe
> link with bootloader - programmed PHY settings.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Successfully tested on Snapdragon X1-26-100 on Asus Zenbook A14.
This fixes pcie6a_phy with "qcom,x1p42100-qmp-gen4x4-pcie-phy" as 
compatible, which was not working before.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 69 ++++++++++++++++++++----
>   1 file changed, 59 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 38dbe690f2d5..23a57152e8fd 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2981,6 +2981,7 @@ struct qmp_pcie {
>   
>   	const struct qmp_phy_cfg *cfg;
>   	bool tcsr_4ln_config;
> +	bool skip_init;
>   
>   	void __iomem *serdes;
>   	void __iomem *pcs;
> @@ -4229,18 +4230,38 @@ static int qmp_pcie_init(struct phy *phy)
>   {
>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *pcs = qmp->pcs;
> +	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>   	int ret;
>   
> +	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
> +	/*
> +	 * We need to check the existence of init sequences in two cases:
> +	 * 1. The PHY doesn't support no_csr reset.
> +	 * 2. The PHY supports no_csr reset but isn't initialized by bootloader.
> +	 * As we can't skip init in these two cases.
> +	 */
> +	if (!qmp->skip_init && !cfg->tbls.serdes_num) {
> +		dev_err(qmp->dev, "Init sequence not available\n");
> +		return -ENODATA;
> +	}
> +
>   	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>   	if (ret) {
>   		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>   		return ret;
>   	}
>   
> -	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> -	if (ret) {
> -		dev_err(qmp->dev, "reset assert failed\n");
> -		goto err_disable_regulators;
> +	/*
> +	 * Toggle BCR reset for PHY that doesn't support no_csr reset or has not
> +	 * been initialized.
> +	 */
> +	if (!qmp->skip_init) {
> +		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +		if (ret) {
> +			dev_err(qmp->dev, "reset assert failed\n");
> +			goto err_disable_regulators;
> +		}
>   	}
>   
>   	ret = reset_control_assert(qmp->nocsr_reset);
> @@ -4251,10 +4272,12 @@ static int qmp_pcie_init(struct phy *phy)
>   
>   	usleep_range(200, 300);
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
>   	}
>   
>   	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
> @@ -4264,7 +4287,8 @@ static int qmp_pcie_init(struct phy *phy)
>   	return 0;
>   
>   err_assert_reset:
> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +	if (!qmp->skip_init)
> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>   err_disable_regulators:
>   	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>   
> @@ -4276,7 +4300,10 @@ static int qmp_pcie_exit(struct phy *phy)
>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>   
> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> +	if (qmp->nocsr_reset)
> +		reset_control_assert(qmp->nocsr_reset);
> +	else
> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>   
>   	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>   
> @@ -4295,6 +4322,13 @@ static int qmp_pcie_power_on(struct phy *phy)
>   	unsigned int mask, val;
>   	int ret;
>   
> +	/*
> +	 * Write CSR register for PHY that doesn't support no_csr reset or has not
> +	 * been initialized.
> +	 */
> +	if (qmp->skip_init)
> +		goto skip_tbls_init;
> +
>   	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>   			cfg->pwrdn_ctrl);
>   
> @@ -4306,6 +4340,7 @@ static int qmp_pcie_power_on(struct phy *phy)
>   	qmp_pcie_init_registers(qmp, &cfg->tbls);
>   	qmp_pcie_init_registers(qmp, mode_tbls);
>   
> +skip_tbls_init:
>   	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
>   	if (ret)
>   		return ret;
> @@ -4316,6 +4351,9 @@ static int qmp_pcie_power_on(struct phy *phy)
>   		goto err_disable_pipe_clk;
>   	}
>   
> +	if (qmp->skip_init)
> +		goto skip_serdes_start;
> +
>   	/* Pull PHY out of reset state */
>   	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>   
> @@ -4325,6 +4363,7 @@ static int qmp_pcie_power_on(struct phy *phy)
>   	if (!cfg->skip_start_delay)
>   		usleep_range(1000, 1200);
>   
> +skip_serdes_start:
>   	status = pcs + cfg->regs[QPHY_PCS_STATUS];
>   	mask = cfg->phy_status;
>   	ret = readl_poll_timeout(status, val, !(val & mask), 200,
> @@ -4349,6 +4388,15 @@ static int qmp_pcie_power_off(struct phy *phy)
>   
>   	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
>   
> +	/*
> +	 * While powering off the PHY, only qmp->nocsr_reset needs to be checked. In
> +	 * this way, no matter whether the PHY settings were initially programmed by
> +	 * bootloader or PHY driver itself, we can reuse them when PHY is powered on
> +	 * next time.
> +	 */
> +	if (qmp->nocsr_reset)
> +		goto skip_phy_deinit;
> +
>   	/* PHY reset */
>   	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>   
> @@ -4360,6 +4408,7 @@ static int qmp_pcie_power_off(struct phy *phy)
>   	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>   			cfg->pwrdn_ctrl);
>   
> +skip_phy_deinit:
>   	return 0;
>   }
>   



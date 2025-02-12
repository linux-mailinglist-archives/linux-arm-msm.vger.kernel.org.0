Return-Path: <linux-arm-msm+bounces-47743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38845A32445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 12:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6CBA3A8969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981FE209F41;
	Wed, 12 Feb 2025 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NvwfF/bX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EC209F45
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358375; cv=none; b=oY5Yh5yUIF7DmwpaDskEqP3Wi5tiKK8TefjJxPg2+e/2AoFO9QafxoJiiT6Ngk4NKM0HfcwrWyjf/Y9GcbjP4un6xm9jw+uEJ9o2KxPQgJqnqEp+W4Z57JFacsPE2K4shnW23wSsUhAD8aKlpbVdFohQmpyMtrjPe8aiUgS8rjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358375; c=relaxed/simple;
	bh=6D3nMrmCxsBf15TskNXFx60fO6TuKW0/6OK+Gn1FhrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOuZHK8KLqBslHKhKpd/Q/rrBztY9QhNhTpfrclPc9+EYDXgYIHHdaPiUMGajJVCNBa67Lgsr5vjEyXZ80gi+nnFLpMpqnrXMlnzqeu8olXUYV/QmlH0VHgmtpftfsBGxfIhNl8XbB6qud0Okp9CJWeuRoJW9CBuUZP5f5pJX9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NvwfF/bX; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54505191cdcso4316977e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739358371; x=1739963171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbuIJxgxOM6b3FAvs3lxmIETNGAVSRJQpWG3dxdlGlo=;
        b=NvwfF/bXaRTEAssLTv/OeQ23sRf6izX253YiIRhNuofbhxGqEeTmBtQ10J6ZbZUokC
         fKEvPVEJyJ69BmJWManleYTqgwss7fa5MPPbooEQIsgX4Mqs9FMrVljy5E08esab8wEk
         dBvnh2FrPGN4IzZ3jyjR5/5BGsweWDlEZomZsEPmo3zNgtTJEtry+msUhWbNCGVbPMT+
         ssgnP2Sgfd9LARVDpxiOE+IOJxUoO3PgB6O4PXUMmxHQnHBCtnqHTOfAXu84SVcdEQyu
         6Q5wlkHxdW1QDMqAGD2kX5oQExyR0EINam6cT+p/jMuYUQ3DRehjE1NVxblQ8Rlx475f
         Sxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358371; x=1739963171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbuIJxgxOM6b3FAvs3lxmIETNGAVSRJQpWG3dxdlGlo=;
        b=GJJwaboguzsYExB7rd69ZP8V6zy4rb+xDyUc/ts2a88px/TjBS5hWj17L2ZeVaRppl
         5gEr5EwJC6isyPHHz0RlatWmGjwE+IsfuiczEuFWGW7hBakl/q7aKTnDOubih7ViwgdZ
         mz9J09Ljo5XWQCzCNUq52FJj8sBVvI5PTkXTbAz36FQ0olBTBSu8+GXVhnLNWYYQC4M4
         guJj6xJX79+oULIBwikjwGLWv3pi9hc3vic7XXcNguo86yYyJ1J2ipw9iq6U/SE/PuJx
         2nTEPY1d3GoSuxYK/4zpPAVaWk161v3SF+CNh4o/M8tNt7vvvmsYxP+uHMQYMOGxfPAp
         eF5g==
X-Forwarded-Encrypted: i=1; AJvYcCUjOK5/0E36CXabk+827nW+6QgkPgAHs8bqZNf/9BSFt1az3mwtG9hP66BS7Q7qtNayV9RpcAiEFm5aOmgR@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/vwWuTchipIiKUUwqOZ5+aR94Nqm0vRbg+gnBJlGrv7bHwLl
	X/crQOXHMecJ8CiUtCpJJDj580TjAPCSgL4nV33dMFsEgfKfrrd2uqkdFKd/1GE=
X-Gm-Gg: ASbGnctgqHbWla0NccYG+XNxCk9UNs3BE4Ub754yeY0CiFBDoE1FKa8qLBMTRCffuNt
	o5UhsyheLTS5yrIDT//+PDfzCtJTpg5j9y2VGArzqI/tzUPw2a7DD0mquBhB6XZcVNoVQsxdipF
	14Hycs+hf+zTMvYXposJJHlBhSKU966Gd/7mBK5gqOBTtuKuKMA/g1kP+b2XueyvILsUZT5gvXQ
	KgwhUw8lWuZtY77YNiSVv1KtRn7AI5U1ulAezcnBE8U5I1G282C6+8hJwAYwbI2hzRmA73yRnbh
	0OzPCc6vyPgjuZYbBpOe03AC6hEhSKwwub5+LvBrYsCARUatCrjrpuc5HEBUsVGqBvEdTAU=
X-Google-Smtp-Source: AGHT+IFTcKdx4nA23pokOx2URIwXHiFnzKqLGUwaYVxKBpnpui9vFh4KPIxyijE789GxUxpT3RNyNw==
X-Received: by 2002:a05:6512:31ce:b0:545:a2a:589 with SMTP id 2adb3069b0e04-5451816d735mr762866e87.52.1739358371362;
        Wed, 12 Feb 2025 03:06:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450f6a7246sm721156e87.121.2025.02.12.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 03:06:09 -0800 (PST)
Date: Wed, 12 Feb 2025 13:06:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de, 
	abel.vesa@linaro.org, quic_qianyu@quicinc.com, neil.armstrong@linaro.org, 
	manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com, konrad.dybcio@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Message-ID: <ycunwk7pz4h2vvtztbo27ae64u2g6prsndks4uxtnyh75yvcka@4r6haszju6sw>
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
 <20250211094231.1813558-3-quic_wenbyao@quicinc.com>
 <7deghiadmomrz7w7vq3v7nkzq2kabq4xbhkouswjrexif7pip3@tvjlpvuulxvp>
 <791fa29e-a2b5-d5f6-3cbc-0f499b463262@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791fa29e-a2b5-d5f6-3cbc-0f499b463262@quicinc.com>

On Wed, Feb 12, 2025 at 04:31:21PM +0800, Wenbin Yao (Consultant) wrote:
> On 2/12/2025 8:13 AM, Dmitry Baryshkov wrote:
> > On Tue, Feb 11, 2025 at 05:42:31PM +0800, Wenbin Yao wrote:
> > > From: Qiang Yu <quic_qianyu@quicinc.com>
> > > 
> > > Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
> > > whole PHY (hardware and register), no_csr reset only resets PHY hardware
> > > but retains register values, which means PHY setting can be skipped during
> > > PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
> > > after that.
> > > 
> > > Hence, determine whether the PHY has been enabled in bootloader by
> > > verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
> > > available, skip BCR reset and PHY register setting to establish the PCIe
> > > link with bootloader - programmed PHY settings.
> > > 
> > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
> > >   1 file changed, 58 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > index ac42e4b01065..7f0802d09812 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> > > @@ -2805,6 +2805,7 @@ struct qmp_pcie {
> > >   	const struct qmp_phy_cfg *cfg;
> > >   	bool tcsr_4ln_config;
> > > +	bool phy_initialized;
> > >   	void __iomem *serdes;
> > >   	void __iomem *pcs;
> > > @@ -3976,6 +3977,7 @@ static int qmp_pcie_init(struct phy *phy)
> > >   {
> > >   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> > >   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > +	void __iomem *pcs = qmp->pcs;
> > >   	int ret;
> > >   	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> > > @@ -3984,10 +3986,17 @@ static int qmp_pcie_init(struct phy *phy)
> > >   		return ret;
> > >   	}
> > > -	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> > > -	if (ret) {
> > > -		dev_err(qmp->dev, "reset assert failed\n");
> > > -		goto err_disable_regulators;
> > > +	qmp->phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
> > > +	/*
> > > +	 * Toggle BCR reset for phy that doesn't support no_csr
> > > +	 * reset or has not been initialized
> > > +	 */
> > > +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
> > Instead of having phy_initialized please add another boolean field,
> > qmp->skip_init = !!qmp->nocsr_reset && !!phy_initialized;
> > Use qmp->skip_init through the code.
> 
> In qmp_pcie_power_off and qmp_pcie_exit, we only check qmp->nocsr_reset. It
> 
> seems unnecessary to combine qmp->nocsr_reset with phy_initialized.

The PHY is going to be initialized after qmp_pcie_init() completes, but
you are not updating phy_initialized. On the other hand skip_init still
does what it is supposed to do: tells the driver to skip (re-)init of
the registers.

> 
> > 
> > > +		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> > > +		if (ret) {
> > > +			dev_err(qmp->dev, "reset assert failed\n");
> > > +			goto err_disable_regulators;
> > > +		}
> > >   	}
> > >   	ret = reset_control_assert(qmp->nocsr_reset);
> > > @@ -3998,10 +4007,12 @@ static int qmp_pcie_init(struct phy *phy)
> > >   	usleep_range(200, 300);
> > > -	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> > > -	if (ret) {
> > > -		dev_err(qmp->dev, "reset deassert failed\n");
> > > -		goto err_assert_reset;
> > > +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
> > > +		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
> > > +		if (ret) {
> > > +			dev_err(qmp->dev, "reset deassert failed\n");
> > > +			goto err_assert_reset;
> > > +		}
> > >   	}
> > >   	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
> > > @@ -4011,7 +4022,8 @@ static int qmp_pcie_init(struct phy *phy)
> > >   	return 0;
> > >   err_assert_reset:
> > > -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> > > +	if (!qmp->nocsr_reset || !qmp->phy_initialized)
> > > +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> > >   err_disable_regulators:
> > >   	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
> > > @@ -4023,7 +4035,10 @@ static int qmp_pcie_exit(struct phy *phy)
> > >   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
> > >   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > > -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> > > +	if (!qmp->nocsr_reset)
> > > +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
> > > +	else
> > > +		reset_control_assert(qmp->nocsr_reset);
> > >   	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
> > > @@ -4042,16 +4057,22 @@ static int qmp_pcie_power_on(struct phy *phy)
> > >   	unsigned int mask, val;
> > >   	int ret;
> > > -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> > > -			cfg->pwrdn_ctrl);
> > > +	/*
> > > +	 * Write CSR register for phy that doesn't support no_csr
> > what is CSR register?
> The registers of PHY.
> > 
> > > +	 * reset or has not been initialized
> > > +	 */
> > > +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
> > > +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> > > +				cfg->pwrdn_ctrl);
> > > -	if (qmp->mode == PHY_MODE_PCIE_RC)
> > > -		mode_tbls = cfg->tbls_rc;
> > > -	else
> > > -		mode_tbls = cfg->tbls_ep;
> > > +		if (qmp->mode == PHY_MODE_PCIE_RC)
> > > +			mode_tbls = cfg->tbls_rc;
> > > +		else
> > > +			mode_tbls = cfg->tbls_ep;
> > > -	qmp_pcie_init_registers(qmp, &cfg->tbls);
> > > -	qmp_pcie_init_registers(qmp, mode_tbls);
> > > +		qmp_pcie_init_registers(qmp, &cfg->tbls);
> > > +		qmp_pcie_init_registers(qmp, mode_tbls);
> > > +	}
> > >   	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
> > >   	if (ret)
> > > @@ -4063,15 +4084,16 @@ static int qmp_pcie_power_on(struct phy *phy)
> > >   		goto err_disable_pipe_clk;
> > >   	}
> > > -	/* Pull PHY out of reset state */
> > > -	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > > +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
> > > +		/* Pull PHY out of reset state */
> > > +		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > > -	/* start SerDes and Phy-Coding-Sublayer */
> > > -	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
> > > -
> > > -	if (!cfg->skip_start_delay)
> > > -		usleep_range(1000, 1200);
> > > +		/* start SerDes and Phy-Coding-Sublayer */
> > > +		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
> > > +		if (!cfg->skip_start_delay)
> > > +			usleep_range(1000, 1200);
> > > +	}
> > >   	status = pcs + cfg->regs[QPHY_PCS_STATUS];
> > >   	mask = cfg->phy_status;
> > >   	ret = readl_poll_timeout(status, val, !(val & mask), 200,
> > > @@ -4096,16 +4118,19 @@ static int qmp_pcie_power_off(struct phy *phy)
> > >   	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
> > > -	/* PHY reset */
> > > -	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > > -	/* stop SerDes and Phy-Coding-Sublayer */
> > > -	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
> > > -			SERDES_START | PCS_START);
> > > +	if (!qmp->nocsr_reset) {
> > Why this one doesn't check for the qmp->phy_initialized?
> 
> If a PHY supports no_csr reset but isn't enabled in the bootloader, we
> 
> still need to program the phy settings only once so that we can reuse them
> 
> during the D3cold -> D0 cycle. Therefore, we don't check
> 
> qmp->phy_initialized here.

Please add a comment. In future please make sure that your answer
doesn't contain unnecessary empty lines. It makes it harder to read your
response.

> 
> > 
> > > +		/* PHY reset */
> > > +		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> > > -	/* Put PHY into POWER DOWN state: active low */
> > > -	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> > > -			cfg->pwrdn_ctrl);
> > > +		/* stop SerDes and Phy-Coding-Sublayer */
> > > +		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
> > > +				SERDES_START | PCS_START);
> > > +
> > > +		/* Put PHY into POWER DOWN state: active low */
> > > +		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
> > > +				cfg->pwrdn_ctrl);
> > > +	}
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.34.1
> > > 
> -- 
> With best wishes
> Wenbin

-- 
With best wishes
Dmitry


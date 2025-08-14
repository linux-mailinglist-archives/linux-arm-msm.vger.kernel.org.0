Return-Path: <linux-arm-msm+bounces-69291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CAB27199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4290A1CC4F27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508C827FD6B;
	Thu, 14 Aug 2025 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrPSpGBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2746627FB28;
	Thu, 14 Aug 2025 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755210368; cv=none; b=sU8nyiJq96iOHuExRZnh81Rzf5Vk6CcPgDHbsSpy0Sh5DEijMAJevVE/WgTpqpDQENjYiJD2OxgSqFn1VKToivSBxpU8mTFXRFj6mSQvV4d/sT0xsKGb93F0gDjCA3p1x25GdeGkutsVBJLVgA5FglQWFoo8YEmDTz5OEX2/hT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755210368; c=relaxed/simple;
	bh=PpBhujVqq3G2HXm3lppYS9UmsqQ/kcjSTxjYIgy9JsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oq7zsfgcsM4Sm7omdd30TqDUTEeCUHgQQxpQUryHgnTL3e3sL3/p9iZzgY0UtcMtGPqhgbR0NLjIe3vmz1rv/X9b4FTy177kgePsWkJHe0UMifUS8URkhX4CKBxl7LJgbgES1w7pJMsB+3uW7Dq0C7s9JXY/dHqYlFebJM5+Dx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrPSpGBC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9108C4CEED;
	Thu, 14 Aug 2025 22:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755210367;
	bh=PpBhujVqq3G2HXm3lppYS9UmsqQ/kcjSTxjYIgy9JsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YrPSpGBCHsXyFNPh/6g8o48PRM8/VHyukR+Q2tNpy/lPpGHzqxIv+PX4iMKS8xziU
	 /1IDAXelY11oCexwNRsr1KJ9SauhS55BkB+y12+9MbtdPUo6XIK649neJkr+KizhWr
	 tIL/SbPWTXMKu3BR0+3UMabEjQhOTES3bDgd/GqH/2VNKqqmLLPjKCHcW3OO2FfSXj
	 Lijt6iv/rlDxjBPPx1JsFvjIQKibcvoDRQplXwTZgGVHX/AlzE8RcFJu22ubNZIUiS
	 Jc/wlLLoMwew5dvkJp/f8Say7hXWS0D5CJEtcbiQ20ijkioAV9Gsk8/Wk593jwt998
	 TKxvHrli/s4fw==
Date: Thu, 14 Aug 2025 17:26:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v2] phy: qcom: qmp-pcie: Fix PHY initialization when
 powered down by firmware
Message-ID: <e5hn42qxz2eqgjanyoxb2456wvuw6zy55ibbg6fh33jma7utvq@mlq2a57owz4g>
References: <20250814-phy-qcom-qmp-pcie-nocsr-fix-v2-1-fe562b5d02a1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-phy-qcom-qmp-pcie-nocsr-fix-v2-1-fe562b5d02a1@linaro.org>

On Thu, Aug 14, 2025 at 11:27:10AM +0200, Stephan Gerhold wrote:
> Commit 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention
> support") added support for using the "no_csr" reset to skip configuration
> of the PHY if the init sequence was already applied by the boot firmware.
> The expectation is that the PHY is only turned on/off by using the "no_csr"
> reset, instead of powering it down and re-programming it after a full
> reset.
> 
> The boot firmware on X1E does not fully conform to this expectation: If the
> PCIe3 link fails to come up (e.g. because no PCIe card is inserted), the
> firmware powers down the PHY using the QPHY_PCS_POWER_DOWN_CONTROL
> register. The QPHY_START_CTRL register is kept as-is, so the driver assumes
> the PHY is already initialized and skips the configuration/power up
> sequence. The PHY won't come up again without clearing the
> QPHY_PCS_POWER_DOWN_CONTROL, so eventually initialization fails:
> 
>   qcom-qmp-pcie-phy 1be0000.phy: phy initialization timed-out
>   phy phy-1be0000.phy.0: phy poweron failed --> -110
>   qcom-pcie 1bd0000.pcie: cannot initialize host
>   qcom-pcie 1bd0000.pcie: probe with driver qcom-pcie failed with error -110
> 
> This can be reliably reproduced on the X1E CRD, QCP and Devkit when no card
> is inserted for PCIe3.
> 
> Fix this by checking the QPHY_PCS_POWER_DOWN_CONTROL register in addition
> to QPHY_START_CTRL. If the PHY is powered down with the register, it
> doesn't conform to the expectations for using the "no_csr" reset, so we
> fully re-initialize with the normal reset sequence.
> 
> Also check the register more carefully to ensure all of the bits we expect
> are actually set. A simple !!(readl()) is not enough, because the PHY might
> be only partially set up with some of the expected bits set.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0cc22f5a861c ("phy: qcom: qmp-pcie: Add PHY register retention support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v2:
> - Ensure that all expected bits are set (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250812-phy-qcom-qmp-pcie-nocsr-fix-v1-1-9a7d0a5d2b46@linaro.org
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 95830dcfdec9b1f68fd55d1cc3c102985cfafcc1..80973527fafcb294273dff1864828532dab738db 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -3067,6 +3067,14 @@ struct qmp_pcie {
>  	struct clk_fixed_rate aux_clk_fixed;
>  };
>  
> +static bool qphy_checkbits(const void __iomem *base, u32 offset, u32 val)
> +{
> +	u32 reg;
> +
> +	reg = readl(base + offset);
> +	return (reg & val) == val;
> +}
> +
>  static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>  	u32 reg;
> @@ -4339,10 +4347,12 @@ static int qmp_pcie_init(struct phy *phy)
>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>  	void __iomem *pcs = qmp->pcs;
> -	bool phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>  	int ret;
>  
> -	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
> +	qmp->skip_init = qmp->nocsr_reset &&
> +		qphy_checkbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START) &&
> +		qphy_checkbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], cfg->pwrdn_ctrl);

IMHO the "phy_initialized" variable does provide valuable context to
what those (now) two lines represents. That is particularly relevant as
the second one is active low...so at least I need to think a bit extra
to understand what's going on.

Other than that, I think this looks good.

Regards,
Bjorn

> +
>  	/*
>  	 * We need to check the existence of init sequences in two cases:
>  	 * 1. The PHY doesn't support no_csr reset.
> 
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250812-phy-qcom-qmp-pcie-nocsr-fix-1603106294cd
> 
> Best regards,
> -- 
> Stephan Gerhold <stephan.gerhold@linaro.org>
> 


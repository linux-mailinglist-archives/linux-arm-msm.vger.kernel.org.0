Return-Path: <linux-arm-msm+bounces-46037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD2A1B0B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D5013AAF2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 07:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05BB1DA636;
	Fri, 24 Jan 2025 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8+tLVsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574433998;
	Fri, 24 Jan 2025 07:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702645; cv=none; b=VHg+UHS8GhVO0WuSZ9vzVTSTyUpf2g37uPDp1EpeU75fawBrT4kqbTWvBm2+6YqlnQPjTxBXBTMakygeIoqdYko8793cMFdws7MNhoP8ZHqKafWPtftf2sV3rsURKZZBl6sFJKi8Lgh7d8euo3d8v2LoFLPOwCydFJG1tgCF2No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702645; c=relaxed/simple;
	bh=IrJIjEb8wVn4o399UYJ07Qnaxga6FGchkSPjWWrZUGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7I46gQRZofDL5zqSsvc15JQsvmOz39tIfrQ9am1cmekRGdZ1HfpuWsYqN/S32hS1QkEBy3DaQN2HANYCsvBXc+1LQhxn781x7otNmQxXSZoQ+jshMbRdAkmI9aUTrIJ2qFGXEYvO+7vO0M5NKjjF8BRJm4aaAn8f2syGqs9vo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8+tLVsG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46ACC4CED2;
	Fri, 24 Jan 2025 07:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737702645;
	bh=IrJIjEb8wVn4o399UYJ07Qnaxga6FGchkSPjWWrZUGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8+tLVsG7hTXmsaqKxqq1X6xuXHhTDLWdnToSRZ1SI5kylEjlI5PgaFpTzd5oCMRz
	 8NTJqcd8PoMOZtnmmpYTCDZQ81K717jpajtv26Nnabro7V4ZwVsWouzKYRbX976ytD
	 0wKa6Mig7bZbwMmUTwweToEg4KwdxL8BEgRpM0YBASeg6oW0+G4uXM33KptaxlmWtw
	 KrUBHytibFSXZptcBfAkn4hnjHHVE1LUW7LT9PdzlppmYF0vavneKNRKIjprmIYxbC
	 aJuZJUHV5MCoEXOUmiYSAgPNu85u3QyJTjVd9DeDRw0vlPmf99/yzY0yURxwKMrDtR
	 wm6Hl7r9E8tow==
Date: Fri, 24 Jan 2025 12:40:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
	dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
	manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] phy: qcom: pcie: Determine has_nocsr_reset
 dynamically
Message-ID: <20250124071033.nda66hp3pumekozz@thinkpad>
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-2-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250121094140.4006801-2-quic_wenbyao@quicinc.com>

On Tue, Jan 21, 2025 at 05:41:39PM +0800, Wenbin Yao wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Decide the in-driver logic based on whether the nocsr reset is present
> and defer checking the appropriateness of that to dt-bindings to save
> on boilerplate.
> 
> Reset controller APIs are fine consuming a nullptr, so no additional
> checks are necessary there.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 873f2f9844c6..ac42e4b01065 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2793,8 +2793,6 @@ struct qmp_phy_cfg {
>  
>  	bool skip_start_delay;
>  
> -	bool has_nocsr_reset;
> -
>  	/* QMP PHY pipe clock interface rate */
>  	unsigned long pipe_clock_rate;
>  
> @@ -3685,7 +3683,6 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  
>  	/* 20MHz PHY AUX Clock */
>  	.aux_clock_rate		= 20000000,
> @@ -3718,7 +3715,6 @@ static const struct qmp_phy_cfg sm8650_qmp_gen4x2_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  
>  	/* 20MHz PHY AUX Clock */
>  	.aux_clock_rate		= 20000000,
> @@ -3836,7 +3832,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  };
>  
>  static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
> @@ -3870,7 +3865,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  };
>  
>  static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
> @@ -3902,7 +3896,6 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
>  
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
>  	.phy_status		= PHYSTATUS_4_20,
> -	.has_nocsr_reset	= true,
>  };
>  
>  static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
> @@ -4203,11 +4196,14 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to get resets\n");
>  
> -	if (cfg->has_nocsr_reset) {
> -		qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
> -		if (IS_ERR(qmp->nocsr_reset))
> +	qmp->nocsr_reset = devm_reset_control_get_exclusive(dev, "phy_nocsr");
> +	if (IS_ERR(qmp->nocsr_reset)) {
> +		if (PTR_ERR(qmp->nocsr_reset) == -ENOENT ||
> +		    PTR_ERR(qmp->nocsr_reset) == -EINVAL)
> +			qmp->nocsr_reset = NULL;
> +		else
>  			return dev_err_probe(dev, PTR_ERR(qmp->nocsr_reset),
> -						"failed to get no-csr reset\n");
> +					     "failed to get no-csr reset\n");
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்


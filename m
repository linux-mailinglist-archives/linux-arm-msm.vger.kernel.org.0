Return-Path: <linux-arm-msm+bounces-38044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD0E9CF028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A86282311
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 15:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90471E32C0;
	Fri, 15 Nov 2024 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpY9rfPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C311E3768
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684699; cv=none; b=s7rOEZzUIObHVoQZLSVTw6VI3pBIcphmUbVcVsBEBKIl5BTYr3bi7wXlqLOovCI6ka6H8HNmfmLA6BdkFpt71KPiTiRacr6NMDhR8gf55XRzxpP5RFNWM2nRjGQXCrKAm371C1cCpN0jcaAFOlCFcL8kDoaPy/B6aNC6iEaRobc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684699; c=relaxed/simple;
	bh=yrybuEZMBuFWLFkw52GE5liuYHLqeQQ7TVIYlT78UmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgF9VF0oBKPzKDxbMDxXxi9Zi/yMjC3gNT0JkD6pRHUnlO0zNflsPIE+hgAy9ANpk0FDPW2WUiKyazqYjp6sEyhBgutT1VMf4Kz+1OmWwnifP19cYIi9kA9tNNEA3pHN6RxYzO3LTGGuLZPcTs1xvuxDJmSWWfaI4+C0ro3cD9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpY9rfPk; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e63c8678so2053517e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 07:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731684696; x=1732289496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inrBvd3yEVvGYSUYCF+19P+5c0wVMdpldcGBh/rQ0h4=;
        b=dpY9rfPk5f3rAkLE5lXzSkblwlaA67y57cz7PRMnBtnh1oh/xrbXYyrdUBMRmZ41TO
         sCRgQH2hUIWKUd05dAnNouSVbs3LIj7zfzHR0MIxCeux1yH2hsF7pVqAwmfs8mnVevKP
         tNRyHsvVh85AI6kTxVT1m+QhrsUiHWDIuhIKWUfak08hsTMulpB2gItQ3vL3aYP0AIbQ
         DFYtINQgZUpobVHJ2Sj1jIuvv5FlXVaXT8GUKCsJJpysCRNcOy7zE242f99Bw5GdVp5i
         AuY/jQ3zh3HQZXTFlEkbwvc6SMbbZJ49DG+YjZhrvR3SLxC217MNa4OZgvrqlfD00mJt
         B0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684696; x=1732289496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inrBvd3yEVvGYSUYCF+19P+5c0wVMdpldcGBh/rQ0h4=;
        b=fS739Lnb7Os5ycn4OuOSV6CJg0g+Gy7ZrAWFvtMkG9nVpzTHW2aWoWM3MhoSFEdWjJ
         2P7l5AwZxNMjsGFMwC5VOg9L2mMOrC0LzFMguyfCG2yFWZxSm6QudB5qpfOv8FGx6TTl
         1Y/nq2RH2ujm6dvqk98I1vkJYUyQQPwGMUldzeGMVNCe6e7eRNXPegQSXoIZnhoHXNJT
         tmyvcUJVmb43zi/ko+H7v0YvrbcYxN+kO/4jCCGv/lrxbVCGuXHxg7xzY16WZGo514KV
         3Fjm71u2h0i3xLq29JKP/V5ecGXrWYhjJi8PdqcQjhAcnxkZFqFDf4/KNbMNpVTZ6UvX
         TPYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZRLHmlHf6p6qvDUVtAg08wHriJscwN7PWbsXk+greKidHlCyvagRzp8bTIfwyWJ2VJPDuvohghPEDLXzf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6eXIY81YzSEw2++sz1eRUFCT/QRCCbcE5/TwBIre3J3oYCAd5
	Ld0Wxj+S53v1Od7//HX3v7aJlXoDdrtGtox6iWJlMCq6Bx8kvHBjxoX+ak04+6c=
X-Google-Smtp-Source: AGHT+IECsz+PqnXUM2556/hFOFyq50f6HWCEcrt9pwdgUS8BCxtuxRRrcYgrmSQzGSscbL7uMnl6Kw==
X-Received: by 2002:a05:6512:3e02:b0:53d:a2b1:b3db with SMTP id 2adb3069b0e04-53dab2a2e33mr1535582e87.33.1731684695588;
        Fri, 15 Nov 2024 07:31:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da64f2bb3sm617440e87.34.2024.11.15.07.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:31:35 -0800 (PST)
Date: Fri, 15 Nov 2024 17:31:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh
 clocks
Message-ID: <5pgwerxhqhyr2u47grqzgzvvng4rojzq4gozil7vy37bew5pqj@wt676vfjs7bg>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-3-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112002807.2804021-3-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:28:02PM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add the RPMH clocks present in SM8750 SoC and fix the match table to
> sort it alphabetically.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index eefc322ce367..a3b381e34e48 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -368,6 +368,10 @@ DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
>  DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
>  DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
>  
> +DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
> +DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
> +DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);

Are the two last clocks defined "for the future platforms"?

> +
>  DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
>  DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
>  DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
> @@ -807,6 +811,27 @@ static const struct clk_rpmh_desc clk_rpmh_x1e80100 = {
>  	.num_clks = ARRAY_SIZE(x1e80100_rpmh_clocks),
>  };
>  
> +static struct clk_hw *sm8750_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
> +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> +	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a2.hw,
> +	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a2_ao.hw,
> +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
> +	.clks = sm8750_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sm8750_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -894,6 +919,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
>  	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
>  	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
> +	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
>  	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
>  	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
>  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> @@ -909,7 +935,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
>  	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
>  	{ .compatible = "qcom,sm8650-rpmh-clk", .data = &clk_rpmh_sm8650},
> -	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},

Please don't mix fixes and actual code. I'd suggest splitting sc7280
move to the separate commit.

> +	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
>  	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
>  	{ }
>  };
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry


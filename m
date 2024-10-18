Return-Path: <linux-arm-msm+bounces-34953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D89A3DDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 14:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F78F1F21286
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4D618028;
	Fri, 18 Oct 2024 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eX6Lu9Vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588B27466
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253285; cv=none; b=CuD4rw2w1I7MkYYhzx2EJTJKHOnsWQJls8LF8uHSjUMYgUChv/AwTimRINizbgaStWc/6dVpUgBBGA71kYhCaKYv19IQMlWgxhFGtb/NulHQ2SAW0QvVOZTzcJltbv9PmoyqdDGr+DMbu8r9I0hcFW9LRlmC32oxxlhIXZ2VdjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253285; c=relaxed/simple;
	bh=xUrIQHUCjZJyYr9h9a2ncIVx9VCCBKv1v97TddV3KfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr7VjJqYL176fSvbKB7tdjN9ysQkvHaFUWx4n/zMIngPMjaLChMrhzDeTenZ1s5swIxZEAc67ejkT0BaKJo4ZJVpFh6UmP8toPkXML5kxMtEN8HNaUj/Cg6g42FT1m7oT6zDZD6EwIFN+ylLwV+ZFjJ0tdAbr7bvgka8BswiNP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eX6Lu9Vg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539fe02c386so3166184e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729253282; x=1729858082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FHlkL/8BsxsxPx0ZFvj8OHCJ0PsZn0UFcrp/m+9hZV4=;
        b=eX6Lu9VgCga0XNR7tPve1HZUlAFp1KAjPmualYOD8kABcnUW2Vi8R3KNUMe4vN89DW
         0IvT/DzAZAqq88nNm2+JOd3H25DiyNkHPMjJvW18UaSWDwJpkZSMIw2tyJuoYGFORQ8J
         UPBmw5EIQPaJvf1YdKSNW1L3awpMhXqAND1wTUL4K9ptMqJLWCD5wtoFW+8fugJjxiT0
         Ff9WrXegpln/ybC4cTgMQP7/Xoqbpb+bEE5dblHx/U56hwOexDZa4EG+rv0oGJxT/qKu
         a3MzinVS2qVytQjnDtcmJopePFL1adb8oN+gymdhHTuVCvfxtwYXThrPGxSYKUSDgXri
         Tb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253282; x=1729858082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHlkL/8BsxsxPx0ZFvj8OHCJ0PsZn0UFcrp/m+9hZV4=;
        b=o+mo2bBEurjqWH4qMriu8CFRJjtO59uzb2AgUYa/gP6VbZ65cd/Yllltg7C6EwOnkr
         IovxaFnyyULyesgiigsuBDd9we61V43Wzt2tbbvBXWz3oXyVFTh3xcIszE/UzSV2vrKy
         QsAtJVmxYj4s8FdRhf4fdWzo0/CWom73aEK3mvs3sr5/krvJ4ehZdxZLsoDJFW8lAe2o
         s7acfIjYKSt/w1VRwZ8iBeLKZzYbDpVSKLnfhElVdSPLNt4QXsQyMhkTzW4JgDT6S+hT
         gGIO8j0bDt36axx6G/IkatAIjN5hz6qAgsClP5TsNqfZ8VcHNCBbEoLxwryDWBPryY4W
         CRQw==
X-Forwarded-Encrypted: i=1; AJvYcCVwGcyEdL/h09EYNMsW/RJK6HTPWjl922/pP4Nax28sU7FJDtJRxN5rUKys2bePhEDJRJOTAcpqaAWTMQii@vger.kernel.org
X-Gm-Message-State: AOJu0YyKlyig3YcQKdP0qbq9lQ2GOjYvZKV0Kmf4vDFYNL8mmab0UR7/
	QzrLItxXArHCrBxEccya1kODDFNt9k0MQpus0o5CVKR6W63Fo/MoYpUgjgxqh4E=
X-Google-Smtp-Source: AGHT+IF4fR2V0+fs1LXk4Y63ajxHi6PYbJ7RvuQfAL/I4PlXjbgYR2WgC4CbmULEBhDbBQYXpb2fEA==
X-Received: by 2002:a05:6512:2316:b0:539:f51d:8273 with SMTP id 2adb3069b0e04-53a0c6a56d0mr2408613e87.1.1729253282197;
        Fri, 18 Oct 2024 05:08:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211a8fsm202174e87.261.2024.10.18.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:08:00 -0700 (PDT)
Date: Fri, 18 Oct 2024 15:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] clk: qcom: Add support for Camera Clock Controller
 on QCS8300
Message-ID: <pw6p5mhspqnhoszefljcuwsbmtwbywzequmsgkh366lam54fve@xpf7mmxeorkx>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
 <20241018-qcs8300-mm-patches-v1-4-859095e0776c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300-mm-patches-v1-4-859095e0776c@quicinc.com>

On Fri, Oct 18, 2024 at 04:42:32PM +0530, Imran Shaik wrote:
> Add support to the QCS8300 Camera clock controller by extending
> the SA8775P Camera clock controller, which is mostly identical
> but QCS8300 has few additional clocks and few other differences.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sa8775p.c | 99 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
> index c04801a5af35..0ef3c6015c34 100644
> --- a/drivers/clk/qcom/camcc-sa8775p.c
> +++ b/drivers/clk/qcom/camcc-sa8775p.c
> @@ -1682,6 +1682,24 @@ static struct clk_branch cam_cc_sm_obs_clk = {
>  	},
>  };
>  
> +static struct clk_branch cam_cc_titan_top_accu_shift_clk = {
> +	.halt_reg = 0x131f0,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x131f0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "cam_cc_titan_top_accu_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&cam_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct gdsc cam_cc_titan_top_gdsc = {
>  	.gdscr = 0x131bc,
>  	.en_rest_wait_val = 0x2,
> @@ -1776,6 +1794,7 @@ static struct clk_regmap *cam_cc_sa8775p_clocks[] = {
>  	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
>  	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
>  	[CAM_CC_SM_OBS_CLK] = &cam_cc_sm_obs_clk.clkr,
> +	[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] = NULL,
>  	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
>  	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
>  };
> @@ -1812,6 +1831,7 @@ static struct qcom_cc_desc cam_cc_sa8775p_desc = {
>  };
>  
>  static const struct of_device_id cam_cc_sa8775p_match_table[] = {
> +	{ .compatible = "qcom,qcs8300-camcc" },
>  	{ .compatible = "qcom,sa8775p-camcc" },
>  	{ }
>  };
> @@ -1842,10 +1862,81 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
>  	clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>  	clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
>  
> -	/* Keep some clocks always enabled */
> -	qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
> -	qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-camcc")) {
> +		cam_cc_camnoc_axi_clk_src.cmd_rcgr = 0x13154;
> +		cam_cc_camnoc_axi_clk.halt_reg = 0x1316c;
> +		cam_cc_camnoc_axi_clk.clkr.enable_reg = 0x1316c;
> +		cam_cc_camnoc_dcd_xo_clk.halt_reg = 0x13174;
> +		cam_cc_camnoc_dcd_xo_clk.clkr.enable_reg = 0x13174;
> +
> +		cam_cc_csi0phytimer_clk_src.cmd_rcgr = 0x15054;
> +		cam_cc_csi1phytimer_clk_src.cmd_rcgr = 0x15078;
> +		cam_cc_csi2phytimer_clk_src.cmd_rcgr = 0x15098;
> +		cam_cc_csid_clk_src.cmd_rcgr = 0x13134;
> +
> +		cam_cc_mclk0_clk_src.cmd_rcgr = 0x15000;
> +		cam_cc_mclk1_clk_src.cmd_rcgr = 0x1501c;
> +		cam_cc_mclk2_clk_src.cmd_rcgr = 0x15038;
> +
> +		cam_cc_fast_ahb_clk_src.cmd_rcgr = 0x13104;
> +		cam_cc_slow_ahb_clk_src.cmd_rcgr = 0x1311c;
> +		cam_cc_xo_clk_src.cmd_rcgr = 0x131b8;
> +		cam_cc_sleep_clk_src.cmd_rcgr = 0x131d4;
> +
> +		cam_cc_core_ahb_clk.halt_reg = 0x131b4;
> +		cam_cc_core_ahb_clk.clkr.enable_reg = 0x131b4;
> +
> +		cam_cc_cpas_ahb_clk.halt_reg = 0x130f4;
> +		cam_cc_cpas_ahb_clk.clkr.enable_reg = 0x130f4;
> +		cam_cc_cpas_fast_ahb_clk.halt_reg = 0x130fc;
> +		cam_cc_cpas_fast_ahb_clk.clkr.enable_reg = 0x130fc;
> +
> +		cam_cc_csi0phytimer_clk.halt_reg = 0x1506c;
> +		cam_cc_csi0phytimer_clk.clkr.enable_reg = 0x1506c;
> +		cam_cc_csi1phytimer_clk.halt_reg = 0x15090;
> +		cam_cc_csi1phytimer_clk.clkr.enable_reg = 0x15090;
> +		cam_cc_csi2phytimer_clk.halt_reg = 0x150b0;
> +		cam_cc_csi2phytimer_clk.clkr.enable_reg = 0x150b0;
> +		cam_cc_csid_clk.halt_reg = 0x1314c;
> +		cam_cc_csid_clk.clkr.enable_reg = 0x1314c;
> +		cam_cc_csid_csiphy_rx_clk.halt_reg = 0x15074;
> +		cam_cc_csid_csiphy_rx_clk.clkr.enable_reg = 0x15074;
> +		cam_cc_csiphy0_clk.halt_reg = 0x15070;
> +		cam_cc_csiphy0_clk.clkr.enable_reg = 0x15070;
> +		cam_cc_csiphy1_clk.halt_reg = 0x15094;
> +		cam_cc_csiphy1_clk.clkr.enable_reg = 0x15094;
> +		cam_cc_csiphy2_clk.halt_reg = 0x150b4;
> +		cam_cc_csiphy2_clk.clkr.enable_reg = 0x150b4;
> +
> +		cam_cc_mclk0_clk.halt_reg = 0x15018;
> +		cam_cc_mclk0_clk.clkr.enable_reg = 0x15018;
> +		cam_cc_mclk1_clk.halt_reg = 0x15034;
> +		cam_cc_mclk1_clk.clkr.enable_reg = 0x15034;
> +		cam_cc_mclk2_clk.halt_reg = 0x15050;
> +		cam_cc_mclk2_clk.clkr.enable_reg = 0x15050;
> +
> +		cam_cc_titan_top_gdsc.gdscr = 0x131a0;

Ugh. I see the point, but I can't say I like it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +
> +		cam_cc_sa8775p_clocks[CAM_CC_CCI_3_CLK] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_CCI_3_CLK_SRC] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_CSI3PHYTIMER_CLK] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_CSI3PHYTIMER_CLK_SRC] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_CSIPHY3_CLK] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_MCLK3_CLK] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_MCLK3_CLK_SRC] = NULL;
> +		cam_cc_sa8775p_clocks[CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK] =
> +				&cam_cc_titan_top_accu_shift_clk.clkr;
> +
> +		/* Keep some clocks always enabled */
> +		qcom_branch_set_clk_en(regmap, 0x13178); /* CAM_CC_CAMNOC_XO_CLK */
> +		qcom_branch_set_clk_en(regmap, 0x131d0); /* CAM_CC_GDSC_CLK */
> +		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_SLEEP_CLK */
> +	} else {
> +		/* Keep some clocks always enabled */
> +		qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
> +		qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
> +		qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
> +	}
>  
>  	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sa8775p_desc, regmap);
>  
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry


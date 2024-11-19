Return-Path: <linux-arm-msm+bounces-38350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D79D2A2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B95BB25986
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E376E1D0E18;
	Tue, 19 Nov 2024 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9tveh3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E311D0E0E;
	Tue, 19 Nov 2024 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030881; cv=none; b=CahQTMYbkoh6/IhiruAZ5wi5t8DxMmxMQhulTagN4A30vWmXOyWMNvvOYZNRIqP6rlI+OVsyDo3YgZ/VXQly8UD+399iJitN2hyKrKS1qT1IIUm9vnirVbrmZsXN2Hb2WOOvNyi81U8Yz39DmqLGiz0a2UVT5zfmulT1e2IM7TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030881; c=relaxed/simple;
	bh=2ralBHIptoxrn19p8ZzAjUTvIwWpqikZwxs06d5A6/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJU/1uNSQp6IEJmFGFNZCZRcGfno/BK8wepGmmc6Ooe+tyiKLNNypYJTGLmcs+K3bGFFSnSFDprUrwUmufETrGD/UPdfUP425XZ2cHp1GsQSL5BLjyYFMxZyw8e+uGPPUeGu7DPkYrChGhuBXPteS9gURmVG7UXwFJ/R/cirHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9tveh3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8D4C4CED0;
	Tue, 19 Nov 2024 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732030881;
	bh=2ralBHIptoxrn19p8ZzAjUTvIwWpqikZwxs06d5A6/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9tveh3/r8FJ2TZG7IL6wBC5AvUBYyXpAqFsYfy0yLFFm1kceOPHbmp749NNJ30fZ
	 P+XV3I5d+thq6VMrWDIHfhS9zsXHHfJ2QTAwVDMjL9UoImJH/MH73EWRm6bZW2uM8+
	 roMPAOhjwOvFT4KipoPTyKH8W/GC1c8y/ZeA25VkiWJynrIQRzwX4scBgJpqRGnAIm
	 tygePyZjzmCALYGpMVx/orU3Tp+MvNEFo4kraopN5ljgM+A2zdS7TYlmqCfxhVKTyV
	 ZYSFbIEzCx1xgG8TZCHPtDRf3AnYSMCKlpvglMgknVQ4LhLAxEE8G10SP5CpvYyOBw
	 /ZtnDEgXNRqjw==
Date: Tue, 19 Nov 2024 09:41:19 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Message-ID: <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>

On Mon, Nov 18, 2024 at 02:24:32AM +0000, Bryan O'Donoghue wrote:
> Right now we have a plethora of singleton power-domains which power clock
> controllers. These singletons are switched on by core logic when we probe
> the clocks.
> 
> However when multiple power-domains are attached to a clock controller that
> list of power-domains needs to be managed outside of core logic.
> 

I'd prefer if you rewrote this to make it clearer for the broader
audience what exactly you mean with "singleton" and "core logic".

> Use dev_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock being registered in
> qcom_cc_really_probe().
> 

Do we need to power on/off all the associated power-domains every time
we access registers in the clock controller etc, or only in relation to
operating these GDSCs?

Regards,
Bjorn

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..b4377fa09f7c0ec8d3c63dfc97d04fbb8cd6e10b 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -22,6 +22,7 @@ struct qcom_cc {
>  	struct qcom_reset_controller reset;
>  	struct clk_regmap **rclks;
>  	size_t num_rclks;
> +	struct dev_pm_domain_list *pd_list;
>  };
>  
>  const
> @@ -283,6 +284,25 @@ static int qcom_cc_icc_register(struct device *dev,
>  						     desc->num_icc_hws, icd);
>  }
>  
> +static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_names = 0,
> +		.num_pd_names = 0,
> +	};
> +	int ret;
> +
> +	/* Only one power-domain platform framework will hook it up */
> +	if (dev->pm_domain)
> +		return 0;
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  int qcom_cc_really_probe(struct device *dev,
>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> @@ -299,6 +319,10 @@ int qcom_cc_really_probe(struct device *dev,
>  	if (!cc)
>  		return -ENOMEM;
>  
> +	ret = qcom_cc_pds_attach(dev, cc);
> +	if (ret)
> +		return ret;
> +
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
>  	reset->rcdev.ops = &qcom_reset_ops;
> 
> -- 
> 2.45.2
> 


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9F72CE706
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 05:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgLDEfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 23:35:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:33436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726038AbgLDEfs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 23:35:48 -0500
Date:   Fri, 4 Dec 2020 10:05:02 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607056507;
        bh=r9QqGHAxUoN0Wt1ZDWKtbhPJWPZyahn/zbEc44BEGZ4=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=J0SgZopenmekB+JVHG/JMVkTylGScNJKJryiyfCIvixK1Ps1YWL+v9HvY0+6m4mLn
         HHlBflj6CB2wXcrbQtcRvNpXylWspibXd0iroYp6XvOuPARIMPcBj/YT45Ucy81Lt3
         xujemkX5pTyQCL44NBPU75YoXBXPBvdqAqi7cSLpI3TbG3HDgIGqKDcMQm+8my9LgS
         Ovea5ZxYkexm19eK9jpBr9pK/4DYygMxy9qmWhMZ9UlpWmGGv+tz0/ZvigZGRW6+b7
         CYILbo53d267/kfeq8n8SPRS0DGzHwx/+TbeJly4e02aiuPH2W8STkfXp/VMZJ+NgZ
         hv04cpeuz5mLA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH 5/5] clk: qcom: gcc: Add clock driver for SM8350
Message-ID: <20201204043502.GJ8403@vkoul-mobl>
References: <20201203070241.2648874-1-vkoul@kernel.org>
 <20201203070241.2648874-6-vkoul@kernel.org>
 <X8l9dRfo7qdRTAMe@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8l9dRfo7qdRTAMe@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 03-12-20, 18:06, Bjorn Andersson wrote:
> On Thu 03 Dec 01:02 CST 2020, Vinod Koul wrote:
> > diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
> [..]
> > +static int gcc_sm8350_probe(struct platform_device *pdev)
> > +{
> > +	struct regmap *regmap;
> > +	int ret;
> > +
> > +	regmap = qcom_cc_map(pdev, &gcc_sm8350_desc);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(&pdev->dev, "Failed to map gcc registers\n");
> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> > +	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
> > +
> > +	/*
> > +	 * Enable clocks required by the i2c-connected pm8008 regulators. Don't
> > +	 * register them with the clock framework so that client requests are
> > +	 * short-circuited before grabbing the enable/prepare locks. This
> > +	 * prevents deadlocks between the clk/regulator frameworks.
> > +	 *
> > +	 *	gcc_qupv3_wrap_1_m_ahb_clk
> > +	 *	gcc_qupv3_wrap_1_s_ahb_clk
> > +	 *	gcc_qupv3_wrap1_s5_clk
> > +	 */
> 
> Isn't this a workaround inherited from the downstream control of
> regulators from within the clock core? Does this still apply upstream?

Let me check on this bit...

Thanks
-- 
~Vinod

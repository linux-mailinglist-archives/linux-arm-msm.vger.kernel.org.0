Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4B92CEC0A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 11:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729802AbgLDKUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 05:20:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:39020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729282AbgLDKUA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 05:20:00 -0500
Date:   Fri, 4 Dec 2020 15:49:14 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607077159;
        bh=hNPxyUmSTItskXGbatM3qf8oZU1dgUwfiUVEC5qpV9c=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=l5D36wcebTAZH7I+6HRLCp809Uqqs1+EVpWXwjwvHBwYu6HYG2vzsMvi2kAjSQXBJ
         6e8u3ZP/Gvt5+s+pnMFlyNALEmx4ZLApMKlAtPQ6L73DWGlzZpe28wqfajovYbhJiZ
         dJBuzxBIsqFf1LsD0uurRFbaQCWVrVIxif8DU2Qwlm5mP8YNwdfcn/9kaqoiQmtkiD
         9SpmjMu7XEnPI0ZrhWWMLdjMXnRGge3PEPNEFzwRC32BCgJAZEQzathkRE4Df3n0iY
         0tcRdNFGM0ZxnZ0bEghZagPLkw7xjgzRAR9OX4jhmHNyiNz1UE/uP2il9qQnTFH11u
         ljqESjB6VSiew==
From:   Vinod Koul <vkoul@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH 5/5] clk: qcom: gcc: Add clock driver for SM8350
Message-ID: <20201204101914.GO8403@vkoul-mobl>
References: <20201203070241.2648874-1-vkoul@kernel.org>
 <20201203070241.2648874-6-vkoul@kernel.org>
 <X8l9dRfo7qdRTAMe@builder.lan>
 <20201204043502.GJ8403@vkoul-mobl>
 <302cf18a-080d-a521-8c7a-39c265fbceb8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302cf18a-080d-a521-8c7a-39c265fbceb8@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On 04-12-20, 14:20, Taniya Das wrote:
> On 12/4/2020 10:05 AM, Vinod Koul wrote:
> > On 03-12-20, 18:06, Bjorn Andersson wrote:
> > > On Thu 03 Dec 01:02 CST 2020, Vinod Koul wrote:
> > > > diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
> > > [..]
> > > > +static int gcc_sm8350_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct regmap *regmap;
> > > > +	int ret;
> > > > +
> > > > +	regmap = qcom_cc_map(pdev, &gcc_sm8350_desc);
> > > > +	if (IS_ERR(regmap)) {
> > > > +		dev_err(&pdev->dev, "Failed to map gcc registers\n");
> > > > +		return PTR_ERR(regmap);
> > > > +	}
> > > > +
> > > > +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
> > > > +	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
> > > > +
> > > > +	/*
> > > > +	 * Enable clocks required by the i2c-connected pm8008 regulators. Don't
> > > > +	 * register them with the clock framework so that client requests are
> > > > +	 * short-circuited before grabbing the enable/prepare locks. This
> > > > +	 * prevents deadlocks between the clk/regulator frameworks.
> > > > +	 *
> > > > +	 *	gcc_qupv3_wrap_1_m_ahb_clk
> > > > +	 *	gcc_qupv3_wrap_1_s_ahb_clk
> > > > +	 *	gcc_qupv3_wrap1_s5_clk
> > > > +	 */
> > > 
> > > Isn't this a workaround inherited from the downstream control of
> > > regulators from within the clock core? Does this still apply upstream?
> > 
> > Let me check on this bit...
> > 
> > Thanks
> > 
> 
> No it should not apply.

Thanks for confirmation, removed now. Will send v2

-- 
~Vinod

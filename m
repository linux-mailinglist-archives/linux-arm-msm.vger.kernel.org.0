Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FE04553DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 05:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243015AbhKREoN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 23:44:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:41232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243000AbhKREoM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 23:44:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2C7661AA5;
        Thu, 18 Nov 2021 04:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637210472;
        bh=MLFng7i6JXixGv8xxB8DJTMwXDYFdDoQYX3vx+peNUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qz2hRMrnL1pQO4zZXZiFy5rIb0zOQPf0x8rl3EUhCQbgy5zuyhMdMtYJCFaFeo8w2
         MAB1jSvGzadZ9gp4ZXGkPs4rl5rNhMV2yph5Rk3D7D3AStWHiX2kmcgjVNkF/hr+JF
         aP4IQ4MinPfYwjEkwxv9D4CAgwhkRo4krEN49KqE6tkHLgeJfEtyfTaIlhux/4ANIN
         9sLX/nHmnkik2JZ0fX7WsqHZdxCaKiBHNw3OEvIB2Dn38PqPcQN64V8Sn0062tClRL
         8kT8wMfMGV2L7JD+b3J1vwbokp/XHzfc+MbhQAFUfSkrF9yQ3lzkRL2BvDVhG0KBny
         5EfKEvHu148Wg==
Date:   Thu, 18 Nov 2021 10:11:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc:     g@quicinc.com, agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        tglx@linutronix.de, maz@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v4 2/6] clk: qcom: Add LUCID_EVO PLL type for SDX65
Message-ID: <YZXZY/1xqF1C+eCG@matsya>
References: <cover.1637047731.git.quic_vamslank@quicinc.com>
 <5a048452c128e4b678609bef780e2c1328c482fc.1637047731.git.quic_vamslank@quicinc.com>
 <YZNq+Y07kwhbIboe@matsya>
 <20211118015450.GB18984@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118015450.GB18984@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-11-21, 17:54, Vamsi Krishna Lanka wrote:
> On Tue, Nov 16, 2021 at 01:55:29PM +0530, Vinod Koul wrote:
> > On 15-11-21, 23:38, quic_vamslank@quicinc.com wrote:
> > > From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

> > > +{
> > > +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> > > +	struct regmap *regmap = pll->clkr.regmap;
> > > +	u32 l, frac;
> > > +
> > > +	regmap_read(regmap, PLL_L_VAL(pll), &l);
> > > +	l &= LUCID_EVO_PLL_L_VAL_MASK;
> > > +	regmap_read(regmap, PLL_ALPHA_VAL(pll), &frac);
> > > +
> > > +	return alpha_pll_calc_rate(parent_rate, l, frac, pll_alpha_width(pll));
> > > +}
> > 
> > I think this can use __alpha_pll_trion_set_rate()

> 
> I didn't get with which function are you comparing this. I cannot able to
> find any function similar to this.

This is in upstream, pls see commit: 80ca7765fc75 ("clk: qcom:
clk-alpha-pll: modularize alpha_pll_trion_set_rate()")

-- 
~Vinod

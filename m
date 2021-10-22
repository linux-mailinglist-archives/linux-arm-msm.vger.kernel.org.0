Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F6F4370F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 06:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbhJVEeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 00:34:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:58220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230175AbhJVEeQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 00:34:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21BD16115B;
        Fri, 22 Oct 2021 04:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634877120;
        bh=6l47urclOiVAx/xaVfG+MkEH/1Q5Hsj0OokPHAX8+ug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TbrgMiW7V+jQ/AZRQ4sMb5Ge3T8n9zKz8NWc7KuS5x0bRC5YW10qR/QFDk2+vLxiB
         fBTv2GAhdyCrjqh3GUGNp4SVy8cis2W/47xr5sKk/R8YpjLnjwJ0UeqWkPPq96Q4zZ
         bY+SJCoWWrhu762FYyzEiytiH5fDGIirfRU+juCw6fswhCGd0Zqo/FFeZG0OTSh1pR
         gz8FH5jCjOoF6i8B2CKwDEnn8NmGtrv2jDy+cWJwhHdwx9nhKZt4AC2vrdd3r1ET5+
         mlcSoGCvw9zNp9PMahL6+IA/y4PNw5HIPxYknELrU/wFi6VbDEhsT579XLP2TYlzmX
         vJNbN23jdGuMw==
Date:   Fri, 22 Oct 2021 10:01:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/2] phy: qcom: Introduce new eDP PHY driver
Message-ID: <YXI+uwnMEJAnDllf@matsya>
References: <20211016232128.2341395-1-bjorn.andersson@linaro.org>
 <20211016232128.2341395-2-bjorn.andersson@linaro.org>
 <YXGmJFoeXwtTvl7p@matsya>
 <YXGvOHsJ33kJVvMk@ripper>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXGvOHsJ33kJVvMk@ripper>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-10-21, 11:19, Bjorn Andersson wrote:
> On Thu 21 Oct 10:40 PDT 2021, Vinod Koul wrote:
> > On 16-10-21, 16:21, Bjorn Andersson wrote:

> > > +static int qcom_edp_configure_ssc(const struct qcom_edp *edp)
> > > +{
> > > +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
> > > +	u32 step1;
> > > +	u32 step2;
> > > +
> > > +	switch (dp_opts->link_rate) {
> > > +	case 1620:
> > > +	case 2700:
> > > +	case 8100:
> > > +		step1 = 0x45;
> > > +		step2 = 0x06;
> > > +		break;
> > 
> > line after each break please (here & few other places)
> 
> You mean an empty line between the break and the next case? That doesn't
> seem standard?

Yes that is not really a standard, but does improve readability a lot esp
when blocks are large

> > > +static int qcom_edp_dp_pixel_clk_determine_rate(struct clk_hw *hw,
> > > +						struct clk_rate_request *req)
> > > +{
> > > +	switch (req->rate) {
> > > +	case 1620000000UL / 2:
> > > +	case 2700000000UL / 2:
> > > +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
> > 
> > above rates are 1.62 and 2.7, where is 5.4 and 8.1... what am i missing?
> > 
> 
> As the comments says 2.7, 5.4 and 8.1 all has req->rate of 1350000000,
> with different dividers. But we're not allowed to "document" that by
> listing 2.7/2, 5.4/4 and 8.1/6 in the switch statement.

ok
-- 
~Vinod

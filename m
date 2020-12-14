Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF972D924C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 05:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438204AbgLNElQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Dec 2020 23:41:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:58868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727148AbgLNElQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Dec 2020 23:41:16 -0500
Date:   Mon, 14 Dec 2020 10:10:30 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607920835;
        bh=Lo6u48Day0mUO4h1+Mhp4AqyFlf4ohZTOz9CjtOwmFA=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=UkJR+Y16cxoSSnofwarCElwnxfN8ODoAh1tnzUrfssp05SRHZl7AhFkfZEudLbt5X
         TdpZhGSUWbaOjjoBBvbXyvVeIr91XdPjzXUS9gkLSpDWNyc7N/ncYKuGH+Nn0lyD/t
         U2kkbUeStLelyRiiAqcZxSqvSDCjMrfe2rgshTnJqZdNXcFBuDslE3fVLko3Jm+oed
         RpDPLK26h19Pf8g3TzjHOotff0AUYbRUCztBkCZOwoDlcHSvyghl5JSYebWSbYGLVF
         /LHkaUC9YAZhMzzvF8jW/fy3u6x2bE8fb0GWKyYP5F3X4G27dILFvfAKU81zVEANr5
         R+uxYe4i75NrA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vivek Aknurwar <viveka@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeevan Shriram <jshriram@codeaurora.org>
Subject: Re: [PATCH v2 5/5] clk: qcom: gcc: Add clock driver for SM8350
Message-ID: <20201214044030.GD8403@vkoul-mobl>
References: <20201208064702.3654324-1-vkoul@kernel.org>
 <20201208064702.3654324-6-vkoul@kernel.org>
 <160763302790.1580929.10258660966995584297@swboyd.mtv.corp.google.com>
 <20201211054349.GS8403@vkoul-mobl>
 <160767062876.1580929.14564723998233527816@swboyd.mtv.corp.google.com>
 <a6cc3d1e-4a72-63be-bf1c-5d560ecef9aa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6cc3d1e-4a72-63be-bf1c-5d560ecef9aa@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On 13-12-20, 14:00, Taniya Das wrote:
> 
> 
> On 12/11/2020 12:40 PM, Stephen Boyd wrote:
> > Quoting Vinod Koul (2020-12-10 21:43:49)
> > > On 10-12-20, 12:43, Stephen Boyd wrote:
> > > > > +static struct clk_branch gcc_camera_ahb_clk = {
> > > > > +       .halt_reg = 0x26004,
> > > > > +       .halt_check = BRANCH_HALT_DELAY,
> > > > > +       .hwcg_reg = 0x26004,
> > > > > +       .hwcg_bit = 1,
> > > > > +       .clkr = {
> > > > > +               .enable_reg = 0x26004,
> > > > > +               .enable_mask = BIT(0),
> > > > > +               .hw.init = &(struct clk_init_data){
> > > > > +                       .name = "gcc_camera_ahb_clk",
> > > > > +                       .flags = CLK_IS_CRITICAL,
> > > > 
> > > > Why is it critical? Can we just enable it in driver probe and stop
> > > > modeling it as a clk?
> > > 
> > > it does not have a parent we control, yeah it would make sense to do
> > > that. Tanya do you folks agree ..?
> > > 
> > 
> > Maybe it is needed for camera clk controller? Have to check other SoCs
> > and see if they're using it.
> > 
> 
> Yes, they would have to be left enabled.
> 
> Vinod, could you please move them to probe, similar to kona/sc7180 where all
> the CRITICALs clocks are left enabled?

Thanks for the pointer, will do

Thanks
-- 
~Vinod

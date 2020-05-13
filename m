Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE8E1D06A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 07:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgEMFvo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 01:51:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728680AbgEMFvo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 01:51:44 -0400
Received: from localhost (unknown [106.200.233.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 420BB205C9;
        Wed, 13 May 2020 05:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589349104;
        bh=JIVkHaAe6zIIWxhNRMgSqeXbtj4d7lTqShCIfC4OdH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dOCeiQC7fZb1Bsc2EtNeF8a+YfrZFN/vdFkbuJuJul/K2/x9owzSrlDpFYtKu2DAj
         MPzxKYRCcQobgTGvo/Cq0ZTxy2zdlKmOND3pMvk4txaac3Gw4NQqv8i601rVA9hx/z
         8GJwA8Sxnqas3HlDBVgfXJmkpbJp0o3PTGsc544Q=
Date:   Wed, 13 May 2020 11:21:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gcc: Add missing UFS clocks for SM8150
Message-ID: <20200513055139.GA14092@vkoul-mobl>
References: <20200424044311.2155917-1-vkoul@kernel.org>
 <20200424044311.2155917-2-vkoul@kernel.org>
 <158784189516.117437.15588556636278394035@swboyd.mtv.corp.google.com>
 <20200427045534.GB4625@vkoul-mobl.Dlink>
 <158933311835.215346.12980712108351352362@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158933311835.215346.12980712108351352362@swboyd.mtv.corp.google.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-05-20, 18:25, Stephen Boyd wrote:
> Quoting Vinod Koul (2020-04-26 21:55:34)
> > On 25-04-20, 12:11, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2020-04-23 21:43:11)
> > > > Add the missing ufs card and ufs phy clocks for SM8150. They were missed
> > > > in earlier addition of clock driver.
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > ---
> > > >  drivers/clk/qcom/gcc-sm8150.c | 84 +++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 84 insertions(+)
> > > > 
> > > > diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> > > > index 5c3dc34c955e..4354620fa12d 100644
> > > > --- a/drivers/clk/qcom/gcc-sm8150.c
> > > > +++ b/drivers/clk/qcom/gcc-sm8150.c
> > > > @@ -2881,6 +2881,45 @@ static struct clk_branch gcc_ufs_card_phy_aux_hw_ctl_clk = {
> > > >         },
> > > >  };
> > > >  
> > > > +/* external clocks so add BRANCH_HALT_SKIP */
> > > > +static struct clk_branch gcc_ufs_card_rx_symbol_0_clk = {
> > > > +       .halt_check = BRANCH_HALT_SKIP,
> > > > +       .clkr = {
> > > > +               .enable_reg = 0x7501c,
> > > > +               .enable_mask = BIT(0),
> > > > +               .hw.init = &(struct clk_init_data){
> > > > +                       .name = "gcc_ufs_card_rx_symbol_0_clk",
> > > 
> > > Any reason to not use .fw_name?
> > 
> > Did i understand it correct that you would like these to have .fw_name
> > for parent? Should we start adding these clocks in DT description?
> 
> Sorry I misread the patch. This isn't a parent name description so .name
> is correct here.

No worries, I will add fixes and send the update

Thanks
-- 
~Vinod

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A10666D4FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 04:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbjAQDaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 22:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235267AbjAQDaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 22:30:09 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8B5227A2;
        Mon, 16 Jan 2023 19:30:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E78061199;
        Tue, 17 Jan 2023 03:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8F9C433EF;
        Tue, 17 Jan 2023 03:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673926205;
        bh=eO0mkmDwMbFUXt0vlhdwRgs28RaIRkJG84u7wZGH4YA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aGzSj3ASrpnLLa7WfVIiQvVtmtlGn5btoQXt5R1vbg5IarRdPsjYS0eVXf8Tcg1ky
         D4ZSEPWOD7VpsJ31emjjCVWW/c07ziLzaxmH/I4VaIy5NzGL30Teq+RmegBYK+mnQ6
         5SyLgxyJuUeXN3D6UMHDlessnkkz2dHjwzlVvtrAusE0eDNY+MOhSIr7qr3+yjHTxE
         yZSjajAxYQ9tVcVaw/0EadxJU+so+HHB1ooqZ/xbpYIRwsix3EqJov7F0mOWmsYr+b
         mFEp2MAR3tVipVvJxAMklyIN7Xcwf/UueL92DaUzn5KP30sJX3sGTNE3tyKVFZgJ6h
         pE0kphs5fzPwQ==
Date:   Mon, 16 Jan 2023 21:30:03 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] clk: qcom: common: use parent_hws in
 _qcom_cc_register_board_clk()
Message-ID: <20230117033003.ky2i7fc2l72rhysd@builder.lan>
References: <20221228203555.3130090-1-dmitry.baryshkov@linaro.org>
 <20230111044715.5nbxasuhlqv6t2fw@builder.lan>
 <CAA8EJppzHoHp5BVBJN-ZF0OmwbtKfxhX_qTEPc5cwSnLTvTcJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppzHoHp5BVBJN-ZF0OmwbtKfxhX_qTEPc5cwSnLTvTcJQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 11, 2023 at 06:49:29AM +0200, Dmitry Baryshkov wrote:
> On Wed, 11 Jan 2023 at 06:47, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Wed, Dec 28, 2022 at 10:35:55PM +0200, Dmitry Baryshkov wrote:
> > > Switch _qcom_cc_register_board_clk() to use parent_hws.
> > >
> >
> > There's more to this patch then this short sentence, please describe it
> > further.
> 
> True, I'll fix it for v3.
> 
> >
> > And given Dan's reported-by, I must assume that there's an issue with
> > the current code. Is there a Fixes?
> 
> No. Dan reported an issue with v1, thus his Reported-by was included into v2.
> 

I though it meant "this corrects an issue that was Reported-by".

IMHO including "issues was fixed during code review after being
Reported-by" diminishing the value of this trailer - in particular since
we don't use it broadly to capture anyone else's review feedback.


PS. I'm definitely in favour of introducing a trailer to give Dan, and
others, credit for reviews.

Regards,
Bjorn

> >
> > Regards,
> > Bjorn
> >
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >
> > > Changes since v1:
> > > - Properly fix the clock's parent data in case parent clock is present
> > >   in the dtsi.
> > >
> > > ---
> > >  drivers/clk/qcom/common.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > > index 75f09e6e057e..9f2bd37c9540 100644
> > > --- a/drivers/clk/qcom/common.c
> > > +++ b/drivers/clk/qcom/common.c
> > > @@ -133,7 +133,7 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> > >       struct device_node *node = NULL;
> > >       struct device_node *clocks_node;
> > >       struct clk_fixed_factor *factor;
> > > -     struct clk_fixed_rate *fixed;
> > > +     struct clk_fixed_rate *fixed = NULL;
> > >       struct clk_init_data init_data = { };
> > >       int ret;
> > >
> > > @@ -161,6 +161,8 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> > >       of_node_put(node);
> > >
> > >       if (add_factor) {
> > > +             struct clk_parent_data parent_data;
> > > +
> > >               factor = devm_kzalloc(dev, sizeof(*factor), GFP_KERNEL);
> > >               if (!factor)
> > >                       return -EINVAL;
> > > @@ -168,8 +170,13 @@ static int _qcom_cc_register_board_clk(struct device *dev, const char *path,
> > >               factor->mult = factor->div = 1;
> > >               factor->hw.init = &init_data;
> > >
> > > +             if (fixed)
> > > +                     parent_data.hw = &fixed->hw;
> > > +             else
> > > +                     parent_data.name = path;
> > > +
> > >               init_data.name = name;
> > > -             init_data.parent_names = &path;
> > > +             init_data.parent_data = &parent_data;
> > >               init_data.num_parents = 1;
> > >               init_data.flags = 0;
> > >               init_data.ops = &clk_fixed_factor_ops;
> > > --
> > > 2.39.0
> > >
> 
> 
> 
> -- 
> With best wishes
> Dmitry

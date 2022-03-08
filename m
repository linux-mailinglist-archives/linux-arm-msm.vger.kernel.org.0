Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66ECD4D22CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:46:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237192AbiCHUrI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:47:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiCHUrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:47:07 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17172517C4
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:46:08 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id 17-20020a9d0611000000b005b251571643so252793otn.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qe1LhIMqN4RZQTRLXSERf1M5wJaST1IELaEQcXdM3sc=;
        b=OfTM6XMaCZ1v6xUfy52AIuAn5s6mb3H21MNHrTRywECDW7YvX1V7O2e++K3M8Fz9J4
         pGgEmgqr9LrE9KKqYdEoimldHsAL9bzWs/WgfmGiCXwOm9ZQ34yDKKoy+XMV6iXqiTBy
         BIWboNtqLpLrTmYfdDNlA6Z2P3pevwBShg/dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qe1LhIMqN4RZQTRLXSERf1M5wJaST1IELaEQcXdM3sc=;
        b=vsIa65YeQFakzVhy9r+4uQNkWXVMMTW9dv/b0p2ZCd7ID10JnlaQqpic4smazUUvY3
         ajKhplwhRXcKFrJpphWxFQa9XL/sgYrghwxzGom1OIr93S0vy+YumAPhqdxRadCPd5uV
         o+gvg+7UxRC1ucZkcFnlChc6v/fvXF56Q2Nebxfi94UeacgqGSdyDi1vs4FFn2uppuSB
         6OFVzRxzIMjao2sqkU19CTl8VWRCVq4JXb5+dvWxCDIwmHZYDeeVVOmf9h+Xzu1K/Rkk
         HV+bPYRYPKZIVtCcxnQSfKo+yKuYHsgS/hM+MuqvGKjbaqVG5OjAFoYFQrUpOAK8x14N
         +RAw==
X-Gm-Message-State: AOAM531jO3t/imXeYikkxm+WGkkdygrlO7QWA3lG/vat/8IAkauwbYth
        ODtoFZqTCwxmWUTn75C0ky5de7L0LcvI6B9duKJTIw==
X-Google-Smtp-Source: ABdhPJyKap0aEvvu3WyMrkRJai97vAdB/WSok0/0vs4gIlOc2OoN/D3VHoMtEGuU4iSo3yV/T2GjwnbWNRdBAkEkvEU=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr9309236otl.77.1646772367338; Tue, 08 Mar
 2022 12:46:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:46:06 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
 <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com> <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:46:06 -0800
Message-ID: <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 23:58:58)
> On Fri, 4 Mar 2022 at 07:31, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-03-03 20:23:06)
> > > On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > > > > The only clock for which we set the rate is the "stream_pixel". Rather
> > > > > than storing the rate and then setting it by looping over all the
> > > > > clocks, set the clock rate directly.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > [...]
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > index 07f6bf7e1acb..8e6361dedd77 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> > > > >         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> > > > >
> > > > >         if (num)
> > > > > -               cfg->rate = rate;
> > > > > +               clk_set_rate(cfg->clk, rate);
> > > >
> > > > This looks bad. From what I can tell we set the rate of the pixel clk
> > > > after enabling the phy and configuring it. See the order of operations
> > > > in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
> > > > is the one that eventually sets a rate through dp_power_clk_set_rate()
> > > >
> > > >         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
> > > >                                         ctrl->link->link_params.rate * 1000);
> > > >
> > > >         phy_configure(phy, &dp_io->phy_opts);
> > > >         phy_power_on(phy);
> > > >
> > > >         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
> > >
> > > This code has been changed in the previous patch.
> > >
> > > Let's get back a bit.
> > > Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
> > > just stores the rate in the config so that later the sequence of
> > > dp_power_clk_enable() -> dp_power_clk_set_rate() ->
> > > [dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
> > > msm_dss_clk_set_rate() -> clk_set_rate()] will use that.
> > >
> > > There are only two users of dp_ctrl_set_clock_rate():
> > > - dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
> > >   This case is handled in the patch 1 from this series. It makes
> >
> > Patch 1 form this series says DP is unaffected. Huh?
> >
> > > dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
> > > without storing (!) the rate in the config, calling
> > > phy_configure()/phy_power_on() and then setting the opp via the
> > > sequence of calls specified above
>
> Note, this handles the "ctrl_link" clock.
>
> > >
> > > - dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
> > > immediately afterwards. This call would set the stream_pixel rate
> > > while enabling stream clocks. As far as I can see, the stream_pixel is
> > > the only stream clock. So this patch sets the clock rate without
> > > storing in the interim configuration data.
> > >
> > > Could you please clarify, what exactly looks bad to you?
> > >
>
> Note, this handles the "stream_pixel" clock.
>
> >
> > I'm concerned about the order of operations changing between the
> > phy being powered on and the pixel clk frequency being set. From what I
> > recall the pixel clk rate operations depend on the phy frequency being
> > set (which is done through phy_configure?) so if we call clk_set_rate()
> > on the pixel clk before the phy is set then the clk frequency will be
> > calculated badly and probably be incorrect.
>
> But the order of operations is mostly unchanged. The only major change
> is that the opp point is now set before calling the
> phy_configure()/phy_power_on()

Yes that's my concern. The qmp phy driver has a couple clk_set_rate()
calls in the .configure_dp_phy callback. That is called from
phy_power_on() (see qcom_qmp_phy_power_on() and qcom_qmp_phy_dp_ops).
Looking at qcom_qmp_v3_phy_configure_dp_phy() it does

        clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
        clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);

and I believe the child of dp_pixel_hw is find_clock("stream_pixel").
Looks like that is DISP_CC_MDSS_DP_PIXEL_CLK which is
disp_cc_mdss_dp_pixel_clk_src for the rate settable part. That has
clk_dp_ops which is clk_rcg2_dp_set_rate() for the set rate part. That
wants the parent clk frequency to be something non-zero to use in
rational_best_approximation(). If the clk_set_rate("stream_pixel") call
is made before phy_power_on() then the parent_rate in
clk_rcg2_dp_set_rate() won't be valid and the pixel clk frequency will
be wrong.

>
> For the pixel clock the driver has:
> static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
> {
>         int ret = 0;
>
>         dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
>                                         ctrl->dp_ctrl.pixel_rate * 1000);
>
>         ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
> [skipped the error handling]
> }
>
> dp_power_clk_enable() doesn't have any special handlers for the the
> DP_STREAM_PM,
> so this code would be equivalent to the following pseudo code (given
> that there is only one stream clock):
>
> unsigned int rate = ctrl->dp_ctrl.pixel_rate * 1000;
>
> /* dp_ctrl_set_clock_rate() */
> cfg = find_clock_cfg("stream_pixel");
> cfg->rate = rate;
>
> /* dp_power_clk_enable() */
> clk = find_clock("stream_pixel")
> clk_set_rate(clk, cfg->rate);
> clk_prepare_enable(clk);
>
> The proposed patch does exactly this.
>
> Please correct me if I'm wrong.
>

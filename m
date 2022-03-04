Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3A84CCF6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 08:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbiCDH77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 02:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239031AbiCDH76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 02:59:58 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A421405F1
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 23:59:10 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id f21so5856620qke.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 23:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hvu/peVgD6fJaER9RWxznT70/W3U9QttCqf/QNoHRDU=;
        b=tTi/8bkntcVU6In/S1Pb/OP73F5xC2e/EjBVnV4h4GAuomqZ5xcM5uJeJ/C4++58Ci
         bBdFyS5ex60SImaTHtJIigr3AEXyaTqwJo0bTaj636s4AvFEJfxWMvfI48NmXxsrDDct
         i9BtADuo9Lf0wq+cIFRmkiY04O/Uhc2YZR/zyey0NBHyep3+dl3r/6PcvBZXp1juLjQn
         /mQXuTqL3aAX5mpLU5gZKPMnLcXv5BuET/NC9JvU5hK9i/PG2IlZaHKJmE0siLitDxOf
         0hu2LgldPy4SpUbsXi/mdPM6Cwwyz6/SYcqLjb4j/smxrezGToWkXU8dSSosl45EACpx
         t4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hvu/peVgD6fJaER9RWxznT70/W3U9QttCqf/QNoHRDU=;
        b=IvX3sLz4u1GxXk5ZLKJgsSg+DwjkMnCj07HIdBrqf6gV4Q2ew3RYs0b64f5zEJr7qk
         NPcMjZ0ZsZgFDvNwU/NyThWFtvu5l85vt3RskUoxFGJzjUIfHcfKoeGHn3dFZeFqmmKK
         rh56fJHYGXgUwt1f7R1mT3iEV+7roAFc9rtPrpolxS0DqvTBR2J5FxOPrevqs4hf+EFc
         JoZipamtOqiBCU3QF6A1rqvcbwkZcdGZgYT8Z1+87rWxD4fELftxoGjf4MUnN1NH/iYU
         TW3xENhDInhDcJ0TOqJJL+ximkvGOzJEdf8WQNhMgwpHhiWVUv+iUlM+UesFKJA8zq28
         GSPQ==
X-Gm-Message-State: AOAM533zJEdm7sVQzOf/oxZ0wy52a3H7Va0OoQe15rGNoEPlUhZ2FlcF
        GzbAb8DBqBhTwG33IBdi7ou8kZLsfsJo2ChzZHe4nA==
X-Google-Smtp-Source: ABdhPJxGpg//Qbn9sDTSA/IIrc+b7rNBDFwK+45t1tYmJLD5x9yvJUEuvKNe+/DlkgM6bbD29W3ZS2Jp3rXEzt506ic=
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr1838413qko.203.1646380749414; Thu, 03
 Mar 2022 23:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com> <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
In-Reply-To: <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Mar 2022 10:58:58 +0300
Message-ID: <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Mar 2022 at 07:31, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-03-03 20:23:06)
> > On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > > > The only clock for which we set the rate is the "stream_pixel". Rather
> > > > than storing the rate and then setting it by looping over all the
> > > > clocks, set the clock rate directly.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [...]
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > index 07f6bf7e1acb..8e6361dedd77 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> > > >         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> > > >
> > > >         if (num)
> > > > -               cfg->rate = rate;
> > > > +               clk_set_rate(cfg->clk, rate);
> > >
> > > This looks bad. From what I can tell we set the rate of the pixel clk
> > > after enabling the phy and configuring it. See the order of operations
> > > in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
> > > is the one that eventually sets a rate through dp_power_clk_set_rate()
> > >
> > >         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
> > >                                         ctrl->link->link_params.rate * 1000);
> > >
> > >         phy_configure(phy, &dp_io->phy_opts);
> > >         phy_power_on(phy);
> > >
> > >         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
> >
> > This code has been changed in the previous patch.
> >
> > Let's get back a bit.
> > Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
> > just stores the rate in the config so that later the sequence of
> > dp_power_clk_enable() -> dp_power_clk_set_rate() ->
> > [dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
> > msm_dss_clk_set_rate() -> clk_set_rate()] will use that.
> >
> > There are only two users of dp_ctrl_set_clock_rate():
> > - dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
> >   This case is handled in the patch 1 from this series. It makes
>
> Patch 1 form this series says DP is unaffected. Huh?
>
> > dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
> > without storing (!) the rate in the config, calling
> > phy_configure()/phy_power_on() and then setting the opp via the
> > sequence of calls specified above

Note, this handles the "ctrl_link" clock.

> >
> > - dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
> > immediately afterwards. This call would set the stream_pixel rate
> > while enabling stream clocks. As far as I can see, the stream_pixel is
> > the only stream clock. So this patch sets the clock rate without
> > storing in the interim configuration data.
> >
> > Could you please clarify, what exactly looks bad to you?
> >

Note, this handles the "stream_pixel" clock.

>
> I'm concerned about the order of operations changing between the
> phy being powered on and the pixel clk frequency being set. From what I
> recall the pixel clk rate operations depend on the phy frequency being
> set (which is done through phy_configure?) so if we call clk_set_rate()
> on the pixel clk before the phy is set then the clk frequency will be
> calculated badly and probably be incorrect.

But the order of operations is mostly unchanged. The only major change
is that the opp point is now set before calling the
phy_configure()/phy_power_on()

For the pixel clock the driver has:
static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
{
        int ret = 0;

        dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
                                        ctrl->dp_ctrl.pixel_rate * 1000);

        ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
[skipped the error handling]
}

dp_power_clk_enable() doesn't have any special handlers for the the
DP_STREAM_PM,
so this code would be equivalent to the following pseudo code (given
that there is only one stream clock):

unsigned int rate = ctrl->dp_ctrl.pixel_rate * 1000;

/* dp_ctrl_set_clock_rate() */
cfg = find_clock_cfg("stream_pixel");
cfg->rate = rate;

/* dp_power_clk_enable() */
clk = find_clock("stream_pixel")
clk_set_rate(clk, cfg->rate);
clk_prepare_enable(clk);

The proposed patch does exactly this.

Please correct me if I'm wrong.

-- 
With best wishes
Dmitry

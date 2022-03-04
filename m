Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F704CCC90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 05:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbiCDEcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 23:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiCDEcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 23:32:12 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB9A1795DA
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 20:31:24 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id s1-20020a056830148100b005acfdcb1f4bso6494930otq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 20:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=VMg0DkOqrHHMOTtJZibBEpv0iO6yFOEjb6DfQ7mlfkk=;
        b=JRkXP7k0i1FaR9s1p+gu3tJzt1LDEtX99RvbN2Wll12w9xfarBzEoaxNLTVbnrpooO
         7mf+CbpNZ9G+2Ok0xJ3cj2UYgERfDo9M17nOSrrk3I562/LS9hLz9Gm1dxuMuaJ54iOm
         JY4qZPxWa1IalCncPG1abhR1/fM64XEmc6uhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=VMg0DkOqrHHMOTtJZibBEpv0iO6yFOEjb6DfQ7mlfkk=;
        b=SokrdNCm4loKJd7JbCg/nYid5jtUbYEJJ7AAuPfa3tj/F1K1UxDh4SShOSniN4qqLo
         5fhbN2FkOmZjLTGOc+JVY8wgFakHK7S0aABGv0fU4n9yahd9s8WhYkZuUFJygCw5JQ0f
         3onwhWX1JXSTwGhk4CCZENrGypX1vojjMe88CXyYwGUvnCgsQ3TdyPh5FExQHuGWXYjm
         Ucmjf4CDWsBj2yEZP1vnqnaP2xYA2tjTdwGVGJ5Yau06/yFQZN+240oIKpo9SFq2ee4a
         c/mwxJZD48BUdPEzsG33krMkTOg9hgQPWbg1MZ4AeAXRxyEH/TEy4tvZLq5eiuIcPRhg
         sj4A==
X-Gm-Message-State: AOAM531jRWA4aDc9NEzACd9cThYXagnBGok34j9pIMAANeNE1nYxJmh9
        ggZITLdMDkh+jyG2gVL8sZBXHvwSzO2VoANeQl8G5Q==
X-Google-Smtp-Source: ABdhPJzzgT92LrK9VaC2u5RzKzK136irtUiGnsoPxZLKz+wfs8AcsdeiJgxZ+t5E7BjKtRxSAhczoP8MXv0HMFKbT0E=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr21487490otl.77.1646368284197; Thu, 03
 Mar 2022 20:31:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 20:31:23 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 20:31:23 -0800
Message-ID: <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 20:23:06)
> On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > > The only clock for which we set the rate is the "stream_pixel". Rather
> > > than storing the rate and then setting it by looping over all the
> > > clocks, set the clock rate directly.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [...]
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 07f6bf7e1acb..8e6361dedd77 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> > >         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> > >
> > >         if (num)
> > > -               cfg->rate = rate;
> > > +               clk_set_rate(cfg->clk, rate);
> >
> > This looks bad. From what I can tell we set the rate of the pixel clk
> > after enabling the phy and configuring it. See the order of operations
> > in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
> > is the one that eventually sets a rate through dp_power_clk_set_rate()
> >
> >         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
> >                                         ctrl->link->link_params.rate * 1000);
> >
> >         phy_configure(phy, &dp_io->phy_opts);
> >         phy_power_on(phy);
> >
> >         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
>
> This code has been changed in the previous patch.
>
> Let's get back a bit.
> Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
> just stores the rate in the config so that later the sequence of
> dp_power_clk_enable() -> dp_power_clk_set_rate() ->
> [dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
> msm_dss_clk_set_rate() -> clk_set_rate()] will use that.
>
> There are only two users of dp_ctrl_set_clock_rate():
> - dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
>   This case is handled in the patch 1 from this series. It makes

Patch 1 form this series says DP is unaffected. Huh?

> dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
> without storing (!) the rate in the config, calling
> phy_configure()/phy_power_on() and then setting the opp via the
> sequence of calls specified above
>
> - dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
> immediately afterwards. This call would set the stream_pixel rate
> while enabling stream clocks. As far as I can see, the stream_pixel is
> the only stream clock. So this patch sets the clock rate without
> storing in the interim configuration data.
>
> Could you please clarify, what exactly looks bad to you?
>

I'm concerned about the order of operations changing between the
phy being powered on and the pixel clk frequency being set. From what I
recall the pixel clk rate operations depend on the phy frequency being
set (which is done through phy_configure?) so if we call clk_set_rate()
on the pixel clk before the phy is set then the clk frequency will be
calculated badly and probably be incorrect.

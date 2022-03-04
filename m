Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3A074CCC84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 05:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235475AbiCDEYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 23:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbiCDEYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 23:24:07 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2116BF531
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 20:23:18 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id t28so6483340qtc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 20:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsDOb5W4kO2pCN7e4bMOr2XwyKC2uG4Nui8/giIgSNQ=;
        b=m5Yc0RyCI7mI1MlnkM1Oafg7bBKegJFMtTwz3Ty0ouBFdfngkF9DFgZWyJJC5su10X
         96VnRyyLJBey9+Fnz5l1HjmlzZx0QZxr+j4odF8gvhLHQeP7pf6uIeXndb2rvHu9Obc9
         iPR/0+d/C9qs4bAzqKIFXE0n9BFhMm4tslS3jRmL4RhzsxAE9zEOd7a/7/LRaMgcphkC
         zjXPIhLI1WbAyVtW6VeFBkDHNsnqUtpHcyzJdrfg3r0CBfP8IX6kGm7Z8z+Yus8Sk2c5
         cWLoqqaRyUNb1FNksSXShVGh/OXDbT0IiGNw5I0DdC2XzKx/F3XZaWRTNU6w61/dSAfB
         8pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsDOb5W4kO2pCN7e4bMOr2XwyKC2uG4Nui8/giIgSNQ=;
        b=fZX2x0mki7TjXudUeE/9VKV4AI4gE7uj/jqFYKDJqw2ap4Aa4Um4ALaVmdXTdN0e9o
         OYxlNVQXeBu1TGj9EzaRCy+sdxIpNvbmM3nDGrXEx2vyKRUVEXL7a+xPFtyQs06Akuvc
         fiTdHA4ZMn+iRj/05UBezW7Pp5BayG979kPnE88dR6QgVxWVQ5xPuXns1tvri2itejaN
         wbX4dSdsJSS/91VQJow94iEl46JR1qaejPZzOUtAUC29YzqU0RWN0zNlF/780HjtYBss
         1asxFPRjW67h3cM7fbfrVnemJrIBiJN1KXAhmYiQ/q7KPFWYXrC2GZ4guPqPs9tYHO3E
         cbPA==
X-Gm-Message-State: AOAM531E+CcBw+fmsiRjJmLzpwM0FBUl9f9lckDeDgOxasv6JJ6D+JJz
        YYyGaKc3PwYPnEyCNnDbQpBe0hiCI38DXX5XLGiWMw==
X-Google-Smtp-Source: ABdhPJw4wxEbildbq7sVeR+eNwjQkYAVA22pw3J8WfvviBTFny8uWbj3UqZfX96fC8ABiY9RoSl0kH8G/ieeIOvV1V0=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr29662425qtw.682.1646367797855; Thu, 03
 Mar 2022 20:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org> <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
In-Reply-To: <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Mar 2022 07:23:06 +0300
Message-ID: <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
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

On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > The only clock for which we set the rate is the "stream_pixel". Rather
> > than storing the rate and then setting it by looping over all the
> > clocks, set the clock rate directly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [...]
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index 07f6bf7e1acb..8e6361dedd77 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> >         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> >
> >         if (num)
> > -               cfg->rate = rate;
> > +               clk_set_rate(cfg->clk, rate);
>
> This looks bad. From what I can tell we set the rate of the pixel clk
> after enabling the phy and configuring it. See the order of operations
> in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
> is the one that eventually sets a rate through dp_power_clk_set_rate()
>
>         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
>                                         ctrl->link->link_params.rate * 1000);
>
>         phy_configure(phy, &dp_io->phy_opts);
>         phy_power_on(phy);
>
>         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);

This code has been changed in the previous patch.

Let's get back a bit.
Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
just stores the rate in the config so that later the sequence of
dp_power_clk_enable() -> dp_power_clk_set_rate() ->
[dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
msm_dss_clk_set_rate() -> clk_set_rate()] will use that.

There are only two users of dp_ctrl_set_clock_rate():
- dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
  This case is handled in the patch 1 from this series. It makes
dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
without storing (!) the rate in the config, calling
phy_configure()/phy_power_on() and then setting the opp via the
sequence of calls specified above

- dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
immediately afterwards. This call would set the stream_pixel rate
while enabling stream clocks. As far as I can see, the stream_pixel is
the only stream clock. So this patch sets the clock rate without
storing in the interim configuration data.

Could you please clarify, what exactly looks bad to you?

> and I vaguely recall that the DP phy needs to be configured for some
> frequency so that the pixel clk can use it when determining the rate to
> set.
>
> >         else
> >                 DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
> >                                 name, rate);



-- 
With best wishes
Dmitry

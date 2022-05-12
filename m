Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75C03525783
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 00:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359028AbiELWCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 18:02:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359020AbiELWCP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 18:02:15 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21072644E7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 15:02:14 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l18so12782226ejc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrcFnQX5TKrAaSWz2egEofhfAACl36nsw6XjrjYC63Y=;
        b=kUdCvWoKFKqd2DECKwKOUZZMOgwaUIBR0oNZV8k8LmwvpiRlxUhX8z349mWXSeUHwj
         U4QWNVYNXSoHe9D558M7yqKGsIQauYAzEZN7Wp2Akwgc2KAhac4TMyRegvJFqPDEU7c/
         rtc2WhmiJ0UCk0/Vh46m3OKqFsqaYreMiLm1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrcFnQX5TKrAaSWz2egEofhfAACl36nsw6XjrjYC63Y=;
        b=BZXHTLWiyNe5oScvtvXi/La2WmbwZ8UksNYGSAOCN9yLVwbX++lYqTjdf0t8+L4Xe1
         PAkMQ0k1orwOYtZhcA5r3AIgOkQu7eXVdQSRth+j3rXFVXxLx28QP64b0AllDjqVwNX3
         64zhplbgvHAswvgH4TWsOgFQfbJiS1IUKHXuZuaxqVfdb3CA4dV/WAvit8JG/LsjOUg2
         eRGf4d1YjSSH/pKv5UBpgAK3lf7QRe7x5xQ0YMSfUuL1EObFX5FzMApqVeh5KX9Z0uKN
         UhUTVXhciKSn65H3iBXS9QPtqKeI24QiQqNlfSDtIqSobDQMLiE1HV+XP21+KrePK4re
         CpRg==
X-Gm-Message-State: AOAM530+r5uB2Wn7Xrxg5L7pPTERgNlIEKzdHvOUwf/p4niTwOqY0J98
        k0qIrCvXVde3TuI6kTy5BUCbg2/P2PHdH8xw
X-Google-Smtp-Source: ABdhPJyBPUiWIwAmfT0nOjdBFfWJ1anB6XBS8jMxP2wGfwcvdupGrWeSFcT8+rY2ZJdNxzUbszh2WA==
X-Received: by 2002:a17:907:86a0:b0:6f4:fc1f:30d9 with SMTP id qa32-20020a17090786a000b006f4fc1f30d9mr1679475ejc.708.1652392932415;
        Thu, 12 May 2022 15:02:12 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709070b0500b006f3ef214e06sm154694ejl.108.2022.05.12.15.02.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 15:02:11 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id k126-20020a1ca184000000b003943fd07180so3765477wme.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 15:02:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr12055524wmb.29.1652392930664; Thu, 12
 May 2022 15:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
 <e8d75148-22ee-5809-fc65-d0fb38ad4876@linaro.org>
In-Reply-To: <e8d75148-22ee-5809-fc65-d0fb38ad4876@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 12 May 2022 15:01:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhTuhOOjG15S=bXQBq1UAskr2s5fubsD4xvnp589-8_Q@mail.gmail.com>
Message-ID: <CAD=FV=UhTuhOOjG15S=bXQBq1UAskr2s5fubsD4xvnp589-8_Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dsi: only powerup at modeset time if
 "early_poweron" modparam
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 12, 2022 at 1:59 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/05/2022 23:52, Douglas Anderson wrote:
> > Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
> > chip to fail to turn the display back on after it turns off.
> >
> > Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
> > handle the new power sequence. The Linux driver has almost nothing in
> > it and most of the logic for this bridge chip is in black-box firmware
> > that the bridge chip uses.
> >
> > Also unfortunately, reverting the patch will break "tc358762".
> >
> > The long term solution here is probably Dave Stevenson's series [1]
> > that would give more flexibility. However, that is likely not a quick
> > fix.
> >
> > For the short term, let's introduce a module parameter that selects
> > between the two behaviors. This is a short term hack but at least can
> > keep both users working. We'll default the value of the module
> > parameter to the old behavior. Given that the old behavior has existed
> > for longer it's probably a safer default.
> >
> > [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
> >
> > Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Two minor issues below.

I only saw one, so hopefully I didn't miss another request. ;-)


> > ---
> >
> > Changes in v3:
> > - No longer a revert; now a module parameter.
> >
> > Changes in v2:
> > - Remove the mud from my face.
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index 50b987658b1f..2bf4123ef5df 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -34,6 +34,10 @@ static struct msm_dsi_manager msm_dsim_glb;
> >   #define IS_SYNC_NEEDED()    (msm_dsim_glb.is_sync_needed)
> >   #define IS_MASTER_DSI_LINK(id)      (msm_dsim_glb.master_dsi_link_id == id)
> >
> > +bool early_poweron;
> > +MODULE_PARM_DESC(early_poweron, "Power DSI controller early");
> > +module_param(early_poweron, bool, 0600);
>
> Nit: dsi_early_poweron (to be clear that it related to DSI only).
>
> I thought about suggesting 'dsi_no_early_poweron' instead to catch
> possible issues with other bridges. But... I think with Dave's series
> will have to enable bridges one by one, so it doesn't make real sense.

I made the change you requested and was about to send out a v4 when
offline Rob pointed out a better way that seems to work. I can use the
`compatible` of the next bridge. I've sent out v4 as per Rob's
suggestion:

https://lore.kernel.org/r/20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid

-Doug

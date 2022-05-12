Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C835241C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 03:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344058AbiELBBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 21:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245021AbiELBB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 21:01:28 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8F96E8E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:01:27 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id q8so4675161oif.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KkHNoGFNmm+2/TYi6ZuGQ2Cbch/NU3jA999yYTZ1GdU=;
        b=fYzBOmi9dwJ7uhGEEQdetvr/2AFRci4EDkcJ+KZ4B+gSnT+cHk2Pm1pkhFjrbcB3T+
         Y3opASV6+Ne+20FH4mpSkUXkQ4JlhKHQ6tUP4ApIu4HTBcUpCECgW42lJVCLg5d2CEkY
         dC0JUR0cHaatNLxem1o/Mcjv/tb6OqUIYZSeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KkHNoGFNmm+2/TYi6ZuGQ2Cbch/NU3jA999yYTZ1GdU=;
        b=5Pb2wiam0dCZuhWjFryXgRbYFt8swUeskrRNzGIa0DLTrblR32X6d8xW15uVGDWdw3
         lPYERCdYfRKTM+pM0XH8h7QdznKyHrr1zq4L6Z8I7mF3lWojAzYDh1wsuPSSKO29bDPz
         5qMlAwIsdEIY8deB8iNTmtyG9ZrRp/SAdQKD+1pE/rfdaIBbeZ5n+cmnXxUSA6cRWKhm
         UXchmogGtyrgVCLT6D+isrMZ42vi/RZbcbyzp3sWgW7eLp5eGkpx/bry4sM91EEdUhMq
         Uu0/jkCotfPMF2BbB3c4nadZMRAi2k141J6r1HHSKm/cBwON7uipt08JeDrxBvn1/57v
         +GDQ==
X-Gm-Message-State: AOAM533tfDnajnH1n7ySrs6qU1QUBeG+nh7JgNZ4+f3Eb65PBs0ITq8t
        8v+gzNtdu8S5c4ANQQiujwnZ8fc4NkY1S7m7RY6p3Q==
X-Google-Smtp-Source: ABdhPJyZyRcSyf1WMpHlbuM6TXip4xUs8zue+4HQsI+8TZq/afqmiMvK4becdP3jyYz88janNmHmpTvQeobO71GUPzw=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr3957420oib.63.1652317286569; Wed, 11
 May 2022 18:01:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:01:26 -0700
MIME-Version: 1.0
In-Reply-To: <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
References: <1652313768-16286-1-git-send-email-quic_khsieh@quicinc.com> <e5c16697-5919-bafa-4ec5-294c94d7a740@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 18:01:26 -0700
Message-ID: <CAE-0n53zHrczQAOWM5f_tafUVJxg7JU2NuC4sGcBZddwKr-dGA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-11 17:41:50)
> On 12/05/2022 03:02, Kuogee Hsieh wrote:
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index af7a80c..f3e333e 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
> >
> >       dp_catalog_ctrl_reset(ctrl->catalog);
> >
> > -     if (enable)
> > -             dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> > +     /*
> > +      * all dp controller programmable registers will not
> > +      * be reset to default value after DP_SW_RESET
> > +      * therefore interrupt mask bits have to be updated
> > +      * to enable/disable interrupts
> > +      */
> > +     dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> >   }
> >
> >   void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index c388323..79439b8 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -98,6 +98,8 @@ struct dp_display_private {
> >       struct dp_ctrl    *ctrl;
> >       struct dp_debug   *debug;
> >
> > +     atomic_t suspended;
>
> I think it'd be better to protect it with event_lock rather than using
> atomics.

Agreed. I think the concern is that the event queue will have "stuff" in
it. If the event queue was all a threaded irq we could simply call
synchronize_irq() after disabling the irq bit in the DP hardware and
then we would know it is safe to power down the DP logic. Unfortunately
the event queue is a kthread so we can't do that and we have to rewrite
synchronize_irq() by checking that the event queue is empty and waiting
for it to empty out otherwise. It's not safe enough to simply do the
power operations underneath the event_lock because there's a queue in
the kthread that might be waiting to grab the event_lock to process.

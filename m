Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2A650A6BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 19:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbiDURPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 13:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381189AbiDURPQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 13:15:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7F049F16
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:12:24 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id g20so7361699edw.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2MPNpuQIn58xclaII7JLtz3726FMV8Uc3tMH6h6B8NI=;
        b=bBNfsfaX5+t397nY8krJ6rOY+BwUEqeZAxmKxALGPGTEvqP18XUnW+RBq+8533S2Cx
         4EV8TOqeVZ6InzOy+Clk6PoZZcP733fPrCreUdVWX5hsQ86zskl7VuVo459prXNFybb1
         Cgr3GdH/n45QIxV4RqjZzyZdx/NuBOURr5Vwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2MPNpuQIn58xclaII7JLtz3726FMV8Uc3tMH6h6B8NI=;
        b=0jqSDS7CCl08QL1NPbIZbAY1pMW25XSRUZHP8MsQ1+qp3/n3c0V07uj2u22RgB7Qc+
         VhKd6pxMkVraYcNaughCVJhuVoueUJzx3UtRwawAWyGKMnb5HdyUpcQj1WmHjnbDKdse
         igQq97q7SLRKFIhZM7Qa0iwekjTG7tpd0YlIA8dW1xZZizImcI3U/dteyO0VVBxsrTnh
         xFZBzDS7f/ilF2Sa8mQL/DYvrABQnTMCWXBEqlbs+MkCiZD0RBMYO53avZhs6j+Sb0fd
         76xYdOpRuRV9hHQjZs5uFY587OIasuLR8zIZyj8s6RwplGxuN+4R2gLzqfxJHLHRcUqu
         dqRw==
X-Gm-Message-State: AOAM5300C3FkB2igj8vY/sdySp0uGzOObuiPpEE+1A7AqKfeFcULtHYj
        j5L0iPsD249u8HTpY0z2SeATCtwvvYtrKDU7d4Q=
X-Google-Smtp-Source: ABdhPJyXyQZEmOK09RNjBczKg7T4swX236/rix4xYgdZGYXJ2frKfY3Nc4lG6S6InCADrM0c31nOeQ==
X-Received: by 2002:a05:6402:2204:b0:423:d925:7778 with SMTP id cq4-20020a056402220400b00423d9257778mr536519edb.321.1650561143110;
        Thu, 21 Apr 2022 10:12:23 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id ec40-20020a0564020d6800b00420916b32c9sm12024701edb.59.2022.04.21.10.12.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 10:12:22 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id r187-20020a1c44c4000000b0038ccb70e239so6300188wma.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 10:12:22 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr9600453wmq.34.1650561141633; Thu, 21 Apr
 2022 10:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <1650551811-24319-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650551811-24319-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=UVmUG0t-8wFXT-NT1-naojeJ_gcd8eEVr96AnMos0m4A@mail.gmail.com> <MW4PR02MB71869CCA50E1706926C4B6FAE1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB71869CCA50E1706926C4B6FAE1F49@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Apr 2022 10:12:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcqaESoZTU1_FBzZ3XGFmoKwmdm_zaAw7QEtc51wcewQ@mail.gmail.com>
Message-ID: <CAD=FV=WcqaESoZTU1_FBzZ3XGFmoKwmdm_zaAw7QEtc51wcewQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 21, 2022 at 9:39 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Doug,
>
> >On Thu, Apr 21, 2022 at 7:37 AM Sankeerth Billakanti
> ><quic_sbillaka@quicinc.com> wrote:
> >>
> >> The panel-edp enables the eDP panel power during probe, get_modes and
> >> pre-enable. The eDP connect and disconnect interrupts for the eDP/DP
> >> controller are directly dependent on panel power. As eDP display can
> >> be assumed as always connected, the controller driver can skip the eDP
> >> connect and disconnect interrupts. Any disruption in the link status
> >> will be indicated via the IRQ_HPD interrupts.
> >>
> >> So, the eDP controller driver can just enable the IRQ_HPD and replug
> >> interrupts. The DP controller driver still needs to enable all the
> >> interrupts.
> >>
> >> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> >> ---
> >> Changes in v8:
> >>   - add comment explaining the interrupt status return
> >>
> >> Changes in v7:
> >>   - reordered the patch in the series
> >>   - modified the return statement for isr
> >>   - connector check modified to just check for eDP
> >>
> >>  drivers/gpu/drm/msm/dp/dp_catalog.c | 18 ++++++++++++------
> >> drivers/gpu/drm/msm/dp/dp_display.c | 22 +++++++++++++++++++++-
> >>  2 files changed, 33 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index fac815f..3a298e9 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -569,10 +569,6 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog
> >> *dp_catalog)
> >>
> >>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
> >>
> >> -       /* enable HPD plug and unplug interrupts */
> >> -       dp_catalog_hpd_config_intr(dp_catalog,
> >> -               DP_DP_HPD_PLUG_INT_MASK |
> >DP_DP_HPD_UNPLUG_INT_MASK, true);
> >> -
> >>         /* Configure REFTIMER and enable it */
> >>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
> >>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer); @@
> >> -599,13 +595,23 @@ u32 dp_catalog_hpd_get_intr_status(struct
> >> dp_catalog *dp_catalog)  {
> >>         struct dp_catalog_private *catalog = container_of(dp_catalog,
> >>                                 struct dp_catalog_private, dp_catalog);
> >> -       int isr = 0;
> >> +       int isr, mask;
> >>
> >>         isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
> >>         dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
> >>                                  (isr & DP_DP_HPD_INT_MASK));
> >> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
> >>
> >> -       return isr;
> >> +       /*
> >> +        * REG_DP_DP_HPD_INT_STATUS reports the status of all interrupts
> >> +        * irrespective of their masked status. The HW interrupt will not be
> >> +        * generated if an interrupt is masked. However, the interrupt status
> >> +        * bit in the register will still be set. The eDP controller driver
> >> +        * masks the plug and unplug interrupts unlike DP controller which
> >> +        * unmasks all the interrupts. So, do not report the status of the
> >> +        * masked interrupts.
> >> +        */
> >> +       return isr & (mask | ~DP_DP_HPD_INT_MASK);
> >
> >What's still missing in your comments is why you aren't just doing "return isr &
> >mask;". In other words, why is the API for HPD bits different from the API for
> >non-HPD bits? What code out there wants to know about non-HPD interrupts
> >even if they are masked?
>
> The mask register bitfields are different from the INT_STATUS register.
> The INT_STATUS register has additional bits [31:28] which indicates the HPD state machine
> status and [3:0] indicates the actual generated/set interrupt. The fields [3:0] are similar to
> the mask and ack interrupts.
>
> #define DP_DP_HPD_STATE_STATUS_CONNECTED        (0x40000000)
> #define DP_DP_HPD_STATE_STATUS_PENDING          (0x20000000)
> #define DP_DP_HPD_STATE_STATUS_DISCONNECTED     (0x00000000)
> #define DP_DP_HPD_STATE_STATUS_MASK             (0xE0000000)
>
> So, earlier I returned isr & (mask | DP_DP_HPD_STATE_STATUS_MASK);
>
> Actually, there is no reason to do this. We can just do the below:
> return isr & mask;
>
> >
> >Actually, thinking about this more, my preference would be this:
> >
> >a) Rename the existing function to dp_catalog_hpd_get_intr_status_raw()
> >
> >b) Create a new function called dp_catalog_hpd_get_intr_status() whose
> >implementation is:
> >
> >  return dp_catalog_hpd_get_intr_status_raw() & mask;
> >
> >Then any callers who care about the raw status can be changed to call
> >dp_catalog_hpd_get_intr_status_raw(). If no callers need
> >dp_catalog_hpd_get_intr_status_raw() then you don't actually need to
> >create this function.
> >
>
> There is no caller for raw status. All interrupts are unmasked for DP.
> While handling the aux interrupts generated during the transfer call from panel probe,
> we read that the HPD interrupt status [3:0] bit0 is set and proceed to handle connect like DP.
> We experimented to find out that the connect interrupt is not generated but just the status
> bit is set.
>
> As the interrupts are generated over a single MDSS line, the controller driver has to read all the
> interrupt status registers and handle all the set interrupt bits. So, while handling aux transfer
> interrupts, we were proceeding to handle connect interrupt also as a consequence.

Ah, I see. There aren't other _interrupts_ in this register. There's
just other status info that someone jammed into this register. Got it.

So with this comment I'm happy with my Reviewed-by:

/*
 * We only want to return interrupts that are unmasked to the caller.
 * However, the interrupt status field also contains other
 * informational bits about the HPD state status, so we only mask
 * out the part of the register that tells us about which interrupts
 * are pending.
 */

-Doug

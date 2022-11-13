Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66CCD626FB7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Nov 2022 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbiKMN2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Nov 2022 08:28:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbiKMN2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Nov 2022 08:28:37 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C261086
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Nov 2022 05:28:34 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-367b8adf788so83714437b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Nov 2022 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RBRObaACq4skoaxVBrtZ8v0pRx/dpMfq/nTCZQT1EHw=;
        b=VDVypVr2NsABEUCO9Cj6h0vr/oZ1XbPzamFb8IxL8D+6CoUairk26NtyP6QzbbxX+e
         VdZTX7UXqnsgeqSPb/WvaNYDVRUL13ZXpU9K5J+1/u2vv7aYyRZpk/5nTCoIAVCN2Plx
         riQN8+haehHwRzcRBIUuyv/3WDKweKIUVAvFxie/6POJBP9YNHk4I7/VztlXUew0DhpT
         fzerrqtrkdY8oyOOpGoH3mMJy2SMWc+IPGFBNaRU28FR64AGGi3twcm+2kmT1IwB9Bz/
         dbMclVr/Hm77ubm3BlLJa0wzjpFThvPjZczK97kfxtu1weYiryhFjWX+1wd8XYaCd4kC
         +zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBRObaACq4skoaxVBrtZ8v0pRx/dpMfq/nTCZQT1EHw=;
        b=oY8SSsboXw+7icAnQv15ShpokAMlzARKdWzfYxEu74PMWge+IhiSFbGuUJvEgA3JtA
         m1ZoYwInhlMjJYOLdHW/r2fqiSBtwRIfEU4xF2eo8rnHfrhBaKf0qHFu25UwZfdRC6i/
         oYXnx8YF2ZXocDXgwjoDMvpvHX2VgnJ3XI8l1r3reHI72Xv2lmoyHwGk4RCAupQiVBRQ
         snYlIlx5Bumri3AJggqTz0zUF8KTNKO12fttQRinx1pRl5/lxTt3FoPuq3m6mH1jP5tP
         EtMONHdZaYElDUt6eya8gczf1OKtnBbbVimvfwZejHqPKrXl/dj1pz+vpjoATxk33Quc
         ktcw==
X-Gm-Message-State: ANoB5pk9O3ZemSXU4UlCv6r79rZnxzgUrtnLxI1wF1+QlrAEnCA9HJUj
        FOimhAC4Z+PdQGn5RoJonj1dXLh/4ut4Prva8w3SuWt5BO/ctA==
X-Google-Smtp-Source: AA0mqf5/V8vAkG5yu8rfNBpBbPJKTqV98nZ/6hF0TeBD4mhjv0NsSJ3V9OLj2ZBQHss3zSAeh3o2CXznf0PuDUzBWmc=
X-Received: by 2002:a0d:d84d:0:b0:37b:e3ae:decc with SMTP id
 a74-20020a0dd84d000000b0037be3aedeccmr8432724ywe.418.1668346113283; Sun, 13
 Nov 2022 05:28:33 -0800 (PST)
MIME-Version: 1.0
References: <0abf1924-485b-8f1c-c8c8-d14dcccc3a27@quicinc.com>
 <0Co5PrfVEsYkXu9wz6ixpiFl0aWmXfIng6NSPOiYNcrAfHZx0w2crkWN7InPdtR-YTAb1IxLovgcEHCmFpmaqA==@protonmail.internalid>
 <20220712132258.671263-1-dmitry.baryshkov@linaro.org> <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
In-Reply-To: <1892d0af-8aa4-dc03-887a-e44bb623b836@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 13 Nov 2022 16:28:22 +0300
Message-ID: <CAA8EJpq_9iC1rkiZVom28Kv_B3QLd4pBgFObxBfSpJ+Xh=Mp1g@mail.gmail.com>
Subject: Re: [PATCH v2.5] drm/msm/dsi: switch to DRM_PANEL_BRIDGE
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Caleb,

On Fri, 11 Nov 2022 at 18:30, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>
> Hi,
>
> This patch has caused a regression on 6.1-rc for some devices that use
> DSI panels. The new behaviour results in the DSI controller being
> switched off before the panel unprepare hook is called. As a result,
> panel drivers which call mipi_dsi_dcs_write() or similar in
> unprepare() fail.

Thanks for the notice. Can you move your command stream to
panel_disable() hook? (even if it's just as a temporary workaround)

From what I see from other panels, some of them call
mipi_dsi_dcs_set_display_off() in the unprepare() hook, while others
do it in disable().

Yes, this is (again) the DSI host vs device order here. Short story:
the DRM has a notion of 'the display pipe (i.e. clocks and timing
signals) feeding the bridge being running'. That's the difference
between enable/pre_enable and disable/post_disable. For the DSI we
have a third state, when the DSI clock and ln0 allow transferring
commands to the panel, but the image is not enabled.

There was a somewhat promising patchset at [1], but it seems it went
out of the radar. I can try working on an alternative (explicit)
approach if I have time.

With respect to your panel. Let me quote the docs: 'Before stopping
video transmission from the display controller it can be necessary to
turn off the panel to avoid visual glitches. This is done in the
.disable() function. Analogously to .enable() this typically involves
turning off the backlight and waiting for some time to make sure no
image is visible on the panel. It is then safe for the display
controller to cease transmission of video data.'

So, if we stop the call chain after switching the DSI host off but
before calling the panel's unprepare() hook, will we see any
artifacts/image leftover/etc. on the panel? Generally I have the
feeling that all panels should call mipi_dsi_dcs_set_display_off() in
the .disable() hook, not in the .unprepare() one.

[1] https://lore.kernel.org/dri-devel/cover.1646406653.git.dave.stevenson@raspberrypi.com/

>
> I've noticed it specifically on the OnePlus 6 (with upstream Samsung
> s0fef00 panel driver) and the SHIFT6mq with an out of tree driver.
>
> On 12/07/2022 14:22, Dmitry Baryshkov wrote:
> > Currently the DSI driver has two separate paths: one if the next device
> > in a chain is a bridge and another one if the panel is connected
> > directly to the DSI host. Simplify the code path by using panel-bridge
> > driver (already selected in Kconfig) and dropping support for
> > handling the panel directly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > I'm not sending this as a separate patchset (I'd like to sort out mdp5
> > first), but more of a preview of changes related to
> > msm_dsi_manager_ext_bridge_init().
> >
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.c         |  35 +---
> >   drivers/gpu/drm/msm/dsi/dsi.h         |  16 +-
> >   drivers/gpu/drm/msm/dsi/dsi_host.c    |  25 ---
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 283 +++-----------------------
> >   4 files changed, 36 insertions(+), 323 deletions(-)

[skipped the patch itself]

-- 
With best wishes
Dmitry

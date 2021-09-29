Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4FE41CFFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 01:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347549AbhI2Xbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 19:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347541AbhI2Xbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 19:31:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173FAC061769
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 16:29:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z24so17357004lfu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Sep 2021 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3jxizxNlMd3y5kC30EDvr+i+pHVmPKgABz+DF4rjgKs=;
        b=ZNn9Be9ICes2313BvgS80zA79N5Rq02S19oDdcxEx67Sx2rzL5Gn1xVnuu3/ukS6dh
         RtjBsCpugu9twNEt/dyydKYUcEe//8cHEgNaSmNAM9JttRf66LomPN0bRf8t0UmYIH6J
         bK8f/eh0Jg5jTt5RM3jaBwYLMr4tSVtsnJ6t1BL1Tx/sirWQuI/MN57Yvd5c3rj4jtCl
         ufitWPMWyXCopRxWyRu6ONxWq+6kWNCJWoS0JMr6GptBK0Scan2mjbOH0RyRhmLURchN
         u306sBL0XbZ8cbmzje+XWEYOAekY8Im+A2omYOA/XmPk+EYU7T6M4WCs3u8gTjLcBxXB
         pLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3jxizxNlMd3y5kC30EDvr+i+pHVmPKgABz+DF4rjgKs=;
        b=hgp3OSXVU4RM3NB1I6Nbuhb+SrFcxj/19aZ8tixRsULjLbBdUDxes+XhMoJ7wAdKK8
         fqWc8Y4WOFYVSboBABbW2NQ6UUunS+w5lW/xtxdBEkiDqeSRO/9+VPnKwBjwcs75uGmA
         zSpPbfzLcirZxkQw1jsbW8D8k1jOfo/AkCJZTYWgOf1Xvu3ponlyu2Zu9E2gLqZ7QsNl
         izHFdNQLtYmgwH2igOQxHGDRFo99aYpr6im2FTvQWvg2YNPEeWTL9RyovMgYQE9J90ty
         diL8NofDYdXQmEtP7ufmrAuP/e35qMI/NcVTaFe1kV6r5tj4AQyAylT4p5ZtEmSuLHi8
         tMmQ==
X-Gm-Message-State: AOAM533+Rk9M4zhhn/9z423HHIPUbSjioCbiKxNdtPYjqls/qSn5Kr50
        X/c/Axb+2t0aEKtFEtxvuLLBrmYa6zTHabfRK18DQw==
X-Google-Smtp-Source: ABdhPJxEKlQI/LHiS4pZSJWaQTK5azLO1ThGLFdst/S7wFdxgxStmC6elHJTeXAejJ+cfi1lHCUXfQO9r4xF0Yu/Cgs=
X-Received: by 2002:a05:6512:ea5:: with SMTP id bi37mr2501644lfb.36.1632958194363;
 Wed, 29 Sep 2021 16:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech> <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com> <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
In-Reply-To: <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 29 Sep 2021 16:29:42 -0700
Message-ID: <CALAqxLW=dJSmfaHAL=BfYVVxZHQvzJWu4UjMixwgM=Nh85JVNw@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order consistent
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Sean Paul <sean@poorly.run>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Inki Dae <inki.dae@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
> > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > The best practice to avoid those issues is to register its functions only after
> > > > all its dependencies are live. We also shouldn't wait any longer than we should
> > > > to play nice with the other components that are waiting for us, so in our case
> > > > that would mean moving the DSI device registration to the bridge probe.
> > > >
> > > > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > > > would be affected by this and wouldn't probe anymore after those changes.
> > > > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > > > requires to be tested), but the changes in msm seemed to be far more important
> > > > and I wasn't confortable doing them.
> > >
> > >
> > > Hey Maxime,
> > >   Sorry for taking so long to get to this, but now that plumbers is
> > > over I've had a chance to check it out on kirin
> > >
> > > Rob Clark pointed me to his branch with some fixups here:
> > >    https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> > >
> > > But trying to boot hikey with that, I see the following loop indefinitely:
> > > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> > > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> > > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> > > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> > > [    4.681898] adv7511 2-0039: failed to find dsi host
> >
> > I just realized Rob's tree is missing the kirin patch. My apologies!
> > I'll retest and let you know.
>
> Ok, just retested including the kirin patch and unfortunately I'm
> still seeing the same thing.  :(
>
> Will dig a bit and let you know when I find more.

Hey Maxime!
  I chased down the issue. The dsi probe code was still calling
drm_of_find_panel_or_bridge() in order to succeed.

I've moved the logic that looks for the bridge into the bridge_init
and with that it seems to work.

Feel free (assuming it looks ok) to fold this change into your kirin patch:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?id=4a35ccc4d7a53f68d6d93da3b47e232a7c75b91d

thanks
-john

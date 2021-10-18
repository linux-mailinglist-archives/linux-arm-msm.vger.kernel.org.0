Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C14432352
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 17:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbhJRPwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 11:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhJRPwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 11:52:41 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBC71C06161C;
        Mon, 18 Oct 2021 08:50:29 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id z77-20020a1c7e50000000b0030db7b70b6bso10825450wmc.1;
        Mon, 18 Oct 2021 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=04HQg1igT3y085lM4epZO712BVwT6WH3aqTbKIYu7jw=;
        b=lYjder3BqrUfwzd7MZypFzevH+f7lIHJmyhkDyUnUORjNOS51uP4BiEQiOua26lb+B
         t9igwOD8J1VUuzhJoSCCJZ+hUEj/Wf1E8Z/s3PAoIDpvN8MC6oHPUL6oYg/SqRTD1+1M
         DNt6atvsTa2qi/er/ul9fRhw9k9e4yfMbsNuLdZ3X/CRHERywVBPDBrt9IbLzcD4juZ2
         QJwgjRhfpwlDRFE0JXUogx3KozXz6kSCXhbM68xkpJJ5PGe/Omu92eJ9sHkPl64M9lt4
         tm0K5uSZ1D0uwElK+dhKun64cRkDecsJ+OkmlEgQ/xTJ8PO/ci47/ksLb9PuI+lafMju
         gDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04HQg1igT3y085lM4epZO712BVwT6WH3aqTbKIYu7jw=;
        b=G0ahLO2jU93ZHg9ge9YNgPq3J+TEe+2oyPPaN3xa2ryvheZNJ8OQmH9KEGDbyog/H+
         7yTN4Ct7cVx3xBv5cYod32WfTa2t4ZxZmeCiqlRKr0dghuGcnk3Wr3TEk3Q56Dvp+qiZ
         pRsvo0QQ8qxoimLBpRMkS1D5ctYarDslBAfyjZVlMuGlCu20fL5exIoF829voGJ9TTPp
         HXPO4UUAWu06o7Wofi8oMoA/dgaQaW2g26Z+YYBd/CIa/mqYKJQkVn/rV8/1p1frdiA8
         SwwL5KJJvhtwLeAmPQcgmeWV8U+8gouKrSEEjsgEBKUH9cTG5VElTrSFEnUK8zdQWgxj
         ED5g==
X-Gm-Message-State: AOAM531g2DYMdfzOS8fdC7Dq6e5ybPXwJejUnxeA8hkI3RsjpFO3V8Co
        YLtJ+yQOQ/KadAZp33fnICCeLDGDWSyZlqLONoo=
X-Google-Smtp-Source: ABdhPJygaWphYzwppUv6zCyL7pzBwLfl14v09zV1z2AwmiwVZVCRs/QEw0ZgVywEb6GF6/dSb33i+jlMmSjD/dwr4Hk=
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr32300015wme.127.1634572228379;
 Mon, 18 Oct 2021 08:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech> <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com>
 <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
 <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
 <YXiZIuao6wNch7j-D3ZktdSR3_IRAQ3oSeL8sLCCX8lEhwsoWaouE6_eV6C2Zv9r2_dww_Mtal18UBJfc4fz4g==@protonmail.internalid>
 <CAMi1Hd0sUUFvNzYwt29af9d99o1-x+LiXBPCrQ8=9H0tHvxVHg@mail.gmail.com>
 <b57fbc24-9ef3-a57b-17d4-2cb33fb409d4@linaro.org> <20211013141629.qfeqwsyi5yobzjca@gilmour>
 <CAF6AEGu2CyQA6XZ=r4c9Z0tiiPUxyhTf0OAu3v6w0oswJ3567w@mail.gmail.com> <20211018123452.efwx5varmxihsv6n@gilmour>
In-Reply-To: <20211018123452.efwx5varmxihsv6n@gilmour>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 18 Oct 2021 08:55:06 -0700
Message-ID: <CAF6AEGvXWzV2c4PZ-QbUUmn=cgXXtH_CSRC+uaPsp4+jRKmwVw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 00/24] drm/bridge: Make panel and bridge
 probe order consistent
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
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
        dri-devel <dri-devel@lists.freedesktop.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 5:34 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Rob,
>
> On Wed, Oct 13, 2021 at 05:16:58PM -0700, Rob Clark wrote:
> > On Wed, Oct 13, 2021 at 7:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Caleb,
> > >
> > > On Thu, Sep 30, 2021 at 09:20:52PM +0100, Caleb Connolly wrote:
> > > > Hi,
> > > >
> > > > On 30/09/2021 20:49, Amit Pundir wrote:
> > > > > On Thu, 30 Sept 2021 at 04:50, Rob Clark <robdclark@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Sep 29, 2021 at 2:51 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > >
> > > > > > > On Wed, Sep 29, 2021 at 2:32 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > > > On Wed, Sep 29, 2021 at 2:27 PM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > > > > On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > > > > > The best practice to avoid those issues is to register its functions only after
> > > > > > > > > > all its dependencies are live. We also shouldn't wait any longer than we should
> > > > > > > > > > to play nice with the other components that are waiting for us, so in our case
> > > > > > > > > > that would mean moving the DSI device registration to the bridge probe.
> > > > > > > > > >
> > > > > > > > > > I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> > > > > > > > > > would be affected by this and wouldn't probe anymore after those changes.
> > > > > > > > > > Exynos and kirin seems to be simple enough for a mechanical change (that still
> > > > > > > > > > requires to be tested), but the changes in msm seemed to be far more important
> > > > > > > > > > and I wasn't confortable doing them.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hey Maxime,
> > > > > > > > >    Sorry for taking so long to get to this, but now that plumbers is
> > > > > > > > > over I've had a chance to check it out on kirin
> > > > > > > > >
> > > > > > > > > Rob Clark pointed me to his branch with some fixups here:
> > > > > > > > >     https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> > > > > > > > >
> > > > > > > > > But trying to boot hikey with that, I see the following loop indefinitely:
> > > > > > > > > [    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
> > > > > > > > > [    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
> > > > > > > > > [    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
> > > > > > > > > [    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
> > > > > > > > > [    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
> > > > > > > > > [    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
> > > > > > > > > [    4.681898] adv7511 2-0039: failed to find dsi host
> > > > > > > >
> > > > > > > > I just realized Rob's tree is missing the kirin patch. My apologies!
> > > > > > > > I'll retest and let you know.
> > > > > > >
> > > > > > > Ok, just retested including the kirin patch and unfortunately I'm
> > > > > > > still seeing the same thing.  :(
> > > > > > >
> > > > > > > Will dig a bit and let you know when I find more.
> > > > > >
> > > > > > Did you have a chance to test it on anything using drm/msm with DSI
> > > > > > panels?  That would at least confirm that I didn't miss anything in
> > > > > > the drm/msm patch to swap the dsi-host vs bridge ordering..
> > > > >
> > > > > Hi, smoke tested
> > > > > https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework
> > > > > on Pocophone F1 (sdm845 / A630) with v5.15-rc3. I see no obvious
> > > > > regressions in my limited testing so far including video (youtube)
> > > > > playback.
> > > > Tested on the OnePlus 6 too booting AOSP, works fine. This *fixes*
> > > > FBDEV_EMULATION (so we can get a working framebuffer console) which was
> > > > otherwise broken on 5.15.
> > > >
> > > > However it spits out some warnings during boot: https://p.calebs.dev/gucysowyna.yaml
> > >
> > > Thanks for testing. It looks like the runtime_pm ordering between the
> > > msm devices changed a bit with the conversion Rob did.
> > >
> > > Rob, do you know what could be going on?
> > >
> >
> > Not entirely sure.. I didn't see that first splat, but maybe I was
> > missing some debug config? (The 2nd one is kind of "normal", I think
> > related to bootloader leaving the display on)
>
> So do you feel like this is a blocker or do you expect it to be fixed
> sometime down the road?

No

I can try and take a look at the 2nd splat, but shouldn't block your series

BR,
-R

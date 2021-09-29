Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F393841CFD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 01:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347408AbhI2XWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 19:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347372AbhI2XWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 19:22:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04163C06161C;
        Wed, 29 Sep 2021 16:20:31 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id d21so6814975wra.12;
        Wed, 29 Sep 2021 16:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yD9KIs5WhcUAcouIPcbObX4XZu0b5Wq+aztQ8omFaBY=;
        b=Xal4ZxNdQjY83Bv3VlqbzOdOphBYrpGyeegEA+/yfeeQJJq0jgG0ttY/YfFt9cd2zn
         eSl/LeSYS1Dk3MNwdHeLFtleZ+d94rjs62suXI+j2ogM0VXI0yjSyrOFSOzyLxs/Vr9s
         Qizp2VGNID3KTu7OoPV3jkB1ZofJE6NtH1yzVGEYeGt+t3b8rRFLkkEOUFR/wc7ec86h
         3HWAHZV8CDfKRVyW78L3YDMTL5GlvpaBh/gBxZ1qh8kNXqzOLdQbvUvKvbJBaJhK1+5H
         omXJ4ccfiWB33GLjKKBPM6V2GcXdsfNShE61bAnm+ImSg0MuY1nOlm54fZ/X+gCnDCAk
         NEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yD9KIs5WhcUAcouIPcbObX4XZu0b5Wq+aztQ8omFaBY=;
        b=w0B8N0/JoiJ0GDRAY8ytwQfcOgmAHjRebbDoLvxgZslSFj7xnS+Axv08c0rqg0v5k1
         mN7he3viaID9l3p5Sfz/4Tx0vpAhlybV/mTEeIy3cV1T33H5AFZJz39voW22XtPVkczr
         ao8vAvRDNzTg1KXpDLT2KqID1NqQUAftAap0Je7TVGzqSQLJxX1n1yzvTBNT7U8YB/1W
         jL3QpaAnU8C6z9rQL5Kd1pbmSsNzScYgy4eF1imgFJSJy1GK7SnxS6nEn+FyQ1cl9jF3
         sBjg1T15WYp08HZ9jKgCn0B9jCfeDPh5g7bvszlE0be3fff5urKlc4QgqEylZ+xLkSyc
         C7xw==
X-Gm-Message-State: AOAM531heNyBDKbh7baF/lTDGmzeskBEO9Yr0VBboLGE5dUuOMmaIF60
        JpXIxJdY+o5QcCmD7ZQMlRRefzrdVr0+/7YVguo=
X-Google-Smtp-Source: ABdhPJx4hkgU/5JuFbaRQKkdhd2WKVk0EEBfYFPYbaLnSHn8BrdlJpViE+yCNsi8fnhScSIq6nnSOYzhPQM3Fht3fAw=
X-Received: by 2002:a5d:544c:: with SMTP id w12mr2853476wrv.398.1632957630423;
 Wed, 29 Sep 2021 16:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech> <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
 <CALAqxLUYb=ge4AZZzmk71Qr-92vnnE6sJxwCNUdEz4=VDKr1kg@mail.gmail.com> <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
In-Reply-To: <CALAqxLX7oK6DeoCPZhMTpHKCihSYq7KZDrt5UKb46=ZBbJd9fA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 29 Sep 2021 16:25:04 -0700
Message-ID: <CAF6AEGuJgrYrg7FXpVj8P_qf73CXb4=0KysSYQaobJuheDeUSA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order consistent
To:     John Stultz <john.stultz@linaro.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
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

Did you have a chance to test it on anything using drm/msm with DSI
panels?  That would at least confirm that I didn't miss anything in
the drm/msm patch to swap the dsi-host vs bridge ordering..

BR,
-R

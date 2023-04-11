Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B95F56DE2B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 19:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjDKRgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 13:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjDKRgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 13:36:03 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A91C6A57
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 10:36:00 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id bv15so7243792ybb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681234559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kyBvTzdzIu1H+Ec72ru36ICQw3wemFp5ak3AycFoQ8=;
        b=oP5s/x3IrjFEbxhZPWV3IVDz/ByDv2Ls5x0O904x2AuYnjvT2xICE5jp4Tqycen2Q0
         doWB5C4gJbHjt9YBfJZZ74qhwDSO3keTBaDVOCqmLMK1KqZX+5iIVtXBR873RnMbYtQN
         6qhq10qLHF5GjQwzQRpQcqE40Zs9A5kSMovizD+QwySni7mjunbPGP0Mx1H6jwk8yYqJ
         MlIgwBp/dj6LRDnIcO8xxmjGN2EN2EcUy1cMHEOv0gC/M9temGqgAVyIuqZbdYacn2av
         AX0UDtOnbtdAnhuxSth4XG1PDFyojl13Jw2ik9uGUyRJ5joiPzEI+YJz+yPFcLTtnDcj
         IkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681234559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kyBvTzdzIu1H+Ec72ru36ICQw3wemFp5ak3AycFoQ8=;
        b=q4BAiqfgGOj33R7dkTAE9zsZdkhROYSfyUjCGURypJqaub2U+UdE35TCqkitKZ+DF3
         oTg4gIJAA0y3Y91g4r8TeD9zM2uvXjnIpJuMrmxKEH5PVhnVmdx2luUqTFyGkV79G88E
         76mndJvVqAEbGVPwLkZdwMqrNJCzo4PyvgNt9dnZZT6Ueichh9SIFxpZHZ1GilLYsQgp
         59liqtFDUKZ4GJrNSCgXgp5QDtTUlGLBxTdx0k5biSVQYcEbd5DGXL5/DxU2s9TQeZ8f
         ByQqQzPC4TYUi0GuXRIRpPyc98gasxVLmFNvkqt23c49UZh499Do7vgRoAf3M2sdIj3S
         CvLQ==
X-Gm-Message-State: AAQBX9dTdict00W57OFih26IJz8aCF9QOb4Mbde8vhkxpIesavQih6s5
        M9EkPRnsmgeq8kp9u+6UrEXzqSn9D+e78VA4voaXpg==
X-Google-Smtp-Source: AKy350ZiUDyr5F4QFXUjDcGVrWsOHV3bIsrNR3l2Wz60yKVwYn0KzTnbePAGa2kKqDroE8ZtTbd5mUm6RcQfhdr2vEY=
X-Received: by 2002:a25:d649:0:b0:b8a:7b2d:6555 with SMTP id
 n70-20020a25d649000000b00b8a7b2d6555mr2048091ybg.9.1681234559624; Tue, 11 Apr
 2023 10:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230410210608.1873968-1-robdclark@gmail.com> <CAF6AEGvs4XMggPMthiJ89SiaUj3k+nY95OhxLZ5cD-01XPco4Q@mail.gmail.com>
 <ZDWQfbUBhyJf1Ezx@phenom.ffwll.local> <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
In-Reply-To: <CAF6AEGtYw4Dn80OtrnJESkkDXxhUdAr6Nuva+Jo3ExW8MXH++Q@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 11 Apr 2023 20:35:48 +0300
Message-ID: <CAA8EJppnEwcHM++YUYZGrNXEha=-ZVAexBdkMVsU52PTOs4VnA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 0/2] drm: fdinfo memory stats
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Christopher Healy <healych@amazon.com>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Apr 2023 at 20:13, Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Apr 11, 2023 at 9:53=E2=80=AFAM Daniel Vetter <daniel@ffwll.ch> w=
rote:
> >
> > On Tue, Apr 11, 2023 at 09:47:32AM -0700, Rob Clark wrote:
> > > On Mon, Apr 10, 2023 at 2:06=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Similar motivation to other similar recent attempt[1].  But with an
> > > > attempt to have some shared code for this.  As well as documentatio=
n.
> > > >
> > > > It is probably a bit UMA-centric, I guess devices with VRAM might w=
ant
> > > > some placement stats as well.  But this seems like a reasonable sta=
rt.
> > > >
> > > > Basic gputop support: https://patchwork.freedesktop.org/series/1162=
36/
> > > > And already nvtop support: https://github.com/Syllo/nvtop/pull/204
> > >
> > > On a related topic, I'm wondering if it would make sense to report
> > > some more global things (temp, freq, etc) via fdinfo?  Some of this,
> > > tools like nvtop could get by trawling sysfs or other driver specific
> > > ways.  But maybe it makes sense to have these sort of things reported
> > > in a standardized way (even though they aren't really per-drm_file)
> >
> > I think that's a bit much layering violation, we'd essentially have to
> > reinvent the hwmon sysfs uapi in fdinfo. Not really a business I want t=
o
> > be in :-)
>
> I guess this is true for temp (where there are thermal zones with
> potentially multiple temp sensors.. but I'm still digging my way thru
> the thermal_cooling_device stuff)

It is slightly ugly. All thermal zones and cooling devices are virtual
devices (so, even no connection to the particular tsens device). One
can either enumerate them by checking
/sys/class/thermal/thermal_zoneN/type or enumerate them through
/sys/class/hwmon. For cooling devices again the only enumeration is
through /sys/class/thermal/cooling_deviceN/type.

Probably it should be possible to push cooling devices and thermal
zones under corresponding providers. However I do not know if there is
a good way to correlate cooling device (ideally a part of GPU) to the
thermal_zone (which in our case is provided by tsens / temp_alarm
rather than GPU itself).

>
> But what about freq?  I think, esp for cases where some "fw thing" is
> controlling the freq we end up needing to use gpu counters to measure
> the freq.

For the freq it is slightly easier: /sys/class/devfreq/*, devices are
registered under proper parent (IOW, GPU). So one can read
/sys/class/devfreq/3d00000.gpu/cur_freq or
/sys/bus/platform/devices/3d00000.gpu/devfreq/3d00000.gpu/cur_freq.

However because of the components usage, there is no link from
/sys/class/drm/card0
(/sys/devices/platform/soc@0/ae00000.display-subsystem/ae01000.display-cont=
roller/drm/card0)
to /sys/devices/platform/soc@0/3d00000.gpu, the GPU unit.

Getting all these items together in a platform-independent way would
be definitely an important but complex topic.

>
> > What might be needed is better glue to go from the fd or fdinfo to the
> > right hw device and then crawl around the hwmon in sysfs automatically.=
 I
> > would not be surprised at all if we really suck on this, probably more
> > likely on SoC than pci gpus where at least everything should be under t=
he
> > main pci sysfs device.
>
> yeah, I *think* userspace would have to look at /proc/device-tree to
> find the cooling device(s) associated with the gpu.. at least I don't
> see a straightforward way to figure it out just for sysfs
>
> BR,
> -R
>
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > >
> > > > [1] https://patchwork.freedesktop.org/series/112397/
> > > >
> > > > Rob Clark (2):
> > > >   drm: Add fdinfo memory stats
> > > >   drm/msm: Add memory stats to fdinfo
> > > >
> > > >  Documentation/gpu/drm-usage-stats.rst | 21 +++++++
> > > >  drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++=
++++
> > > >  drivers/gpu/drm/msm/msm_drv.c         | 25 ++++++++-
> > > >  drivers/gpu/drm/msm/msm_gpu.c         |  2 -
> > > >  include/drm/drm_file.h                | 10 ++++
> > > >  5 files changed, 134 insertions(+), 3 deletions(-)
> > > >
> > > > --
> > > > 2.39.2
> > > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
With best wishes
Dmitry

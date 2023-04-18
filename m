Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF78C6E67A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 16:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjDRO5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 10:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjDRO5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 10:57:13 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD2D13866;
        Tue, 18 Apr 2023 07:57:05 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-187b70ab997so4138248fac.0;
        Tue, 18 Apr 2023 07:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681829825; x=1684421825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmDPfJiL1LzheWnfKu2SVFLYqu5IpgrAxgASj0DZzms=;
        b=McqVS1sm0RAeylD6QcUbzCxTIobtJDJH9hZACeZo1Zv2z4KS8Sm7yA3I3V/4jbB5UM
         tFWhL+PkGEYKGMj7xQWcl2FP5hTb36sZGqpVIGnXq3mQqNPF9g93INQPWjBzgAPyYWiV
         Dhm5XZxew5l1nPwRxTglNvNRA9y4sbLcn3Qw+WhK3Dp1XeowWFydbpunTnhxxQ2BBNGV
         A20iyOROE4fmEj7C1c8sdpO39n2aGCZ0AC3j8FGAkO0sEzloVi6mDGObTtee80mMtcuT
         cSTiWHIi5LZEvejcYtIwiqBlM/Jwmf3H7d6wkaX0lzXT/D+hojPsh2YWrgvPoPi6h3L/
         A6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681829825; x=1684421825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmDPfJiL1LzheWnfKu2SVFLYqu5IpgrAxgASj0DZzms=;
        b=gQYNCcA6OSriu+ng3tzc6Vb0UQihym82/NTr/a72Y7OZsVxF3rBCoQB4YT4l7W4ONV
         wM7m5oWB5tn0zCuEfZiAZa4TStKKSu7zi9c+CYpfAk+0CZ5XvNEO6cAfqVWK9N+wWPag
         MCiYsANrnmjXO4OfdpgGa02cNsbvMo6akunkJHb0vYe3mVsekYXSKMu8ZQ798/sWG4g3
         RnaRXVEtadXM7zjHeEnRLyEM/ZbZvMGj1tajYSWXvHfM2r0qxsnTjNJwcNcfKNPeSTU2
         Pger8d/JxqTQpNxoyFaXpsWy2xeYiQ2ZHAW4OO2+N7th+kiqfe9OX0fVcPlEL6tZIELg
         dptA==
X-Gm-Message-State: AAQBX9d1kyt5LeuoHlSJoJuS0C6G6pJtYZCxolox3kGjykXWf5iz+JiU
        5/VkWvLE5pegCKRc6V9cHZGKs8nJt8riigxx3P0=
X-Google-Smtp-Source: AKy350a9BK365oN693bGc67eLzEGnBhicvQndwl0wvMB5f0M027wfxuHsVJ0tBoCyY79Fk16pPluUBupgkXoS114wcs=
X-Received: by 2002:aca:f042:0:b0:38e:30c2:56a8 with SMTP id
 o63-20020acaf042000000b0038e30c256a8mr685605oih.4.1681829825108; Tue, 18 Apr
 2023 07:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230417201215.448099-1-robdclark@gmail.com> <20230417201215.448099-4-robdclark@gmail.com>
 <20655be0-65e3-0000-4acd-310ec9cc1d3a@linux.intel.com>
In-Reply-To: <20655be0-65e3-0000-4acd-310ec9cc1d3a@linux.intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 18 Apr 2023 07:56:53 -0700
Message-ID: <CAF6AEGsiNeHc7PuBnBkmwZ22S9dkmGqx70AEPmK8Fdp5J0YVaw@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/msm: Add comm/cmdline fields
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 18, 2023 at 1:53=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 17/04/2023 21:12, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Normally this would be the same information that can be obtained in
> > other ways.  But in some cases the process opening the drm fd is merely
> > a sort of proxy for the actual process using the GPU.  This is the case
> > for guest VM processes using the GPU via virglrenderer, in which case
> > the msm native-context renderer in virglrenderer overrides the comm/
> > cmdline to be the guest process's values.
> >
> > Exposing this via fdinfo allows tools like gputop to show something mor=
e
> > meaningful than just a bunch of "pcivirtio-gpu" users.
>
> You also later expanded with:
>
> """
> I should have also mentioned, in the VM/proxy scenario we have a
> single process with separate drm_file's for each guest VM process.  So
> it isn't an option to just change the proxy process's name to match
> the client.
> """
>
> So how does that work - this single process temporarily changes it's
> name for each drm fd it opens and creates a context or it is actually in
> the native context protocol?

It is part of the protocol, the mesa driver in the VM sends[1] this
info to the native-context "shim" in host userspace which uses the
SET_PARAM ioctl to pass this to the kernel.  In the host userspace
there is just a single process (you see the host PID below) but it
does a separate open() of the drm dev for each guest process (so that
they each have their own GPU address space for isolation):

DRM minor 128
    PID    MEM ACTIV              NAME                    gpu
    5297  200M   82M com.mojang.minecr |=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=8F                        |
    1859  199M    0B            chrome |=E2=96=88=E2=96=89                 =
                    |
    5297   64M    9M    surfaceflinger |                                   =
    |
    5297   12M    0B org.chromium.arc. |                                   =
    |
    5297   12M    0B com.android.syste |                                   =
    |
    5297   12M    0B org.chromium.arc. |                                   =
    |
    5297   26M    0B com.google.androi |                                   =
    |
    5297   65M    0B     system_server |                                   =
    |


[1] https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/dr=
m/msm/msm_proto.h#L326
[2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/dr=
m/msm/msm_renderer.c#L1050

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   Documentation/gpu/drm-usage-stats.rst |  8 ++++++++
> >   drivers/gpu/drm/msm/msm_gpu.c         | 14 ++++++++++++++
> >   2 files changed, 22 insertions(+)
> >
> > diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/=
drm-usage-stats.rst
> > index 8e00d53231e0..bc90bed455e3 100644
> > --- a/Documentation/gpu/drm-usage-stats.rst
> > +++ b/Documentation/gpu/drm-usage-stats.rst
> > @@ -148,6 +148,14 @@ percentage utilization of the engine, whereas drm-=
engine-<keystr> only reflects
> >   time active without considering what frequency the engine is operatin=
g as a
> >   percentage of it's maximum frequency.
> >
> > +- drm-comm: <valstr>
> > +
> > +Returns the clients executable path.
>
> Full path and not just current->comm? In this case probably give it a
> more descriptive name here.
>
> drm-client-executable
> drm-client-command-line
>
> So we stay in the drm-client- namespace?
>
> Or if the former is absolute path could one key be enough for both?
>
> drm-client-command-line: /path/to/executable --arguments

comm and cmdline can be different. Android seems to change the comm to
the apk name, for example (and w/ the zygote stuff cmdline isn't
really a thing)

I guess it could be drm-client-comm and drm-client-cmdline?  Although
comm/cmdline aren't the best names, they are just following what the
kernel calls them elsewhere.

> > +
> > +- drm-cmdline: <valstr>
> > +
> > +Returns the clients cmdline.
>
> I think drm-usage-stats.rst text should provide some more text with
> these two. To precisely define their content and outline the use case
> under which driver authors may want to add them, and fdinfo consumer
> therefore expect to see them. Just so everything is completely clear and
> people do not start adding them for drivers which do not support native
> context (or like).

I really was just piggy-backing on existing comm/cmdline.. but I'll
try to write up something better.

I think it maybe should not be limited just to native context.. for
ex. if the browser did somehow manage to create different displays
associated with different drm_file instances (I guess it would have to
use gbm to do this?) it would be nice to see browser tab names.

> But on the overall it sounds reasonable to me - it would be really cool
> to not just see pcivirtio-gpu as you say. Even if the standard virtiogpu
> use case (not native context) could show real users.

For vrend/virgl, we'd first need to solve the issue that there is just
a single drm_file for all guest processes.  But really, just don't use
virgl.  (I mean, like seriously, would you put a gl driver in the
kernel?  Vrend has access to all guest memory, so this is essentially
what you have with virgl.  This is just not a sane thing to do.) The
only "valid" reason for not doing native-context is if you don't have
the src code for your UMD to be able to modify it to talk
native-context to virtgpu in the guest. ;-)

BR,
-R

> Regards,
>
> Tvrtko
>
> > +
> >   Implementation Details
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index f0f4f845c32d..1150dcbf28aa 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -148,12 +148,26 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
> >       return 0;
> >   }
> >
> > +static void get_comm_cmdline(struct msm_file_private *ctx, char **comm=
, char **cmd);
> > +
> >   void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private=
 *ctx,
> >                        struct drm_printer *p)
> >   {
> > +     char *comm, *cmdline;
> > +
> > +     get_comm_cmdline(ctx, &comm, &cmdline);
> > +
> >       drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
> >       drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
> >       drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
> > +
> > +     if (comm)
> > +             drm_printf(p, "drm-comm:\t%s\n", comm);
> > +     if (cmdline)
> > +             drm_printf(p, "drm-cmdline:\t%s\n", cmdline);
> > +
> > +     kfree(comm);
> > +     kfree(cmdline);
> >   }
> >
> >   int msm_gpu_hw_init(struct msm_gpu *gpu)

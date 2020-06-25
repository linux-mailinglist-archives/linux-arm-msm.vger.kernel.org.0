Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D90820A275
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 17:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390020AbgFYPzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 11:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389678AbgFYPzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 11:55:08 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13B0C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:55:07 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id v13so5722405otp.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 08:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2jpmc9EYNOnEA2LZNpXNlfvISWolx2ykKmxCV3P390=;
        b=MFjfXsfcGpuEve3vNp4dZqc744iveLNs6rKGKTVuY6IXS6m41iRq3yn5SXx2bTEwB2
         C0wIyQXmLzU5BfBd2GMgCJ9cpTLvbV0r8D5Hs8h6CBZXTVIfif1IyoPpqyXf+Up7jJe1
         MPslVN16/v02vtQRRXNC7U9c7dWvdVOZcJsFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2jpmc9EYNOnEA2LZNpXNlfvISWolx2ykKmxCV3P390=;
        b=euLDU5F69VszUgjOyRWK5orQqoy0gx8X6/d0peHVLcQT0fFtILwqAH51tZUyvAKURJ
         fxnzC2ty7guVeTeKF+xv6MeYhYL+zU/atIhXoZ1QXDOrYE4JpJaf6bYiiZeRz67mIb6v
         9Ss94G0t18kdLfGHyu9jBaz/4Yd9D6EeyT0RoI2EkJrwrZbgk77ERHNH8gAroVZ8cWp7
         HHrKfYAxbsWaJ2SXzYlcCGt68WQbMlBwiiZPfrAqCSvVNQ8CWyusOz8aCvSFQo0EqsF7
         +69e0kOcRarxzRaE1A/1mFVxx29lLunz1CbZ2aCHAIMizQlz5D8PFstK0r2ReWq0Wa0Y
         nTWw==
X-Gm-Message-State: AOAM533J5M68WCKJBz52FmpUBZEbCaRhP1/jmM5N8WXjOFntUVdxRA9L
        ZTdXfSrcn63YAhA59XRLR4xBdhvUv8ybsDpDlKC//qJG
X-Google-Smtp-Source: ABdhPJz4boVAPJ3yt/rDxuabzIYMrdaiWECBFUW82CxP+JcD9WBSwZTL4kd7zICVPFj+ci9zoUX6nUBA09Ubhhb+WlI=
X-Received: by 2002:a9d:4cd:: with SMTP id 71mr29283314otm.188.1593100506946;
 Thu, 25 Jun 2020 08:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200625115746.13396-1-shawnguo@kernel.org> <CAKMK7uGoDnizoE4t47houeyK2y5sLQbvCM3LDMWcEeV3oB5rPA@mail.gmail.com>
 <CAF6AEGuaFFxWSqYDXE0XukeQHOS7H5s6E8WfjVS7EfotWfZmQA@mail.gmail.com>
In-Reply-To: <CAF6AEGuaFFxWSqYDXE0XukeQHOS7H5s6E8WfjVS7EfotWfZmQA@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 25 Jun 2020 17:54:56 +0200
Message-ID: <CAKMK7uHDYSZBBKByxgaAhQMEs0gFmKe_QUCZsqt5wcgYZFYcOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic_helper: duplicate state for drm_private_obj
To:     Rob Clark <robdclark@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 25, 2020 at 4:17 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jun 25, 2020 at 5:35 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Thu, Jun 25, 2020 at 1:58 PM Shawn Guo <shawnguo@kernel.org> wrote:
> > >
> > > From: Shawn Guo <shawn.guo@linaro.org>
> > >
> > > The msm/mdp5 driver uses drm_private_obj as its global atomic state,
> > > which keeps the assignment of hwpipe to plane.  With drm_private_obj
> > > missing from duplicate state call, mdp5 suspend works with no problem
> > > only for the very first time.  Any subsequent suspend will hit the
> > > following warning, because hwpipe assignment doesn't get duplicated for
> > > suspend state.  Adding drm_private_obj handling for duplicate state call
> > > fixes the problem.
> >
> > If the driver needs a private state, it's supposed to duplicate that
> > in its atomic_check functionality. This isn't the helper's job.
> >
> > If this is a bug in msm code, then pretty sure if you try hard enough,
> > you can hit the exact same bug from userspace too. Maybe good idea to
> > try and reproduce this with igt or something.
>
> The problem is how duplicate_state is used by the atomic
> suspend/resume helpers.  They duplicate the running state on suspend,
> forgetting to duplicate the global state.  Then everything is
> disabled, the driver correctly duplicates and updates it's global
> atomic state releasing the hwpipe.
>
> But then on resume, we are re-applying plane state that thinks it
> already has a hwpipe assigned (because that is part of the plane state
> that was duplicated), without reapplying the matching global state.
>
> On a normal atomic commit, we would duplicate the plane state that has
> the hwpipe disabled, which would be in sync with the drivers global
> state.  But since that is not what the atomic resume helper does, we
> hit the situation where the plane state and the global state are out
> of sync.
>
> So the driver is dtrt, the problem really is with the helpers.  I
> think this patch is the right thing to do.  It is incorrect for the
> suspend/resume helpers to assume that they can re-apply duplicated
> state without including the global state.

Hm, this is a bit awkward. Generally the assumption is that you should
be recomputing the derived state (like hwpipe) no matter what. If your
driver doesn't do that, then all kinds of things can leak from the
pre-resume to the post-resume side of things, that's kinda why I'm not
thrilled with this patch, I think it has good potential to open up a
can of worms. Iirc this patch has come up in the past, and in those
cases it was a driver bug.

For this case, why is msm reusing a hw pipe assignment of a disabled plane?

Unfortunately we can't copy the drm state into the overall structure
to solve this, since that would miss driver-private properties. So
unfortunately we can't make this match a real atomic commit from
userspace perfectly.

Another option would be if msm just copies the private state it needs
to not go boom.

Doing this unconditionally might break other drivers that rely on
private state not being duplicated, but I guess that would also be
somewhat of a driver bug.
-Daniel

>
> BR,
> -R
>
> > -Daniel
> >
> >
> > > $ echo mem > /sys/power/state
> > > [   38.111144] PM: suspend entry (deep)
> > > [   38.111185] PM: Syncing filesystems ... done.
> > > [   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > > [   38.115912] OOM killer disabled.
> > > [   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > [   38.122170] ------------[ cut here ]------------
> > > [   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
> > > [   38.122215] Modules linked in:
> > > [   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
> > > [   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
> > > [   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
> > > [   38.122230] pc : mdp5_pipe_release+0x90/0xc0
> > > [   38.122233] lr : mdp5_pipe_release+0x90/0xc0
> > > [   38.122235] sp : ffff00000d13b7f0
> > > [   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
> > > [   38.122240] x27: 0000000000000002 x26: ffff800079adce00
> > > [   38.122243] x25: ffff800079405200 x24: 0000000000000000
> > > [   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
> > > [   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
> > > [   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
> > > [   38.122255] x17: 0000000000000000 x16: 0000000000000000
> > > [   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
> > > [   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
> > > [   38.122264] x11: 0000000000000000 x10: ffff000008cda000
> > > [   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
> > > [   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
> > > [   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
> > > [   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
> > > [   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
> > > [   38.122281] Call trace:
> > > [   38.122285]  mdp5_pipe_release+0x90/0xc0
> > > [   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
> > > [   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
> > > [   38.122298]  drm_atomic_helper_check+0x38/0xa8
> > > [   38.122302]  drm_atomic_check_only+0x3e8/0x630
> > > [   38.122305]  drm_atomic_commit+0x18/0x58
> > > [   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
> > > [   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
> > > [   38.122316]  msm_pm_suspend+0x4c/0x70
> > > [   38.122320]  dpm_run_callback.isra.6+0x20/0x68
> > > [   38.122323]  __device_suspend+0x110/0x308
> > > [   38.122326]  dpm_suspend+0x100/0x1f0
> > > [   38.122329]  dpm_suspend_start+0x64/0x70
> > > [   38.122334]  suspend_devices_and_enter+0x110/0x500
> > > [   38.122336]  pm_suspend+0x268/0x2c0
> > > [   38.122339]  state_store+0x88/0x110
> > > [   38.122345]  kobj_attr_store+0x14/0x28
> > > [   38.122352]  sysfs_kf_write+0x3c/0x50
> > > [   38.122355]  kernfs_fop_write+0x118/0x1e0
> > > [   38.122360]  __vfs_write+0x30/0x168
> > > [   38.122363]  vfs_write+0xa4/0x1a8
> > > [   38.122366]  ksys_write+0x64/0xe8
> > > [   38.122368]  __arm64_sys_write+0x18/0x20
> > > [   38.122374]  el0_svc_common+0x6c/0x178
> > > [   38.122377]  el0_svc_compat_handler+0x1c/0x28
> > > [   38.122381]  el0_svc_compat+0x8/0x18
> > > [   38.122383] ---[ end trace 24145b7d8545345b ]---
> > > [   38.491552] Disabling non-boot CPUs ...
> > >
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index 85d163f16801..024985a92156 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -3140,6 +3140,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >         struct drm_atomic_state *state;
> > >         struct drm_connector *conn;
> > >         struct drm_connector_list_iter conn_iter;
> > > +       struct drm_private_obj *priv_obj;
> > >         struct drm_plane *plane;
> > >         struct drm_crtc *crtc;
> > >         int err = 0;
> > > @@ -3184,6 +3185,16 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > >         }
> > >         drm_connector_list_iter_end(&conn_iter);
> > >
> > > +       drm_for_each_privobj(priv_obj, dev) {
> > > +               struct drm_private_state *priv_state;
> > > +
> > > +               priv_state = drm_atomic_get_private_obj_state(state, priv_obj);
> > > +               if (IS_ERR(priv_state)) {
> > > +                       err = PTR_ERR(priv_state);
> > > +                       goto free;
> > > +               }
> > > +       }
> > > +
> > >         /* clear the acquire context so that it isn't accidentally reused */
> > >         state->acquire_ctx = NULL;
> > >
> > > @@ -3278,6 +3289,8 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > >         struct drm_connector_state *new_conn_state;
> > >         struct drm_crtc *crtc;
> > >         struct drm_crtc_state *new_crtc_state;
> > > +       struct drm_private_state *new_priv_state;
> > > +       struct drm_private_obj *priv_obj;
> > >
> > >         state->acquire_ctx = ctx;
> > >
> > > @@ -3290,6 +3303,9 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > >         for_each_new_connector_in_state(state, connector, new_conn_state, i)
> > >                 state->connectors[i].old_state = connector->state;
> > >
> > > +       for_each_new_private_obj_in_state(state, priv_obj, new_priv_state, i)
> > > +               state->private_objs[i].old_state = priv_obj->state;
> > > +
> > >         ret = drm_atomic_commit(state);
> > >
> > >         state->acquire_ctx = NULL;
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

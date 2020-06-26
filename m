Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9C820BB56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 23:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgFZVV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 17:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFZVV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 17:21:59 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD821C03E979
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 14:21:58 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q15so10028452wmj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c4sFnDT9VyQxEckpAghTzk6ScPS2rxNeBAe1Vu58eos=;
        b=CbyUW/2ywgYUPr+e+clpauW+42Yg+i0/Xm42f1jW0HXeCg58pWc/H+gXvdhX6L91gJ
         YMYb0hxd8iqVmxd4ogF7FHEAmyRQRhO6VWzgsl1LXph93KmZETRfE5Ey5eo2yPokks6g
         tC/tBloL2U/LBQj/tyqwzspb78W6qJAVQmSN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c4sFnDT9VyQxEckpAghTzk6ScPS2rxNeBAe1Vu58eos=;
        b=dXHnNdgoObJsMOcLDRoy1m5LvHbMr3lJ6zGrP2M3pda49boEl3hLUvtz1lBeq6XuNr
         A3Hpi4fia/bSqi3B+980HcEK3L7T3IYi+3MjvBaLEVTNaY2JhAcpY4/Ok/G8kGStgGaq
         UnL5aOj7IRXSKOMPiwD8zn6SzjbSObH1Xjpup6IesAgTbnhyttVGyhPsU5GwHqC1Mdma
         QRjtkkwFWBS0iZ3k7ySRKgCwfZi2J9z347EdVjcABonfntLOmWs09pGGIpF2/Ul3bDoI
         s395BnDgjwGQLx0wP540IpCHf06M/egp5m+lRlcWF1c6i0QYXgBsPciCsZa/39a2WIt3
         pHTw==
X-Gm-Message-State: AOAM530NcUd6Kk2rud41tqze3v2ByVPjTACpG9b6qmkM1Ex7jMU3fQtP
        OcCWtFa50nKg7X733lE1qa3qug==
X-Google-Smtp-Source: ABdhPJxZAguGoB5aLc5PtDxT7UW/xIflsB981LVe1Fl+JntwIcU5PV6VuP0h3jFqWMK+W7YIYqgnBQ==
X-Received: by 2002:a05:600c:294a:: with SMTP id n10mr5190620wmd.38.1593206517453;
        Fri, 26 Jun 2020 14:21:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u20sm17578786wmm.15.2020.06.26.14.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 14:21:56 -0700 (PDT)
Date:   Fri, 26 Jun 2020 23:21:54 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] drm/atomic_helper: duplicate state for drm_private_obj
Message-ID: <20200626212154.GI3278063@phenom.ffwll.local>
References: <20200625115746.13396-1-shawnguo@kernel.org>
 <CAKMK7uGoDnizoE4t47houeyK2y5sLQbvCM3LDMWcEeV3oB5rPA@mail.gmail.com>
 <CAF6AEGuaFFxWSqYDXE0XukeQHOS7H5s6E8WfjVS7EfotWfZmQA@mail.gmail.com>
 <CAKMK7uHDYSZBBKByxgaAhQMEs0gFmKe_QUCZsqt5wcgYZFYcOQ@mail.gmail.com>
 <CAF6AEGs8vyFrNoGYTDaf81f28CkFqQsaqhAHrW3nBuHBzRCf7g@mail.gmail.com>
 <20200626134642.GF3278063@phenom.ffwll.local>
 <CAF6AEGuJFRM-B3mNNfKpnxFTx0GdrANwykE5Neck3Sqxoyy4rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuJFRM-B3mNNfKpnxFTx0GdrANwykE5Neck3Sqxoyy4rA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 26, 2020 at 08:25:18AM -0700, Rob Clark wrote:
> On Fri, Jun 26, 2020 at 6:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jun 25, 2020 at 09:24:38AM -0700, Rob Clark wrote:
> > > On Thu, Jun 25, 2020 at 8:55 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > On Thu, Jun 25, 2020 at 4:17 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > On Thu, Jun 25, 2020 at 5:35 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > >
> > > > > > On Thu, Jun 25, 2020 at 1:58 PM Shawn Guo <shawnguo@kernel.org> wrote:
> > > > > > >
> > > > > > > From: Shawn Guo <shawn.guo@linaro.org>
> > > > > > >
> > > > > > > The msm/mdp5 driver uses drm_private_obj as its global atomic state,
> > > > > > > which keeps the assignment of hwpipe to plane.  With drm_private_obj
> > > > > > > missing from duplicate state call, mdp5 suspend works with no problem
> > > > > > > only for the very first time.  Any subsequent suspend will hit the
> > > > > > > following warning, because hwpipe assignment doesn't get duplicated for
> > > > > > > suspend state.  Adding drm_private_obj handling for duplicate state call
> > > > > > > fixes the problem.
> > > > > >
> > > > > > If the driver needs a private state, it's supposed to duplicate that
> > > > > > in its atomic_check functionality. This isn't the helper's job.
> > > > > >
> > > > > > If this is a bug in msm code, then pretty sure if you try hard enough,
> > > > > > you can hit the exact same bug from userspace too. Maybe good idea to
> > > > > > try and reproduce this with igt or something.
> > > > >
> > > > > The problem is how duplicate_state is used by the atomic
> > > > > suspend/resume helpers.  They duplicate the running state on suspend,
> > > > > forgetting to duplicate the global state.  Then everything is
> > > > > disabled, the driver correctly duplicates and updates it's global
> > > > > atomic state releasing the hwpipe.
> > > > >
> > > > > But then on resume, we are re-applying plane state that thinks it
> > > > > already has a hwpipe assigned (because that is part of the plane state
> > > > > that was duplicated), without reapplying the matching global state.
> > > > >
> > > > > On a normal atomic commit, we would duplicate the plane state that has
> > > > > the hwpipe disabled, which would be in sync with the drivers global
> > > > > state.  But since that is not what the atomic resume helper does, we
> > > > > hit the situation where the plane state and the global state are out
> > > > > of sync.
> > > > >
> > > > > So the driver is dtrt, the problem really is with the helpers.  I
> > > > > think this patch is the right thing to do.  It is incorrect for the
> > > > > suspend/resume helpers to assume that they can re-apply duplicated
> > > > > state without including the global state.
> > > >
> > > > Hm, this is a bit awkward. Generally the assumption is that you should
> > > > be recomputing the derived state (like hwpipe) no matter what. If your
> > > > driver doesn't do that, then all kinds of things can leak from the
> > > > pre-resume to the post-resume side of things, that's kinda why I'm not
> > > > thrilled with this patch, I think it has good potential to open up a
> > > > can of worms. Iirc this patch has come up in the past, and in those
> > > > cases it was a driver bug.
> > > >
> > > > For this case, why is msm reusing a hw pipe assignment of a disabled plane?
> > >
> > > Because it is part of the plane state that is being restored.
> > >
> > > Since resume uses the old state saved before the
> > > drm_atomic_helper_disable_all(), rather than duplicating the current
> > > state, we end up with this mismatch between global and plane state.  I
> > > think stashing away the old state is probably ok, but we can't just do
> > > it piecemeal without including the global state.
> > >
> > > I suppose part of the problem is the hwpipe (and other such
> > > dynamically assigned resources) touch both private and plane (and
> > > crtc) state.  The global state object knows which resources are
> > > assigned to which plane/crtc.  But the plane/crtc state knows which of
> > > the (potentially) two hwpipe/mixers is "left" (primary) and "right"
> > > (secondary).
> >
> > Yeah I get all that, what I meant is: Why don't you just blindly recompute
> > the hwpipe assignment every time a full modeset is done? Caching it for
> > pure plane flips makes sense, but drm_crtc_needs_modset == true and just
> > throw it all overboard and assign new ones I think would also solve this
> > problem. Since the hwpipe global state would indicate that all pipes are
> > unallocated that should work (I hope).
> >
> > Imo just recomputing state is a good atomic pattern, it avoids drivers
> > getting stuck in a corner somewhere you can't reset them out of anymore.
> >
> > My question here was, why can't you do that?
> 
> We do release the hwpipe on disable, and that is where things are
> getting out of sync.
> 
> I suppose we could do some hack if needs_modeset and walk thru the
> global state to detect that we've got ourselves into this condition
> and the hwpipe(s) the plane *thinks* it has assigned to itself are no
> more.  That sounds like a worse solution.
> 
> (note that hwpipe can change for a lot of reasons other than modeset)
> 
> 
> >
> > > > Unfortunately we can't copy the drm state into the overall structure
> > > > to solve this, since that would miss driver-private properties. So
> > > > unfortunately we can't make this match a real atomic commit from
> > > > userspace perfectly.
> > >
> > > I'm not sure I understand this?  The driver private properties
> > > would/should be part of one of the state objs (plane/crtc/global)?  If
> > > the atomic state (including global) represents the entirety of the hw
> > > state, you should be able to stash off N different versions of them
> > > and re-apply them in any order you want because they are all
> > > self-consistent.
> >
> > So for normal atomic commit we have:
> >
> > 1. duplicate current state
> > 2. set properties
> >
> > But for resume helpers it's some random older state, so the expectations
> > break a bit. We could approximate that using something like:
> >
> > 1. duplicate current state into curr_state
> > 2. set properties using a memcpy of the drm core state structure, leaving
> > the driver private stuff as-is.
> >
> > But a) there's also some non-property state in drm state structures and b)
> > properties which are driver extensions and set into the driver part of the
> > state would get lost.
> >
> > So also not great.
> 
> Really the solution in this patch sounds like the cleanest solution
> (assuming drivers are properly keeping all their state in various
> atomic-state objs) ;-)
> 
> But replaying all the kms property setting should in theory arrive at
> the same state as before the suspend.  But that sounds like the harder
> way to do it.
> 
> >
> > > > Another option would be if msm just copies the private state it needs
> > > > to not go boom.
> > > >
> > > > Doing this unconditionally might break other drivers that rely on
> > > > private state not being duplicated, but I guess that would also be
> > > > somewhat of a driver bug.
> > >
> > > I guess we could duplicate our own version of
> > > drm_atomic_helper_suspend().. or maybe add a 'duplicate_global' param
> > > to drm_atomic_helper_suspend().
> > >
> > > I'm not too sure how many drivers these days are using global atomic
> > > state, so not sure how many would be potentially broken, but opting in
> > > to duplicating global state seems reasonable if necessary.
> >
> > dp mst uses it to track it's stuff at least, and I think it's spreading
> > quite a bit into drivers using them to track all kinds of things, not just
> > a single global state.
> 
> Hmm, if needed we could put a needs_restore flag in the private_state struct?

drm_private_obj, not the state, since this should be invariant. And I
think this is the cleanest solution of them all. Also gives us a nice
place for some kerneldoc with links to suspend/resume helpers and why you
might need this.
-Daniel

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
> > > > -Daniel
> > > >
> > > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > -Daniel
> > > > > >
> > > > > >
> > > > > > > $ echo mem > /sys/power/state
> > > > > > > [   38.111144] PM: suspend entry (deep)
> > > > > > > [   38.111185] PM: Syncing filesystems ... done.
> > > > > > > [   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
> > > > > > > [   38.115912] OOM killer disabled.
> > > > > > > [   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > > > > > [   38.122170] ------------[ cut here ]------------
> > > > > > > [   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
> > > > > > > [   38.122215] Modules linked in:
> > > > > > > [   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
> > > > > > > [   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
> > > > > > > [   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
> > > > > > > [   38.122230] pc : mdp5_pipe_release+0x90/0xc0
> > > > > > > [   38.122233] lr : mdp5_pipe_release+0x90/0xc0
> > > > > > > [   38.122235] sp : ffff00000d13b7f0
> > > > > > > [   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
> > > > > > > [   38.122240] x27: 0000000000000002 x26: ffff800079adce00
> > > > > > > [   38.122243] x25: ffff800079405200 x24: 0000000000000000
> > > > > > > [   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
> > > > > > > [   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
> > > > > > > [   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
> > > > > > > [   38.122255] x17: 0000000000000000 x16: 0000000000000000
> > > > > > > [   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
> > > > > > > [   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
> > > > > > > [   38.122264] x11: 0000000000000000 x10: ffff000008cda000
> > > > > > > [   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
> > > > > > > [   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
> > > > > > > [   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
> > > > > > > [   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
> > > > > > > [   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
> > > > > > > [   38.122281] Call trace:
> > > > > > > [   38.122285]  mdp5_pipe_release+0x90/0xc0
> > > > > > > [   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
> > > > > > > [   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
> > > > > > > [   38.122298]  drm_atomic_helper_check+0x38/0xa8
> > > > > > > [   38.122302]  drm_atomic_check_only+0x3e8/0x630
> > > > > > > [   38.122305]  drm_atomic_commit+0x18/0x58
> > > > > > > [   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
> > > > > > > [   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
> > > > > > > [   38.122316]  msm_pm_suspend+0x4c/0x70
> > > > > > > [   38.122320]  dpm_run_callback.isra.6+0x20/0x68
> > > > > > > [   38.122323]  __device_suspend+0x110/0x308
> > > > > > > [   38.122326]  dpm_suspend+0x100/0x1f0
> > > > > > > [   38.122329]  dpm_suspend_start+0x64/0x70
> > > > > > > [   38.122334]  suspend_devices_and_enter+0x110/0x500
> > > > > > > [   38.122336]  pm_suspend+0x268/0x2c0
> > > > > > > [   38.122339]  state_store+0x88/0x110
> > > > > > > [   38.122345]  kobj_attr_store+0x14/0x28
> > > > > > > [   38.122352]  sysfs_kf_write+0x3c/0x50
> > > > > > > [   38.122355]  kernfs_fop_write+0x118/0x1e0
> > > > > > > [   38.122360]  __vfs_write+0x30/0x168
> > > > > > > [   38.122363]  vfs_write+0xa4/0x1a8
> > > > > > > [   38.122366]  ksys_write+0x64/0xe8
> > > > > > > [   38.122368]  __arm64_sys_write+0x18/0x20
> > > > > > > [   38.122374]  el0_svc_common+0x6c/0x178
> > > > > > > [   38.122377]  el0_svc_compat_handler+0x1c/0x28
> > > > > > > [   38.122381]  el0_svc_compat+0x8/0x18
> > > > > > > [   38.122383] ---[ end trace 24145b7d8545345b ]---
> > > > > > > [   38.491552] Disabling non-boot CPUs ...
> > > > > > >
> > > > > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
> > > > > > >  1 file changed, 16 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > index 85d163f16801..024985a92156 100644
> > > > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > @@ -3140,6 +3140,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > > > > > >         struct drm_atomic_state *state;
> > > > > > >         struct drm_connector *conn;
> > > > > > >         struct drm_connector_list_iter conn_iter;
> > > > > > > +       struct drm_private_obj *priv_obj;
> > > > > > >         struct drm_plane *plane;
> > > > > > >         struct drm_crtc *crtc;
> > > > > > >         int err = 0;
> > > > > > > @@ -3184,6 +3185,16 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
> > > > > > >         }
> > > > > > >         drm_connector_list_iter_end(&conn_iter);
> > > > > > >
> > > > > > > +       drm_for_each_privobj(priv_obj, dev) {
> > > > > > > +               struct drm_private_state *priv_state;
> > > > > > > +
> > > > > > > +               priv_state = drm_atomic_get_private_obj_state(state, priv_obj);
> > > > > > > +               if (IS_ERR(priv_state)) {
> > > > > > > +                       err = PTR_ERR(priv_state);
> > > > > > > +                       goto free;
> > > > > > > +               }
> > > > > > > +       }
> > > > > > > +
> > > > > > >         /* clear the acquire context so that it isn't accidentally reused */
> > > > > > >         state->acquire_ctx = NULL;
> > > > > > >
> > > > > > > @@ -3278,6 +3289,8 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > > > > > >         struct drm_connector_state *new_conn_state;
> > > > > > >         struct drm_crtc *crtc;
> > > > > > >         struct drm_crtc_state *new_crtc_state;
> > > > > > > +       struct drm_private_state *new_priv_state;
> > > > > > > +       struct drm_private_obj *priv_obj;
> > > > > > >
> > > > > > >         state->acquire_ctx = ctx;
> > > > > > >
> > > > > > > @@ -3290,6 +3303,9 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
> > > > > > >         for_each_new_connector_in_state(state, connector, new_conn_state, i)
> > > > > > >                 state->connectors[i].old_state = connector->state;
> > > > > > >
> > > > > > > +       for_each_new_private_obj_in_state(state, priv_obj, new_priv_state, i)
> > > > > > > +               state->private_objs[i].old_state = priv_obj->state;
> > > > > > > +
> > > > > > >         ret = drm_atomic_commit(state);
> > > > > > >
> > > > > > >         state->acquire_ctx = NULL;
> > > > > > > --
> > > > > > > 2.17.1
> > > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

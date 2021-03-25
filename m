Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895A93487FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 05:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhCYEjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 00:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhCYEjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 00:39:16 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F6CC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 21:39:14 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso397975pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 21:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=lqtjDfDMRVrpsCVybPd2ASGnB4nenRyEa0GnMoEEPwY=;
        b=b5jMeiV+ocRjjNz5omI21Ydi/8N5u+2EQ2NfpVZXwQVBsmXzn1PzgxlQ0hDT7vJbXv
         G62/4zcvb8CKiJIbAzIppqFu6rSJTbgJXElWUg6fBBjnffhHdqbvqss+t1ToOrZs2cqm
         v5rmgR0zZNs2/1AUY0zKSfKajVNbnHAshggOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=lqtjDfDMRVrpsCVybPd2ASGnB4nenRyEa0GnMoEEPwY=;
        b=KpTiJp32MHhdKb2LhFTYLpA5kHzhpp7yJRVVYX/kROBwzEWkc+sltLuXG6Yw//UjaC
         6njNs4TAh9E/uhXsnzf7PhZZ2fIdAWu4a2G0AE1Ec7nrYZrREPNxlGEF+NvmOrLXAbUm
         Dbw2B1LdrzcX58dWvEW3IwPYqGVLEgUWgDk/xTGSEogZBcutZPPazarNKWSxDeenRZjG
         Y73Qme1za80yLF//i1RetKySk+4Cynn+/2Z+JM9kvOEssl7Tc0WXgF0O/vukIK8rCJrN
         +XwJEfxsELiNKtlzdrpWfzInIdp/IYbcV4KPpDyhWAdk/WsJefK4SiDCCwrMAYwAovCH
         jzjA==
X-Gm-Message-State: AOAM533zWdiOC3t5QqaJUvXizPFFiQo1SKAFZ0tPJJUNte0ty9t/NKOz
        9pleqY+jVH8hbvHc8gHYVh8Ubg==
X-Google-Smtp-Source: ABdhPJycAkp6+8nMtAx+aLtk0wJ9huxG4982NBY/lWZC+yW47viKbLHWAYy7tBkt6DpjDE8D1OZXKA==
X-Received: by 2002:a17:90a:5103:: with SMTP id t3mr7021407pjh.68.1616647153731;
        Wed, 24 Mar 2021 21:39:13 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:84ac:62f7:16a8:ccc7])
        by smtp.gmail.com with ESMTPSA id h6sm4291699pfb.157.2021.03.24.21.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 21:39:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGsRKPn-pLtP8dmG+_VSH1TbyaW10HHtaOT10Xc3D+DMTg@mail.gmail.com>
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org> <161663694524.3012082.11889553997747135632@swboyd.mtv.corp.google.com> <CAF6AEGsRKPn-pLtP8dmG+_VSH1TbyaW10HHtaOT10Xc3D+DMTg@mail.gmail.com>
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components failed to bind
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
To:     Rob Clark <robdclark@gmail.com>
Date:   Wed, 24 Mar 2021 21:39:11 -0700
Message-ID: <161664715135.3012082.16581922607390567861@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-03-24 20:09:37)
> On Wed, Mar 24, 2021 at 6:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2021-03-18 13:05:44)
> > > if GPU components have failed to bind, shutdown callback would fail w=
ith
> > > the following backtrace. Add safeguard check to stop that oops from
> > > happening and allow the board to reboot.
> > [...]
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_=
drv.c
> > > index 94525ac76d4e..fd2ac54caf9f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -1311,6 +1311,10 @@ static int msm_pdev_remove(struct platform_dev=
ice *pdev)
> > >  static void msm_pdev_shutdown(struct platform_device *pdev)
> > >  {
> > >         struct drm_device *drm =3D platform_get_drvdata(pdev);
> > > +       struct msm_drm_private *priv =3D drm ? drm->dev_private : NUL=
L;
> > > +
> > > +       if (!priv || !priv->kms)
> > > +               return;
> > >
> >
> > I see a problem where if I don't get a backlight probing then my
> > graphics card doesn't appear but this driver is still bound. I was
> > hoping this patch would fix it but it doesn't. I have slab poisoning
> > enabled so sometimes the 'priv' pointer is 0x6b6b6b6b6b6b6b6b meaning it
> > got all freed.
> >
> > I found that the 'drm' pointer here is pointing at junk. The
> > msm_drm_init() function calls drm_dev_put() on the error path and that
> > will destroy the drm pointer but it doesn't update this platform drivers
> > drvdata. Do we need another patch that sets the drvdata to NULL on
> > msm_drm_init() failing? One last note, I'm seeing this on 5.4 so maybe I
> > missed something and the drvdata has been set to NULL somewhere else
> > upstream. I sort of doubt it though.
>=20
> the hw that I guess you are running on should work pretty well w/
> upstream kernel.. but I don't think there is any important delta
> between upstream and the 5.4 based kernel that you are running that
> would fix this..
>=20
> so *probably* you are right..

linux-next is failing like this today for me on Lazor right after the
screen turns on. I'll have to figure out what's wrong before checking
upstream.

[   10.734752] Unable to handle kernel NULL pointer dereference at virtual =
address 0000000000000080
[   10.744482] Mem abort info:
[   10.747462]   ESR =3D 0x96000006
[   10.750644]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   10.756125]   SET =3D 0, FnV =3D 0
[   10.759290]   EA =3D 0, S1PTW =3D 0
[   10.762543] Data abort info:
[   10.765519]   ISV =3D 0, ISS =3D 0x00000006
[   10.769485]   CM =3D 0, WnR =3D 0
[   10.772553] user pgtable: 4k pages, 39-bit VAs, pgdp=3D0000000123474000
[   10.779212] [0000000000000080] pgd=3D0800000123475003, p4d=3D08000001234=
75003, pud=3D0800000123475003, pmd=3D0000000000000000
[   10.790128] Internal error: Oops: 96000006 [#1] PREEMPT SMP
[   10.795856] Modules linked in: ath10k_snoc qmi_helpers ath10k_core ath m=
ac80211 cfg80211 r8152 mii joydev
[   10.805705] CPU: 5 PID: 1576 Comm: DrmThread Not tainted 5.12.0-rc4-next=
-20210324+ #13
[   10.813832] Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
[   10.820535] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=3D--)
[   10.826703] pc : dpu_plane_atomic_update+0x80/0xcb8
[   10.831730] lr : dpu_plane_restore+0x5c/0x88
[   10.836117] sp : ffffffc012963920
[   10.839521] x29: ffffffc0129639c0 x28: ffffffed5c9ad000=20
[   10.844979] x27: ffffffed5c736000 x26: ffffffed5ca3f000=20
[   10.850443] x25: ffffffed5c736000 x24: 0000000000000000=20
[   10.855903] x23: 0000000000000000 x22: ffffff80ad007400=20
[   10.861361] x21: ffffff8085193808 x20: 0000000000000000=20
[   10.866818] x19: ffffff8085193800 x18: 0000000000000008=20
[   10.872274] x17: 0000000000800000 x16: 0000000020000000=20
[   10.877738] x15: 0000000000000001 x14: 0000000000000000=20
[   10.883201] x13: ffffff80852324a8 x12: 0000000000000008=20
[   10.888657] x11: ffffffed5c3b7890 x10: 0000000000000000=20
[   10.894112] x9 : 0000000000000000 x8 : 0000000000000000=20
[   10.899570] x7 : 0000000000004000 x6 : 0000000000010000=20
[   10.905026] x5 : 0000000000040000 x4 : 0000000000000800=20
[   10.910482] x3 : 0000000000000000 x2 : 0000000000020041=20
[   10.915946] x1 : ffffff80ad2e2600 x0 : ffffff8085193800=20
[   10.921402] Call trace:
[   10.923923]  dpu_plane_atomic_update+0x80/0xcb8
[   10.928585]  dpu_plane_restore+0x5c/0x88
[   10.932620]  dpu_crtc_atomic_flush+0xd4/0x1a0
[   10.937105]  drm_atomic_helper_commit_planes+0x1b4/0x1e0
[   10.942565]  msm_atomic_commit_tail+0x2d4/0x670
[   10.947223]  commit_tail+0xac/0x148
[   10.950814]  drm_atomic_helper_commit+0x104/0x10c
[   10.955653]  drm_atomic_commit+0x58/0x68
[   10.959686]  drm_mode_atomic_ioctl+0x438/0x51c
[   10.964261]  drm_ioctl_kernel+0xa8/0x124
[   10.968295]  drm_ioctl+0x24c/0x3ec
[   10.971800]  drm_compat_ioctl+0xe0/0xf4
[   10.975745]  __arm64_compat_sys_ioctl+0xcc/0x104
[   10.980499]  el0_svc_common+0xa4/0x128
[   10.984358]  do_el0_svc_compat+0x2c/0x38
[   10.988395]  el0_svc_compat+0x20/0x30
[   10.992164]  el0_sync_compat_handler+0xc0/0xf0
[   10.996734]  el0_sync_compat+0x174/0x180
[   11.000774] Code: d0003d61 91204821 52800020 97fe8c65 (39420288)

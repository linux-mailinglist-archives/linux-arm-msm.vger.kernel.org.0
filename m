Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C62136FEC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 18:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhD3Ql7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 12:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhD3Ql6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 12:41:58 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D5FC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 09:41:10 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id k128so38176831wmk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 09:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h+66Oy7mxBKGptVihwlH/Hzh5J+HBgYn12rtWa1Ht0A=;
        b=PqCRxE4z2J6Gxe2o5wLtD7XsGXFIDrhrwG8QUMG+W65O4kyQS/QL+O/am+Slg30EdP
         SITspIKf39zHcrHs2SrXZo/rLD0JuH/ER683QRe8u0wKXXmKPJfrkvpiIOP0yhyxF1Rq
         KDOcYDFioJfC24JiJZnixKcd6RQU3GG/PrRttmTMjkUYo7spD8YHTF8rtQx7Zb5GdOTI
         F8M608bqJ+Lry8RiXzekwiFlictmLwEPULWF6/7HfwX66xnvF5aqCJqVOaxXt8OsiYsa
         KUIbb2gu5gDIGrpDkWzX9yZdb6HBiO0OUV1ghjudRpkf9zEl3rYrmGRRnlunYzrDXALm
         QOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h+66Oy7mxBKGptVihwlH/Hzh5J+HBgYn12rtWa1Ht0A=;
        b=Jc8tIIb+3QnNKNEpWtCrwL8B6qWYLKvX8mBkumWpYinS6bnYbUkemVxGewiz2/PgP4
         PeuwzBIXNmoJihILYWEKqTOkIpW2IbiSUfYEgHE/rHXeNpycmv63B+1rO0e7T5N6pgSg
         MOrciD5O24MbWYJHLckCIlwTYTpm552LSTA05JQTaT5yhVE9aAgFx9P/PaTkofY4xkvI
         ZSEaPEEwMi/uVIyvwaFxr7pt9I8BB0gs0b16cU5dJqIBQBLhK6q3e363DLiF3tbvrXH+
         cmeqmkBe5sOFQ/HpYvyqzHoOX5OFSyQP4wTF4oB9JIlD/x7fZTVCDazHWbL8HK4F2Vw+
         Szbw==
X-Gm-Message-State: AOAM530YKmOEvqFjtV5Px4Vteh1TFC4VLOM7W0qyVsAs9Lzudyd5u+OG
        2wJAGPA48erEWpQSabY1mv3qaP6IUna+4bJS2Ho=
X-Google-Smtp-Source: ABdhPJzuM15/s48Jb4zLa/ps0CebYG1fOZQlAO51W1eewyuyKGBWzav8rGTilyAHFuRfwqs1tZN2m9sfK7cECRBS+a0=
X-Received: by 2002:a05:600c:4e8c:: with SMTP id f12mr17505549wmq.123.1619800869137;
 Fri, 30 Apr 2021 09:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210219120032.260676-1-maxime@cerno.tech> <20210219120032.260676-10-maxime@cerno.tech>
 <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com>
 <20210330153527.gw33t4o2b35wwzbg@gilmour> <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
 <20210408132048.gifhgtkmoeuplhcz@gilmour>
In-Reply-To: <20210408132048.gifhgtkmoeuplhcz@gilmour>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 30 Apr 2021 09:44:42 -0700
Message-ID: <CAF6AEGt8t78WLt=GQ1PFANtOC2thoYiTj7kCrh4cTr+CVH68eQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane state pointer
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 8, 2021 at 6:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Stephen,
>
> On Tue, Mar 30, 2021 at 11:56:15AM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2021-03-30 08:35:27)
> > > Hi Stephen,
> > >
> > > On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> > > > Trimming Cc list way down, sorry if that's too much.
> > > >
> > > > Quoting Maxime Ripard (2021-02-19 04:00:30)
> > > > > Many drivers reference the plane->state pointer in order to get the
> > > > > current plane state in their atomic_update or atomic_disable hooks,
> > > > > which would be the new plane state in the global atomic state since
> > > > > _swap_state happened when those hooks are run.
> > > >
> > > > Does this mean drm_atomic_helper_swap_state()?
> > >
> > > Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
> > > the state currently programmed in the hardware, so the old state (that's
> > > the case you have with atomic_check for example)
> > >
> > > Once drm_atomic_helper_swap_state has run, plane->state is now the state
> > > that needs to be programmed into the hardware, so the new state.
> >
> > Ok, and I suppose that is called by drm_atomic_helper_commit()?
>
> Yep :)
>
> > So presumably a modeset is causing this? I get the NULL pointer around
> > the time we switch from the splash screen to the login screen. I think
> > there's a modeset during that transition.
>
> It's very likely yeah. I really don't get how that pointer could be null
> though :/

So I think I see what is going on.. the issue is the CRTC has changed,
but not the plane, so there is no new-state for the plane.

But dpu_crtc_atomic_flush() iterates over all the attached planes,
calling dpu_plane_restore() which leads into
dpu_plane_atomic_update().. this is kinda dpu breaking the rules..

BR,
-R

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1730530E558
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 22:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhBCV6t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 16:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbhBCV6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 16:58:47 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3547C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 13:58:31 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id i63so712532pfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 13:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:to:date:message-id:user-agent;
        bh=NZyBJaM1wJYJrM3N9nWdphIUZzNaZF7K0cw+Alsw60s=;
        b=YuOUTknzG6QCCWY+6/9xwyK6R03ljdXy/eo0oFI/N+6GwosnDa5CyqQSfRHomVRq5Y
         /QU7kuuwvyKHdo8lw5/0kfKeynARxii+bcfHMWHLjs9pAUBAC1hEJdjvZFQ4lTU08YcK
         JPPSVfydjzgAxHpwSzs/Slc3zbOWlaxSXZv/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:to:date:message-id:user-agent;
        bh=NZyBJaM1wJYJrM3N9nWdphIUZzNaZF7K0cw+Alsw60s=;
        b=aRSLowMRVbFhI1pU3mvSqSBcC11CFCTjk6du9kxOAz+xy7TiO7X3/o1eKKN1DwE6Eu
         Mnmcaj3Gw2+DaVEh/RaKiaD4XRfQFaD41sWSOsU+Lvp8XKcyx88E4OlfbB+vD4zNo8ie
         mCoslcvsV3Q6XXQdmt9bMgJYM/v4+NuYGQ4OQQFOIggfzm1VuKviJEeq1Hz7ZZXBENCg
         y7vXX/SqAuuI/UR8lXHKjrBuIwIjUZ3jsQsE5h9maOTsZlpme8xO9LjVWv9g9kjAcijf
         SIZs8RLECh9ufqCMWJEuG1jnOXRkNYUMvLFY6pEcBnNCABI3k6/dgwRMDJmxOuyEcBaG
         3vRw==
X-Gm-Message-State: AOAM532qIUkWYqOLaKnJojVpDhCmQ4kdaKF9rXMhzoVjtJpPsEB3M7yu
        zk1IPSwpZIsjMYLVVSYG+DlYZQ==
X-Google-Smtp-Source: ABdhPJzk7PmvKQQrV2P9s6wrj8xy2r8VnWspZmZ4jUzlRnhKwjl19rpVf2Q70wAcSJtijokb8iTr1w==
X-Received: by 2002:a65:6207:: with SMTP id d7mr6025724pgv.92.1612389511562;
        Wed, 03 Feb 2021 13:58:31 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3571:bd6e:ee19:b59f])
        by smtp.gmail.com with ESMTPSA id o20sm3953813pgn.6.2021.02.03.13.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 13:58:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
References: <20210125234901.2730699-1-swboyd@chromium.org> <YBlz8Go2DseRWuOa@phenom.ffwll.local> <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com> <YBp2h2cVXrF6lBno@phenom.ffwll.local> <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
From:   Stephen Boyd <swboyd@chromium.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date:   Wed, 03 Feb 2021 13:58:28 -0800
Message-ID: <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-02-03 09:29:09)
> On Wed, Feb 3, 2021 at 2:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> > > On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > > > This is because lockdep thinks all the locks taken in lock_crtcs(=
) are
> > > > > the same lock, when they actually aren't. That's because we call
> > > > > mutex_init() in msm_kms_init() and that assigns on static key for=
 every
> > > > > lock initialized in this loop. Let's allocate a dynamic number of
> > > > > lock_class_keys and assign them to each lock so that lockdep can =
figure
> > > > > out an AA deadlock isn't possible here.
> > > > >
> > > > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver w=
ith async layer updates")
> > > > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > >
> > > > This smells like throwing more bad after initial bad code ...
> > > >
> > > > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives=
.html
> >
> > Some technical on the patch itself: I think you want
> > mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locki=
ng
> > classes hand-rolled. It's defacto the same, but much more obviously
> > correct since self-documenting.
>=20
> hmm, yeah, that is a bit cleaner.. but this patch is already on
> msm-next, maybe I'll add a patch on top to change it

How many CRTCs are there? The subclass number tops out at 8, per
MAX_LOCKDEP_SUBCLASSES so if we have more than that many bits possible
then it will fail.

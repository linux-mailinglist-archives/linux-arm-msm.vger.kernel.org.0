Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B069434F14A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 20:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232952AbhC3S4o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 14:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232933AbhC3S4S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 14:56:18 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B8BFC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 11:56:18 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id t20so6638287plr.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 11:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=A1Cm9DKwzI8CvORdDIEy1/TIc9c8R+sdsGDmBgQsdac=;
        b=bmpKFJU8/TpETST1kxi1bOPIfxziXa9chsB5tnTM+0YDM/puKEhUGNgzKasiHR/al8
         f6JJuCL4TJ5Uc823xq+xSgwBzRniXNw7aCv2lWnJF02QEKfZMNPLcSMK7E1SbJqmvsC/
         075H8wWeQG61RXZBG1R7XQ1jPgXIChh6ZKIHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=A1Cm9DKwzI8CvORdDIEy1/TIc9c8R+sdsGDmBgQsdac=;
        b=VPcHDm8vJIxfgRMeOlCxXyfTOAH8JEtru83H1LQC6KM8yM0FErpJBFem4tCPzuao4Z
         7/QDgGbNnAf1Njkozh+7H0fnSdo6wEDPr5TL/rfA1TPGkU7Rk3FwpsZgETohASW0jyS6
         V6LaxAfymiZAyghiEf37hfAAB2VGWIaPJ9qO1fmQb/irXCzAqouKDAog/duWptHkh15K
         I95J1jiz3u0VVJO56B0AQg3RBLdVIXF6ZQqIdl7Qr0um8zLViR3JtprpztCX09dxKNjW
         E9ohj1gkHiF8Xe4iOaXedBtlXOeakSan5e8Qmn7FxZ7HMWtFUiotJfCnIf1OFz6J9awg
         OXFA==
X-Gm-Message-State: AOAM533sMw6UdEJGA+GSqJpQTBPH/8XJqBFfQDpnK5Nyddi6Vw/ejSRs
        dgcl10TnzPDtwGDYwr7+SDTjsw==
X-Google-Smtp-Source: ABdhPJx6ssFA3V35D5q1Icohe6M7TsyX+5kBYa9lFs9XO/Eaik1VuChmrs8OYk5LP8unOTL2xOnZqg==
X-Received: by 2002:a17:90a:a618:: with SMTP id c24mr5718708pjq.108.1617130577746;
        Tue, 30 Mar 2021 11:56:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:c8c2:b814:df0f:253f])
        by smtp.gmail.com with ESMTPSA id x4sm20545016pfn.134.2021.03.30.11.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:56:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210330153527.gw33t4o2b35wwzbg@gilmour>
References: <20210219120032.260676-1-maxime@cerno.tech> <20210219120032.260676-10-maxime@cerno.tech> <161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com> <20210330153527.gw33t4o2b35wwzbg@gilmour>
Subject: Re: [PATCH v3 10/11] drm: Use state helper instead of the plane state pointer
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 30 Mar 2021 11:56:15 -0700
Message-ID: <161713057558.2260335.5422873422021430866@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maxime Ripard (2021-03-30 08:35:27)
> Hi Stephen,
>=20
> On Mon, Mar 29, 2021 at 06:52:01PM -0700, Stephen Boyd wrote:
> > Trimming Cc list way down, sorry if that's too much.
> >=20
> > Quoting Maxime Ripard (2021-02-19 04:00:30)
> > > Many drivers reference the plane->state pointer in order to get the
> > > current plane state in their atomic_update or atomic_disable hooks,
> > > which would be the new plane state in the global atomic state since
> > > _swap_state happened when those hooks are run.
> >=20
> > Does this mean drm_atomic_helper_swap_state()?
>=20
> Yep. Previous to that call in drm_atomic_helper_commit, plane->state is
> the state currently programmed in the hardware, so the old state (that's
> the case you have with atomic_check for example)
>=20
> Once drm_atomic_helper_swap_state has run, plane->state is now the state
> that needs to be programmed into the hardware, so the new state.

Ok, and I suppose that is called by drm_atomic_helper_commit()? So
presumably a modeset is causing this? I get the NULL pointer around the
time we switch from the splash screen to the login screen. I think
there's a modeset during that transition.

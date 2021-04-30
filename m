Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F8E36FFD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 19:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhD3Rpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 13:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbhD3Rpn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 13:45:43 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2181AC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 10:44:55 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id w6-20020a4a9d060000b02901f9175244e7so3569993ooj.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6g0Wub32949zlUmpDO6orwMigbfoDepmWih+zxo6Gik=;
        b=Hwdg91N23Pzm+MhntYiriTtK3LzxwTdtud93fhi+6PsD2MGghl+QzB5fD/KE4E/UOH
         rA+vVIVjaVzTOFbRvMMXkHYiDCWmryuId1VhGqaeOkuCUsxD1zdaAp83XrllM50f554B
         YII/rfNuz5fJX4CecLZUPgYKNcAoSrTUw9Yg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6g0Wub32949zlUmpDO6orwMigbfoDepmWih+zxo6Gik=;
        b=Zw+pbsavXInTZk2k9CsJ20PNnPmOUHvTKIPxPBpfyZ3feRo0aU5fAPgU5ajYGOsG0r
         /pcO0DiBBCtKahDEenirVMbF9agPRiou9MNaI2kh9NI6FPDdHml3jAb4nmO0qOftzhb4
         RYfvwPtiHioD6Wr72Qbf66LY1NZ7jRCLr+uFaYJmCyRL2CJi300LsHJpizJL51QtbuAN
         +P1HJX9qVHcPJncTpEN5cjfkjZoTz0RfGIGWljqFY/lwMCvTvfDmGtbK6Ak1XoHyvjAi
         cHWo/ryw7WHpuRAu9wLjetNuI64KTzIOQqPP4jxqrEpNJuFBe3uy6WdLW7xJuENBs0TX
         n1dQ==
X-Gm-Message-State: AOAM5317fZxysxKtDL9x7hXcSuPApr8IBzJ1SEz9OTWxDlRXzwbJzHR2
        Vm2xm1J0YGPiJcCiK5/PoI8Qgjh0MmAZDgG+q2URCTjGTB8=
X-Google-Smtp-Source: ABdhPJyPyi4DIgMeRBNFsN/86pplbHjCV4+mrcMiD+kOFc0aF1HRvCFr6LF5hBxDNhe7lCnbhKeHNkeCcL52ICW+GsQ=
X-Received: by 2002:a05:6820:381:: with SMTP id r1mr5451224ooj.79.1619804694545;
 Fri, 30 Apr 2021 10:44:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Apr 2021 10:44:54 -0700
MIME-Version: 1.0
In-Reply-To: <20210430171744.1721408-1-robdclark@gmail.com>
References: <20210430171744.1721408-1-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 30 Apr 2021 10:44:53 -0700
Message-ID: <CAE-0n513cwqs1c89PZpn0ojuDQ44nwxbRfaYssKHcGwKxK8JdA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Delete bonkers code
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Rob Clark <robdclark@chromium.org>,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Hongbo Yao <yaohongbo@huawei.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2021-04-30 10:17:39)
> From: Rob Clark <robdclark@chromium.org>
>
> dpu_crtc_atomic_flush() was directly poking it's attached planes in a
> code path that ended up in dpu_plane_atomic_update(), even if the plane
> was not involved in the current atomic update.  While a bit dubious,
> this worked before because plane->state would always point to something
> valid.  But now using drm_atomic_get_new_plane_state() we could get a
> NULL state pointer instead, leading to:
>
>    [   20.873273] Call trace:
>    [   20.875740]  dpu_plane_atomic_update+0x5c/0xed0
>    [   20.880311]  dpu_plane_restore+0x40/0x88
>    [   20.884266]  dpu_crtc_atomic_flush+0xf4/0x208
>    [   20.888660]  drm_atomic_helper_commit_planes+0x150/0x238
>    [   20.894014]  msm_atomic_commit_tail+0x1d4/0x7a0
>    [   20.898579]  commit_tail+0xa4/0x168
>    [   20.902102]  drm_atomic_helper_commit+0x164/0x178
>    [   20.906841]  drm_atomic_commit+0x54/0x60
>    [   20.910798]  drm_atomic_connector_commit_dpms+0x10c/0x118
>    [   20.916236]  drm_mode_obj_set_property_ioctl+0x1e4/0x440
>    [   20.921588]  drm_connector_property_set_ioctl+0x60/0x88
>    [   20.926852]  drm_ioctl_kernel+0xd0/0x120
>    [   20.930807]  drm_ioctl+0x21c/0x478
>    [   20.934235]  __arm64_sys_ioctl+0xa8/0xe0
>    [   20.938193]  invoke_syscall+0x64/0x130
>    [   20.941977]  el0_svc_common.constprop.3+0x5c/0xe0
>    [   20.946716]  do_el0_svc+0x80/0xa0
>    [   20.950058]  el0_svc+0x20/0x30
>    [   20.953145]  el0_sync_handler+0x88/0xb0
>    [   20.957014]  el0_sync+0x13c/0x140
>
> The reason for the codepath seems dubious, the atomic suspend/resume
> heplers should handle the power-collapse case.  If not, the CRTC's
> atomic_check() should be adding the planes to the atomic update.
>
> Reported-by: Stephen Boyd <sboyd@kernel.org>

Maybe better to use swboyd@chromium.org for this one.

> Reported-by: John Stultz <john.stultz@linaro.org>
> Fixes: 37418bf14c13 drm: Use state helper instead of the plane state pointer

Should be

Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")

to match the preferred format.

> Signed-off-by: Rob Clark <robdclark@chromium.org>

Otherwise looks good, thanks.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 449DA307B1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 17:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbhA1Qhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 11:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232643AbhA1QhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 11:37:20 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E3BC061756;
        Thu, 28 Jan 2021 08:36:39 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id m13so6040310wro.12;
        Thu, 28 Jan 2021 08:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J2pSAMeacjhYY4VRhMqQHxTTL1fklZ6z+iWFWs9oc44=;
        b=DfyF+mGipz5IdxF0ZOYjV1X5y0NhM+SOJq5KMmh/tOITvOfGsVqH7mnosOyCJImEZd
         FtBe1YewLQdbLECZtW/y9+LdRAzEKft/cvY+VcT2aa3dYM9QGb+Y9Ug/tuNe8kTsQ4G6
         4OENy1oWjIETJvqYS+t3BZhEx9hK+mtD1RChRRV7z1uXewJcUJwuan6e2AmcKLfUaPEp
         YpnfAr4m15Xk9hO/dpbw1yHiIkPKA3P4zBfCjIjwaohZkcv4f3Lf/PwULvA8kkdhHFWt
         AyjECcPpT6pYecRegWNU+T/M1VkQrxl5I3N4yEtazuUBjfixPBvspwgEYB/T1H1GMNKe
         KYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J2pSAMeacjhYY4VRhMqQHxTTL1fklZ6z+iWFWs9oc44=;
        b=CnHqY0UeM7zGZX69E5drSKHZd4hYSkB86J0FDYOtsI4f6Fl0BGUWzduyRtGUpszIT4
         tDV33twz3OYModXPaLniDV7QNbocSJuyvkt+324JAWCHvjgJ++6nnSSeUu5ltf1H3PIF
         hr17q1rrGKjVTSaeqVuVrPTzT+V38VJNUPP3wM1NddWA3TcMrokbM3Iw6SvbEvz50rPE
         zsVmQW8Sh/C16P9aaQ6RaDRjdN6BWclf8hW+thYxRhZU5UT1K1TWT3UqlKuxQqxZaBeu
         dUqZnbuzMua/QJ1VC3k0keSmhooltH6rRX+BiSicp6Omw+AOvsr+DC3Bk6QgXPg+4+q1
         Bwyg==
X-Gm-Message-State: AOAM5307tWHGNDVumesW373sabuDdgBTvfXmIfYtVmjPrzC+frir4LbR
        oqBo/THkmh4jSxz3KDG+Q5E0wPoTY8ytW5tWMfPr9i2GePE=
X-Google-Smtp-Source: ABdhPJzjtBIb9f3OwWrVVcmu1w4hFEFvKvi6v9SGkeHvpkhMmefwW5PwFRm8PwjbmSGh1qpzbdv0JI+bmeA6hVyKa/w=
X-Received: by 2002:adf:dd07:: with SMTP id a7mr17587399wrm.83.1611851797734;
 Thu, 28 Jan 2021 08:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20210125234901.2730699-1-swboyd@chromium.org>
In-Reply-To: <20210125234901.2730699-1-swboyd@chromium.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 28 Jan 2021 08:39:12 -0800
Message-ID: <CAF6AEGu1WHbzV5pazm2w7t7XzSeHJgTvip4FHdpqTm+SnLEpLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 25, 2021 at 3:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Lockdep complains about an AA deadlock when rebooting the device.
>
> ============================================
> WARNING: possible recursive locking detected
> 5.4.91 #1 Not tainted
> --------------------------------------------
> reboot/5213 is trying to acquire lock:
> ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
>
> but task is already holding lock:
> ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
>
> other info that might help us debug this:
> Possible unsafe locking scenario:
>
> CPU0
> ----
> lock(&kms->commit_lock[i]);
> lock(&kms->commit_lock[i]);
>
> *** DEADLOCK ***
>
> May be due to missing lock nesting notation
>
> 6 locks held by reboot/5213:
> __arm64_sys_reboot+0x148/0x2a0
> device_shutdown+0x10c/0x2c4
> drm_atomic_helper_shutdown+0x48/0xfc
> modeset_lock+0x120/0x24c
> lock_crtcs+0x60/0xa4
>
> stack backtrace:
> CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
> Hardware name: Google Pompom (rev1) with LTE (DT)
> Call trace:
> dump_backtrace+0x0/0x1dc
> show_stack+0x24/0x30
> dump_stack+0xfc/0x1a8
> __lock_acquire+0xcd0/0x22b8
> lock_acquire+0x1ec/0x240
> __mutex_lock_common+0xe0/0xc84
> mutex_lock_nested+0x48/0x58
> lock_crtcs+0x60/0xa4
> msm_atomic_commit_tail+0x348/0x570
> commit_tail+0xdc/0x178
> drm_atomic_helper_commit+0x160/0x168
> drm_atomic_commit+0x68/0x80
>
> This is because lockdep thinks all the locks taken in lock_crtcs() are
> the same lock, when they actually aren't. That's because we call
> mutex_init() in msm_kms_init() and that assigns on static key for every

nit, s/on/one/ ?

BR,
-R

> lock initialized in this loop. Let's allocate a dynamic number of
> lock_class_keys and assign them to each lock so that lockdep can figure
> out an AA deadlock isn't possible here.
>
> Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index d8151a89e163..4735251a394d 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -157,6 +157,7 @@ struct msm_kms {
>          * from the crtc's pending_timer close to end of the frame:
>          */
>         struct mutex commit_lock[MAX_CRTCS];
> +       struct lock_class_key commit_lock_keys[MAX_CRTCS];
>         unsigned pending_crtc_mask;
>         struct msm_pending_timer pending_timers[MAX_CRTCS];
>  };
> @@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
>  {
>         unsigned i, ret;
>
> -       for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> -               mutex_init(&kms->commit_lock[i]);
> +       for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
> +               lockdep_register_key(&kms->commit_lock_keys[i]);
> +               __mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
> +                            &kms->commit_lock_keys[i]);
> +       }
>
>         kms->funcs = funcs;
>
>
> base-commit: 19c329f6808995b142b3966301f217c831e7cf31
> --
> https://chromeos.dev
>

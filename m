Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934E85107B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 20:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbiDZS7I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 14:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353114AbiDZS7C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 14:59:02 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA93117FBFA
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:55:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i27so37915068ejd.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aEEAXV1WBPQ00FYgXA1fiOYG5z4OtnmF+Fn0p8w7b9U=;
        b=DxNvQIJKNVq7LSfslP+ixPDB16nUjaWuUvkILVcO+uCgmN5TCzb2yW7yk4jUhTOmBQ
         FObdbuPKyZyF46kSA4l17ZW8vTmfhq9x/2VB4PFtk1VXZp6U8oryNRzwZgIRN2g1EoR5
         6T/SYCqdZEa01betMHEOnesDpzNV1BzLUGOiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aEEAXV1WBPQ00FYgXA1fiOYG5z4OtnmF+Fn0p8w7b9U=;
        b=Ts1ikqOGzDYs6jD/LxrDjfems436u3AsS/X0g9/DCWPJJj9AfppnYYl031+TsJoLdq
         Rd93vXkLtLxyaoN6k5XTB7P+vYTWussyZyrTt7vf5IlT/SxsiBHubasfghWDhoFAVO8G
         pGxC9KqIPYE0ycENCkFacY8qFWYKq9v9ZM0YDbLCQnyHJC92Zr5eIOwfLgWF+48s9EDk
         hJp00VeQRned2QZkEH1+f/1XyYZqF2qGDjJHaeDc2GNE1FWpAUt+qwvyMcjcUNgGzwUR
         Z1tzePdcT+I1qCcu8zJcimRSoDQF3k6ScsM3kYarZHamPfGU1kRqJ5S68eI0o1ofBXYR
         yuqg==
X-Gm-Message-State: AOAM5313hOAtc02yIJRdnlCl3FWn6FdSold9VzqgFD0F0sJnnHVJrTAl
        Z2gjgTNTBE9XlR1Z1AX3KRqOLpzePK7D8D82yhs=
X-Google-Smtp-Source: ABdhPJwJh6aOB08AfndpXqQcJMioG1YnN008JBreNEn7k/fH87yEWJIZ290wkjW9lGTtUM/yI1Vlfw==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id l4-20020a170906794400b006dab8342f3emr23382617ejo.353.1650999352203;
        Tue, 26 Apr 2022 11:55:52 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906289600b006e44a0c1105sm5334090ejd.46.2022.04.26.11.55.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:55:51 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id ay11-20020a05600c1e0b00b0038eb92fa965so2088868wmb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 11:55:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr31766920wmq.34.1650998950049; Tue, 26
 Apr 2022 11:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1650952595-27783-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 Apr 2022 11:48:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYkpJb_z7N_JANNZRCTJ6vbSqbLw0sKwrssENgnSqdhQ@mail.gmail.com>
Message-ID: <CAD=FV=VYkpJb_z7N_JANNZRCTJ6vbSqbLw0sKwrssENgnSqdhQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: remove fail safe mode related code
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 25, 2022 at 10:56 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
> However there is possible circular locking happen (see blow stack trace)
> after edp driver call dp_hpd_plug_handle() from dp_bridge_enable() which
> is executed under drm_thread context.
>
> After review all possibilities methods and as discussed on
> https://patchwork.freedesktop.org/patch/483155/, supporting EDID
> compliance tests in the driver is quite hacky. As seen with other
> vendor drivers, supporting these will be much easier with IGT. Hence
> removing all the related fail safe code for it so that no possibility
> of circular lock will happen.
>
> ======================================================
>  WARNING: possible circular locking dependency detected
>  5.15.35-lockdep #6 Tainted: G        W
>  ------------------------------------------------------
>  frecon/429 is trying to acquire lock:
>  ffffff808dc3c4e8 (&dev->mode_config.mutex){+.+.}-{3:3}, at:
> dp_panel_add_fail_safe_mode+0x4c/0xa0
>
>  but task is already holding lock:
>  ffffff808dc441e0 (&kms->commit_lock[i]){+.+.}-{3:3}, at: lock_crtcs+0xb4/0x124
>
>  which lock already depends on the new lock.
>
>  the existing dependency chain (in reverse order) is:
>
>  -> #3 (&kms->commit_lock[i]){+.+.}-{3:3}:
>         __mutex_lock_common+0x174/0x1a64
>         mutex_lock_nested+0x98/0xac
>         lock_crtcs+0xb4/0x124
>         msm_atomic_commit_tail+0x330/0x748
>         commit_tail+0x19c/0x278
>         drm_atomic_helper_commit+0x1dc/0x1f0
>         drm_atomic_commit+0xc0/0xd8
>         drm_atomic_helper_set_config+0xb4/0x134
>         drm_mode_setcrtc+0x688/0x1248
>         drm_ioctl_kernel+0x1e4/0x338
>         drm_ioctl+0x3a4/0x684
>         __arm64_sys_ioctl+0x118/0x154
>         invoke_syscall+0x78/0x224
>         el0_svc_common+0x178/0x200
>         do_el0_svc+0x94/0x13c
>         el0_svc+0x5c/0xec
>         el0t_64_sync_handler+0x78/0x108
>         el0t_64_sync+0x1a4/0x1a8
>
>  -> #2 (crtc_ww_class_mutex){+.+.}-{3:3}:
>         __mutex_lock_common+0x174/0x1a64
>         ww_mutex_lock+0xb8/0x278
>         modeset_lock+0x304/0x4ac
>         drm_modeset_lock+0x4c/0x7c
>         drmm_mode_config_init+0x4a8/0xc50
>         msm_drm_init+0x274/0xac0
>         msm_drm_bind+0x20/0x2c
>         try_to_bring_up_master+0x3dc/0x470
>         __component_add+0x18c/0x3c0
>         component_add+0x1c/0x28
>         dp_display_probe+0x954/0xa98
>         platform_probe+0x124/0x15c
>         really_probe+0x1b0/0x5f8
>         __driver_probe_device+0x174/0x20c
>         driver_probe_device+0x70/0x134
>         __device_attach_driver+0x130/0x1d0
>         bus_for_each_drv+0xfc/0x14c
>         __device_attach+0x1bc/0x2bc
>         device_initial_probe+0x1c/0x28
>         bus_probe_device+0x94/0x178
>         deferred_probe_work_func+0x1a4/0x1f0
>         process_one_work+0x5d4/0x9dc
>         worker_thread+0x898/0xccc
>         kthread+0x2d4/0x3d4
>         ret_from_fork+0x10/0x20
>
>  -> #1 (crtc_ww_class_acquire){+.+.}-{0:0}:
>         ww_acquire_init+0x1c4/0x2c8
>         drm_modeset_acquire_init+0x44/0xc8
>         drm_helper_probe_single_connector_modes+0xb0/0x12dc
>         drm_mode_getconnector+0x5dc/0xfe8
>         drm_ioctl_kernel+0x1e4/0x338
>         drm_ioctl+0x3a4/0x684
>         __arm64_sys_ioctl+0x118/0x154
>         invoke_syscall+0x78/0x224
>         el0_svc_common+0x178/0x200
>         do_el0_svc+0x94/0x13c
>         el0_svc+0x5c/0xec
>         el0t_64_sync_handler+0x78/0x108
>         el0t_64_sync+0x1a4/0x1a8
>
>  -> #0 (&dev->mode_config.mutex){+.+.}-{3:3}:
>         __lock_acquire+0x2650/0x672c
>         lock_acquire+0x1b4/0x4ac
>         __mutex_lock_common+0x174/0x1a64
>         mutex_lock_nested+0x98/0xac
>         dp_panel_add_fail_safe_mode+0x4c/0xa0
>         dp_hpd_plug_handle+0x1f0/0x280
>         dp_bridge_enable+0x94/0x2b8
>         drm_atomic_bridge_chain_enable+0x11c/0x168
>         drm_atomic_helper_commit_modeset_enables+0x500/0x740
>         msm_atomic_commit_tail+0x3e4/0x748
>         commit_tail+0x19c/0x278
>         drm_atomic_helper_commit+0x1dc/0x1f0
>         drm_atomic_commit+0xc0/0xd8
>         drm_atomic_helper_set_config+0xb4/0x134
>         drm_mode_setcrtc+0x688/0x1248
>         drm_ioctl_kernel+0x1e4/0x338
>         drm_ioctl+0x3a4/0x684
>         __arm64_sys_ioctl+0x118/0x154
>         invoke_syscall+0x78/0x224
>         el0_svc_common+0x178/0x200
>         do_el0_svc+0x94/0x13c
>         el0_svc+0x5c/0xec
>         el0t_64_sync_handler+0x78/0x108
>         el0t_64_sync+0x1a4/0x1a8
>
> Changes in v2:
> -- re text commit title
> -- remove all fail safe mode
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reported-by: Douglas Anderson <dianders@chromium.org>
Fixes: f1b47e6a8df8 ("drm/msm/dp: remove fail safe mode related code")


> @@ -151,15 +151,6 @@ static int dp_panel_update_modes(struct drm_connector *connector,
>         return rc;
>  }
>
> -void dp_panel_add_fail_safe_mode(struct drm_connector *connector)
> -{
> -       /* fail safe edid */
> -       mutex_lock(&connector->dev->mode_config.mutex);
> -       if (drm_add_modes_noedid(connector, 640, 480))
> -               drm_set_preferred_mode(connector, 640, 480);
> -       mutex_unlock(&connector->dev->mode_config.mutex);
> -}

You removed this function but you forgot to remove it from the header
in "drivers/gpu/drm/msm/dp/dp_panel.h"

-Doug

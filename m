Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3103B510B46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 23:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355444AbiDZVeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 17:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355446AbiDZVeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 17:34:13 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AA02559B
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:31:04 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g23so16906867edy.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OF4zaxvUZZwjx0sw8BnnZAnlnQz/NSULAjKYH++y2eE=;
        b=TPOfReJHSRRjySe00DfrcR4r90IocI23aIbK/ZNXWf4si8RMKRyvt5ThdYvrEhPYc6
         ffxg58j+JplNytgEYxQcnyctvjc7sBRXg90LY3jF5/hzK6bJzkgy8hGiuccOI981NeLJ
         w1W/WkBrzjvibgEN448TvpikSDjeHIZv3Odig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OF4zaxvUZZwjx0sw8BnnZAnlnQz/NSULAjKYH++y2eE=;
        b=v36faRkZQ+a5LH9fzOVhSyOHUgZ58vUsLAaeMffff9P0cgfK3qSBIFTCpgSgxF2PL7
         LSZqDKkxljO3Ws38JSIg8YH2hNz0rBjUJo+jAgnh4l+YfNKHwcSlA4FRmEwdDOY3+EQf
         Hs/yZXs9yfuk7r6JqIqTyc80IVM7fih0XnOEsOQlbwuf9XDami0WgfkvvxgI9qGtV2P6
         D+o8/ghCp0QZshaQyOLj8XSmA1neO8OYldTvSBr4pQI/Vey6gqCxT+aiE+1k9lTmzCwV
         0nV9izLAIqKvHqk+3+PCu07dBK8Exl3MFiksmC0HzYwqDj1K5CEYeUBjuMbd2F40VtzU
         SeZg==
X-Gm-Message-State: AOAM531SpIsrXY28qF1Hl46V7swl1BTiCFzLqHAZhp+b46mJJIe4Lkqf
        /rzOOgkEdZY+s4k7iIsv2LxNdIqYr1wUSuM+HdA=
X-Google-Smtp-Source: ABdhPJwe402cSNF3/OOBGv8bIQJS7ZcBY6JCGqnoMfq7bYiaZC6ALXLS7qJHKA299YAP9jnxHope9Q==
X-Received: by 2002:a05:6402:5186:b0:426:b0:32cf with SMTP id q6-20020a056402518600b0042600b032cfmr3564713edd.249.1651008663072;
        Tue, 26 Apr 2022 14:31:03 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090626da00b006e7cb663277sm5457906ejc.90.2022.04.26.14.31.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 14:31:02 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id m22-20020a05600c3b1600b00393ed50777aso67239wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 14:31:01 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr31619457wmb.29.1651008661066; Tue, 26
 Apr 2022 14:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 26 Apr 2022 14:30:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ux8G61HNV+y2zmTVeyfWe5zZd28RAhN_9zoZ=rJSSjWQ@mail.gmail.com>
Message-ID: <CAD=FV=Ux8G61HNV+y2zmTVeyfWe5zZd28RAhN_9zoZ=rJSSjWQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: remove fail safe mode related code
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Apr 26, 2022 at 2:12 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
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
> Changes in v3:
> -- remove dp_panel_add_fail_safe_mode() from dp_panel.h
> -- add Fixes
>
> Changes in v5:
> --  to=dianders@chromium.org
>
> Changes in v6:
> --  fix Fixes commit ID
>
> Fixes: 8b2c181e3dcf ("drm/msm/dp: add fail safe mode outside of event_mutex context")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 11 -----------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 -
>  3 files changed, 18 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

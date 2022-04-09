Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D51044FA07D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 02:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbiDIARK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 20:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbiDIARJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 20:17:09 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE89A3A188
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 17:15:03 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id s11so11988280qtc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wqKqNvRBKNK1XdPdWd1W/+J9AUdIYdoGTEbOAR0NgMk=;
        b=azoKrEIF53591VoXaWCsQ+ipgnK2WwCmmUVONxiYTWOSJi/Kigp+j7UENXG2BVz+YI
         gVEXff6nidhrh8Chtspuct7Bvu2V/DcCseg2iMlkbeBpC04w1dPLiuuzYL9SAdenaPvW
         G5I3FkjeNGS3XExzg5iIBxJ1/IqhUwlPRS2VZTdTTX+MvyEcLX95WOTJbAffdLE5v7z+
         K1K+BZXvbxEIdy3jUcwzmEpgx5aQf1WYPcuxpYI/C5/YpA/jfG6U7o12V+M5vk0g+ujw
         jSUiPSWxYeaozohRGtMQ7Gl8WDiNwy/tk1DZOrAflEpSxf0gkcOCwdcJXQrUsE67Esgh
         7Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqKqNvRBKNK1XdPdWd1W/+J9AUdIYdoGTEbOAR0NgMk=;
        b=qBDLwLvvriyULy3XI4G8etzXW9qnEZzgk4e3RlynVO71RrH/J/SfruSYxojghbP2Js
         YrOG0r1Rt8DlGgG1iW7uqpc8ZNzi3BYJKRZxxckeAS+ko1aioEGWj9TWwGauvZVnfzBh
         sRbKKUoFTBNZXOronOQ3+Tp96FMzfc5JK5aJT2WCJOUOBPN+dL7KBdPVPQ7yDbdmen84
         InmGPwRnZDLIKlEpBPioyE91YmJQjAzH49+oynttmXSpFaTJvvseXhNRu5z3O+SiR6mn
         nFSVuze1pxFNcrmn5kXzOrFlfYyZhQZzQfMoP1EK8njUpZMD1K4o3N9FqcRnyU/c3a6r
         WXpA==
X-Gm-Message-State: AOAM531yijALuonjioBKlNlVqq58Ymccv9XLWh8gYvNp16qjXocojs+a
        laQ3TloK3aeIBimmz0sEaHdpcDMS2lr+NNqU3JeyiQ==
X-Google-Smtp-Source: ABdhPJxoYLUQ7Wodg8S1LjYpBE9I/Bk+A6yMDzjWCEyCz7bXKUpAK1sJpbG6x+GWIQOcgKiwn/gJkGD+iHHgChU8230=
X-Received: by 2002:ac8:5702:0:b0:2e1:ec8a:917a with SMTP id
 2-20020ac85702000000b002e1ec8a917amr18093756qtw.682.1649463302828; Fri, 08
 Apr 2022 17:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 9 Apr 2022 03:14:51 +0300
Message-ID: <CAA8EJpqtjK_GDe7V5CSU9hs0x6rOJsL8+yoZFMS66i69nwj-9Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add fail safe mode outside of event_mutex context
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 9 Apr 2022 at 00:05, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> There is possible circular locking dependency detected on event_mutex
> (see below logs). This is due to set fail safe mode is done at
> dp_panel_read_sink_caps() within event_mutex scope. To break this
> possible circular locking, this patch move setting fail safe mode
> out of event_mutex scope.
>
> [   23.958078] ======================================================
> [   23.964430] WARNING: possible circular locking dependency detected
> [   23.970777] 5.17.0-rc2-lockdep-00088-g05241de1f69e #148 Not tainted
> [   23.977219] ------------------------------------------------------
> [   23.983570] DrmThread/1574 is trying to acquire lock:
> [   23.988763] ffffff808423aab0 (&dp->event_mutex){+.+.}-{3:3}, at: msm_dp_displ                                                                             ay_enable+0x58/0x164
> [   23.997895]
> [   23.997895] but task is already holding lock:
> [   24.003895] ffffff808420b280 (&kms->commit_lock[i]/1){+.+.}-{3:3}, at: lock_c                                                                             rtcs+0x80/0x8c
> [   24.012495]
> [   24.012495] which lock already depends on the new lock.
> [   24.012495]
> [   24.020886]
> [   24.020886] the existing dependency chain (in reverse order) is:
> [   24.028570]
> [   24.028570] -> #5 (&kms->commit_lock[i]/1){+.+.}-{3:3}:
> [   24.035472]        __mutex_lock+0xc8/0x384
> [   24.039695]        mutex_lock_nested+0x54/0x74
> [   24.044272]        lock_crtcs+0x80/0x8c
> [   24.048222]        msm_atomic_commit_tail+0x1e8/0x3d0
> [   24.053413]        commit_tail+0x7c/0xfc
> [   24.057452]        drm_atomic_helper_commit+0x158/0x15c
> [   24.062826]        drm_atomic_commit+0x60/0x74
> [   24.067403]        drm_mode_atomic_ioctl+0x6b0/0x908
> [   24.072508]        drm_ioctl_kernel+0xe8/0x168
> [   24.077086]        drm_ioctl+0x320/0x370
> [   24.081123]        drm_compat_ioctl+0x40/0xdc
> [   24.085602]        __arm64_compat_sys_ioctl+0xe0/0x150
> [   24.090895]        invoke_syscall+0x80/0x114
> [   24.095294]        el0_svc_common.constprop.3+0xc4/0xf8
> [   24.100668]        do_el0_svc_compat+0x2c/0x54
> [   24.105242]        el0_svc_compat+0x4c/0xe4
> [   24.109548]        el0t_32_sync_handler+0xc4/0xf4
> [   24.114381]        el0t_32_sync+0x178
> [   24.118688]
> [   24.118688] -> #4 (&kms->commit_lock[i]){+.+.}-{3:3}:
> [   24.125408]        __mutex_lock+0xc8/0x384
> [   24.129628]        mutex_lock_nested+0x54/0x74
> [   24.134204]        lock_crtcs+0x80/0x8c
> [   24.138155]        msm_atomic_commit_tail+0x1e8/0x3d0
> [   24.143345]        commit_tail+0x7c/0xfc
> [   24.147382]        drm_atomic_helper_commit+0x158/0x15c
> [   24.152755]        drm_atomic_commit+0x60/0x74
> [   24.157323]        drm_atomic_helper_set_config+0x68/0x90
> [   24.162869]        drm_mode_setcrtc+0x394/0x648
> [   24.167535]        drm_ioctl_kernel+0xe8/0x168
> [   24.172102]        drm_ioctl+0x320/0x370
> [   24.176135]        drm_compat_ioctl+0x40/0xdc
> [   24.180621]        __arm64_compat_sys_ioctl+0xe0/0x150
> [   24.185904]        invoke_syscall+0x80/0x114
> [   24.190302]        el0_svc_common.constprop.3+0xc4/0xf8
> [   24.195673]        do_el0_svc_compat+0x2c/0x54
> [   24.200241]        el0_svc_compat+0x4c/0xe4
> [   24.204544]        el0t_32_sync_handler+0xc4/0xf4
> [   24.209378]        el0t_32_sync+0x174/0x178
> [   24.213680] -> #3 (crtc_ww_class_mutex){+.+.}-{3:3}:
> [   24.220308]        __ww_mutex_lock.constprop.20+0xe8/0x878
> [   24.225951]        ww_mutex_lock+0x60/0xd0
> [   24.230166]        modeset_lock+0x190/0x19c
> [   24.234467]        drm_modeset_lock+0x34/0x54
> [   24.238953]        drmm_mode_config_init+0x550/0x764
> [   24.244065]        msm_drm_bind+0x170/0x59c
> [   24.248374]        try_to_bring_up_master+0x244/0x294
> [   24.253572]        __component_add+0xf4/0x14c
> [   24.258057]        component_add+0x2c/0x38
> [   24.262273]        dsi_dev_attach+0x2c/0x38
> [   24.266575]        dsi_host_attach+0xc4/0x120
> [   24.271060]        mipi_dsi_attach+0x34/0x48
> [   24.275456]        devm_mipi_dsi_attach+0x28/0x68
> [   24.280298]        ti_sn_bridge_probe+0x2b4/0x2dc
> [   24.285137]        auxiliary_bus_probe+0x78/0x90
> [   24.289893]        really_probe+0x1e4/0x3d8
> [   24.294194]        __driver_probe_device+0x14c/0x164
> [   24.299298]        driver_probe_device+0x54/0xf8
> [   24.304043]        __device_attach_driver+0xb4/0x118
> [   24.309145]        bus_for_each_drv+0xb0/0xd4
> [   24.313628]        __device_attach+0xcc/0x158
> [   24.318112]        device_initial_probe+0x24/0x30
> [   24.322954]        bus_probe_device+0x38/0x9c
> [   24.327439]        deferred_probe_work_func+0xd4/0xf0
> [   24.332628]        process_one_work+0x2f0/0x498
> [   24.337289]        process_scheduled_works+0x44/0x48
> [   24.342391]        worker_thread+0x1e4/0x26c
> [   24.346788]        kthread+0xe4/0xf4
> [   24.350470]        ret_from_fork+0x10/0x20
> [   24.354683]
> [   24.354683]
> [   24.354683] -> #2 (crtc_ww_class_acquire){+.+.}-{0:0}:
> [   24.361489]        drm_modeset_acquire_init+0xe4/0x138
> [   24.366777]        drm_helper_probe_detect_ctx+0x44/0x114
> [   24.372327]        check_connector_changed+0xbc/0x198
> [   24.377517]        drm_helper_hpd_irq_event+0xcc/0x11c
> [   24.382804]        dsi_hpd_worker+0x24/0x30
> [   24.387104]        process_one_work+0x2f0/0x498
> [   24.391762]        worker_thread+0x1d0/0x26c
> [   24.396158]        kthread+0xe4/0xf4
> [   24.399840]        ret_from_fork+0x10/0x20
> [   24.404053]
> [   24.404053] -> #1 (&dev->mode_config.mutex){+.+.}-{3:3}:
> [   24.411032]        __mutex_lock+0xc8/0x384
> [   24.415247]        mutex_lock_nested+0x54/0x74
> [   24.419819]        dp_panel_read_sink_caps+0x23c/0x26c
> [   24.425108]        dp_display_process_hpd_high+0x34/0xd4
> [   24.430570]        dp_display_usbpd_configure_cb+0x30/0x3c
> [   24.436205]        hpd_event_thread+0x2ac/0x550
> [   24.440864]        kthread+0xe4/0xf4
> [   24.444544]        ret_from_fork+0x10/0x20
> [   24.448757]
> [   24.448757] -> #0 (&dp->event_mutex){+.+.}-{3:3}:
> [   24.455116]        __lock_acquire+0xe2c/0x10d8
> [   24.459690]        lock_acquire+0x1ac/0x2d0
> [   24.463988]        __mutex_lock+0xc8/0x384
> [   24.468201]        mutex_lock_nested+0x54/0x74
> [   24.472773]        msm_dp_display_enable+0x58/0x164
> [   24.477789]        dp_bridge_enable+0x24/0x30
> [   24.482273]        drm_atomic_bridge_chain_enable+0x78/0x9c
> [   24.488006]        drm_atomic_helper_commit_modeset_enables+0x1bc/0x244
> [   24.494801]        msm_atomic_commit_tail+0x248/0x3d0
> [   24.499992]        commit_tail+0x7c/0xfc
> [   24.504031]        drm_atomic_helper_commit+0x158/0x15c
> [   24.509404]        drm_atomic_commit+0x60/0x74
> [   24.513976]        drm_mode_atomic_ioctl+0x6b0/0x908
> [   24.519079]        drm_ioctl_kernel+0xe8/0x168
> [   24.523650]        drm_ioctl+0x320/0x370
> [   24.527689]        drm_compat_ioctl+0x40/0xdc
> [   24.532175]        __arm64_compat_sys_ioctl+0xe0/0x150
> [   24.537463]        invoke_syscall+0x80/0x114
> [   24.541861]        el0_svc_common.constprop.3+0xc4/0xf8
> [   24.547235]        do_el0_svc_compat+0x2c/0x54
> [   24.551806]        el0_svc_compat+0x4c/0xe4
> [   24.556106]        el0t_32_sync_handler+0xc4/0xf4
> [   24.560948]        el0t_32_sync+0x174/0x178
>
> Changes in v2:
> -- add circular lockiing trace
>
> Fixes: d4aca422539c ("drm/msm/dp:  always add fail-safe mode into connector mode list")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'll probably fix the trace while applying the commit.
In future please remove timestamps and make sure that there are no
extra whitespaces.

-- 
With best wishes
Dmitry

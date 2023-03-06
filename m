Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E95266ACAC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 18:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjCFRhc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 12:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCFRhb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 12:37:31 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF4B65C6A
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 09:36:58 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id g6so4326120iov.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678124149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNHjWC6k5xJHMsKrCk2hHuizLw/uBoZMGCOR7dCoGpo=;
        b=St5Fh+Y9EY2SG3UhJpg8RylhemRbLpApusrIiNN8KgpATRdJaz5mioHWhOK2PeMw8F
         7o64CTkKuUF7zEG0dzIqxobvli0u7yYlocyy0M1UZurpfEXjXS7/t8RFkdUJgjXF1n+l
         lX286XQb0sBujwE0ECMei8aYcKR2Xno2Rlohk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNHjWC6k5xJHMsKrCk2hHuizLw/uBoZMGCOR7dCoGpo=;
        b=kEZkdHDt+pfxJpudvtY+3gO4VWTq12yHF9ZfK23jGh906+R+wip9I92aydzGe3hb/y
         dzSNGRfxjZk2jKyOYXsqJd5ksqGx6aI91BHvVLXFyp/JPdWwiy7DVPPekL4hVhqQ6YDw
         KB4znmJ2z0xEA4PBiyvkA2q4TgiWVYaw3Jz8RP2Wi+wYEBbE8Jx/wmytt2lu8NKWi3J2
         ze2eKvxj8cKbN6dIMSlbilnVD6GZZs5rgoubmEj1fLf92vOoJWCOl/eNW0zhKpsQ7ATd
         lmGank5zSMoCWlNsP0fTSJSQnR63UExMrYbHu6uzrc+rEOai4yH2mTlyfm7etaEdoht8
         Bxag==
X-Gm-Message-State: AO0yUKWHz0sxEIgWt+WU8v/Diltqr3/eBPlkVWZcnYa/62Aw/zNO5dXG
        KpJVQ1iodemmsgcsDiuKMMKM07qqsEVTu4HinEM=
X-Google-Smtp-Source: AK7set81sHYaC13RRatswMN8NWb+Ff92lUhmgsulA9i3aB92F5VvcbGl3vQUVjd/eWRvBIpdBJN3zw==
X-Received: by 2002:a05:6602:20c7:b0:73d:1ccb:3359 with SMTP id 7-20020a05660220c700b0073d1ccb3359mr7226626ioz.5.1678124148990;
        Mon, 06 Mar 2023 09:35:48 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id v12-20020a5ed70c000000b0074c7db1470dsm3501423iom.20.2023.03.06.09.35.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 09:35:48 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id g6so4326064iov.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 09:35:47 -0800 (PST)
X-Received: by 2002:a02:634e:0:b0:3ec:dc1f:12dd with SMTP id
 j75-20020a02634e000000b003ecdc1f12ddmr6039903jac.6.1678124147517; Mon, 06 Mar
 2023 09:35:47 -0800 (PST)
MIME-Version: 1.0
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 6 Mar 2023 09:35:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UvaE1zFxP7pAXAzh=6Qdu9dSjd73DfEgJfmBeHNcJ_oA@mail.gmail.com>
Message-ID: <CAD=FV=UvaE1zFxP7pAXAzh=6Qdu9dSjd73DfEgJfmBeHNcJ_oA@mail.gmail.com>
Subject: Re: [PATCH v14 00/14] Add PSR support for eDP
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        swboyd@chromium.org, quic_kalyant@quicinc.com,
        dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, quic_bjorande@quicinc.com,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 2, 2023 at 8:33=E2=80=AFAM Vinod Polimera <quic_vpolimer@quicin=
c.com> wrote:
>
> Changes in v2:
>   - Use dp bridge to set psr entry/exit instead of dpu_enocder.
>   - Don't modify whitespaces.
>   - Set self refresh aware from atomic_check.
>   - Set self refresh aware only if psr is supported.
>   - Provide a stub for msm_dp_display_set_psr.
>   - Move dp functions to bridge code.
>
> Changes in v3:
>   - Change callback names to reflect atomic interfaces.
>   - Move bridge callback change to separate patch as suggested by Dmitry.
>   - Remove psr function declaration from msm_drv.h.
>   - Set self_refresh_aware flag only if psr is supported.
>   - Modify the variable names to simpler form.
>   - Define bit fields for PSR settings.
>   - Add comments explaining the steps to enter/exit psr.
>   - Change DRM_INFO to drm_dbg_db.
>
> Changes in v4:
>   - Move the get crtc functions to drm_atomic.
>   - Add atomic functions for DP bridge too.
>   - Add ternary operator to choose eDP or DP ops.
>   - Return true/false instead of 1/0.
>   - mode_valid missing in the eDP bridge ops.
>   - Move the functions to get crtc into drm_atomic.c.
>   - Fix compilation issues.
>   - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
>   - Check for crtc state enable while reserving resources.
>
> Changes in v5:
>   - Move the mode_valid changes into a different patch.
>   - Complete psr_op_comp only when isr is set.
>   - Move the DP atomic callback changes to a different patch.
>   - Get crtc from drm connector state crtc.
>   - Move to separate patch for check for crtc state enable while
> reserving resources.
>
> Changes in v6:
>   - Remove crtc from dpu_encoder_virt struct.
>   - fix crtc check during vblank toggle crtc.
>   - Misc changes.
>
> Changes in v7:
>   - Add fix for underrun issue on kasan build.
>
> Changes in v8:
>   - Drop the enc spinlock as it won't serve any purpose in
> protetcing conn state.(Dmitry/Doug)
>
> Changes in v9:
>   - Update commit message and fix alignment using spaces.(Marijn)
>   - Misc changes.(Marijn)
>
> Changes in v10:
>   - Get crtc cached in dpu_enc during obj init.(Dmitry)
>
> Changes in v11:
>   - Remove crtc cached in dpu_enc during obj init.
>   - Update dpu_enc crtc state on crtc enable/disable during self refresh.
>
> Changes in v12:
>   - Update sc7180 intf mask to get intf timing gen status
> based on DPU_INTF_STATUS_SUPPORTED bit.(Dmitry)
>   - Remove "clear active interface in the datapath cleanup" change
> as it is already included.
>
> Changes in v13:
>   - Move core changes to top of the series.(Dmitry)
>   - Drop self refresh aware disable change after psr entry.(Dmitry)
>
> Changes in v14:
>   - Set self_refresh_aware for the PSR to kick in.
>
> Vinod Polimera (14):
>   drm: add helper functions to retrieve old and new crtc
>   drm/bridge: use atomic enable/disable callbacks for panel bridge
>   drm/bridge: add psr support for panel bridge callbacks
>   drm/msm/disp/dpu: check for crtc enable rather than crtc active to
>     release shared resources
>   drm/msm/disp/dpu: get timing engine status from intf status register
>   drm/msm/disp/dpu: wait for extra vsync till timing engine status is
>     disabled
>   drm/msm/disp/dpu: reset the datapath after timing engine disable
>   drm/msm/dp: use atomic callbacks for DP bridge ops
>   drm/msm/dp: Add basic PSR support for eDP
>   drm/msm/dp: use the eDP bridge ops to validate eDP modes
>   drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
>     functions
>   drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
>   drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
>     during self refresh
>   drm/msm/dp: set self refresh aware based on psr support
>
>  drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
>  drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 +++-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 ++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
>  drivers/gpu/drm/msm/dp/dp_display.c                |  36 +++--
>  drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    | 173 +++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
>  drivers/gpu/drm/msm/dp/dp_link.c                   |  36 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 ++++
>  include/drm/drm_atomic.h                           |   7 +
>  22 files changed, 683 insertions(+), 43 deletions(-)

I put these patches on top of msm-next. With that, I was at least able
to see the PSR transition function being called by:

echo "dp_catalog_ctrl_set_psr" > /sys/kernel/debug/tracing/set_ftrace_filte=
r
echo function > /sys/kernel/debug/tracing/current_tracer
echo 1 > /sys/kernel/debug/tracing/tracing_on
cat /sys/kernel/debug/tracing/trace_pipe

I didn't do anything to actually confirm that the panel was in PSR
mode nor that power savings are happening, but at least I can confirm
that the function is being called again (AKA the fix from v13 to v14
seems to have worked).

---

I also backported these to chromeos-5.15 and let a hoglin device sit
there on my desk for a few hours with the cursor blinking to see if I
could see any of the "flickers" that I saw before. I was running a
KASAN build and forcing cpus to the lowest frequencies:

echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq > \
    /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed

echo userspace > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu4/cpufreq/cpuinfo_min_freq > \
    /sys/devices/system/cpu/cpu4/cpufreq/scaling_setspeed

echo userspace > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
cat /sys/devices/system/cpu/cpu7/cpufreq/cpuinfo_min_freq > \
    /sys/devices/system/cpu/cpu7/cpufreq/scaling_setspeed

I did manage to see the screen flicker once over a period of an hour
or two. That's not terribly surprising because of the changes in v13
which dropped your previous fix for this. I'll look forward to seeing
a future patch to fix this in the core.

---

In any case, with all the caveats mentioned above, I'm OK with:

Tested-by: Douglas Anderson <dianders@chromium.org>

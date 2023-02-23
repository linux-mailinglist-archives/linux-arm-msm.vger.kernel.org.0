Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA7D6A0F7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 19:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbjBWSbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 13:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbjBWSbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 13:31:33 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971025BB8D
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 10:31:31 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id b6so5649311qtb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 10:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C4N7cZ0/7CHDOW1p6vH7UAxdq0MkhqFg8+WKoj2WG74=;
        b=iw8JhBBnsBiQKVAmvlEyLj6IQJF/JoClvl5H8P1lE7elDxLiERzV/VPawf+L97Gfi2
         NMI/ww8dYwILYPKTWQmd7MP7T0u1ZwIjyTpeaz4p3jCxSJHfdFrB/gM4kMiKG1Y6X7BW
         GOpRpNb0XPWPuQ+vJ1r3M3d0A4QlJPIFEE8CkBbOjBuF4g4+e+pQZU9N/DEHVtrxGqwt
         Nn3IW88oo8EME7wQZlBt6Uu31lxsp8EsaRS5bDe84r9GoCVH+SI3uSv0NCJ7UUe1oH6m
         w1icI9krpddDOR+SyLwNYUd6owfFwbYyfx1OqaJqCzqiSxv6EMueNgsajSkiC83h0Og+
         A9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4N7cZ0/7CHDOW1p6vH7UAxdq0MkhqFg8+WKoj2WG74=;
        b=3bTakcJcFCBTe0BB2v3sgnEms4l/VGZaL7dD8atPhR8YiUm2kNOjSup0XOQfoKiIUo
         B8Eb4QyzhNY1hM17cgEcIaPMtFzzvooSpLitBLFomyfyGcHsjOavB8LMWyVY1aOLJrsx
         dmi54MAgEpTa/Z2ORKZ66/KJoFJQsYgaRL1yOgwTECkCZF439CnEtl+SUX27JMeFwU7v
         wxudTeTICfXOkxCopZ/b8Y/6CR2+e7TV0+iM3kvvBv4Ygmx/Tba4AfnDDw86oSZ0MijF
         ZQhOV0O0joDNL09zAMB+txDFAigh/Qk0N44Bn1oPHxoaMbaoeKmR4E2H8jtSXJKGEweC
         ckyg==
X-Gm-Message-State: AO0yUKX7a57+vmbRawk0JT34w4O5VZUy8vGSfyNUMu3u8p3eg6i+d/GM
        mBxCO1XBbz7H8LoiALAkOem750NnNF6qAabWJAlRKQ==
X-Google-Smtp-Source: AK7set+Y2TWZKB9Sh4MOlDdtXXuzM1mi9gMyx3uO9DD7HQDEvrWGS4CscEEKsy1rEpO6c4fCw4uWq1BQkCyemGNaGwk=
X-Received: by 2002:a05:622a:1b86:b0:3bf:b829:46ca with SMTP id
 bp6-20020a05622a1b8600b003bfb82946camr302902qtb.1.1677177090574; Thu, 23 Feb
 2023 10:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 24 Feb 2023 00:00:54 +0530
Message-ID: <CAMi1Hd07=8Kyb4MtgLOGwuJZ_vSM1vmoBrciXSEPFu-aPtznjA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Feb 2023 at 15:27, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> when setting the SSPP_NONE pipe. However it was unnoticed until the
> kernel was tested under AOSP (with some kind of stack protection/check).
>
> This fixes the following backtrace:

Tested-by: Amit Pundir <amit.pundir@linaro.org>

>
> Unexpected kernel BRK exception at EL1
> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> Hardware name: Thundercomm Dragonboard 845c (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> sp : ffffffc00bdcb720
> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> Call trace:
>  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>  msm_atomic_commit_tail+0x134/0x6f0 [msm]
>  commit_tail+0xa4/0x1a4 [drm_kms_helper]
>  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>  drm_atomic_commit+0xac/0xe8
>  drm_mode_atomic_ioctl+0xbf0/0xdac
>  drm_ioctl_kernel+0xc4/0x178
>  drm_ioctl+0x2c8/0x608
>  __arm64_sys_ioctl+0xa8/0xec
>  invoke_syscall+0x44/0x104
>  el0_svc_common.constprop.0+0x44/0xec
>  do_el0_svc+0x38/0x98
>  el0_svc+0x2c/0xb4
>  el0t_64_sync_handler+0xb8/0xbc
>  el0t_64_sync+0x1a0/0x1a4
> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
>
> Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index b88a2f3724e6..6c53ea560ffa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>                          * CTL_LAYER has 3-bit field (and extra bits in EXT register),
>                          * all EXT registers has 4-bit fields.
>                          */
> -                       if (cfg->idx == 0) {
> +                       if (cfg->idx == -1) {
> +                               continue;
> +                       } else if (cfg->idx == 0) {
>                                 mixercfg[0] |= mix << cfg->shift;
>                                 mixercfg[1] |= ext << cfg->ext_shift;
>                         } else {
> --
> 2.30.2
>

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150526E00DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Apr 2023 23:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbjDLVaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 17:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjDLVaJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 17:30:09 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5469762
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 14:29:42 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54ee0b73e08so247527037b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681334979; x=1683926979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIFurHY4aPiYQuUul9p4NVclPM+cy68RDu8zSAULlSk=;
        b=SXg6vgT94PMeqXnWK0Y/5OhcdM5Ivvpe3Q+vfgFWcoSIjhY9tG3TuFr+LkvWhF43s7
         LidO+Id6eq+kRf2hWIpu+sfTYqf6I3YtQ119/spraEAxdycR+OTy/yJVGOPjsGxt7sHF
         CFOR8A7IBKwojMzof2GYSB28Hb4D420nT4kkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681334979; x=1683926979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIFurHY4aPiYQuUul9p4NVclPM+cy68RDu8zSAULlSk=;
        b=bc2iYsiZkp+kLNJTJl7QeHpjzvf4vtrDRQL3Zit2WFCyDltnxP70QZeuD1UlDk1hAW
         AUMzWuUx+pj+uh0yd4SC/ePHXLlGZ/flTOJUDn1yf5DDNA6v4Nj2h++s0Qt9tJ56pnFh
         K69DWHrR29wOTiR3PhhToksmzSRB8iM1SOCmi5I84GfBo6fn+8etfReYGS+Ewq4+AKW2
         Y6FADs00Dm5spbtTrn07ZvATfxpYdXMhJlPFms75bhcrMkJjFp9ysiC8mYDxIpyh6uyx
         dicWmNtRBtUPJYS4uQOgZsVCvSNW1qr+ra8w70rs1utxSvgaTR1ckakXe/mcw0LIfXGO
         UHeg==
X-Gm-Message-State: AAQBX9ddztkQzXq2qzGgTSkfBiYyrg8K2q+7ECTB0AJa4dD+UNwTaRg+
        /SRjspYn1RXkXxH9ImSEc5l+NBvU7BuNcKZfkSU=
X-Google-Smtp-Source: AKy350Y6o5a4Shz4VDbuL0RoDqnxj/6Iu2ZUwCVHU1anWjOju88uZGBS4+WINvrnKz7cyZQsfDmTQg==
X-Received: by 2002:a0d:ce82:0:b0:541:8a02:c42b with SMTP id q124-20020a0dce82000000b005418a02c42bmr14297677ywd.28.1681334979691;
        Wed, 12 Apr 2023 14:29:39 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id t9-20020a0dea09000000b0054f9dc9c7f2sm576796ywe.44.2023.04.12.14.29.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 14:29:38 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54bfa5e698eso398338017b3.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Apr 2023 14:29:38 -0700 (PDT)
X-Received: by 2002:a81:c145:0:b0:545:1d7f:abfe with SMTP id
 e5-20020a81c145000000b005451d7fabfemr10843020ywl.7.1681334978361; Wed, 12 Apr
 2023 14:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230410165908.3094626-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230410165908.3094626-1-dmitry.baryshkov@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Apr 2023 14:29:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XpPLU+_pC9MWskhm8nu8X1dmt-8dhzaYqo1J+sbBdDkA@mail.gmail.com>
Message-ID: <CAD=FV=XpPLU+_pC9MWskhm8nu8X1dmt-8dhzaYqo1J+sbBdDkA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: initialize GMU mutex earlier
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 10, 2023 at 9:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Move GMU mutex initialization earlier to make sure that it is always
> initialized. a6xx_destroy can be called from ther failure path before
> GMU initialization.
>
> This fixes the following backtrace:
>
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> WARNING: CPU: 0 PID: 58 at kernel/locking/mutex.c:582 __mutex_lock+0x1ec/=
0x3d0
> Modules linked in:
> CPU: 0 PID: 58 Comm: kworker/u16:1 Not tainted 6.3.0-rc5-00155-g187c06436=
519 #565
> Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : __mutex_lock+0x1ec/0x3d0
> lr : __mutex_lock+0x1ec/0x3d0
> sp : ffff800008993620
> x29: ffff800008993620 x28: 0000000000000002 x27: ffff47b253c52800
> x26: 0000000001000606 x25: ffff47b240bb2810 x24: fffffffffffffff4
> x23: 0000000000000000 x22: ffffc38bba15ac14 x21: 0000000000000002
> x20: ffff800008993690 x19: ffff47b2430cc668 x18: fffffffffffe98f0
> x17: 6f74616c75676572 x16: 20796d6d75642067 x15: 0000000000000038
> x14: 0000000000000000 x13: ffffc38bbba050b8 x12: 0000000000000666
> x11: 0000000000000222 x10: ffffc38bbba603e8 x9 : ffffc38bbba050b8
> x8 : 00000000ffffefff x7 : ffffc38bbba5d0b8 x6 : 0000000000000222
> x5 : 000000000000bff4 x4 : 40000000fffff222 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff47b240cb1880
> Call trace:
>  __mutex_lock+0x1ec/0x3d0
>  mutex_lock_nested+0x2c/0x38
>  a6xx_destroy+0xa0/0x138
>  a6xx_gpu_init+0x41c/0x618
>  adreno_bind+0x188/0x290
>  component_bind_all+0x118/0x248
>  msm_drm_bind+0x1c0/0x670
>  try_to_bring_up_aggregate_device+0x164/0x1d0
>  __component_add+0xa8/0x16c
>  component_add+0x14/0x20
>  dsi_dev_attach+0x20/0x2c
>  dsi_host_attach+0x9c/0x144
>  devm_mipi_dsi_attach+0x34/0xac
>  lt9611uxc_attach_dsi.isra.0+0x84/0xfc
>  lt9611uxc_probe+0x5b8/0x67c
>  i2c_device_probe+0x1ac/0x358
>  really_probe+0x148/0x2ac
>  __driver_probe_device+0x78/0xe0
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x2bc/0x594
>  worker_thread+0x228/0x438
>  kthread+0x108/0x10c
>  ret_from_fork+0x10/0x20
> irq event stamp: 299345
> hardirqs last  enabled at (299345): [<ffffc38bb9ba61e4>] put_cpu_partial+=
0x1c8/0x22c
> hardirqs last disabled at (299344): [<ffffc38bb9ba61dc>] put_cpu_partial+=
0x1c0/0x22c
> softirqs last  enabled at (296752): [<ffffc38bb9890434>] _stext+0x434/0x4=
e8
> softirqs last disabled at (296741): [<ffffc38bb989669c>] ____do_softirq+0=
x10/0x1c
> ---[ end trace 0000000000000000 ]---
>
> Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 --
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)

Sorry for the breakage and thanks for the fix!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

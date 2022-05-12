Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2EC5241BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 02:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiELAyl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 20:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235104AbiELAyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 20:54:40 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D028666F9E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 17:54:39 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-e2fa360f6dso4938425fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 17:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=gzq0yq0s6Pz4ZcBZGksJ1i+VpGS3oGPunNfu2ol+gWk=;
        b=AJG2odWohhORH5ocsAsET1yULuPny4lgVyRM6mb5NBp8tEKRQoNnYMWN1BndJ6Cde+
         f19lfybVbVpBbLyuKRpe9CqNJQsgMAIWd53KS3NXCiG2/jubG6hedP5lXt69GfkG/bQs
         /lGhiwZ6zH5CI/3pRyQmAfGeqZDpZvkK/H4b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=gzq0yq0s6Pz4ZcBZGksJ1i+VpGS3oGPunNfu2ol+gWk=;
        b=4A69vVyBY00AslpkG+ojG49b66jBtDjBLiYnQHBXjYpbDoPmDJ5spVlJ09BT1NlFfv
         sBu4DwQZsSsiB9oFZpC75Cw6Jot0R0/rCvWLEmQlbNlLowNilvokClQr5VtkVCdmvyC+
         16tZp9ot5vVRQfxJHm8p8W29S9Sn0cLO9LTb0r06HwNzJEIiR2gVhpzwjVCBJR++YGKa
         4j6SbnUIl6U/9qFHIomonu7DHRCIEiir/I0D+bfUdPw3NSs2m0PnoIZ5+ceIFMeeZBwe
         IL8ngjKTUSogDrzWyZZwMXD5oA+RKVPvFxgPE/nnJiCSBMI+iG3nUlTtTt8+zeF+hZpi
         uUSw==
X-Gm-Message-State: AOAM532ibUWozpFM+6mCIgcXy1+aLW7rN6QAb6rLpvpaW1pI1Vfj9pjX
        spDqLNiG8P7PIPIXHBRk5Tqcf1A/GsekZjWtjBLizw==
X-Google-Smtp-Source: ABdhPJxutTS5kPPLXBywQeJtQlOZeaR3VWk+Yk6m9WnIyAA/3JN+E70gN/SRXjMFcriMz/p6OMSYdSsfmTJK/VyRIXs=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr4171083oal.193.1652316879176; Wed, 11
 May 2022 17:54:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 17:54:38 -0700
MIME-Version: 1.0
In-Reply-To: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 11 May 2022 17:54:38 -0700
Message-ID: <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
> As msm_drm_uninit() is called from the msm_drm_init() error path,
> additional care should be necessary as not to call the free_irq() for
> the IRQ that was not requested before (because an error occured earlier
> than the request_irq() call).
>
> This fixed the issue reported with the following backtrace:
>
> [    8.571329] Trying to free already-free IRQ 187
> [    8.571339] WARNING: CPU: 0 PID: 76 at kernel/irq/manage.c:1895 free_i=
rq+0x1e0/0x35c
> [    8.588746] Modules linked in: pmic_glink pdr_interface fastrpc qrtr_s=
md snd_soc_hdmi_codec msm fsa4480 gpu_sched drm_dp_aux_bus qrtr i2c_qcom_ge=
ni crct10dif_ce qcom_stats qcom_q6v5_pas drm_display_helper gpi qcom_pil_in=
fo drm_kms_helper qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qcom_rn=
g mdt_loader qmi_helpers phy_qcom_qmp ufs_qcom typec qnoc_sm8350 socinfo rm=
tfs_mem fuse drm ipv6
> [    8.624154] CPU: 0 PID: 76 Comm: kworker/u16:2 Not tainted 5.18.0-rc5-=
next-20220506-00033-g6cee8cab6089-dirty #419
> [    8.624161] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
> [    8.641496] Workqueue: events_unbound deferred_probe_work_func
> [    8.647510] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    8.654681] pc : free_irq+0x1e0/0x35c
> [    8.658454] lr : free_irq+0x1e0/0x35c
> [    8.662228] sp : ffff800008ab3950
> [    8.665642] x29: ffff800008ab3950 x28: 0000000000000000 x27: ffff16350=
f56a700
> [    8.672994] x26: ffff1635025df080 x25: ffff16350251badc x24: ffff16350=
251bb90
> [    8.680343] x23: 0000000000000000 x22: 00000000000000bb x21: ffff16350=
e8f9800
> [    8.687690] x20: ffff16350251ba00 x19: ffff16350cbd5880 x18: fffffffff=
fffffff
> [    8.695039] x17: 0000000000000000 x16: ffffa2dd12179434 x15: ffffa2dd1=
431d02d
> [    8.702391] x14: 0000000000000000 x13: ffffa2dd1431d028 x12: 662d79646=
165726c
> [    8.709740] x11: ffffa2dd13fd2438 x10: 000000000000000a x9 : 000000000=
00000bb
> [    8.717111] x8 : ffffa2dd13fd23f0 x7 : ffff800008ab3750 x6 : 00000000f=
ffff202
> [    8.724487] x5 : ffff16377e870a18 x4 : 00000000fffff202 x3 : ffff735a6=
ae1b000
> [    8.731851] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff16350=
15f8000
> [    8.739217] Call trace:
> [    8.741755]  free_irq+0x1e0/0x35c
> [    8.745198]  msm_drm_uninit.isra.0+0x14c/0x294 [msm]
> [    8.750548]  msm_drm_bind+0x28c/0x5d0 [msm]
> [    8.755081]  try_to_bring_up_aggregate_device+0x164/0x1d0
> [    8.760657]  __component_add+0xa0/0x170
> [    8.764626]  component_add+0x14/0x20
> [    8.768337]  dp_display_probe+0x2a4/0x464 [msm]
> [    8.773242]  platform_probe+0x68/0xe0
> [    8.777043]  really_probe.part.0+0x9c/0x28c
> [    8.781368]  __driver_probe_device+0x98/0x144
> [    8.785871]  driver_probe_device+0x40/0x140
> [    8.790191]  __device_attach_driver+0xb4/0x120
> [    8.794788]  bus_for_each_drv+0x78/0xd0
> [    8.798751]  __device_attach+0xdc/0x184
> [    8.802713]  device_initial_probe+0x14/0x20
> [    8.807031]  bus_probe_device+0x9c/0xa4
> [    8.810991]  deferred_probe_work_func+0x88/0xc0
> [    8.815667]  process_one_work+0x1d0/0x320
> [    8.819809]  worker_thread+0x14c/0x444
> [    8.823688]  kthread+0x10c/0x110
> [    8.827036]  ret_from_fork+0x10/0x20
>
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Fixes: f026e431cf86 ("drm/msm: Convert to Linux IRQ interfaces")

Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
clearing hw interrupts if hw_intr is null during drm uninit")? I mean
that with this patch applied kms->irq_requested makes the check in
dpu_core_irq_uninstall() irrelevant because it isn't called anymore?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

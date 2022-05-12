Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4B95241CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 03:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349761AbiELBBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 21:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349759AbiELBBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 21:01:45 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBE86FD34
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:01:43 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2fb9a85a124so36730247b3.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 18:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WWRJj+PKSmtS44eqM2vTrLbDpqhuu5KUbcfGg7pUQuk=;
        b=ReDsiy86zmP4FBzHBStuQ/KOPVhYe0Hivw24rMdDayF2fTC+PQAhHHkU4eMCYPCmSK
         mEm7JpLpQ/39Pa2Kk3L72xspdSnIjBTcrOigCAI8MC6CBBb8bpTLb2R0+3nMlNSSXdYJ
         9CeWr893SBV3ecaZ5tP+/QUJT/0j1P+amNBgsoONTrSakh1stP6Brjks5HUMVdbPL8Yq
         1QxiF5gJ/mOeqVwhT/EGRcD+A1DmrO8AqETKA8rhAtfMbFBQ0NpI2Iv9Puh75R0UhXL/
         iAR/dR2RraOAXYzUGleTvGVNpximYJ8kpK8dO4AkUYlx4o+B4drxW1Xtx8dRvJPKBEbq
         vBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WWRJj+PKSmtS44eqM2vTrLbDpqhuu5KUbcfGg7pUQuk=;
        b=A6X7c1W7saExOIEcwazHso37p8ZD72PUKVpnrLic/UpN/RJ5tyNB03ag6YwfYYNfZ0
         9/j2aH8AljaDq6PkzySsYkVjiIJf6klOEiGNB4XVdH4oYYcAoLxRcaQB0KpVenw5eGtz
         rn/b3fayk14uQEPmVK+0GRuJsYyPlCf/HWnxJPwXrz/HHBqR4WVFwItIKkSnEmTIcRPU
         mTR7F0SU4kOPDrGfxcFuXJr2WBB+mIvDg+kyJ1Jan+sdAN3BbrGQyqmR7AQClWpbO+H6
         SCTgVP4ILzFpgwnrPVOayXSazOzrNj5IwVVwWAoa7LxrqE09qum2ZVhTROEsMeIOvYx7
         Up6Q==
X-Gm-Message-State: AOAM532h/tf0H7DwQ8nAsHyGbg40lpjAxp0T0K1AXsj6DgJpOaWDuzHT
        y+2ObQMM7mULEIXyjA0HakNV5w/HAk29FzhS4Gv3PA==
X-Google-Smtp-Source: ABdhPJwkyptMeobm0+gog4+87rwy4TXESr5YO1c8CXfAhqKbCYI7b9A2dIcp29hIZjQz3rkwbqVtHuw5Q8GuE6s8KLk=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr28999137ywe.359.1652317302362; Wed, 11
 May 2022 18:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org> <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
In-Reply-To: <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 12 May 2022 04:01:31 +0300
Message-ID: <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
> > As msm_drm_uninit() is called from the msm_drm_init() error path,
> > additional care should be necessary as not to call the free_irq() for
> > the IRQ that was not requested before (because an error occured earlier
> > than the request_irq() call).
> >
> > This fixed the issue reported with the following backtrace:
> >
> > [    8.571329] Trying to free already-free IRQ 187
> > [    8.571339] WARNING: CPU: 0 PID: 76 at kernel/irq/manage.c:1895 free=
_irq+0x1e0/0x35c
> > [    8.588746] Modules linked in: pmic_glink pdr_interface fastrpc qrtr=
_smd snd_soc_hdmi_codec msm fsa4480 gpu_sched drm_dp_aux_bus qrtr i2c_qcom_=
geni crct10dif_ce qcom_stats qcom_q6v5_pas drm_display_helper gpi qcom_pil_=
info drm_kms_helper qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qcom_=
rng mdt_loader qmi_helpers phy_qcom_qmp ufs_qcom typec qnoc_sm8350 socinfo =
rmtfs_mem fuse drm ipv6
> > [    8.624154] CPU: 0 PID: 76 Comm: kworker/u16:2 Not tainted 5.18.0-rc=
5-next-20220506-00033-g6cee8cab6089-dirty #419
> > [    8.624161] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (D=
T)
> > [    8.641496] Workqueue: events_unbound deferred_probe_work_func
> > [    8.647510] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [    8.654681] pc : free_irq+0x1e0/0x35c
> > [    8.658454] lr : free_irq+0x1e0/0x35c
> > [    8.662228] sp : ffff800008ab3950
> > [    8.665642] x29: ffff800008ab3950 x28: 0000000000000000 x27: ffff163=
50f56a700
> > [    8.672994] x26: ffff1635025df080 x25: ffff16350251badc x24: ffff163=
50251bb90
> > [    8.680343] x23: 0000000000000000 x22: 00000000000000bb x21: ffff163=
50e8f9800
> > [    8.687690] x20: ffff16350251ba00 x19: ffff16350cbd5880 x18: fffffff=
fffffffff
> > [    8.695039] x17: 0000000000000000 x16: ffffa2dd12179434 x15: ffffa2d=
d1431d02d
> > [    8.702391] x14: 0000000000000000 x13: ffffa2dd1431d028 x12: 662d796=
46165726c
> > [    8.709740] x11: ffffa2dd13fd2438 x10: 000000000000000a x9 : 0000000=
0000000bb
> > [    8.717111] x8 : ffffa2dd13fd23f0 x7 : ffff800008ab3750 x6 : 0000000=
0fffff202
> > [    8.724487] x5 : ffff16377e870a18 x4 : 00000000fffff202 x3 : ffff735=
a6ae1b000
> > [    8.731851] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff163=
5015f8000
> > [    8.739217] Call trace:
> > [    8.741755]  free_irq+0x1e0/0x35c
> > [    8.745198]  msm_drm_uninit.isra.0+0x14c/0x294 [msm]
> > [    8.750548]  msm_drm_bind+0x28c/0x5d0 [msm]
> > [    8.755081]  try_to_bring_up_aggregate_device+0x164/0x1d0
> > [    8.760657]  __component_add+0xa0/0x170
> > [    8.764626]  component_add+0x14/0x20
> > [    8.768337]  dp_display_probe+0x2a4/0x464 [msm]
> > [    8.773242]  platform_probe+0x68/0xe0
> > [    8.777043]  really_probe.part.0+0x9c/0x28c
> > [    8.781368]  __driver_probe_device+0x98/0x144
> > [    8.785871]  driver_probe_device+0x40/0x140
> > [    8.790191]  __device_attach_driver+0xb4/0x120
> > [    8.794788]  bus_for_each_drv+0x78/0xd0
> > [    8.798751]  __device_attach+0xdc/0x184
> > [    8.802713]  device_initial_probe+0x14/0x20
> > [    8.807031]  bus_probe_device+0x9c/0xa4
> > [    8.810991]  deferred_probe_work_func+0x88/0xc0
> > [    8.815667]  process_one_work+0x1d0/0x320
> > [    8.819809]  worker_thread+0x14c/0x444
> > [    8.823688]  kthread+0x10c/0x110
> > [    8.827036]  ret_from_fork+0x10/0x20
> >
> > Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Fixes: f026e431cf86 ("drm/msm: Convert to Linux IRQ interfaces")
>
> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
> that with this patch applied kms->irq_requested makes the check in
> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?

Yes.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>



--=20
With best wishes
Dmitry

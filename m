Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B62146451C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 03:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhLAC5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 21:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhLAC5R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 21:57:17 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE7CC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 18:53:57 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id bj13so45496546oib.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 18:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=anb6DSpcRYU4VCYW0ezk9Hei0if1F619u0tYvYp/XGg=;
        b=qp/jjCbAaugQpziX3eVO/IGb1H755qnYVzpXz1+/1v0yC4Bmbv+MWlo6QWyFcD8e8J
         EBTmSsaP8do5Kjf7cCU7O1vpeoJK025PwbgOwwN3KkWwO32G3I33LR3Svp1+nwNHixDL
         07/r6/Bli2Iqq94p4NWkpYFd/8TFi661gqvzm54CeAR63c4i3eRD5t2I50KHxz8bdvaw
         L6tGwjyJL7ehMkdzyYk+Z1yhXiEdcrT473jaQ1hp1XmTwJoivIec4UmTX/i+u0zp9dpm
         2rW2bw29gaYnnHnbw7FX0tD4OKdm/yfHYWGzRXmzavFVQoXpyaF3NZ4WUYX9S/GNKUTI
         Dh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=anb6DSpcRYU4VCYW0ezk9Hei0if1F619u0tYvYp/XGg=;
        b=kChyTkoAU9esZzPlLucMXNYJWPW0sh6lksXcCGvKM+dFDV5GqSPKinOWyrbdHP7qx4
         CD4QbFfNfA/FvwC2bXvQeyiHQXRwPI5v/Yu2SBXDDy2EzaxH/FaL41oJo9onJdCVNhB5
         0vkOhL3WPR+wxhyMolNIh0p8JhwmCmH+f63cqJof4NgEchl+BqPXYd6OIjnINKzvg++3
         wOvydc6OjFsN9QEh+c/od+YS5zV7dHfkvraTxMWZYxA38hYnN3gSL9D3G7ImklHVBMcj
         mi1TY8ay9SK9rMTJ2ZeGVo9BcTXvgIKnWdusYPDML8JG0qC0YzVuXy6PivkV4iLlhGof
         c0qQ==
X-Gm-Message-State: AOAM531UaBTI4FVVcOKyhZtUhWfSzqKPUq/P1xeghwVzEvWyB/k1bJuL
        YkfUF8T5NlLTLcsaALjpvkHu1w==
X-Google-Smtp-Source: ABdhPJzfjddvUgt5E+LHJJ9gTXZMHQrcmbt47KxOuNjO10DLwaw01ymU8laNwLYMBW749fhiQv/lLg==
X-Received: by 2002:aca:5e03:: with SMTP id s3mr3356191oib.27.1638327237165;
        Tue, 30 Nov 2021 18:53:57 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s17sm3482126otp.20.2021.11.30.18.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 18:53:56 -0800 (PST)
Date:   Tue, 30 Nov 2021 20:53:51 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: fix exception in error path
Message-ID: <Yabjv2pnC1KlQGhS@builder.lan>
References: <20211125180123.561305-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125180123.561305-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Nov 12:01 CST 2021, Dmitry Baryshkov wrote:

> In case of DPU probe failure, prevent the following NULL pointer
> exception:
> 
> [    3.976112] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
> [    3.984983] Mem abort info:
> [    3.987800]   ESR = 0x96000004
> [    3.990891]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    3.996251]   SET = 0, FnV = 0
> [    3.996254]   EA = 0, S1PTW = 0
> [    3.996257]   FSC = 0x04: level 0 translation fault
> [    3.996260] Data abort info:
> [    3.996262]   ISV = 0, ISS = 0x00000004
> [    4.005229]   CM = 0, WnR = 0
> [    4.028893] [0000000000000030] user address but active_mm is swapper
> [    4.035305] Internal error: Oops: 96000004 [#1] SMP
> [    4.040223] Modules linked in:
> [    4.043317] CPU: 1 PID: 50 Comm: kworker/u16:2 Not tainted 5.16.0-rc1-00036-g6d4bafcbb015-dirty #166
> [    4.052518] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    4.058224] Workqueue: events_unbound deferred_probe_work_func
> [    4.064105] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.071124] pc : dpu_core_irq_uninstall+0x28/0x100
> [    4.075960] lr : dpu_core_irq_uninstall+0x24/0x100
> [    4.080793] sp : ffff80001057b990
> [    4.084138] x29: ffff80001057b990 x28: ffff7653c0a41c00 x27: ffff7653c0926480
> [    4.091330] x26: ffffb90d5d262ad0 x25: ffff7653c4b2e980 x24: ffff7653c0046080
> [    4.098520] x23: ffff7653c099a810 x22: ffff7653c5a65800 x21: ffff7653c5a65080
> [    4.105711] x20: ffff7653c5a65800 x19: ffff7653c0046080 x18: 0000000000000034
> [    4.112902] x17: 0000000000000038 x16: 0000000000000005 x15: 000000000000000c
> [    4.120095] x14: 000000000000024c x13: ffff7653c2f90358 x12: 0000000000000000
> [    4.127287] x11: ffff7653c2f903b0 x10: 00000000000009c0 x9 : ffff80001057b180
> [    4.134477] x8 : ffff80001057b404 x7 : 0000000000000000 x6 : ffff7653c5a5f190
> [    4.141669] x5 : ffff80001057b890 x4 : 0000000000000000 x3 : ffff7653c5a5f0f4
> [    4.148859] x2 : ffff7653c2f50000 x1 : 0000000000000000 x0 : 0000000000000000
> [    4.156052] Call trace:
> [    4.158525]  dpu_core_irq_uninstall+0x28/0x100
> [    4.163004]  dpu_irq_uninstall+0x10/0x20
> [    4.166963]  msm_drm_uninit.isra.0+0xe0/0x1b0
> [    4.171353]  msm_drm_bind+0x278/0x5f0
> [    4.175043]  try_to_bring_up_master+0x164/0x1d0
> [    4.179610]  __component_add+0xa0/0x170
> [    4.183482]  component_add+0x14/0x20
> [    4.187086]  dsi_dev_probe+0x1c/0x30
> [    4.190691]  platform_probe+0x68/0xe0
> [    4.194382]  really_probe.part.0+0x9c/0x30c
> [    4.198601]  __driver_probe_device+0x98/0x144
> [    4.202990]  driver_probe_device+0x44/0x15c
> [    4.207208]  __device_attach_driver+0xb4/0x120
> [    4.211685]  bus_for_each_drv+0x78/0xd0
> [    4.215549]  __device_attach+0xdc/0x184
> [    4.219412]  device_initial_probe+0x14/0x20
> [    4.223630]  bus_probe_device+0x9c/0xa4
> [    4.227503]  deferred_probe_work_func+0x88/0xc0
> [    4.232075]  process_one_work+0x1e8/0x380
> [    4.236126]  worker_thread+0x280/0x520
> [    4.239902]  kthread+0x168/0x174
> [    4.243166]  ret_from_fork+0x10/0x20
> [    4.246778] Code: f9442400 91004000 940188b9 f9430660 (b9403001)
> [    4.252925] ---[ end trace b470a50cd7b5e606 ]---
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index d2b6dca487e3..fc1b6c47c93d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -575,6 +575,9 @@ void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
>  {
>  	int i;
>  
> +	if (!dpu_kms->hw_intr)
> +		return;

I would rather see that we fix msm_drm_init() to nicely unroll things in
a more granular fashion instead of handle all types of errors with the
big hammer that msm_drm_uninit() provides.

Regards,
Bjorn

> +
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
>  	for (i = 0; i < dpu_kms->hw_intr->total_irqs; i++)
>  		if (!list_empty(&dpu_kms->hw_intr->irq_cb_tbl[i]))
> -- 
> 2.33.0
> 

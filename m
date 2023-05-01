Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251E16F3977
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbjEAU4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjEAU4b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:56:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A94123
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:56:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4ec8149907aso3721996e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682974588; x=1685566588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRi8WeWbFUqJuehlBhyZd78a/p9Tg8JwKR1fy0aT0Jg=;
        b=ddsTfsgnDYaHHdX1g4taaGDyH2sPtMkYxmVUyu/MOxweHpFL+sUoh+LIOPidLdRN4/
         GsuTDoggzA4y+41/eWfa5RhT34nAXN8NDKxwtnS1oGZZvpNR2ziTJwNXjg8ZibF6dln4
         mQoAXHAwYY6FuPLM7yEpjGZVTL08G3s5IoWBQbHwVDDzoOllVOnY/DgrU2PO3KPcva36
         UTsZoBNyTpyk2L1rP3iHMgTQ7bLLDJpOfRg/RcBsXY1kdcPdGailIC/MoJjJ01bdHaZT
         9QdATURzOOANSO+kdGNHM4vPZrECagQYmAA2o1F7J8WACpLGzd/B20sb0xWBceGIoUVW
         nqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682974588; x=1685566588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRi8WeWbFUqJuehlBhyZd78a/p9Tg8JwKR1fy0aT0Jg=;
        b=ifzGsSWF4Vp95oZmXYkFGxdyvksmzYK1YmmJfjK7ZuhRdwG5RZd0xilG8agxshYDkZ
         KQ4eT/mfiVlpwejMCa5e60KxhN0HSrukeA+ETk6xmkJwG5f43s4PWNyXwe4Urr+76MFV
         96IfF06m8FV1hJct1L0DMxO+2CgDrOa1VfLaudpWbwwyY3SzmiFvU6noG5drhckFron2
         VDqozd7v6rjwb/a8L9YAhHu63CDktDM5fhg1hnm3fJqBs/NhEteGtStnk1qKJy2YalIt
         sSOX8tl3tbv7IYrewnm6WDGQtLz7nfYvVmCPnjRa4nOn5dG6OTWnu8RVh3Tye755n9ok
         ZHkw==
X-Gm-Message-State: AC+VfDw0eyWxt2IhPtwGhJN+676TZktM7ntsFeCeZwtPvm3NQd5lNwWn
        3BrTH+ASvbMMpr6nNo4k1xoRDQ==
X-Google-Smtp-Source: ACHHUZ7/wdm93DxRBAvt2OwUx/l0GuYYMfX+zGJ+Yy7jSPEk21ffkc8d/WR+DjJ/+FbE9Kqcs2CB8Q==
X-Received: by 2002:ac2:5691:0:b0:4ed:bdac:7a49 with SMTP id 17-20020ac25691000000b004edbdac7a49mr4895238lfr.54.1682974587748;
        Mon, 01 May 2023 13:56:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v22-20020ac25596000000b004e845b49d81sm4931174lfg.140.2023.05.01.13.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 13:56:27 -0700 (PDT)
Message-ID: <f2b7e6cf-d747-efb8-820c-41e4eef6cbb3@linaro.org>
Date:   Mon, 1 May 2023 23:56:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/msm: Set max segment size earlier
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230501204441.1642741-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230501204441.1642741-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 23:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the following splat on a6xx gen2+ (a640, a650, a660 families),
> a6xx gen1 has smaller GMU allocations so they fit under the default
> 64K max segment size.
> 
>     ------------[ cut here ]------------
>     DMA-API: msm_dpu ae01000.display-controller: mapping sg segment longer than device claims to support [len=126976] [max=65536]
>     WARNING: CPU: 5 PID: 9 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x288/0x314
>     Modules linked in:
>     CPU: 5 PID: 9 Comm: kworker/u16:0 Not tainted 6.3.0-rc2-debug+ #629
>     Hardware name: Google Villager (rev1+) with LTE (DT)
>     Workqueue: events_unbound deferred_probe_work_func
>     pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : debug_dma_map_sg+0x288/0x314
>     lr : debug_dma_map_sg+0x288/0x314
>     sp : ffffffc00809b560
>     x29: ffffffc00809b560 x28: 0000000000000060 x27: 0000000000000000
>     x26: 0000000000010000 x25: 0000000000000004 x24: 0000000000000004
>     x23: ffffffffffffffff x22: ffffffdb31693cc0 x21: ffffff8080935800
>     x20: ffffff8087417400 x19: ffffff8087a45010 x18: 0000000000000000
>     x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000010000
>     x14: 0000000000000001 x13: ffffffffffffffff x12: ffffffffffffffff
>     x11: 0000000000000000 x10: 000000000000000a x9 : ffffffdb2ff05e14
>     x8 : ffffffdb31275000 x7 : ffffffdb2ff08908 x6 : 0000000000000000
>     x5 : 0000000000000001 x4 : ffffffdb2ff08a74 x3 : ffffffdb31275008
>     x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff80803a9a80
>     Call trace:
>      debug_dma_map_sg+0x288/0x314
>      __dma_map_sg_attrs+0x80/0xe4
>      dma_map_sgtable+0x30/0x4c
>      get_pages+0x1d4/0x1e4
>      msm_gem_pin_pages_locked+0xbc/0xf8
>      msm_gem_pin_vma_locked+0x58/0xa0
>      msm_gem_get_and_pin_iova_range+0x98/0xac
>      a6xx_gmu_memory_alloc+0x7c/0x128
>      a6xx_gmu_init+0x16c/0x9b0
>      a6xx_gpu_init+0x38c/0x3e4
>      adreno_bind+0x214/0x264
>      component_bind_all+0x128/0x1f8
>      msm_drm_bind+0x2b8/0x608
>      try_to_bring_up_aggregate_device+0x88/0x1a4
>      __component_add+0xec/0x13c
>      component_add+0x1c/0x28
>      dp_display_probe+0x3f8/0x43c
>      platform_probe+0x70/0xc4
>      really_probe+0x148/0x280
>      __driver_probe_device+0xc8/0xe0
>      driver_probe_device+0x44/0x100
>      __device_attach_driver+0x64/0xdc
>      bus_for_each_drv+0xb0/0xd8
>      __device_attach+0xd8/0x168
>      device_initial_probe+0x1c/0x28
>      bus_probe_device+0x44/0xb0
>      deferred_probe_work_func+0xc8/0xe0
>      process_one_work+0x2e0/0x488
>      process_scheduled_works+0x4c/0x50
>      worker_thread+0x218/0x274
>      kthread+0xf0/0x100
>      ret_from_fork+0x10/0x20
>     irq event stamp: 293712
>     hardirqs last  enabled at (293711): [<ffffffdb2ff0893c>] vprintk_emit+0x160/0x25c
>     hardirqs last disabled at (293712): [<ffffffdb30b48130>] el1_dbg+0x24/0x80
>     softirqs last  enabled at (279520): [<ffffffdb2fe10420>] __do_softirq+0x21c/0x4bc
>     softirqs last disabled at (279515): [<ffffffdb2fe16708>] ____do_softirq+0x18/0x24
>     ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I think this should be:

Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 3a74b5653e96..6dec1a3534f2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -440,27 +440,27 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	fs_reclaim_acquire(GFP_KERNEL);
>   	might_lock(&priv->lru.lock);
>   	fs_reclaim_release(GFP_KERNEL);
>   
>   	drm_mode_config_init(ddev);
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
>   		goto err_drm_dev_put;
>   
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
>   	if (ret)
>   		goto err_drm_dev_put;
>   
> -	dma_set_max_seg_size(dev, UINT_MAX);
> -
>   	msm_gem_shrinker_init(ddev);
>   
>   	if (priv->kms_init) {
>   		ret = priv->kms_init(ddev);
>   		if (ret) {
>   			DRM_DEV_ERROR(dev, "failed to load kms\n");
>   			priv->kms = NULL;
>   			goto err_msm_uninit;
>   		}
>   		kms = priv->kms;

-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD177784922
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 20:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjHVSCz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 14:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjHVSCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 14:02:53 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E141EE7D;
        Tue, 22 Aug 2023 11:02:48 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso1784995b3a.1;
        Tue, 22 Aug 2023 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692727368; x=1693332168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohQPQ3RbmGvwFXH5LBOtT5c2WOdasN5TfZleONgpB+o=;
        b=P5G8E7Un6MCNIPG2MI7BuwxOg82Je9N69Zw/H0AjV+TYhIgoBiozF24l4jGoxGfZ+P
         sWA879giRcjRsvB4TlGEl4QBSmtvE/Fp7hpHtUgnk06/QzN6vbhuQGRPxp2WGX5dyZhb
         EQrM7slzaYG8I43WvhzzRLZgMKUXzf0Siwbhs9AjXe/TzTDjW6YXmEeZPPTWIHhhy/6V
         jtQw+lzjgDs4ftrF3D5Jo/+lfCQrjlO1X0S/92SMYjfdlcxeSf8TBsrB1rP7vVqDagFc
         xj03ToBxj6sKwmbD21HOx4vWJzwjLFrS7EjfexWDPxJTbGYDj2ZIQTlKLZg11dq2jnzq
         e2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692727368; x=1693332168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohQPQ3RbmGvwFXH5LBOtT5c2WOdasN5TfZleONgpB+o=;
        b=JX8IWSpQbDQXDbFKkc8oPfk5wXaux8JOzdxFFi62gYOqLXD94JHmG6oHNlacbGG/xU
         WgldCCMklM11wPrwgDK0TkUSJiTIYG2DRiJHTK9UbP1kZ83M66f+9mwcjxFUOp8qy5BR
         mtflmSoIeAJtuEWqFgIv2zRm3aiKUxPvimA9qOaJFiIsnc9CLy02ah9F2i7eEnJ8nMRS
         XF/U5V0ZYakqYEQJKBKkpf8MBeRJGb8HuZaSAz4bfYAhZX/Z8oV4Dp5EeajOqLpXvXOe
         POCMJ96afi597zcgEYbhWp4IoGstczPSvZ30d/v0pvab43cvP4R3ZsMUxbICwxLMu8xI
         32KA==
X-Gm-Message-State: AOJu0YzNeX0UDbEp65SxT7BwuSdjw0KHlqzuoZvpuPYM5Yz6KhpkDLrN
        3la4209yuuR2SueVq3iQi4g=
X-Google-Smtp-Source: AGHT+IHKCAWElozERgCtJh8QenYdCTaQu+rcrCEfDOO7sn+tOLXNwiu2yem2lKTJm97KakHVNAr7AA==
X-Received: by 2002:aa7:8883:0:b0:68a:4261:ab6d with SMTP id z3-20020aa78883000000b0068a4261ab6dmr6715601pfe.26.1692727368222;
        Tue, 22 Aug 2023 11:02:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78d19000000b0063b96574b8bsm7934537pfe.220.2023.08.22.11.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 11:02:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 08/11] drm/msm/a6xx: Remove GMU lock from runpm paths
Date:   Tue, 22 Aug 2023 11:01:55 -0700
Message-ID: <20230822180208.95556-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822180208.95556-1-robdclark@gmail.com>
References: <20230822180208.95556-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The locking is unneeded here as runpm provides sufficient serialization.
Fixes:

   ======================================================
   WARNING: possible circular locking dependency detected
   6.4.3-debug+ #16 Not tainted
   ------------------------------------------------------
   kworker/5:2/211 is trying to acquire lock:
   ffffffd577cefb98 (prepare_lock){+.+.}-{3:3}, at: clk_prepare_lock+0x70/0x98

   but task is already holding lock:
   ffffff809db316c0 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}, at: a6xx_gmu_pm_suspend+0x4c/0xb4 [msm]

   which lock already depends on the new lock.

   the existing dependency chain (in reverse order) is:

   -> #3 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}:
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          a6xx_gmu_resume+0xf0/0x7f8 [msm]
          a6xx_gmu_pm_resume+0x38/0x158 [msm]
          adreno_runtime_resume+0x2c/0x38 [msm]
          pm_generic_runtime_resume+0x30/0x44
          __rpm_callback+0x4c/0x134
          rpm_callback+0x78/0x7c
          rpm_resume+0x3a4/0x46c
          __pm_runtime_resume+0x78/0xbc
          pm_runtime_get_sync.isra.0+0x14/0x20 [msm]
          msm_gpu_submit+0x3c/0x130 [msm]
          msm_job_run+0x84/0x11c [msm]
          drm_sched_main+0x264/0x354 [gpu_sched]
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #2 (dma_fence_map){++++}-{0:0}:
          __dma_fence_might_wait+0x74/0xc0
          dma_fence_wait_timeout+0x50/0x174
          dma_resv_wait_timeout+0x58/0xa8
          active_evict+0x30/0x5c [msm]
          drm_gem_lru_scan+0x15c/0x1c8
          msm_gem_shrinker_scan+0x124/0x204 [msm]
          do_shrink_slab+0x194/0x324
          shrink_slab+0x270/0x2ec
          shrink_node+0x278/0x674
          do_try_to_free_pages+0x2dc/0x41c
          try_to_free_pages+0x13c/0x1e4
          __alloc_pages+0x364/0xb44
          __folio_alloc+0x24/0x60
          __read_swap_cache_async+0x10c/0x1fc
          swap_cluster_readahead+0x1ac/0x234
          shmem_swapin+0x6c/0xb0
          shmem_swapin_folio+0x208/0x66c
          shmem_get_folio_gfp+0x13c/0x650
          shmem_read_folio_gfp+0x68/0xb0
          shmem_read_mapping_page_gfp+0x20/0x44
          drm_gem_get_pages+0xd4/0x1bc
          get_pages+0x54/0x1e4 [msm]
          msm_gem_pin_pages_locked+0x38/0xac [msm]
          msm_gem_pin_vma_locked+0x58/0x88 [msm]
          msm_ioctl_gem_submit+0xde4/0x13ac [msm]
          drm_ioctl_kernel+0xe0/0x15c
          drm_ioctl+0x2e8/0x3f4
          vfs_ioctl+0x30/0x50
          __arm64_sys_ioctl+0x80/0xb4
          invoke_syscall+0x8c/0x128
          el0_svc_common.constprop.0+0xdc/0x110
          do_el0_svc+0x94/0xa4
          el0_svc+0x44/0x88
          el0t_64_sync_handler+0xac/0x13c
          el0t_64_sync+0x190/0x194

   -> #1 (fs_reclaim){+.+.}-{0:0}:
          __fs_reclaim_acquire+0x3c/0x48
          fs_reclaim_acquire+0x50/0x9c
          slab_pre_alloc_hook.constprop.0+0x40/0x250
          __kmem_cache_alloc_node+0x60/0x18c
          kmalloc_trace+0x44/0x88
          clk_rcg2_dfs_determine_rate+0x60/0x214
          clk_core_determine_round_nolock+0xb8/0xf0
          clk_core_round_rate_nolock+0x84/0x118
          clk_core_round_rate_nolock+0xd8/0x118
          clk_round_rate+0x6c/0xd0
          geni_se_clk_tbl_get+0x78/0xc0
          geni_se_clk_freq_match+0x44/0xe4
          get_spi_clk_cfg+0x50/0xf4
          geni_spi_set_clock_and_bw+0x54/0x104
          spi_geni_prepare_message+0x130/0x174
          __spi_pump_transfer_message+0x200/0x4d8
          __spi_sync+0x13c/0x23c
          spi_sync_locked+0x18/0x24
          do_cros_ec_pkt_xfer_spi+0x124/0x3f0
          cros_ec_xfer_high_pri_work+0x28/0x3c
          kthread_worker_fn+0x14c/0x27c
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   -> #0 (prepare_lock){+.+.}-{3:3}:
          __lock_acquire+0xdf8/0x109c
          lock_acquire+0x234/0x284
          __mutex_lock+0xc8/0x388
          mutex_lock_nested+0x2c/0x38
          clk_prepare_lock+0x70/0x98
          clk_unprepare+0x2c/0x48
          clk_bulk_unprepare+0x48/0x4c
          a6xx_gmu_stop+0x94/0x260 [msm]
          a6xx_gmu_pm_suspend+0x54/0xb4 [msm]
          adreno_runtime_suspend+0x38/0x44 [msm]
          pm_generic_runtime_suspend+0x30/0x44
          __rpm_callback+0x4c/0x134
          rpm_callback+0x78/0x7c
          rpm_suspend+0x28c/0x44c
          pm_runtime_work+0xa0/0xa4
          process_one_work+0x288/0x3d8
          worker_thread+0x1f0/0x260
          kthread+0xf0/0x100
          ret_from_fork+0x10/0x20

   other info that might help us debug this:

   Chain exists of:
     prepare_lock --> dma_fence_map --> &a6xx_gpu->gmu.lock

    Possible unsafe locking scenario:

          CPU0                    CPU1
          ----                    ----
     lock(&a6xx_gpu->gmu.lock);
                                  lock(dma_fence_map);
                                  lock(&a6xx_gpu->gmu.lock);
     lock(prepare_lock);

    *** DEADLOCK ***

   3 locks held by kworker/5:2/211:
    #0: ffffff808091d138 ((wq_completion)pm){+.+.}-{0:0}, at: process_one_work+0x1a0/0x3d8
    #1: ffffffc00aa73e00 ((work_completion)(&dev->power.work)){+.+.}-{0:0}, at: process_one_work+0x1a0/0x3d8
    #2: ffffff809db316c0 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}, at: a6xx_gmu_pm_suspend+0x4c/0xb4 [msm]

   stack backtrace:
   CPU: 5 PID: 211 Comm: kworker/5:2 Not tainted 6.4.3-debug+ #16
   Hardware name: Google Villager (rev1+) with LTE (DT)
   Workqueue: pm pm_runtime_work
   Call trace:
    dump_backtrace+0xb4/0xf0
    show_stack+0x20/0x30
    dump_stack_lvl+0x60/0x84
    dump_stack+0x18/0x24
    print_circular_bug+0x1cc/0x234
    check_noncircular+0x78/0xac
    __lock_acquire+0xdf8/0x109c
    lock_acquire+0x234/0x284
    __mutex_lock+0xc8/0x388
    mutex_lock_nested+0x2c/0x38
    clk_prepare_lock+0x70/0x98
    clk_unprepare+0x2c/0x48
    clk_bulk_unprepare+0x48/0x4c
    a6xx_gmu_stop+0x94/0x260 [msm]
    a6xx_gmu_pm_suspend+0x54/0xb4 [msm]
    adreno_runtime_suspend+0x38/0x44 [msm]
    pm_generic_runtime_suspend+0x30/0x44
    __rpm_callback+0x4c/0x134
    rpm_callback+0x78/0x7c
    rpm_suspend+0x28c/0x44c
    pm_runtime_work+0xa0/0xa4
    process_one_work+0x288/0x3d8
    worker_thread+0x1f0/0x260
    kthread+0xf0/0x100
    ret_from_fork+0x10/0x20

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 67dd2eeecf62..3993a5b0067b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1914,9 +1914,7 @@ static int a6xx_gmu_pm_resume(struct msm_gpu *gpu)
 
 	trace_msm_gpu_resume(0);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
 	ret = a6xx_gmu_resume(a6xx_gpu);
-	mutex_unlock(&a6xx_gpu->gmu.lock);
 	if (ret)
 		return ret;
 
@@ -1940,12 +1938,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 
 	trace_msm_gpu_resume(0);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
 	opp = dev_pm_opp_find_freq_ceil(&gpu->pdev->dev, &freq);
 	if (IS_ERR(opp)) {
-		ret = PTR_ERR(opp);
-		goto err_set_opp;
+		return PTR_ERR(opp);
 	}
 	dev_pm_opp_put(opp);
 
@@ -1969,8 +1964,6 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 		pm_runtime_put(gmu->dev);
 		dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
 	}
-err_set_opp:
-	mutex_unlock(&a6xx_gpu->gmu.lock);
 
 	if (!ret)
 		msm_devfreq_resume(gpu);
@@ -1990,9 +1983,7 @@ static int a6xx_gmu_pm_suspend(struct msm_gpu *gpu)
 
 	msm_devfreq_suspend(gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
 	ret = a6xx_gmu_stop(a6xx_gpu);
-	mutex_unlock(&a6xx_gpu->gmu.lock);
 	if (ret)
 		return ret;
 
@@ -2016,8 +2007,6 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	msm_devfreq_suspend(gpu);
 
-	mutex_lock(&a6xx_gpu->gmu.lock);
-
 	/* Drain the outstanding traffic on memory buses */
 	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
@@ -2030,8 +2019,6 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
 	pm_runtime_put_sync(gmu->dev);
 
-	mutex_unlock(&a6xx_gpu->gmu.lock);
-
 	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a6xx_gpu->shadow[i] = 0;
-- 
2.41.0


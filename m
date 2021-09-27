Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806244197D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 17:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbhI0P01 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 11:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235213AbhI0P00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 11:26:26 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3FCC061575;
        Mon, 27 Sep 2021 08:24:48 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id k17so16177893pff.8;
        Mon, 27 Sep 2021 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91WTltl5VxlPGr4W7IMTkikDp5yzAAOLWX4XlxfvA04=;
        b=MnWb/E/nNEUD/13bbKjg2jh+pdSUe6ymLUCmsk9n7bjrJzz4yPdZS5ZBqVDiIR4NHf
         4bCX4yCInmF/nkKSis6LdhS7EUN8Ld+mfU2BS9fcm6h5XsAREVO/rgXxgLO9/iw0iPSl
         HBaOy3evwjYMZFh9SGHB66A2O7sfv8DsHgS3yUrcRGQPvhPUl8hfsvB8rjoFfpD6PG1u
         VpWgx539pAFlqr+rWCwas4p2meFPC861+z/d4aXnHoirm4Kf9cpcJ3nYjVZoxwhy5oCX
         kTaApzyd4CQ9TVMf9z6XXqkaFFDLg58V+2uIiPlJEEhd1xu/DM9JwtMbHcFZaTZTiI+P
         gtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91WTltl5VxlPGr4W7IMTkikDp5yzAAOLWX4XlxfvA04=;
        b=JLIu0LGZ/GoO1nAyqI3gdy3HOyfiV6KQBvxS1Tq5JTgRHJAyROxXdyKIsEHuazZP8e
         UykUfHPhRLS1nN/L6Gw4R1MrjjPZGLSbxGOgvNGdFSwYOGKMWu82CozuyAwhawcQdxxb
         KVTOMWiCqCn8lGFPO46SnCB7BYVXPVmcuq+dsTWY2lSZlvX/ElBRTENvOxAL/23JPhzT
         AIk4Yotc82gXS+rSr2pXumBNR6KAJ1gSO1+0kAlyFqmIOExUJ22tpsWUb1cCdlnWmjLh
         gHTJ8lhqzYN150WAG22BZuE2DDsi68ICQsS20y1RnWsySbIfsxu7dTgG/jViCtFhydp3
         Y/2w==
X-Gm-Message-State: AOAM532AWaskEpovgK4rcT+xr7C1XuNNgye8TtwPgPOrTICNhlQ1OV//
        sF8EY8WShmY1n3q/AXtIKok=
X-Google-Smtp-Source: ABdhPJwHP/CZaznyNAeJ0MtR9h7UOdNIz9t9+0/dozEHS2DAPGKfXC0LUiuj/yslWdqz10nvh3Zfrg==
X-Received: by 2002:a05:6a00:4:b0:43d:32f3:e861 with SMTP id h4-20020a056a00000400b0043d32f3e861mr493964pfk.60.1632756288413;
        Mon, 27 Sep 2021 08:24:48 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id s3sm233915pjr.1.2021.09.27.08.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 08:24:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Switch ordering of runpm put vs devfreq_idle
Date:   Mon, 27 Sep 2021 08:29:28 -0700
Message-Id: <20210927152928.831245-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

I've seen a few crashes like:

    Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
    Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp esp6 ah6 ip6t_REJECT ip6t_ipv6header vhost_vsock vhost vmw_vsock_virtio_transport_common vsock rfcomm algif_hash algif_skcipher af_alg uinput veth xt_cgroup xt_MASQUERADE venus_enc venus_dec videobuf2_dma_contig qcom_spmi_adc5 qcom_spmi_adc_tm5 hci_uart qcom_vadc_common cros_ec_typec qcom_spmi_temp_alarm typec btqca snd_soc_rt5682_i2c snd_soc_rt5682 snd_soc_sc7180 bluetooth snd_soc_qcom_common snd_soc_rl6231 ecdh_generic ecc venus_core v4l2_mem2mem snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_max98357a ip6table_nat fuse iio_trig_sysfs cros_ec_lid_angle cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhub lzo_rle ath10k_snoc lzo_compress ath10k_core ath zram mac80211 cfg80211 ax88179_178a usbnet mii uvcvideo videobuf2_vmalloc joydev
    CPU: 3 PID: 212 Comm: A618-worker Tainted: G W 5.4.139-16300-g88d8e1285982 #1
    Hardware name: Google Pompom (rev1) with LTE (DT)
    pstate: 60c00009 (nZCv daif +PAN +UAO)
    pc : a6xx_gmu_set_oob+0x114/0x200
    lr : a6xx_gmu_set_oob+0x10c/0x200
    sp : ffffffc011b7bc20
    x29: ffffffc011b7bc20 x28: ffffffdad27c5000
    x27: 0000000000000001 x26: ffffffdad1521044
    x25: ffffffbef7498338 x24: 0000000000000018
    x23: 0000000000000002 x22: 0000000000014648
    x21: 0000033732fe638b x20: 0000000080000000
    x19: ffffffbef7433bc8 x18: 0000000040000000
    x17: 000000243508d982 x16: 000000000000b67e
    x15: 00000000000090d4 x14: 0000000000000024
    x13: 0000000000000024 x12: 0000000000017521
    x11: 0000000000000b48 x10: 0000000000326a48
    x9 : 1a130d33f6371600 x8 : ffffffc011e54648
    x7 : 614948e00005003c x6 : ffffffbe3cd17e60
    x5 : 0000000000000040 x4 : 0000000000000004
    x3 : 0000000000000000 x2 : ffffffbef7488000
    x1 : ffffffbef7488000 x0 : 0000000000000000
    Call trace:
    a6xx_gmu_set_oob+0x114/0x200
    a6xx_gmu_set_freq+0xe0/0x1fc
    msm_devfreq_target+0x80/0x13c
    msm_devfreq_idle+0x54/0x94
    retire_submit+0x170/0x254
    retire_submits+0xa4/0xdc
    retire_worker+0x1c/0x28
    kthread_worker_fn+0xf4/0x1bc
    kthread+0x140/0x158
    ret_from_fork+0x10/0x18
    Code: 52800c81 9415bbe5 f9400a68 8b160108 (b9400108)
    ---[ end trace 16b871df2482cd61 ]---
    Kernel panic - not syncing: Fatal exception
    SMP: stopping secondary CPUs
    Kernel Offset: 0x1ac1400000 from 0xffffffc010000000
    PHYS_OFFSET: 0xffffffc280000000
    CPU features: 0x88102e,2a80aa38
    Memory Limit: none

Which smells a lot like touching hw after power collapse.  I'm not
*entirely* sure how it could have taken 66ms (the autosuspend delay)
before we get to a6xx_gmu_set_oob(), but to be safe we should move
the pm_runtime_put_autosuspend() after msm_devfreq_idle().

Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index d1a16642ecd5..2b2bbe7499e6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -667,9 +667,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 	msm_submit_retire(submit);
 
-	pm_runtime_mark_last_busy(&gpu->pdev->dev);
-	pm_runtime_put_autosuspend(&gpu->pdev->dev);
-
 	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_del(&submit->node);
 	spin_unlock_irqrestore(&ring->submit_lock, flags);
@@ -683,6 +680,9 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	mutex_unlock(&gpu->active_lock);
 
 	msm_gem_submit_put(submit);
+
+	pm_runtime_mark_last_busy(&gpu->pdev->dev);
+	pm_runtime_put_autosuspend(&gpu->pdev->dev);
 }
 
 static void retire_submits(struct msm_gpu *gpu)
-- 
2.31.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEE454388F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245033AbiFHQN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 12:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245190AbiFHQNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 12:13:25 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7BFC2ED6;
        Wed,  8 Jun 2022 09:13:24 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 129so19345794pgc.2;
        Wed, 08 Jun 2022 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcBQko4cpGjmgYpYJRhuhnU2CSYO7hE4kC+caWY2rnA=;
        b=oQZ6Co7un7vNnnwo0MWy3/ll0w9QKyta6veSEP9n7/tptqGD5afT3k9XtWSF0cUNxa
         PFePEj206aHCS0VFJr4mngObgh30ya1yOEdYiTL5fjvEDedlSFshElmJse3S4N8Cject
         exb21c7IF+GpPNoiLQQMWN2hSJRWYUjr6SYRZYhvEPUXCxr0fB6MbkPZijyJLBRo1Cbx
         zXgh5vgWZ6QZDoSb3tmnDFMdaXCV9Olq4yvHOR89B/tSoJoHHUa7QuPXuFahfLtp/78F
         j0e77VxpwNKNdVk8JZ9USyXz4Vp5L2a0x8afZdBoD4+w5nTrF3YJLec/E/pXN8W6X+F6
         FtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcBQko4cpGjmgYpYJRhuhnU2CSYO7hE4kC+caWY2rnA=;
        b=AI/mWkSmusi/4wXr+PphuTYvSpl2fjQFwf4hGfINeEpHEqTPUvqlKd96kqyHv2fKu8
         pY/oDVOPIvu+9hyAXLnjK8HHNW9DbwE5SPKp78C6BBKPX3dTq4mxduBY9JWaAmq3niM6
         KRESrGA/16N/R9NT2lIw3HcebREc0tEREeVpIpbbOycm9Z/6nzY3Katx2iR2T/Ao4egz
         245s3AvN3X7/yos4q/Y9GPvcC9W6k8XDUxt/REsza2hNSYz9vgVa38lV9mNeDGFr5Hml
         W6OGP9nwBL9J3JVHwK4/RyMl8O/hQdYHeyzNCR+cx64NDvXhuHGjeG/iCvVRcCYj4HTT
         +kng==
X-Gm-Message-State: AOAM531P2+paXDeYTR2LwNpAqkHSgcwiKCyl3z9P/aeQNhQJmnwqGtc9
        GAWKG41Y+cqHJE0K7qBGYcI=
X-Google-Smtp-Source: ABdhPJwdj4TeVR34T3U2JQQQVLO5VGGvV0SXi0bl8R1KnEsKJMkgXRtIFUWA4fiWZ+faIzjfjfHbSg==
X-Received: by 2002:aa7:8691:0:b0:51c:db9:4073 with SMTP id d17-20020aa78691000000b0051c0db94073mr18712151pfo.72.1654704803766;
        Wed, 08 Jun 2022 09:13:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id cp15-20020a170902e78f00b0015e8d4eb213sm14972161plb.93.2022.06.08.09.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 09:13:22 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: Switch ordering of runpm put vs devfreq_idle
Date:   Wed,  8 Jun 2022 09:13:34 -0700
Message-Id: <20220608161334.2140611-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

I've seen a few crashes like:

    CPU: 0 PID: 216 Comm: A618-worker Tainted: G        W         5.4.196 #7
    Hardware name: Google Wormdingler rev1+ INX panel board (DT)
    pstate: 20c00009 (nzCv daif +PAN +UAO)
    pc : msm_readl+0x14/0x34
    lr : a6xx_gpu_busy+0x40/0x80
    sp : ffffffc011b93ad0
    x29: ffffffc011b93ad0 x28: ffffffe77cba3000
    x27: 0000000000000001 x26: ffffffe77bb4c4ac
    x25: ffffffa2f227dfa0 x24: ffffffa2f22aab28
    x23: 0000000000000000 x22: ffffffa2f22bf020
    x21: ffffffa2f22bf000 x20: ffffffc011b93b10
    x19: ffffffc011bd4110 x18: 000000000000000e
    x17: 0000000000000004 x16: 000000000000000c
    x15: 000001be3a969450 x14: 0000000000000400
    x13: 00000000000101d6 x12: 0000000034155555
    x11: 0000000000000001 x10: 0000000000000000
    x9 : 0000000100000000 x8 : ffffffc011bd4000
    x7 : 0000000000000000 x6 : 0000000000000007
    x5 : ffffffc01d8b38f0 x4 : 0000000000000000
    x3 : 00000000ffffffff x2 : 0000000000000002
    x1 : 0000000000000000 x0 : ffffffc011bd4110
    Call trace:
     msm_readl+0x14/0x34
     a6xx_gpu_busy+0x40/0x80
     msm_devfreq_get_dev_status+0x70/0x1d0
     devfreq_simple_ondemand_func+0x34/0x100
     update_devfreq+0x50/0xe8
     qos_notifier_call+0x2c/0x64
     qos_max_notifier_call+0x1c/0x2c
     notifier_call_chain+0x58/0x98
     __blocking_notifier_call_chain+0x74/0x84
     blocking_notifier_call_chain+0x38/0x48
     pm_qos_update_target+0xf8/0x19c
     freq_qos_apply+0x54/0x6c
     apply_constraint+0x60/0x104
     __dev_pm_qos_update_request+0xb4/0x184
     dev_pm_qos_update_request+0x38/0x58
     msm_devfreq_idle_work+0x34/0x40
     kthread_worker_fn+0x144/0x1c8
     kthread+0x140/0x284
     ret_from_fork+0x10/0x18
    Code: f9000bf3 910003fd aa0003f3 d503201f (b9400260)
    ---[ end trace f6309767a42d0831 ]---

Which smells a lot like touching hw after power collapse.  This seems
a bit like a race/timing issue elsewhere, as pm_runtime_get_if_in_use()
in a6xx_gpu_busy() should have kept us from touching hw if it wasn't
powered.

But, we've seen cases where the idle_work scheduled by
msm_devfreq_idle() ends up racing with the resume path.  Which, again,
shouldn't be a problem other than unnecessary freq changes.

v2. Only move the runpm _put_autosuspend, and not the _mark_last_busy()

Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Link: https://lore.kernel.org/r/20210927152928.831245-1-robdclark@gmail.com
---
 drivers/gpu/drm/msm/msm_gpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index eb8a6663f309..244511f85044 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -672,7 +672,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	msm_submit_retire(submit);
 
 	pm_runtime_mark_last_busy(&gpu->pdev->dev);
-	pm_runtime_put_autosuspend(&gpu->pdev->dev);
 
 	spin_lock_irqsave(&ring->submit_lock, flags);
 	list_del(&submit->node);
@@ -686,6 +685,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 		msm_devfreq_idle(gpu);
 	mutex_unlock(&gpu->active_lock);
 
+	pm_runtime_put_autosuspend(&gpu->pdev->dev);
+
 	msm_gem_submit_put(submit);
 }
 
-- 
2.36.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52594099DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 18:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239754AbhIMQrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 12:47:53 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:35170 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239544AbhIMQrr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 12:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1631551571;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=LDKU/RP1Q4cF+tw+7bkG3lbITIkUa4qSx/UdAGSCvN0=;
    b=Ax0e5xbmRT9KN0bWzxrOe/h3pdnK5ju7e8yOrARnvkxqKXf/zGmnjgExpFukHA0pwH
    MZpcFbMWA9xvTxyx77rocc8y9QdI6FlH5VSKfeL0l4wNXsSCywTAz3qEQsYfYR951iYy
    RrLYlnMXQNM8tr959amuhAEpm/Kce1B6yFxGVOiDm7KuM/j2yA3JQqlqNNZsXrOv7uKq
    0J4ipcBuol3TluSqOBKEAXPHMaOIIVAiheAV9c0tptWF9dtlG7KmEM9+3HyTbt3rdnxK
    dKXy8G4QEroKwGkjPREetIqnaykb89qWDokPTYsGcxySbOjCnAdqexViV+pozYYSFOk0
    gnMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFSKC/A="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.3 DYNA|AUTH)
    with ESMTPSA id L05399x8DGkAKD1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 13 Sep 2021 18:46:10 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH] drm/msm: Fix devfreq NULL pointer dereference on a3xx
Date:   Mon, 13 Sep 2021 18:45:56 +0200
Message-Id: <20210913164556.16284-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no devfreq on a3xx at the moment since gpu_busy is not
implemented. This means that msm_devfreq_init() will return early
and the entire devfreq setup is skipped.

However, msm_devfreq_active() and msm_devfreq_idle() are still called
unconditionally later, causing a NULL pointer dereference:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
  Internal error: Oops: 96000004 [#1] PREEMPT SMP
  CPU: 0 PID: 133 Comm: ring0 Not tainted 5.15.0-rc1 #4
  Hardware name: Longcheer L8150 (DT)
  pc : mutex_lock_io+0x2bc/0x2f0
  lr : msm_devfreq_active+0x3c/0xe0 [msm]
  Call trace:
   mutex_lock_io+0x2bc/0x2f0
   msm_gpu_submit+0x164/0x180 [msm]
   msm_job_run+0x54/0xe0 [msm]
   drm_sched_main+0x2b0/0x4a0 [gpu_sched]
   kthread+0x154/0x160
   ret_from_fork+0x10/0x20

Fix this by adding a check in msm_devfreq_active/idle() which ensures
that devfreq was actually initialized earlier.

Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
Reported-by: Nikita Travkin <nikita@trvn.ru>
Tested-by: Nikita Travkin <nikita@trvn.ru>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 0a1ee20296a2..84e98c07c900 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -151,6 +151,9 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	unsigned int idle_time;
 	unsigned long target_freq = df->idle_freq;
 
+	if (!df->devfreq)
+		return;
+
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
@@ -186,6 +189,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	unsigned long idle_freq, target_freq = 0;
 
+	if (!df->devfreq)
+		return;
+
 	/*
 	 * Hold devfreq lock to synchronize with get_dev_status()/
 	 * target() callbacks
-- 
2.33.0


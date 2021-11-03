Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB7A444A04
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 21:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhKCVCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 17:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhKCVCZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 17:02:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595A9C061220;
        Wed,  3 Nov 2021 13:59:48 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id t21so3617665plr.6;
        Wed, 03 Nov 2021 13:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9qwrwPbSWoePEB3ehdDf5IbmlgUKU2I8KPH/uSpeUo=;
        b=Lt7D40yqrcq+E/eilwiYhnbfmectRjM0BEy3zDvpgY/YI+nYSYktulLHdhS7BASmnO
         iSi8st9ezddOSPiHfRH8xWEuCPNhsYsfPwbjQxbnNJrOoko3i3gUsjsFP32D68RXLwGV
         WWng7gvsEjtkCcCq6TMHp5hdWQ1RuTkOaRLoeMSIr2t8+++k8WUnFFk7iNshgVvFyhu2
         TFxbOQrUcl1RR+7AGuQwxIDIWf458+NHSLuPMzOwU0E/C6YXaCixBZsSvaPEcnwpnS3M
         SFudCIGtoidM0MA58XZeyqkAHRKSOceNylCO9GF98IJxY7j4FhliZSHSzKGltQtvqACn
         sL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L9qwrwPbSWoePEB3ehdDf5IbmlgUKU2I8KPH/uSpeUo=;
        b=KAiMt9H2rXnF7vt05qiWC5RId8tw3NcNLk6tyEhUBStxBHBKJcSfbeoBSyLaNeIbJA
         sKUQnZYqtN+rbG8PHZrV7lH7uU4zfaKBMN43B2UAb6e3UFbVZhfgRdbRY8XrFKfPop2a
         /cwYJb+rosP/vl+5srLFCi7H0RYeilzPFZp3iNJHdJ3/sJXqbTowULm09u0E0tZNkp4g
         J3wsRAe2ZN3+juP20l36X4R51WD7mfQMKbVK/JFE0HlIUstdAmnLBFAADx7Sd1UZCPiE
         irWFhpJIDox1Jp6NK4GvhVcgYwE0pUsfjyaIcLA4OGAfbAv7gkXnxNTCzmkua89l0iyV
         /xgA==
X-Gm-Message-State: AOAM530Y66XUcNsrQmLRcNU7VUG2w3BJLLolbnrNlast8tSPhe03vBj6
        Odfmm0cXpCikUat0YpJWfNc=
X-Google-Smtp-Source: ABdhPJwfJWRdXRDYT7uBQR1KDP+2q5UZB5BKScj36CPSOBHca+96rzKNXm46X2qjbmIdDSDLwr74EA==
X-Received: by 2002:a17:902:ec90:b0:142:269:4691 with SMTP id x16-20020a170902ec9000b0014202694691mr15363741plg.48.1635973187891;
        Wed, 03 Nov 2021 13:59:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c20sm2700362pfl.201.2021.11.03.13.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 13:59:47 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Hangcheck timer fixes
Date:   Wed,  3 Nov 2021 14:04:45 -0700
Message-Id: <20211103210445.623681-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Cancel the timer when the GPU is idle, but also remember to restart it
in the recover path if we've re-submitted submits following the one that
hung.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0d56699297c7..367f0c698b40 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -16,6 +16,8 @@
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
 
+static void hangcheck_timer_reset(struct msm_gpu *gpu);
+
 /*
  * Power Management:
  */
@@ -450,6 +452,10 @@ static void recover_worker(struct kthread_work *work)
 				gpu->funcs->submit(gpu, submit);
 			spin_unlock_irqrestore(&ring->submit_lock, flags);
 		}
+
+		hangcheck_timer_reset(gpu);
+	} else {
+		del_timer(&gpu->hangcheck_timer);
 	}
 
 	mutex_unlock(&dev->struct_mutex);
@@ -721,6 +727,10 @@ static void retire_worker(struct kthread_work *work)
 	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
 
 	retire_submits(gpu);
+
+	if (!msm_gpu_active(gpu)) {
+		del_timer(&gpu->hangcheck_timer);
+	}
 }
 
 /* call from irq handler to schedule work to retire bo's */
-- 
2.31.1


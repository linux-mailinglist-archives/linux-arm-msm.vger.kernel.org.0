Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2213610854C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2019 23:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfKXWY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Nov 2019 17:24:27 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40507 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbfKXWY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Nov 2019 17:24:27 -0500
Received: by mail-pl1-f194.google.com with SMTP id f9so5542396plr.7;
        Sun, 24 Nov 2019 14:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOR++9jxt0Xke/hJnBu2MpDG/X+jsGE0ucu7e62QStY=;
        b=h0K2e9zp0gcGbDhBn2OYgjsawFE+NDpg7CKSb3AdhJImGEq6U9p363kULdcCEVfd4p
         +8pPw8NHkFC4/s072mCIzhBtn77xrwoYFZ19sEhtm5cOI119XJqIPo0WipcXkP3XVSYr
         v7E4csN6LVNwqRt9RKc779d2EVntclLJuwVj7LF3PXsy7l8huvM+xugnd+qics8JF6o2
         4RzXMxBR/OWbPHLdprCLkYPr0VTA9Pp8oyb4ATUuG76uBa3yJoxdENgicpYTrwLFhr12
         UT6W3cJVdD/iI2qL9vhsx/O2kiXnME4mu8V8fA1zsdh8QirjYEXNTJsXdc9jGbbUgx/u
         4Myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VOR++9jxt0Xke/hJnBu2MpDG/X+jsGE0ucu7e62QStY=;
        b=c+mmbjOJDe6ZR9oO5ttcZREf3rCEP9hy35pOhMR+52r/jRT2ONhNZcsInLymgYignU
         lXVytoRGYmXa6VEzkJxLxa5Vb4k/w2+VzLdDEq3Ot2LuY83PK8CZlCD4bBhm+frdTWqN
         W0EvrPv/RD9KhPn/AqCJLJgwVlRJ0eHjd2AVWsNpwQaaZ/LZvHGBXpzgd5I/q0ZfnzzX
         t1lo+HU7eBEhncLwAyM32NL951YnOsWyoHrihgbP/bariWQ51f6vYxCtU7Fsr04ssVEy
         wMeH/lZkEzmPlc8npki9TD/PdthgrFoj1OE76kwXLknvn1bmA4ajZFKZ4N2af9xRv6Oo
         DVTg==
X-Gm-Message-State: APjAAAVRUWjyzCBiLTSkQJnXn39CkD5Zq5BzOZeIoaV9yGUwm+8zO9ki
        3HwNUfQMjgwgDD7OPs2i5VY=
X-Google-Smtp-Source: APXvYqyRMQ/Bi/6tjprki/8e3yGWNZRWTWDaCm+BvjhNsnsGkCUH/UWfYSoAeUwQT4JD8iYH+pvHwA==
X-Received: by 2002:a17:902:6e02:: with SMTP id u2mr25753923plk.234.1574634265930;
        Sun, 24 Nov 2019 14:24:25 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id f13sm5597256pfa.57.2019.11.24.14.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 14:24:25 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Wen Yang <wen.yang99@zte.com.cn>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: fix zap vs no-zap handling
Date:   Sun, 24 Nov 2019 14:23:38 -0800
Message-Id: <20191124222348.1467743-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We can have two cases, when it comes to "zap" fw.  Either the fw
requires zap fw to take the GPU out of secure mode at boot, or it does
not and we can write RBBM_SECVID_TRUST_CNTL directly.  Previously we
decided based on whether zap fw load succeeded, but this is not a great
plan because:

1) we could have zap fw in the filesystem on a device where it is not
   required
2) we could have the inverse case

Instead, shift to deciding based on whether we have a 'zap-shader' node
in dt.  In practice, there is only one device (currently) with upstream
dt that does not use zap (cheza), and it already has a /delete-node/ for
the zap-shader node.

Fixes: abccb9fe3267 ("drm/msm/a6xx: Add zap shader load")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 11 +++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b02e2042547f..7d9e63e20ded 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -753,11 +753,18 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu->funcs->flush(gpu, gpu->rb[0]);
 		if (!a5xx_idle(gpu, gpu->rb[0]))
 			return -EINVAL;
-	} else {
-		/* Print a warning so if we die, we know why */
+	} else if (ret == -ENODEV) {
+		/*
+		 * This device does not use zap shader (but print a warning
+		 * just in case someone got their dt wrong.. hopefully they
+		 * have a debug UART to realize the error of their ways...
+		 * if you mess this up you are about to crash horribly)
+		 */
 		dev_warn_once(gpu->dev->dev,
 			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
 		gpu_write(gpu, REG_A5XX_RBBM_SECVID_TRUST_CNTL, 0x0);
+	} else {
+		return ret;
 	}
 
 	/* Last step - yield the ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index dc8ec2c94301..686c34d706b0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -537,12 +537,19 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 		a6xx_flush(gpu, gpu->rb[0]);
 		if (!a6xx_idle(gpu, gpu->rb[0]))
 			return -EINVAL;
-	} else {
-		/* Print a warning so if we die, we know why */
+	} else if (ret == -ENODEV) {
+		/*
+		 * This device does not use zap shader (but print a warning
+		 * just in case someone got their dt wrong.. hopefully they
+		 * have a debug UART to realize the error of their ways...
+		 * if you mess this up you are about to crash horribly)
+		 */
 		dev_warn_once(gpu->dev->dev,
 			"Zap shader not enabled - using SECVID_TRUST_CNTL instead\n");
 		gpu_write(gpu, REG_A6XX_RBBM_SECVID_TRUST_CNTL, 0x0);
 		ret = 0;
+	} else {
+		return ret;
 	}
 
 out:
-- 
2.23.0


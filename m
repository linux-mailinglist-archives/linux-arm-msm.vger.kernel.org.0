Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 810C7D4182
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 15:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbfJKNjr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 09:39:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37917 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfJKNjq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 09:39:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id w8so4487748plq.5;
        Fri, 11 Oct 2019 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qGkUWDkWuy9rCgnYrcxxUjy8YGrJ1whz/5MzqghbV70=;
        b=NBk7HErwPAcy77r0BblRtX/FoKDf2xjanp1mb1ZicXMdBKqGs5cEf1d7iE96FH7akP
         gKHm4cPXwNja+OJ9wpWO5FctGJPduKDGTPyNHifr9IfLDlbHJgQziStyDnJh6oZ5nvBZ
         P2NNw1hCrejdrWxN+NATA5AKvvdq47YXCu0BkvDbmW9icN7/1TdjjH8MjK2B1Ck++djP
         WUew6Fo/9SDjaafj3VvjUN4G0VbT0/yTIkuFHDoPdEEb7WwjqMdjOHbj+Fn7HHwth1Lf
         UuKH66p+BcF0DJGdS/qiI+HBgFFhNfXim9fSmvYApTfdzOKiPEhRikzCLsjApt3Tv6S5
         84QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qGkUWDkWuy9rCgnYrcxxUjy8YGrJ1whz/5MzqghbV70=;
        b=cRNeBGgHAZTem98eXwYjsg2k8+xB1vl5rNMHgF9F5Trq+3t9lpp/Xxn2UzaIQLleCh
         w+KgAmZBdVoDacR+bjyBZGuYJsrDaISFFSOmot1tfy/q41BRLuaY9nSlri06KPPM8oAR
         dINe/KklhXx3yXmh42JsRgf5mxEZWjZO5PD1erScp5cf969xJ7Bg3enc7vqYPGdUFPPq
         fI/yLOSTmhclNhhaXdJVmWumkKfgJuF/qVEYULgpOTJgKd5sFRwIKCyZUUsNLEnW0e5B
         UFREIM76+Xg2o+Fa/XlmIX6g+JDDqJ/2J100kTlSEpyjVLnDQ2KGBooAjfAoDym9D0hN
         rtvA==
X-Gm-Message-State: APjAAAWomG0ygBAisMQhiNowJSiQg5VEo/EKrygWUXUy/cK12vvdAZ26
        2m99nzKIIok5Fp/EVg2JN3Q=
X-Google-Smtp-Source: APXvYqzeKH3l7K1RGHl7x8YfH51uO/BfgM5UGC2UadrBOkHc4M/Qz6TjJKWUTWI/gQ0YBexfLEapqg==
X-Received: by 2002:a17:902:d909:: with SMTP id c9mr15296242plz.216.1570801184611;
        Fri, 11 Oct 2019 06:39:44 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id n2sm11961743pgg.77.2019.10.11.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 06:39:43 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] drm/msm/dsi: Implement reset correctly
Date:   Fri, 11 Oct 2019 06:39:39 -0700
Message-Id: <20191011133939.16551-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On msm8998, vblank timeouts are observed because the DSI controller is not
reset properly, which ends up stalling the MDP.  This is because the reset
logic is not correct per the hardware documentation.

The documentation states that after asserting reset, software should wait
some time (no indication of how long), or poll the status register until it
returns 0 before deasserting reset.

wmb() is insufficient for this purpose since it just ensures ordering, not
timing between writes.  Since asserting and deasserting reset occurs on the
same register, ordering is already guaranteed by the architecture, making
the wmb extraneous.

Since we would define a timeout for polling the status register to avoid a
possible infinite loop, lets just use a static delay of 20 ms, since 16.666
ms is the time available to process one frame at 60 fps.

Fixes: a689554ba6ed (drm/msm: Initial add DSI connector support)
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Sean Paul <sean@poorly.run>
---

v2:
-make a DEFINE for the delay

 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 663ff9f4fac9..9a81705301c6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -26,6 +26,8 @@
 #include "dsi_cfg.h"
 #include "msm_kms.h"
 
+#define RESET_DELAY 20
+
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
 {
 	u32 ver;
@@ -986,7 +988,7 @@ static void dsi_sw_reset(struct msm_dsi_host *msm_host)
 	wmb(); /* clocks need to be enabled before reset */
 
 	dsi_write(msm_host, REG_DSI_RESET, 1);
-	wmb(); /* make sure reset happen */
+	msleep(RESET_DELAY); /* make sure reset happen */
 	dsi_write(msm_host, REG_DSI_RESET, 0);
 }
 
@@ -1396,7 +1398,7 @@ static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
 
 	/* dsi controller can only be reset while clocks are running */
 	dsi_write(msm_host, REG_DSI_RESET, 1);
-	wmb();	/* make sure reset happen */
+	msleep(RESET_DELAY);	/* make sure reset happen */
 	dsi_write(msm_host, REG_DSI_RESET, 0);
 	wmb();	/* controller out of reset */
 	dsi_write(msm_host, REG_DSI_CTRL, data0);
-- 
2.17.1


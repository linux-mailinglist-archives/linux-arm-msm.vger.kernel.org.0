Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C9924465D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 10:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgHNISA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Aug 2020 04:18:00 -0400
Received: from mail-m17613.qiye.163.com ([59.111.176.13]:33457 "EHLO
        mail-m17613.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgHNIR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Aug 2020 04:17:59 -0400
Received: from ubuntu.localdomain (unknown [157.0.31.125])
        by mail-m17613.qiye.163.com (Hmail) with ESMTPA id DAA47482392;
        Fri, 14 Aug 2020 16:17:54 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Bernard Zhao <bernard@vivo.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com
Subject: [PATCH] drm/msm/adreno: remove return value of function XX_print
Date:   Fri, 14 Aug 2020 01:17:44 -0700
Message-Id: <20200814081747.8624-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZHhpDHRoYT05CQh5PVkpOQkxIQkhLTE5JSE9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSo6Fhw6Aj8qAjoQIiIOLSlN
        EwwaFExVSlVKTkJMSEJIS0xOTUxOVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSU5ZV1kIAVlBT0pPQzcG
X-HM-Tid: 0a73ec0bfb9193bakuwsdaa47482392
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

XX_print like pfp_print/me_print/meq_print/roq_print are just
used in file a5xx_debugfs.c. And these function always return
0, this return value is meaningless.
This change is to make the code a bit more readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
index 68eddac7771c..fc2c905b6c9e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
@@ -11,7 +11,7 @@
 
 #include "a5xx_gpu.h"
 
-static int pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
+static void pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
 {
 	int i;
 
@@ -22,11 +22,9 @@ static int pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
 		drm_printf(p, "  %02x: %08x\n", i,
 			gpu_read(gpu, REG_A5XX_CP_PFP_STAT_DATA));
 	}
-
-	return 0;
 }
 
-static int me_print(struct msm_gpu *gpu, struct drm_printer *p)
+static void me_print(struct msm_gpu *gpu, struct drm_printer *p)
 {
 	int i;
 
@@ -37,11 +35,9 @@ static int me_print(struct msm_gpu *gpu, struct drm_printer *p)
 		drm_printf(p, "  %02x: %08x\n", i,
 			gpu_read(gpu, REG_A5XX_CP_ME_STAT_DATA));
 	}
-
-	return 0;
 }
 
-static int meq_print(struct msm_gpu *gpu, struct drm_printer *p)
+static void meq_print(struct msm_gpu *gpu, struct drm_printer *p)
 {
 	int i;
 
@@ -52,11 +48,9 @@ static int meq_print(struct msm_gpu *gpu, struct drm_printer *p)
 		drm_printf(p, "  %02x: %08x\n", i,
 			gpu_read(gpu, REG_A5XX_CP_MEQ_DBG_DATA));
 	}
-
-	return 0;
 }
 
-static int roq_print(struct msm_gpu *gpu, struct drm_printer *p)
+static void roq_print(struct msm_gpu *gpu, struct drm_printer *p)
 {
 	int i;
 
@@ -71,8 +65,6 @@ static int roq_print(struct msm_gpu *gpu, struct drm_printer *p)
 		drm_printf(p, "  %02x: %08x %08x %08x %08x\n", i,
 			val[0], val[1], val[2], val[3]);
 	}
-
-	return 0;
 }
 
 static int show(struct seq_file *m, void *arg)
@@ -81,10 +73,11 @@ static int show(struct seq_file *m, void *arg)
 	struct drm_device *dev = node->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_printer p = drm_seq_file_printer(m);
-	int (*show)(struct msm_gpu *gpu, struct drm_printer *p) =
+	void (*show)(struct msm_gpu *gpu, struct drm_printer *p) =
 		node->info_ent->data;
 
-	return show(priv->gpu, &p);
+	show(priv->gpu, &p);
+	return 0;
 }
 
 #define ENT(n) { .name = #n, .show = show, .data = n ##_print }
-- 
2.26.2


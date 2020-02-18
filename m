Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4531634BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 22:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgBRVW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 16:22:26 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34752 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgBRVW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 16:22:26 -0500
Received: by mail-pg1-f193.google.com with SMTP id j4so11576349pgi.1;
        Tue, 18 Feb 2020 13:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1yORocRN6bN/DWLSCc3LMaJhbwacp2HLNmosyK8PhXY=;
        b=RDJ1RD/xDrXbznWXW43BryMq6Jz3QBb4fUTMsoLkBcTVJ6bh10hb5sTHYyI+zplASW
         82HKX1xkUVNQrjo72x4Bzq5+KEcwcxIWOzUZ9GFTFp/xG4LkBT4lns9Vl5sE+bz9syny
         9hCkQHsF8CaXVktqS7qz56ZDsZ0U5wpGq/jAFoTeBpZQIq0bNn3JXEIydvuOrNKWOtXe
         nTs7JMSJGU22cVYQcFvUDFeQwPOGT304v37TSyyzKKx4tX8nCDY+Pg6+571zBZlof9M2
         muX7Uz4vvVbovnYY6oDkycCZ92CCDxqCXf9Ekv+pGG2qfdtr7jqjpoGrGqwU/EosZHCX
         ju1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1yORocRN6bN/DWLSCc3LMaJhbwacp2HLNmosyK8PhXY=;
        b=KXd26Lr/I4jyzBZ+JuOQUNduP9gDaqhWlYoXkcO1BN0xAlFlQH73Pl2EMXftnUVek+
         7CrPuVObBJxkLozVA/XIug1QpzqLde/ZdG7uiFbEXEZsFjcszt0y+cCz5pWCrM06PQX6
         3ItXBWfweW9cbmQfJCSAVkM1BWrtBxiBPSoPBK4IfxL/xluHGUfm3+BO6czKxwxJ+fky
         Iw+OXL5/+jGG6xyvsFkLb/TWdfzhRZQ4AG9THmdXwWcXwUVqm0MseyjEecyM86GzBq/t
         SXPcWht4Dk6fViie9pRG08H0t0WtMLBIJJEWyZXyKhYnNEkIn8oT7k6ZgLb1Bn4P486i
         COLQ==
X-Gm-Message-State: APjAAAX1apyH7R4itKoakuEqlHed8t9uJdozMsqm3Dy4YZD9QFGkUyVg
        R/R9lVckZj0zX0jLDpwFQPg=
X-Google-Smtp-Source: APXvYqwMxph8WfZwy4jJ8Hm+oyFMnedPlyeKBoA1heO5RDIjj7W+U0YW42+WmDKbc9ER8CnrdZtVtg==
X-Received: by 2002:a63:e509:: with SMTP id r9mr26127011pgh.274.1582060945518;
        Tue, 18 Feb 2020 13:22:25 -0800 (PST)
Received: from localhost ([100.118.89.211])
        by smtp.gmail.com with ESMTPSA id c19sm5356081pfc.144.2020.02.18.13.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:22:24 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers
Date:   Tue, 18 Feb 2020 13:20:12 -0800
Message-Id: <20200218212012.1067236-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Also log buffers with the DUMP flag set, to ensure we capture all useful
cmdstream in crashdump state with modern mesa.

Otherwise we miss out on the contents of "state object" cmdstream
buffers.

v2: add missing 'inline'

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c | 28 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_rd.c  |  8 +-------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9e0953c2b7ce..dcee0e223ed8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -160,4 +160,14 @@ struct msm_gem_submit {
 	} bos[0];
 };
 
+/* helper to determine of a buffer in submit should be dumped, used for both
+ * devcoredump and debugfs cmdstream dumping:
+ */
+static inline bool
+should_dump(struct msm_gem_submit *submit, int idx)
+{
+	extern bool rd_full;
+	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+}
+
 #endif /* __MSM_GEM_H__ */
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 18f3a5c53ffb..615c5cda5389 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -355,16 +355,34 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	state->cmd = kstrdup(cmd, GFP_KERNEL);
 
 	if (submit) {
-		int i;
-
-		state->bos = kcalloc(submit->nr_cmds,
+		int i, nr = 0;
+
+		/* count # of buffers to dump: */
+		for (i = 0; i < submit->nr_bos; i++)
+			if (should_dump(submit, i))
+				nr++;
+		/* always dump cmd bo's, but don't double count them: */
+		for (i = 0; i < submit->nr_cmds; i++)
+			if (!should_dump(submit, submit->cmd[i].idx))
+				nr++;
+
+		state->bos = kcalloc(nr,
 			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
 
+		for (i = 0; i < submit->nr_bos; i++) {
+			if (should_dump(submit, i)) {
+				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
+					submit->bos[i].iova, submit->bos[i].flags);
+			}
+		}
+
 		for (i = 0; state->bos && i < submit->nr_cmds; i++) {
 			int idx = submit->cmd[i].idx;
 
-			msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
-				submit->bos[idx].iova, submit->bos[idx].flags);
+			if (!should_dump(submit, submit->cmd[i].idx)) {
+				msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
+					submit->bos[idx].iova, submit->bos[idx].flags);
+			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index af7ceb246c7c..732f65df5c4f 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -43,7 +43,7 @@
 #include "msm_gpu.h"
 #include "msm_gem.h"
 
-static bool rd_full = false;
+bool rd_full = false;
 MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
 module_param_named(rd_full, rd_full, bool, 0600);
 
@@ -336,12 +336,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
 	msm_gem_put_vaddr(&obj->base);
 }
 
-static bool
-should_dump(struct msm_gem_submit *submit, int idx)
-{
-	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
-}
-
 /* called under struct_mutex */
 void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 		const char *fmt, ...)
-- 
2.24.1


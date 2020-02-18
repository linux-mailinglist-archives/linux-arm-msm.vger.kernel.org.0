Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D801633B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 22:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgBRVCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 16:02:47 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51732 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgBRVCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 16:02:47 -0500
Received: by mail-pj1-f67.google.com with SMTP id fa20so1566840pjb.1;
        Tue, 18 Feb 2020 13:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DX0d2fwy150Oxn2ueh8crPmbORULTUPrpK6kQzqonD4=;
        b=IqW2leGHHi3LHUpLpxvIlPeA+jlREzFt6Lxa/7yLlAeviAl+ufoEQmcpu6LDBSE70A
         TaVP5DNUawV0W7v8nUuGPMiBfQ/pOoHzOrsG1fzPAQ89YGINUO9069cKpuOM6wljAMfl
         CGknWlktXpy+R3AqaUQuvcOLVaB9dxfWIsdBCqltxhQDggFLotDpA9jYDTOhK09cL1TN
         ldqho9+4XLsPa0xbFHt0+Wsw3VCtRzfW0v+5G08sfB2Hl4v4RvxX2SZc5edQ3HYSDakO
         5byJgwku+2riUAzcXKo12lL9ED/DWStdv+S7p6pMNAgtFZSmTXYYJ0nYCqDZOZcvNRsw
         Kl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DX0d2fwy150Oxn2ueh8crPmbORULTUPrpK6kQzqonD4=;
        b=h9/ScdQfXVHf62ziTnS+vtPzeVIF0ZIwlBgXVm89VwWlUb+sB2w4cNU/yNoZLSt6UX
         gQBES8NSORJw18xIn8so1L/kEdKm96UvZbaRBgEbAnT5+70vWgqamkCKRC7AArM77/jw
         7jW17bYhLnTx336aXoVouZFsmoelqG2rM6GsY+snNquGC3ep+n8vqoAiy5M2pkDNmarD
         3/fWVJEU3A75kj52bncBSr/FlwTX6na+FIKwmzQQrM0qpUyLUdSAJ6UmyKP/4LpmWRg6
         80TZ7TvGCydHZjkdAnA9E7tIUojdHrjnrpIFaHi86DM6oJxFBg/iyRpg3ht2Z7KKcKES
         5pmw==
X-Gm-Message-State: APjAAAVQQTshS8nutBfVN5B9NT31HgwxHKh11jpMDnPMuXtQMmTZL/6X
        S5uQISyVR2HBIzgon/VqoW0=
X-Google-Smtp-Source: APXvYqwue7exCr+5C0zzAWXFn99tXZVUV+OlMvWLfTE4f5M3BY4CD19tzbkBbBy8OO5MYaKzHi8F3A==
X-Received: by 2002:a17:90a:c705:: with SMTP id o5mr4833444pjt.67.1582059766099;
        Tue, 18 Feb 2020 13:02:46 -0800 (PST)
Received: from localhost ([100.118.89.211])
        by smtp.gmail.com with ESMTPSA id u12sm5431970pgr.3.2020.02.18.13.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 13:02:45 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers
Date:   Tue, 18 Feb 2020 13:00:21 -0800
Message-Id: <20200218210021.1066100-1-robdclark@gmail.com>
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

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c | 28 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_rd.c  |  8 +-------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9e0953c2b7ce..22b4ccd7bb28 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -160,4 +160,14 @@ struct msm_gem_submit {
 	} bos[0];
 };
 
+/* helper to determine of a buffer in submit should be dumped, used for both
+ * devcoredump and debugfs cmdstream dumping:
+ */
+static bool
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


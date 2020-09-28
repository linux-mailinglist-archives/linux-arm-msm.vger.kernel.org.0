Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC6127B6A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgI1UrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgI1UrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:15 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B589C0613CE;
        Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so2508563wme.1;
        Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bKgQVwCCmQcmn6HakXnFm9OZzwMuHo5XzGULA63oxxE=;
        b=HtaX17H0LCDCfh2AnK/CTbogRhcXLSFVcCLz+we23hElBvDfhvSX+ToPD2RaN90sNk
         9wmKpwsNH4aAbYxt0Iktg3L6sbCfF3tZmFjI0raJFdeVjzz7B4McrrNBjwUb00a/gFWd
         7tJImUGh0JugHSIrxDOSWm/cI39LGMqWPNhGPt8iSTkBSVzy/Kt2RpfJQfkuMbljGAHV
         v+PLFXupBNHeWRM0kvYbppeigQg/1ZY/rtnJRXHcqcbrarWhDkg14x2zpS1X3ggh0Ehi
         UrhrYI0r43V5TnpeVkRJH/D5md2y0gcLId8T+BquFO6gFdisJcyjppCa0FSn0jm+Iwh3
         9bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKgQVwCCmQcmn6HakXnFm9OZzwMuHo5XzGULA63oxxE=;
        b=QQQ0gUMf/h3xSIxloqTUyalOf56+Rc5P/PXXrsEltyWfq2JD77DAWoeY1Qxr3jAPKo
         4L7NmBJnt5hFQ32DM8QuMuaZ4AV2QP7/Ru6llxouHBDNaLzELYc8MaQVzchSdxSjtnzw
         5O9KYcClKcOjW7btEx/j3WtIyT2Zd4CU5yXc57KmORTKR+8PQXnjYGJ1dE7pcWJcoZ4z
         /6Xce6zCgAvOmiADSft63iyI5lR9iP5gb7/8nnxnCYsn0dCuT9oFzBxe8a//1BIwJVjX
         YOufY88xPE6FR6owEIJskFDsWBLqVaehQNpuCQiGtiR46tu8+e/SYlbQXJXNc8i6fdZe
         QQlQ==
X-Gm-Message-State: AOAM532iu6OPwFEjT6JLnLaIRb4ia7stjtB8xrY2Km1hrXgLW2DO5qot
        VsauV06SfuGawz0F/914gCM=
X-Google-Smtp-Source: ABdhPJzfbMLv/WO+JF8OqmD89IoqUVjORTDPG/T/FAtiYSlnlJne0+Co/tDTBkTUlLmq1PnpuqkcJg==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr900910wmj.171.1601326033685;
        Mon, 28 Sep 2020 13:47:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:13 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
Date:   Mon, 28 Sep 2020 22:47:04 +0200
Message-Id: <20200928204709.45746-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The "main" if branch where we program the other registers for the
Adreno 5xx family of GPUs should not contain the PC_DBG_ECO_CNTL
register programming because this has logical similarity
differences from all the others.

A later commit will show the entire sense of this.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 6262603e6e2e..f98f0844838c 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -577,8 +577,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x20);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x40000030);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x20100D0A);
-		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
-			  (0x200 << 11 | 0x200 << 22));
 	} else {
 		gpu_write(gpu, REG_A5XX_CP_MEQ_THRESHOLDS, 0x40);
 		if (adreno_is_a530(adreno_gpu))
@@ -587,9 +585,14 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 			gpu_write(gpu, REG_A5XX_CP_MERCIU_SIZE, 0x400);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_2, 0x80000060);
 		gpu_write(gpu, REG_A5XX_CP_ROQ_THRESHOLDS_1, 0x40201B16);
+	}
+
+	if (adreno_is_a510(adreno_gpu))
+		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
+			  (0x200 << 11 | 0x200 << 22));
+	else
 		gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL,
 			  (0x400 << 11 | 0x300 << 22));
-	}
 
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
-- 
2.28.0


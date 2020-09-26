Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A981F279921
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgIZMwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbgIZMv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:51:57 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A34C0613CE;
        Sat, 26 Sep 2020 05:51:57 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so2108558wme.1;
        Sat, 26 Sep 2020 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b1cxEWVtTchv9LulFIq5cTpW0TIwhYIam0Ax8XR7gpQ=;
        b=iUl9jLvlfWcKeH+Yw4X0PQOfTIudyWMz0fQTsHxVRomHClbQEjXWjpweVcW1W0AQaR
         QKyIEKdtaYwQeMM6nkSOcBETwg1sKbFfvi4YELIVMlnoAdGPyrntjn59raMcHUuR1HC5
         xFEJcKonKy7Zx030gD7d6U8pvViEbYLuTWOBrt0bxwajBHMPCVWe6NoWwPBcbbEF6Q0O
         SWYUysbXgPlXQ2wMHfFiqVYoY2H6Fp4sJkC8d74vbFhWaVmHSu7/z/i4u10ClqrZZfCU
         vpTktjziitJfehmosT7Dy+RR6nCcqHz7rrh7t4/24qvDOZebHEBtg6egU26ckjKSDiS5
         XJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b1cxEWVtTchv9LulFIq5cTpW0TIwhYIam0Ax8XR7gpQ=;
        b=jx6xSLhF2gwUySVyjSqqKnGmpPH0UomYIGCxPUWuS9KrGrBHq9QqDYB1+drt359S1a
         mJgmZygGPdTXKomnCQzfJGFuJdjiO0lrTDh42NKKhRyxIx0kxdNyVY4OYOznon0z2lf5
         x6lPA6zkVnxJC6AV4v940G+/TUZuD+/vcxY5xsEhs2R8+yRTS0fyIzdbLpfOvqTOPWdz
         PCBhdNaUxcA7yt6SwjBvODh6RePYOxlHd6XpZFwLoSN/d8274CFMAl3OdLSnDUKK7EP0
         I6w4u3hZSOwNNwegEuWtbhHq+XBYCZxUDcoMvLaeJfo3T1p8YY54wFzOWZztH0EeMSo/
         477Q==
X-Gm-Message-State: AOAM530QXr8XZoKl5KYBxlWy/TV5HocfeE1BUTj06pzlxbaaiDNPchjA
        YnoA0c6xL7VmYCgmKPR+W+Y=
X-Google-Smtp-Source: ABdhPJy7la5lEzdeHF2t0BlcyTOiYk2AU/h/MX3uOvPeWKgvVLnOfRYQMeImquyCmu1XpVvVYIliiw==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr2498441wma.60.1601124716004;
        Sat, 26 Sep 2020 05:51:56 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:55 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
Date:   Sat, 26 Sep 2020 14:51:41 +0200
Message-Id: <20200926125146.12859-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The "main" if branch where we program the other regsiters for the
Adreno 5xx family of GPUs should not contain the PC_DBG_ECO_CNTL
register programming because this has logical similarity
differences from all the others.

A later commit will show the entire sense of this.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
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


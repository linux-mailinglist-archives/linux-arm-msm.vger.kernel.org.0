Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CFC27B69D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgI1UrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgI1UrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:17 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D203C0613D0;
        Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e11so5181230wme.0;
        Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VAXek25jtpefT57W6f2ieoFbKeRkwzBYBFbfBYFgMFQ=;
        b=HlSmtN3qAsaXa66jR0vokh6Lz9EEULyPGeLoPDbJuZG8A783rEruOVWIMPC/D9rE2y
         7AtWakZ9lNh23pv1qofxD6BlgbIhr/iQcl9dmaM/foNTI5xfaIVUAEk82IgFP+yGDvJ7
         HeUWIMNTOFCEtf3H7/GUC099cNuOCWcsBvJPprfKxG1tcxHQ/8uX2VWWL2HhI8vlqJ80
         sipSHx5TEb29x13VoAkRIFYMrRbwc016HGIJFvuOe1S2Twaio1ArGD+VQA22EpSFg5A6
         tJbduZznAi2i1ncWwIqR1moILvWGjX0YE9WnFL4CHBHhaWR6jV+mHBKOkOMsyuXLJmrr
         psyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VAXek25jtpefT57W6f2ieoFbKeRkwzBYBFbfBYFgMFQ=;
        b=lsSK9954MBfzwQzZtU+99YOZCkunKxaws2kW19e3vTL9TAcGPmM7G4bdwqmAKHQGG1
         PeOCIULrpCQLH031vW4vkUsEDZ9khC7dIZBQZTxmyYc7AHcaj9SreqyVOA6PdyhyJwJI
         uSSrq6zvNBuG4yo9Sa8qo4Un9hdISVoiHH0qCA9phZYw6p5lZ3B+PJ7Biwppi78g55mO
         5i5M4kXyXaYB7CQAbCAvPgpTfX9Jozy67Tyz67MOaJbkaJ1lVYFThRv74RvLyUuwi0qV
         gyl1F6o+lzx1VNCWotMfgSVIM0Z8UHfG/Oghhps1zm035hURz9NBP0XhlKLoRA1WxUXc
         FPgQ==
X-Gm-Message-State: AOAM533WLKVTwEzaCRmE0/W6bAX+PNh8gdcPV2Xo5P9/sV5rhY9ePLUI
        aFyCD7w0X3huXpZ+E+cMBJ8=
X-Google-Smtp-Source: ABdhPJxFk4WhCEHF6JvTPb5ulS5tFeC+UJl80+kXrcBNXujIWb6/7EsQcyj2AvgKCVDLY1SycuvcAQ==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr981783wmj.174.1601326035960;
        Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:15 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] drm/msm/a5xx: Reset VBIF before PC only on A510 and A530
Date:   Mon, 28 Sep 2020 22:47:06 +0200
Message-Id: <20200928204709.45746-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Resetting the VBIF before power collapse is done to avoid getting
bogus FIFO entries during the suspend sequence or subsequent resume,
but this is doable only on Adreno 510 and Adreno 530, as the other
units will tendentially lock up.
Especially on Adreno 508, the GPU will show lockups and very bad
slownesses after processing the first frame.

Avoiding to execute the RBBM SW Reset before suspend will stop the
lockup issue from happening on at least Adreno 508/509/512.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index fd33a34961cc..6163c3b61a69 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1306,10 +1306,12 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 	/*
 	 * Reset the VBIF before power collapse to avoid issue with FIFO
-	 * entries
+	 * entries on Adreno A510 and A530 (the others will tend to lock up)
 	 */
-	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
-	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
+	if (adreno_is_a510(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
+		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
+		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
+	}
 
 	return msm_gpu_pm_suspend(gpu);
 }
-- 
2.28.0


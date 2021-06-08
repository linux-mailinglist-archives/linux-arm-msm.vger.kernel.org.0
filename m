Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCD339FDBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhFHRdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:33:04 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]:35821 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbhFHRdD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:33:03 -0400
Received: by mail-qk1-f176.google.com with SMTP id j189so21008715qkf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4A/Pcyw+QD8Ug/Nt2Xmd1/EAfukVYO4RIkYOrmyswQM=;
        b=G1CaD5y6gwymINmHtsKEhWsaqJxxFVGj6787Wi/WaUi0ibM0X5gQeT7WW6yY0pEqS/
         3StBiA+9Fs6AXgzwfa2bIyqtGJyEuBOHjnXzkH2/WxlBTj6rbZe5ZIlhpuzOtnBAb9Hq
         4eGjLJiUi7c554WRkGjh/BGMvOUdNTc1IoeLLxHl7f6wbMkW1CHteyEy2tsjqsEpfZHY
         o8CSRZut2bTqhw8QmfqUq5t2xEH+RKRosHMzemv8JJBUqm37s1A8j62TPn/CfHjCfydp
         gzVypgdBjcGn7zKoB1akl6XvmI8kG3c7gzJWTb152tPbyu/BimAhaYfXB6I9OGVJTYyc
         evJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4A/Pcyw+QD8Ug/Nt2Xmd1/EAfukVYO4RIkYOrmyswQM=;
        b=Top9oWYSqD7njVeEVV3wmdhrqHy+1awCDe2NsVY4sGsRWiWvrpSLM3vl0OaxiihNQ6
         /WOaZRXuuSnXYnlpdAJNuaJNHi/vvzmAwUWT6kecmbs9q3TIh7ulC8yJ0ukY8bCwg3DR
         gsWSlZIxGI77M2alqMMXFrqhrxyfNUtAa/N6qrkPIhNrDt7APXmk26J6B2NmrW8kO4O4
         KX+h0r7nzqHDXX/gCR9Q9y/xBN6aefWHeTsdGC4jx/wXab8L3f3n/mDlxcCnD8M/0Aw8
         80/NPOdlcF2C0OfoKfxiNi9ESuYyr5N+Npmxl4YX4dgyg7Hq8vqqg29vMXzxV5Y1Q8hy
         OcbQ==
X-Gm-Message-State: AOAM5319ws5ebFK5+6Wqw+U6QDV1uSCXU+58iqYxvW5nKZgOFmNSJuZQ
        aIQvp+SL2vyNZAhRUtSmy00Jkw==
X-Google-Smtp-Source: ABdhPJzTo4VczO5D3fNE/OOCfEaOjp6b6rtTfwnhjqlgt3NXWkN04Lg7T/UGxCTR954ZwROyXIX2Cg==
X-Received: by 2002:a37:71c5:: with SMTP id m188mr7310523qkc.97.1623173410212;
        Tue, 08 Jun 2021 10:30:10 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:30:09 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/5] drm/msm/a6xx: add missing PC_DBG_ECO_CNTL bit for a640/a650
Date:   Tue,  8 Jun 2021 13:27:47 -0400
Message-Id: <20210608172808.11803-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

See downstream's "disable_tseskip" flag.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 853be7651623..bbbf90d86828 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -844,13 +844,15 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	/* Setting the mem pool size */
 	gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, 128);
 
-	/* Setting the primFifo thresholds default values */
+	/* Setting the primFifo thresholds default values,
+	 * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
+	*/
 	if (adreno_is_a650(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300000);
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
 	else if (adreno_is_a640(adreno_gpu))
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200000);
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else
-		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, (0x300 << 11));
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
 
 	/* Set the AHB default slave response to "ERROR" */
 	gpu_write(gpu, REG_A6XX_CP_AHB_CNTL, 0x1);
-- 
2.26.1


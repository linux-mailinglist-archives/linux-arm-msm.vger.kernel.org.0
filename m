Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8306339FDB4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhFHRcS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbhFHRcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:32:17 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3B3C06178B
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 10:30:08 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id p21so4145083qtw.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=44vYfbOIABvco8eG2D1gJ7pjRjWLhtG/LxGeHPBuoFg=;
        b=WNcrPqJZFDhR+GppnUt/Ho4z1lo+ghVk453OcuFG5EQ3WnHh9c+La3faogb8M3azO4
         nXtNGyofwd3/qykvUd59kHRlqyBkkndn9eycBzewLxOmTtwf5u+typeymWhqxXDSOVoe
         ORiuJSpzNXZ8A9bmR1/oc28wh78BHn4O7WNyS5xa1rtiSb6xJBcA//ZRZjhTsoEt2Shi
         g/dyG0dOD9JUBO17UAp1H2HQKhDLocuMPzPmfSq5461oZ9back2M7EvfDT0O35LzXGCY
         NGm/YM1xDFwbKZPiULzPFNJQuTXUjXa8dJTfiA5F0C0R8Kv6QmZCPzGtCMuchHZ6bx2E
         gd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=44vYfbOIABvco8eG2D1gJ7pjRjWLhtG/LxGeHPBuoFg=;
        b=gIYaeJQgJ9gpoBU/CJhfvmZdisXvCBH4YSLIFa7AsRcjo17DfLp3bf2SPQhNCaycJQ
         Kgeisr+orqIrysPUEXLiHEu/P2XVSIr8Ek32tnUFDJxKSKh8EPtY5YyRneG/VbQ8Zkc2
         /M6xRMapn5ko9K6fcasR1eVfmuG3r9ntUOzb6SOmB0jw3BVUYXQRiV7q6TVWUDayehwW
         X4o5eRJ/yTUNIFmSIijmItjgNRpZk/35FDXFQ3uonUQ7C/zxT2S+2PU4KuXeKoT9cbLs
         mvy/PSZz0IdxvMDW/QRX9wLHo/S5SynBkPzmjqiGfZAMViLjHs8VeyBxQaSamY/8t93K
         NCgQ==
X-Gm-Message-State: AOAM533ueSmjG0Yjl18zAVgM4thkpSDUDXjSj2METe0pT5QvxMaL31g8
        Cq6ac3jMXRG/MdI1AjBHD6CmMw==
X-Google-Smtp-Source: ABdhPJzVrQjUH6buawo7b+mb3MemRseIkztNJFsIWxhwVUPVhBOzmMCnvGoQNBKu1a1p2MLKJVSdEg==
X-Received: by 2002:a05:622a:1751:: with SMTP id l17mr8131811qtk.35.1623173407491;
        Tue, 08 Jun 2021 10:30:07 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:30:07 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/5] drm/msm/a6xx: add GMU_CX_GMU_CX_FALNEXT_INTF write for a650
Date:   Tue,  8 Jun 2021 13:27:46 -0400
Message-Id: <20210608172808.11803-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

downstream msm-5.14 kernel added a write to this register, so match that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 4 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index c1ee02d6371d..0f3390eab55e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -751,8 +751,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	int ret;
 	u32 chipid;
 
-	if (adreno_is_a650(adreno_gpu))
+	if (adreno_is_a650(adreno_gpu)) {
+		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
 		gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
+	}
 
 	if (state == GMU_WARM_BOOT) {
 		ret = a6xx_rpmh_start(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
index 5a43d3090b0c..eeef3d6d89b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h
@@ -292,6 +292,8 @@ static inline uint32_t A6XX_GMU_GPU_NAP_CTRL_SID(uint32_t val)
 
 #define REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF			0x000050f0
 
+#define REF_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF    		0x000050f1
+
 #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_MSG			0x00005100
 
 #define REG_A6XX_GPU_GMU_CX_GMU_PWR_COL_CP_RESP			0x00005101
-- 
2.26.1


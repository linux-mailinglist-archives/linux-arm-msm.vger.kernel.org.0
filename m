Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6161D2ADE97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 19:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731403AbgKJSmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 13:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJSmX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 13:42:23 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0844C0613D1;
        Tue, 10 Nov 2020 10:42:22 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id k7so6931032plk.3;
        Tue, 10 Nov 2020 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aoj89WmcaMMxtRZJCP7ES6axMtLpeMz4nvf536ZBRdM=;
        b=UH+Sdgv4Jw0IYY6nICZUclvd441VpcOTKJSRDbN2UxfCyy+R6yhqyAdPsiy/FlEkef
         OdR6BJNAjslO9MjXZJPMmiRDyFOZ72i5feFG/pUUBogLQMLme2unL1+XgcHy/Edxk7I6
         Lf6sxh7MBZkKk9yrwrW07/Gkyqaf3fE4Emg/rw2GrqTAYtW9JoyTa8QZm+/Q+Kd7qoOm
         FAUBRJnVOLjAFHmyW/Sin8w8aGtqtabyBYCxKRh6BoarUTWarV3zccmWPzSCxQ0nyX7c
         2mm8NhVaBMdIlB3eGius33oxaVdcqhcN+Lu4ba79GcyZPXC3xLj5u0Ie/nlSX7ex2HEq
         e7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aoj89WmcaMMxtRZJCP7ES6axMtLpeMz4nvf536ZBRdM=;
        b=PLRBegAbCta273rzFS6pnvbCJkS+dpCb0s8eVi60zsep/qILo5KwXIwz6HApOGazRW
         oh/AI3ztMLuGp/fFknMONWAlMQARBC9w3jCzOajRWXhVWbAsnba4q2HkA2GL8ZpU8+5o
         VLlJR1S48ei/7LM4VQDWCc6Zf0tB3ee4xEnigKywbG6kv8HXsUT9L5fP/MJxXvGKtNnG
         vkSs80Mu/BxhhnuXEdukmJt+220m8H8yGhoJYM80u1g2rZKySzigLqPpEP+cS4wXwwty
         9Tk1/zFfVOkla9jwdi/NKTFIsKrVyTb95BO+3xYY1BQJmHSkxTg1gWmJw3rigKw20MqF
         ujHw==
X-Gm-Message-State: AOAM531WQy1Oc4cnpQDC5O3iEWWhDxOxNkI8cMZN0JpWqp5zp6Fw2m/1
        i3BFpP4M0X3LkEd88tI3HkQ=
X-Google-Smtp-Source: ABdhPJwLq87EjJQigjjYbupc+fu/mpLvm2voU3nXL/VLwi8dNJibezorLF7yq2pa5oiLPbrVCfu5EQ==
X-Received: by 2002:a17:902:bb8c:b029:d2:2503:e458 with SMTP id m12-20020a170902bb8cb02900d22503e458mr17786908pls.18.1605033742518;
        Tue, 10 Nov 2020 10:42:22 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id cv4sm4051283pjb.1.2020.11.10.10.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 10:42:21 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Eric Anholt <eric@anholt.net>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/a5xx: Clear shadow on suspend
Date:   Tue, 10 Nov 2020 10:44:00 -0800
Message-Id: <20201110184401.282982-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110184401.282982-1-robdclark@gmail.com>
References: <20201110184401.282982-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Similar to the previous patch, clear shadow on suspend to avoid timeouts
waiting for ringbuffer space.

Fixes: 8907afb476ac ("drm/msm: Allow a5xx to mark the RPTR shadow as privileged")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index b0005ccd81c6..8fa5c917d017 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1206,7 +1206,9 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
 static int a5xx_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
 	u32 mask = 0xf;
+	int i, ret;
 
 	/* A510 has 3 XIN ports in VBIF */
 	if (adreno_is_a510(adreno_gpu))
@@ -1226,7 +1228,15 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
 	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
 
-	return msm_gpu_pm_suspend(gpu);
+	ret = msm_gpu_pm_suspend(gpu);
+	if (ret)
+		return ret;
+
+	if (a5xx_gpu->has_whereami)
+		for (i = 0; i < gpu->nr_rings; i++)
+			a5xx_gpu->shadow[i] = 0;
+
+	return 0;
 }
 
 static int a5xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
-- 
2.28.0


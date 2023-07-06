Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52C2F74A5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbjGFVLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232617AbjGFVLI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:08 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF951BF8
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:06 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso897391a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677865; x=1691269865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/LKr4NvPMbCvi0D9usVxvRWmWQvsOjG4NG+cTraaNs=;
        b=Wbc9yvkyQ4T9wyDXEqUEd2lOpZ0elnplp4ZSoz0sSjycNIlGHY/GasGFw315MZ4Uob
         kTz8PAHsRbxfpCRi8qFIep6qtzDdh+R5UQffTF8diII5o43vFQ/of07xqpH7C98HJsb9
         he6LegwmVnclfSJerS48kj5mOhRad2UUofbguTrM8KKmWwkMBEUBUg6OYkET8RaSnQYh
         +FZPbgImWQ/8yVOcOP1ajzNGrTJyZCx88ekA5/9E1ZaxE3ib/XGgcOhTkfof6dcl1sb0
         WbPt2Qo4sSZGJ5p41EE/0m6GF006J3sPYVzhQ9+oXhS2YGtFKRq+uuNfh8s88GBlP/aN
         IRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677865; x=1691269865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/LKr4NvPMbCvi0D9usVxvRWmWQvsOjG4NG+cTraaNs=;
        b=MwMMOb0ewk4LxooqslDsmuUOwi0ahl8NhR1JLDhk+8mYceno4HLSny8sH+WPMUWZyV
         WYIpJpzfb0MiviXN9OqzAJcmjEgNTCbfpceukyjZo/DGlK6oGLM9Pu5oIshnQgxyZ7eu
         iEBrEZ3z5E1vRyYJhXeP8+Dzqbo9ueaZujkHfVncFeZMAOOC1lxBCKZTEjaV+o2h6ima
         EWkF0UEeRYMKM3arVTh65d0kJ7L6wXvZXTNPS+upX+3xxY8eHogrn3NVwQuo4e6oiHWj
         7eb0mhm/kDriD3rUfMjIEpH20o8hF7SDPacHCZanzshMSaUiGzzCiFwD1E2hK6jqs0Qq
         1mRA==
X-Gm-Message-State: ABy/qLb4k6azhiB8GpwhVMG8g0X9a+FON6lfY2jOFyRLwe4DUIQWX93a
        xT1zSah0epB6kxPOsi1jMeE=
X-Google-Smtp-Source: APBJJlGpZrW3c4xwKJ8/TZ3Pdq91mO2tcn3ofYNPz4yM3ODR1I5LR8gFZyAVtXS3akYxEJUDLjrgOw==
X-Received: by 2002:a05:6a20:a11a:b0:11f:c1a1:8c with SMTP id q26-20020a056a20a11a00b0011fc1a1008cmr3602428pzk.54.1688677865358;
        Thu, 06 Jul 2023 14:11:05 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b0066ebaeb149dsm1667933pfb.88.2023.07.06.14.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:05 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 03/12] drm/msm/adreno: Remove redundant revn param
Date:   Thu,  6 Jul 2023 14:10:36 -0700
Message-ID: <20230706211045.204925-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This just duplicates what is in adreno_info, and can cause confusion if
used before it is set.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 22 +++++++++-------------
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index edbade75020f..5ba8b5aca502 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2484,8 +2484,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(-EINVAL);
 
 	/* Assign these early so that we can use the is_aXYZ helpers */
-	/* Numeric revision IDs (e.g. 630) */
-	adreno_gpu->revn = info->revn;
 	/* New-style ADRENO_REV()-only */
 	adreno_gpu->rev = info->rev;
 	/* Quirk data */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4f59682f585e..2e62a7ce9f13 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1098,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->revn = adreno_gpu->info->revn;
 	adreno_gpu->rev = *rev;
 
 	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index aaf09c642dc6..d31e2d37c61b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,6 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	struct adreno_rev rev;
 	const struct adreno_info *info;
-	uint32_t revn;  /* numeric revision name */
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
 
@@ -147,10 +146,9 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
 
 static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return gpu->revn == revn;
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return gpu->info->revn == revn;
 }
 
 static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
@@ -160,18 +158,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
 
 static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return (gpu->revn < 300);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return (gpu->info->revn < 300);
 }
 
 static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
 {
-	/* revn can be zero, but if not is set at same time as info */
-	WARN_ON_ONCE(!gpu->info);
-
-	return (gpu->revn < 210);
+	if (WARN_ON_ONCE(!gpu->info))
+		return false;
+	return (gpu->info->revn < 210);
 }
 
 static inline bool adreno_is_a225(const struct adreno_gpu *gpu)
-- 
2.41.0


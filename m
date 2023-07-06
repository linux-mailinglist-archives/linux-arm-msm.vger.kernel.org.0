Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C0774A5B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbjGFVLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232745AbjGFVLP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:15 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A031BFF
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:12 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5658573b1faso830810eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677872; x=1691269872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhTOScCN+Ef46LlQMkOhiLJFF/UYP5CZt+sezUx1OlM=;
        b=UpnAa/FP7Yyphp1pxcZ9gr60S6pw0jF+cQdmXj/f2RIrcwnVhXyeHUsGc30Z3ZZze2
         gmyqwxAUDx1JsTBDMNpFe4/zWW2fXqaGhDFoNX9/b/rh+fOqP3H3d66Wo5GXMRO+yAJj
         V2nHPqwN/8eimpQ9jql0b1DiHEIAZ+vTPqiOTd4Meacgg9wz1Allojjal1ZhtEqS7mbA
         22Y3bc4KS+sdl7/yTRFo8CkjW9HbUt+OaYxAwxUHQtFpSOLZSxpIklnEtELhV7vcQXrY
         cyc5hjf7s7w86RBOEt+QtXq2UEmQ0Qyxollm6q5Wp5DCh1ZBKDUgO1zocb4wHpuwft3d
         5FuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677872; x=1691269872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhTOScCN+Ef46LlQMkOhiLJFF/UYP5CZt+sezUx1OlM=;
        b=jxUQQuGWNygm7VTwmLmYTjbdeyyi8Y145T3x+aBUeNqWXANisA1bU+opS2JkO+U6nf
         qg7FYKDE5DYWeRtf+UBqD8N1DNwZPRMgeVuP5lyemxhCA3XpCZYJlRGEqZnJXEWgtrVF
         wOFwlZDo9WfOSJf4G/HR+BVTJDKdR+RLNoNfG7P6waCKj74NKRb4SKJdXAnYj6BgB/Ju
         cdtXOwa+mJF0hK3lTW3HLKruYrT3hsAzbsCr5p3Z1CPImXlf259KPJ6WPm0m7rnJpMIq
         2Y75MrwY9KdSSY0EjTiSyOXJo7kMGp9SI9YWKt6uOVDZg1mXC+RAlC0pMzeTCKovrcfn
         AS0A==
X-Gm-Message-State: ABy/qLbj9NrKTRdmNuTrvnGLZA2zKj4xf3N6EbQgYLhT+PqHuZLiQSO5
        BLH6097RbPrflHb6b68ywcAC+QRrlW4=
X-Google-Smtp-Source: APBJJlH5JS4/FaWeIprM+XTkBPqrJoGG6mPmRfdXh5nZ3ESfVoEF7YRHCQJVMM9s75V5EZj1UKdLZg==
X-Received: by 2002:a05:6808:f01:b0:3a0:3495:c8d4 with SMTP id m1-20020a0568080f0100b003a03495c8d4mr3194677oiw.28.1688677871761;
        Thu, 06 Jul 2023 14:11:11 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id m21-20020a638c15000000b0055c02b8688asm971668pgd.20.2023.07.06.14.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 07/12] drm/msm/adreno: Move speedbin mapping to device table
Date:   Thu,  6 Jul 2023 14:10:40 -0700
Message-ID: <20230706211045.204925-8-robdclark@gmail.com>
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

This simplifies the code.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  25 +++
 3 files changed, 92 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6f8c4381fa4a..77b23c004b94 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2204,159 +2204,19 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
-static u32 a610_get_speed_bin(u32 fuse)
+static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
 {
-	/*
-	 * There are (at least) three SoCs implementing A610: SM6125 (trinket),
-	 * SM6115 (bengal) and SM6225 (khaje). Trinket does not have speedbinning,
-	 * as only a single SKU exists and we don't support khaje upstream yet.
-	 * Hence, this matching table is only valid for bengal and can be easily
-	 * expanded if need be.
-	 */
-
-	if (fuse == 0)
-		return 0;
-	else if (fuse == 206)
-		return 1;
-	else if (fuse == 200)
-		return 2;
-	else if (fuse == 157)
-		return 3;
-	else if (fuse == 127)
-		return 4;
-
-	return UINT_MAX;
-}
-
-static u32 a618_get_speed_bin(u32 fuse)
-{
-	if (fuse == 0)
-		return 0;
-	else if (fuse == 169)
-		return 1;
-	else if (fuse == 174)
-		return 2;
-
-	return UINT_MAX;
-}
-
-static u32 a619_holi_get_speed_bin(u32 fuse)
-{
-	/*
-	 * There are (at least) two SoCs implementing A619_holi: SM4350 (holi)
-	 * and SM6375 (blair). Limit the fuse matching to the corresponding
-	 * SoC to prevent bogus frequency setting (as improbable as it may be,
-	 * given unexpected fuse values are.. unexpected! But still possible.)
-	 */
-
-	if (fuse == 0)
-		return 0;
-
-	if (of_machine_is_compatible("qcom,sm4350")) {
-		if (fuse == 138)
-			return 1;
-		else if (fuse == 92)
-			return 2;
-	} else if (of_machine_is_compatible("qcom,sm6375")) {
-		if (fuse == 190)
-			return 1;
-		else if (fuse == 177)
-			return 2;
-	} else
-		pr_warn("Unknown SoC implementing A619_holi!\n");
-
-	return UINT_MAX;
-}
-
-static u32 a619_get_speed_bin(u32 fuse)
-{
-	if (fuse == 0)
-		return 0;
-	else if (fuse == 120)
-		return 4;
-	else if (fuse == 138)
-		return 3;
-	else if (fuse == 169)
-		return 2;
-	else if (fuse == 180)
-		return 1;
-
-	return UINT_MAX;
-}
-
-static u32 a640_get_speed_bin(u32 fuse)
-{
-	if (fuse == 0)
-		return 0;
-	else if (fuse == 1)
-		return 1;
-
-	return UINT_MAX;
-}
-
-static u32 a650_get_speed_bin(u32 fuse)
-{
-	if (fuse == 0)
-		return 0;
-	else if (fuse == 1)
-		return 1;
-	/* Yep, 2 and 3 are swapped! :/ */
-	else if (fuse == 2)
-		return 3;
-	else if (fuse == 3)
-		return 2;
-
-	return UINT_MAX;
-}
+	if (!info->speedbins)
+		return UINT_MAX;
 
-static u32 adreno_7c3_get_speed_bin(u32 fuse)
-{
-	if (fuse == 0)
-		return 0;
-	else if (fuse == 117)
-		return 0;
-	else if (fuse == 190)
-		return 1;
+	for (int i = 0; info->speedbins[i] != UINT_MAX; i += 2)
+		if (info->speedbins[i] == fuse)
+			return (1 << info->speedbins[i + 1]);
 
 	return UINT_MAX;
 }
 
-static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u32 fuse)
-{
-	u32 val = UINT_MAX;
-
-	if (adreno_is_a610(adreno_gpu))
-		val = a610_get_speed_bin(fuse);
-
-	if (adreno_is_a618(adreno_gpu))
-		val = a618_get_speed_bin(fuse);
-
-	else if (adreno_is_a619_holi(adreno_gpu))
-		val = a619_holi_get_speed_bin(fuse);
-
-	else if (adreno_is_a619(adreno_gpu))
-		val = a619_get_speed_bin(fuse);
-
-	else if (adreno_is_7c3(adreno_gpu))
-		val = adreno_7c3_get_speed_bin(fuse);
-
-	else if (adreno_is_a640(adreno_gpu))
-		val = a640_get_speed_bin(fuse);
-
-	else if (adreno_is_a650(adreno_gpu))
-		val = a650_get_speed_bin(fuse);
-
-	if (val == UINT_MAX) {
-		DRM_DEV_ERROR(dev,
-			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-			fuse);
-		return UINT_MAX;
-	}
-
-	return (1 << val);
-}
-
-static int a6xx_set_supported_hw(struct device *dev, struct adreno_gpu *adreno_gpu)
+static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
 {
 	u32 supp_hw;
 	u32 speedbin;
@@ -2375,7 +2235,14 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_gpu *adreno_g
 		return ret;
 	}
 
-	supp_hw = fuse_to_supp_hw(dev, adreno_gpu, speedbin);
+	supp_hw = fuse_to_supp_hw(info, speedbin);
+
+	if (supp_hw == UINT_MAX) {
+		DRM_DEV_ERROR(dev,
+			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
+			speedbin);
+		return UINT_MAX;
+	}
 
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
 	if (ret)
@@ -2483,17 +2350,11 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (!info)
 		return ERR_PTR(-EINVAL);
 
-	/* Assign these early so that we can use the is_aXYZ helpers */
-	/* New-style ADRENO_REV()-only */
-	adreno_gpu->rev = info->rev;
-	/* Quirk data */
-	adreno_gpu->info = info;
-
 	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, adreno_gpu);
+	ret = a6xx_set_supported_hw(&pdev->dev, info);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e62bc895a31f..b7f70cfe6081 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -247,6 +247,20 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a610_zap.mdt",
 		.hwcg = a612_hwcg,
+		/*
+		 * There are (at least) three SoCs implementing A610: SM6125
+		 * (trinket), SM6115 (bengal) and SM6225 (khaje). Trinket does
+		 * not have speedbinning, as only a single SKU exists and we
+		 * don't support khaje upstream yet.  Hence, this matching
+		 * table is only valid for bengal.
+		 */
+		.speedbins = ADRENO_SPEEDBINS(
+			0,   0,
+			206, 1,
+			200, 2,
+			157, 3,
+			127, 4
+		),
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
 		.revn = 618,
@@ -258,6 +272,11 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
+		.speedbins = ADRENO_SPEEDBINS(
+			0,   0,
+			169, 1,
+			174, 2
+		),
 	}, {
 		.machine = "qcom,sm4350",
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
@@ -271,6 +290,11 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			0,   0,
+			138, 1,
+			92,  2
+		),
 	}, {
 		.machine = "qcom,sm6375",
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
@@ -284,6 +308,11 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			0,   0,
+			190, 1,
+			177, 2
+		),
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
@@ -297,6 +326,13 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			0,   0,
+			120, 4,
+			138, 3,
+			169, 2,
+			180, 1
+		),
 	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
@@ -323,6 +359,10 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			0, 0,
+			1, 1
+		),
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
@@ -338,6 +378,12 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			0, 0,
+			1, 1,
+			2, 3, /* Yep, 2 and 3 are swapped! :/ */
+			3, 2
+		),
 	}, {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
 		.revn = 660,
@@ -366,6 +412,11 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			0,   0,
+			117, 0,
+			190, 1
+		),
 	}, {
 		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
 		.revn = 680,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index d5335b99c64c..994ac26ce731 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -72,8 +72,33 @@ struct adreno_info {
 	u32 inactive_period;
 	const struct adreno_reglist *hwcg;
 	u64 address_space_size;
+	/**
+	 * @speedbins: Optional table of fuse to speedbin mappings
+	 *
+	 * Consists of pairs of fuse, index mappings, terminated with
+	 * UINT_MAX sentinal.
+	 */
+	uint32_t *speedbins;
 };
 
+/*
+ * Helper to build a speedbin table, ie. the table:
+ *      fuse | speedbin
+ *      -----+---------
+ *        0  |   0
+ *       169 |   1
+ *       174 |   2
+ *
+ * would be declared as:
+ *
+ *     .speedbins = ADRENO_SPEEDBINS(
+ *                      0,   0,
+ *                      169, 1,
+ *                      174, 2
+ *                  ),
+ */
+#define ADRENO_SPEEDBINS(tbl...) (uint32_t[]) { tbl, UINT_MAX }
+
 const struct adreno_info *adreno_info(struct adreno_rev rev);
 
 struct adreno_gpu {
-- 
2.41.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F363A765E03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 23:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbjG0VX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 17:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbjG0VXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 17:23:18 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEC11FC4;
        Thu, 27 Jul 2023 14:23:10 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686efdeabaeso1006453b3a.3;
        Thu, 27 Jul 2023 14:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690492990; x=1691097790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NINBhdYP8VEjEZtZNimD5Ec6w+Dpk5VTa39c50PhGD8=;
        b=S9f1IcNOvL/5QIiO1et3xZdnfkLaIyDxPLmpoFowE6HGSLexsC20Fdiof/3bCpov4c
         2YU2TEYwHDcVtV8ZV279A6J+39cfhu1Jyu9mcTuhvKeua/l0DgnQY4fVqRt0ITvcFhTs
         GLSyHhR6dUAMUfotHoP2GUNEFKUUXATVDOrtaa28AKgKcKtHkPw576wMm+JgQ8z+WEtz
         bhS0G9TGzWXAgdJ9xAZsmVqMmuBkjcmy37Z+sT8Qb1qNqEIDFzXng8SrocYQCmtyp2d+
         vY9k7EQEDkQMTMpOpEKmbWNkOdHLgKvPzosvrjTnr6QH5meDNFAIPoA/gcBMC/Z98jPr
         Yulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690492990; x=1691097790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NINBhdYP8VEjEZtZNimD5Ec6w+Dpk5VTa39c50PhGD8=;
        b=YArD12YBDItSjmh6dplhDWmbAPcj4Vl7wFQmoj7PQv6qOQ+xA9jPTP8gRS6RtSlIOM
         WTdxkbgyQciCpKsZ/E3MAh3W+VPM2Z01DyjyZ4gnepGdjF+lfIyu8+YD0rQWklMWVFF8
         jjEbwLcBdCKiWE5G6qN3toGHCRqyvuUELk6l/+y3gsc2islYTV0Y8JSKz0FHrsiuHE68
         hHkMN9Gz0mEj0kKzNkvk45ffADeTt37JgXHwKK9ldPZOXHCX9il0yA7RtnGU87idRtUB
         0Lq8AgLVY9yU/CHvk/vBlKenqZE9jf3rP8KpQ29/OhhJjvz2qF6rt2L4cO1h4jB93K+Z
         jB7A==
X-Gm-Message-State: ABy/qLbnJuYCzbM9S3Q8VsMpXN2Y5BhJdAz57fhp3uSVe8zAUnakYZdE
        Q5kvHt1HBA0cZ9QdPDgLNms=
X-Google-Smtp-Source: APBJJlFyWM7jvawTH0YLXnbGC6zbM05qauqoVHyaIlt7HAzdpxAekChIiSwTrK7V4gF3591sL06kWA==
X-Received: by 2002:a05:6a00:14d1:b0:686:254c:9d47 with SMTP id w17-20020a056a0014d100b00686254c9d47mr330854pfu.30.1690492989705;
        Thu, 27 Jul 2023 14:23:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79111000000b0064f76992905sm1872360pfh.202.2023.07.27.14.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:23:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 07/13] drm/msm/adreno: Move speedbin mapping to device table
Date:   Thu, 27 Jul 2023 14:20:12 -0700
Message-ID: <20230727212208.102501-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This simplifies the code.

v2: Use a table of structs instead of flat uint32_t[]

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  30 ++++
 3 files changed, 97 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6f8c4381fa4a..a81a6459c656 100644
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
+	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++)
+		if (info->speedbins[i].fuse == fuse)
+			return BIT(info->speedbins[i].speedbin);
 
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
index e62bc895a31f..325b25dc8bfd 100644
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
+			{ 0,   0 },
+			{ 206, 1 },
+			{ 200, 2 },
+			{ 157, 3 },
+			{ 127, 4 },
+		),
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
 		.revn = 618,
@@ -258,6 +272,11 @@ static const struct adreno_info gpulist[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
 		.init = a6xx_gpu_init,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 1 },
+			{ 174, 2 },
+		),
 	}, {
 		.machine = "qcom,sm4350",
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
@@ -271,6 +290,11 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 138, 1 },
+			{ 92,  2 },
+		),
 	}, {
 		.machine = "qcom,sm6375",
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
@@ -284,6 +308,11 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 190, 1 },
+			{ 177, 2 },
+		),
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
@@ -297,6 +326,13 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a615_zap.mdt",
 		.hwcg = a615_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 120, 4 },
+			{ 138, 3 },
+			{ 169, 2 },
+			{ 180, 1 },
+		),
 	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
@@ -323,6 +359,10 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.zapfw = "a640_zap.mdt",
 		.hwcg = a640_hwcg,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+		),
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
@@ -338,6 +378,12 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 3 }, /* Yep, 2 and 3 are swapped! :/ */
+			{ 3, 2 },
+		),
 	}, {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
 		.revn = 660,
@@ -366,6 +412,11 @@ static const struct adreno_info gpulist[] = {
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 117, 0 },
+			{ 190, 1 },
+		),
 	}, {
 		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
 		.revn = 680,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index d5335b99c64c..aa64bad25a63 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -60,6 +60,11 @@ struct adreno_reglist {
 extern const struct adreno_reglist a612_hwcg[], a615_hwcg[], a630_hwcg[], a640_hwcg[], a650_hwcg[];
 extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 
+struct adreno_speedbin {
+	uint16_t fuse;
+	uint16_t speedbin;
+};
+
 struct adreno_info {
 	const char *machine;
 	struct adreno_rev rev;
@@ -72,8 +77,33 @@ struct adreno_info {
 	u32 inactive_period;
 	const struct adreno_reglist *hwcg;
 	u64 address_space_size;
+	/**
+	 * @speedbins: Optional table of fuse to speedbin mappings
+	 *
+	 * Consists of pairs of fuse, index mappings, terminated with
+	 * {SHRT_MAX, 0} sentinal.
+	 */
+	struct adreno_speedbin *speedbins;
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
+ *                      { 0,   0 },
+ *                      { 169, 1 },
+ *                      { 174, 2 },
+ *     ),
+ */
+#define ADRENO_SPEEDBINS(tbl...) (struct adreno_speedbin[]) { tbl {SHRT_MAX, 0} }
+
 const struct adreno_info *adreno_info(struct adreno_rev rev);
 
 struct adreno_gpu {
-- 
2.41.0


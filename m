Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC106D1340
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 01:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjC3X02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 19:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjC3XZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 19:25:46 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E16712844
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:25:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id z42so21265036ljq.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680218740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1FWJRMGgz7aV9ZtXAOSh14E/RuMW29Ts/RhMsLc3qw=;
        b=U+ovZeV09WikUDRmuCGGR4WGciBDtJByqMAPdTtYDhuKlBMFft6o9t9wMZJT1ezICb
         8L5lgEs/eeJ9cg34ImBZZk8pxZYkQi46FUaVTYyUdsJb27oBYz7pkIc5xyXGhMye4MH1
         3ZO7IWoZcas3YML0sg1EnbCg6do6OeCbVydQCfeOjo0OwcoZ4qh6j/xhwN0gtdmhKUie
         A03fYpmebDvr36Uy8zLF+N9tCpByDJUj0BEA8rLBmPJkAKehjFqU3tXmsr0/kSoEmP8e
         oNz17VhWsWG3jlk9koIyMWuF4j4d3FoyS5w2EyR0kvy+rKMeWa7cYPm4GgXveHHqC5G0
         BwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1FWJRMGgz7aV9ZtXAOSh14E/RuMW29Ts/RhMsLc3qw=;
        b=rkqEov+84pm6PHVkdwMMkNpovQplWk14yZ0Gn3RssXFKeiJbR8DM4wDMqpGjx66H9F
         fIklAeOc0ZzZ5qcSbTGZ83Jh5R6Ul+B/hnVCFswYixyjje5jth+rjfTNJxy8kC+NOCtT
         MXY9xbaJYzRDzGrldCqn6ffqWiz67wYU2Mgf8rwD7ccrEHzSRQ2lwhAcxpL8S2diX3Lq
         VSLwRIyCnBXJT2UX/pM3W/57pX3B2kIc9QBgiGXn8Ye/CELC8dbicGxtLroCaNsbEo65
         K45FFWBKK0cRZPsOzWUaQOz3LNSVcDa3HEWJNYs/Hp0UDpDhHp7SMAUPLrilgW0So/yR
         Exzw==
X-Gm-Message-State: AAQBX9fRa+gufH3a4EeMJ1d3KqJ3XPKi4vyYO0fipqMSoDNkpCpSXh+t
        SC3pHf9XfJqR8tyFN5J+CWNPqQ==
X-Google-Smtp-Source: AKy350bluWMcMPGSuHhxrwxFm15BsML54Qb93gQkGE1CXDOx6t3JaN+y5Q8vNboBTVBOLVAAkgddaw==
X-Received: by 2002:a2e:985a:0:b0:293:2bc6:d50b with SMTP id e26-20020a2e985a000000b002932bc6d50bmr7907414ljj.18.1680218740674;
        Thu, 30 Mar 2023 16:25:40 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id g26-20020ac2539a000000b004dda80cabf0sm127241lfh.172.2023.03.30.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:25:40 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 31 Mar 2023 01:25:27 +0200
Subject: [PATCH v5 13/15] drm/msm/a6xx: Use adreno_is_aXYZ macros in
 speedbin matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v5-13-bf774b9a902a@linaro.org>
References: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v5-0-bf774b9a902a@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680218720; l=4317;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Z8b5MMFV+Q5ky2mjKEOT7/xH7FsQTUvRZc+M3VORM24=;
 b=g9uDfzN3dWgZtQ4KWSuhtL4T30Wvm1Pud1+RnoBzRpI20m2XeZ4pVGB6W8k5a20woxEjOIuALfMj
 Md3D5irPDWyrCHzQm1qU3chTjQbCAZPyKoSKg2wnb7uZ5ApRAMhV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Before transitioning to using per-SoC and not per-Adreno speedbin
fuse values (need another patchset to land elsewhere), a good
improvement/stopgap solution is to use adreno_is_aXYZ macros in
place of explicit revision matching. Do so to allow differentiating
between A619 and A619_holi.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 +++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 87ff48f7f3be..4665a2e8fdde 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2217,23 +2217,23 @@ static u32 adreno_7c3_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
-static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
+static u32 fuse_to_supp_hw(struct device *dev, struct adreno_gpu *adreno_gpu, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
-	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
+	if (adreno_is_a618(adreno_gpu))
 		val = a618_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 1, 9, ANY_ID), rev))
+	else if (adreno_is_a619(adreno_gpu))
 		val = a619_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+	else if (adreno_is_7c3(adreno_gpu))
 		val = adreno_7c3_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
+	else if (adreno_is_a640(adreno_gpu))
 		val = a640_get_speed_bin(fuse);
 
-	else if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
+	else if (adreno_is_a650(adreno_gpu))
 		val = a650_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
@@ -2246,7 +2246,7 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	return (1 << val);
 }
 
-static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
+static int a6xx_set_supported_hw(struct device *dev, struct adreno_gpu *adreno_gpu)
 {
 	u32 supp_hw;
 	u32 speedbin;
@@ -2265,7 +2265,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 		return ret;
 	}
 
-	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
+	supp_hw = fuse_to_supp_hw(dev, adreno_gpu, speedbin);
 
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
 	if (ret)
@@ -2384,7 +2384,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	if (!adreno_has_gmu_wrapper(adreno_gpu))
 		a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
+	ret = a6xx_set_supported_hw(&pdev->dev, adreno_gpu);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 27c30a7694f4..da9f45a13b5d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -268,9 +268,9 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
 	return gpu->revn == 630;
 }
 
-static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
+static inline int adreno_is_a640(struct adreno_gpu *gpu)
 {
-	return (gpu->revn == 640) || (gpu->revn == 680);
+	return gpu->revn == 640;
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
@@ -289,6 +289,11 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
 	return gpu->revn == 660;
 }
 
+static inline int adreno_is_a680(struct adreno_gpu *gpu)
+{
+	return gpu->revn == 680;
+}
+
 /* check for a615, a616, a618, a619 or any derivatives */
 static inline int adreno_is_a615_family(struct adreno_gpu *gpu)
 {
@@ -306,6 +311,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 	return gpu->revn == 650 || gpu->revn == 620 || adreno_is_a660_family(gpu);
 }
 
+static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
+{
+	return adreno_is_a640(gpu) || adreno_is_a680(gpu);
+}
+
 u64 adreno_private_address_space_size(struct msm_gpu *gpu);
 int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len);

-- 
2.40.0


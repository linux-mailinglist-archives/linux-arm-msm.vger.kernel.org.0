Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64B6A70A804
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 May 2023 14:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbjETMVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 May 2023 08:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbjETMUt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 May 2023 08:20:49 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB3F10D7
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:20:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4efd6e26585so4688442e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 May 2023 05:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684585207; x=1687177207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhfos0UrJYSpJBVxVD1DGmqX6U3slcT+9UKFHjrC6/Y=;
        b=cbqlSyrMe3Qh1SjdcqgrI8yIWvHaMc6zgZUaBfGzNtoPEUvw9OsFcV6HqUh8135j69
         fw2S9D8ocD5H429A5Nd2mnYDigN05EJfmbbspbqzxChd+cmCjgd03TwXk8JUhQUfdnWT
         m8AZyMh2EdC88Wt2pQH8uin1L12uaOcb6hW5KcvRwUnicQRI0hmE1BhxLt2ZorOSLlRK
         T9br4wCOY7p9RcG3P5VAYgY7bw2nvs5wBg70zTNUcDisXlvfXv+eZGCGhgRPRKT5bCd2
         7pY6iJnZWl5mElWCoyl5eNbbJ9SYw/1RUUnudZjBL3GtrBJcZI2kfIGlopsvdjUTVNWt
         VowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684585207; x=1687177207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhfos0UrJYSpJBVxVD1DGmqX6U3slcT+9UKFHjrC6/Y=;
        b=bOweNhEdwHaGPlBMB4bQICXsZpLjXhc19KGQa/szXTwvaOdzr1F94SPsDnUyr0f8bb
         lmfVZI7GNbrvV63G299JdP5Wf/vA4iGqIuXsFLVpFPHJ4Ikr+/VIdOO9x0eNCgqUFqFa
         ipCW92RXA7PhLAjNRNz2IF7IryR79zmKNVT3fIWS6qOXGEoyZcoC4ADll8KqqEcn5LCx
         c/9ZXhumATyZuX6q4K/5TbCYYMp7Z9EJ7qbDV10nu0Vgx6qcFzAqCRM1yBRnHq6Ggf8u
         K56UcwQoWgvlbwf7nErYUPoGSTtNThgPDXvJTedMrDsXakd5mZs3YaZCBcPNIdYNqXKu
         UPbA==
X-Gm-Message-State: AC+VfDyt9o3EXe+2dV4ZDMla6zE1tHw4qKdlML620RjDgxSe9E3n8Mz8
        t4tR2qrfbydQ6pMvlvkK7sGx/Q==
X-Google-Smtp-Source: ACHHUZ5NlVsOOjordr7L4pWQq2TMdpaUFz/GjpTZAA8SJVes4vts0GBhPyF3ID5bVoh2z3Rl6dLn4g==
X-Received: by 2002:ac2:47f8:0:b0:4f2:5c4b:e69b with SMTP id b24-20020ac247f8000000b004f25c4be69bmr1772748lfp.67.1684585206844;
        Sat, 20 May 2023 05:20:06 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 05:20:06 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Sat, 20 May 2023 14:19:52 +0200
Subject: [PATCH v7 12/18] drm/msm/a6xx: Add support for A619_holi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-12-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=4014;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UvvtX87HOPp56IoMSbK8amUUhfTCemIF7foXaIkZYF0=;
 b=ezN+zjCuuBL3p2bWj0V97pqWvY7Gi0cJ5kW9NCsMwBLLX0LqFXDM1p7DESG4oHbV/HPGE+1ck
 ONRWYgaB2UzAZHmpSduu2GpXV5sEpfrtAaAWpZODbjKlHmbEuAPNOn5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A619_holi is a GMU-less variant of the already-supported A619 GPU.
It's present on at least SM4350 (holi) and SM6375 (blair). No mesa
changes are required. Add the required kernel-side support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2ba9d790a52c..7eaebcefcb2a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -810,6 +810,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		hbb_lo = 0;
+
 	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
@@ -1027,7 +1030,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu)) {
+	if (adreno_is_a619_holi(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	} else if (a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 		/* Let's make extra sure that the GPU can access the memory.. */
@@ -1036,6 +1044,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1656,12 +1667,18 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
+#define VBIF_RESET_ACK_MASK		0xF0
+#define GPR0_GBIF_HALT_REQUEST		0x1E0
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
-	if (!a6xx_has_gbif(adreno_gpu)) {
+	if (adreno_is_a619_holi(adreno_gpu)) {
+		gpu_write(gpu, 0x18, GPR0_GBIF_HALT_REQUEST);
+		spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
+				(VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
+	} else if (!a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, VBIF_XIN_HALT_CTRL0_MASK);
 		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
 				(VBIF_XIN_HALT_CTRL0_MASK)) == VBIF_XIN_HALT_CTRL0_MASK);
@@ -1755,6 +1772,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err_mem_clk;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/* If anything goes south, tear the GPU down piece by piece.. */
 	if (ret) {
 err_mem_clk:
@@ -1818,6 +1838,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	/* Drain the outstanding traffic on memory buses */
 	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_disable(gmu);
+
 	clk_disable_unprepare(gpu->ebi1_clk);
 
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ee5352bc5329..432fee5c1516 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -252,6 +252,11 @@ static inline int adreno_is_a619(struct adreno_gpu *gpu)
 	return gpu->revn == 619;
 }
 
+static inline int adreno_is_a619_holi(struct adreno_gpu *gpu)
+{
+	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
+}
+
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 630;

-- 
2.40.1


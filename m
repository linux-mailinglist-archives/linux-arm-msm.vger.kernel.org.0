Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B101074A5B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231820AbjGFVLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbjGFVLJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:09 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE601FD2
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:07 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b8a8154f9cso8221845ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677867; x=1691269867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKfLr7XNPcJCQHURijcwAJxgI3TYjsU4oBWrQCb/FYQ=;
        b=ZUyPvibXyrTK4yboKfw06nbZ/LmYtbb+1MRK24yQqG7nKWPq4elV8C7TFUGLO8Yf6/
         7EtZNN4EkKDx/qHNlphI7MvSBY6MFm3Urp9Ufh2qXTgHDhICJdSw92ztSO6VnvHMd7JT
         k+rODgxwzRd4XqzTimw2ec64KTQ031WJjb0koEQwRsW6g92FBIau9CT80yDJy0ncQmMx
         SyJ+vlB0kHBIuPsE6kLit5wx6fjZ6xv5vxgjJkAjyDntkdqg7+1g7OtvDY7vbuwlcks2
         ufb8slxnrB3ybDU0MdFuPR+DtoU2xW5bT38is5C9PAAVMRcpd7htmKb+TkiJiRXi4Imy
         KXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677867; x=1691269867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKfLr7XNPcJCQHURijcwAJxgI3TYjsU4oBWrQCb/FYQ=;
        b=AEG4Pm02+978r2AYUnd35nSxYR4t8OKKZ4zc8LNBDtom8YlFxhuMlaA6Bl0jhbZtYS
         eo8gRyWMvmvRsqMnYzlrgR2PUdQ7dS8Y5nfsmZ3xByTYtMcGUEna2qDjoaVltYQEl+C4
         vAxlnQjwOgThI4eCyIKt0/cLf95faMTFV6fpMUNfEbH1UTRiE8ymrl2Q9QTMlO7KO5gP
         pDkQTCYPRNfiYc9empEja2yvmKeR61rq3UtsuzAiO9vzY0+Yz44cbwbkNPdHZoqtS4u0
         dl0nUcLeKYfqUfFJIiQrSI9T8pdsCiHfhKNZ91KG6S7SW7jSVOxCShC9ugbMwl38tiNN
         bm9g==
X-Gm-Message-State: ABy/qLafSqh78nDXmdZu8wQ7s8RnGcKbQ7fmGYwyShjwugV91Vm18M4/
        eqiJHXyExCG7787ew0P+rwHph4evBWI=
X-Google-Smtp-Source: APBJJlFKRQd31xkQDFA2a/mt8aPnhXSwslY/Tkvda/80a3DIf7C8PmSgUeqKciAQaWvdS2mR3c7chw==
X-Received: by 2002:a17:902:d4d2:b0:1b8:656f:76e7 with SMTP id o18-20020a170902d4d200b001b8656f76e7mr5162178plg.23.1688677867036;
        Thu, 06 Jul 2023 14:11:07 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902c38900b001b876d5b23esm1824936plg.144.2023.07.06.14.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 04/12] drm/msm/adreno: Use quirk identify hw_apriv
Date:   Thu,  6 Jul 2023 14:10:37 -0700
Message-ID: <20230706211045.204925-5-robdclark@gmail.com>
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

Rather than just open coding a list of gpu-id matches.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5ba8b5aca502..6f8c4381fa4a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2489,8 +2489,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* Quirk data */
 	adreno_gpu->info = info;
 
-	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
-		adreno_gpu->base.hw_apriv = true;
+	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 326912284a95..f469f951a907 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -302,6 +302,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a650_zap.mdt",
 		.hwcg = a650_hwcg,
@@ -315,6 +316,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_1M + SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
@@ -327,6 +329,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.hwcg = a660_hwcg,
 		.address_space_size = SZ_16G,
@@ -350,6 +353,7 @@ static const struct adreno_info gpulist[] = {
 		},
 		.gmem = SZ_4M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
 		.init = a6xx_gpu_init,
 		.zapfw = "a690_zap.mdt",
 		.hwcg = a690_hwcg,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index d31e2d37c61b..a7c4a2c536e3 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -32,6 +32,7 @@ enum {
 #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
 #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
 #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
+#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
 
 struct adreno_rev {
 	uint8_t  core;
-- 
2.41.0


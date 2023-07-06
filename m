Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFA7074A5AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjGFVLg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbjGFVLF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:05 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 766EF1BC9
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:04 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-262c42d3fafso834510a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677864; x=1691269864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQnN829O1lAOpEHGj2SRxckFk9YAJvOeNQ8or0cs/+c=;
        b=dLbZB0alBGG9X9K4r4xMGfQjuKH4vzeWUhFfbqMN9hhDU494AN6pH+ziHxSULWBHZB
         2nbAkU5jryqWDNBiLHtPmdQ8S9X2DNcPx19gJ75X8AlumlVKZN6CzyuGUgJqNISfQ2p7
         34L+T5mED0Dqy4BMd/0RSskL0tIYzHok5Y9QJw8zR1l7auNRCeRVTZUHGzVWqHPC1jRm
         LMuD90wRQD1wBqDL5bQSk735DuBbDVRWdPusGOFYNYbebFqzkj/6gB6JBsA154SGA8Rp
         gQN3lakDrpGeAjyIWE4QmDhBfdRSTrpzJTx3hLmlaml88vOSeml5GsNRYMX26jsnREWR
         9Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677864; x=1691269864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQnN829O1lAOpEHGj2SRxckFk9YAJvOeNQ8or0cs/+c=;
        b=L5H/GbPCxVh2rxrgM7ogqHWr+juehEDeIbv2s5i0XymER2BcsiWwKhSP/ZnhwsvCLP
         MDgdKSnLX2tLHP7HWKli4PeM9H95fCTj0CtTYSmSmMwDOWsNh90AIefsnc3DC3B/6q2q
         X4x8q5A18rAiUxv0lVlpLt12Q/xi1QchzWeQYUCp75c5cZOEgKSe61QHcAewQk2gUQ8A
         XvdfVTLplCWSucYl+dGY2Lnrgegbngzo99IztgG/wWRXUKfz5vRONsLJ4wB9zESkVJAw
         mnkugaG+Mj5FW+ruRn1zyYcy/eEpeNnuyUPl156sScVmzfT1MbI9ppNmXOP5NuzrpVd/
         Y/Ng==
X-Gm-Message-State: ABy/qLbBUUAMDsrzC/byextFNB7TQ3QBCUKIuiwbRbOYEzXajGMlDgaq
        QWToqpFuipSBo1LsKrc1zI0=
X-Google-Smtp-Source: APBJJlFHAh9+le0qFXEZH+KPlE6cQwRonzAqFixkDlWN+lhqtYm6SXxl2FI3IyK6liholOWKpPTpqg==
X-Received: by 2002:a17:90a:fe07:b0:262:ca9c:edcb with SMTP id ck7-20020a17090afe0700b00262ca9cedcbmr4929640pjb.9.1688677863834;
        Thu, 06 Jul 2023 14:11:03 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id 16-20020a631750000000b0055386b1415dsm1704942pgx.51.2023.07.06.14.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 02/12] drm/msm/adreno: Remove redundant gmem size param
Date:   Thu,  6 Jul 2023 14:10:35 -0700
Message-ID: <20230706211045.204925-3-robdclark@gmail.com>
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

Even in the ocmem case, the allocated ocmem buffer size should match the
requested size.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      | 2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 8 ++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 -
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index c67089a7ebc1..50ee03bc94b4 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -205,7 +205,7 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 		A2XX_MH_INTERRUPT_MASK_MMU_PAGE_FAULT);
 
 	for (i = 3; i <= 5; i++)
-		if ((SZ_16K << i) == adreno_gpu->gmem)
+		if ((SZ_16K << i) == adreno_gpu->info->gmem)
 			break;
 	gpu_write(gpu, REG_A2XX_RB_EDRAM_INFO, i);
 
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index a99310b68793..f0803e94ebe5 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -749,7 +749,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_HI, 0x00000000);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_LO,
-		0x00100000 + adreno_gpu->gmem - 1);
+		0x00100000 + adreno_gpu->info->gmem - 1);
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
 	if (adreno_is_a506(adreno_gpu) || adreno_is_a508(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b3ada1e7b598..edbade75020f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1270,7 +1270,7 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
 
 		gpu_write64(gpu, REG_A6XX_UCHE_GMEM_RANGE_MAX,
-			0x00100000 + adreno_gpu->gmem - 1);
+			0x00100000 + adreno_gpu->info->gmem - 1);
 	}
 
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 5eba0ae5c9a7..326912284a95 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -239,7 +239,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
 		.revn = 610,
-		.name = "A610",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 		},
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e3cd9ff6ff1d..4f59682f585e 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -320,7 +320,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = adreno_gpu->info->revn;
 		return 0;
 	case MSM_PARAM_GMEM_SIZE:
-		*value = adreno_gpu->gmem;
+		*value = adreno_gpu->info->gmem;
 		return 0;
 	case MSM_PARAM_GMEM_BASE:
 		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
@@ -1041,14 +1041,15 @@ int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
 		return PTR_ERR(ocmem);
 	}
 
-	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->gmem);
+	ocmem_hdl = ocmem_allocate(ocmem, OCMEM_GRAPHICS, adreno_gpu->info->gmem);
 	if (IS_ERR(ocmem_hdl))
 		return PTR_ERR(ocmem_hdl);
 
 	adreno_ocmem->ocmem = ocmem;
 	adreno_ocmem->base = ocmem_hdl->addr;
 	adreno_ocmem->hdl = ocmem_hdl;
-	adreno_gpu->gmem = ocmem_hdl->len;
+
+	WARN_ON(ocmem_hdl->len != adreno_gpu->info->gmem);
 
 	return 0;
 }
@@ -1097,7 +1098,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
-	adreno_gpu->gmem = adreno_gpu->info->gmem;
 	adreno_gpu->revn = adreno_gpu->info->revn;
 	adreno_gpu->rev = *rev;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6830c3776c2d..aaf09c642dc6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,7 +77,6 @@ struct adreno_gpu {
 	struct msm_gpu base;
 	struct adreno_rev rev;
 	const struct adreno_info *info;
-	uint32_t gmem;  /* actual gmem size */
 	uint32_t revn;  /* numeric revision name */
 	uint16_t speedbin;
 	const struct adreno_gpu_funcs *funcs;
-- 
2.41.0


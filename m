Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054DE3E3646
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 18:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhHGQ0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 12:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhHGQ0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 12:26:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC55CC0613CF;
        Sat,  7 Aug 2021 09:26:05 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so27434172pjs.0;
        Sat, 07 Aug 2021 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KK6pClbRoyb7NoLCLxdt7TZo5IqArGIaNgS9FD1UJck=;
        b=Jo7Z5SIQMndDQNZMfafxV3iHlM0HyuITIt3fo+N3zm85xbzvJysih0K3Ga+nv+wbbx
         9QKD9Pgx+BxNT6l6fz1xPjpEvyAqTUNUYkuXVRl799mqt/2z5CkC29bqlg8BBtl1kIo+
         hTh9KWekSDbXX0z3v9AvoO7lzdBO/1otyd+uh+Rp0EgEPaNCE90aOV/thgbe0xU9hWFk
         vcZ+fz4mExKhkkWw1Ox8+gPSciDvz/djzj3ia0aYVQk0h+ZbEXtj2iWpNziWc2qghuBd
         8ICFp/MHMCck6pb15cj80csk24/NnP3kK+bGnwrcsJ30DoBLRhNpjtOTMCfRS0OmUEKZ
         gJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KK6pClbRoyb7NoLCLxdt7TZo5IqArGIaNgS9FD1UJck=;
        b=WpHZraK0/VKaJDJP58mwpRAbCfjTSMmx2RcV8L6lDx+4yk0in3zpz0eks3H0iH8kGG
         Q/ckrb+9YcCPclHkq9pKLHxJND96CTD2PwXMqgVD98w9fN04q3JFBMwhiflDj/xMNEDT
         07H5+/uoM1n/Nc1QSNfCPuxWfa742VK+mOS88Dlx6yJ5yVOvw2s6KUK0SqN01GPk3WWV
         1s1NXMPmLbja4cPMddD9mpZkNhMJ0jQ9gj2gsHl/n51GHnXwmnjT35A2ZnSIUeEt2jMI
         vd5DVs9ygHJFAqL2uNF8vtZaS9PnvjKRK5D4ydluwPo1lFqr530nTxUKUZWvAVwQfETL
         +ngA==
X-Gm-Message-State: AOAM5320XO9eGNHFKzgkalp74NOwXVwo3/Lja/KcdbapSjM3sU6k88mx
        lghnILbtKaemb97/GxFnsHSp7rzjHW3u2g==
X-Google-Smtp-Source: ABdhPJyZpLLZHxalF+8THlswZkTPT3+hN7LYOH8rxbXjNvAupYVKZNmiTg7h801YxUdqBteLBG9jRg==
X-Received: by 2002:aa7:9891:0:b029:3c4:dab0:6379 with SMTP id r17-20020aa798910000b02903c4dab06379mr10289322pfl.12.1628353565007;
        Sat, 07 Aug 2021 09:26:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id bv4sm2760097pjb.27.2021.08.07.09.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 09:26:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Add adreno_is_a640_family()
Date:   Sat,  7 Aug 2021 09:30:11 -0700
Message-Id: <20210807163019.379003-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Combine adreno_is_a640() and adreno_is_a680().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 15 +++++++--------
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  9 ++-------
 4 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ab6b22264c2b..a7c58018959f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -521,8 +521,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
 		pdc_in_aop = true;
-	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu) ||
-		 adreno_is_a680(adreno_gpu))
+	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640_family(adreno_gpu))
 		pdc_address_offset = 0x30090;
 	else
 		pdc_address_offset = 0x30080;
@@ -1527,7 +1526,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			SZ_16M - SZ_16K, 0x04000);
 		if (ret)
 			goto err_memory;
-	} else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
+	} else if (adreno_is_a640_family(adreno_gpu)) {
 		ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
 			SZ_256K - SZ_16K, 0x04000);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6ddd9010cc4b..be62f492538c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -683,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
@@ -764,7 +764,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	 * a660 targets have all the critical security fixes from the start
 	 */
 	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
-	    adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
+	    adreno_is_a640_family(adreno_gpu)) {
 		/*
 		 * If the lowest nibble is 0xa that is an indication that this
 		 * microcode has been patched. The actual version is in dword
@@ -904,8 +904,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	a6xx_set_hwcg(gpu, true);
 
 	/* VBIF/GBIF start*/
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a680(adreno_gpu)) {
+	if (adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
 		gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
@@ -943,8 +943,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
 	gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
 
-	if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
-	    adreno_is_a680(adreno_gpu))
+	if (adreno_is_a640_family(adreno_gpu) ||
+	    adreno_is_a650_family(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
 	else
 		gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
@@ -961,8 +961,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
 	*/
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
-	else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu) ||
-			adreno_is_7c3(adreno_gpu))
+	else if (adreno_is_a640_family(adreno_gpu) || adreno_is_7c3(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 376d0d9809fa..d4c65bf0a1b7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -458,7 +458,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 
 	if (adreno_is_a618(adreno_gpu))
 		a618_build_bw_table(&msg);
-	else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
+	else if (adreno_is_a640_family(adreno_gpu))
 		a640_build_bw_table(&msg);
 	else if (adreno_is_a650(adreno_gpu))
 		a650_build_bw_table(&msg);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 899cca8fc68a..225c277a6223 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -241,9 +241,9 @@ static inline int adreno_is_a630(struct adreno_gpu *gpu)
        return gpu->revn == 630;
 }
 
-static inline int adreno_is_a640(struct adreno_gpu *gpu)
+static inline int adreno_is_a640_family(struct adreno_gpu *gpu)
 {
-       return gpu->revn == 640;
+	return (gpu->revn == 640) || (gpu->revn == 680);
 }
 
 static inline int adreno_is_a650(struct adreno_gpu *gpu)
@@ -274,11 +274,6 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
 	       adreno_is_a660_family(gpu);
 }
 
-static inline int adreno_is_a680(struct adreno_gpu *gpu)
-{
-       return gpu->revn == 680;
-}
-
 int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
 const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
 		const char *fwname);
-- 
2.31.1


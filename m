Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52403E364A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 18:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhHGQ02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 12:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhHGQ02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 12:26:28 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F057EC0613CF;
        Sat,  7 Aug 2021 09:26:09 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q2so11430291plr.11;
        Sat, 07 Aug 2021 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EoZd5bCD6hQUjG2ezN1/qV9+Adnx68YyNczYkEr+W54=;
        b=OUAgzTqrOCa/ja7X/Q3pwsCmjUGKCTe1R0IQ9AUZNsujvliCU2Zop0xQ2wulgAe0K0
         GeBdFpig0gHMECKUXkbi4xpLExGQWsTlx276+2XScB2hptnoNJ/zbeMlAhEz5IroYM9s
         y5tWxy1pFb6pCN+7TdJQwJECzp5hnQ8F2LAD4SJgM7YogoGr1qoencmT7ih5a5JXiLHQ
         gV2QdX0BoHf7r/X1pD8oT4ULr0dTr4NI3ge7xlFkhVB6FAJn6DEa8Ar7nvXhkyTePY5x
         JKqScN9tSmYpbHIFax3cWFGvPdfRDAJmAKc3EYxIXZHuJYNBs/b0iA4O1q634FXvY/Uh
         6/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EoZd5bCD6hQUjG2ezN1/qV9+Adnx68YyNczYkEr+W54=;
        b=tU1KrDndUENBOlR97Ts+GKLNdV2mUGZ28YTxU4uHXp+I3lPSxG0ee3IUQXezMDzcYj
         Loswq6ArrAyYuwIsra84pCvLhp5FUMIdQ0KE6yo5AA8e3BFcTe4UXfvOkEy4UuJeYVUn
         U+508ik1oxMHae6YyUvHuVeOvcO71YSWLYXFiN8w2XFP9+FlnzaNwY34jXAXLKptyNWE
         ML9jF9+texeRnMK+JwXCcCbEqaKYYZkMYSmdX0PLSYNu1lRjQycYOltW5UMiOS0r4Y9+
         MUFPYGK0j7dezhZp/OTGWQb1SOW69pOmFKuuEkPnAVo2zkh3eoQsgfkelcNBRudDaumD
         ENVw==
X-Gm-Message-State: AOAM532mKxkABtCRXPEjWoJI1EcHZBrNYchp0PjaCHpkM3xV9skV8hlT
        TDOe6MYRgms2eAB8h5RCg9wN4C32nqTJ4w==
X-Google-Smtp-Source: ABdhPJxobPiRLfgh2lKypDIM0XSVkzLuoDzXHNbRb2TM01sKb/ba4z99V1pQQjbuCigNxgMu73zU4Q==
X-Received: by 2002:a17:90a:2942:: with SMTP id x2mr25799687pjf.95.1628353569520;
        Sat, 07 Aug 2021 09:26:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id d9sm13735881pfv.161.2021.08.07.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 09:26:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Rework SQE version check
Date:   Sat,  7 Aug 2021 09:30:12 -0700
Message-Id: <20210807163019.379003-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807163019.379003-1-robdclark@gmail.com>
References: <20210807163019.379003-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This check is really about which SQE firmware, rather than which GPU.
Rework to match minimum version based on firmware name, so it doesn't
need to be updated when adding additional GPUs using the same fw.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index be62f492538c..0e8238f58721 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -747,6 +747,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 {
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	const char *sqe_name = adreno_gpu->info->fw[ADRENO_FW_SQE];
 	u32 *buf = msm_gem_get_vaddr(obj);
 	bool ret = false;
 
@@ -763,8 +764,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 	 *
 	 * a660 targets have all the critical security fixes from the start
 	 */
-	if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
-	    adreno_is_a640_family(adreno_gpu)) {
+	if (!strcmp(sqe_name, "a630_sqe.fw")) {
 		/*
 		 * If the lowest nibble is 0xa that is an indication that this
 		 * microcode has been patched. The actual version is in dword
@@ -785,7 +785,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		DRM_DEV_ERROR(&gpu->pdev->dev,
 			"a630 SQE ucode is too old. Have version %x need at least %x\n",
 			buf[0] & 0xfff, 0x190);
-	} else if (adreno_is_a650(adreno_gpu)) {
+	} else if (!strcmp(sqe_name, "a650_sqe.fw")) {
 		if ((buf[0] & 0xfff) >= 0x095) {
 			ret = true;
 			goto out;
@@ -794,7 +794,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
 		DRM_DEV_ERROR(&gpu->pdev->dev,
 			"a650 SQE ucode is too old. Have version %x need at least %x\n",
 			buf[0] & 0xfff, 0x095);
-	} else if (adreno_is_a660_family(adreno_gpu)) {
+	} else if (!strcmp(sqe_name, "a660_sqe.fw")) {
 		ret = true;
 	} else {
 		DRM_DEV_ERROR(&gpu->pdev->dev,
-- 
2.31.1


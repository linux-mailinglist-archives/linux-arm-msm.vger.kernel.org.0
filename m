Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B4C744A80
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jul 2023 18:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjGAQU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Jul 2023 12:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGAQU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Jul 2023 12:20:57 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2FBC10DC
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Jul 2023 09:20:56 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b852785a65so18741865ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Jul 2023 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688228456; x=1690820456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5O8JTAv4YKw7uBry2NnIZyVDnMiMWTmml9N1ztNufp0=;
        b=nSgSStXrnBPo1GTiqMuJEqk85ex8UyRMBoWaZWBjI+ocKbZH5y8hhBzkJ/SRKD2/bf
         l6OGMMp7W3tj7d2e+XibgAYckXE9Kl+BFxTOJp4/1F1lnnlAlT5tZL0dmBS9Gf0jPZHI
         8EKYmS9bIzIIAGXx8AjCnMiYpjkYXnOrJq7oXx5KBL9gksqGdzS6b7TY62KcD0Tababi
         Qrf1iv2BpJCwNrVbVF6aAwcgpz5+k0faun9aTIGtHIRdxWdrXlD+AYzlWz8xmENplzxz
         r3LvTB4/otqQiZKfIs87CH4lznWP8jivrX+zhf3T8kOXCPzUlrVt0j0+KEqL25MB1022
         ZCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688228456; x=1690820456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5O8JTAv4YKw7uBry2NnIZyVDnMiMWTmml9N1ztNufp0=;
        b=hBQRfuYPW02Tfo/gOuWAA69jktO6R0MuWFgpwhM3qecQnm9w9IR88ue2H32nw/KXBG
         3QcKPUPn3ydl8lrZuXHWvXC58a8O3weu135AMLD6ktwPCTJXeUuWLMVxX2bfAGimtQaO
         Ez6BH4+XICvr0LKINQegC+GpoeNm3O1bvIYCDrbUhXlWGEfLTQZC2RNztD66aHOZJhws
         LYls9WBuzYk2di7lY+5Ni+VtI7lkZwQaYJKex46hDyh+CgRmF3I86BFhXPBf7eQx91Y/
         +y+4FMX1Bi/wbJzJTWpBgHj2x/y17BPEeQYw92gMIkJFgYC/E8DfdBPVBslWEv3bBaOJ
         TVTw==
X-Gm-Message-State: ABy/qLYpvmVyA43bPWyQ1Ffo/HtW/7Sj/gMXjXTf50DQY4wFGvayc8Ek
        uMRHzxbC4IaFGSfXdekRIDw/qFGc3fw=
X-Google-Smtp-Source: APBJJlEkYzb4+ziqA6o0isUYA/IlAPGUGt5QLGTOuwq8cIvD/a7RCSRTrtqk5LiDl6HTuLay0SytTg==
X-Received: by 2002:a17:902:c406:b0:1b6:783d:9ba7 with SMTP id k6-20020a170902c40600b001b6783d9ba7mr8803589plk.27.1688228456021;
        Sat, 01 Jul 2023 09:20:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:ae1c:de46:682a:206])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902aa8400b001b7feed285csm10599352plr.36.2023.07.01.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 09:20:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH] drm/msm/a690: Remove revn and name
Date:   Sat,  1 Jul 2023 09:20:48 -0700
Message-ID: <20230701162048.6271-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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

These fields are deprecated.  But any userspace new enough to support
a690 also knows how to identify the GPU based on chip-id.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 --
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 3 ++-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ab5c446e4409..a537a3872f01 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2102,7 +2102,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	info = adreno_info(config->rev);
 
 	if (info && (info->revn == 650 || info->revn == 660 ||
-		     info->revn == 690 ||
+		     adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), info->rev) ||
 		     adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))
 		adreno_gpu->base.hw_apriv = true;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index e5a865024e94..ff9f5321f2e6 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -357,8 +357,6 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a640_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 9, 0, ANY_ID),
-		.revn = 690,
-		.name = "A690",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a690_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ac9c429ca07b..506001080374 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -274,7 +274,8 @@ static inline int adreno_is_a660(struct adreno_gpu *gpu)
 
 static inline int adreno_is_a690(struct adreno_gpu *gpu)
 {
-	return gpu->revn == 690;
+	/* The order of args is important here to handle ANY_ID correctly */
+	return adreno_cmp_rev(ADRENO_REV(6, 9, 0, ANY_ID), gpu->rev);
 };
 
 /* check for a615, a616, a618, a619 or any derivatives */
-- 
2.41.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558D574A5AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jul 2023 23:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjGFVLf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 17:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjGFVLD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 17:11:03 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08381BD2
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 14:11:02 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8b2b60731so5478685ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688677862; x=1691269862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2Rwgr6QwxnDtS6HyV0L0tAHznvzmmEQLZHqSK1brrI=;
        b=faQT1Vazrp4jLAmXd5ELV/chB0+/Nb84nj3pqLjbuXOrWAY0obaMTPFRyrpTdgwiHl
         NG5EXAhOUdGKydr/TwzH8oHPUeCcXC6enYGeuY3QnXbZhM68wwxvKwob0mjRWVGvIHhD
         Badi14FGo46KQkpJ3RQ06b/CULj+yJVcUQtRcO8WGGBb4N31Uil/z0pVTKEzPOPdPRuV
         QnhIs2gdn96ekMDPfLyHJtT05F+aYOwvqs0O9vi35siy6lxXFvbMZXl0HmKb6HWnmDM6
         Z3ou/8CWr4va06eaz7G1eYXga0xw0jxN2JAcnYAnPF5YiQ/JndYYPOwqkCXkxExR0G9x
         MqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677862; x=1691269862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2Rwgr6QwxnDtS6HyV0L0tAHznvzmmEQLZHqSK1brrI=;
        b=I5OjFrJFFDBnED5YSFuOZDnPebcQFuYPUAKEeNwH3oL0kIMP7PuykV1J68a+KNgmbc
         qrjsD4WYB8avTcM2JhM8C+bP33VpZElvKQtQSotkBTs5bEKDAqy6hi5B3pK9jN9s4l0l
         kWTV4uj/r6/KD1qzoU5RtgYrlcBHbmYWZdUAHjlKJPmZ2pPhgn4X2CJrSPCVyCWd41Tw
         6224hmjXOrOjUthCiokQfDXg1dtn4ewrCiLUWXBKT5OVpLtUI+OeCFdNs7yBgBMfaQ3T
         U0ZLnSfTHU52+eRQQoHJGKFzv4fbDmZ1VEjn7hXTGE0CMxr0sO8wAAk5V4i7uyHtqwt+
         54Gw==
X-Gm-Message-State: ABy/qLau3fweM/GkxS/LQIqdg6GmHnQvJzqI4iBzMPkkFKKBwhntKGWu
        iHKtUUEFZDrvOC23MNYU0po=
X-Google-Smtp-Source: APBJJlELnYsm5UJKAY2Zeoxp/pXc4lBNDhNskji4oUIWf7DCQQV4bL7xHFzKe3xg49QSCiLyyoeQqA==
X-Received: by 2002:a17:902:d902:b0:1b3:cf98:a20b with SMTP id c2-20020a170902d90200b001b3cf98a20bmr2082702plz.54.1688677862008;
        Thu, 06 Jul 2023 14:11:02 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b001b7fd27144dsm1842964plt.40.2023.07.06.14.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 14:11:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: [PATCH 01/12] drm/msm/adreno: Remove GPU name
Date:   Thu,  6 Jul 2023 14:10:34 -0700
Message-ID: <20230706211045.204925-2-robdclark@gmail.com>
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

No real need to have marketing names in the kernel.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 24 ----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 13 +++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 -
 3 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index ce8d0b2475bf..5eba0ae5c9a7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,7 +24,6 @@ static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
 		.revn  = 200,
-		.name  = "A200",
 		.fw = {
 			[ADRENO_FW_PM4] = "yamato_pm4.fw",
 			[ADRENO_FW_PFP] = "yamato_pfp.fw",
@@ -35,7 +34,6 @@ static const struct adreno_info gpulist[] = {
 	}, { /* a200 on i.mx51 has only 128kib gmem */
 		.rev   = ADRENO_REV(2, 0, 0, 1),
 		.revn  = 201,
-		.name  = "A200",
 		.fw = {
 			[ADRENO_FW_PM4] = "yamato_pm4.fw",
 			[ADRENO_FW_PFP] = "yamato_pfp.fw",
@@ -46,7 +44,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(2, 2, 0, ANY_ID),
 		.revn  = 220,
-		.name  = "A220",
 		.fw = {
 			[ADRENO_FW_PM4] = "leia_pm4_470.fw",
 			[ADRENO_FW_PFP] = "leia_pfp_470.fw",
@@ -57,7 +54,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(3, 0, 5, ANY_ID),
 		.revn  = 305,
-		.name  = "A305",
 		.fw = {
 			[ADRENO_FW_PM4] = "a300_pm4.fw",
 			[ADRENO_FW_PFP] = "a300_pfp.fw",
@@ -68,7 +64,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(3, 0, 6, 0),
 		.revn  = 307,        /* because a305c is revn==306 */
-		.name  = "A306",
 		.fw = {
 			[ADRENO_FW_PM4] = "a300_pm4.fw",
 			[ADRENO_FW_PFP] = "a300_pfp.fw",
@@ -79,7 +74,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(3, 2, ANY_ID, ANY_ID),
 		.revn  = 320,
-		.name  = "A320",
 		.fw = {
 			[ADRENO_FW_PM4] = "a300_pm4.fw",
 			[ADRENO_FW_PFP] = "a300_pfp.fw",
@@ -90,7 +84,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(3, 3, 0, ANY_ID),
 		.revn  = 330,
-		.name  = "A330",
 		.fw = {
 			[ADRENO_FW_PM4] = "a330_pm4.fw",
 			[ADRENO_FW_PFP] = "a330_pfp.fw",
@@ -101,7 +94,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(4, 0, 5, ANY_ID),
 		.revn  = 405,
-		.name  = "A405",
 		.fw = {
 			[ADRENO_FW_PM4] = "a420_pm4.fw",
 			[ADRENO_FW_PFP] = "a420_pfp.fw",
@@ -112,7 +104,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(4, 2, 0, ANY_ID),
 		.revn  = 420,
-		.name  = "A420",
 		.fw = {
 			[ADRENO_FW_PM4] = "a420_pm4.fw",
 			[ADRENO_FW_PFP] = "a420_pfp.fw",
@@ -123,7 +114,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(4, 3, 0, ANY_ID),
 		.revn  = 430,
-		.name  = "A430",
 		.fw = {
 			[ADRENO_FW_PM4] = "a420_pm4.fw",
 			[ADRENO_FW_PFP] = "a420_pfp.fw",
@@ -134,7 +124,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(5, 0, 6, ANY_ID),
 		.revn = 506,
-		.name = "A506",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -152,7 +141,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(5, 0, 8, ANY_ID),
 		.revn = 508,
-		.name = "A508",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -169,7 +157,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(5, 0, 9, ANY_ID),
 		.revn = 509,
-		.name = "A509",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -187,7 +174,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(5, 1, 0, ANY_ID),
 		.revn = 510,
-		.name = "A510",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -202,7 +188,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev   = ADRENO_REV(5, 1, 2, ANY_ID),
 		.revn = 512,
-		.name = "A512",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -219,7 +204,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(5, 3, 0, 2),
 		.revn = 530,
-		.name = "A530",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -238,7 +222,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(5, 4, 0, ANY_ID),
 		.revn = 540,
-		.name = "A540",
 		.fw = {
 			[ADRENO_FW_PM4] = "a530_pm4.fw",
 			[ADRENO_FW_PFP] = "a530_pfp.fw",
@@ -268,7 +251,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
 		.revn = 618,
-		.name = "A618",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
@@ -279,7 +261,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
-		.name = "A619",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
@@ -292,7 +273,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
-		.name = "A630",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
@@ -305,7 +285,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
 		.revn = 640,
-		.name = "A640",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
@@ -318,7 +297,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
-		.name = "A650",
 		.fw = {
 			[ADRENO_FW_SQE] = "a650_sqe.fw",
 			[ADRENO_FW_GMU] = "a650_gmu.bin",
@@ -332,7 +310,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
 		.revn = 660,
-		.name = "A660",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
@@ -357,7 +334,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 8, 0, ANY_ID),
 		.revn = 680,
-		.name = "A680",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5c5901d65950..e3cd9ff6ff1d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1105,14 +1105,11 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		speedbin = 0xffff;
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
 
-	gpu_name = adreno_gpu->info->name;
-	if (!gpu_name) {
-		gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
-				rev->core, rev->major, rev->minor,
-				rev->patchid);
-		if (!gpu_name)
-			return -ENOMEM;
-	}
+	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
+			rev->core, rev->major, rev->minor,
+			rev->patchid);
+	if (!gpu_name)
+		return -ENOMEM;
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cf45007400c8..6830c3776c2d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -61,7 +61,6 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
 struct adreno_info {
 	struct adreno_rev rev;
 	uint32_t revn;
-	const char *name;
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
 	u64 quirks;
-- 
2.41.0


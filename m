Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08332765DE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 23:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbjG0VWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 17:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbjG0VWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 17:22:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A4A10CB;
        Thu, 27 Jul 2023 14:22:42 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-55b5a3915f5so827286a12.0;
        Thu, 27 Jul 2023 14:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690492961; x=1691097761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UewGh9LKW89TdE00XXwcTXeHiWhdfYrkJoWhpa0ZANk=;
        b=O0IcYaTPHkNnvM0fnvbUxovzWJvd2W+AnTWNs8NMJ6BExBcWRCPEbU62NUSYwuJnGg
         9JOerHCklKo0agB/xZ9uSCQgjj65P1SjyvM32c45TVjmpWw78PCb0PHWx4rI/ItqzEj2
         xPHt/9bl9ExfTwVdIdqqZzRMXwHn5Qook1Oaj8bg58B4v/8czeH7PKwq8iBXPFiyZbRF
         ku4SVEhBqqaanIE5/HvDwTr3iBvg5VBs80DPqq8ZCMZBUmnntChsqmXPgRGnq8CQA3cG
         yHX0Hb/9MCxJ63Mb77z7qmHwFsFlZmLNKflhB+uTaMZCXo4cZ+Ou0T8WLtR5S7cr/Wub
         5DZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690492961; x=1691097761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UewGh9LKW89TdE00XXwcTXeHiWhdfYrkJoWhpa0ZANk=;
        b=horrgKjEoof2vHyGSWCflIPosEwIjR1Sq1n9hkVFX/l0C96jVSreJdrkesQdPMsr9p
         cXrSuLZXxAyrMJZCm7JT3D1tzvXTniOVjKsaEH/63UaILh9I7e32wIEPBndcYgYeaqZ5
         Ar7srXqrd3BeXmLyhZ4tS8vzsxzSRz7GtQETPq1KFiw59fzcb+jvtIPbAcheOPgn49UU
         RWMQJUsrlzR3vtTdDjna0BuBkKo69BZRjiYP+XHSG340dclCG7t9AcygoA4fFq+TK8DL
         RvBPehW1K9xftcJsRS89mYOIudsTds+13cZLyrGUlpU4hCX1751kPyB9Pf0RxSzyJbvg
         iAFg==
X-Gm-Message-State: ABy/qLYVq+js9T+WEUbPA/BhzkzBK8jEgFhr7CgZbnAM+ocr7X43LTmW
        OstGo39e9rIhw9EMPUQk2og=
X-Google-Smtp-Source: APBJJlG0OstN/eWueCdI0VCXlM2r2ClQvzKOo4ZoisA5yFjYrklqM2mNPJ9btiQQJxzR+bw9X9hMSA==
X-Received: by 2002:a17:903:181:b0:1b8:7625:3042 with SMTP id z1-20020a170903018100b001b876253042mr627355plg.10.1690492961518;
        Thu, 27 Jul 2023 14:22:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b0019ee045a2b3sm2064466plf.308.2023.07.27.14.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:22:40 -0700 (PDT)
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 01/13] drm/msm/adreno: Remove GPU name
Date:   Thu, 27 Jul 2023 14:20:06 -0700
Message-ID: <20230727212208.102501-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212208.102501-1-robdclark@gmail.com>
References: <20230727212208.102501-1-robdclark@gmail.com>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 25 ----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 13 +++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 -
 3 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index ce8d0b2475bf..326912284a95 100644
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
@@ -256,7 +239,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 1, 0, ANY_ID),
 		.revn = 610,
-		.name = "A610",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 		},
@@ -268,7 +250,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 1, 8, ANY_ID),
 		.revn = 618,
-		.name = "A618",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
@@ -279,7 +260,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
 		.revn = 619,
-		.name = "A619",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a619_gmu.bin",
@@ -292,7 +272,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 3, 0, ANY_ID),
 		.revn = 630,
-		.name = "A630",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a630_gmu.bin",
@@ -305,7 +284,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 4, 0, ANY_ID),
 		.revn = 640,
-		.name = "A640",
 		.fw = {
 			[ADRENO_FW_SQE] = "a630_sqe.fw",
 			[ADRENO_FW_GMU] = "a640_gmu.bin",
@@ -318,7 +296,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 5, 0, ANY_ID),
 		.revn = 650,
-		.name = "A650",
 		.fw = {
 			[ADRENO_FW_SQE] = "a650_sqe.fw",
 			[ADRENO_FW_GMU] = "a650_gmu.bin",
@@ -332,7 +309,6 @@ static const struct adreno_info gpulist[] = {
 	}, {
 		.rev = ADRENO_REV(6, 6, 0, ANY_ID),
 		.revn = 660,
-		.name = "A660",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
@@ -357,7 +333,6 @@ static const struct adreno_info gpulist[] = {
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


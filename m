Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E125E65AA80
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jan 2023 16:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjAAP56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 10:57:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjAAP56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 10:57:58 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F48CC3
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 07:57:56 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id x11so2633049ljh.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmK50Derhy8DG3OEtg+Hdtx1MePNgHpvvawb/+qSrcA=;
        b=vv+CroYTfi4XhaSiDivLJutNM/bh6h4ubCFIUTFFCDONFWDUezkNerULBB1QsCkNV1
         uwZ98sRzTY0FRQZgNCy0GztcgDlPnnBzAv1oCwXEVCuSBZ6duc+eMbMdto9/0qD2ZJ+s
         n+orpr8FeOdZgahdIcbdRvENj55iiUQBccj/uGmma2/UipHijhtsBcPQr9QMGngGyvr5
         UPE+uXJNigD0eC3Y+AewlkVTEdFon5FwD2wau/qfAOnnIJuMo/vWNdIkHfyh+ZmHdECp
         NXxzyjympdl+Jxu5a0LZHQHv+LvHj3L8uFhZoF5fIWqjvqbXAJBADeDNaJ0mjBWbwArB
         NFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmK50Derhy8DG3OEtg+Hdtx1MePNgHpvvawb/+qSrcA=;
        b=DfGClWvUYmAYJgPHqiKGsI/dySDmXwPyKb2BqIZhxwBBcFRBRb4a8pKLG6P9oTsRHZ
         VtWRSfzihHmYMcmbRk00iNNdf2qnSi+OX8Zj0DfxSlkuBBGiwmkGR7hXnTAjBRqa0BnZ
         1ogOBzrY2l1AIb3wH/PfUtcpHrubthO62Fd57YKdE9OV6B3kve2iIDy6PvhhnQvUrQSC
         Yf2vy6cuGY75yBhYWkWq/mn2OmUZRXL2gKANvuQrs7CD9cIrbHo5IxmPoB+TI1Cu8hfq
         ZhwLB/DIuNxW7npkFTnZxVU5gwTh33f0gzAXAFTWjnqHZCCgpL8zCogirbiYy21XBFP3
         hEuw==
X-Gm-Message-State: AFqh2kompn78rmD6Vit6rqR98uln5dGYwz7g5rSGBX9yK2kuCs/75flb
        n9Rsyj7Ak0KzXnh0LyTElX2P3w==
X-Google-Smtp-Source: AMrXdXstXPRodKuCWK+cyMtVFd6+Xv8DqjKIHZuh2IreSxkwjxM8YPz/l6FoN7QDz69VYozWeeOwBQ==
X-Received: by 2002:a05:651c:1c9:b0:279:fc43:e704 with SMTP id d9-20020a05651c01c900b00279fc43e704mr11653099ljn.47.1672588674859;
        Sun, 01 Jan 2023 07:57:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a17-20020a05651c031100b0027738fd1eb6sm3107821ljp.110.2023.01.01.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 07:57:54 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
Date:   Sun,  1 Jan 2023 17:57:53 +0200
Message-Id: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support loading A200 firmware generated from the iMX firmware header
files. The firmware lacks protection support, however it allows GPU to
function properly while using the firmware files with clear license
which allows redistribution.

Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 27 +++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 6c9a747eb4ad..c67089a7ebc1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -53,6 +53,8 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 static bool a2xx_me_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->rb[0];
 
 	OUT_PKT3(ring, CP_ME_INIT, 18);
@@ -84,15 +86,20 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 	/* NQ and External Memory Swap */
 	OUT_RING(ring, 0x00000000);
 	/* protected mode error checking (0x1f2 is REG_AXXX_CP_INT_CNTL) */
-	OUT_RING(ring, 0x200001f2);
+	if (a2xx_gpu->protection_disabled)
+		OUT_RING(ring, 0x00000000);
+	else
+		OUT_RING(ring, 0x200001f2);
 	/* Disable header dumping and Header dump address */
 	OUT_RING(ring, 0x00000000);
 	/* Header dump size */
 	OUT_RING(ring, 0x00000000);
 
-	/* enable protected mode */
-	OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
-	OUT_RING(ring, 1);
+	if (!a2xx_gpu->protection_disabled) {
+		/* enable protected mode */
+		OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
+		OUT_RING(ring, 1);
+	}
 
 	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
 	return a2xx_idle(gpu);
@@ -101,6 +108,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 static int a2xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
 	dma_addr_t pt_base, tran_error;
 	uint32_t *ptr, len;
 	int i, ret;
@@ -221,6 +229,17 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
 	DBG("loading PM4 ucode version: %x", ptr[1]);
 
+	/*
+	 * New firmware files seem to have GPU and firmware version in this
+	 * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
+	 * Older firmware files, which lack protection support, have 0 instead.
+	 */
+	if (ptr[1] == 0) {
+		dev_warn(gpu->dev->dev,
+			 "Legacy firmware detected, disabling protection support\n");
+		a2xx_gpu->protection_disabled = true;
+	}
+
 	gpu_write(gpu, REG_AXXX_CP_DEBUG,
 			AXXX_CP_DEBUG_MIU_128BIT_WRITE_ENABLE);
 	gpu_write(gpu, REG_AXXX_CP_ME_RAM_WADDR, 0);
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 02fba2cb8932..161a075f94af 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -15,6 +15,7 @@
 struct a2xx_gpu {
 	struct adreno_gpu base;
 	bool pm_enabled;
+	bool protection_disabled;
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
-- 
2.39.0


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCDE96F2BC5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 02:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232259AbjD3X7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 19:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbjD3X5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 19:57:39 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC3D1BC
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:38 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f00d41df22so20071890e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682899057; x=1685491057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGmFxFh/X4UXJV1G/EJTcl28FnvhXByAtzs1tNbxevg=;
        b=ZEkbahwH2+Z8EYsp20gQL5OuS8WNNFwalIwk0PjfdSe4ytIIAZ3mmkBxUKunibziSB
         sQnxBNrF+2vW/nAprTUeqnHEEq8285sZLlesdVgqtmtC4cIl2jzIIfmSnR3HwjQOP87U
         bpHdp55Vk7VxOe20eHIXU9frcNsNyQ2/H7XY667xbaPIwUire2WFohTw8McJbt3JNx8A
         nOti9/svJfcgVcWmU4oVZ++N4flSIsJQabpHG8QiQGBiZ3EGr7zM4dhAiQPtxK0tVaej
         Kim6OCn7UiDTz9xwhi8FzkzLcuCgssGSnqgYewKziP+hheidYZyzM4BXyQQhowWPpd44
         uFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682899057; x=1685491057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGmFxFh/X4UXJV1G/EJTcl28FnvhXByAtzs1tNbxevg=;
        b=AepbQ2nMY0aRX5X6UfVOho32Rue+iNUV8GhtFhvLIvDFBhedOktdOz4LV3wbVDGN+P
         8wJb/VVmBv+AhKL8zqPVmYvTBe+FnWmQhFo0myjisMhqGc2BNOohmahT2Nc/0f2tRpKp
         wd32P4+uOw6HzXEyxKBVToX/PJmBCpZwRLgLh0UK8E+m+wbaSbhWFKCJcNoIILT70NDO
         p2xn5Jh8AQn3yMWnO5Big06JfBzo/UCAuHjHTNwy35zFxvDypP9bvAwcBtr+mjIAVHQU
         WZm2jtHJKA0JADn4ZfJAOMX8081riHhPpwUGRgG4m4JXeuijCyosq6ejmI0BtullHZju
         9TQA==
X-Gm-Message-State: AC+VfDx5UHP12kzOUyCvakUkuM8hK0q2bindKN9nSeyb2dyQa158lDEo
        9J0fSHMLNPi96AVdg7tAoGHwhA==
X-Google-Smtp-Source: ACHHUZ5q43gHQT9vO8NS2QC1Evk16o03p2SzASt2VZDvV5BtajmsgOBqvYIdO/fZyvWW519Aw/JoZQ==
X-Received: by 2002:a05:6512:ea7:b0:4ec:8cc6:55d9 with SMTP id bi39-20020a0565120ea700b004ec8cc655d9mr4589920lfb.9.1682899057039;
        Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 16:57:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/7] drm/msm/dpu: inline dpu_encoder_get_wb()
Date:   Mon,  1 May 2023 02:57:30 +0300
Message-Id: <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The function dpu_encoder_get_wb() returns controller_id if the
corresponding WB is present in the catalog. We can inline this function
and rely on dpu_rm_get_wb() returning NULL for indices for which the
WB is not present on the device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4c85cbb030e4..507ff3f88c67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1277,22 +1277,6 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 	return INTF_MAX;
 }
 
-static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
-		enum dpu_intf_type type, u32 controller_id)
-{
-	int i = 0;
-
-	if (type != INTF_WB)
-		return WB_MAX;
-
-	for (i = 0; i < catalog->wb_count; i++) {
-		if (catalog->wb[i].id == controller_id)
-			return catalog->wb[i].id;
-	}
-
-	return WB_MAX;
-}
-
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
@@ -2261,7 +2245,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
 		enum dpu_intf intf_idx;
-		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2279,14 +2262,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 							    disp_info->intf_type,
 							    controller_id);
 
-		wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
-				disp_info->intf_type, controller_id);
-
 		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
 			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
 
-		if (wb_idx >= WB_0 && wb_idx < WB_MAX)
-			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
+		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
+			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
 
 		if (!phys_params.hw_intf && !phys_params.hw_wb) {
 			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
-- 
2.39.2


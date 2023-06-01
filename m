Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADC2F71F098
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbjFARWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjFARWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:44 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9BB192
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:43 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so1485564e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640161; x=1688232161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=450NBYRPZCkDMf6z2AkwtQg7LVui5Bkqgsm1KMB42+U=;
        b=rkRrnqsnrYvWAkuZ1l+aaUwrIqV2UFIXmmxqX9twEeu5yy0aNQy6zT+WJsF83iX09A
         zRIbIXxrc2ge8Zc+b6EF1HIxIOMSA249SZW8jvCjctJkfRu3y+1IILC/GZGTG3ghcQ1E
         cIzkDHvdUDKWXq/5XY9/LUQGyHHMotQZfZW0RPzOgNS7u6EjgESAo3Dpzyz51fG7Vkrn
         biNMsQkbhzXpeX/GBYCW7c3lRmsuVQn1AYHi+22FcMSZ3iX5dZffURmH/IuPXAQO6pcI
         gnbErRURCym8K7HST53wUpseXP3ot5ZQ/Fwf4FhchTOzv7jeOjjP54z2gHbR+W2IGuJF
         P8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640161; x=1688232161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=450NBYRPZCkDMf6z2AkwtQg7LVui5Bkqgsm1KMB42+U=;
        b=NGDSN3dfkN8I4yr4ClArS4RUpSLJ2xHFip1MVoOBTebFQr8RJUJ/5F66jAn3cmQqPR
         eFkaZL87zVT6XZWfs6HZOtkKmCM7KruYdsvpWwTWTHJeMzWMYMa1ZoaSZkKYsNl3+F4i
         QYlYGnQnbePtV4/KIVXlNK44rYA4QMDdffQTnFK2+aZjKl/lCTgUc0AEHaKLwSlQRmh8
         fwK/dUgLudeiD7njswia56eGucUDYKeejYbazKSjf3oh38fYzlaKA2kqpgQpglPaV44m
         R0a20RvTYHL4u+7RY+vaGJhmv0eFALsqKY6Zl56Dh7kEHdyON0z2rajbPJdgCQXg0kZC
         RBcQ==
X-Gm-Message-State: AC+VfDyJNoURit8mxVYNDCbOfQFeUmMOAUnQkRsO0bvr0doulO+ELpXt
        zslS4svtsLJ+ppteDQghJD0M1w==
X-Google-Smtp-Source: ACHHUZ5PmpHHoQ4cHqA/bn8J8aHy/r99oaHVgROXYndnTBiyI4/eaaIxZmGvXf0k9bPCjQjrgKqp1w==
X-Received: by 2002:a19:ac43:0:b0:4f3:8c0d:41c4 with SMTP id r3-20020a19ac43000000b004f38c0d41c4mr428486lfc.30.1685640161391;
        Thu, 01 Jun 2023 10:22:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:40 -0700 (PDT)
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
Subject: [PATCH v3 4/7] drm/msm/dpu: inline dpu_encoder_get_wb()
Date:   Thu,  1 Jun 2023 20:22:33 +0300
Message-Id: <20230601172236.564445-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0b9f1b3c6c11..94432451e175 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1288,22 +1288,6 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
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
@@ -2279,7 +2263,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
 		enum dpu_intf intf_idx;
-		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2297,14 +2280,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFC651E6C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 13:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446312AbiEGMDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 08:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446308AbiEGMDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 08:03:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B434832D
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 04:59:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b18so16527705lfv.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71+fcv8KnRRz4CuqYuY+NOVmoaQwb5cZ/U5LdVWh7tM=;
        b=n+rNKj/VaY5MM0sGyHUQJc3L0k9VjSBfjX3fHluOgmtXWvXdWQXaSX6yLmkUUDHzds
         Wo6aLL/R8X8lv5rDJUWrKwO0nZxgEK+iwo6alutGariALUk9YhkGLfBcoRATi1zGzCgB
         eCjmXwI+HVWdgZ6TqcF9m2LKTLD9z1JtIcJCVXL966+KjbAjisfZO7grad5wgOFwsZ8V
         mMgdSdopZPUphNGTPb9xG1rA9aDSeyLRqkfo/dajP4iNRmxqEsW2TcuRrzPTDoYep2SN
         scqmZfJJQS5r2hRT8lcIEYoMi25Z2n+f1tWqWOhGv7nfkQiVH1thBFTasrLdyG4l0Q+T
         219g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71+fcv8KnRRz4CuqYuY+NOVmoaQwb5cZ/U5LdVWh7tM=;
        b=yv4oqoT/TxAbH7P4v2xOjrmB8OB1TEAzhJ1T9Q0WY9aKt9wcwgEZ+2zgQ/k2OGe373
         jJWe1q66hMQ8uFZizPjSBzjK5LVDKbiN+QnLP2bMreq+oInpOHZJvcDTK5CzHeWLJGbY
         Omz9QDEZGryT3x7Vv5b42WIsLB1VFPYt/t8pd0lqg5//xwfFGFOckzlrBTqylV4BZhQS
         /tgb0iIwcyG7lwjaK9veYM/4tdTuCyemGQtQZ+zAcyVbfgrfoHfGhKFkBjJ0nc+kAigF
         r58gZp+m7kgf/Idv2/xp06MmrGuYJDROmbGLjrBz34F++9FJ0A6+2DM8I4E9UCYC6Yi0
         L5Dg==
X-Gm-Message-State: AOAM532soWoShouprufru877BZNfhA50WdxgBwtC+3Jlmolg1UTagHox
        GU8Z3OBsp2eL3ecrjdcclITukg==
X-Google-Smtp-Source: ABdhPJyONaIbERmZr+B2RapCSr7d8hvEZej6e1O9rIrrCtHkWpZ+eP62baG228pimeIkFEF+zzbdNQ==
X-Received: by 2002:a05:6512:12c9:b0:473:c33e:a65b with SMTP id p9-20020a05651212c900b00473c33ea65bmr6301435lfg.285.1651924784990;
        Sat, 07 May 2022 04:59:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
        by smtp.gmail.com with ESMTPSA id f3-20020ac251a3000000b0047255d211b5sm1083738lfk.228.2022.05.07.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:59:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys backends
Date:   Sat,  7 May 2022 14:59:41 +0300
Message-Id: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The functions dpu_encoder_phys_foo_init() can not return NULL. Replace
corresponding IS_ERR_OR_NULL() checks with just IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb20cb8..07de0c0506d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2144,10 +2144,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
 		enc = dpu_encoder_phys_vid_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2157,10 +2157,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
 		enc = dpu_encoder_phys_cmd_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
 				PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
@@ -2170,10 +2170,10 @@ static int dpu_encoder_virt_add_phys_encs(
 	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
 		enc = dpu_encoder_phys_wb_init(params);
 
-		if (IS_ERR_OR_NULL(enc)) {
+		if (IS_ERR(enc)) {
 			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
 					PTR_ERR(enc));
-			return enc == NULL ? -EINVAL : PTR_ERR(enc);
+			return PTR_ERR(enc);
 		}
 
 		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
-- 
2.35.1


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1587A74B7F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 22:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjGGUhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 16:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbjGGUhe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 16:37:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292DB1994
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 13:37:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fbcbf4375dso2706671e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 13:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688762251; x=1691354251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFmZg+tjTe+4jTb+P0rWJrYvxzGotzLYFQ/DUJjm54E=;
        b=JfJgoFCMtkqbDsYIbRHU69aIoh76wqHyVzdccSJhZ0phTbsRAageFatCDksxYihx/j
         rQHn1NLnMWZdXAimmXPUI8JqjTsi3zC37c+evBjcNE+FigNvex2rK7BSW4nsISoglfWR
         +OjCNuGTFI00z306OQHepMTKeKmzrq/OdDMQqavMx7EKMSEQuFOwDQ+2lR5yO0Uzsrr4
         DQ7wYOvgRQPwf5uaQkoDFc8L5vRIFS52HcTMzB5rAvtk1aCy1DMOsg2vr2Iz6N9ipYYP
         BABL8cBeRH2RBdrjbdzGyPGGXIGwzu0Pe/E7m1yd4ACTGGG90uu6auDWhDAAQBaani4j
         nwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762251; x=1691354251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFmZg+tjTe+4jTb+P0rWJrYvxzGotzLYFQ/DUJjm54E=;
        b=aEGillnZ06zxCD2SMODw1SfTx7ifVQYM9GqmmeqIHFhccW/pZuE9AVNGgPRBNr3gZK
         w97nqQwYwI0gft+xjIzoVo3rsdPtDyMxHV/f3akx/GJpI0C+BHwYy7i5dlQpZfNNxEZl
         /wLnWgC/UKRCTiptrmgneqcZ8eWpfQS90JHqjFGoyYDBRo5OkFkzm/V2QEvAPjSrt+7u
         cH2FfwfmI4BOhQ3IfRFn5fmA9h7nZWDRWybOEp7BmPVCyeNzYCNEgeES75EsVt/cQ11K
         T+jMqrB/YKH7R+PNJQJ7PqngTL8fhKKpOst4pbbrFWxuiLROoMiBpWF0qWEkwOcUPTnv
         Y+sA==
X-Gm-Message-State: ABy/qLZEkcnLBZFRJ1j7jBVzu/g7VnF0Bss8hkXovEj0JqoSevoyA5+l
        Mlw9FtZNzpOStDI00Y6pxgTQ5A==
X-Google-Smtp-Source: APBJJlENczAVIfA9ZsBwb+b9K32V3dXL4Gsilx7jVIqHBfa/y0AvTvlQCrDgD8LlyLVBHZHrODMS6Q==
X-Received: by 2002:ac2:4ec7:0:b0:4f8:6e1a:f3ac with SMTP id p7-20020ac24ec7000000b004f86e1af3acmr2150171lfr.28.1688762251554;
        Fri, 07 Jul 2023 13:37:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 13:37:31 -0700 (PDT)
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
Subject: [PATCH 10/13] drm/msm/dpu: use drmm-managed allocation for dpu_crtc
Date:   Fri,  7 Jul 2023 23:37:21 +0300
Message-Id: <20230707203724.3820757-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change struct dpu_crtc allocation to use drmm_crtc_alloc_with_planes().
This removes the need to perform any actions on CRTC destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 214229d11e3e..23a944e15109 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -51,17 +51,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void dpu_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	if (!crtc)
-		return;
-
-	drm_crtc_cleanup(crtc);
-	kfree(dpu_crtc);
-}
-
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1433,7 +1422,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = dpu_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
@@ -1467,7 +1455,11 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct dpu_crtc *dpu_crtc = NULL;
 	int i, ret;
 
-	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
+	dpu_crtc = drmm_crtc_alloc_with_planes(dev, struct dpu_crtc, base,
+					       plane, cursor,
+					       &dpu_crtc_funcs,
+					       NULL);
+
 	if (!dpu_crtc)
 		return ERR_PTR(-ENOMEM);
 
@@ -1489,9 +1481,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				dpu_crtc_frame_event_work);
 	}
 
-	drm_crtc_init_with_planes(dev, crtc, plane, cursor, &dpu_crtc_funcs,
-				NULL);
-
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
 	if (dpu_kms->catalog->dspp_count)
-- 
2.39.2


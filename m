Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3B8B4B9741
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbiBQDyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiBQDyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:17 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A302A229F
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:04 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id c15so6329138ljf.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0kyxRMMBG2gpm69Eogx/Pqcstxzhu1JTR7Us2wGmBvY=;
        b=fKV36McY3ySvJQwBRVQSuXKAstnJZQcBQRIuW05OzVCs7WnOqmkmKW4/+PbXwA18n/
         HiuJIUpyCQW87rPyh8GbIiZpfpNgXJtXBehB3MufCtb4XiQqriewEYgZXXQuKpOXq0gP
         9FFOSnSZBCb19/h5skw6QKaT8ZtdyS4Coywy7gs+htHnrsOH+YKvTHzX04ANp+I4VCcl
         vbDysr3lHt8QGupfuz5WMrMRosE0J/gLlpuKXIfMAAK+xR44Uu3pxeMKixTzm/0t78cK
         N1Kok1Zldl0FNTr4ABFP6TNhYuSUQj7BhdIaGW3HB66VgNZer7Gi1RLFzm9PIScrKeBB
         ORtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0kyxRMMBG2gpm69Eogx/Pqcstxzhu1JTR7Us2wGmBvY=;
        b=U+D+4s1lM1SOF+UCG4EF7Pyheer5dzUbREaw2Uw1WebqXIpTSwpL35IuS58eNuyB8I
         DBsqOqU6Rg+ZBZ8hxq9P9EOOUzHIfU/zRFES8vHSks+EUiUVN13LN9S5i/CW7W/Lqjoy
         OdBIB6FXC1ry3POKHPAbMVEiFmKAGkd0hu5UVDJ/rNkBiFVMFYmsMr9pE94Uog9zKJPy
         o2001nu07DFiQNqhp4MXbowNfCANwAajhvh84QefEEtc5z6w9rC+bK4Zxlz6Dd9nil/4
         RQ1Fki5o6cMA6rcBmc34gydKakXxUhMQwsH5ehL6K9zO49TJ8itQSp4dsWYO1ibMKnMT
         Bldw==
X-Gm-Message-State: AOAM531REIAaELM/59gfmeveAosaLumSJKU3ohtJGT33jOraMWMuRSMX
        vBVXNPNnWaLzatAweR/5FNVzLw==
X-Google-Smtp-Source: ABdhPJwjg6TalywIhRqRrSyVrQ9fIteRP0SsmFbcNLffktdUAwVe97wMS+C2UjwtwQCFO5vOAG1Psg==
X-Received: by 2002:a05:651c:1547:b0:244:8a9b:d0a1 with SMTP id y7-20020a05651c154700b002448a9bd0a1mr882457ljp.53.1645070042135;
        Wed, 16 Feb 2022 19:54:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm: move struct msm_display_info to dpu driver
Date:   Thu, 17 Feb 2022 06:53:53 +0300
Message-Id: <20220217035358.465904-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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

The msm_display_info structure is not used by the rest of msm driver, so
move it into the dpu1 (dpu_encoder.h to be precise).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..ebe3944355bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -34,6 +34,24 @@ struct dpu_encoder_hw_resources {
 void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
 				  struct dpu_encoder_hw_resources *hw_res);
 
+/**
+ * struct msm_display_info - defines display properties
+ * @intf_type:          DRM_MODE_ENCODER_ type
+ * @capabilities:       Bitmask of display flags
+ * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
+ * @h_tile_instance:    Controller instance used per tile. Number of elements is
+ *                      based on num_of_h_tiles
+ * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
+ *				 used instead of panel TE in cmd mode panels
+ */
+struct msm_display_info {
+	int intf_type;
+	uint32_t capabilities;
+	uint32_t num_of_h_tiles;
+	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
+	bool is_te_using_watchdog_timer;
+};
+
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index d7574e6bd4e4..16f9e25ee19e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -109,24 +109,6 @@ struct msm_display_topology {
 	u32 num_dspp;
 };
 
-/**
- * struct msm_display_info - defines display properties
- * @intf_type:          DRM_MODE_ENCODER_ type
- * @capabilities:       Bitmask of display flags
- * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
- * @h_tile_instance:    Controller instance used per tile. Number of elements is
- *                      based on num_of_h_tiles
- * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
- */
-struct msm_display_info {
-	int intf_type;
-	uint32_t capabilities;
-	uint32_t num_of_h_tiles;
-	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
-	bool is_te_using_watchdog_timer;
-};
-
 /* Commit/Event thread specific structure */
 struct msm_drm_thread {
 	struct drm_device *dev;
-- 
2.34.1


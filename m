Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D60E6E32DB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Apr 2023 19:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjDORTd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Apr 2023 13:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDORTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Apr 2023 13:19:32 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE95F268B
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 10:19:30 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2a8a6602171so4395981fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681579169; x=1684171169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djjH6l6gWHD/7tLVc7hCppYHxE7ISqbQiXi67Zk2lWc=;
        b=WyfTEnceCWvXAOA4xmBaowOmv8LLibekgh39seiVGdn6NkGaqnNvUiL/YWkw9RwfmI
         4FXzZgUF84y8sqdMOGa9KQfswxsvZQnGRuxDZMgSw/HSzi/+hUqOKiMgk8RJlHI/iHIT
         0hM3hJYSWR9loOoK1s183qrW7mHUNOGaCVow++2puylaOIXNfZTTjvzB4atKGZVrQBB9
         1qR7d9eUa6QbnTLtnB7WZurEGmT2eoHB/bA76BB7H3eOWLkbvD73qgcT673Tixn9WLib
         soWmAEbSrzu8KVXhu3RlEWn45CrLF7WTWZtU+0S9tJaKF40A4BZYXsgyG0iw0xXdQnRa
         yiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681579169; x=1684171169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djjH6l6gWHD/7tLVc7hCppYHxE7ISqbQiXi67Zk2lWc=;
        b=I90yU5zcQ65K7Cf18SflTr3IwQ9gZwzuKrFaVSG9NvKWnNQAd5b+f8ofhN0OVlsLir
         2KQbCXI2Z21rHvvH1bcVvdDuvji3dbkb76SRoPUCZP4vyopzjQMJ/LtDLRcVuj8ZHnd2
         uGxeKt1C1jOo4r4F9OJzpEr7lPZ+Gsji9uQDPLAgtM87zP+EVdH+B6PFLN5T/opDEKZf
         Es36kAbcBzOyhc4M44Rf9s99MZrFHff+e2VN9aO4s5+tmbKm1WCcti3fBONCmmLniyWO
         mcV6RUApUu/hc02P+/Z+D34eAbG7t1U/3gB6uhJNI5qBaXB+/Ic/VFEZmkA+1HfMfyUW
         Y9AQ==
X-Gm-Message-State: AAQBX9cMpppYgSYTfjI0PlnY6atTcirU15nX5Sxqas3qko6yYjAM4Hvs
        5UtG9LMSupAEWwLTTH7TtrNJDQ==
X-Google-Smtp-Source: AKy350YABuA42xlTHmFtNWFpe1wFIwkJlIlQ5Vkfr1Wo5Ylmhiy0/D/7i280gsoBPLyqRSxIWMF4Bg==
X-Received: by 2002:ac2:4186:0:b0:4dd:ac8d:671f with SMTP id z6-20020ac24186000000b004ddac8d671fmr688379lfh.34.1681579169145;
        Sat, 15 Apr 2023 10:19:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512096400b004ebae99cc1dsm1355834lft.159.2023.04.15.10.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 10:19:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dpu: add HDMI output support
Date:   Sat, 15 Apr 2023 20:19:26 +0300
Message-Id: <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MSM8998 and the older Qualcomm platforms support HDMI outputs. Now as
DPU encoder is ready, add support for using INTF_HDMI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 45 +++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e85e3721d2c7..65cce59163a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -617,6 +617,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	return 0;
 }
 
+static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
+				    struct msm_drm_private *priv,
+				    struct dpu_kms *dpu_kms)
+{
+	struct drm_encoder *encoder = NULL;
+	struct msm_display_info info;
+	int rc;
+	int i;
+
+	if (!priv->hdmi)
+		return 0;
+
+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
+	if (IS_ERR(encoder)) {
+		DPU_ERROR("encoder init failed for HDMI display\n");
+		return PTR_ERR(encoder);
+	}
+
+	memset(&info, 0, sizeof(info));
+	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+	if (rc) {
+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
+		drm_encoder_cleanup(encoder);
+		return rc;
+	}
+
+	info.num_of_h_tiles = 1;
+	info.h_tile_instance[0] = i;
+	info.intf_type = INTF_HDMI;
+	rc = dpu_encoder_setup(dev, encoder, &info);
+	if (rc) {
+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
+			  encoder->base.id, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
 		const u32 *wb_formats, int n_formats)
@@ -683,6 +722,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
+	rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
+	if (rc) {
+		DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
+		return rc;
+	}
+
 	/* Since WB isn't a driver check the catalog before initializing */
 	if (dpu_kms->catalog->wb_count) {
 		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
-- 
2.30.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 417A54F5F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 15:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbiDFNYd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 09:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbiDFNWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 09:22:40 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA6163E01A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 03:13:33 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t25so3216597lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FE6MvnURSjfbK37LkPPxzBMps2ILsbNccb9PZm35uUY=;
        b=mpoYhMKZ+o4x4KT+byOPfYhZac7KhjkQPEfuSQgQLMrp4BXVDSdhwoDZbRyuIKBiXA
         8vxtDwuqaIapUeN9hetIBliDwIKMMf2SuMVszUPcjznPb7gZalGUHd0NjXiKHKEmBNU+
         aI2zQHqsz6ncGQKEGhtj707cooPbPZVg6RpXFVOB6+O8/tbmYy9js82/io5oG2z6KeEH
         LTmpDoo8L9K6jYtto7OmJNr8qp5+lUbjUKktnBH9NxYkjjmLnEwc0z3Z2jgZ4KBChgau
         jSIepOBbGLiM2/dwxiwHdhusqqbGPXL0I9+DBsX3KaK1Qt/C1W4XLoCUhlkyIkLtBHWH
         OB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FE6MvnURSjfbK37LkPPxzBMps2ILsbNccb9PZm35uUY=;
        b=Zdjsvr7JcgNObodcMebGk5kAG3mxGSdJYvSuVSdfh2hUmwu41acRN6ohwspI8U+d4b
         UzukrHZ7cJvnWxloAV2H/Xft9sl3YUo0RJAKu5t73XdhRQ7ytMLEW41U7n9J7B+MIp5V
         ZlIoB5qpmSF2WxBg4mmaBZhbTA6wCQ3lWxH200y5DNNGapFAxP4RiiE9gSDGml6CJZ4E
         J6iY2ja5sF9PFPSMWUxqcZr45ERKwFEasNQQ3vl4tkH+eTQb60dY8jbTfwo7b8lMR+WV
         Wo45Fdi7K2AthrgxnKj2liKPgAU2Uj1FZAJ8QN19y5SQ5iPMR9m0bZmEUFNxwagIP9dL
         RMag==
X-Gm-Message-State: AOAM533S3eM3qufF0K/K0Drm0cXLydptmxMvvipdsDyKJ2VfGlK8PhvG
        kv141Uo8jNxjRpHXdlAJ41yRnw==
X-Google-Smtp-Source: ABdhPJxewWHmM56gH2X7UlQdsdnqP32bRtqY3BkZHZiecYcUmIlsIwToxFqKqokI9ghZwYyWJhYGoQ==
X-Received: by 2002:a05:6512:555:b0:44a:a75c:885c with SMTP id h21-20020a056512055500b0044aa75c885cmr5507568lfl.80.1649239971136;
        Wed, 06 Apr 2022 03:12:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i4-20020a056512340400b0044a310f72f6sm1782154lfr.250.2022.04.06.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 03:12:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm: loop over encoders using drm_for_each_encoder()
Date:   Wed,  6 Apr 2022 13:12:46 +0300
Message-Id: <20220406101247.483649-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
References: <20220406101247.483649-1-dmitry.baryshkov@linaro.org>
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

Rather than manually looping over encoders array, use standard
drm_for_each_encoder() macro.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 5 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 6 ++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d0525a9ea92b..0bc33243dae8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -681,6 +681,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	struct drm_plane *primary_planes[MAX_PLANES], *plane;
 	struct drm_plane *cursor_planes[MAX_PLANES] = { NULL };
 	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
 
 	struct msm_drm_private *priv;
 	struct dpu_mdss_cfg *catalog;
@@ -745,8 +746,8 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	}
 
 	/* All CRTCs are compatible with all encoders */
-	for (i = 0; i < priv->num_encoders; i++)
-		priv->encoders[i]->possible_crtcs = (1 << priv->num_crtcs) - 1;
+	drm_for_each_encoder(encoder, dev)
+		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3b92372e7bdf..2ba06f979f72 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -434,6 +434,7 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	int i, ret, pi = 0, ci = 0;
 	struct drm_plane *primary[MAX_BASES] = { NULL };
 	struct drm_plane *cursor[MAX_BASES] = { NULL };
+	struct drm_encoder *encoder;
 
 	/*
 	 * Construct encoders and modeset initialize connector devices
@@ -499,11 +500,8 @@ static int modeset_init(struct mdp5_kms *mdp5_kms)
 	 * Now that we know the number of crtcs we've created, set the possible
 	 * crtcs for the encoders
 	 */
-	for (i = 0; i < priv->num_encoders; i++) {
-		struct drm_encoder *encoder = priv->encoders[i];
-
+	drm_for_each_encoder(encoder, dev)
 		encoder->possible_crtcs = (1 << priv->num_crtcs) - 1;
-	}
 
 	return 0;
 
-- 
2.35.1


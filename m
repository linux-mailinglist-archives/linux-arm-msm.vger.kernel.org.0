Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2359974BAB9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjGHBEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbjGHBEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:21 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E39B210B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:20 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b698937f85so40754951fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778258; x=1691370258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMK+UXJaKO6+rmNMoQGWliUVQWYiOUx8RDuCq0/YlR8=;
        b=hADVcbMxB5i4niDTPO8hymDYlCggJ/1+XUW+XqXb1s4p7c/wbuZwp6qo7dI7DaMLNz
         IdU296iCfKxHqxOxOdJfYdmh15cA947f7uHMKWOnmuckv9xIYrgeHvOpSdqAjL2Bfqp1
         18ampq+AOa+fkhZ4UOnnRoW/d96G9zztuW6m2f1ZK85vWymaWXg2t6Aurisj/Crs3WfM
         e3Mwuzl5Q8feqCAR6XeE22METAs+kEcu13pfatkwc3PD+9iPZuvfpS0QPCK4Aav1rY91
         wL7Pu0havj52qoERtYQi+pJAQKSkl+TQezPtTrK3O5a2eJhC8gf6kEI7jc4JUy3I6G/E
         GSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778258; x=1691370258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMK+UXJaKO6+rmNMoQGWliUVQWYiOUx8RDuCq0/YlR8=;
        b=XTttZZqo6d5Xaq2OMHt4b5Pjz7BcH+/8EH0Qwr7jRHUewxDenLDAy+chkBgEipH6sq
         mMgLayIuXFlFNaooyVISpX2Zd6NrKsaT55vDCq0eLDAt0O9fN8Kum8T3UDOD2I8k3Joq
         h/QeeOtDizcCKADX/oOdfXYaupjaMZbW414uQ4wqaCZSHF2XhKScTF5jU/r0mY1xhfLw
         6R4iGTKsxsPKmcJCs5cfemUrV/F9H7nWriZSxljIwV5m6Ba+zLbwZPDnp/Lmoindzl00
         5VYkC/OAvex/IOhenPnky6lfon8HWFCVS42kKWexX7MFrZUQhEeMlSSk7QjOhGsyMupy
         /gQw==
X-Gm-Message-State: ABy/qLZrtYTFJjoyX3ljeTcmduYdkiA7p+7xTU8t37NHjHdi73eu9vbe
        Wtq6gFnkDM99vDiSUXvpaUwp6UAiDMwcfpjw3LI=
X-Google-Smtp-Source: APBJJlGHUaLV/N8oD1BWoHwtlBB1ouem4jAwhyhatCkgm7xfOkm/QihHG+3n274QtbwqYiozA/wN2Q==
X-Received: by 2002:a2e:88d8:0:b0:2b6:cca1:9760 with SMTP id a24-20020a2e88d8000000b002b6cca19760mr4910237ljk.27.1688778258491;
        Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:18 -0700 (PDT)
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
Subject: [PATCH 14/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
Date:   Sat,  8 Jul 2023 04:04:04 +0300
Message-Id: <20230708010407.3871346-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Change struct mdp4_dtv_encoder allocation to use drmm_encoder_alloc().
This removes the need to perform any actions on this encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  | 37 ++++---------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
index 88645dbc3785..3b70764b48c4 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c
@@ -25,17 +25,6 @@ static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_dtv_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp4_dtv_encoder *mdp4_dtv_encoder = to_mdp4_dtv_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mdp4_dtv_encoder);
-}
-
-static const struct drm_encoder_funcs mdp4_dtv_encoder_funcs = {
-	.destroy = mdp4_dtv_encoder_destroy,
-};
-
 static void mdp4_dtv_encoder_mode_set(struct drm_encoder *encoder,
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adjusted_mode)
@@ -173,41 +162,29 @@ long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
 /* initialize encoder */
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 	struct mdp4_dtv_encoder *mdp4_dtv_encoder;
-	int ret;
 
-	mdp4_dtv_encoder = kzalloc(sizeof(*mdp4_dtv_encoder), GFP_KERNEL);
-	if (!mdp4_dtv_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp4_dtv_encoder = drmm_encoder_alloc(dev, struct mdp4_dtv_encoder, base,
+					      NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (IS_ERR(mdp4_dtv_encoder))
+		return ERR_CAST(mdp4_dtv_encoder);
 
 	encoder = &mdp4_dtv_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_dtv_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_dtv_encoder_helper_funcs);
 
 	mdp4_dtv_encoder->hdmi_clk = devm_clk_get(dev->dev, "hdmi_clk");
 	if (IS_ERR(mdp4_dtv_encoder->hdmi_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get hdmi_clk\n");
-		ret = PTR_ERR(mdp4_dtv_encoder->hdmi_clk);
-		goto fail;
+		return ERR_CAST(mdp4_dtv_encoder->hdmi_clk);
 	}
 
 	mdp4_dtv_encoder->mdp_clk = devm_clk_get(dev->dev, "tv_clk");
 	if (IS_ERR(mdp4_dtv_encoder->mdp_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get tv_clk\n");
-		ret = PTR_ERR(mdp4_dtv_encoder->mdp_clk);
-		goto fail;
+		return ERR_CAST(mdp4_dtv_encoder->mdp_clk);
 	}
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp4_dtv_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03C074BABA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbjGHBEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjGHBEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AE4210C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fbcbf4375dso2919899e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778259; x=1691370259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idQIMC+YR2nmMkM0m4ALMkscbHs+Nx7/h/osKrqHwbc=;
        b=MUN4ONGt0l7S2m6I92F3w78jQJVUUPaSyySVd29j6SwY+TRpvHSXCIlI6tyoiSbJzi
         AmJJOEne0EilwMlzlS3/Ts6+0iI/4az2iJxLAAU36RXQ5aahETCvlNVtCU7deNwEkSce
         zfT25j2ttkWAMeskVJn6cjkNATZ7JqnFvceYM5hvBzIuJ6/GQliIG4bIOzgws9QJXmXk
         fpfQNw4PA0LxOYj+gRW4rIzFInQF82y2BEZtebkJjBtRggMbJUSTl1Brzct/fK0vo5pH
         z5YTMQXOk4cmIYceQ09sHWEd8o6Hpoehq1CgSCottjcRGz2/fCdutHpsxEJoaURc7mHy
         2KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778259; x=1691370259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idQIMC+YR2nmMkM0m4ALMkscbHs+Nx7/h/osKrqHwbc=;
        b=hghFRRsTX26zgRapnzWRvsDWOR6Iz9vkk31UYkWI1x4QcW0yoBLLT6GJIK2IIhzTpi
         0s1Phdy0hstTK3Ajw1xR0HNBc/u7pafrbZkgCu6DgL/gN5CXVWQqlH3Tx6VHQexZR7sZ
         KE+dYFUb9waMIRuyuERqv0LqDbePVAr66q0UTMaunB0NV0gR7uWiWf87VnoOEM0xF9d/
         c7mx0sRCb2QvFQZHLkWPpRPq7/qmLTMVPWTeCrRNuG3tbQJNnKFyfXm5aQdbiENYZ63x
         P5/1xQ2Cg1DvwC6Hjl1wpyr/g0V4T8t4VCpbtF0VZn2PAmTesLC9KHYXTZCNoWDPajvb
         2BSg==
X-Gm-Message-State: ABy/qLY7WFaOUWROrOqpuKBHJ8kIDnJRZOWSOE/LF17lvpVmULJsDMYR
        BlZRL1W3Do5I0MuOK4ErDFzQCQ==
X-Google-Smtp-Source: APBJJlHx3+Wj9QPkDTp7zL5vUfkVS+q6SfT9Y1KhD1grDLUF6HpCThBoiXc4lC9MvU7nyr9kjBJtjw==
X-Received: by 2002:a05:6512:e91:b0:4f6:2d47:274c with SMTP id bi17-20020a0565120e9100b004f62d47274cmr3228873lfb.15.1688778259122;
        Fri, 07 Jul 2023 18:04:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.18
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
Subject: [PATCH 15/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
Date:   Sat,  8 Jul 2023 04:04:05 +0300
Message-Id: <20230708010407.3871346-16-dmitry.baryshkov@linaro.org>
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

Change struct mdp4_lcdc_encoder allocation to use drmm_encoder_alloc().
This removes the need to perform any actions on this encoder
destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 36 ++++---------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 67c118bb30ca..576995ddce37 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -30,18 +30,6 @@ static struct mdp4_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp4_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp4_lcdc_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mdp4_lcdc_encoder);
-}
-
-static const struct drm_encoder_funcs mdp4_lcdc_encoder_funcs = {
-	.destroy = mdp4_lcdc_encoder_destroy,
-};
-
 /* this should probably be a helper: */
 static struct drm_connector *get_connector(struct drm_encoder *encoder)
 {
@@ -377,30 +365,26 @@ long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
 {
-	struct drm_encoder *encoder = NULL;
+	struct drm_encoder *encoder;
 	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder;
 	int ret;
 
-	mdp4_lcdc_encoder = kzalloc(sizeof(*mdp4_lcdc_encoder), GFP_KERNEL);
-	if (!mdp4_lcdc_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp4_lcdc_encoder = drmm_encoder_alloc(dev, struct mdp4_lcdc_encoder, base,
+					       NULL, DRM_MODE_ENCODER_LVDS, NULL);
+	if (IS_ERR(mdp4_lcdc_encoder))
+		return ERR_CAST(mdp4_lcdc_encoder);
 
 	mdp4_lcdc_encoder->panel_node = panel_node;
 
 	encoder = &mdp4_lcdc_encoder->base;
 
-	drm_encoder_init(dev, encoder, &mdp4_lcdc_encoder_funcs,
-			 DRM_MODE_ENCODER_LVDS, NULL);
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
 	/* TODO: do we need different pll in other cases? */
 	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
-		ret = PTR_ERR(mdp4_lcdc_encoder->lcdc_clk);
-		goto fail;
+		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
 	}
 
 	/* TODO: different regulators in other cases? */
@@ -412,13 +396,7 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 				      ARRAY_SIZE(mdp4_lcdc_encoder->regs),
 				      mdp4_lcdc_encoder->regs);
 	if (ret)
-		goto fail;
+		return ERR_PTR(ret);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp4_lcdc_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2


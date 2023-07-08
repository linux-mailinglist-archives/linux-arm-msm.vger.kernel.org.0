Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A186D74BAB3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjGHBES (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjGHBER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A599F210C
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:16 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso40833921fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778255; x=1691370255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvkDRRks7g8DySGasu3lXKMzrlSZVaCrNLVNV3AQolk=;
        b=ifWDV/xZ/NflqriQoy/Z+iUwbBprc7ttX3/6aI/mUGnvAICR+Y+k4gBdjgvOjNI5dL
         v73RQcQ9Yvcd4sWFr5PTJbgjq3bWTas2t5tSN9bQDmR2rKGQ7Knel+VEnAvpyka0RKES
         tlHsBDkTSTcrgqT0pVvVPtH51IHApKY1Wbz/a8MyL9e1DwNBKnVdpUiAIQcN2iFVKptx
         ieeapBeAg4pPBR6W0F3afWw0OdNqAZqMinaq15u/CdE9i7uZMAE9xLzCw8SYTw6k86FY
         YjT/2VPAnyQBwgll7vpK4HoABQ79ex/7E6fU9LU//9RTdYgXse6Hn2XlrPv60NcAwWm7
         HJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778255; x=1691370255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvkDRRks7g8DySGasu3lXKMzrlSZVaCrNLVNV3AQolk=;
        b=P2CTyl++ub8wmcUOQTD5oVxx/qRmlrASi0WHaVmFx1ncmOvHOm0wsB1BcD52tBv1/X
         CFhJ2jarfGL/wfiGyS8iDwd0Op54aS9k7HK2Tfmbb0XDkumf4KzdAYhOdir26bLaz3K+
         rJWuSav8ZJJk8mzGyaZ/D1AROO4HNUEiAUh2de/ZYSTpTm1NAhGFVIP9ij2kk0/zIexK
         Y0nlACYAa6UoBgNAMBQ0uG0aJ9hCyABjY3LxKuR2N4PWhjw9anfgGVRUWNZmT8a+vzrf
         eraC5KbaUDD9fACgDKo+yFjCQhXYK9lESZOSztY/kg8C+1h9qMp8z1cAUDbexuIzOLW+
         6NqA==
X-Gm-Message-State: ABy/qLaVQxEnONGqVFxyXu+jDTDSqTgp3gycwSV0qm+ejWhk676t7mPG
        kPHi8uRQTs6H0vbZDbkDY0IZeQ==
X-Google-Smtp-Source: APBJJlH2oS9vjaxVN82h8YObqDf30t8jTKMDOlnJ86Im09XQHvKw1qwi5FpPGlvOK6RkEXe24D76NA==
X-Received: by 2002:a2e:95c2:0:b0:2b6:dbf6:6b38 with SMTP id y2-20020a2e95c2000000b002b6dbf66b38mr925721ljh.52.1688778255055;
        Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:14 -0700 (PDT)
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
Subject: [PATCH 09/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
Date:   Sat,  8 Jul 2023 04:03:59 +0300
Message-Id: <20230708010407.3871346-10-dmitry.baryshkov@linaro.org>
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

Change struct mdp5_encoder allocation to use drmm_encoder_alloc(). This
removes the need to perform any actions on encoder destruction.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c | 29 +++-----------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index 79d67c495780..8db97083e14d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -16,17 +16,6 @@ static struct mdp5_kms *get_kms(struct drm_encoder *encoder)
 	return to_mdp5_kms(to_mdp_kms(priv->kms));
 }
 
-static void mdp5_encoder_destroy(struct drm_encoder *encoder)
-{
-	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
-	drm_encoder_cleanup(encoder);
-	kfree(mdp5_encoder);
-}
-
-static const struct drm_encoder_funcs mdp5_encoder_funcs = {
-	.destroy = mdp5_encoder_destroy,
-};
-
 static void mdp5_vid_encoder_mode_set(struct drm_encoder *encoder,
 				      struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode)
@@ -342,13 +331,11 @@ struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 	struct mdp5_encoder *mdp5_encoder;
 	int enc_type = (intf->type == INTF_DSI) ?
 		DRM_MODE_ENCODER_DSI : DRM_MODE_ENCODER_TMDS;
-	int ret;
 
-	mdp5_encoder = kzalloc(sizeof(*mdp5_encoder), GFP_KERNEL);
-	if (!mdp5_encoder) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	mdp5_encoder = drmm_encoder_alloc(dev, struct mdp5_encoder, base,
+					  NULL, enc_type, NULL);
+	if (IS_ERR(mdp5_encoder))
+		return ERR_CAST(mdp5_encoder);
 
 	encoder = &mdp5_encoder->base;
 	mdp5_encoder->ctl = ctl;
@@ -356,15 +343,7 @@ struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 
 	spin_lock_init(&mdp5_encoder->intf_lock);
 
-	drm_encoder_init(dev, encoder, &mdp5_encoder_funcs, enc_type, NULL);
-
 	drm_encoder_helper_add(encoder, &mdp5_encoder_helper_funcs);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		mdp5_encoder_destroy(encoder);
-
-	return ERR_PTR(ret);
 }
-- 
2.39.2


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F2C54DDCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 11:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376483AbiFPJDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 05:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376502AbiFPJD1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 05:03:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F0B12F384
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 02:03:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a2so1229052lfg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kWEg3qKQ7Suf9K5vJw6s6X7vzMoYVIAYuI4zZZJqDTo=;
        b=Y3riwIpAM2iIU/hX5yfy2hJLoLXc2eVsvqBz5J/HPfEm9R7mPOxVbj3hnD0a0sS2UE
         GAQw8868YRHX1Fjkoohlndz0Mjqk9srWEneE2dKvhXqE7US7tc0FHRWOj1PhZNiwo0oe
         kYat/gsfFBdTcGTtrGU0wKjxzp4zv6mse69Pl4Mf+6cYg9zMPLD5/14P8Mwuh2u/YgXo
         /qyXHlfALdRhJIO1Lx8Hn7Hik+5vQKIveWgG4uYGQUtfTf6MtLkvJtwOH26CvJmRh5n0
         f+3wcXdzKf42K8UfEpTrl0TCfuhdeVDbB8HvB6MaveajTCdbvzID5p0HdqNNG/wdd/nN
         O2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kWEg3qKQ7Suf9K5vJw6s6X7vzMoYVIAYuI4zZZJqDTo=;
        b=SHcBrLWIgA0T316ViEidDvXHwwleA2FPryopYjS+Vwxj3jRG0EHthBias9gMJKQtdK
         GgL2z5jfTAgBkadfj4Vk5h8RFlUlXRTHrqvBgAZILakeBrm/sHhXY2fHWhObSeH81XmG
         yhkxFujU1dkJXdqV6hq4/tLOfloyuPUW3KAUYvSLTmEICwo8qrbPlgzqX31H501jmHSM
         V+jHtu/OQdshv8NkEIQQatgChgVJF/xGJRHe0UbQdaAiGaNwFe4+AAicvqGA3/ikTYiw
         +YEA+8G6DhGd3E2Nskrj9BnG7CdRQ1zLR8GNf1nBb1GK5fbAEquXGobrDffyvP2t3XAW
         3YGg==
X-Gm-Message-State: AJIora8ldb1RneUtQp/QTQMohJz1OLgUEBQV1Jkyj2KnsFZ/loPYcXvQ
        AuqTasj7yA5LGC3/RiC9TfH98g==
X-Google-Smtp-Source: AGRyM1sJd/hJj6+kBa8lG/oP1fzLl5O9w8ImTr+6IK3JzwaOublnKhnxn0YOYGPyQKguDCqpcQTx4Q==
X-Received: by 2002:ac2:58e1:0:b0:47d:b1fa:d09f with SMTP id v1-20020ac258e1000000b0047db1fad09fmr1926144lfo.213.1655370203866;
        Thu, 16 Jun 2022 02:03:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020a2e8009000000b0025575338c41sm172573ljg.127.2022.06.16.02.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 02:03:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/msm/mdp4: move move_valid callback to lcdc_encoder
Date:   Thu, 16 Jun 2022 12:03:20 +0300
Message-Id: <20220616090321.433249-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
References: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
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

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |  1 -
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 26 ++++++++++++++-----
 .../drm/msm/disp/mdp4/mdp4_lvds_connector.c   | 20 --------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..d27fa761bfc2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -197,7 +197,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 10eb3e5b218e..341dcd5087da 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -366,19 +366,31 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static int mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 7288041dd86a..4755eb13ef79 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,25 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static int mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -86,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */
-- 
2.35.1


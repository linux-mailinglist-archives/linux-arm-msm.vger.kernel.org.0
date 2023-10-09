Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84E4D7BE8E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377449AbjJISKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377383AbjJISKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:47 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24955A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:46 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5041335fb9cso6074694e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875044; x=1697479844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zhzV+U7efpSn+723yIcdjzHoi8KO2DqRUVlFbifyeE=;
        b=cBO7lgzdum5LV3MwilEMZgV4CjDQRLVv5fyj2f/8LFXenCBZRpFM17C5SBQKTw+5ch
         i0AEQ9i1VQQW2nyMcKiOaOLXMSDxAtTwxPZAFN0hN9rSV8dQOTU6GJ35w5Nzu/noV7Vw
         cIJ6/9POwaI7tlwP2HU41Q3KbA2EHfHgJtB7WjnXznEMhUo08Cjzt7OCr+I+ELqw6Myx
         DbthH8LZsjkdJUSq7w9BsAGXtfNh80VFWTo2Jz9Na1qlCvgfbUn07Lb225mwlN6zYcbh
         ija11ZZCMMyl2oCawmwgfg7IFu9TMEKYPUDG2ri8me4iYG2NF+24odhEZs/J7EBVefx3
         Z/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875044; x=1697479844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zhzV+U7efpSn+723yIcdjzHoi8KO2DqRUVlFbifyeE=;
        b=KFxXFkkhFvVoi96obEXmYYxp1UNMVE3qrI142TvimaIVTunQVioxMYTUhqvHUl66ty
         xyD7HurNpQOHvlvU4/drWO/nRLHPIaVWISHvJxp94eXQQivoUmLdfNcDEkzFzhWPOGxI
         gbsA8kLhb+X7vB7HkXd77xRfB0jXhn2aA8MfzOBL+XDLySBUJC4kOmwne3lscB+ALXj+
         KMzKRihOqAVvwr2IJT3p1J+W6shKdozZbGkO0drZXNSNeIZCV6VZlATKJXEHR84lJ+Yp
         L4ZLLEULpu6vmvniDYcoc0dugM7WmnMo0wZW0QYl/187xQMgQVdbLoiUc2F5EEQF/n0G
         9f/A==
X-Gm-Message-State: AOJu0YztkB/HFWViks96irrndcK1X2kp7HBxrfnIMwymMcFif+2/aipq
        cQYn27ZQsMy7aQKf0Yza7j/haQ==
X-Google-Smtp-Source: AGHT+IFmAdS1VzsJrY2RA16X9ZJRDThy7A/HeUgUe2JXph2AZoOw6bfFNxw2VxE5AJ+5etFYOBTxSg==
X-Received: by 2002:ac2:4c4b:0:b0:503:cca:e52f with SMTP id o11-20020ac24c4b000000b005030ccae52fmr17520979lfk.51.1696875044264;
        Mon, 09 Oct 2023 11:10:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:43 -0700 (PDT)
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
Subject: [PATCH v2 03/13] drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
Date:   Mon,  9 Oct 2023 21:10:30 +0300
Message-Id: <20231009181040.2743847-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dp_drm needs accessing the DP's platform device. Move pdev to the
public structure.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 ++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 0e1afff491af..172daa5ad004 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -88,7 +88,6 @@ struct dp_display_private {
 	bool audio_supported;
 
 	struct drm_device *drm_dev;
-	struct platform_device *pdev;
 	struct dentry *root;
 
 	struct dp_parser  *parser;
@@ -595,7 +594,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	ret = dp_display_usbpd_configure_cb(&dp->pdev->dev);
+	ret = dp_display_usbpd_configure_cb(&dp->dp_display.pdev->dev);
 	if (ret) {	/* link train failed */
 		dp->hpd_state = ST_DISCONNECTED;
 	} else {
@@ -643,7 +642,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		if (dp->link->sink_count == 0) {
 			dp_display_host_phy_exit(dp);
 		}
-		dp_display_notify_disconnect(&dp->pdev->dev);
+		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	} else if (state == ST_DISCONNECT_PENDING) {
@@ -653,7 +652,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 		dp_ctrl_off_link(dp->ctrl);
 		dp_display_host_phy_exit(dp);
 		dp->hpd_state = ST_DISCONNECTED;
-		dp_display_notify_disconnect(&dp->pdev->dev);
+		dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 		mutex_unlock(&dp->event_mutex);
 		return 0;
 	}
@@ -662,7 +661,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	 * We don't need separate work for disconnect as
 	 * connect/attention interrupts are disabled
 	 */
-	dp_display_notify_disconnect(&dp->pdev->dev);
+	dp_display_notify_disconnect(&dp->dp_display.pdev->dev);
 
 	if (state == ST_DISPLAY_OFF) {
 		dp->hpd_state = ST_DISCONNECTED;
@@ -704,7 +703,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	dp_display_usbpd_attention_cb(&dp->pdev->dev);
+	dp_display_usbpd_attention_cb(&dp->dp_display.pdev->dev);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -725,12 +724,12 @@ static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 static int dp_init_sub_modules(struct dp_display_private *dp)
 {
 	int rc = 0;
-	struct device *dev = &dp->pdev->dev;
+	struct device *dev = &dp->dp_display.pdev->dev;
 	struct dp_panel_in panel_in = {
 		.dev = dev,
 	};
 
-	dp->parser = dp_parser_get(dp->pdev);
+	dp->parser = dp_parser_get(dp->dp_display.pdev);
 	if (IS_ERR(dp->parser)) {
 		rc = PTR_ERR(dp->parser);
 		DRM_ERROR("failed to initialize parser, rc = %d\n", rc);
@@ -791,7 +790,7 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = dp_audio_get(dp->pdev, dp->panel, dp->catalog);
+	dp->audio = dp_audio_get(dp->dp_display.pdev, dp->panel, dp->catalog);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
@@ -1197,7 +1196,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
+	dp->irq = irq_of_parse_and_map(dp->dp_display.pdev->dev.of_node, 0);
 	if (!dp->irq) {
 		DRM_ERROR("failed to get irq\n");
 		return -EINVAL;
@@ -1253,7 +1252,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
-	dp->pdev = pdev;
+	dp->dp_display.pdev = pdev;
 	dp->name = "drm_dp";
 	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
@@ -1459,7 +1458,7 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 	int rc;
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
-	dev = &dp->pdev->dev;
+	dev = &dp->dp_display.pdev->dev;
 
 	dp->debug = dp_debug_get(dev, dp->panel,
 					dp->link, dp->dp_display.connector,
@@ -1479,7 +1478,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	struct device *dev;
 
 	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-	dev = &dp_priv->pdev->dev;
+	dev = &dp_priv->dp_display.pdev->dev;
 	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
 
 	if (aux_bus && dp->is_edp) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 1e9415ab15d8..f66cdbc35785 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -12,6 +12,7 @@
 
 struct msm_dp {
 	struct drm_device *drm_dev;
+	struct platform_device *pdev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
 	struct drm_connector *connector;
-- 
2.39.2


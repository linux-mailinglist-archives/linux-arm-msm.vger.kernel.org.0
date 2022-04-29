Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1377D5154FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 21:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352482AbiD2UBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 16:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380454AbiD2UBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 16:01:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7523EA888F
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:39 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w1so15856232lfa.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eClHtbNiyjfQMFNU+LbIHUtg8OiaLij9Jf6MKVBO3/w=;
        b=O1EtoYK8JCQCkenpxDnCOCsTYxo0VODpEHOyZTQhHF1TGIPTVGLEpB9oTJBCQwCHcw
         nL5RYgymewRJddvp0vTxXU89g46rHg/An+VRKc20cW4Da6S////L2BBH1ubC0HulOMjY
         ADpOrnFgcrthGZK3nSq3f8pVdIML3q9Md5ZnR9agV07Y4G8Ntj5YJmGqKIUcWFP0tumR
         C3yJ2j3hk4Q8yaa4dFnqNLBB5dhHDWTkJZlGqwLqyTcGMhKW9T/pD/YmQzUzz97jegC+
         AbjiPx7q0m0jHX/+QA9wHP2b31f7z+W39EhE9+fbUljLk7VXjtjIqDqYpMsDN4HeBZv1
         y8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eClHtbNiyjfQMFNU+LbIHUtg8OiaLij9Jf6MKVBO3/w=;
        b=H1WsEOejx/fArr1B0QZd62xvJD7a9968tUG0qpO7E9Fvi0o6tjgqtS27ePE3YH+Viw
         DXEjdiT2CfHxz2AIkZICO2OAyDsUjB72M1Sv2oxaoczIzlTB1fEnFUfhmEkBJOUOj8QY
         Vcj6ejAci5Z2mA5UUFzmSEUAF/3n3GJ4GLt6P8cjXFyquKBVdCn7tajrZu23QEFLOsPr
         S96NTc5h+ZovgFKnhAvznlmOARsPYRlRwmeZOYAgIDUtiYrTSXIsDsnEQ8PNMHnH9HLN
         plwlUyjd9SicqO5YP2I+YnLgX0+bmWk0aETwJibCdd8LLPsKzgTQaWxwf90JoJ1OXmgM
         bmbg==
X-Gm-Message-State: AOAM532QzfqD2lFt0tJAVtkLDqMpdwjcapYAjCjQ6LB/TnkQzGwAgADS
        BfRfJkXMim05/2jE+YE8RsFdzA==
X-Google-Smtp-Source: ABdhPJwSQtm1XQHdRHRT3NywhR9YSG/M+3nXg2H7ZIiOA8iyPR2tX8KWIRRjEJh+CAquDpPqswQddA==
X-Received: by 2002:a05:6512:12c8:b0:471:c14e:1edf with SMTP id p8-20020a05651212c800b00471c14e1edfmr665903lfg.144.1651262257796;
        Fri, 29 Apr 2022 12:57:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 12:57:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 5/5] drm/msm/dp: Implement hpd_notify()
Date:   Fri, 29 Apr 2022 22:57:31 +0300
Message-Id: <20220429195731.3716446-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
References: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
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

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The Qualcomm DisplayPort driver contains traces of the necessary
plumbing to hook up USB HPD, in the form of the dp_hpd module and the
dp_usbpd_cb struct. Use this as basis for implementing the
hpd_notify() callback, by amending the dp_hpd module with the
missing logic.

Overall the solution is similar to what's done downstream, but upstream
all the code to disect the HPD notification lives on the calling side of
drm_connector_oob_hotplug_event().

drm_connector_oob_hotplug_event() performs the lookup of the
drm_connector based on fwnode, hence the need to assign the fwnode in
dp_drm_connector_init().

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[DB: rebased to use drm_bridge_connector]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  3 +++
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 4 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 454c21e702ae..35004640d42a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -83,6 +83,8 @@ struct dp_display_private {
 	bool hpd_irq_on;
 	bool audio_supported;
 
+	bool connected;
+
 	struct drm_device *drm_dev;
 	struct platform_device *pdev;
 	struct dentry *root;
@@ -1272,6 +1274,7 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!desc)
 		return -EINVAL;
 
+	dp->dp_display.dev = &pdev->dev;
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
 	dp->dp_display.connector_type = desc->connector_type;
@@ -1761,3 +1764,23 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 }
+
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = dp_bridge->dp_display;
+	struct dp_display_private *dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	drm_dbg_dp(dp_display->drm_dev, "status: %d connected: %d\n", status, dp_display->connected);
+
+	if (!dp_display->connected && status == connector_status_connected) {
+		dp_display->connected = true;
+		dp_display_usbpd_configure(dp_display);
+	} else if (status != connector_status_connected) {
+		dp_display->connected = false;
+		dp_display_usbpd_disconnect(dp_display);
+	} else {
+		dp_display_usbpd_attention(dp_display);
+	}
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 4f9fe4d7610b..2d2614bc5a14 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -11,6 +11,7 @@
 #include "disp/msm_disp_snapshot.h"
 
 struct msm_dp {
+	struct device *dev;
 	struct drm_device *drm_dev;
 	struct device *codec_dev;
 	struct drm_bridge *bridge;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 62d58b9c4647..821cfd37b1fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -68,6 +68,7 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
 	.detect       = dp_bridge_detect,
+	.hpd_notify   = dp_bridge_hpd_notify,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -138,6 +139,8 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 	if (IS_ERR(connector))
 		return connector;
 
+	connector->fwnode = fwnode_handle_get(dev_fwnode(dp_display->dev));
+
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index f4b1ed1e24f7..3b7480a86844 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -32,5 +32,7 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 			const struct drm_display_mode *mode,
 			const struct drm_display_mode *adjusted_mode);
+void dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			  enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
-- 
2.35.1


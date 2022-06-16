Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41C854DD99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359837AbiFPIxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376486AbiFPIxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:53:16 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE8B62120
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:51:11 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a29so1203549lfk.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CtFmr9YnFXBNjwW1QqgTVpLtMjRSqbtnLnF5ahH9/9g=;
        b=pPPobIRP9kSIAIwFkE1PFoYJ9JAQlIrrZtZLq/UCm+y08DsoOCMBMPmfUJIO2Ureja
         jhOpQo0aJddInFsiZh4apdmYL/r3H9uwTwxV8m9A+0oHPHMHtzDajH/ahvEaL2t7uQES
         xDjXTNURa8l8uBtU1WF6W40cON6eHIlck2KOp38+tzuHyw5q2hN/kIjYpucSjfcC5zJX
         yNPPGhFOVkqroHMptIEujLGzSNgNIR018+A5ntGVbrWXghJjSOmJWZvkXJRLaZTlzsgn
         30ZefOFbFPoGuRsPAuJPhLe8yJBafhuHSplZGOfyub1B5tR54x1e8dEk8YcQwNSwHAyK
         YV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CtFmr9YnFXBNjwW1QqgTVpLtMjRSqbtnLnF5ahH9/9g=;
        b=VN/bIEdRF2xd95HiPaQGmKl7UxYUTbVgOVodtA+lgNY32r/kS2WsmBDCmgXaQ+TT6I
         PLlcPU7UWfWLNlpzNOHCXGIdvz0/XHRdkUgOD+jlkIlBFB3ydpwoiAlKG5XyVxI+z7kk
         6s15dCV6Vac0JUbAH2A0oV3HVV5U5LI1tgXX9s4KhPz3tu9NtTJUZg5PwuYvEfzJkwS6
         qx8UtlMkcsLsD2ZvdIicputmlXqhHFzqsbPiFqrK+BqYIlSB4aPbIUbqX9/IATHLurjj
         s0OgQUhpYtR57crvHjf3nY0LncNL6TqdY6QeH1uiyYIXmyNl23tBPHD5mSmazcZ7V9pC
         l0NQ==
X-Gm-Message-State: AJIora+vPncgTY+VPP6VLQ8gxMlFJVVy+cmuvRJnMks6yPzbLisTUN/g
        xUm8tu8Oexe3xJFfyh1ZlUU8UQ==
X-Google-Smtp-Source: AGRyM1shxA9KdPhKLQQ5X/7BmpScUk3xhKPH5MFw8Wl9/GP2gf3ehMgtoiOssA+WoklvhVCJe3/dBw==
X-Received: by 2002:a05:6512:3b99:b0:47d:c408:555f with SMTP id g25-20020a0565123b9900b0047dc408555fmr2083991lfv.168.1655369458000;
        Thu, 16 Jun 2022 01:50:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020ac25b12000000b0047255d21202sm149136lfn.305.2022.06.16.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:50:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/hdmi: support attaching the "next" bridge
Date:   Thu, 16 Jun 2022 11:50:57 +0300
Message-Id: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

There might be a chain of bridges attached to the HDMI node
(including but not limited to the display-connector bridge). Add support
for attaching them right to the HDMI bridge chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 14 ++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index cf24e68864ba..9fdb17317589 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -9,6 +9,7 @@
 #include <linux/of_gpio.h>
 
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_of.h>
 
 #include <sound/hdmi-codec.h>
 #include "hdmi.h"
@@ -133,6 +134,10 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
 
+	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
+	if (ret && ret != -ENODEV)
+		goto fail;
+
 	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
@@ -291,6 +296,15 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
+	if (hdmi->next_bridge) {
+		ret = drm_bridge_attach(hdmi->encoder, hdmi->next_bridge, hdmi->bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			DRM_DEV_ERROR(dev->dev, "failed to attach next HDMI bridge: %d\n", ret);
+			goto fail;
+		}
+	}
+
 	hdmi->connector = drm_bridge_connector_init(hdmi->dev, encoder);
 	if (IS_ERR(hdmi->connector)) {
 		ret = PTR_ERR(hdmi->connector);
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 736f348befb3..5241735438ac 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -68,6 +68,8 @@ struct hdmi {
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 
+	struct drm_bridge *next_bridge;
+
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-- 
2.35.1


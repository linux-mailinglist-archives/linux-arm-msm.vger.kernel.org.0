Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4376716E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 10:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjARJBI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 04:01:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjARI7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 03:59:12 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC5B3A9D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:13 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id vw16so18136818ejc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 00:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN4n/APO0j+iHU4GexQwYo+e5BBUf2euvHCYZprN54c=;
        b=GQuQHpw7BBP6IlwMv3KHt9QknNYChhIskWdxfWTc/BjlG7eUgyItrA2C3XYgns3fnC
         BuTNaPrGb1gSOU+NAvQJSiS1fg/M7nEpXcFIMp4bzF1pHOc7ve4i+PwnulRFhmiNFYU9
         0VDj9kbsoOxA2b9Z2fzm88tMASAGnah8igGs8y0qJCBY+5NRbrSF/bhJd00K5Sn845cp
         av38f4mIV/EK2X4eNVCAuhzgNmEKXmyt2qHqVbOGa1GPKmK1UvG7APpVhZEWfppD4Vwv
         tWXMTphOA3/iyvAaxqlLabW2xeOL3yytEtP2xKqvzc5pC7XYUiQQ187bIFIpnMKE7gWW
         +sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jN4n/APO0j+iHU4GexQwYo+e5BBUf2euvHCYZprN54c=;
        b=b7/+weBVy2ytuXL2HHdEED+dxM7EMhhLtg4uVHYqvsqh9r9fBTHBNKWpeMZXdiPNxF
         KegxU8K7Ito4aJWn5BX6TrMqRqRh8yUckvonQJw8ep5v6LT8Ll0Lok8YviRkclEkjVf5
         Z4XpExNZfSqKTx/LuCAJDUrnzZPGd/x5uKo2YoGgrKy22nD2CQihCIEW5HXemi0reXxj
         SqPY5ZHLxPSVmaQ21zHXL4v/NeMpmn9xDgONZAkCLjqVZFMk83d/mqh3BW8keiTePKa3
         RazMWK5NybtvA9I+zRe1XpykXLKL6UYq3Ap+AvuQvfOaN+NWGe/rLxvXZxq02Q8QQDuR
         +Xdg==
X-Gm-Message-State: AFqh2kqzuwOB9+Qnzy5/S7apEiISNzbaetpwi4NK9DopGaLY5I7zB/tU
        ymt4FN2JVcLJs/89aJRGInit2nr/Aeq1I2mu
X-Google-Smtp-Source: AMrXdXtO3joQkNhyuNPKzneSneODhkC5eZgZS9CASCcCHKpNlDFdikws+nKOKpsPU/B19sxhsNI/sw==
X-Received: by 2002:a17:906:38c3:b0:872:82d3:4162 with SMTP id r3-20020a17090638c300b0087282d34162mr5844316ejd.44.1674029832178;
        Wed, 18 Jan 2023 00:17:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f22-20020a17090631d600b00779cde476e4sm14199080ejf.62.2023.01.18.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:17:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 11/13] drm/bridge: lt9611: rework infoframes handling
Date:   Wed, 18 Jan 2023 10:16:56 +0200
Message-Id: <20230118081658.2198520-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
References: <20230118081658.2198520-1-dmitry.baryshkov@linaro.org>
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

Rework handling infoframes:
- Write full HDMI AVI infoframe instead of just fixing the VIC value
- Also send the HDMI Vendor Specific infoframe, as recommended by the
  HDMI spec.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 57 +++++++++++++++++++------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1396ab081f61..82af1f954cc6 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -59,7 +59,6 @@ struct lt9611 {
 	enum drm_connector_status status;
 
 	u8 edid_buf[EDID_SEG_SIZE];
-	u32 vic;
 };
 
 #define LT9611_PAGE_CONTROL	0xff
@@ -352,12 +351,51 @@ static int lt9611_video_check(struct lt9611 *lt9611)
 	return temp;
 }
 
-static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
+static void lt9611_hdmi_set_infoframes(struct lt9611 *lt9611,
+				       struct drm_connector *connector,
+				       struct drm_display_mode *mode)
 {
-	regmap_write(lt9611->regmap, 0x8443, 0x46 - lt9611->vic);
-	regmap_write(lt9611->regmap, 0x8447, lt9611->vic);
-	regmap_write(lt9611->regmap, 0x843d, 0x0a); /* UD1 infoframe */
+	union hdmi_infoframe infoframe;
+	ssize_t len;
+	u8 iframes = 0x0a; /* UD1 infoframe */
+	u8 buf[32];
+	int ret;
+	int i;
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&infoframe.avi,
+						       connector,
+						       mode);
+	if (ret < 0)
+		goto out;
+
+	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
+	if (len < 0)
+		goto out;
+
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8440 + i, buf[i]);
+
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(&infoframe.vendor.hdmi,
+							  connector,
+							  mode);
+	if (ret < 0)
+		goto out;
+
+	len = hdmi_infoframe_pack(&infoframe, buf, sizeof(buf));
+	if (len < 0)
+		goto out;
 
+	for (i = 0; i < len; i++)
+		regmap_write(lt9611->regmap, 0x8474 + i, buf[i]);
+
+	iframes |= 0x20;
+
+out:
+	regmap_write(lt9611->regmap, 0x843d, iframes); /* UD1 infoframe */
+}
+
+static void lt9611_hdmi_tx_digital(struct lt9611 *lt9611, bool is_hdmi)
+{
 	if (is_hdmi)
 		regmap_write(lt9611->regmap, 0x82d6, 0x8c);
 	else
@@ -687,9 +725,7 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
-	struct hdmi_avi_infoframe avi_frame;
 	unsigned int postdiv;
-	int ret;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (WARN_ON(!connector))
@@ -710,18 +746,13 @@ lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
 	lt9611_mipi_video_setup(lt9611, mode);
 	lt9611_pcr_setup(lt9611, mode, postdiv);
 
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
-						       connector,
-						       mode);
-	if (!ret)
-		lt9611->vic = avi_frame.video_code;
-
 	if (lt9611_power_on(lt9611)) {
 		dev_err(lt9611->dev, "power on failed\n");
 		return;
 	}
 
 	lt9611_mipi_input_analog(lt9611);
+	lt9611_hdmi_set_infoframes(lt9611, connector, mode);
 	lt9611_hdmi_tx_digital(lt9611, connector->display_info.is_hdmi);
 	lt9611_hdmi_tx_phy(lt9611);
 
-- 
2.39.0


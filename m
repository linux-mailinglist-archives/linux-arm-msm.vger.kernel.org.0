Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92006616F8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 17:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbjAHQ5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 11:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234377AbjAHQ5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 11:57:08 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A53946140
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 08:57:07 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bq39so9582163lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 08:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkbWmLh0SyTbaJmj6lwX2gXRB2ciA0Sqr8sImuCDU5U=;
        b=t/OPt5eqc5RSKisaYoSDzCFgW8txaePdKAsYlpPoSdjRUJ62Z4O3EQ9tQty0KqTP1/
         z4fNXZIFVHrTfbf2EoG393nzT5+gQNGyqy+KnmxtulEh4p+7+oQLsTBprXnLYDNRUYCB
         TkWcA/OTycjxb6dmmlAOsyFJ7gYpgEfCf6wJvp888o3BcQVuif8SCZNe9S7KJ6PFYT8G
         o2L3DfuNlcPQXvzXilTdLto/v34pGsjcOPf6dV0+SVNydaqjds57tgZ320Z5csaHrtkH
         0kL3K3MnkfAZ0/KJE3ofmVAk6WEE2AUcBNO3yR56QgmLjQZ/JNoPaxIUbWFrBNOXfi5g
         Ba8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkbWmLh0SyTbaJmj6lwX2gXRB2ciA0Sqr8sImuCDU5U=;
        b=fCQTfBbdigHsZinijg29/ZFN6Axcu0Q7NXU/BkYw/KPy5DXjfqr21RlIFAdPmAl76E
         nLHUD5OyVSr8s9j0WPbyBZWuXAz6ySsT19sr2J9Taw31rrN0IKCKHpaKPKCe7BPYWEPZ
         zvkSgL+ZDntqTh4WyolLPYfbhlRgI2wjx1g9yyagsrMGbfjyqoF3D5DzKYRhT/RrF2SP
         SVT6ejw02kOMF5S8DCH4lo4DKQ0tainQpU/XlHKDE2JViR7aI2BGjSEqpUEzgvJzGhd5
         OwrEWvtrTGdPxDgZEdcaOZwc7crNo01cOPOF4FhcFJ1pQZyeEj+xUhng21BRfdAVKJEK
         ZafA==
X-Gm-Message-State: AFqh2kr0wPM8db6d0ploB7PccHxfkZuGQ+lR3TN649Ui+W3ltT5F2qTv
        8vp83YVHxY/1rDxZBvuiZOZphQ==
X-Google-Smtp-Source: AMrXdXul4ElWAGTLI45n3QNgcosJtHB69zyQadqjy9RiIsTe16NpflE4ek+tcOTf8Fgv+MpywYe/cQ==
X-Received: by 2002:a05:6512:259e:b0:4a4:68b8:c2af with SMTP id bf30-20020a056512259e00b004a468b8c2afmr19374040lfb.6.1673197025968;
        Sun, 08 Jan 2023 08:57:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s2-20020a056512202200b004b561b211adsm1138323lfs.254.2023.01.08.08.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 08:57:05 -0800 (PST)
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
Subject: [PATCH v2 11/13] drm/bridge: lt9611: rework infoframes handling
Date:   Sun,  8 Jan 2023 18:56:54 +0200
Message-Id: <20230108165656.136871-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
References: <20230108165656.136871-1-dmitry.baryshkov@linaro.org>
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


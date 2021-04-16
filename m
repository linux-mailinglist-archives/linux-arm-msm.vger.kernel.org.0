Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15918362B6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbhDPWlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235204AbhDPWlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:39 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746FDC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:13 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so17158559pji.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KDe1MXJmAaYPVB+3IXfqjGW37xK+xCJdqcyZAHEPidk=;
        b=KWfqj0ACbYfw5nTP+fIaVlC9b2gMX+VrrUP+qLnpXthwm14bl/ukKUPYjJlfuhPHl9
         F+dd7eA+MCFJRp1SU7zCty8Gq0UZIgrmvHm6gaNJgh18GkrmjQ4WmZcYdLtZJEsnNNwc
         Nq3XkhXdgaxHCrS+5UuFVZSHW0YJMhMoRSg9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KDe1MXJmAaYPVB+3IXfqjGW37xK+xCJdqcyZAHEPidk=;
        b=S+bxtwHQZpFpqGJT9xIqavghy7qGtpFFitBILiK+icONLYvQaj+VV8xzmvYR7S+TyH
         Jy+OJG3PcfJMC8VImS/KHlMLmwMM7ZFY8Z+RjoYdS9xYP3Ez3aT59rkBMCId51+AkwXa
         jK4dfgbTAbYoWR/Gddk3vFCXP+dHSm3VFIF8n3Zx8CxKWO5qcyqr/e2XcOgzj6akjbyc
         b1y5RjjvrYv/dbkUwTsa2cO94FhkoiK5XCrnf4aoiFYOG/B9HBAFqolYxFWHsquHdeR4
         uIo8cBw/8SVKV+OmkQ+UjYAqKDH+vTpGUzHKV2yqjNv6S4sJmztM9wbK9fD+UYrLmoJd
         Ib8Q==
X-Gm-Message-State: AOAM533ryyZphMtf9aKoENtYAMeLJ+OMqaxYxIoNN1wADvyeRdWAwGE0
        EIQMCdiVC7wDZasyMcyx3HlbjQ==
X-Google-Smtp-Source: ABdhPJzynOLhdYlVwoWPznXp3DqIb4mSI5Ve0BjgovmBaNyzMFh48QBAu3YNOKaPFJH5725ZzUExLA==
X-Received: by 2002:a17:90a:850c:: with SMTP id l12mr11700172pjn.224.1618612873018;
        Fri, 16 Apr 2021 15:41:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:12 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 18/27] drm/bridge: ti-sn65dsi86: Code motion of refclk management functions
Date:   Fri, 16 Apr 2021 15:39:41 -0700
Message-Id: <20210416153909.v4.18.I047b8c7c6a3fc60eaca473da7a374f171fb021c2@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No functional changes--this just makes the diffstat of a future change
easier to understand.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 116 +++++++++++++-------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a98abf496190..b3c699da7724 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -192,6 +192,64 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 	regmap_write(pdata->regmap, reg + 1, val >> 8);
 }
 
+static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
+{
+	u32 bit_rate_khz, clk_freq_khz;
+	struct drm_display_mode *mode =
+		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+
+	bit_rate_khz = mode->clock *
+			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
+	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
+
+	return clk_freq_khz;
+}
+
+/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
+static const u32 ti_sn_bridge_refclk_lut[] = {
+	12000000,
+	19200000,
+	26000000,
+	27000000,
+	38400000,
+};
+
+/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
+static const u32 ti_sn_bridge_dsiclk_lut[] = {
+	468000000,
+	384000000,
+	416000000,
+	486000000,
+	460800000,
+};
+
+static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
+{
+	int i;
+	u32 refclk_rate;
+	const u32 *refclk_lut;
+	size_t refclk_lut_size;
+
+	if (pdata->refclk) {
+		refclk_rate = clk_get_rate(pdata->refclk);
+		refclk_lut = ti_sn_bridge_refclk_lut;
+		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
+		clk_prepare_enable(pdata->refclk);
+	} else {
+		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
+		refclk_lut = ti_sn_bridge_dsiclk_lut;
+		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
+	}
+
+	/* for i equals to refclk_lut_size means default frequency */
+	for (i = 0; i < refclk_lut_size; i++)
+		if (refclk_lut[i] == refclk_rate)
+			break;
+
+	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
+			   REFCLK_FREQ(i));
+}
+
 static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
@@ -459,64 +517,6 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
 }
 
-static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
-{
-	u32 bit_rate_khz, clk_freq_khz;
-	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
-
-	bit_rate_khz = mode->clock *
-			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
-	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
-
-	return clk_freq_khz;
-}
-
-/* clk frequencies supported by bridge in Hz in case derived from REFCLK pin */
-static const u32 ti_sn_bridge_refclk_lut[] = {
-	12000000,
-	19200000,
-	26000000,
-	27000000,
-	38400000,
-};
-
-/* clk frequencies supported by bridge in Hz in case derived from DACP/N pin */
-static const u32 ti_sn_bridge_dsiclk_lut[] = {
-	468000000,
-	384000000,
-	416000000,
-	486000000,
-	460800000,
-};
-
-static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
-{
-	int i;
-	u32 refclk_rate;
-	const u32 *refclk_lut;
-	size_t refclk_lut_size;
-
-	if (pdata->refclk) {
-		refclk_rate = clk_get_rate(pdata->refclk);
-		refclk_lut = ti_sn_bridge_refclk_lut;
-		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
-		clk_prepare_enable(pdata->refclk);
-	} else {
-		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
-		refclk_lut = ti_sn_bridge_dsiclk_lut;
-		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
-	}
-
-	/* for i equals to refclk_lut_size means default frequency */
-	for (i = 0; i < refclk_lut_size; i++)
-		if (refclk_lut[i] == refclk_rate)
-			break;
-
-	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
-			   REFCLK_FREQ(i));
-}
-
 static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
 {
 	unsigned int bit_rate_mhz, clk_freq_mhz;
-- 
2.31.1.368.gbe11c130af-goog


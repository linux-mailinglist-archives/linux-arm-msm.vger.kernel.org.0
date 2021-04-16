Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651BA362B6B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbhDPWlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhDPWlh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:37 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650D7C06138C
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:12 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id y32so20129918pga.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLGZrRnlIJ+Q6fNp9u8b5zkhbGTSlu2wrvXeH+N18lk=;
        b=f7A6N+LBwds96DKcnAxCPhVICp3mFzK/2lCSKhq57FJpyvvP+/tnaGpnjy8Jsl+6fs
         /8DsrdQHOQ6RiR18G01pJulcx5iYNQgg9tPDxSTqlVj3DV4Y2oEOvHVRlpfXddQDTrmz
         bXcobJYDnTXegQGsC4iEh1GIaMUD4h5QRE3Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLGZrRnlIJ+Q6fNp9u8b5zkhbGTSlu2wrvXeH+N18lk=;
        b=bzwUl+mwHz132I9MnQxVrN+Ynm2cNvAHY+BySGpcAxXfTMw1bksx/6hB+HW7YM3znI
         3bKHjxlbcd4ViYANkhOuyyRVz7y+8mhCV3DL5kWO2xID3FiWUHwJrWy3VK0Px76zHf5W
         B5PBPtgkd9Lrs5wu7xbkQRyICWr/ooecf+g4wCnXxyP6NkQN7PluwtD6OnFTK1dsJ/i8
         js1ldzoXPLsIRCFeqBln/3eUixOpDOuEJ8de64eav+LvmcklLkVBurtTCqK6svkwxFkL
         jen7SlwRQ/rhGq3cwRondQwTZr7bGjLcrBXHFNupujB40kPZ+2xHg9kGc+vruwEeYm4I
         KbsA==
X-Gm-Message-State: AOAM5337RWGFlwbuFLn1q2MTR0jbWdrLTaHBerHra7HTXTZNuSx7hv/y
        RmvsarAuJCD0/nB+jqu/M/Zh5w==
X-Google-Smtp-Source: ABdhPJxMQNoobDLQCYHD6t2q4gFM11mEhbzq4z+G4WrDwfLOvv7+xmFuWyzBzj7KoSAVU50GfE4qFw==
X-Received: by 2002:a63:5a50:: with SMTP id k16mr1079872pgm.185.1618612871938;
        Fri, 16 Apr 2021 15:41:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:11 -0700 (PDT)
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
Subject: [PATCH v4 17/27] drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
Date:   Fri, 16 Apr 2021 15:39:40 -0700
Message-Id: <20210416153909.v4.17.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's make the bridge use autosuspend with a 500ms delay. This is in
preparation for promoting DP AUX transfers to their own sub-driver so
that we're not constantly powering up and down the device as we
transfer all the chunks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 44edcf6f5744..a98abf496190 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -243,7 +243,7 @@ static int status_show(struct seq_file *s, void *data)
 		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
 	}
 
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -292,7 +292,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
 		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
@@ -418,7 +418,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(pdata->dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
@@ -1049,7 +1049,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 */
 	pm_runtime_get_sync(pdata->dev);
 	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
 		return ret;
@@ -1100,7 +1100,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 	 * it off and when it comes back it will have lost all state, but
 	 * that's OK because the default is input and we're now an input.
 	 */
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -1126,7 +1126,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 				 SN_GPIO_MUX_OUTPUT << shift);
 	if (ret) {
 		clear_bit(offset, pdata->gchip_output);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	return ret;
@@ -1408,6 +1408,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
+	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
+	pm_runtime_use_autosuspend(pdata->dev);
 
 	ti_sn65dsi86_debugfs_init(pdata);
 
-- 
2.31.1.368.gbe11c130af-goog


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E19538F6B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 02:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhEYAEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 20:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhEYAEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 20:04:23 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D0AC06134F
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:52 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so12203930pjt.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/T35r9H/xYdI5Daj3afSSqWpMxR8pN+3BRmstBRd2eo=;
        b=XtJTTLAFoWjzdg0MeNYuiQac377tNakIga9O2eo1eKTa8+hf0jzBkj7TfYpMGXT/9c
         yWVh9Bqh6rd4c6lQvUcja9C8SSi70125WPI0n8Z+OZqxjVDyPZZZarT+YdaE/J5/4EI0
         QChngXtryr++KD3aFI4F4hISiVpW27jfctnlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/T35r9H/xYdI5Daj3afSSqWpMxR8pN+3BRmstBRd2eo=;
        b=jLfEm20epq4JNjP1W++kiDLePCss/Moc7zqkK5CQ3qxgyMKRPEcQnSycxCuwzdJn+m
         zjmFDOYrFgmHKCVNPpjJnisUeCwJwGSsnIzkQO0Bd5F5aRWyeKgeBiKpytn9a2JRx2Iw
         1/iBwFM6NTbfE3wWu2liMWbDkSJxUjxXg3B78DhfaylC0317lxVHJe3yI4kxzl3GF22u
         DIMVrNYDv1TKSTfRZZIGTxcLoB+t+cvESiM62Up3wKzFmYosp7Lz6hjk25phd0WurVfm
         qK4IFOxdBKqLSjIUjK5/DqkWWrK4MSi02+q7mRP7NPqv4ehduQhNitJGWya04R18s5d4
         2u1A==
X-Gm-Message-State: AOAM533O1spg6BifS8P9MEJYJWH4MDkmOYyfeK5xTqdlwSvu1rKK49FU
        043ivWkkmUbPKUw3PKyCVeU+gQ==
X-Google-Smtp-Source: ABdhPJygsw79I/6gDgsXc111IivaKqoEq603iWbw3jkbei76BrFXoUYpIE1evcNNxFoe9oHbDOi/Mw==
X-Received: by 2002:a17:903:2312:b029:f0:cd8e:c843 with SMTP id d18-20020a1709032312b02900f0cd8ec843mr27708566plh.6.1621900972211;
        Mon, 24 May 2021 17:02:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
        by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 17:02:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 09/11] drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
Date:   Mon, 24 May 2021 17:01:57 -0700
Message-Id: <20210524165920.v8.9.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We want to provide our panel with access to the DP AUX channel. The
way to do this is to let our panel be a child of ours using the fancy
new DP AUX bus support.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---

(no changes since v7)

Changes in v7:
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.

 drivers/gpu/drm/bridge/Kconfig        |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 7e7f28eb9546..a82952a85db4 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -292,6 +292,7 @@ config DRM_TI_SN65DSI86
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
+	select DRM_DP_AUX_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1ea07d704705..5263206792f6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -23,6 +23,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
@@ -1448,19 +1449,27 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_init(&pdata->aux);
 
+	ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
+	if (ret)
+		goto err;
+
 	/*
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
 	ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
 
+	if (ret)
+		goto err;
+
+	return 0;
+err:
 	/*
 	 * Clear of_node on any errors. Really this only matters if the error
 	 * is -EPROBE_DEFER to avoid (again) keep pinctrl from claiming when
 	 * it tries the probe again, but it shouldn't hurt on any error.
 	 */
-	if (ret)
-		adev->dev.of_node = NULL;
+	adev->dev.of_node = NULL;
 
 	return ret;
 }
-- 
2.31.1.818.g46aad6cb9e-goog


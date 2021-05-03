Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8683722CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 23:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhECWAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 18:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhECWAR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 18:00:17 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6687C061761
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 14:59:19 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 10so5407488pfl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OLRAd85FpiCGL7CjVpp3wCjW21owJByefcDimF6o1bg=;
        b=ZKgdlah1kveIQ9x2aFXM3KuIDDChTMuTehQ0kFmNWwFr5kC1kQ/FLgHBOifnNrw/ap
         J8iNIGQ7yYqR7es5TgP0Gc0jRKlPrJNAE/NGCe3oKBf/9/Y1vyXly4E++eVU16FBa6QT
         X1i2/gHXu2Zhb+kGxQ5xuWct5i94o+zXup2Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OLRAd85FpiCGL7CjVpp3wCjW21owJByefcDimF6o1bg=;
        b=QmFdghtKiZh6qqXk+mgCAf5y1DlsH28IUhW/kI77eA2ed84jnWHXZ2ATqQ3bdjNkds
         cjWnWqfmEVeaaCaeIUwOnI97qV/S+A0DiI18YCgoLDca7IysCCW/SZbGGOaZj+FBo2N/
         ZIA4XV8/0X4Hr/bbgPqkSgOhhz/jPOnWMk8RZs0mPCPNcfBZTDBvdNqxxjFdZTkUTQKu
         E8vx8x3gEagEdirfGanN2C7vAMLgARfLr0CY1czvUnLCRkMSpY3ZVz1DIWM1bD3iQCCi
         mZyQvzK39r+zEalHyKhFCLG7c/BwXGZuX6jkjdXV8OVpEHbeEyINMbdhJPnapSDV7KB3
         JUtw==
X-Gm-Message-State: AOAM5329hgQDKrmErpaDADWQlSe2/RxUuSYXf2NM4oFnnwqKyqEFtnS2
        r7grUMUyCm7vjQySytvaynPE4Q==
X-Google-Smtp-Source: ABdhPJziERAcDvCaD51oo2Yz/xVTskdMxyYTmx9XU0nuCyMaLlBksQpPqh1APqYrMH6TD39N1TGa/Q==
X-Received: by 2002:a17:90a:4404:: with SMTP id s4mr892137pjg.218.1620079159424;
        Mon, 03 May 2021 14:59:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a592:ac50:b17b:5c43])
        by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:59:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Lyude Paul <lyude@redhat.com>, Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/5] drm/dp: Allow an early call to register DDC i2c bus
Date:   Mon,  3 May 2021 14:58:41 -0700
Message-Id: <20210503145750.v6.2.Iff8f2957d86af40f2bfcfb5a7163928481fccea4@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It can be helpful to fully register the AUX channel as an i2c bus even
before the bridge is created. Let's optionally allow bridges to do
that.

Specifically the case we're running into:
- The panel driver wants to get its DDC bus at probe time.
- The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
  bus, wants to get the panel at probe time.

The next patches ("drm/bridge: ti-sn65dsi86: Promote the AUX channel
to its own sub-dev") solves the chicken-and-egg problem by breaking
the ti-sn65dsi86 driver into sub-devices, but in order for it to
actually work we need the i2c bus to get registered at probe time and
not in bridge attach time.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v6:
- ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.

 drivers/gpu/drm/drm_dp_helper.c | 67 +++++++++++++++++++++++++++------
 include/drm/drm_dp_helper.h     |  2 +
 2 files changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index cb56d74e9d38..830294f0b341 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1757,6 +1757,49 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
 }
 EXPORT_SYMBOL(drm_dp_aux_init);
 
+/**
+ * drm_dp_aux_register_ddc() - register the DDC parts of the aux channel
+ * @aux: DisplayPort AUX channel
+ *
+ * This can be called after drm_dp_aux_init() to fully register the ddc bus
+ * as an i2c adapter with the rest of Linux.
+ *
+ * If you don't explicitly call this function it will be done implicitly as
+ * part of drm_dp_aux_register().
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_register_ddc(struct drm_dp_aux *aux)
+{
+	WARN_ON_ONCE(!aux->dev);
+
+	aux->ddc.class = I2C_CLASS_DDC;
+	aux->ddc.owner = THIS_MODULE;
+	aux->ddc.dev.parent = aux->dev;
+
+	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
+		sizeof(aux->ddc.name));
+
+	return i2c_add_adapter(&aux->ddc);
+}
+EXPORT_SYMBOL(drm_dp_aux_register_ddc);
+
+/**
+ * drm_dp_aux_unregister_ddc() - unregister the DDC parts of the aux channel
+ *
+ * This is useful if you called drm_dp_aux_register_ddc(). If you let
+ * drm_dp_aux_register() implicitly register the DDC for you then you don't
+ * need to worry about calling this yourself.
+ *
+ * @aux: DisplayPort AUX channel
+ */
+void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux)
+{
+	i2c_del_adapter(&aux->ddc);
+	aux->ddc.dev.parent = NULL;
+}
+EXPORT_SYMBOL(drm_dp_aux_unregister_ddc);
+
 /**
  * drm_dp_aux_register() - initialise and register aux channel
  * @aux: DisplayPort AUX channel
@@ -1793,20 +1836,19 @@ int drm_dp_aux_register(struct drm_dp_aux *aux)
 	if (!aux->ddc.algo)
 		drm_dp_aux_init(aux);
 
-	aux->ddc.class = I2C_CLASS_DDC;
-	aux->ddc.owner = THIS_MODULE;
-	aux->ddc.dev.parent = aux->dev;
-
-	strlcpy(aux->ddc.name, aux->name ? aux->name : dev_name(aux->dev),
-		sizeof(aux->ddc.name));
+	/*
+	 * Implicitly register if drm_dp_aux_register_ddc() wasn't already
+	 * called (as evidenced by a NULL parent pointer).
+	 */
+	if (!aux->ddc.dev.parent) {
+		ret = drm_dp_aux_register_ddc(aux);
+		if (ret)
+			return ret;
+	}
 
 	ret = drm_dp_aux_register_devnode(aux);
-	if (ret)
-		return ret;
-
-	ret = i2c_add_adapter(&aux->ddc);
 	if (ret) {
-		drm_dp_aux_unregister_devnode(aux);
+		drm_dp_aux_unregister_ddc(aux);
 		return ret;
 	}
 
@@ -1821,7 +1863,8 @@ EXPORT_SYMBOL(drm_dp_aux_register);
 void drm_dp_aux_unregister(struct drm_dp_aux *aux)
 {
 	drm_dp_aux_unregister_devnode(aux);
-	i2c_del_adapter(&aux->ddc);
+	if (aux->ddc.dev.parent)
+		drm_dp_aux_unregister_ddc(aux);
 }
 EXPORT_SYMBOL(drm_dp_aux_unregister);
 
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index e932b2c40095..d4d2d5e25bb7 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -2021,6 +2021,8 @@ bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_
 
 void drm_dp_remote_aux_init(struct drm_dp_aux *aux);
 void drm_dp_aux_init(struct drm_dp_aux *aux);
+int drm_dp_aux_register_ddc(struct drm_dp_aux *aux);
+void drm_dp_aux_unregister_ddc(struct drm_dp_aux *aux);
 int drm_dp_aux_register(struct drm_dp_aux *aux);
 void drm_dp_aux_unregister(struct drm_dp_aux *aux);
 
-- 
2.31.1.527.g47e6f16901-goog


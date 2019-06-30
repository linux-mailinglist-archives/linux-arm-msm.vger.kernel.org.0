Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E095B18A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jun 2019 22:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfF3Ug4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 16:36:56 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:35977 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfF3Ug4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 16:36:56 -0400
Received: by mail-qk1-f193.google.com with SMTP id g18so9488926qkl.3;
        Sun, 30 Jun 2019 13:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=49NmudHDFaiz637maLt0od1jxi4vc0fBNFWPB/OQ7Ew=;
        b=DBTuLa2SFCIRlncjgp0a8sjJMrmiVoevGiyq+PyOd3P/l5i0yHONM0OpSlSPJQxe0j
         7W2lLA6Jtko/v+HWPa5jPZz/hgrSWzo9Npum9/dB6oPMFA7EasBtv8GFtuNx5mx3Q5K9
         yNS0NwKxar7I5iQ/3fYTwzi1un0rCFFcDdWgmz1y61hZD4K1wajMwyRnQoPTepJ4vg5r
         t0Xk5yYpLn/9+BgC+O/N6chIuEGHCEfKTJMDGl7F7gMMUeVDaUkAS985kTO3JwIwbl1c
         hCkd5sPpwrIYtzhobXpu28W9vMkxVoChJUA/Rf6RNJHr4+SqFPjJmDgdUa25jHGDkxPx
         TkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=49NmudHDFaiz637maLt0od1jxi4vc0fBNFWPB/OQ7Ew=;
        b=CGlZSAjKr6A47l5S3oSm/DJld1DEZybZSIE0/Y9UjkMwW02M/V/s0CsZmw0LOICxey
         MVd2wKd5PIvJgc3qi/YJRvJvTG1mp+0dPvOhjaVvf+ZG8HxStCuNEOt1oB4z5+pk9Aum
         ql4DWE80cPGBsw+DO/6d11/DjmLb1iDWj0tXG/H+v10KKudZrG7vqnB9BCOOsLkas6rj
         y0KU1/9daJ5iEjUkK7c6arT6hg9+uymAUejYk+zGaXGBUXrAROOEzk69h6/6LSD34M65
         c+D+8G0c2Ag5lmKWmFVURRro5n7CNgdBSoC2+cg6/th9NIMeOlh3hjJ7+oCTDaT7MkKc
         EjtQ==
X-Gm-Message-State: APjAAAXm8ETawkNSFCbX8M1e9ixQzBn1aF9xJ43Mbyei7jvrh/MCgBE+
        RHNeW0c54s26m2ZdBFFb5nBvOxfWmaPUWw==
X-Google-Smtp-Source: APXvYqw9dPdRPjUOBiaJgOP42sCQA941WsYe4Bx2/e7qKIMcRkO0Fhw3GXsoNcznih/UEJD2KmtWsA==
X-Received: by 2002:a37:9a97:: with SMTP id c145mr18112662qke.309.1561927015455;
        Sun, 30 Jun 2019 13:36:55 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id v30sm4457747qtk.45.2019.06.30.13.36.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 30 Jun 2019 13:36:54 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     freedreno@lists.freedesktop.org, aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm: add helper to lookup panel-id
Date:   Sun, 30 Jun 2019 13:36:07 -0700
Message-Id: <20190630203614.5290-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190630203614.5290-1-robdclark@gmail.com>
References: <20190630203614.5290-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Finds the panel-id from chosen, so drivers can use this to pick the
correct endpoint when looking up panel.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 21 +++++++++++++++++++++
 include/drm/drm_of.h     |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 43d89dd59c6b..3ba65750048b 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -279,3 +279,24 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
+
+/**
+ * drm_of_find_panel_id - return id of panel from chosen
+ *
+ * Returns the panel id, or zero if none specified
+ */
+int drm_of_find_panel_id(void)
+{
+	struct device_node *np = NULL;
+	u32 panel_id;
+
+	np = of_find_node_by_path("/chosen");
+	if (!np)
+		return 0;
+
+	if (of_property_read_u32(np, "panel-id", &panel_id))
+		return 0;
+
+	return panel_id;
+}
+EXPORT_SYMBOL_GPL(drm_of_find_panel_id);
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index ead34ab5ca4e..6cd2d59cb1db 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -35,6 +35,8 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				int port, int endpoint,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
+int drm_of_find_panel_id(void);
+
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -77,6 +79,11 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 {
 	return -EINVAL;
 }
+
+static inline int drm_of_find_panel_id(void)
+{
+	return 0;
+}
 #endif
 
 /*
-- 
2.20.1


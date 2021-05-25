Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA1EC38F8AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 05:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhEYDWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 23:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbhEYDWS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 23:22:18 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769A7C061574;
        Mon, 24 May 2021 20:20:48 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so27276411otg.2;
        Mon, 24 May 2021 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sed5JvRLMiaF+0cJiDPgQf1+4i4xNSCm3dc8S6Z16pQ=;
        b=jkwFbwTn/CLxuDbawKx+Ai7I2fdbLrqNe0hagrkWg8vHDxYqqBb+dOy51ktDABiZZf
         1gm+owY9hu4NO8qC7NRXEcmGhU3Op6ND2J5cyc1mcDfpi4DBLcF59KZ5KQt9X5bkXMHR
         40dQLvIVTmBQyrobhyZsnR6O3yj7LUoayZIfH0pSueke9vAjJ555E2ET6+qcqJPmRJH6
         Rguhm8Xqje3K9Hoj+xa2ggJ1pBUKqiykXe3xokDsR85owUyxLFPiSJ8RLnGemfeaLRn0
         LdRE7A0ZbQ4nGnViDPuXSHofG2MPMzm/KKIGdR2fYD/Q2rDz+9fJvEH0TA3HxOwYuUtz
         HivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Sed5JvRLMiaF+0cJiDPgQf1+4i4xNSCm3dc8S6Z16pQ=;
        b=O4raLSzXldGJpc5TgSmT69QezMl62HYZ2WA74LUlIpRpjeqSjNt3lrlyiSFcdMruqi
         jWwt2RJbt8S3Wjt3Q0gx3OZPu2ci6djIJAPB63CNr8O+S87O+kZjY+7qrkxJPZYoyUbQ
         KY9dx+qmhDCBy5AodjL0TVbGaWcx0zqZAwxjiJdCTGOySmyWto4kGJ2HtBPAetRoofKE
         dfCG/NBYmpDlLJMxos28P5jz0m1d1V6UOP1q0pFX3dpLFjggb+QGjxcgxmHauPTG+/2v
         u710xLzomAOYI4rY81g5psBhBsh+UHfhDsCgwDHLh8IuTafnPEPyqqdgXSrG87XxQCRD
         Df8Q==
X-Gm-Message-State: AOAM531NufEc4M7b7EtlP0qO1dL12cHCNSqnqGMaBppKjfz2a/WjixNa
        yoOAaX957RTSElpJE/bIlvM=
X-Google-Smtp-Source: ABdhPJxKOQeYkDInkuL2V3aQoUYr+kbPVlPeMP9q3jy3Uz4aFJzK9uqk6bnPvR4B9/MbmKkZf/JsPw==
X-Received: by 2002:a9d:60ca:: with SMTP id b10mr20574176otk.242.1621912847670;
        Mon, 24 May 2021 20:20:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 88sm3481873otb.7.2021.05.24.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:20:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] drm/msm/dp: Drop unnecessary NULL checks after container_of
Date:   Mon, 24 May 2021 20:20:33 -0700
Message-Id: <20210525032033.453143-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The result of container_of() operations is never NULL unless the embedded
element is the first element of the structure. This is not the case here.
The NULL check on the result of container_of() is therefore unnecessary
and misleading. Remove it.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

While at it, remove unused but assigned variable hpd in
dp_display_usbpd_attention_cb().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1784e119269b..a74e7ef96fcf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -208,10 +208,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
-		return -EINVAL;
-	}
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
@@ -252,10 +248,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("Invalid DP driver data\n");
-		return;
-	}
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
@@ -406,11 +398,6 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("no driver data found\n");
-		rc = -ENODEV;
-		goto end;
-	}
 
 	dp_display_host_init(dp, false);
 
@@ -437,11 +424,6 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("no driver data found\n");
-		rc = -ENODEV;
-		return rc;
-	}
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -502,7 +484,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	int rc = 0;
 	u32 sink_request;
 	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -511,12 +492,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("no driver data found\n");
-		return -ENODEV;
-	}
-
-	hpd = dp->usbpd;
 
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
-- 
2.25.1


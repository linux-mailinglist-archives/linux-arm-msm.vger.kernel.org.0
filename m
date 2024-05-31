Return-Path: <linux-arm-msm+bounces-21361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC58D6A5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 22:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F872885B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 20:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373EC17F4EA;
	Fri, 31 May 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYpYHfzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6A17D354
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 20:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717186056; cv=none; b=uzdh4xYARfxjJJkW94dse3ucAACyW3ahq0xQANl1e8apwpE2XHo1LZWZczQSdjWpobXgqVifW/5j1ZEaYMjWDnVK6tNLmlx1SYZKIT/i4f1s7SMlgfp1gr42aY6EG+4fA8tu1gtQmC+fMM1oygKJ/YCzcr3k3h81GiaVKH5UF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717186056; c=relaxed/simple;
	bh=Qg+Km5t2/ArhCtvDRW1AVt6NXCcPflkwptIdi/Y9plc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThHGZRISARzW2mtftt012zT+mIY4ZpGFxnadr2x359Er9rdszKPYTWgeMpDHK6ZzJecFYZDr65q1tD+UNWUDGGrLWf1DUdKK0/D6D5rZ2ImWwX7JBbjtYADeF8tyM+jihURYZTvlM1kyQx5K15GqqhNsb80pLHvoArchsb8gmc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IYpYHfzt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so34626431fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717186052; x=1717790852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
        b=IYpYHfztJLHUOrXXXgJLjY0iRDMMrf0qZVbdSQStMWrmvE9Ng2/dRS5RoDfomg1W/f
         m7wnJrgDnGV/lZm+rszJNyqF1MnRIqw0bWrCmKS3F6YwjEt4l1Wqpv5FwPkwMl/jKE/8
         PVfn4x51Mc5yOAMHnl5pS+KmZ9RjsVOOd6Osl70JZeb31ApFpSd7IuCyQf1h5TDFtX8q
         d6Uy0hBDybOLRW2//1Z/lu0wXp+sBEDvFdJPw/0rLRYkD2yBLj+znOo2yXc1VWxkvURV
         Ll767bmYhfjdMXctiIsJSCNdVMEwjnC2iC/y92tdMZ8SqQpIKxsBvx0kU9bSXQHlA3g1
         uyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186052; x=1717790852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
        b=WAzTdSAqzX7h7yVDGOx64skSS3jI0oubUmBILVpTs93zx0oiKkE62yB3Th95Sf5uw0
         17EiUl4ak5WSKQMLpxCfWOS8xeEgbGhx3FT+mK7DJPieWeL2kqx95I8uRGwOIuuQWzic
         t+eer3HCQNq19b/k/tdWJ+GBQkCV9cLe5LHpVWlgOgT/Y5NE+jPHBGqn8IPtfe6e+dHQ
         3nGp6So3oDsNlfqRXzySsGE4gTuEwo1/3RSYQRci9w+HHMLecaxsqOZlfXcFnYAX8BBz
         mANUGG8dhJCBpgi7Ggb1gOJ7ent7tkpXN8oyC3CKs1giV1cvYywJ3Qpouurm0dDOzORk
         ITFg==
X-Forwarded-Encrypted: i=1; AJvYcCWMSWqC905FGYgULdkl798DgXJ+BFILpRrGsUHsvNtKGCJxgIZY/IlWCavqRttOEMaNENEoba0hj9bLV8ZCb7hkQ9oJXUlt+TzaFo4zDA==
X-Gm-Message-State: AOJu0YyIFBVy+e+mLv/wBi/Eq02n8GCoAEmf2YBTQEx48yKZ6kTRs7pE
	PMz7GfftSiY8hKwih/JOvJYCK90/YEzBuMBbmgkXUJG0akftM5J0VA63jOi8dOI=
X-Google-Smtp-Source: AGHT+IGNtOTguaZ9leRqag0CaFzD23hl8t7r4pTG52EkCyMJnsoMnRLC07C3OfPKTkhSCTVQomW3ww==
X-Received: by 2002:a2e:2d02:0:b0:2ea:830f:9a89 with SMTP id 38308e7fff4ca-2ea951de46cmr22755071fa.38.1717186051788;
        Fri, 31 May 2024 13:07:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0b83sm4022111fa.116.2024.05.31.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:07:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 May 2024 23:07:25 +0300
Subject: [PATCH v4 2/9] drm/bridge-connector: switch to using drmm
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-bridge-hdmi-connector-v4-2-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
In-Reply-To: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Qg+Km5t2/ArhCtvDRW1AVt6NXCcPflkwptIdi/Y9plc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWi4A+k/wFAlNad1mkNnD2hKb7PCQmsOnilAgQ
 ae2aBefN4SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlouAAAKCRCLPIo+Aiko
 1chPB/wOEOQQ16ukqgtPL72Fsk3cDKv9fUVqks4W09fqE/QlJIzv89myxSDCF961MXZQC7CKJxq
 gUi/e45v3m3rINjmtqDmQn0CKzsxnr6By6QKcT4YeqWzViOo7OVFUeH/9nHeetRsIo1d7mYJTcr
 szPFZpoDu5Nuu6YJE7ayUq7LK7anRBizmgkApSUxScpHluXZp4Gf11iXxLmZDc1pHLF6unzOSH8
 U8QpuYzZtbrBCS6vXMQnmQrFA5h6OaZcunljIXaBCUPYaDtc0egkwKMfsYUZCw2JWGs9RZm+GMC
 6Wcifh0/wjJtyBpu4viwKVRZRNQ4OGPgt1KN1DxXlAOrm7z8
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Turn drm_bridge_connector to using drmm_kzalloc() and
drmm_connector_init() and drop the custom destroy function. The
drm_connector_unregister() and fwnode_handle_put() are already handled
by the drm_connector_cleanup() and so are safe to be dropped.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..e093fc8928dc 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -15,6 +15,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
 
@@ -193,19 +194,6 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static void drm_bridge_connector_destroy(struct drm_connector *connector)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-
-	fwnode_handle_put(connector->fwnode);
-
-	kfree(bridge_connector);
-}
-
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -224,7 +212,6 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.detect = drm_bridge_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_bridge_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
@@ -328,7 +315,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	int connector_type;
 	int ret;
 
-	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -383,9 +370,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = drm_connector_init_with_ddc(drm, connector,
-					  &drm_bridge_connector_funcs,
-					  connector_type, ddc);
+	ret = drmm_connector_init(drm, connector,
+				  &drm_bridge_connector_funcs,
+				  connector_type, ddc);
 	if (ret) {
 		kfree(bridge_connector);
 		return ERR_PTR(ret);

-- 
2.39.2



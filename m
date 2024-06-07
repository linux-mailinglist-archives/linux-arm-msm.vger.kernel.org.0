Return-Path: <linux-arm-msm+bounces-22070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EE4900493
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 15:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E44A528C387
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6883194150;
	Fri,  7 Jun 2024 13:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXM08pby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EA194089
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717766589; cv=none; b=uDi6d+MfI1+vgiJHgr06R1QB4yJ89HmQI8hE/OBHTwKzQZhv6YFS1IJUp/M8pgKDZj0EYBwWMDtkW7YccVYipJoTN16hRIHfgbgRWulXb2JWOdnOoMqBuGAA3ckT8FJM5rF4dX6f4985QXDK4vx9WCj7H2/7tl6a657RKvMvr1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717766589; c=relaxed/simple;
	bh=Qg+Km5t2/ArhCtvDRW1AVt6NXCcPflkwptIdi/Y9plc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ROPfcWaFrPi35IR544YzHnL1ymg/Mg8p9LGySfRAeEqlIY8whfK4pF3QjtoJQquDznKNjQV7U+OIMfwdc5QiWCUwCNqUeF5pIDKpAmR+VeHgWe1NzmcTCoIFsngjE420rAfT7ZYfw/y6Jf6iwAspxOCNoXRE8VUGfe/8A5JtooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXM08pby; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b88335dd7so2662320e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 06:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717766586; x=1718371386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
        b=PXM08pbyTjTwrG+1T5qOeCnvCvA/Z74EACRNsY44tFlJM+JWuIilrVPBUNVLwQxiGn
         WgVDAktAQdm88VHRf0ZW++XlczBWaaNpkHpIQeCwvZLlquxKEgjMsohMwQJ/sW7KULPC
         DTfURKEE9xPuG+YNnQBS6veGCX5/DFZv68eDmW4ZyvDcYtYcXlI9ytWMt5ajgSgY1A/P
         nYFJeRpkp55HUu5Es8350hpSepS+MphUTXXabzC81ZJdZwCvKB2JzlSUGOYmExpOTgO8
         o+VPARhI09yZKl/4UWhucMIYvFaSayV5IM6lPXNJjiw5F+x6IftivvpqMD03ntGesB0l
         u5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717766586; x=1718371386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHgcqHgkcrLMv81hwxP8kq1FxOWEk1MfcSrxFYUTu+0=;
        b=bjkVa0qnYkzzpKaIAbuwDyg//V4N0wOu3ukS30X3lNor5dKPTfXaBRM3I827pB9MGd
         AtaG24PDDOULUCJDCFPOYElmQo8mvRxIr78aJ9oUHuXXfM2ZcsoLUNUxqRgD7c53UlMg
         dzvP6ijFSPftf6QxOzZ91CSpBXDRRRZK/Y1c55nZza8cKX7SJyGvLMe9OBp8FgErJnly
         xPJ8ou3hYYGY9R9BPDqjgHvHqrr+zsyMNBlQZu8ddtPK7StP/FUkWJW5y7LwBgljQ+9Q
         8Zp8XSraypcEURUuoiln85915tf5RaYUanQERDCbzEgyxnYcIR2r+bC7Xjm7OTe9lM5D
         ViFg==
X-Forwarded-Encrypted: i=1; AJvYcCX1VL26cN8AukKXjQFnLwj8ff1ZSDBG03bSV8N7MqD4t0hmJzG7Nwyg47KNQtl9QT/63RadFK5TqfZpwqYhiFXLal3YBrpA0tfJOl5lWA==
X-Gm-Message-State: AOJu0YwZnT1xXubR/a0MEIfU69CjtvuBYraE9/TFtDugnNXU4kCUqk/Q
	hol6rJRKIBLCM2sm5juQsQzUSSfeKZaSZ+QjJp/x2QGjqZYkUc7bGgipTznDJRw=
X-Google-Smtp-Source: AGHT+IFimUSTeNrZfFvaBvkTFvkauvLRtO1YKFt0pvvZcBOVGoOAYA7In504u+fB6rAJ/1QGueJWkg==
X-Received: by 2002:a19:5e44:0:b0:52b:796e:66a5 with SMTP id 2adb3069b0e04-52bb9fd281cmr1397580e87.66.1717766585998;
        Fri, 07 Jun 2024 06:23:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 06:23:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:22:59 +0300
Subject: [PATCH v5 2/9] drm/bridge-connector: switch to using drmm
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-2-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm1D9fy2VKs9KR5++9rejC/DmP66UroHteIG
 Ni9K3xeHuCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtQAKCRCLPIo+Aiko
 1W6qB/9FnlS4xPdrI5+7K6pJxtvxKoybm4IDgGk4JOkAfQUyxdl61k1EWK82CKfMq2vznosX2EO
 cKGZi9nF4b8oCyUxheMTtlZiUE5LJbevH3LXYmd7AQi1GlduEicDe109ueiPIIWvGlNS0Q4GHnE
 wv+sW16S9s1LWet9Pw+n5icnf5o2b7JggB3flOkBN8HftLOnDqfaX+CM6Lc3/OassjFmgFqmXYI
 etvnZ30eTKtXFU/RD4lKx4lTEDhuQuJTuCrDvKjYAGsqPXGS3p/jch9wnEd53CdyPyEiw2Ga8sV
 9TaAlfeTMYUCQnj0gkldyTV2exQqE5Ju92g05dKOR2Kt1uo9
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



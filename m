Return-Path: <linux-arm-msm+bounces-13742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA733877065
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 11:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459C0281C46
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 10:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E199126AC5;
	Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDzvyIAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9F1D69E
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980300; cv=none; b=mpLbklc7dHo7XGZk9fhmCcvD2zwmK1y3p3T0gm05JvwWB7SkDrlKBBCYdk5M9S6lFI3JSe21pFO3Iidok0zC/RMVD4HNQ3kYTNJTk7MesFwrh6XDQMmMVBwp1w+7lYMk5LxYfuIgtdJG/J/6r67M5CXyCK/qVbosAX6U2LOzgdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980300; c=relaxed/simple;
	bh=TOTF8wEm+pn2aC2XeccwUCkVYk78cnNW5mkygODDCJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3YI2ZDfhIkBJw9gUlkKpoDJOoK+73OD1V/IPVvEotsStkCAkiPmrxMWi9/mjfBFWj95snFc03SZaZPoR//Qcpl/IABBwG26g2pLGgVLtJ4K/NXCM4RFqyuxksQIUo+W0IEF7Totyg3Sa6KMg7YtG/wuqUmLsgScBDTDPcYiWps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDzvyIAa; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso39130371fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 02:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709980297; x=1710585097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyi2QAnNjyFXYN+N8eHamuXjGZsyue9nPfokclWOSHQ=;
        b=xDzvyIAa+Bp3qYxR/QQcK/6Wu3y3fttaZflja8xkdBDRvNpynTVuTDVY46JBvz8lhP
         WOIxufR0EPYcaZqpKHLKJAmTv7dOEZ+SpO8DdJG5UNElsegoOt0Mjd/7a1TyheNigz5Z
         bEGa8We5gELj4GMSXQbUN35UchL9k5D2Kv2S2dBiph/CcM8rjnK7SsgRruz7jdnAXtMx
         XBnqe0bONa4F+Ru/7qFpwVTgGfUEtkwcTQqKn6/sTBHw0dxRRdSAEN8DqCM1uFh1z026
         LOkKwJGsPlo1yXdFotvzJLUEdLH3CYmuzTPK24o6b341HouRBJm4NxsJaSG75ch+QE4N
         2yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709980297; x=1710585097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyi2QAnNjyFXYN+N8eHamuXjGZsyue9nPfokclWOSHQ=;
        b=jOXjf48RCDGhnrk2bLd93kvL9n8PaTMFOnt2vQKKVmUS1GB0D1g4MwFLrdENglfQkc
         wFcpT/s0i0r26zVMjDDWYfwKtAJ4nIVk5nneZLWMCsj04qV6+keoicb3Oly3CFPxwVmP
         pj8yw2TEJuRGgXGSfCZV+QDkGd0WLcRnEMLurO7SxSJGyf6QgTK8SAB3sApxqA/Dn+Cx
         cRVQA22Go+eHSAWlMFhp/NMSRTzobkV4li/MIjC7pI1G37uh2+Su90OTP4BgHbIt1RBK
         c8gknquLmEF5top1mFlaMDyatAEOo4TUKYjp/jbgVsaY7prB8gwQZiJLvfoErSXyVmqE
         09Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVHtLeXqHiw0Q/pOrfz1PF1q8wlZ40FuKzWLWrsm7j0jarAot4c9+TC+vo7Jjxr1cllZzkN1jqclE/k8GMld3iDo5OUgv8M2BAlRmML1w==
X-Gm-Message-State: AOJu0YzzRH1cIa1IDvKHap+FffKjeyHfldUbs5770rb/RlgAPRDiCj8K
	2LpSuBOSZrbUH/+/yxMrhd02jNrQyG1P+DgrGC1xL88pS3qYFZLozupA1OqSQVA=
X-Google-Smtp-Source: AGHT+IH0wB7tIe5qs41vlrt+Gu8llz2cUWH9bjqPwDCtDbfZ2V7QVdE0L+S1IuYPpbgE54ngituFNA==
X-Received: by 2002:a2e:3314:0:b0:2d4:236e:4026 with SMTP id d20-20020a2e3314000000b002d4236e4026mr871679ljc.53.1709980297147;
        Sat, 09 Mar 2024 02:31:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 02:31:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:29 +0200
Subject: [PATCH RFC v2 2/5] drm/connector: hdmi: add
 drm_connector_hdmi_init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-2-1380bea3ee70@linaro.org>
References: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
In-Reply-To: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
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
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7655;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TOTF8wEm+pn2aC2XeccwUCkVYk78cnNW5mkygODDCJU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7DqFwlNpVVpgyKST97JjgY7ycbVtY/HwH8O8O
 fsDOx2EETGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZew6hQAKCRCLPIo+Aiko
 1QehB/9qQF3yZRna6aS+Bm9dZO43L79j4oI1UnT8UGU2P9RYLYDBzofqZidQXbWLfxbc8srIm0l
 aW4iJ0EGqPPxDvzmMQPKu5gTVtau5T2g9jTJt3k+Rgr510huIZspPcT65ODwWwI/5rYbbTOUlib
 XIVfx/J0w3j75A+VYbNS/Mubn334+h+9Jyvm6SCACNWfV+hOzn0qNiObjsjVgFneM6x7Qukkv7P
 4fbHD8x41HvyLYc5TSWhCMSicRzI1Pp98ToEz8tpyetEe4/rAAILNWuNtmCwIMmF813ozklFpRU
 YpKZ7BXl8LIF5v88NPHoG5/NmxjrgNsa4V/7GkW+AUPRugs+
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

To support connectors which do all the management on their own (like
drm_bridge_connector), add drm_connector_hdmi_init() in addition to
drmm_connector_hdmi_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 143 ++++++++++++++++++++++++++++++----------
 include/drm/drm_connector.h     |   9 +++
 2 files changed, 118 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 427816239038..d7c0e237f9c5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -453,39 +453,15 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @vendor: HDMI Controller Vendor name
- * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
- * @max_bpc: Maximum bits per char the HDMI connector supports
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc)
+static int __drm_connector_hdmi_init(struct drm_device *dev,
+				     struct drm_connector *connector,
+				     const char *vendor, const char *product,
+				     const struct drm_connector_funcs *funcs,
+				     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				     int connector_type,
+				     struct i2c_adapter *ddc,
+				     unsigned long supported_formats,
+				     unsigned int max_bpc)
 {
 	int ret;
 
@@ -506,7 +482,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
@@ -531,6 +507,105 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+
+/**
+ * drm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
+ * @max_bpc: Maximum bits per char the HDMI connector supports
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * At driver unload time the driver's &drm_connector_funcs.destroy hook
+ * should call drm_connector_cleanup() and free the connector structure.
+ * The connector structure should not be allocated with devm_kzalloc().
+ *
+ * Note: consider using drmm_connector_hdmi_init() instead of
+ * drm_connector_hdmi_init() to let the DRM managed resource infrastructure
+ * take care of cleanup and deallocation.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_init(struct drm_device *dev,
+			    struct drm_connector *connector,
+			    const char *vendor, const char *product,
+			    const struct drm_connector_funcs *funcs,
+			    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			    int connector_type,
+			    struct i2c_adapter *ddc,
+			    unsigned long supported_formats,
+			    unsigned int max_bpc)
+{
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
+	return __drm_connector_hdmi_init(dev, connector, vendor, product,
+					 funcs, hdmi_funcs, connector_type, ddc,
+					 supported_formats, max_bpc);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_init);
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @vendor: HDMI Controller Vendor name
+ * @product: HDMI Controller Product name
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
+ * @max_bpc: Maximum bits per char the HDMI connector supports
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const char *vendor, const char *product,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc,
+			     unsigned long supported_formats,
+			     unsigned int max_bpc)
+{
+	int ret;
+
+	if (drm_WARN_ON(dev, funcs && funcs->destroy))
+		return -EINVAL;
+
+	ret = __drm_connector_hdmi_init(dev, connector, vendor, product,
+					funcs, hdmi_funcs, connector_type, ddc,
+					supported_formats, max_bpc);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, drm_connector_cleanup_action,
+				       connector);
+	if (ret)
+		return ret;
+
+	return 0;
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5964ef283022..a97de8255e04 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2147,6 +2147,15 @@ int drmm_connector_init(struct drm_device *dev,
 			const struct drm_connector_funcs *funcs,
 			int connector_type,
 			struct i2c_adapter *ddc);
+int drm_connector_hdmi_init(struct drm_device *dev,
+			    struct drm_connector *connector,
+			    const char *vendor, const char *product,
+			    const struct drm_connector_funcs *funcs,
+			    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			    int connector_type,
+			    struct i2c_adapter *ddc,
+			    unsigned long supported_formats,
+			    unsigned int max_bpc);
 int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,

-- 
2.39.2



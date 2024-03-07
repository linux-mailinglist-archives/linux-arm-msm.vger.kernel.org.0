Return-Path: <linux-arm-msm+bounces-13648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6760875B47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C701B226CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B8A47F5C;
	Thu,  7 Mar 2024 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TeuO6Ooo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6631E45031
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855828; cv=none; b=Bhmg4d+muQdR2ClC0kEvyTJIdcQM/U0zLAvsAIBlZj/b50LY8UvVLt9afYO0aFvjUOKgcfFTDQlMk6VgJIFQ92a87wNIP/xGuNNw8IvXXN3Yd39qGGeL3BIPY8Ww7Cdmp+wWOsEBUv0bNGJJns3yyLhRdzLtc90wEzcECHhoq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855828; c=relaxed/simple;
	bh=y1yNIKWYKop4uPXPLUnZdxDiseRQwHNWzmdOCItrwFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDIEMPgk/7C5mXOlcABZZ3QK0XLZtBGj0zUExZJjBSNtW4PO3pfSRXFPsQIU29Si2kzn+t0gCPAjERKq2g5mBP4cdRTOiN23v/zykoBEDLOr4S7mnmDohhUjWO+/gUy2E7uYrr4jqEkyE6IO9WA+6q+72vyJhqzVCwxZ4KtyW7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TeuO6Ooo; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513382f40e9so1819548e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855824; x=1710460624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ayfDGuEZEO1ZfQYO+0AykFZJxnVQjKjfpqW7Vdx2QQ=;
        b=TeuO6OooP0sJkMc1KSFBU/L+rZzXEQF1zpECAh0LhwdtyOcvSWgW/B2EUaK+EWQ8Lj
         R7LjtX5hEzB57Sls7xBb7+b/3vUzAu9Atxo2TBmz3TNRnKvfq2hjupNq6zZ8V302kBBC
         A0bet76jYhsKLqNQuj1veaYW7/9wGlRz8BJKZ0fC5473IRVzueM70Ka4KzPL4Bu+Rr8y
         zhayRleLZqOPGreph+YPmHN4/iD4CJdcFiztunC7+RVe0Zq+ZobDgrU8Pfa482HTC/sB
         2Eg2xecYjUGGkfhBCtl7f7RGhVVydZt2toHJtX2ZpdpqAS2BR7miQZwZubuV9Bu4zg6+
         JxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855824; x=1710460624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ayfDGuEZEO1ZfQYO+0AykFZJxnVQjKjfpqW7Vdx2QQ=;
        b=FpeYQwFcxfBOcHavjtApgMWfrpTj/wnUqM0VtTqy06ZOe/ADUpDg6aGPA5E/2T8qHy
         VigXfhscru7/kBcnNIQiMDlrk/G7v7/e2hULD8r6lNkHduGp8K+4RRVnjM7id3SUx3Bo
         ACM1utp0R1yKiKfBFA87cA3q9yDS8fQAF6lfiKH2f8wgjSMnw3LdOkt1PH2p4ApS4Roo
         nJc2Ui4ekdxN44oZu1zdVou6Ckez2n01Ci5q+d29mxRdaX3MOw/jChYaC9O7U8uy3o5B
         bbN4jZZhq64G4jG5/bvRvGar5ZRETUZyUL95ietAc7SrckomWW9dLzhmZTq0OYlVpWFZ
         Dr1w==
X-Forwarded-Encrypted: i=1; AJvYcCWZK1gh/rhWzTn3ENrasSMI2qxIJY8RpDJgclF26uheJAEXaNFNqq44s0fWYSQ3COw0NCLeFiEX+2aDxaQQkJoUFapYPmasMJrN+iBHLA==
X-Gm-Message-State: AOJu0YyWP0kyiPW4vEOHA4+f/9UT5wu6fvmEOJE7xHPjnAqN5rHn4rjF
	gdb8/ytclTwWaQhgJH7eYoDph8eQ8EEPsB+XuE035AmhKyTU4Xm1DZhIeT7U4/o=
X-Google-Smtp-Source: AGHT+IH2kQosbGZQ82H2J6neyNEH81RoEbRElVkt21vFS8NHxY1NWgIZxQ7OeyErKOM7z4rHO0C7aQ==
X-Received: by 2002:ac2:47ef:0:b0:513:28bc:cd0f with SMTP id b15-20020ac247ef000000b0051328bccd0fmr2377793lfp.27.1709855824449;
        Thu, 07 Mar 2024 15:57:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:00 +0200
Subject: [PATCH RFC 1/6] drm/bridge: add setup_connector callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-1-90b693550260@linaro.org>
References: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
In-Reply-To: <20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3989;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y1yNIKWYKop4uPXPLUnZdxDiseRQwHNWzmdOCItrwFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lRNhMQfYajWwExGw9+woYoxcDvNbM6i1meDI
 SLAUtWy3OmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTQAKCRCLPIo+Aiko
 1W3zB/9UDY1bM4y8J3cTIY3/oV8UwEYqWEvYFmJyzBsFf6GzwU+tj6FEnRJabk/yUDRX+VVM2f2
 De/vcYY31UhhTF8vO50+y7dmAbbVVrx3g+E1+mdXJRSKSmp0rfQAncbyy79ChDA0qrrmXcAjml1
 t57dl/Fe7dxexIdX7fNIDsi2IjRyctg6k0YxREnPItglhyQ1nlIEq5lOAh5+P1O6uSGyt9vUhkC
 ZetdBzimHLfgIO/YJCrTiAcf/StrmlkxTgCdyMpTQ+rrOTEdn4rcUlA7drNS4CbM4QatRfNbGjN
 tnofB98OxEGfK10iklF8jfGO8yOucWFX2ycyt9bIC+2X497b
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add a callback to be called by the drivers when the drm_connector is
created at the end of the drm_bridge chain. This allows bridges to
perform additional setup, like setting up the HDMI connector properties.

Note, for now only drm_bridge_connector uses this callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge.c           | 38 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c |  8 +++++++
 include/drm/drm_bridge.h               | 15 ++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 521a71c61b16..375982a02bcf 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -580,6 +580,44 @@ void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
+/**
+ * drm_bridge_chain_setup_connector - call all bridges to perform additional setup
+ *                                    of the attached drm_connector
+ * @bridge: bridge control structure
+ * @connector: connector that is used at the end of the bridge chain
+ *
+ * Calls &drm_bridge_funcs.setup_connector for all the bridges in the encoder
+ * chain, starting from the first bridge to the last. If at least one bridge
+ * does not accept the connector the function returns the error code.
+ *
+ * Note: the bridge passed should be the one closest to the encoder.
+ *
+ * RETURNS:
+ * Zero on success, error code on failure
+ */
+int drm_bridge_chain_setup_connector(struct drm_bridge *bridge,
+				     struct drm_connector *connector)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	if (!bridge)
+		return 0;
+
+	encoder = bridge->encoder;
+	list_for_each_entry_from(bridge, &encoder->bridge_chain, chain_node) {
+		if (!bridge->funcs->setup_connector)
+			continue;
+
+		ret = bridge->funcs->setup_connector(bridge, connector);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_chain_setup_connector);
+
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 982552c9f92c..a0d0d2cc72c7 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -402,6 +402,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (panel_bridge)
 		drm_panel_bridge_set_orientation(connector, panel_bridge);
 
+	ret = drm_bridge_chain_setup_connector(drm_bridge_chain_get_first_bridge(encoder),
+					       connector);
+	if (ret) {
+		drm_connector_cleanup(connector);
+		kfree(bridge_connector);
+		return ERR_PTR(ret);
+	}
+
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3606e1a7f965..9806fce126f2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -84,6 +84,19 @@ struct drm_bridge_funcs {
 	 */
 	void (*detach)(struct drm_bridge *bridge);
 
+	/**
+	 * @setup_connector:
+	 *
+	 * Perform additional setup of the connector once it is created.
+	 *
+	 * The @setup_connector callback is optional.
+	 *
+	 * RETURNS:
+	 *
+	 * Zero on success, error code on failure.
+	 */
+	int (*setup_connector)(struct drm_bridge *bridge, struct drm_connector *connector);
+
 	/**
 	 * @mode_valid:
 	 *
@@ -877,6 +890,8 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 					struct drm_atomic_state *state);
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
+int drm_bridge_chain_setup_connector(struct drm_bridge *bridge,
+				     struct drm_connector *connector);
 
 u32 *
 drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,

-- 
2.39.2



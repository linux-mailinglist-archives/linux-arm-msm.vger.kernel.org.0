Return-Path: <linux-arm-msm+bounces-47040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DACA2AA64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 14:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB6D6188947C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 13:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7A71C6FFB;
	Thu,  6 Feb 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EibCAnIv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21481A3160
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849877; cv=none; b=J5TBM8lT/i44AWDbidTRGD+B9G6Xljm3MiQyJwuXR4mJef9odm5eXjsSJ8ocoiBvknHVEBLi93+iLQGOtg1QtqKdN4Ab/4/tAzov4IftEFDdMkmRGFQ952xexmTB2hFGakJrKTI4XtRQsfkYyCSJ1fG4AH23aBly+cNauUZ84gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849877; c=relaxed/simple;
	bh=mpzXyzeB8MzX6qw01rpg9ImZYnr1dtKSgAZWq7ewrIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5WihUIJfbSmU6xF9YTFrbDNq41kMprWbquB2ISnUvUHCABnzuDd6+LQ9yJnV64m18231pGv0Gmum+LRDVKJHcy8k3s5PVBHsTrQGnJpuI+ooXULP2/CFKiZT/v40tY5RnmJeS+KSEHBJmGz5AaP+s+ujmYUIpMOOh4jvqQfppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EibCAnIv; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30761be8fcfso9383731fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 05:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738849874; x=1739454674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
        b=EibCAnIvRsA1cH17dKRM8Ff8rPxSQyMtiEA1zE3SPkUHZMNUz2B/6rLt1I+yOT7tCz
         jhk6Z8ZJpNvmo+QMuTPGZ2lZuIjHQn4sskKWkFXROrH5M1rjknZMp3g9PqTCnjvrYTKS
         NQu22T2cEPwA3qY8uPtrcGsHnj1WbztbuRo3ac8bq7A7dw2H797DiVaxTkEzsQsCLtAW
         pjXAOVhbTf/rJRHw8ktURfRwe7JvYG5dXJx67biW0mU6jph2q4+zkTW6Kw5DjGdcPemp
         xu1fBTl33JdPbPNlbTIMQQaRqdWlVvCAf3XwabQXQzs0Flxj7ODeyVOcNlVm3BcY7WDN
         dcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849874; x=1739454674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXvHeC1Yf2GuOiuplAspcKQmKn7+kgoDshB/4Jadi1Q=;
        b=neaNB5yDmNcV8DMlVwOPMUdPzmz1yMap4fuDWztO9jHuPc0AF6KgsSg7fTrNd3v7DO
         Ks9cTijzEjf+7niDz90J+0Xzrt+rH0x6JCbrmwss0XfNAxcvB8FUj5X6fig4TkYG04JR
         at34iXrrmlExTEXvtY/EBIwDewgfL0ZdycYisR+rxS+ag9VNzH3Nfqvl3fRLpv7DK/Fk
         Z7sT+TCym2Bex+ygxpKOSigqieHmkDahxgpAQNoYvcSKm0tlIHA9vU0Ncr5pEy9iVx0B
         PL/QoEyyJk602pLgJb1+Xw2JjhP+U8wZR8E9Y3VatcHSjfC9TwvzG1s64EH/BHzhkN4+
         bc9g==
X-Forwarded-Encrypted: i=1; AJvYcCWwYmNSQWO/pzoNWByWA3Th3iHVil/oeDn/JSqlfAnVzxhYQIWbzRU/9U/mKcjHyAKN2X2OPgf4vmEuI72u@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrAjaeu+l5gQNaQX3jW4Y2KLPqrUCZFLRZpwM3fnxvL8DsnUy
	GW+CsD739cztk4aB7wFHtim8/hb+b6dtURg7bN8p1V9+BObvuAhqH+7L4OPmgAohqmWbXfr7FV6
	iHhU=
X-Gm-Gg: ASbGnctN0V0Dl1qn1+aJAov3d6XRuhXmpKAyceaQnpE0W7dRHAgMyauzRICHDP2PwBL
	vp9PguejgaSaO+BTmjSnOaCR8Fyyiy1U6uuC7w3gps6iqo5+ePPO0AmTbh22I7D1CDLKZGyyWyY
	c9m0YSCdEQk3Ny7tIKJSD5qqhT0qL3mr8gG0vo0DJnpdyeyQBQlX2LUbicnkl4oYa8it/En6ZX8
	aExlDOHU3DCd3s8GViRw/kI0xjt7zDBGFxmytFlGw1mr23dR9bn8BGbAzpo6XaEo/mmCpWBT+r/
	6mYjBll0pSPCEXFasvctDao=
X-Google-Smtp-Source: AGHT+IFVFDfXSZjE1F/bGlISaWdVp07EGr0sKbBBMGoJ9tmIeAf61QXHP/XAxmfmNjKasQbwOOV15A==
X-Received: by 2002:a05:651c:220e:b0:306:10d6:28a5 with SMTP id 38308e7fff4ca-307cf2fd818mr19782961fa.1.1738849873746;
        Thu, 06 Feb 2025 05:51:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2da11fsm1318521fa.92.2025.02.06.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:51:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 06 Feb 2025 15:51:06 +0200
Subject: [PATCH 1/2] drm/display: bridge-connector: add DisplayPort bridges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-dp-hdmi-audio-v1-1-8aa14a8c0d4d@linaro.org>
References: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
In-Reply-To: <20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5826;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mpzXyzeB8MzX6qw01rpg9ImZYnr1dtKSgAZWq7ewrIQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpL5NvB6ifjaYuLuKli9fRX9kVvhLcwV5zckkk
 Lq5MI/ckfOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6S+TQAKCRCLPIo+Aiko
 1eMVB/9C5K8gG52o0STml3vvf1liB0s84Ks5LDHy2F5FdlMIwEL0AxG9pJhDTraRRWQxWhfcvdx
 iWeHDlaCIXi8RzKjv0OpVXsU4Z03b8ZLePuqEpF1pc/SfnSNTeVvQOdgPpFoD0yOXQmcVRyWtDj
 QiQuvB7cxu1O+bdPjgtmngnoXBpWlyGolJdbuOrPpPoC9OCfy8YGpbUDxmvG/ME1bajWeuVdKx/
 0/PLY8/irbp+KQlLRyb5y7WXztG2GuCyDVSzDHAXpkBKrF6/WilK//fdnEh+lM7/0CdHc4XPEFi
 Rong0q0dDjjHWMLQ2OKVYrcH2DdiGB5rjyI8lfDLCpjvH/Hw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

DRM HDMI Codec framework is useful not only for the HDMI bridges, but
also for the DisplayPort bridges. Add new DRM_BRIDGE_OP_DisplayPort
define in order to distinguish DP bridges. Create HDMI codec device
automatically for DP bridges which have declared audio support.

Note, unlike HDMI devices, which already have a framework to handle HPD
notifications in a standard way, DP drivers don't (yet?) have such a
framework. As such it is necessary to manually call
drm_connector_hdmi_audio_plugged_notify(). This requirement hopefully
can be lifted later on, if/when DRM framework gets better DisplayPort
ports support in the core layer.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 66 ++++++++++++++++++++------
 include/drm/drm_bridge.h                       | 14 +++++-
 2 files changed, 65 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..5e031395b801f9a1371dcb4ac09f3da23e4615dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -98,6 +98,13 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_dp:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort connector infrastructure, if any (see &DRM_BRIDGE_OP_DisplayPort).
+	 */
+	struct drm_bridge *bridge_dp;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -496,6 +503,25 @@ static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_aud
 	.mute_stream = drm_bridge_connector_audio_mute_stream,
 };
 
+static int drm_bridge_connector_hdmi_audio_init(struct drm_connector *connector,
+						struct drm_bridge *bridge)
+{
+	if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+	    !bridge->hdmi_audio_spdif_playback)
+		return 0;
+
+	if (!bridge->funcs->hdmi_audio_prepare ||
+	    !bridge->funcs->hdmi_audio_shutdown)
+		return -EINVAL;
+
+	return drm_connector_hdmi_audio_init(connector,
+					     bridge->hdmi_audio_dev,
+					     &drm_bridge_connector_hdmi_audio_funcs,
+					     bridge->hdmi_audio_max_i2s_playback_channels,
+					     bridge->hdmi_audio_spdif_playback,
+					     bridge->hdmi_audio_dai_port);
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -564,6 +590,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (bridge->ops & DRM_BRIDGE_OP_HDMI) {
 			if (bridge_connector->bridge_hdmi)
 				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EINVAL);
 			if (!bridge->funcs->hdmi_write_infoframe ||
 			    !bridge->funcs->hdmi_clear_infoframe)
 				return ERR_PTR(-EINVAL);
@@ -576,6 +604,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DisplayPort) {
+			if (bridge_connector->bridge_dp)
+				return ERR_PTR(-EBUSY);
+			if (bridge_connector->bridge_hdmi)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp = bridge;
+
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -612,21 +650,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 
-		if (bridge->hdmi_audio_max_i2s_playback_channels ||
-		    bridge->hdmi_audio_spdif_playback) {
-			if (!bridge->funcs->hdmi_audio_prepare ||
-			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
+	} else if (bridge_connector->bridge_dp) {
+		bridge = bridge_connector->bridge_dp;
 
-			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
-							    &drm_bridge_connector_hdmi_audio_funcs,
-							    bridge->hdmi_audio_max_i2s_playback_channels,
-							    bridge->hdmi_audio_spdif_playback,
-							    bridge->hdmi_audio_dai_port);
-			if (ret)
-				return ERR_PTR(ret);
-		}
+		ret = drmm_connector_init(drm, connector,
+					  &drm_bridge_connector_funcs,
+					  connector_type, ddc);
+		if (ret)
+			return ERR_PTR(ret);
+
+		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
+		if (ret)
+			return ERR_PTR(ret);
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..40f37444426b1b8ded25da9ba9e2963f18ad6267 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -811,9 +811,21 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_DisplayPort: The bridge provides DisplayPort connector
+	 * operations. Currently this is limited to the optional HDMI codec
+	 * support.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Having both HDMI and DisplayPort bridges in the same bridge
+	 * chain is also not allowed.
+	 */
+	DRM_BRIDGE_OP_DisplayPort = BIT(5),
 };
 
 /**

-- 
2.39.5



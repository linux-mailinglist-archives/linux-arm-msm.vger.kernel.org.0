Return-Path: <linux-arm-msm+bounces-13652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B342875B51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 00:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C5BCB21DBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 23:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95BB47784;
	Thu,  7 Mar 2024 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jiEhmlfS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836A1D698
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 23:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709855831; cv=none; b=KmDuFcIen6JXy0Fgxhk+qDcPYtNQKtK7+lizre5PNUZiJDrAcZhCqKbam3zOr00FQpQpVijBMZ6bNX+pTotOlBl/6PfVA2iGYmQoK84FS8dIBJZt1/VsJa96YwY1zqA3GU+DcoD3Oh47kN3tkxgh0lDIng04e5BPF1mPtmNkT20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709855831; c=relaxed/simple;
	bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPNKA+n24BTTBV+eh5mfvBOLiTFPohjKMSc5Qo1bPpN49Z+WYT37MgGW7wBeCwRZsfYVhR3Y7FpaFIcpSSWsIt1YWGN3woL5uXUrC32y9K8S7dViFML7tcIdv/I1Ol9BUZYPNN6W0iHTYc17sUZtmh1CjgTbCeo2BGqlKS92R6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jiEhmlfS; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513382f40e9so1819608e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 15:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709855828; x=1710460628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
        b=jiEhmlfSzOEaAKtw7A4DUwIfWvrOT0Vsvy1hAISY5jzYd8RsdOEMRj1UTnQimwgCjE
         CoyKtMQh2xmaVtqXzg7Y6DcTc95gPZGiKME0fb8uYgW1eGEZdJt+WXrTd3tk5hwKe80m
         6S8PHpnjBBfBC8aanmEgu7r0jJEFlH5CNMy6Cu3f/kTI4M5gN/3ZvxAQXufyQQP+MZRH
         tnmPZ0Dgc0XlopbxdLf9Hk5mdfEpOBcHk+CJUBb4bv/yy9top/5LYxHSqJx/YX3gyXbW
         5+GDRx76E5mIP5MRJNFqctuU7zlG6qI0htxygLEeLjp/z9zgvSTg1zWYJ4AJW7vC3NEs
         b0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709855828; x=1710460628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
        b=k96t5I2CIG/LYv0rRuNbPWtVgOkxtqVUPoiTrmgeKyMWDHuXwHQOAwkBGd9NYj9vhl
         u7LCOcI6nVtwUpLkqbED/jPtSthBNohy5kKWZZt1AqLmJB8qbjJ5hqZhAxrYtMHsUakc
         By55bwl8N4l8RqS91TfgGIGqpoNS9qcpT7Gtw1AzL78AatZm1g2+WSQ42L3hs6jRzF8J
         ngeuK1u6ZG49t0nHkkTCLVYRmES/p+ahs54BBUGEJMfwOQTKnhnXmYAkCbRwOXcbkFex
         l953JzW6IPTdw319T9dBqnkFvKelhkK8rD/MSvWNFwsiX3lS8s7Y+xRiV62LZm6uVsiK
         gJcg==
X-Forwarded-Encrypted: i=1; AJvYcCWjmbckr5ae56U9Hxf8DhT6DEdkc4FUXD94sHLOhmHmfVqqKB/T8KqiSidARUPAHYNqhLgC0K4c3n3ySIEwMmeeWlnkxqh1jlRNQ56ZWQ==
X-Gm-Message-State: AOJu0YxqPkOG/a3+K1cVfu3FKIB2OYt7xOhBfGyBueEibSkr9p3IMo9T
	uhilwK/pO3Pbq82sbRhumyclwyAFlA+WXBGzfzQ91CcUaqLCH3h5uSecoq4Dx3A=
X-Google-Smtp-Source: AGHT+IEx8ik/HnzE5BA3s5swGV9Uvxj+BG3KC6Xb175mtXkrd/DFHNiOAucs1EnWSDmhAsJ/EiGyZw==
X-Received: by 2002:a05:6512:4892:b0:513:5c68:9891 with SMTP id eq18-20020a056512489200b005135c689891mr2272468lfb.44.1709855828422;
        Thu, 07 Mar 2024 15:57:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b005133277eb29sm2796475lfc.270.2024.03.07.15.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 15:57:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Mar 2024 01:57:04 +0200
Subject: [PATCH RFC 5/6] drm/msm/hdmi: switch to atomic bridge callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-bridge-hdmi-connector-v1-5-90b693550260@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl6lROL7TvShNhOkfkCagc8FA+VRYozrsB3Q7UA
 zETQDg5gr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZepUTgAKCRCLPIo+Aiko
 1fQ2B/0ZYDxsY+2fnjYDrke5sXxwtAYhbmqca/jy6/PZd9RLE6EoGmw3UjQ9+BkB/3DLashehFZ
 A4QKe+48Hk9UC7q75UmY+fdFTK6F11Eq39JoHum+VnA3YhBDT1mUzcrCGWIdsMjbJ8nLIVcfqil
 y1VzRByOEZt8L86tJGG5ppOv6t+WYsckKA4MxZyxTF7SndcMQDhg576pSae+f7N1pyG1PueyVbr
 P2/+Grv0/xoB9mpaw9Je3rsMWWCZt32xe3Nr9e7dSnD7Un/uYJC8WdKxnX8cBBZTqjexmmTbCWH
 /yuLJCdw7GPswznIkLI11B7SVfk/5qBFhqIZQU9dfudhZEHF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2



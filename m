Return-Path: <linux-arm-msm+bounces-47211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A576A2D1FB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D40A47A4348
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A101DA5F;
	Sat,  8 Feb 2025 00:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGE81MeJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60FD2FB
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 00:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974431; cv=none; b=EnTg8uU9ltfSAAdMgYV/VXiCyPXDqK0PB7IELVrymlDeNvELXbceAH+BMmbS9AV3ibHcTFNLBXAbFtGKCG/CJ0ki9TiLMjykClJtHlcHKZ/MT564Udk0coHgAIwj4Q0m9jGmVXZ40YK4KW3M36Xt78DtkWmE4SDS6hjKa84dsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974431; c=relaxed/simple;
	bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UiPTp69bzw/h7APvlyvfcO6JpA/wfBTzl1LsiJKTdFXTA8XYHFMRtCyzufDz9CBGAvl8ob7522kwcQL5OHF6Pk/rVi9DiqL07yjUq7Eqohe3nOeEzYTXVVyW7SoCZRCl4VC6EbYFifwsRc72uwJ2gcipLFuxryHmyWCw/M0j4bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGE81MeJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-544ff616010so689568e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974427; x=1739579227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
        b=UGE81MeJj329uQR9E5thP/32IxVRAGRAU3V7Qs5OXIvugAbe9wpM/lOcDjElnRAk6d
         h2oq5N2eCKhqcJpgxwNV8TqOF4dMtUYuDOgZtxjAI8KBxrzPTXmchKJgAAd5ahjZrg1K
         hBxchajbbpXhUe6qgdMy1F9GjdX0Qz6TmtPj9akvqgGpHIXHqw/52Ep5jgsJ5P4rYCMX
         oFoTcuhtJFdKHpjo6WqCO+egSHxSkmK/dpZAl9O+o7uoX7gZHPmNrPhzY3J07PVMd80/
         jAOut1YjZxa7oR20HQ2BDsyHoOE0wK0GG8uohvFAKvPkjF7EtH/EaJfFBVd30GWGay37
         mDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974427; x=1739579227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
        b=RudKxVQi9S8v/I5NBVDHZhTgoK7LLD6GYxiyHUqvtTZNZ1SqvULEIDYBHhIQ1kurN/
         +dy6Zk/JTsNLJ+Oxp2L29Rtnax0RwjlUMUJy+ONH+QCmOALvpDtsyzB2S/AmoMrclQve
         w0AKDBw3TGm7vKnEh9WwA7SrzvSeYxOQgKlqhqP9KGQpwJClqPTFHwM+w6B4QNqiIik9
         HxxGRTe1UmmoMIUbwb/JTtVNFGPooZ83zyg9gjypMlMs4CNN4ihGdx3LV7BkkxPTYYJO
         BZ9Nk8kelhxASWNdBQllE38Y/M7tAkVW+LrNRTN+6e9o6I5c1qOx1R2FBm9kQyTFoQrT
         T/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV6rHGSuWAUbgrjN+zyQEDGoP7LrvAqiFkYZ8PpPOWPcKv9j+SPw4ThyW9FduWDmqhkZ68Reg960lsDDxSv@vger.kernel.org
X-Gm-Message-State: AOJu0YxkcHEmJm9LgtakG22gCpPzDRtMincvR32ZawYVqNZJfh9ivmi/
	2HBpoCfWmarqOCcXOs88XK6E1emGH1m7MnB+evTPDn+9jmojNRZ91X9+ToR8nc4=
X-Gm-Gg: ASbGncuZUIqegN1wYVbEhVdEJORQT5LRoVpFzIPj6zftU1CDxLtTHbamaTLW9U50Agk
	2jajffbV0TXLTzIIODFiQf7b3bHo/r3zE7EJF8J2O2WEgBqytHAk3VtPWS4LePRw3bP3Y1QTnFB
	64E15csNf6MDsxevN5mUe0ftR1PMH7wvvn7CTmN7dJd1AYDhtJmoukwwZd/B+PBNkuFrJgQvwO2
	dPmoqxhlcJM/O9LxghwXZoOXjtZf1fawcKe5uygwo0+Q8/3RLK7/eh6EVWmGSWQZQFY9acMoFuh
	qtg882NF/FqJIy/s7Td+fic=
X-Google-Smtp-Source: AGHT+IEVFsKGgciuBhusWj1+JHw/cRfA7URw+89fCpLGUhjS8WQcgx8wyX3jcJd3Ar8ldB/wtMcXDQ==
X-Received: by 2002:ac2:5f47:0:b0:540:2122:fae9 with SMTP id 2adb3069b0e04-54414ae5d0cmr1280495e87.46.1738974427575;
        Fri, 07 Feb 2025 16:27:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:00 +0200
Subject: [PATCH v7 1/7] drm/msm/hdmi: switch to atomic bridge callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-1-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTV+ngwC+ACTteXyvBnI3bH+dIJQoFPCjJDF
 bdcCD7e1eOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1b/OCACZQ3v0Ts8EKLagTT66fPO5tTexGqVfbvMnhWXrmd/Fm8ZlKpGUwiHKnNtH/55Z/2FPLOW
 OZmTLAebTJaVrpVBZSjEVNCtS2QLuU0esefSHzCgztQ9OL6mHk7xlSqE8Red9GQ3wmiiy2AAuI8
 9Wx4zZLTLObMnwKmfqX5XLMNG8L497pFhUBf1cQncq/TfC8nJEk8+bN/abXEDkp78L58S11hVq7
 3wkMXYOleYaJrfuv9bJI4yEmhg6SfOMlu4lPDg6Jet6wAeTmdNwDXKrppEMjJFcegll30LPnfrl
 CocmH5b5d3mZuEckB17X4qpOHJDAX9VBk3XEaWh6KWXVpFQ9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f516dfc4279d0f319ec1e5b17f240..d839c71091dcdc3b020fcbba8d698d58ee7fc749 100644
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
2.39.5



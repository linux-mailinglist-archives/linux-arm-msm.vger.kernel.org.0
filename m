Return-Path: <linux-arm-msm+bounces-46109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C8A1BE0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F421188E101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395741E7C33;
	Fri, 24 Jan 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RD+shECl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CB1D90BE
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755274; cv=none; b=uk7v2RE0WxEmjAapOCgO/g/1/Mzboo9x5lztkCEUeGlqTdjRc6ZbRb8KtfEOhXZ557mznaXApSdpRMRfDTll1cNRTvc68EiFEmpoR0R7FbZzHA9pQYPIBJrdPvwrKYDB0+sndD/nvCPlEho1Q3/mwqdcwdmN+nTSDZ9Bh3Xozms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755274; c=relaxed/simple;
	bh=f0rJpJCum+b7lqaI4sn4V9SXHt/v6K6WBKvJft3vbro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIqA5OsDefBfQYwvfKum42VKiVGlitgt8TreHIjjiVjRl/UcOmlKW6OaO3BpY1oC+lv5mWV/rA7aJEWJ6N2SwRmoKAgEv6EjCLcvlAeDLgn4v4ye5CItjHa+ChZtsjRVpXsQPfUU7vx27wMUgDuWf48/+AW70uo3Tlphdz044tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RD+shECl; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-543cc81ddebso869030e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755269; x=1738360069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
        b=RD+shEClw80FvadE5kOB0iOOMpLknKg/gk+JUIWQjgjN8NvVrrPfDZNSZbfftZQzhk
         tlf1NOGG2TX1sS+QSYCGSBWxdmUqBehoKD8JFWe1DVsxDc7uAK0yO6JQOfpsr7808Wmn
         bPlmsoonSwe3EJd9zmIhCZVY2nBEC5MFale6yQsJFGsIqdXDJjKYv4mrsSFenMnO3LCg
         ZILJUOTEb5ihRRzcTNB/V3xe6+0VqBJZrj6hvcJvyVKcYaeDTYaZ73zEEE9riUTdZ4Ky
         31F3CWAulPrh3EQBn5AgV1xZtpIGzrF5Uc81w5h7ISIZOwO5/e+SYezR7hEArI7WLpXy
         RtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755269; x=1738360069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJeDvmYfwTrdzYlRuhgm/ygX8U3uOitNLlW6Q4NvxDE=;
        b=e7+9yiXtdgIf/X3LVf+KtH2Zl8XKGxQIMsfFBpobvb7hENgUowrKZxio8SyIUtn4dF
         1xTH7XUVgXh0OaqsXSxEBQavjJ/pkZt7aKGIwAGV50mxOJPpTuBtpcad+nRrkc6Qmva0
         g5QDMZ2hpeae60IEF+zFjcfjnqzRGAlaYuJlu9MLLObHKO8vTuv8jMtfUoE9qJP3G7bw
         fH3Ysl9M8BYcggLBza3cyvVXDh/y94K5FDkMGu66AsdZ3S+f67bxQjRbiD3NQk+vE8+T
         LolWnF5iVT+Ontq8Bfm5f0xN+sAVBJp490GxalwKhw7rPVehDpQaDiIYd6hnbVDe2T0a
         PKDw==
X-Forwarded-Encrypted: i=1; AJvYcCXev+6JDBjPcOYsjjD5ANynCxOcTAOOeO46+BUKIZVub8pWU0v3Tld4ol65PAjucmZIRCKRXmJY+tMabzEH@vger.kernel.org
X-Gm-Message-State: AOJu0YyD4xg17SjN4PVO4bOl3jNX+dd7l0a3O0yCRVWt9DELOqhfEHaP
	bl6gdzg5cptrXLh2SgV/4ZrZLB7yv3ArxBXD7QXc/9fwuf0SvqnYuZcYCWJM498=
X-Gm-Gg: ASbGncsuWSn/R0EoaJsCfJD1EJ5/VMqmxDPVGJwsAyFrP+cv4/bPGIRTYRHnE+airHg
	+gzoqjueUdV6z56d8K55wLWzvgMgp8L2AevXj7Yjuis4HVeRy5PJW/52qcQhCdrxlcC7tt/JsQE
	kjDoyAd9e8F5HRqLr1t7u5CpTmmnrXoJ3sDKp3fmmbWWeq9i7sv2OhKLAT7W8n6L9RLvPUuc7z/
	pvm1bdMz7+DdESCUAHkzzijymcl2pNqII5n6GTBB8cJKifQR8Drxg5/uWGVjbpGaW+nb7CPAcbV
	C3dZmgudVk0L
X-Google-Smtp-Source: AGHT+IGJDQ9mSugKQZZ3KeFdwIuuaaqj2SllE9hV97+PVfAvcbglZCBMGD3C20lS0dPX4nkJyJimsQ==
X-Received: by 2002:a05:6512:3e28:b0:540:1f7d:8b9c with SMTP id 2adb3069b0e04-5439c286bbdmr12191243e87.45.1737755269106;
        Fri, 24 Jan 2025 13:47:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:41 +0200
Subject: [PATCH v6 1/7] drm/msm/hdmi: switch to atomic bridge callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-1-1592632327f7@linaro.org>
References: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
In-Reply-To: <20250124-bridge-hdmi-connector-v6-0-1592632327f7@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnlAp/CPIUj4LeEmIPRORlPDyZcs3XDPvrjZ11L
 /nuK2A19+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5QKfwAKCRCLPIo+Aiko
 1TDNB/9NOcxhekHC4IsoI7M3QERK0DG9Vnm0SR5ncGHN/OUyl5B0J9eIJPes/ZrryYDnvsOHr8t
 NxyEH+6stBInVmV1huGI/REL1IWnJvm8mO9xhgCiXr7PZDlmt2r4FIkJ1xM0p0kc4TKph7+G+S/
 PTpxS3hRcz9TQezjn0McN9oGURK71gvevdY7KeJTTJfrx+/KtGp62sEcLxjDNS44gxyJDyQory7
 VsZ0eXltI5K49TZs9waOwWinp9cYCxzlodypi8UJq2MBSvKDLdKym8UESfZ+bIL5s0rcoPgEIuR
 mivCOoVb8H0WbavKHR+362v/B8EDAA1tDpeFM8OGYFFkkGwL
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



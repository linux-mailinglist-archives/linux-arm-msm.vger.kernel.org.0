Return-Path: <linux-arm-msm+bounces-47214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A29AA2D200
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 01:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FEC73AB585
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 00:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B407143748;
	Sat,  8 Feb 2025 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oKd9V58P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E813B7A3
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 00:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974439; cv=none; b=pS4+l2LujoYV/4jBjH6W7VIsC906x28eYo+YvwJi/mH92AFzL5FQAouZppLRw0kOlUi77GcE/YehWFpt3MepF+PBCdIRssti/53CognLLR4jq5KNKDGP+tLPaA7VQmALw616wIgoXbEyEvcFQz8Wh/v/mndJCb57aP2hHFrjMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974439; c=relaxed/simple;
	bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmRsHiDlBmMN86p4DjzV+Bk5rowy5xGW59tf09quWVsVBzcyVdV7jthHfz+dMFYiK270zSyT8VZhWH8MKf+o/FXrpN/i01Waiuctv/HXLjNyQ0J/SgewvZ8Xlc9Y+4TAqomJ2gM9DcP6ulN4qHjHeLyQj3A1hYqrDVRhYc7sfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oKd9V58P; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54450213957so1457287e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 16:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738974435; x=1739579235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
        b=oKd9V58PFMbmEB77hjN4QCI3lZZ5FxmsD96l8VsLhamJUovz9zFazgqAEESFALEClS
         XHx7AWKvskUJA7vM6SbQZP7iwZRhsPw18q2MF/kWKV54j5DI7z0YvSUjFCVEmoob4R5N
         KtnnycM8FeIrZ7sQZ5Qwmnn356/ITskAFcv5uptjx9i77kO2gUOjUgOQJV8j1QtK8Z2P
         C6ZsywST6FHdNXwUPXA2/dceN+YoaxUG3XYlYZmNXFi7F4XfPE14sKKAdPZFPSbhiSSI
         r91MPRP2wUG6lTWm5HOVaIcDJ4kAEWSSHjd/BOrDrao0HSIp5owjtLkDBjq4J1pJ132l
         Xhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738974435; x=1739579235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
        b=oTpirIeBTHuoNzdUcWA409zzlLii95zD9nhxi2zULhFHyQWHS4mnS0Sg8g3NcmRyX6
         9kZuAEn+QvxJqncUijYxrLnmUq3jMTGc9MdHaObJY7X78XHvmyHQIvV5gDWqb0c0MFDg
         zO3mgmOXiNQRH2kETl9fO1PAH/mpTvNfmJHSm17XzgL1Qx10ST+GeZ7cCPUmR6MBL7Fb
         wTOn7WZfQg4MpDkiPnCWocJc03KVgi7fZnY+wFncp8YLjWHhYaX4uaLk3Hj/zHUM9CTO
         yXQSrkeqGvl5P1gl1u7lc7V7aCanvPI2DVZZIToIeyWp6e2RLmNhPt1pqn65cl8ru5vr
         oWiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgOLFb6CQ55ZyUdu+ok/Bj946MwFTT3magQ9xZij0+sONqWkISsQOqpvPj1W4X/1/yX40717Dvt1FiMqF9@vger.kernel.org
X-Gm-Message-State: AOJu0YwfxNOHCOZtwjXjZ4n8c1vAy1t3dUMFUrmmW44HMZPSvFeRye3G
	qZOJ1r0fKSSYSVOJ3r81aaHABxYgCPuyjVqfiReJOfgngGg5eWQlifeOJSRRCeg=
X-Gm-Gg: ASbGncu7v5UBYg9e3vpClnSphZV36hRvld1V4F6PrFG1cJO02Zv2Il6UZZqQ18XnLq6
	gTy4bcKWeN/QdWRQeKWGBM6IUaU29jBl5257pTGMJajachkBmYuTYskNWLvB9xqd3e0xVmr/mbv
	EVnWOuQKtyDK21uNdkMXHve4ej8M7GfmkeRkCpkF1lg76+wNBAU1RqmniBli8O/IdE38Gt4NyXN
	NTx8pI2uCvjS/nxuK6kp60gXlVmJiUWDzHRwxHLeQOMd7S7VDgeZD8wr1NotvhFRg7ytuRMuyH5
	PiJR3B/78iEbI/yLBH6lTHI=
X-Google-Smtp-Source: AGHT+IE0HRYadLgRlFKRYvwewdKyRJrqdIwef+bzOoB0eCBwvioFcB13g7Pms7VdBytcIFx7GOh01w==
X-Received: by 2002:a05:6512:36c2:b0:543:baa3:87a9 with SMTP id 2adb3069b0e04-54414ae62a8mr1280181e87.49.1738974435149;
        Fri, 07 Feb 2025 16:27:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 16:27:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:03 +0200
Subject: [PATCH v7 4/7] drm/msm/hdmi: get rid of hdmi_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-4-0c3837f00258@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTVhekXNgRhbLo/MXTHBp+Ns1DBrCTeoHx8m
 2qQDmR13leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1WDCCACfkXHtGNmUhx68GPVqzQoQbhU68C4O524tof04eeulXgnYHBmCdk5Vi4r5ynnRCpdLuge
 kCIECZgv5ymAymrGv8LjSUSNWI0RjujMmltE9uANd4IhKtseKx7rhd5F+/bxDRH8ZgDhqSa7zSV
 QM6VNcw9csfYsqDu2dVfUc9uIIDAb7Pv4ILiWv5txe/G0AsB18djO2MD4zsQrYSgsM4Kops3ZZq
 2Oz+MvRFEMirCLf3/uhgsrqAz/hMh88zbi9yZUUty0OQ4rQx+nOHMwYX83xjjWgH8kr+u1nNDxZ
 2oDOdbC6xcILj3Vp9d0p9uTRarqCMygGrzhfA9j8csBcUHzs
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 17 +++--------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b14205cb9e977edd0d849e0eafe9b69c0da594bd..6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 8faad8440cf70f792da353978b990861b0677ed8..cdd3bd4f37831f9a606a4c3627a48364f5d4025f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4f8e4ffdb2e058ecf243bb319c12c444cb2e5200..15ab0858105328c2f774ec1f79423614bbbaeb41 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -232,7 +232,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode)
+		if (connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 	}
 
@@ -264,7 +264,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
-		if (hdmi->hdmi_mode)
+		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
@@ -320,7 +320,7 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
 
-	if (hdmi->hdmi_mode)
+	if (hdmi->connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);
 }
 
@@ -339,17 +339,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.5



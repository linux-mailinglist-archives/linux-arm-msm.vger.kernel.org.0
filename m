Return-Path: <linux-arm-msm+bounces-13744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA0877067
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 11:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684261C20D24
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 10:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35B95C8B;
	Sat,  9 Mar 2024 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tu1gU/CP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1567134BC
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980302; cv=none; b=cKT2EmRPSBinoQDG/igp6j8/1cWdg5kjzU9HxA3m5rax5vmT78zllB2FCL1Th0x+P6mbKy9rYki4yuQLLv5CMwrwbxAtQwRd2xcy+dHXvgeRoqYSE/J/a2ER/OzOfyaFO8UQg+/+yP924xmDUJbMmzQVUm5B6UPyNHaMzFBH6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980302; c=relaxed/simple;
	bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0jaOFSaSpG5y8vJFBKa4l4yZTmOYSUb71Mmqfzx4eRB7BzdMnkSBrk1drOGbQ/lUgvu8a8eJ6fcGDEhwc5AV5sK8omyZKc6ZDQMU6a9V5XE0fH4mYRGesNv2GVjxeoQlj2tOESUH9fFXoYM/3l1qOYOxi9Rj5x//k3IOshSdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tu1gU/CP; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d2505352e6so38741691fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 02:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709980299; x=1710585099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
        b=Tu1gU/CP4V/fydl+hJCxVU3w2QcibdQtSai0raJDsvuUeOLcQAAY383qAHtvgvlTqH
         wYiLWBjddQ6KCAsQbAO6c0eIhzVCOPFeal4l/sOTn+XXw/s1C1umVJiu1YAMKiiT+DEP
         Ouv5DWmAWF6NZQW47/Ul49j8jV9b0E63lkbYvzGih2mTiygRVKST6vSahl+M1TZT3Sol
         ApxkT4pp69dE7C35JXgfxc+IF7Y5ATnOlloUNI6EexFTtasJaAQ6K7KCDurmxqKv9i8g
         WTeAfIUBdt4nSIJUuRKqDy5UqUzQP3QGTUymmwg4luJlePEpJd+1SdtHnsRsO+dDl+JF
         ONpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709980299; x=1710585099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSCLgDYohNznRCwnS8tfo5EB4gMkp+kuVZWS1xIx1Q0=;
        b=TatijOczE9QJ05RoM8gccqGVSgTm85h6HO6Kdm+H9nW7mwHh8hWN09uup4jgXErMU7
         lzRmHFOoMNhj/PCOC+QVZ7QbjavrU2WM5J1phsq3ipFH0gZBlKYnnMW48AotXf5VvSne
         7LsHBtEgQfh8iFlVY9fP8LyASrMllayoN9mUELdhTPE19Scx/uEgPsO0P4nsQAU07uAJ
         JVGGd2AW/kcu+sqBKs8GNuv6iGpqDfnoYOyCdOU9sNhKQYCZoL5yaHf4Rc4FMOH5t1CO
         GKvnTfcNE4BUwaeaVJvouKxyND8W8QDX2mchBfmUq0uG6uO8jcAlfBjVADFOvIi3XTJz
         aMjw==
X-Forwarded-Encrypted: i=1; AJvYcCVikXw8Q343AY5IO1b04PP2bqZJ3M75tJE0iI243Ns8FpypMoo45RPPFDPMy0YCE6MlDUYD/BfLxUImsEJyVX0z462dICXG2zNKkBe6qg==
X-Gm-Message-State: AOJu0YxvLXWwSgvZiqhOlgBZBOhhLGaXPTTYetglwIBNmRx/kB8Trejw
	VOoVR5hnIw1D8p5nvhU+TghHFB7FYct/xnhE2a7hRCZ7p5eiW8v9GUwxvh129ZM=
X-Google-Smtp-Source: AGHT+IFYa94bngGFzQOCUhe0OG7K+D07/qG54fBuSnLETIBSl6pH9ixQUJZwS83iaWnnsgmtLotQcA==
X-Received: by 2002:a2e:9dc3:0:b0:2d4:299c:cebb with SMTP id x3-20020a2e9dc3000000b002d4299ccebbmr712199ljj.47.1709980299060;
        Sat, 09 Mar 2024 02:31:39 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 02:31:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 12:31:31 +0200
Subject: [PATCH RFC v2 4/5] drm/msm/hdmi: switch to atomic bridge callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-bridge-hdmi-connector-v2-4-1380bea3ee70@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BLTMrmfRiYz+a4tS74ezbT2hZO40I+AiAHfNW/m4HPQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7DqGE6KpSJMtgdjFpsRWlaeLRIWqF1vIFOcRN
 I9e4hcazsSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZew6hgAKCRCLPIo+Aiko
 1cVSB/9Rj3Ikfz0XPJS6p4SkADr8C8YFbP7BIYx7v/y/yt7rd88LFwx74uNziqmBM7gRTPe6NH/
 wwp3QcXhEjaF9Nhi2trwz+5nNKE9l2V/ido9ESa48WyYEwW580ws8hyhbR6HTLJ4KEvzbwCyg9C
 zO68Z6uqN2eo4112kJfHqc7e148nAqQJrIAvveh9147FipL1g2NvVKQW2y48TF9Brdesi3MXR1g
 zTUePwAcG4q8B1wQGSUH+Xanpw8YcIy/x4XdF99K0gE89Dsglko3gy3HdGOFLtbSS9fONuqC3vZ
 pDcoj1ti8obYPA8UaWsG3iJ72vKeYDXtPRUgGgFlRhTSAcap
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



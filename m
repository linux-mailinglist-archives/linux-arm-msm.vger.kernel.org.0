Return-Path: <linux-arm-msm+bounces-49456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891FA45941
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F4B189718A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23F022424E;
	Wed, 26 Feb 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jo16MHpz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8944226D07
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740560383; cv=none; b=S+aLJBdJ02enN0qjpU5P2Pu/rUspN/VoNZm4eY7llXbw9ePXdI7sVOpHlwQV+kJYzTxDbXKeBcJc2oMeg7GraWm0Witg4r0r46VVoihJBcj5LsNvkomvzAOrDa0GuBA/1H5btsio3M7/S6WmVKDs4cq/UKPm4+w/9zjjx6492W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740560383; c=relaxed/simple;
	bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qu16eUlnkO9RUcOpDPspYvhrnqqvKdLKVGRdQnitlGfMpKTmwG5Rrz7UECgBDs6Cjr7fuz2snohwsDap8cdoDJ0Qvt7pcrEVAYJiVcOi5ZdnoFMmb4iZWEa3ImOqGn73mktcswNSALNg55/O1IN1g1Ceno/qp6BncknTilds/+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jo16MHpz; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30a317e4c27so57551321fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740560380; x=1741165180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
        b=jo16MHpzdUxL16cDdqRO3SGa44BhZi6dYfxKyin8rrKwyyL4DSd4nE2e/twZuaRjOo
         U890jQM1AieA9IVPc3aaxA63zxz8j7V3DBHxVUh491u2vd25Cf2g27GQZf4q+00kDGAQ
         fqZ/1fTQbChbQYzu86b3bwoFd2e73/9RIxmLFdSx1VyQ5yzBfV/hB2gXh1z0zAWATGkt
         EBzBFQ/iqpFuWHnMFogPzrsafZ38ekkP6UexZHYtMxT+EeBFpLs3kAyXiTxH2WiyoRcT
         mWcga+vUKnIkRqa3h11nB+8izkDDbRFLg24PS5BmXzW2NmHHx6DTaWfJTqc5t/OlqHVz
         kScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560380; x=1741165180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
        b=JYWPkLKd+4sD3zVRfxanGdk+Qf9D+29WwPRROKBzQi5xzTOHjO7Lq7dtAwtjwnG65D
         1YoTt7KvqJ2PHVNJeISheDnxy+uCHo0tPZSo49XdD7y7MeMD8WSJ9RBPrTvz5ReL5o1S
         y4JTYMsUbVN6uaSI3pwGWbUcVeJUzgspuSRhNYRg2bbogFgY5UELFkkP/zcUWTWgaasE
         IotpZhrVBxZJIa3pr6HsvXLAg1u7XgEv5z0Zy7a8D1B8TUcVMNExAEzJB5xnLYM7xDn0
         91TrjXFQfWt9QV/DGkJBDliZnQUMj43uMvEPGgZ9CW3YtO0v041jFbD7zVcAFiDZzDB/
         ruxg==
X-Forwarded-Encrypted: i=1; AJvYcCWR1wfRDRqL9vaisbV7KXMwM2ZlX6gPZWyERu616ZcJYb5as//EhAbx9eH2xsL2RqMoJF7QuwnEjTl5kMEU@vger.kernel.org
X-Gm-Message-State: AOJu0YwWvzvaJmVHYvGUymkxqsKNhZhWzTHpADtMVISqCly9ue71oqzU
	+ssjkmfxAG5movaglsKaRXHqoNa0b5baAqz7xuxMbGCd+cUI/Gr+uW17LKC/RIo=
X-Gm-Gg: ASbGncs4qQYE9VFkY/x7EhGpAmrFg3n7qirJE3SjJe0TG/13fPDmL5SLc7xURt2y1cv
	mj2NLn14y+ZQtIje1UueRItv4Tv0E35HZyl7NirwfkMdzq0Crv4IvMINkkbIepqsanUK7SSniOQ
	4llI5TEAzIBLY+tcF2NKEk92paigij2l9BlrVeciMnGtoyg2pHJ6tLlEzs/qPtU8RAp6CDyepA4
	TKOVc+JzNunWd5pvABoS8FKkoLF7DXHAgFciDkl0lpNP2ZLpmE7+tQbHw1vEgpHoMhGOclJJ0Ro
	n/UM6grwCa8O8w+kF6LjvW3DKlG9pVT7pQ==
X-Google-Smtp-Source: AGHT+IF1clTdEycrBFNuFTiPE56nj/Flz5qWSUV9kEcLMdvGdwFejTQjfioG3m2nixQNVEMX5BHNDQ==
X-Received: by 2002:a05:6512:3c91:b0:545:c89:2bb4 with SMTP id 2adb3069b0e04-548510d80afmr4432612e87.23.1740560378375;
        Wed, 26 Feb 2025 00:59:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819e0c49sm4556641fa.10.2025.02.26.00.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:59:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Feb 2025 10:59:27 +0200
Subject: [PATCH v8 4/7] drm/msm/hdmi: get rid of hdmi_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-bridge-hdmi-connector-v8-4-340af24b35cc@linaro.org>
References: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
In-Reply-To: <20250226-bridge-hdmi-connector-v8-0-340af24b35cc@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnvtftQ4pILGje/9Xkj/n1/36y5GpKicMEHfYGN
 m5T58jStRmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ77X7QAKCRCLPIo+Aiko
 1Q/9B/4hmyjCKkhj91Fq7PAf6m4xde2HWvAaKLVL1QPupeGrEJlCgwudGfde1fyN0yMWcInl4nx
 QCGccsZGNhICjlioHG/U0aRsXgGL+bXQ1zS/Lcm7YNc6+s5j4VB6iS8dYBvhBY4E44TfoH/dZuF
 oBgI9M2FQEeWB3I20IclPg1Iuf/cSD+aJbsT8VUGCn/NLyKz0T/8LABxNiHrZM6Zh0V2aIvuvoK
 wF1oIrmq9g/j7dnX7QEmQy74om5sivcS6RmSw69+llJIu0jUl3zzQnUXGLywVzZ0SSJhJTS7Ih6
 tfQbLwwBkVEMfkXLa1kXHm1z8mXnyzV5DgbdpFjyX5g9Fl+U
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



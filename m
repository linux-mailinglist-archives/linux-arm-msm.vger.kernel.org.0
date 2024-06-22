Return-Path: <linux-arm-msm+bounces-23728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2FB913694
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E29381F21EF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F7F12FB29;
	Sat, 22 Jun 2024 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zigctDxs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21F612D776
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093752; cv=none; b=abozjAQs+r+ZJQtSPt9HZFlxNoQEDx1uyI8GaOcLoH8GysVywjgDugxxx51kre1Qg+jH+lqzXjfZggq3tTKtYEOB1l8x1RQ9Ws8NqZ6JYAl9mhDEMBQ8Fl7qZOlprW69cvo2qoayXosmotbrmC3ZxorMjie6OFYMYvZkHUuXMl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093752; c=relaxed/simple;
	bh=+t2U1RD/wb4G84+CRNoOtMFGJ3kapYkKIPOtVroW3X8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SyuWAinfLineLNyghnzU/L8xomy3HIzpo+jDH5RfVJjS2Q6AP9zZY52xaw4A8L/dMTN2qxYuWhUR9qlrpjw51EmJa2FbAa45jc4tryQMrP27SAP5R9EDMKjx/Ordr49+oeD2qyXp+ggqk3YZ7iht8C9D/J46LWLw2vJ1dVG2H+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zigctDxs; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so32636771fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093748; x=1719698548; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGHdc8YiA3WTHk5P8vKAyvQjRr5JX9fvWorT4SZVW8k=;
        b=zigctDxsFgeSbB5UVq2zYFm3pb9XYa6GeO8NIgjOqaBmDW/vyZD8Q6wE/nbZ+QgFGP
         pbi5PiEusWKY11mzE4ZLnkxethyB5idx4ppCJsUnnkGcNMFXufeqxA9JCCp+EPV9gVMH
         ZW0wlg84JG4wm+adgCqLOofo/3m1AVguyr7Xz6dcwh5BMIpIqWIitZqSUNUg9J/uf8DW
         DjJWfArULztuBJcz9RdnUyggOpfR3MGAqil1r6YUN9TddYQp4Az/JhOojzEeRWvOGNH9
         G4VOCpllbSpZfN/i7Q7pIoF8Qo9dB/GmwPpiwKMmFqD7feBDXWr0HETH8ztOom1gGj+u
         Bt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093748; x=1719698548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGHdc8YiA3WTHk5P8vKAyvQjRr5JX9fvWorT4SZVW8k=;
        b=G8ax2MmYPqleqW9EHS6jzf571MhAU6DlnqOQ2BDNEMQ30SHqcyrNx8TN2lCt5kuBng
         /dD0zU+GjYLVzYmKsncjmdzO/jMuZz2APGtixKQrzXUDTgD874oZAtYNl+SgK7r4plLa
         ZwkILGr+5E8AGkJIujydt2uwfwd/i52bVUnULH0JI7Qrhs+7IitqVUGzvmRbTELf8+qU
         COcBYJmaZsRlTPUlCgGw1+MMFPBfReaxv8GggIMWcfq9N7Xtu7GI4CDVU8fdFMFipXEU
         y+OlWunEiDfh9M+V2ZpgnAn9lD0z1aVAntcAyGANQuvuKRo7dMqeGjGXLrJM56D4weMv
         LcOQ==
X-Gm-Message-State: AOJu0Yz9iNsYRaATJXVafKzz1iJkzFTfDjIiCHY0kuefVB8IAL6vePEK
	SY23Yej+s5nj5kaPhRZW5ZjmwrsGjjDZgycXNtMrHgAZ8HeG4TDhtjKvDM7ysuQ=
X-Google-Smtp-Source: AGHT+IFdNEvT/KXwtp6byJyVArrLJT0q2zVKjTyW+suLZeO+39QYIbtNWDX5qi9Reqa4HCGgijjkUg==
X-Received: by 2002:a2e:9596:0:b0:2ec:1dfc:45bf with SMTP id 38308e7fff4ca-2ec5b3d496emr4164051fa.42.1719093748156;
        Sat, 22 Jun 2024 15:02:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:26 +0300
Subject: [PATCH v3 13/13] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-13-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4028;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+t2U1RD/wb4G84+CRNoOtMFGJ3kapYkKIPOtVroW3X8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0nquPw6MxmqYJ+vfPQc/Atbn/P9DAqJmmFQt
 Yr+/Lkja2qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6gAKCRCLPIo+Aiko
 1WRqB/0efKfu2G2+t6qny4TOcmCSPhfPu7OOFom+3b421qfQbFXUny/DZ0W1AA8kEu/gH1pBcKb
 /Gws4qXxf9719+rG6htWlLc6pDbh2X5GSLl+Gw2LdNgSGOlsBPgcb+rAULRVP0tinf9SC1kJFsF
 238GTjIRY666bROxfOHEnjuzpRj+zLo9Wfdk48mySvgxvQuN4qBUCwFWTLAQA/a5H3UqbbeyGp6
 04u6qOgMk1JiEGG1tlW8bE9zQ+KEku0p6WGCKqKEnt0ooO3l0WjtDshGualV6i2ay5P0U82l+Jp
 odceYaWBvcqku8OEIZPpnxkiwVAbXMF76xQQMvqutiryQ8Zo
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI driver already has msm_hdmi_hpd_enable() and
msm_hdmi_hpd_disable() functions. Wire them into the
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
dynamically rather than always having HPD events generation enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  4 ++++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
 4 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9f1de4c9ffdf..7621d17b57b8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -201,12 +201,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = msm_hdmi_hpd_enable(hdmi->bridge);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-		goto fail;
-	}
-
 	return 0;
 
 fail:
@@ -352,9 +346,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 		if (priv->hdmi->audio_pdev)
 			platform_device_unregister(priv->hdmi->audio_pdev);
 
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
-
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 9961dae9e9b3..96f2a982c766 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -207,8 +207,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi *hdmi);
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 7bf1c3b379c1..0441d728afc8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -465,6 +465,10 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
+
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
 };
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index cb89e9e2c6ea..04d00b6f36fd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	unsigned long flags;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (WARN_ON(ret))
+		return;
 
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
@@ -99,12 +99,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
-
-	return 0;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi *hdmi)
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
 
 	/* Disable HPD interrupt */

-- 
2.39.2



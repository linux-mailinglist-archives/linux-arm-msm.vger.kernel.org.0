Return-Path: <linux-arm-msm+bounces-23727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1F913693
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DDF1C21ABB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703D412F37B;
	Sat, 22 Jun 2024 22:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3Hjbvol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71B12CDB1
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093751; cv=none; b=NcCgp6dx0txWJNqAWzY2PYOEVPKdg8wszCl6kG/6kH3KInsmKUeyV1BOaficE/AMaF0oUXubFsItxmHkDbTxDvgf/khnPf/EFjDkoOJ3+AvTzsNWKlmqN4HCo0+3m+1oRMQuSSEazRHgQJ0R3x1vapDvgaIrFVzX2JvzCkBpRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093751; c=relaxed/simple;
	bh=e9w+F4AfC0WhIbmyBrInkYJ4EpCvrEa584Hzzbn41wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkG5mCMdDjGWcB7T/MrzZO1tEkl2EwQyQd/nsKCJRqR60ifLOIP8PthVMUKuthW1LJOFbgdXkkbOrR6IyTpM+7cNNgBCCcimeGFmjNzD1oZ9bRmw3ujC9dqJCUGfRiQmJiVLXA84RIjDovHMHUnGzQk2Vxsczng/iHvjol94z+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q3Hjbvol; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso10651011fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093747; x=1719698547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx+JI017WinXbQ5IxwQW21eqYtv0eFPwBD3pRx15tvM=;
        b=q3HjbvolvIXEzGgvTvWmep0j/g/yC+N9EyCqCg64syFefTu1Gw285g2uUhG7pTF+ew
         PkbcWhHeuPwzRySxj6KyqA5LF8uuD6mD+7H6wPjP/2q0oFThSffwMPvGiCHv3XS5EgB3
         BZ8ZWlapixqY84Hw5MHF0y4X221lttnmyk1oVn1IpaL+ZwitXjqP5tRbNhIt++YggUzV
         WkrWtxG/gRp7t5n3z0MX1HrUqQmr3NRfcV/Ux8fWYyvv+9kxmbEJS40vZEDtBNSioKPE
         jAzuc2332RSANfyL+u2WMnUSkZ5AhqoJIP0yHtvstRuJk027N5s/p5cc9kcJzW6Zlc9Q
         Ii+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093747; x=1719698547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yx+JI017WinXbQ5IxwQW21eqYtv0eFPwBD3pRx15tvM=;
        b=GF/NKfMMWWaAQRAryYLHonArEPx163U/rx6A61p1sNBNPyon2kHwu4bpE/PQTgR8LC
         cfs9kELCxu1ti8P89ILDNQlGRxw2Jodr76P5YPO3uRerljMVqDNamcyLm8g+hUfvIzt2
         CznfDXZxKw0259Nl+0AsgMBZLXO4sDybjenRtWEk4fVraZl813/jre5Aphy6burR96Dv
         3aKNkc9J3Wq824PDOxF+0A66Pveo8alTyV9me5mI+u4eLuc8tBn4Xxfb9A2QE6gh9RN6
         Cj55ux+ppICtIKMjX05AiqMg+9VqlE31IGYdKXUeCm5xnFTAZEd7H3vsZqxkH0CH2429
         w/yA==
X-Gm-Message-State: AOJu0YxtXu1j8ULI5/GPwotX9JPX1fPfaVebAefdiXvA9vwwRhZoLqWd
	qnfC5WPue9CzKloTcXfQDwnK8Nwpti+yZAvbgBGcjKxsto+/7nohTwwUTvDVp6U=
X-Google-Smtp-Source: AGHT+IECgjKIiTyRvwZJCRLLvKjR/DBRsJBoyU/RXQ90jopy3B6oRVzRtd9sHMtVwYMsadrxrC4ibw==
X-Received: by 2002:a2e:8011:0:b0:2ec:165a:2254 with SMTP id 38308e7fff4ca-2ec5b3077c0mr3541661fa.44.1719093747447;
        Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:25 +0300
Subject: [PATCH v3 12/13] drm/msm/hdmi: ensure that HDMI is up if HPD is
 requested
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-12-8645a64cbd63@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e9w+F4AfC0WhIbmyBrInkYJ4EpCvrEa584Hzzbn41wE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npUzi13UHgxCGRdtwhPdIm+QR0wlzt4HJH8
 X2QpYkRZPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1XSlB/9FpKQBBnW2K+qy6NxMi02ycBFGVFlHaocEuj+Vwulnc7iQESd4/vrNdFCM9Mfh9JRn3KC
 RnAhzomMC/CgLbFo24+HPl+F5Gvd1MhOMOGxRWPE9T/sprrNdfSlldUUuT2PuZh0IPrWuMb+Jtx
 3kE/nDwH8wBRnSeEfKqvXLEn6QTUWwFX9tc2N3AXPnKogBzBGbpurwUMzK03FniUjJmCPC5Myla
 vC+avuJGU9G0mwXJrBr1AWVxuquUVoYZL8wbOMXxi6X5sTunbmFkHmY0Bnp9C/tH0lQqPg2gsB2
 skILo/o85KvqLKQJHMCTjPQ1vCKyYCv+PPF0WRxGtcRSj95O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 97faa7d26cc9..9f1de4c9ffdf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -384,6 +384,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 6faf4397ed58..9961dae9e9b3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -42,6 +42,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index c15c49c08d30..7bf1c3b379c1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -308,11 +308,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
@@ -337,7 +339,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -346,6 +351,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		hdmi->power_on = false;
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d3353c6148ed..cb89e9e2c6ea 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -73,10 +73,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -106,7 +110,10 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }

-- 
2.39.2



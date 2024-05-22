Return-Path: <linux-arm-msm+bounces-20203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92C8CBFB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06C09B22C9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18AD82495;
	Wed, 22 May 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcrFIY3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A8484D3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375071; cv=none; b=tRtSwkEUf5wJCJVY3YP/ZCQCKBhyu7/sx/0oqGjxWPM+CZoOOpHs6Xxr9y5xZC2Y7gSJLtwhTQ8KTaTtrJn0Le3g1aYltKlfDOwj8Ym+fPquDCsYZwd5cxPFOzHV1CIB75IntxgNjMbDjIN8NeHfjypEtYUbbmzvkAboV6r57NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375071; c=relaxed/simple;
	bh=fN+A3/6vCyYk379OydAiduI6v5ThmuLGAylNRut8Q0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbHwyGZuHi0D7lkmc6NZhdLV6mU36laJvf39Nl+Xcpb018r6iaZAqI7iJWXdUD6HTNs92YKBorD3gjmDlHFwvcM/ZK+PVsGBuP1HfGn38f2TRAzEO49Ydz6u4aVCRFGxqRZ/Lwkr+nTszLmEYhbm9sIW6Wp+fmC5Ik01rAoK804=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcrFIY3b; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5206a5854adso5464150e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375068; x=1716979868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQt039iK/MLUHKrg6kdB48KBLBfk/G02HtDymVf9/cs=;
        b=lcrFIY3bS3ZxBTvyycSzuQE6zBdzZEytlpFNNw/FUjrRDXBTedjg9GOLQnrp3vvvmU
         rRXcX8gNAPJWktAjCKViKW2arA4o59tx0XvJ4sqgoK7lKw/Qn9K0e80/9fjgRbF86YA+
         hn4uLo0XoLZveeRCnrRzb1LiLnOC2M7uj8kZasip5h8fxzkdaQSKToADl4Vg9SvGSNzr
         y+1UTzL1sEG05dR7CukUFPIxuz4rxIyuzpt8p1jvgB0UP+8+hk5iVlOyE+sNO2mBC9Ap
         sxIatAdnyllrry0er9bCJyw4ckrgklO+QCQXiO2+St3iLg+RhKhUSIN4yu4S1A6zuIMP
         FBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375068; x=1716979868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQt039iK/MLUHKrg6kdB48KBLBfk/G02HtDymVf9/cs=;
        b=bT/ioFjRFH7pFa58xs455e698f1yo7bZbo5Vj6RH8qRVRA2S8nPxRwpvK1HEtM8yxY
         Oeqejjw/K35ZPmGRPLygN2628Urin9EcoUrcqbhFlCkgCl3JYcGmhdviOFSSQJ3Y2hI7
         3iNXSEaEUtRDyhObcQ4+tZjjGCFqrWQTJLfgR2Up8Kjg5hsF6Ms1rnf/SOM9TXxD8wSU
         PTCQGTZfkoJeIIMX+1BzVxsZiewJktx/8A/o2MRFG10dOGCTH9NaHJqyIUrg4M3ILX51
         IbID5NOHfNxMx9DJDmi97kAmkEBN2vkUM6kDWPe77eJT/xZoOV78WuPSYsdTNXJxqYNi
         3GVA==
X-Gm-Message-State: AOJu0Ywxkzdt9WFyLgRJYtDmfehZAkRlYB5OXydC1xPff4e5f1Y749/W
	/JTiIohuNsIF2FDRZdAgt0IVhurgGgCbyuuNvHfP/C8QrMohl4YMr5t+xmg/sFg=
X-Google-Smtp-Source: AGHT+IE19pPXGyC8uaae6hqcH2EPzGBxyhrTv79BSBeUBvyS8uz/EAWUerDg6ffy+uQkeB6O0oM3xw==
X-Received: by 2002:a05:6512:3707:b0:523:d1ba:6431 with SMTP id 2adb3069b0e04-526bfcf72d6mr829466e87.66.1716375068296;
        Wed, 22 May 2024 03:51:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:51:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:51:05 +0300
Subject: [PATCH v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3672;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fN+A3/6vCyYk379OydAiduI6v5ThmuLGAylNRut8Q0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4RpzFy/RBa6wu+q9FeHDiKrwkox2DFhaeHF
 4v2WsPp4GaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3OEQAKCRCLPIo+Aiko
 1Vh7B/95PEKsWeIEL8mDIfKMXBJryYqmCBX/RF1wUhr6eSzA/642guxhiuaaYf6UpvEodW9nitX
 B5kvWRDkiDFyZy65fYhKFZ+9HIC8VZdpA6iR4/OHYwrV8FuvaljFy1tvDz9VvpkfCgYxN/HfTvc
 dflfpD25FK19tPRsaer+FbKMFcNqYmLpo6ta5ZrNMw2LPHsPAPfW8JBNOBgzw2USJZ59EOqNAR8
 XeJteZAPLcLS5o0EUrRYn5ob0Z1oCVT8Ksa26Q6HZSKEXedF/V20TD4ByYIkW4CHQHCnM8MJx+G
 hSkEKjEqMj5dmZ+WNiuSzZHnvnwFadD6TI4pJFEh+6T2uBLZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index a9437054c015..2890196857f8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -409,6 +409,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 268ff8604423..7f0ca5252018 100644
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
index cddba640d292..104107ed47d0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -117,11 +117,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	DBG("power up");
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	if (hdmi->hdmi_mode) {
 		msm_hdmi_config_avi_infoframe(hdmi);
@@ -147,7 +149,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -158,6 +163,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
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



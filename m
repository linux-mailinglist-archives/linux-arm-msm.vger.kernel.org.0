Return-Path: <linux-arm-msm+bounces-46112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A8A1BE10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 22:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8713188D8B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 21:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40C11EEA45;
	Fri, 24 Jan 2025 21:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oYrz/4wQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0084D1EE7CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 21:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737755278; cv=none; b=NmtV1Sq/i9JfjO9CZ0CsNl1n5GtIlJMn6KU07tOlJR6sgHCqxHyO6GftCu+ZlN9lQHLdAkKeDAMqazaRc/LHkqKHKd33ol3emVO8OTYPLMVYJUt6OKT/jeS9DJL4ouklUJzLLGpeCZoMcFa/aWzwlrQK/kS7lvCGptlnlJRemfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737755278; c=relaxed/simple;
	bh=aou3NZ2IsnAD5iGdPhnxU9pcbpVRM8SciayIVBJPtQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gM1sdjoUlN9+1+VHLOnGsja/Y9raAk/WIbfLYWLHy8gSwfXAwdDucXzr0Hj8p6pKX7FWrxXdF7g7uj+AlqWZplltvHMyTD10wvqXFiZuIvf9QVnSfmaW7e656dzNXKTP3AWCAWnLuQ6V+lFFBM2scnA/J/4BSJJaZyfpuUjl0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oYrz/4wQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53f757134cdso2938631e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 13:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737755274; x=1738360074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlR9NecrQCHXfPm/fpyP+/Z9eRiAzSSG5PW1LZdxCBM=;
        b=oYrz/4wQLHpQND0oJ1bXklDueEnvj/brcA87U89Jyuf8Ttifp8zVe2N9zvUaa9oL/q
         TIz66Nx8LyTIleeIiNvpJOT0n0VuqofyFn/4Pmc6eodtVN2CM4tx7ZMC+jUygGpPKFAZ
         XkFKNzqgPQZkN77P2ATrPw/yjmfmPpxngfOzAMsbcG2EAIB1rhUwqewfKBFl20j99RnM
         iYY/VIkfOnazFCFYPA4V7Wpl98TPM8iB/pgepZXtYZll+Tv3f+8A77hPQmsCw7eo5ETV
         /5aD5Os/MZFOmZ9s6ElOarw713L646img970lF9UeDTDQeePW0IURM8ABxO7oe1C3jOA
         2Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737755274; x=1738360074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlR9NecrQCHXfPm/fpyP+/Z9eRiAzSSG5PW1LZdxCBM=;
        b=H95un51/rPlC887HipDToR8SOSKY+W0oe6l/EXGwhVYRZBn5zjjpNeAwTxOd9Ubw6i
         sHSg1MqeOd8JZMdkexAqillrLYh1EYU6dFMcc8B+73/v89DasfVp+w/r+wQ+vlJ0OKk7
         m31AMqlC3OJIAeZhDeGO3wwqGS90kVC46MFbjdD8qh6j3LuMCufEBUOViiI7es0R0BSm
         wdJMuNO4cZug9JEMq048ITvj2BXtY0W5UT0cSTOv7wL0O3rQkFdLc2eOy6MNoZ5QN/0F
         sNYZBDXJVPuIHDWO2FikdpqYFJ/Z4UfZjtZqU3gbS2wA2Op6CDHXiWtt8vzG6zdgNwUA
         tSuw==
X-Forwarded-Encrypted: i=1; AJvYcCX647zUplQWm9JxkGu7OfCIvQ7UoJXhXfpy7uyH+953aE0BJ4Tapkd6L89dsksEUNEs/2SQztVRK97IXEQG@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEB37BpVbGKGHCUZHZa0eYnIOQ6SQw8kYi9ysAUXYKKcyCIhF
	GMZ0w8ciXB91pK/3BkZHpJSoO8oSwXSNs3Ud9q04A7Z4++Zar4G6fu8ySMtDVPk=
X-Gm-Gg: ASbGncsqGiPPz9jgN8kjL9mWb+BU2cy7NOGblbZ6uKPfRjmO58mKF9dRuFeTbXHjSso
	8al9Obbt+lp9ijd+LpXLdHESwj6Xp+HlUlLiv1Eytirl6aNY4nLkVGQvRXS/6py6gbS03fNnnVa
	o2hxB/5EtGS9vzL9gBi97rKLznWuM7DXBiz4vZOgokeOszllslwqxZ5sjgfIJbS7s6OD278S6hQ
	BX7fr30ouRCs/J6SUp+UIOgTVHJDkj5NBKYhILRV8XSXy40NNolW8VSZ7+Zzh2Lu/tW166THHiv
	vy0kx9Hy+8/l
X-Google-Smtp-Source: AGHT+IGXL+mj9oYDRst1LN9GviPtKEUadsXKdC3ORUDf96ArRikq4g85LQu+uRln0PDevFa/gzjLMA==
X-Received: by 2002:a05:6512:281c:b0:542:2ef4:4884 with SMTP id 2adb3069b0e04-5439c224ab8mr11127686e87.19.1737755273958;
        Fri, 24 Jan 2025 13:47:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8237491sm425014e87.104.2025.01.24.13.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 13:47:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 23:47:44 +0200
Subject: [PATCH v6 4/7] drm/msm/hdmi: get rid of hdmi_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-bridge-hdmi-connector-v6-4-1592632327f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aou3NZ2IsnAD5iGdPhnxU9pcbpVRM8SciayIVBJPtQw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/oUrgbxWJ55MZdkS9mnekqdLJHVbzTZveFtmTCLsqCqW
 aRXgGsnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbSd5SDYYH05YleLerx68uc
 rGSavuRH8H3hNTjz6f+BcO5bOnt8FMs2CC9nvvJo9V+PN6UXEy+y+vx45cMiJHdXw231FinJQ//
 Pvf28Mvana49Sv8YZzxWF29S8tqktdbo48f7W1wcOi/vVfo3c9nVR1/bMfS3OEV/y6oLerNfRj+
 DKO9wz5cfcOQ8iCg57267yWlYmUV6nLTbj05bFm2eabNnWr5tervRhZnvcEw4+O46Dj5PO5rw42
 7HvX4awX3iUSHR/lHLY0awM5g1GZtHTkw+uldlzqeeB2PLW5Q66H65wtRfLfPi4ecbO4hKxcqMZ
 jx1z+yV/PcjVD41rYe3z1JWOF1j1uzcoOf4q8yTlb6rsAA==
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
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 11 -----------
 3 files changed, 1 insertion(+), 14 deletions(-)

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
index 53b52351d0eddf4a5c87a5290016bb53ed4d29f7..ab169b77377097dc22c0c718f65024cb8ad1d317 100644
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
index 168b4104e705e8217f5d7ca5f902d7557c55ae24..d2b25bcd8eb8f5cf4623e11c87ac5eea6e4b363d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -331,17 +331,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
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



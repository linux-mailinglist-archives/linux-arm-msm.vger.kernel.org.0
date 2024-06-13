Return-Path: <linux-arm-msm+bounces-22618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B13907955
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF32E1F24635
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DCC1494DF;
	Thu, 13 Jun 2024 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGpA7Cv3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10EB14A0B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298319; cv=none; b=SSkIzSB2MRzlrzGlWBMvlypnIHaYLG8/ej1EVC0kl4bikl2ltozkbODz0IYlazaD/8IF/4RdNJmLQ0v5PcsJ85QK/1gsmRW5NzrivFdWu7/owmQZDuMdLTVKPAg0+6k1AhK6VIbOIdYKi+dK3NH66hXPdRvhWiGnp+mDEaz6Ptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298319; c=relaxed/simple;
	bh=QUCPmblJLuOJth7ZyUHXw5QYG/4ROl41Z9y5v31PglU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoSnl3OCQm/aMsT5TDHwRQiIJuzRzTtKNd2pTBNXyGPT7GxefPOPbTa4bTXSOfx4AIckjyF0tjYG+y9n7o6YN4uQo6hPV3VyWxuQI3GZ3XGg5qvB/w8fSf4EcxjH6uXd89mlFehURv73WDL7tN7yPGhLH7rr3jzRRvPOsvYw0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZGpA7Cv3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52962423ed8so1562938e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298312; x=1718903112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxfhilPdPb1RXE+S/LuVgqnL996/AiFZGIBEx4qRgKw=;
        b=ZGpA7Cv3F10rPXfuKKyiEhS/ZfkUkQb3+bcea3oLD8M68uav4a+K9aSoRMoroN/TV/
         8Us24MWZr0uiJU/5mUuDu44El8TGpUwD+cRF8uh1DRdvFZelzPHKKINV1A+fNwtv8wSX
         JxOfrTf5+K01c1+2sYiq6xOaDFuu7tatNfQ18SgEv23H5mMdv0dcHfVfvneb8JmGJopl
         XLUUlhlmv6UjlDgj01Yb+N5WjjDIEI8or0ydfVQUBPebpnYL+9J6mcKcnaKUo1R58YT2
         obEm6PnLEFGJpXyH8SEdERPBy3tirvRoYUy/snRdh65MdMLg8uqRbvraTQxMHUPfvrhK
         KG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298312; x=1718903112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxfhilPdPb1RXE+S/LuVgqnL996/AiFZGIBEx4qRgKw=;
        b=maSXLyn9LIel9sEUcFn2Ht37eEBE4jidlgDT2eq+6Se3yDCUsXqA2Fi45cnIMvh2fT
         eCld/tbwjMRWz0v2CwJcOhMqzfpiOj0FY1QbI6Y7XGKTyAIWzS/uGTCFbZe9Mcom6oQ8
         mQr1IbzgtERe7A85itBwZJggyNhbN8X9FDYEdTIbVZMRXqMrYeoS9Cg6yZvWYlIfHRGO
         uJam5we2S+5NW1YdEBQM64Brvzv2w2fYZx45zQx8fXOHG/8VAC8tnwBeM6EZRouiguS9
         07HSoOw71lgA6pnqmrk2YEIMmFNsWWe5gxZXnP4uvL4EImVscMg18MExA7IaAYoCgNPQ
         /jFA==
X-Gm-Message-State: AOJu0Yxqyj9JmVlPzHYXcPSHbuh9DLKU9SA09IbHh85djR3PlONad55O
	LXRerB4MjVCUVKW2KW3AvPRIsDXmSncyIyArN33Jlp4jKjUmlcv+5AP8IIj+L+E=
X-Google-Smtp-Source: AGHT+IEf5wxWTGAi+H2OXcWUzMFlgq68EhRU3vSbXtmfgZ+Fn9MOelVxmGfI8CUyr5IIWCUCpwtrfQ==
X-Received: by 2002:ac2:5227:0:b0:52c:8428:1d32 with SMTP id 2adb3069b0e04-52ca6e6e429mr236455e87.40.1718298312025;
        Thu, 13 Jun 2024 10:05:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:05:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:10 +0300
Subject: [PATCH v2 7/8] drm/msm/dpu: support setting the TE source
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-7-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QUCPmblJLuOJth7ZyUHXw5QYG/4ROl41Z9y5v31PglU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybBgNJopZrFl3W9f3Uix8iVD9Cn/0h0V/H/W
 Q4JhCCmF+uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1cmnB/4vxIQkTqqcPlHS5vscCiQrq401V8LOYwOI6sO0WLfu28SenfTJSbZihQA9d6fEXydnggC
 ojbnQbpArL33k6dN4OXDGNsMrSCNAUtj4HtF4resPlCGAfpIWvPiGWkZcYQsGd23s3mNxTiKUnz
 MK7PP9odFnr2YI8dJIEKyCT8tqYIxoGnbPHKGkOTvihdNAUyebreidNORDgukMwCYTYNjwWZRie
 4ah+pnwaOKadp0zsQ05lx2XLFJVI7+w6ezXYBE94e/CPPiu0Si2/5LwDeNI6TyRxVSgNwAz75gf
 EHPUQJGn/n/W1p6o2F6ajcqWVYZ8AJYGCeTBVChMBOsgPLEk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make the DPU driver use the TE source specified in the DT. If none is
specified, the driver defaults to the first GPIO (mdp_vsync0).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 44 ++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e9991f3756d4..6fcb3cf4a382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -505,6 +505,44 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 		dpu_kms_wait_for_commit_done(kms, crtc);
 }
 
+static const char *dpu_vsync_sources[] = {
+	[DPU_VSYNC_SOURCE_GPIO_0] = "mdp_vsync_p",
+	[DPU_VSYNC_SOURCE_GPIO_1] = "mdp_vsync_s",
+	[DPU_VSYNC_SOURCE_GPIO_2] = "mdp_vsync_e",
+	[DPU_VSYNC_SOURCE_INTF_0] = "mdp_intf0",
+	[DPU_VSYNC_SOURCE_INTF_1] = "mdp_intf1",
+	[DPU_VSYNC_SOURCE_INTF_2] = "mdp_intf2",
+	[DPU_VSYNC_SOURCE_INTF_3] = "mdp_intf3",
+	[DPU_VSYNC_SOURCE_WD_TIMER_0] = "timer0",
+	[DPU_VSYNC_SOURCE_WD_TIMER_1] = "timer1",
+	[DPU_VSYNC_SOURCE_WD_TIMER_2] = "timer2",
+	[DPU_VSYNC_SOURCE_WD_TIMER_3] = "timer3",
+	[DPU_VSYNC_SOURCE_WD_TIMER_4] = "timer4",
+};
+
+static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
+				     struct msm_dsi *dsi)
+{
+	const char *te_source = msm_dsi_get_te_source(dsi);
+	int i;
+
+	if (!te_source) {
+		info->vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		return 0;
+	}
+
+	/* we can not use match_string since dpu_vsync_sources is a sparse array */
+	for (i = 0; i < ARRAY_SIZE(dpu_vsync_sources); i++) {
+		if (dpu_vsync_sources[i] &&
+		    !strcmp(dpu_vsync_sources[i], te_source)) {
+			info->vsync_source = i;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
 				    struct dpu_kms *dpu_kms)
@@ -543,7 +581,11 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
-		info.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
+		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
+		if (rc) {
+			DPU_ERROR("failed to identify TE source for dsi display\n");
+			return rc;
+		}
 
 		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI, &info);
 		if (IS_ERR(encoder)) {

-- 
2.39.2



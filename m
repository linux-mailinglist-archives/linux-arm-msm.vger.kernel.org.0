Return-Path: <linux-arm-msm+bounces-10192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CE84E3A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81AF1B234E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56C97C0A5;
	Thu,  8 Feb 2024 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCP59gsA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76517B3C7
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707404476; cv=none; b=bt0VB8CbeFOJM103MZKwau9KDpQa40fEFzKe49Vrecru/z0r7176OXNPwTUueK5xCxxBdFPkGsRh+fNhKk/wURoBKnjkMF5B4cLWx6f1jlLlvlGHWnwHlGo0rvA3fyqZlcJOQchZqHeDTcK2lItr3Zegblc/5ZAl9RnFjTkju+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707404476; c=relaxed/simple;
	bh=l8WXS3ws5bU0POmatEizYV75CbeDLs5zSep1gpGQJz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWh4RCmbkZnODO2n1B9LUIFHJp++eSm4wSuoDteUBcXU39Rp1SooHOllTZzG4/hD0cyHu82crAmkoBAxlaNpdZIu4uNLAA2xFJdxvHQR3YP9p/vUjk9I9dRoQs9ESFGmuLJd5wSkRQK0dB2wh1RPmo4n8KBKa2yYuvmzxeVWVhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCP59gsA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5114c05806eso2900142e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707404473; x=1708009273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=micFdpjWEfE2iQhufUDk7TfjTaVtXdHcamWR3jJ5CU4=;
        b=ZCP59gsAF3w9VZdSRKBfLOYt+o5tjczGE3Bhxgpf/CTShdTYGs+VAL4cy+uuU0XPyh
         TDb/D3BmvDeykw95ovwlpKdccKbdz6AvLJjjXY0dgOvGhvQSWhWQPXi+PSuWg/sHRZOv
         0Pz/5q4JY6Xix5QindJTINOAobrBQZfcqcn4KhH4n1IaKK8KqRmB21tcD4SJjVY/jzdq
         WcRuDO0R832rQrAr5laJ4UJOlR7++i1Q37DJ0g2olc2BLpmowDeNjcKJBCwE8nKUfOby
         dkmx8oE0hVHELTXTeEhUaaX/9QmLQqb38XV4CdCv4122vW75NlKIg6WGrXXJBgLDflCe
         Yblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707404473; x=1708009273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=micFdpjWEfE2iQhufUDk7TfjTaVtXdHcamWR3jJ5CU4=;
        b=gYqnpQ8Enj+ZlV+1mMsmgigFZShiiZEupIEs9MpmJ0NKS0upbvDYGXg201mdHEYO1f
         zKl7Dfjidblb+uQcr78HVofgP78kgeTfuCKMZNzRXMbMArgwLwAbgzXqYU2D0z//jV4e
         rv1nAovCjg49BspK1+jPSioByXERNlTbfNLDnmqaBxysso7e720od0pKLOMpGH/BRLZV
         JERaC9eKl5QlVYqNkIEs88u81Ky864w19eHUeABkgHXSfp9zXckRTIN4suaeWRBRyi9d
         TYR7l9hOqknS9HZafjftssWhUctr0Lf/vucHWoqhPSrvAg7FHqMdV/CXw7K0SsdUpflh
         7A/g==
X-Gm-Message-State: AOJu0YySAPmobXBO/pcF8MFLyIvx0nfWXs8phJEzAFN5aIZOpEvRJW1n
	h3h7DK+Nxcv+duaGlWC4OfgqeBNGeEKVrHMSWV0cLU6wmDzK+RhCxlvsZdgpIkY=
X-Google-Smtp-Source: AGHT+IEKxPQuiTEdGhUliODLyt4bKlkDiajbJE1Yhvua8o8q9WNLMvK1bFBsNZmn04FP0yj1fhvsgA==
X-Received: by 2002:a05:6512:3e21:b0:511:60ba:a02e with SMTP id i33-20020a0565123e2100b0051160baa02emr6791569lfv.40.1707404472753;
        Thu, 08 Feb 2024 07:01:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXUWfyO+YUwrNmX5OGaP+HqleZPdYsG04Ds7ao0CeWN16bbHuQt3u+aO+Zw/SCkAHi6YQHBMr6BF3JbiHNQrsPzMKJTTshL+0u4rDBRdYPtnL5efQBnazgpDhCExpUH7BigN16hrMXoeJjzsCOdHqucZuF2AxCXJPtfSu1/5rBwDxYGLtynw47Sb/EOFtiYER6Lps3TUjHoFnG6NPvUcd3l+DEyPVgyj+sppMkIJhUvWmahWsfimK/UTiTsJ4B+ESdfz4GCNNo5b+ey5XcpQr8QposgPycipvMd7yUeTqydglqcbgGqqmr4Yu3EEgTw8ODw2ygMHISmyM3Ek2uWyVRI/GfOYzaD7gBcqtX4yerpcH9wx3GPibsCq05J94ceEj7v9XT4suzx4BFx
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x18-20020a19f612000000b00511498107b8sm22444lfe.65.2024.02.08.07.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:01:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:01:10 +0200
Subject: [PATCH v4 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd-migrate-mdp5-v4-3-945d08ef3fa8@linaro.org>
References: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
In-Reply-To: <20240208-fd-migrate-mdp5-v4-0-945d08ef3fa8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <swboyd@chromium.org>, Carl Vanderlip <quic_carlv@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3850;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l8WXS3ws5bU0POmatEizYV75CbeDLs5zSep1gpGQJz8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxOy1s+We5gpCU3SazjAx5Xh8bF6Dy+O/eQgD0
 CopwZ+OHzeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTstQAKCRCLPIo+Aiko
 1Ua4CACsjd27gTUByFMcUJ8n8OTcCFjUb9uZPstAvEqrs4SpLWihGrO1a1tObcml0Qo0mARRxzn
 9Y5ZAIPnolxR0/LzVuQFe1ZA5fpzqUFAi48/aEOBi4PGj/1zGLygX8lNDsp0g07A6F9FLElvxVa
 Cmjk3LLvkLezQEDGkLqQ9w+EQDwdY216C5ee/rU8HyA16vpgBAnTIVvMmcBV7t4qPGdFF7pG8rU
 5o27SeeQTPBMcSAg+16wcIrmPgaDnpVMNcYBRH/ZtEZihdP4hpAYWIuEBmgjYtE5czLunKUW/Pk
 HZFC70zd/MT0triJoZnBYu5TBE1smnpHfqFiYwZUdK4vyIRU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
possible to support this platform via the DPU driver (e.g. to provide
support for DP, multirect, etc). Add a modparam to be able to switch
between these two drivers.

All platforms supported by both drivers are by default handled by the
MDP5 driver. To let them be handled by the DPU driver pass the
`msm.prefer_mdp5=false` kernel param.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  3 +++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  3 +++
 drivers/gpu/drm/msm/msm_drv.c            | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 4 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5de1861f608e..4fab3544e4f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1276,6 +1276,9 @@ static int dpu_dev_probe(struct platform_device *pdev)
 	int irq;
 	int ret = 0;
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, true))
+		return -ENODEV;
+
 	dpu_kms = devm_kzalloc(dev, sizeof(*dpu_kms), GFP_KERNEL);
 	if (!dpu_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0827634664ae..43d05851c54d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -866,6 +866,9 @@ static int mdp5_dev_probe(struct platform_device *pdev)
 
 	DBG("");
 
+	if (!msm_disp_drv_should_bind(&pdev->dev, false))
+		return -ENODEV;
+
 	mdp5_kms = devm_kzalloc(&pdev->dev, sizeof(*mdp5_kms), GFP_KERNEL);
 	if (!mdp5_kms)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 50b65ffc24b1..f79134fc6cc0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
 	return 0;
 }
 
+#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If just a single driver is enabled, use it no matter what */
+	return true;
+}
+#else
+
+static bool prefer_mdp5 = true;
+MODULE_PARM_DESC(prefer_mdp5, "Select whether MDP5 or DPU driver should be preferred");
+module_param(prefer_mdp5, bool, 0444);
+
+/* list all platforms supported by both mdp5 and dpu drivers */
+static const char *const msm_mdp5_dpu_migration[] = {
+	NULL,
+};
+
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
+{
+	/* If it is not an MDP5 device, do not try MDP5 driver */
+	if (!of_device_is_compatible(dev->of_node, "qcom,mdp5"))
+		return dpu_driver;
+
+	/* If it is not in the migration list, use MDP5 */
+	if (!of_device_compatible_match(dev->of_node, msm_mdp5_dpu_migration))
+		return !dpu_driver;
+
+	return prefer_mdp5 ? !dpu_driver : dpu_driver;
+}
+#endif
+
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 01e783130054..762e13e2df74 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -563,5 +563,6 @@ int msm_drv_probe(struct device *dev,
 	struct msm_kms *kms);
 void msm_kms_shutdown(struct platform_device *pdev);
 
+bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
 #endif /* __MSM_DRV_H__ */

-- 
2.39.2



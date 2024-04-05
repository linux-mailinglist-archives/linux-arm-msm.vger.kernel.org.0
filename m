Return-Path: <linux-arm-msm+bounces-16449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6238992A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 02:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 481391F22505
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 00:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B991C02;
	Fri,  5 Apr 2024 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWSRf9VX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977AC5258
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712277652; cv=none; b=RlnY2ejMq6jLYq6732VLg+xjA683UZ6zwb/s3X1kla7WDfeSEipyKMBSSpc2Y+um3ruRTsZoR4ld2YI368WaSqbwZaUgRANJa5j9wFsqwAWGYGePxjigCq3MGClurbANyzUC0TLlLdW7A78ZS0k4X4ivCjFNjHVRbY2NBXv9qig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712277652; c=relaxed/simple;
	bh=XPXdXrTjOEPT97zKNA4t7GgurZ7Lb9Yt+pMMd8rc5bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOcVJw/mNW5XVkyrJlHEpPOC9qaoNiYbZ2NO5lYS3tyAEW27A0+ybspug2OeUsfGVZ/UnnNdtG8453aLt51765l+PxX/E1Jiv8z7w/5/WKZG6joYuQIfs2BcRqaqWB3DQkIYkDVQTcuvFe2AezT9AfwrSdxHjEsxJEOHJhkmlBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWSRf9VX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56dfb52d10cso1766158a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Apr 2024 17:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712277649; x=1712882449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3REBgi3JuRDuCMsWNdowqcAnIk0J6lzWG6s+xeH77s=;
        b=eWSRf9VXTDqGhZXbjx/LWu1NELtDhJaZ/tZcGuGzNxdXsjJnCUFMgD/992ebIEkIfG
         q5jvo40g98D7EV5nFqszqZm0aCuo+aGi0IqmDfSea39FApH0ke2au714D3NsSOVQnAkt
         fJn5TBuoP09pMR1CgVD7nlrk99r/ETzY130XovsoVwsooICi4hFB9gIy7QvRkXKfZyoB
         mRTvpYG6v0mOJ5fnY7c1q4aCPWRztMHER/CIfHVxJmnH9Xg+yWPBz2Pwof42S0pB7g9a
         2FADkQSxhXTinHb+CCKOUXkjbPPyFRTxsiRcb/m/KYeCJ5Fo+5uV0COfcEtFiZzRoZEG
         irng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712277649; x=1712882449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3REBgi3JuRDuCMsWNdowqcAnIk0J6lzWG6s+xeH77s=;
        b=nV0ZW/L+yzv2m/evTAfMX5CmDM0zIBK2F5KxCEl0J3UcteszHFmDkvG/fCnA7sRtur
         zNwADAa+MWWpVxYmJPgDdlV+BCbLiHZvivK4xpOJ97Hb0kf4FuQ2GuoxKu0wNAusVGfF
         1wRZLVOtobcLghTUz9UCBra4SVL7d8q4Uc+kdU/gtc5ybzTwiW74kM5nzcCdgvG5BUd/
         LZ/6uWg/p6g3ZAqkhtV6pDJygIzkF8eJ/5lnHKelZ2ZDzqqYzVh21KjfYknpWsVUQ7/h
         V6Mfg+iiTcuoXvZsozDCHZxmpJ1cHI+5Z9pWnJoKR4GIx2mvk8qQ4yd/2d0xz5Jlch9F
         sEJg==
X-Forwarded-Encrypted: i=1; AJvYcCXe8ztm62b6h1UVvFhLeCsi8qbHV+SA1yzqKO3Spx3WZ8qiEiumSHoqckJ+nbW5MH3KD/VU+5nP3qpdQO8lTp9jAsfiBDPowzjl/C8y8g==
X-Gm-Message-State: AOJu0YzX6A6biDsvsVEPt/oW/CVJDrWZNWbHTiw0XxrjmGh8ILpNJi1a
	jmH5NrBn2vqY8hA6xi9wJKDSH/4wQaYmHvBI3d/cTMnu/ihevAXe
X-Google-Smtp-Source: AGHT+IELmvRp+IwqalVv9cTsF9Fx2bSJPhRTdmTc1z7PoisjDdxAx/roTdsIpTnjhfgtan2UqGOQMA==
X-Received: by 2002:a50:8acc:0:b0:56e:447:1e44 with SMTP id k12-20020a508acc000000b0056e04471e44mr2776154edk.8.1712277648805;
        Thu, 04 Apr 2024 17:40:48 -0700 (PDT)
Received: from kali.localhost ([193.163.72.181])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c617000000b0056c1c4b870asm200418edq.16.2024.04.04.17.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 17:40:48 -0700 (PDT)
From: Kiarash Hajian <kiarash8112hajian@gmail.com>
To: tzimmermann@suse.de
Cc: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	Kiarash Hajian <kiarash8112hajian@gmail.com>
Subject: [PATCH 1/1] drm/msm: request memory region
Date: Thu,  4 Apr 2024 20:39:34 -0400
Message-ID: <20240405004001.120856-2-kiarash8112hajian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405004001.120856-1-kiarash8112hajian@gmail.com>
References: <20240405004001.120856-1-kiarash8112hajian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver's memory regions are currently just ioremap()ed, but not
reserved through a request. That's not a bug, but having the request is
a little more robust.

Implement the region-request through the corresponding managed
devres-function.

Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 +++++
 drivers/gpu/drm/msm/msm_io_utils.c    | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 8bea8ef26f77..05102b0eba50 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1503,6 +1503,11 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
+	if (!devm_request_mem_region(pdev->dev, res->start, resource_size(res), name)) {
+		DRM_DEV_ERROR(&pdev->dev, "Unable to reserve the %s registers\n", name);
+		return ERR_PTR(-EBUSY);
+	}
+
 	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index afedd61c3e28..16f8ae7a74bb 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -59,6 +59,10 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
 	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
 	if (!res)
 		return ERR_PTR(-EINVAL);
+	
+	if (!devm_request_mem_region(pdev->dev, res->start, resource_size(res), name)) {
+		return ERR_PTR(-EBUSY);
+	}
 
 	return devm_ioremap_resource(&pdev->dev, res);
 }
@@ -83,6 +87,12 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	size = resource_size(res);
 
+	if (!devm_request_mem_region(pdev->dev, res->start, size, name)) {
+		if (!quiet)
+			DRM_DEV_ERROR(&pdev->dev, "failed to reserve memory resource: %s\n", name);
+		return ERR_PTR(-EBUSY);
+	}
+
 	ptr = devm_ioremap(&pdev->dev, res->start, size);
 	if (!ptr) {
 		if (!quiet)
-- 
2.43.0



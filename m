Return-Path: <linux-arm-msm+bounces-16543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 411B489A033
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 16:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 723651C20B02
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1D516F26C;
	Fri,  5 Apr 2024 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D82ctpbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2789916D9B3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328709; cv=none; b=QZJknpa31VMb/xz2pomr4SfC9LZ/9R/PZOeCvuB7y/6jYwZ0SB3BAHgtkpH2iVNX2U5Vr0hQjUBlvuvPtwQjqD2NwYfyi+o7/QJLbH4IQKDAZvw50cVjo1iCcL+53KoYaUs5Oz3NJifgp0RXDdNRKxX7K3Ja4EfeG9vMdmwWMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328709; c=relaxed/simple;
	bh=OkiBFY9LGVRcaIFAiHF0D87oObnYnkSol2Rg9fYOOzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTwqmdOQCWiaPiczZ3uJFDah9I1BhGzwg3wIV2C+8xwf30YGeKBi6nHTMWRAyMm8xIO1bEdA/9lX0g22YG0w2Kzj7L14BjjFPjf0wBjbFPkz6d5dwmH3oEeweXcL5UL7hPUniaH00hoUFaE319wGmrcY6hHIsk15gTS0kkIN+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D82ctpbm; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516be63af88so2603126e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Apr 2024 07:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712328706; x=1712933506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4usr5LPxF4C7AQiTvAfZBkIS5UvcfEVCiq15Pgl+GfY=;
        b=D82ctpbmvlN4KwXDanbgwyDr57Oh+NWRECRf4jMLSNDaKcfDe/Zp8DqSXFu7wMpbpz
         IeVSR18xg7SQN+H2Cj+HPHX5OIL/FOm1jsEccREp5QAaLTw8OeGD3F6s1bzQhTRCuhWR
         0TTHSheO3C79gNnlaNKGmEclkH3+MetSRaquVZMtrASeYukU+qI9NYC/J8//KwrC/f/6
         Fy8cx+uWCUf0QxJ2JL1z6H92Oh/YeBVg9V0L3iSV42k29/vBHqA84Dnj+xv2GeIk8lvf
         e2ntBHTItdK/a9BS1EN/X+Rd3xzQa/WeeZ+KQxsBbZw0KmmFhtFAP4sFPD7veOCzJgkR
         YTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328706; x=1712933506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4usr5LPxF4C7AQiTvAfZBkIS5UvcfEVCiq15Pgl+GfY=;
        b=tW0dMzVcA9NA+yTWIsS9YWjFdao0qUfhMwrU+YY8EQFfdYQvVbn7siyGALjMlnbnpq
         +fMkk+wMVqJ53TseP2Q+nAQ4gforWOsIuGxI7dMPkX/BtwIWlYmJ5wYWei7uVjXcttMC
         +L8D5rR00DkB9zuIOmURVA4sLUBMmvOCRvr09CyDJsdsTp9X9VNcEW86gjyKEK3C51UM
         q9GsnRgxy9FFHKBNWpn2piR19j04WudeYwdXCisuhsaDg54Nb8lp8c09Gxr65PWGdm+m
         i7OpyHe9DlXy81Oo7VDFjBQdEm0DOa5KNWWGWNtDW7AfkPlO7WpBbAfXPYhE0CPoSYjn
         hBbA==
X-Forwarded-Encrypted: i=1; AJvYcCXweXw9a5Lr+uRDQ5P6EodxzbgG073NoTUMi+NzplGT3ZyY29He0rM3aKrR7ULNC0gps0q0GmO4RIDk+bOsKBl3FSoTzYN/UIfMsmiv4Q==
X-Gm-Message-State: AOJu0YzXU+pLXyR/ys8eI5mDMu6Z0xbczcHKvyWaCHddJYyb00mCsXiZ
	HSwCbq9/MTCc8pA8Bixhk10OXjcFqhIa530UW1Sbp28WCkebFCnx
X-Google-Smtp-Source: AGHT+IG5u49PydeVcOqUDS5mGka5GtD51PqgEN1ZZbz4Bs9ObeNrAKQdtin3fdgXGoF1By7kxHkziw==
X-Received: by 2002:a05:6512:4c2:b0:515:a530:d570 with SMTP id w2-20020a05651204c200b00515a530d570mr1266478lfq.59.1712328705874;
        Fri, 05 Apr 2024 07:51:45 -0700 (PDT)
Received: from kali.localhost ([193.163.72.181])
        by smtp.gmail.com with ESMTPSA id k14-20020a1709063fce00b00a4e8a47107asm910229ejj.200.2024.04.05.07.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 07:51:45 -0700 (PDT)
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
Date: Fri,  5 Apr 2024 10:50:45 -0400
Message-ID: <20240405145049.9570-2-kiarash8112hajian@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405145049.9570-1-kiarash8112hajian@gmail.com>
References: <20240405145049.9570-1-kiarash8112hajian@gmail.com>
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
index 8bea8ef26f77..17a5ef461406 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1503,6 +1503,11 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
+	if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res), name)) {
+		DRM_DEV_ERROR(&pdev->dev, "Unable to reserve the %s registers\n", name);
+		return ERR_PTR(-EBUSY);
+	}
+
 	ret = ioremap(res->start, resource_size(res));
 	if (!ret) {
 		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
index afedd61c3e28..e236bdda348e 100644
--- a/drivers/gpu/drm/msm/msm_io_utils.c
+++ b/drivers/gpu/drm/msm/msm_io_utils.c
@@ -59,6 +59,10 @@ void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
 	res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
 	if (!res)
 		return ERR_PTR(-EINVAL);
+	
+	if (!devm_request_mem_region(&pdev->dev, res->start, resource_size(res), name)) {
+		return ERR_PTR(-EBUSY);
+	}
 
 	return devm_ioremap_resource(&pdev->dev, res);
 }
@@ -83,6 +87,12 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 
 	size = resource_size(res);
 
+	if (!devm_request_mem_region(&pdev->dev, res->start, size, name)) {
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



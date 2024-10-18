Return-Path: <linux-arm-msm+bounces-34950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5667B9A3D2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8A9B2818E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0D5201001;
	Fri, 18 Oct 2024 11:17:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6961E200CB6;
	Fri, 18 Oct 2024 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250247; cv=none; b=szNqVOVW06fLfR1yElJRO1R2cyZkbfBBkbnAxuRd/TNJgu+mdFIi7iQQaRN48zZXP6X+flumqwnSKAZXUtOt7F+J+ds6rNqBMWxXTbyUM/rmKF2OgA4uVu4fENr39rNPuTPTdZDMVFAVOTt+lgWQyJXhnqqTY4fqxqyVIx5T3ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250247; c=relaxed/simple;
	bh=34Dtxf8ZPj4O5Y7l7kCJE0Gju7y82fqgVDpYl4Kvu3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHz5bMcpq6oXtc29LZ2HaERIGwAZfwUBsdrdTgC0Icth3fvmJa86wKv6fjKlAbVBFQEedSHVERb+ZrRIVWrQr2MPX38Pl1xRMraB5TSISZUs/NCQY7lqrX8RRxTpiOCFWX7dX3eqlL4d4WoKX4tz8vANZLs8+zReh+ev71ASvqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BC27FEC;
	Fri, 18 Oct 2024 04:17:54 -0700 (PDT)
Received: from e129166.arm.com (unknown [10.57.78.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5279A3F58B;
	Fri, 18 Oct 2024 04:17:22 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Cc: robdclark@gmail.com,
	sean@poorly.run,
	konradybcio@kernel.org,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org,
	airlied@gmail.com
Subject: [PATCH] drm/msm/gpu: Check the status of registration to PM QoS
Date: Fri, 18 Oct 2024 12:18:11 +0100
Message-ID: <20241018111811.3534385-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a need to check the returned value of the registration function.
In case of returned error, print that and stop the init process.

Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index ea70c1c32d940..6970b0f7f457c 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -140,6 +140,7 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 {
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	int ret;
 
 	/* We need target support to do devfreq */
 	if (!gpu->funcs->gpu_busy)
@@ -156,8 +157,12 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 
 	mutex_init(&df->lock);
 
-	dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
-			       DEV_PM_QOS_MIN_FREQUENCY, 0);
+	ret = dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
+				     DEV_PM_QOS_MIN_FREQUENCY, 0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize QoS\n");
+		return;
+	}
 
 	msm_devfreq_profile.initial_freq = gpu->fast_rate;
 
-- 
2.46.0



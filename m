Return-Path: <linux-arm-msm+bounces-35986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F49B1692
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 11:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B37282FA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 09:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797C81CBE9E;
	Sat, 26 Oct 2024 09:38:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D996213B294;
	Sat, 26 Oct 2024 09:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729935501; cv=none; b=uEIonnK84qGddoh7FHlIGG6SUmX/u2ZmDjNgigoOyYKGYJV94urML83HRB+IKq9J9RoDsSLFkAqK+aBBiRSCjtAqEskyFeYSdn/vPehPw8qeICQNxPCk+lHU1VF12tZaujc/gh5bg/8kEmNreiBnqRvnSFC61BnvB8GZtF1eGiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729935501; c=relaxed/simple;
	bh=SbrVjULlWqDK47UZO8FGrZoT2F3Ki24Qk9igvFXnQGI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGGaWfnzsaQnMRbyacSXv3yZ2jCYGeS/LPKUVH6tVc/Q7IYpXJXXJvJvz3k7y6i52glp8ctv0mbIAh9WFaxglNTx6Ck4gFdEr/vsy8OfNrsEATRa6i6Ub2hzo3Om7Uzy4sPJxNqStrQ5Zche1IkZOxVOT4/N64RWcJ3hteG0LGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XbDzx4SQ5zpX2D;
	Sat, 26 Oct 2024 17:36:13 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 0374F18005F;
	Sat, 26 Oct 2024 17:38:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 26 Oct
 2024 17:38:09 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <konradybcio@kernel.org>,
	<quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
	<marijn.suijten@somainline.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] drm/msm/gpu: Fix missing error check for dev_pm_qos_add_request()
Date: Sat, 26 Oct 2024 17:37:38 +0800
Message-ID: <20241026093738.523882-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)

dev_pm_qos_add_request() can fail, and it returns -EINVAL in case of
wrong parameters, return -ENOMEM if there's not enough memory to allocate
for data structures, and return -ENODEV if the device has just been
removed from the system. If it fails in msm_devfreq_init(), there is
no point in going on, also call dev_pm_qos_remove_request() in the next
error path is also meaningless

Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index ea70c1c32d94..9a7a18d4335b 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -138,8 +138,9 @@ static bool has_devfreq(struct msm_gpu *gpu)
 
 void msm_devfreq_init(struct msm_gpu *gpu)
 {
-	struct msm_gpu_devfreq *df = &gpu->devfreq;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	struct msm_gpu_devfreq *df = &gpu->devfreq;
+	int ret;
 
 	/* We need target support to do devfreq */
 	if (!gpu->funcs->gpu_busy)
@@ -156,8 +157,10 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 
 	mutex_init(&df->lock);
 
-	dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
-			       DEV_PM_QOS_MIN_FREQUENCY, 0);
+	ret = dev_pm_qos_add_request(&gpu->pdev->dev, &df->boost_freq,
+				     DEV_PM_QOS_MIN_FREQUENCY, 0);
+	if (ret < 0)
+		return;
 
 	msm_devfreq_profile.initial_freq = gpu->fast_rate;
 
-- 
2.34.1



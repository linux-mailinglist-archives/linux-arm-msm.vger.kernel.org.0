Return-Path: <linux-arm-msm+bounces-65800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC5B0B609
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F6757A38E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2F920103A;
	Sun, 20 Jul 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kd4pPR/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD74220F32
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013864; cv=none; b=CprOJUfDPvvLopXX3okecsYGORDFyTwtQwY03Y2Em3b+V9cnvWOTKbwEnLpEnFyPY3QKlukZc/s95kYoDJE+EOExjB2lSMCTuiPkZac6CKZXtMFish111YXcHbClbU88U94lN0pQuYtSi0+UkeQBQBvEJjiiVk4528OmyUJd5iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013864; c=relaxed/simple;
	bh=5WN+YTgGLUAz34bLQCiSFG4GiRXYUb0V+n8R8umq5F4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8dv8f9ljiUpAmcVTZ5m35jZ9ncnWV7tM4pnryuuNreuwPXZ+Ult2hcxT9xQvSE1CbC+P3H8ZtYYuqzM+wcjQX2Nu8yjrfb3cLxUjLZnzcxUFGBXbu2eOWs36Jg6tAGppCqTcMB9ufoY5c/IEiz5XGV5xXG1s1PvzBFAvhWPLuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kd4pPR/f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K9sQBc012991
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIlFhVtMPva9g73WCL+BKRvthw5mdCGh7uZx0QqR8W4=; b=kd4pPR/f41RYCt2A
	36fpS11csKd0GALbhNeiTOLzzqtStFNgYpWDPLd+8ogzwiQMZ+2XYb2TXBsRyBq5
	onch4Nl0zaPgWm3zdwDBJFtnwzKRDWZfNVOOiEU0k0JHTGGSdMhHhQczQyc0K0xi
	AudpxwtxXxjRCYM/cDWjXvbxuzPJiTgUmOsRhXAAIFTAjZe84m/f4n4a207u+LFV
	BOl6CTOb/M0uOl9/TN77SOig04UAUDfO7yU6PIk42KjBO8NXI7l83R6KUyMxChVk
	7pOq/lRC0C1SDBNgMJ10JtMmxmmYhCCW0qkKK6z6dq68S8zwFNKeD3nIjMhpQGYS
	+73bzQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v25k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-75ab147e0f7so1136310b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013843; x=1753618643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIlFhVtMPva9g73WCL+BKRvthw5mdCGh7uZx0QqR8W4=;
        b=XQJt9Q6DIwE7kxJSAKh9yA+xw5ONxKj9ntYG6Kv031oYy/PzePThLe0bqCFyjsZ6dN
         IddwhPE9Z9tfjVrmW5cXhQUIKql5QMu2vXSCGcAnLfs7Chnjr7Ir7ergdCqbV9D+pXwB
         IV7sVzbrZWC2NIRLz8Dxrdt62YEGUYwW3ltUf5LGUcp5NryYKd4Rmtw4zkAfncaKYfEy
         lg8acwO4LLEL2YDUo4drcSbUTGKFRWKYMY1umdD8fmef00Q6HoGVkh9LkeUdYvDaf/zV
         lndsJCREAr6PCpDwvj3qA+1bXEg4USqAGtmHhxs16v705Jibxdk5q7BhSg+tMTTq5R+y
         8x1A==
X-Gm-Message-State: AOJu0Yx8d45qAucEJQq+ELqtvhag9kESvZoKLgLQ7POxxBliIAbExvZx
	QrjbfI9P7CEGnDTKc7DjgkEUdphGTEcasuRme6vAbDcr3XBXIZ/lEw1f64OQ0WUbqwqEcKr8u+r
	zBNdkx2fYiAOk4SUIsai0aisY/u+XgPGnkAFKTniHxQ2tNcsLYJhm4/OVZS45H1lCV9y07WU3vM
	dG
X-Gm-Gg: ASbGncvPsElv8qQePEgly2mxB1xMcTJjfkIhqHQrIqeFxBMlTfCgtxykPXk20OeTi2o
	3COX39vEj4dqcQj0WCttFHz/svPvlvdpDPfM3YLvi/OVqMbrLHTDQyy4xLcKebB80EFCJt19NmV
	KP4ttmMrLpppAWJkVddjzc+NYbQYUmUH043cC52aeWnfWJF823/LY6xLee0Vq7/Ldat2XTw1Uk7
	XaCP3lbV+azq7+HPUZ6R5N0WdaOKvwdGXpUyMDSATt8YHqaqvoIm3ahup2P0ZNjkcnjmtt7zAuu
	SVkBpV1EzuNX7RU7X3Mr3Plyd5rFObmJ5tr2BbXFMgOORSnKqw9apah2kuTeOW5+
X-Received: by 2002:a05:6a00:4fc6:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-756e8774764mr28844383b3a.8.1753013842896;
        Sun, 20 Jul 2025 05:17:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+dff0wC6yk78/zh6Z0LR/Oz7ll4GcPD9J6HRYOPTcKOEyWFjaSRZxIDnJ6zvTBqZdlaH8/Q==
X-Received: by 2002:a05:6a00:4fc6:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-756e8774764mr28844327b3a.8.1753013842347;
        Sun, 20 Jul 2025 05:17:22 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:09 +0530
Subject: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=4178;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5WN+YTgGLUAz34bLQCiSFG4GiRXYUb0V+n8R8umq5F4=;
 b=+HJXVulS9n4IHWq7gCAyvF8Sl8e8EdrE15CFfVY4gzIR6YXtHrApufIpa2k9sllyHyOGepKw2
 nK4O9L1UobtAN3evT91jG2UkGa7aPccuJrR1XGddAnbnPjTKgn2h9kV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: oK_VlNY4G29p_QG6Qn6_3wDuzE8iCiEm
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687cde66 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5Q2Y62x1ezTeZjwjAHsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX9KwbnENcwDaE
 BbuPf7cYse7K3dl7hSPDVIBBi4m4muOXxOiZKp+Rg/fAZZrhdRDXoFEtj0f6p0oEieFr+9CXmew
 pGxkKZpxOiAQ/6no0Sv0/Mq3rf1GhKuF5yFk/tEbLFTeuCJfhM2N/XD4b1D1vznUihTasulR9yB
 OzRy4YyMiVxDQM/6/gDdgt+7JzReH1bY0on+eouVkCQ/P+pgCFO4zqdqVsdXJPvMLD4O3YQzK1m
 33ARDkk12rDNQPTqTeAkrpMuMwUhu1ufSb0ctM4jX+nGR5xN0oZRJe6mh5PLSruDd2+uPu0Jx23
 9bbYnJDCjlMyYuedqyv0N8k9/0bdfkoMU9ZXMAzV3jo9wwxqtbO54vWc7XWeSfOuKhvteAQOnV8
 DD6kn9FQHeN0efI9Ek8H+R4Kl3RWorcOaNgQUK8jeroAGeuAaB1qjEYpwIla1QfvSm4pz3Io
X-Proofpoint-ORIG-GUID: oK_VlNY4G29p_QG6Qn6_3wDuzE8iCiEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=932
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118

Set Keepalive votes at appropriate places to block IFPC power collapse
until we access all the required registers. This is required during gpu
IRQ handling and also during preemption.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
 
 static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
 
 	/*
@@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
 		return;
 
-	/*
-	 * Force the GPU to stay on until after we finish
-	 * collecting information
-	 */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
-
 	DRM_DEV_ERROR(&gpu->pdev->dev,
 		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
 		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
@@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
 	}
 }
 
+static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+
+	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
+	set_keepalive_vote(gpu, true);
+
 	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
 
 	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
@@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
 		a6xx_preempt_irq(gpu);
 
+	set_keepalive_vote(gpu, false);
+
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
 	a6xx_gpu->postamble_enabled = false;
 }
 
+/*
+ * Set preemption keepalive vote. Please note that this vote is different from the one used in
+ * a6xx_irq()
+ */
+static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	if (adreno_has_gmu_wrapper(adreno_gpu))
+		return;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
+}
+
 void a6xx_preempt_irq(struct msm_gpu *gpu)
 {
 	uint32_t status;
@@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
+	set_keepalive_vote(gpu, false);
+
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 
 	/*
@@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
+	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
+	set_keepalive_vote(gpu, true);
+
 	a6xx_fenced_write(a6xx_gpu,
 		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
 		BIT(1), true);

-- 
2.50.1



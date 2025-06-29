Return-Path: <linux-arm-msm+bounces-62950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FDAECD85
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EF6170184
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50A823ABA1;
	Sun, 29 Jun 2025 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7p2+MR1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47B0239090
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206075; cv=none; b=gci0/1mLXVEZuANmm/bJMBQQ30pmlkQSRku3FLvEqH6hMBPOGsKNFSdQcznaB3N+WpGwY+ZiJnKkrLHtxpm/1NguvndIIUi32W5d0qp8LIiOJOT2mV2u7yc3yjSbF2ysvKuT+juyIIUZRZFY9j1lOX/zCrM44wfLJgEvldyH7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206075; c=relaxed/simple;
	bh=hFu0EsxKzuSQGzzTTvNrSL2I+uVbcASFTMQYh05jHrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xd4ndf6uI5VRGiH0UTaOQge4kAjzjMZSpPmo7gy/5k34UkVBf3HYRx0zkK2M58pLJRak1pIjCCMLeBjMLOu6Tiz4TzzesHjnpF8u/bm3/B6+Eltd0txqWy0ZLr2waANmnrQ5rZ5K/ydOJDm79ol+qP4/YoaW5XLdLB8yb52v/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7p2+MR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCIgZO000721
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hadax31kM4+
	sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=; b=G7p2+MR1tEeDzDKPrPTuONNUP9L
	zniDCHXGtc1yGhFtQi6/f+A0mjHa9KRGDipcgix2StQjXvu2K3jqfBPfWwDGLZMa
	k63IE5FIeaa1VYDLcl1OizbMArLJtKEyg88mCWHCp6h001QoUV6lYQ+wUWfsEqC/
	6xkSxNkonSlxF9JR2i3gQdC5AlP89yk016J0Clz1t9faeU7tgKOi4k1fOhiORnpi
	RInMtwKlW75mt9jtpn8mSOcWKqILYUDhFKxKDnuE04+miR8PiqomEF2z/4+nlq1d
	cGTTLKndwWk9yxIsWnb7ymZDJiv5SFRFlhsUJ+K9OlZVEdMkQBJSSmaFfhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm283n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23824a9bc29so21462125ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206070; x=1751810870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hadax31kM4+sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=;
        b=QGcY+bgwuDPkExSg5r+PFkLDdV2CkOBreoHzJHWenEbnGeVRDTxgZz7I1iVwh+CyHU
         cP790hN5hl5GllVdpZKo8u6m1GEqooMf9accHQiCQcyVi+5ybdCiWjzCKrA0oaN6YtBu
         00BITdaHiI6I8c2MCkkVSs9RsaQBfIRywZ1CWqSNSdbisJdkTg6oxuhbQT3DNVrf4zTs
         6hAMBH+Rg7P/1ACyPa+3NUpiTWDkqjO0BdHMQpNwu0g3Led/gYVkfICB1C39PL+bKJZ1
         RMbC1WCuuOwqsdb0hLNOKXehVDq2Ob5tW6YimgVpwy4A2KQzLPj5AW5JqW+/dEDeymXh
         CsJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYf6Taw2w6aTT9AonHmPk5GNlQHkwulVB1SyfC2/dviMffBmoO9SBz0nYtTl2vGtC7n7kumoU57j+OFLvn@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOV5yMeAdblL/ZErVmSt14M0aQHNvJHvKPw2iZwGxDd8u6c8g
	8h4nHoh6dt9mMtZTeXYyi3alulEcHd1S9LhTpYeFf5d9oNWL/R+vIwGFAXEntzHjAv7Jym6nE+y
	Q20t2pADikvJi6u/L1cupeadADKxpkOqV3EylYAu8hNTNJebw6Nm1SkeOWOcSylc9Q4Fa
X-Gm-Gg: ASbGncv34y5n2IKq5O5GakAsNCLGuhZ2vZ/O8mf7gbKGwZaQY4vWlPcjNuUDd4X/+Ql
	U4dRo11z3rOzKkwba5hwr54Bh3RAHeoY2ZA7ObvzztfMdWV1SSaVRt9PNARfQyh3dBD53bwqvy2
	XJTY/9GTiPJOB0hjabCJpmH+8ZA5ZjNC6N+5RZZIS//EWIrfU1tDnoxcii2dAyUPKGEBf9n+u1d
	VEUEyUxYRW0CqtfX7iEYBczeDpWpQKBQawLrd50E2ekwrge0Vk+l1lHPrcWlSMUYKRZT+wbHFuZ
	BICsDaUNmIU+ofnV18DH7+ucLb3MEMC+
X-Received: by 2002:a17:903:2449:b0:234:ba75:836 with SMTP id d9443c01a7336-23ac3bffd8bmr147181845ad.7.1751206070497;
        Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgyBQ8WKKcLovdC2oavEyunsP/RHNeiUVkDACGNy5ppa5wMTeH1fWoAqZmD8XHl5viNYZ3A==
X-Received: by 2002:a17:903:2449:b0:234:ba75:836 with SMTP id d9443c01a7336-23ac3bffd8bmr147181445ad.7.1751206070100;
        Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39baf5sm61278095ad.123.2025.06.29.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 20/42] drm/msm: Drop queued submits on lastclose()
Date: Sun, 29 Jun 2025 07:03:23 -0700
Message-ID: <20250629140537.30850-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148b7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 1M94IFXP5Av11n2zzK4EoxCj2MxZZe-1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0BdFo7WNG6pB
 eCtjgyQlLLqf/LW0SanXBItEyAlvXGfIIDzdUvK6nvhm8tMEdwujoE1cVONJW714IIdd1+RrYki
 edcNSwo7SDNaobEYP0igX+sabLFjadjGUMCOOq54c+7Gybtjz92UJdYH2Ck7d8cfug21XyyLES3
 btBfY1I6nkTLd+GDCRsOmFI2hudM71+ZJycU/w4MMm+83DaZsg8RxBuEMx10mlubSJWExOgf3HZ
 7aLQcQeNdT0eeFitGoAZqXOt4Hanbxib7vdSLXgNfWL62LYd90KwgxDicEb+JiI2dcIosZnV2gg
 t0dSapPZmsYt9EeFquUBohicpsBnPvVn7MSVfx314Egu73R3DZnjOR38ULesDoRKNkTkCGTcsma
 dSN8bdpFXQvIt9Rz5/CcbHlfiphFkRtCsxSwmzdlLeSW0KwY5cv8S/L1fkj6hasWMn6NTp0+
X-Proofpoint-GUID: 1M94IFXP5Av11n2zzK4EoxCj2MxZZe-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 488fdf02aee9..c4b0a38276fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -254,6 +254,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 231577656fae..a35e1c7bbcdd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -356,6 +356,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 552b8da9e5f7..b2f612e5dc79 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.50.0



Return-Path: <linux-arm-msm+bounces-62532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D9AE8DC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B375A5A248F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A232EFDA0;
	Wed, 25 Jun 2025 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RluCK2o2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FA62EF65A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877936; cv=none; b=ZlvFzPAynCFnHgpZs74msXDH+y5i0r6/Ace/2D0SeyQaZgBSlsoeJlAJeFuPTmOSvQ88N4wznmUyTnMXwaU/lVbr6cdoLJS/zSMjLOnrRr+o8AktLpRxzsq4d/lZ+L+GuUCMFztru9EMv0w8Eg6aUMQrg5Khsb3+lfSPZRV38fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877936; c=relaxed/simple;
	bh=asg0ofK7A9j8GXUsqP3RShrmeE25j2whkBS5nOJbEJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ci6aHaazIPMSzts26d01gQIUYA6y051zsdD5tVWGDdtuT/SZ8YErMPyos35VC6EN1lN3eL2x+T+m+rYMUjf/dLS8T96ycPUsDGKCcFxVoW62KkxULTAyvq7c1icphauLjYV7Sj0K0OiD0TOEFXFfRPboyWSZx95KKard/iT58ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RluCK2o2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBVO5t024850
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ffdUUPweRzg
	vpO3v9DoMvCSyNHDyemApNNm03T9kbrM=; b=RluCK2o2vLtJJnpmimfjCEGt4SF
	HpILbEhqSZg6S/LvsfJMADHiwSNZZENM9MvuHNZazy6iMNs7iw4fIa8JD/f4V0W2
	7uoCjdAKHMiMRwDMi2drF8RujBPRvNw0EtDyYjZXTWjmQrTjU7Z/0mjrHFk5xKfU
	NB/B9bLQzHL6paGWjExlP3zcfoj0tNJ46UOELvBllGmxgVcE4PwJssJpyUYWUyGz
	O7x8harkijKoAbYiGiEQFMuLU4bmT03mL/K9TNulNvEpRJ0I9JS4U/qjJAOZdz8L
	xQNzh/R+/qss+e7xIWuZNTf/FFEGZ1y4eEUXQ/bZYkQg37Jhsa2aiPwHRVw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmtk0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747cebffd4eso174421b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877933; x=1751482733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffdUUPweRzgvpO3v9DoMvCSyNHDyemApNNm03T9kbrM=;
        b=PE+l8Qoie5nYXbnTHwGEzbWqzMfBZfpzpIC17XxagvDtaYjM2pemeGadt5O99vaQdN
         gUMsQvsM0gNUpVIfnWtstytcUwJJ+rlNlO0z7s9mqSXoN8+h6ApOZcPGyyYohrIodzvF
         D6T2BV6L2dyOeWCak3GAEDJhO4W0yN3fns9QHSWNn+kag3VxcCJ7wpNkmj0ozy41ndvj
         YYg6CVomWBo0X2k1eu/I5Z2Yr4NUBY0yn2Kddp8iZVo6eyQsHB9SgHWv/CJcyluU/iBs
         i//F3hOt7P/zDwwrFIl1jtWejpt6NsEg916hLXXzS4g6repkLY/ccLtn60aRHX/XkFaG
         HM9Q==
X-Gm-Message-State: AOJu0Yy+xGFfrcDBzZqppMbncn0HgMYl9UkZr0JYUu2FxmMp0V02KWvo
	ZnOJ/RBDdcJuzchkYNUVqhN/mFTgpo9ohF6Yt5BW+H9rtLDnM1LloPGESrKnnmirFbFhzBcvspX
	FzA1zxruXf9ugWTb0HMiaJFKNVsRWa8nfGa7vJ+1GccSei4irNUltIgiUQM2HkmVZNjCY
X-Gm-Gg: ASbGncvZCN/DvLXuSF+ysl0lyqOmWsw3z/44Ujq2KibRr5L2fBzdA+3Zxy6bR845AEr
	lesnGejZMcpcXuSzXRbkez1da3hxZQmaUQc+50PvNRqQUcx0grso6bWaK6aMD/H2Vzpe7aP8BXv
	IegCZDNzGfVzZcIvV21OblLLegkn7FCwqBUsgTRyR3BAP0en6QxMlsfB0FgODP8QHNl4gG/q0TB
	9myrEJbhrF6Tiadyo3lIU+Zq2c4UZcYG4ncfaZ/80yXw/cSAODxbWbvQle/qTa5vbyUfGGH4GHA
	lVxkbztmV1rurs1K4ZHBInFVySmFonPr
X-Received: by 2002:a05:6a20:3d85:b0:220:193b:913 with SMTP id adf61e73a8af0-2207f33227bmr8106699637.34.1750877932961;
        Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR0kw5bnLdP6IBPTLphpUWcdTRJzruak++T3jSrLRaNiq8qRkCEOilIj6df1ql7bzZsWpPBQ==
X-Received: by 2002:a05:6a20:3d85:b0:220:193b:913 with SMTP id adf61e73a8af0-2207f33227bmr8106655637.34.1750877932520;
        Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8851b26sm4805260b3a.122.2025.06.25.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 20/42] drm/msm: Drop queued submits on lastclose()
Date: Wed, 25 Jun 2025 11:47:13 -0700
Message-ID: <20250625184918.124608-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c3-cvtwlCC45IxINmei-9o67jISs3esI
X-Proofpoint-ORIG-GUID: c3-cvtwlCC45IxINmei-9o67jISs3esI
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c46ee cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX8L37pp7doxV5
 Ll9VjanJQjPx4emISoBRrkrG+DwsOX0KDJDP1znimkaTKpFf3hc5rLZIqF8erXX166yv35nAqao
 CLKf4mSZ1NYRCjqq9cVMzVB50QvhDzpD1McEOW1sqJ6+KrIAoyPfQqjgKW+VcfFwOlJ4HfkYP8L
 4I4Nn8IU+Bgmn9izbzg3gdlvfXpl/Fw2LP7wkKx8bzxIvMFMmD1kuw01WfqfMFbnX+F1K2oMQkB
 HKifXAnNe4Nrje5VwCF1KiNrOknLjzOGjOjLo8qAehRZyAi390LgMkcwRvTjbHiDA72LtlW0AA9
 bvlL3UlHZMcM/T87c9Ykb0fClhPtoqyJ1jUdyHSZM2HDt7X/RNFAVmZBn8POn0u6yyUp0SFsHm0
 9isQptc4CJfnyteQZu1cMhh/d3zwxyj2Oxn3hGHGJUXs4D1xq4g2XlgE87LcIPWtNRTpQlfh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
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
index bbf8503f6bb5..b8bcd5d9690d 100644
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
2.49.0



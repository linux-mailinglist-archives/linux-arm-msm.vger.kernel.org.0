Return-Path: <linux-arm-msm+bounces-63007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FCAED0C7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3614118969D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC4239591;
	Sun, 29 Jun 2025 20:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWIAqm9D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5B2505D6
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228210; cv=none; b=tgOqbXwBtMWBWMPPXQ9wXJKpNJhyqlvZ5sDcf9MJEEeSfkUGe37UcBcD66BEHTomHdQsmGsADFSQ+8FHcfUvVoSmRSuJYc/X1C4wwg+hiq1flp/QfdKstIYquY8OllsT/ziH1qUvqpVwbnGfuj42CFMWtirqrtvE3vRPGSGtBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228210; c=relaxed/simple;
	bh=hFu0EsxKzuSQGzzTTvNrSL2I+uVbcASFTMQYh05jHrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIPd/TAHUzXR5Ad5Mt31h76revQ0ULo+1UtV+KNEEZWR9HPX36TnttvTFz93pXIsztUn9r6GSWUgzi+/dfDtoaqdf2OFkxXzZJ2s5G7csL2hNbbFk9Xh6okJlrODHv3Cu42fh6yS08/JREIFVcg/eb96GO094xKBdv7p/fMcnsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWIAqm9D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TI0P3o023812
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hadax31kM4+
	sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=; b=dWIAqm9DjIy6I+bHiuy9AGa3Llt
	tljGI8vcWhDYeWznraeqP3dLKCFULD9GJTP6o1ZllXUvS3OVuMKD5+T0giGHaemg
	gToChcO0Ab0fMZ53tnUzbZs1t/h1NEP+I7PrSPmaqNYro+/+qkTPHs750QW7pRP1
	YlVvAmByiL/WTTnSOmLOuH/6J9Mb2z2jnRFOY0u/F6NvXxxHoAAjicUAD94CVaXH
	oeTZU5R2cCnbGSgIgm31zZ6ZspwQiejE+WnXxjhNzA4mDYQqIzELx1Mj9V8P7v2V
	hZXV5oa2RrWO2dNrHVemGlFb+s6QWOr863DAM5AVq6GX6XFsDX4c8Wpm4Ow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2mt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so2342027a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228206; x=1751833006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hadax31kM4+sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=;
        b=fMNOUXwGhobdCVbPx1TqW/Y8iPzUWph6WGUC4eb2mGGeJ8whXLWc9f8P/CLJs7C5jd
         4FZ2RIG991Rl/b/Bs6UG7s0t0iO23qWMoruH8spJ6HJWgydynzLu3nxHDfibzESiQvk+
         Ve9Z559ttkVJDB+MSXsMtgGYVLocdDeq4qWA9Fgk9moVE0Eu75Z9K1ntXyAf7ZREkj44
         DWOfvgN27YiYQ2aK0wKh2ohOdo4u1wu0T569f27Hz972Q3d8FC1cGESTPv9+yvK1vCos
         MBg990HOBXSs4cEAEWpwfZKwTukzg5Pipn/L0xpjQ0TxjyfkPtIw6BfbDcQlj+rBzBVc
         y87w==
X-Gm-Message-State: AOJu0Yy8lWFFwbearqVBlYhlI89hryneBuaj+h+d/Ti2oI2aVNZn8hCo
	6QJJoiSquJtgWZ+bmbahHAqF1iZXN7gvl8gBUYRFV9++BdED+SGhOG7oUnyJMe9GonNv3KRrjFe
	+E0WWozY1nlKG902xugUNQbWfpEpO7qCCJpfLk6gEXdNHifjxTr57Zcx5KKFAyvWTItLr
X-Gm-Gg: ASbGncsdho+DxTmvfuD/B6MrYa9fDu4OOnnEu3ESKaJzZ1hQUMb/gjfk284Gss6SyUP
	QVEWWYKg4FrJwDEsC/f15Ztl8JSlteWH41FHKgR4U7BsZ79tEJoXbwG2vC2MQ6XY1dm/Ggfugru
	9GaX52inkvNy1ABPcnifrP7L+VPvh6YBzZtBREKEPbxGYyv91cfvLwHuegCeWPAUaQbSGo1y/+7
	/nylX2BzOAM0QG8wvvFe62IpSiEw/0ux58rlXQz5rv2JW75fkPbELEeBRkoBnKIDquPkJVbXEBR
	0qqce7WzV9cy2r8r/vbt14Fc1RxvVm5XGA==
X-Received: by 2002:a17:90b:4b0d:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-318c910a238mr15355613a91.10.1751228206368;
        Sun, 29 Jun 2025 13:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr+QQ/LPBQuRXSDVeP1yQmlH8FH0SOjYXUqYKGHVd3ZKkPXg2/4lxBBqn444PNPlZLSOChww==
X-Received: by 2002:a17:90b:4b0d:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-318c910a238mr15355587a91.10.1751228205899;
        Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5382f0dsm12695469a91.3.2025.06.29.13.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 20/42] drm/msm: Drop queued submits on lastclose()
Date: Sun, 29 Jun 2025 13:13:03 -0700
Message-ID: <20250629201530.25775-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: t5yISJApq9SBw1to5ETq_9DIBgoP0KLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX8BOb3HEcG5D1
 2hf9B9LnXV2PhjCohrrYcMUeR3zz9p7wTv2bz7IPzUu05l545NYPrAispiCVmmOFN29d7Su/zdQ
 6B968TeYAyT+mvl2ba6l3n4GhqYxD/mWqIODjTPp5Mq6aLt+ZXy9AlcL2ySk7uuONXinysRukAs
 1ceJIJelKZ3G5J9tZQjUpLuN9AEcqZLWfQgk/y/ZuWTJyEV2b7KIAgS8g2z5qds4a/1mrdAwarY
 6uu0t0WLpy++/Ms/FlbFgGYiidjkJY6K8qLlI50hKYX6uDEaGJqGOnegRdgJ/icTZUsdfu7fRYA
 P+OvpULu+ULFPsyQpJQCApUGNCpTTsGcRtfcTHgLfkFCU8zDBxkZqdedRaqGc6+CPZd22eh/M4D
 OX4CulO7zNJYSD7ppMxrXhusBOC9oRWpn0wvDyfIH/ijPqlED9ztVOyfc1kWkATHbKZ+jcUs
X-Proofpoint-GUID: t5yISJApq9SBw1to5ETq_9DIBgoP0KLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

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



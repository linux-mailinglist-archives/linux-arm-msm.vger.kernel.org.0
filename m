Return-Path: <linux-arm-msm+bounces-98038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0InYCdeGuGndfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:40:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB272A1A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88C2C3031B29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 22:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D78E374E64;
	Mon, 16 Mar 2026 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYeNt/Vz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cc+Bd3KX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80453374E62
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700749; cv=none; b=nWYo7wDM3Fm0zSr2TGftFpvCG7zMMYWuHN0Lu6Y/J86bEm04sN2SR0Xc+RPdvzMiocuKPjFmy8OShYkYX7q1PPoX1l+oQjLBBtypwUbJjUQ/u8c63lTLJvMT8LSuazbtRlFVPDgQ4WEMZdDfqchEmhcefV2oEky/FHQ3v6z1VtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700749; c=relaxed/simple;
	bh=Yhvgjs0biEc18D3h5Bmfm7+k+P+S2aEqL0rjlPXQ064=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9mPqQeEm3KqKqPoGCe+iQIA0fv6x7mj/z/b15IoExVYkvsYjv7blPJMjmplQctbxlHEfwLOD7WQLXHBpgJ85/O3TmnV7OIe0fUXe2GRkQxBvsPfYz3x9T5Dd3uyKNB1W7v3EO1wRqDB/2oPg68a1uOYNVstwjpvQw4Fonjh8EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYeNt/Vz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cc+Bd3KX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GE81fl2375024
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fsmwNOdowI2
	irHmpBpqjFmGIGle+yKJW1O1LMz6nMl8=; b=WYeNt/VzlVl2SyKYh/sQcC2mT+z
	HiX7soshfCMz1QYooUs7E3nnt45s4tcWmVZ3mjXPCfghCBoLxb5xn6dAlc5hiT79
	71W+wQ7jb3NDVoZ4k1kVkIAgdQ+WOkAFJXaChY8COo4+tZWW5DJnknMb9UlDXLQV
	74JfPNtjp09SNeH8vcpUMdkDuqmVBuKB7Ix5mDwfxBZ+swXhM+wlEh7nUF152hv6
	2nPlDzmbAgbnlQrHzGZEpdc76sgBFG4qxBhL9A/po9DjmUYJKh4QxzK8qhlH7v1O
	sdMSqQllrHVf6QNnusoOo7Y8x9FXiUjJErICbTQB3GNY3TwpGTUuWg4DSjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkby1nrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecaae9506so2458625ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773700745; x=1774305545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsmwNOdowI2irHmpBpqjFmGIGle+yKJW1O1LMz6nMl8=;
        b=cc+Bd3KXGX5lEWRnQxq7xjH15gVqa6M6JsGgt/M7hUv8bclViwdc7kLPa0ZGfPIdFR
         s1zE0IM0Ywgw6G/A9k0fgcwhvs5CYfe7oRZ1+8IYriD1aAnE4gBKr+CA1/vU+k79nHT8
         Xh5BSUueUsndRur/fu5K8Zu5FmlTmIxUb5pOQxRfUEi+TTDiIqwDgZLevHlx+h7g5lT9
         kMPTJXZczeOMRU8qg6u7YuZGBqLWuIG5EGV60etONaATSVCFA5ot2/oJ9CCnEDuc9I3I
         aDf6M3TMfI3obVf483dEsz2dPNOHgMPW3LPBJnmuBJBSRdLi+F61fb6g3vMLpexkAyba
         veMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700745; x=1774305545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fsmwNOdowI2irHmpBpqjFmGIGle+yKJW1O1LMz6nMl8=;
        b=KCataZwoY3Ro79IfnE10b95oA82lSIZT+EmmTRyjy/KtxQuUyhUKqOQSzFd3ozLtiU
         /zxaaHY629T5z1DjHGeqDsB8O/rc3kW5dTga9xB0LVYWw5pdVvZARkBb/LPQv+W1UUir
         3cJpEMkIqgFGI99kYcLii8KaQnIYnSpxnV9Mn/FlN3bjhLzECFgOlFASr4jqufP+aW/x
         KED0frh572Cn1WQBfX7jUEkoCGJaP6cxOslM8iTtQ9XSQi0i806dEwtl1rsElfUqx1bV
         WuxltgaPmi1RwwoC+uqLBkupWOgHxRP0VujVsulExQfNEy8yLhJy7MTzqGEq3IFZZawd
         47PQ==
X-Gm-Message-State: AOJu0YwpnZFGcWD2wVqsxyYfka0w1pc13rmYPyPVZ/siRKGNnZ002/pe
	Fhp+y+I5OysCgmELptCxle7705fVpT98ABNZs7dyyUXqxPdoHUPX6OCoZBcL5NpB7wbu9xuFO6Z
	OihDrKzlrwJ3H0buFwiPxuQk95mORbFDamlluJGMimH7NUQbJWReg7tbsDEi7Ys8LuvpG
X-Gm-Gg: ATEYQzyGrQjXDOtHQv67BZv9UR6qX9w+TZQO1XWClvavXsudQkbi/tbB+45WHIoXipv
	YskzMkkfE3eyZWwKA9lDBU/bTgoS8YyoDmhVw48Dw2Ep96Bdwl7m/d/iQ+4o7UiEWUhL74d3PFo
	VEdNJmhBSkwZ5NgRjLTQdSQu0PffiUHPsDjAa4u8ywk81N50Cbmvl/KUNdG+RX586Iep96BD5X4
	bDnt3R5r0y1qNYb7AHOtF9gwUcvdgAFjm2cNzHhCFNHKI3/qSoKaE0DTHzRv15lj0dvE3nCjErp
	chHOs/mn+LF12gahLH7PTUkaPeUJUQcwGHQQXVst87QOOlm7A5JNU1HnrqdrTm/70tm/s8zHCr8
	A/XyBWfca8Eo8MT8MdvZ5dFiAiR97kKUq
X-Received: by 2002:a17:903:283:b0:2b0:4fb3:c771 with SMTP id d9443c01a7336-2b06357ea62mr10456615ad.6.1773700744812;
        Mon, 16 Mar 2026 15:39:04 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2b0:4fb3:c771 with SMTP id d9443c01a7336-2b06357ea62mr10456475ad.6.1773700744288;
        Mon, 16 Mar 2026 15:39:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7edd1fsm152594935ad.47.2026.03.16.15.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:39:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC 2/2] drm/msm: Add sysrq_kill handler
Date: Mon, 16 Mar 2026 15:38:50 -0700
Message-ID: <20260316223855.711574-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316223855.711574-1-robin.clark@oss.qualcomm.com>
References: <20260316223855.711574-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3GJV_92cdD8YDzdEFJ3VrenMkLwRW5mE
X-Proofpoint-ORIG-GUID: 3GJV_92cdD8YDzdEFJ3VrenMkLwRW5mE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE4NyBTYWx0ZWRfXyuepWnxm82Tt
 wsBTmxSebEjrdFdW0PkWXiHNcBT2bzaH4+qBmLleH3gfMXLEQjz0rML8eV91CDHMefB4o/GpVVK
 XWNSzUykNQswPOVs5gVF4XGyfcRMgPi6u8fT0RX/O23UNZQ4zZHFMU85pHYxqnAolQg21So5DCL
 mL0d02qec+7d3YST35lFcbVx7ht1wAB4NeC4iYMltdw41w4G4cxWLNvpb0teRwwI1Sb75/U0CYJ
 ouqVQyE5BuTm2yJLcI0bYu4mDoXqnNcY0YbiFKfnN0ybAG6FROdS8bpOylTspwjkx0iQ2xQrVEU
 XxRdwa2rMepTaLuHwpiNoAfQEGbUa4ULbHJ+Re2/QEVT+tpiGdWJUuMfOnJZ+NvliyRihpbUnNr
 Df29gVpFjIW60ValBhII3RpT03CWgqJOczaaUttmO0ODMECNa528xT/H+zuZf1vLffsmETXggyF
 LgYSN2+JEz3KUhvZZqg==
X-Authority-Analysis: v=2.4 cv=ZpLg6t7G c=1 sm=1 tr=0 ts=69b88689 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=s7vrW_VSA_84OnxZi_AA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160187
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-98038-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFB272A1A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This does the same thing as an immediately expiring hangcheck timer.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 12 ++++++++++++
 drivers/gpu/drm/msm/msm_gpu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h |  1 +
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ed2a61c66ac9..ac04d83724b9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -812,6 +812,16 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
+static void msm_sysrq_kill(struct drm_device *dev)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+
+	if (!priv->gpu)
+		return;
+
+	msm_gpu_sysrq_kill(priv->gpu);
+}
+
 static const struct file_operations fops = {
 	.owner = THIS_MODULE,
 	DRM_GEM_FOPS,
@@ -846,6 +856,7 @@ static const struct drm_driver msm_driver = {
 #endif
 	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
+	.sysrq_kill         = msm_sysrq_kill,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
@@ -885,6 +896,7 @@ static const struct drm_driver msm_gpu_driver = {
 	.debugfs_init       = msm_debugfs_init,
 #endif
 	.show_fdinfo        = msm_show_fdinfo,
+	.sysrq_kill         = msm_sysrq_kill,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..6b1c284ad631 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -673,6 +673,24 @@ static void hangcheck_handler(struct timer_list *t)
 	msm_gpu_retire(gpu);
 }
 
+void msm_gpu_sysrq_kill(struct msm_gpu *gpu)
+{
+	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
+	uint32_t fence = ring->memptrs->fence;
+	struct drm_device *dev = gpu->dev;
+
+	if (fence_before(fence, ring->fctx->last_fence)) {
+		DRM_DEV_ERROR(dev->dev, "%s: sysrq kill job, rb %d!\n",
+				gpu->name, ring->id);
+		DRM_DEV_ERROR(dev->dev, "%s:     completed fence: %u\n",
+				gpu->name, fence);
+		DRM_DEV_ERROR(dev->dev, "%s:     submitted fence: %u\n",
+				gpu->name, ring->fctx->last_fence);
+
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+	}
+}
+
 /*
  * Performance Counters:
  */
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 666cf499b7ec..07abbe33d992 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -696,6 +696,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
 
 void msm_gpu_retire(struct msm_gpu *gpu);
 void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
+void msm_gpu_sysrq_kill(struct msm_gpu *gpu);
 
 int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
-- 
2.53.0



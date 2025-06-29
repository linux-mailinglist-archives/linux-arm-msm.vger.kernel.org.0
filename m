Return-Path: <linux-arm-msm+bounces-62991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DFAED073
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25A5C1721F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB48241131;
	Sun, 29 Jun 2025 20:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7N3heOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448E23B614
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228158; cv=none; b=eY7JUgsZ+ew2Y9z2vlxqFqBGXHTSvEATDc6Cq7VjiauCMqgdrjFSjpj6oO+2iQFF+XdNCpoEmlT4JU4wWV4aoGJIpRQvOexbi/x1lyQRWAdeZbl+f9kUdBB/8F+M/55/cQlTL1SmtgHxlXSsiK29YbW3xmmEWo+WcMttc5xs5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228158; c=relaxed/simple;
	bh=IKliov0J2pa5trVjg7A0Pz5LzH/hN/LQHJAojZPCWiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKWt5hKJaeUa8DsYhI8XrPYfTUYlDSc9oPCQw7Hf3y//JmlOceJjJSRS12MShrPeSkJadI2LqiBdVtrdIRok+3desNU1PsOcV9xpYlOVDffXu6OKMAIrAFin6KUfj6X5FoN6myCXy+To7g4MixMmXspnfA6rPX/mXbhAsqQha3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7N3heOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDTXHG018757
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Eq5kxLTTzjq
	j4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=; b=E7N3heOcx/wkizhHj/1SljOU1k1
	ZwEoyYKAwIV25v7ul4WeTbDK7Uz8du6VG7PEDFesXihyu5H1DFCPjpJMHW553nZf
	h5tf6u6wdMD9oIC4+P0BijzKS3o59vqc6pcZhIcdIvrpLctByQ7nhgifAX5vr/UQ
	OhNDYL02ZqJ415UASVkiEZh4ioUJl6oOTqPwFyW0G0yf7XRmTpGwuVACSkXy0Nwc
	etZoKq8Xufvh3tHS+WKLTycFtdnfXexcAwsMrJSW7+sLu72Fw95dDV988tIaftTX
	Z2irKmDx5PX3Zw0bDb6LUYfHRCNEboeOIyYTssYDc/We7NRMpbE1K8M9rbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95htk3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:15:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349fe994a9so9257085ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228155; x=1751832955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq5kxLTTzjqj4KYoKYMeeMDOnDpMwOj1SboVzjrNiGw=;
        b=ppanmcYa4P/TArZ/r6TEvr/VXyTxNhR+QqQ6TtbTLPgp1QzH/HXQg1c+uUX5N8Sgwj
         Hx+LqcYKGOxAn3gQCyd5tzU0JUgDJIqsmP+w0fAUFbxxt/UR92VcQRrtgHr8PECyKQjY
         3QFgFMHQjtQ7p2CDDTJHPOF5EuSqo5xb0GYfGINnW9thGqUMmbm65uOKlIgdFcDoV8MM
         CFJtLFMvfTQfS4TWs92NNYR8xPggZWzAGKwIo3t7nCthbqYG5zVX00ACBE/MoNtlo7ys
         BAyONmLhK6ABFiptXP68ll5lEcYvg/L0XE8pEgMJmK6vWjlXxPY1bs50TAhWv9wYNMdG
         uGIg==
X-Gm-Message-State: AOJu0YwG24sybumZsA+XhI6HWpiZ237y+cIw/lhfvKe31RbPlO4f0Vt+
	Jew91Pcp8VJb7AdOdr27eiV2GQy0TElkmQFLJR0Z3o1Cp3STa3fdO4OSSWHECtoSVBmnMwrbEOW
	QyGtkYnvzCSLuOVMXYslOXNc7+Oq0O6DahPKGQcieXzeYeNsXv3hBDKlx4aL/X3ORnZ1Q
X-Gm-Gg: ASbGncsIEKM2YRNtwtAqUlNDgUQlo3fBrzxaIO7xXLiBxlXGdLkB3Vyu8QwrSZBWis5
	XN4HzcqYN9UM/JzAiepuHtE4OiKTIMgbqfFdaVUYvNQJMOdW+GAXmxxbkmO8SCVx3TzdQAqSKBV
	bdQ0YFVXKmpQxsy9Q76jn4NodZiYvNjshnKK51paBm0Ig8EYv0F2kYFWT7ktxTvoS+IR0aB4mWw
	aJ8qurqOb0zAXTgZX9WkWfDkiJkCeOGKFl67xeHzIsbv2RTSls4vOEQfCIeYeIw9TirEldkMiXU
	VBFLcCVof9gUPpnoFfsSCZFONtSxCIMzwA==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id d9443c01a7336-23ac3dec40amr193803105ad.5.1751228154668;
        Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7YzmMzYaVmo4a1PENReEL/5V/swGt42s5m7GGennouRebdx4cHCuSsKP1wUZ1/kFFwcF0lQ==
X-Received: by 2002:a17:902:e881:b0:235:f143:9b07 with SMTP id d9443c01a7336-23ac3dec40amr193802645ad.5.1751228154205;
        Sun, 29 Jun 2025 13:15:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f2569sm66066195ad.64.2025.06.29.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:15:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 05/42] drm/msm: Improve msm_context comments
Date: Sun, 29 Jun 2025 13:12:48 -0700
Message-ID: <20250629201530.25775-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfXzhNUThN9r8eW
 fPxoK6l60BsqfxBq9dTZTnJ2dgXsln0/103rgk8B30l/L7fjapGKbL5rf/5li1IX9bhgKzNFyB3
 E6KK6nlkLvQXELmGJA27R1VtfA0Z3kEGmMhr3u6bWESRBBfWp5ue5PytQ8A9VLFB6UGBSljA6kn
 OwCwbdn7WFF2pQjXZczsIhtjwBX3K07M0TagA7R0PUqp+BOOMZ6KEqZLRzRVYPbxMXpDwljK4XB
 rSomiWz1ZG+okgtFGbIMlqi4Eft6j5sqye19/5znwHBNYdr3uOaeHquL32HOPAuuOajcCfvcjJi
 mRAnVIxyDksmF75vkIK4HkXLZn8ixRkt/qTHs5O7WM298You83uQTKCxibLfENUb1pNzXTWe39l
 nxp2tFP/wlZJLazQ9VLedneDACidog06YLLLIPC6Mzt3oNZeRLd36LGxbrjSGz7TRmXQutZV
X-Proofpoint-ORIG-GUID: 1MStA6bbmRGfo-2Gb9DpKqAw-NSydO3J
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68619efb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WI1w4SIrP7wptn5q9fwA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 1MStA6bbmRGfo-2Gb9DpKqAw-NSydO3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290171

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 937b7cdddadd..d30a1eedfda6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -342,25 +342,39 @@ struct msm_gpu_perfcntr {
 
 /**
  * struct msm_context - per-drm_file context
- *
- * @queuelock:    synchronizes access to submitqueues list
- * @submitqueues: list of &msm_gpu_submitqueue created by userspace
- * @queueid:      counter incremented each time a submitqueue is created,
- *                used to assign &msm_gpu_submitqueue.id
- * @aspace:       the per-process GPU address-space
- * @ref:          reference count
- * @seqno:        unique per process seqno
  */
 struct msm_context {
+	/** @queuelock: synchronizes access to submitqueues list */
 	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
 	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
 	int queueid;
+
+	/** @aspace: the per-process GPU address-space */
 	struct msm_gem_address_space *aspace;
+
+	/** @kref: the reference count */
 	struct kref ref;
+
+	/**
+	 * @seqno:
+	 *
+	 * A unique per-process sequence number.  Used to detect context
+	 * switches, without relying on keeping a, potentially dangling,
+	 * pointer to the previous context.
+	 */
 	int seqno;
 
 	/**
-	 * sysprof:
+	 * @sysprof:
 	 *
 	 * The value of MSM_PARAM_SYSPROF set by userspace.  This is
 	 * intended to be used by system profiling tools like Mesa's
@@ -378,21 +392,21 @@ struct msm_context {
 	int sysprof;
 
 	/**
-	 * comm: Overridden task comm, see MSM_PARAM_COMM
+	 * @comm: Overridden task comm, see MSM_PARAM_COMM
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *comm;
 
 	/**
-	 * cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
+	 * @cmdline: Overridden task cmdline, see MSM_PARAM_CMDLINE
 	 *
 	 * Accessed under msm_gpu::lock
 	 */
 	char *cmdline;
 
 	/**
-	 * elapsed:
+	 * @elapsed:
 	 *
 	 * The total (cumulative) elapsed time GPU was busy with rendering
 	 * from this context in ns.
@@ -400,7 +414,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -408,7 +422,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -421,7 +435,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.50.0



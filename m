Return-Path: <linux-arm-msm+bounces-62517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF61DAE8D94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1A96A00B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC72E1725;
	Wed, 25 Jun 2025 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0eXiFIo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6602DA742
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877894; cv=none; b=InbfR02ctST7Gyrm2Vjt/HfioWrPwIlKGqq3WxJJJcKPL/8ntrOHbfBI8sxCKk7dHzNeQXkheAfwso3xrS8HJ7Z9Lg7ZDg13tdaGqK/vcuhDG2b5M6LiCC6uA7dYWsTp15M/Nq0fIQiGtlo2ZZOqaHwX7hSCOj6yh4vT5bnPxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877894; c=relaxed/simple;
	bh=8yxrJuQkxzYQChDV1AsntwCFAr6kU9KajLDojsgN7uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKBCBR3xWupTCad+SywC8YdE558x3ovSzngrDpr0iQUp30J9m/W1eszuqyrGpjk2QoDS1L8wIRxWx48PjLo2y01ekwsFK7za1GtnVk84Xph14137F5GqaxPs+unrDnb90pEAKDEGbDjstbn2ltdChPfy7iLNLS9tB1F5qxRO1UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0eXiFIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEmrf015564
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iz489B2Vnt2
	sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=; b=C0eXiFIoHrho4Cfeajp5hMIWveM
	i56buHxm6tliHu720mJsTe0PQhcF7wxbusDXvjaYI6DvvFDSUdvtMkpi1odH0t0P
	3ejFlwHdcPJRwtNOJoPUJHz66jwrCpM1ppSudM4uPn6gLVV3LwmCMIuewz6blYlu
	BDbR9bVm4iL+JZ1mrv4DjjmmVVJf90ntEZ4Xvq+dSsdPfvTkoUP5D7lNTsT3Wd8r
	PZE0dqrmEJWd4arNv8UAC0zCk1pqco/ySqaNjlkqIPs6KMRtqqMvZutHlXTwVt1W
	8JWcOFya2ch7nFeuv2vX/MsajM6agYOYyKCES+Xf6GuhVB+JcwiisuAfkTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce55d33so2838235ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877891; x=1751482691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz489B2Vnt2sUZBEqce/LAoH7pGwFDnWfRoUqmkB+Q8=;
        b=jyHqy08fP14r2b2tvJOxmPRVkBAI6yPSkU/AUE/A6jUiWKXykYRS9/xyRP8mzSeG/2
         oMUmtfWPHxGe/PYgWKofeIn8VzAA77k1siqN8pwPyhYJ9iDQHY0smia8h/bTFxKLWWLp
         QtmnbCF6/ouCXjcpnhz7iOpxeY+qEOswBTxAO9qm1Z1zYieXvmB3xttkg10t+NDmJ+cG
         SgZpnJL81mwlkd7/mOI7U0LHZG/tz34td3T1YZp/cWB7SX+SNU/TtCN9OIJ7IAZYm2OP
         kBWp7gaFIylUfpI9RW13qygYL8xYCCKP3cQAknkl9VMiTmGf5qT0rt2wRd3/rwzfFuL9
         aKwQ==
X-Gm-Message-State: AOJu0YwMos9AEVm62vGbiFQ7kz4NmSnAs8JAf8gOW/mfQhOVpdG73fKg
	vDClrtg7Mj/jY6FyaM8RpY1DZXjTSJFLrhk3ybhvtqFAjqmsJ9XIdzUB76Z3iAzHTY6Zd1EKgZs
	5/T+lwdkHsfR/zzexvsTtB4oLyBZqrBCzhHOkySFQU/OdCFk7BAZGQim0hGZ4vLZXbRtD
X-Gm-Gg: ASbGnct8jN7QbtOK/gSlzDZ9102TbdA4SnSlOjW9PrZpxGx36+nSn2bqYTlQVelawSp
	Q8Y2fVrGbY0RrZobpiX4ZsxsXUOXhvAWcGDTxLWlj1QeYtH/dhfRXet0JgMUUloBedFA1L2Ph8Y
	iO/4zhqjYjGX7SbAqA+56sCYFW81Ol1ftcb11hFC7+Zld26ykF9LVaEmB5h8OAZqn5XDokQXMBh
	loCzD+iih7O+18j2iqBbx4+HCFWZ4YhnkEfzurC4JY62DV6XTeX+OW8ICIGP+QEdVlJSH4nwA9+
	bHwoFxgq99FVkCqdrIhsz3GEZV54poIV
X-Received: by 2002:a17:902:d501:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-2382407a220mr64201335ad.47.1750877890594;
        Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGELzNE88dk/4uZ9frRWF/+bGLdgcTXmuMfsYcOrT4v6Lw6umM/ReeIdKxbfbzYz91MBR74A==
X-Received: by 2002:a17:902:d501:b0:234:e3b7:5ce0 with SMTP id d9443c01a7336-2382407a220mr64201115ad.47.1750877890193;
        Wed, 25 Jun 2025 11:58:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237f7579cddsm81828815ad.202.2025.06.25.11.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 05/42] drm/msm: Improve msm_context comments
Date: Wed, 25 Jun 2025 11:46:58 -0700
Message-ID: <20250625184918.124608-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fQCw4mvzq_upt4e_qCzLQUVdsZLgxMTa
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46c3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=t0yPb2BRG13ODCZxGvcA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: fQCw4mvzq_upt4e_qCzLQUVdsZLgxMTa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXygGuxwSaPVus
 KGELYrpjCApk0coa6P0qp1MvoWO22sQbJTt3uz5dM9hm0o8lkoo9XQ0W+0ys81A1CuLKMw/cZKq
 47PRujXovKWxioBzu57gYRKyKsm6PTFTUR1AXOWG7HAkJOgG/vEk9J6YSLP+EpjTVDt/KVjTUMK
 v0fEcwi9nWP7kqWlG9lxtKJeW37rjQed13aGBYeT7VsYx+KhomrHbJahfVALv/eaToQ7VHBqa28
 xUdhFauhVuG4ATD41aT7JBYgqI/hjHNDqN4Kvf+ALHDyMe19xOxdyL/qKwV3vIZuBrvFJXsikPC
 rqrv/5v6ZYvocmOdfn+bD2KoyFXd7Js69EeMpxw+4viXNHnm17hemWZIXQzmXWyam8cTuUIVIG1
 5NeaarYJT5jgiUm8MLWHruYpUNyDgLTyntr1M5ZjPlmHZVs5FsZZ7Y93nrCzMaoBmYXn4Gs+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Just some tidying up.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 957d6fb3469d..c699ce0c557b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -348,25 +348,39 @@ struct msm_gpu_perfcntr {
 
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
@@ -384,21 +398,21 @@ struct msm_context {
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
@@ -406,7 +420,7 @@ struct msm_context {
 	uint64_t elapsed_ns;
 
 	/**
-	 * cycles:
+	 * @cycles:
 	 *
 	 * The total (cumulative) GPU cycles elapsed attributed to this
 	 * context.
@@ -414,7 +428,7 @@ struct msm_context {
 	uint64_t cycles;
 
 	/**
-	 * entities:
+	 * @entities:
 	 *
 	 * Table of per-priority-level sched entities used by submitqueues
 	 * associated with this &drm_file.  Because some userspace apps
@@ -427,7 +441,7 @@ struct msm_context {
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
 
 	/**
-	 * ctx_mem:
+	 * @ctx_mem:
 	 *
 	 * Total amount of memory of GEM buffers with handles attached for
 	 * this context.
-- 
2.49.0



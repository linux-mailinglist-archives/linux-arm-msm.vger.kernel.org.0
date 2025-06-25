Return-Path: <linux-arm-msm+bounces-62554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90876AE8DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167E91C23E38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9022FD87A;
	Wed, 25 Jun 2025 18:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0kPB7le"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1192FCFE9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877969; cv=none; b=ld/0ogOM8tmMrsyG1/f90IEQSb71fzTG+EBD2jjIijtwDDuwpq8HGEo6hR1BNaKWGI67g5kanayWdDcivGc+qEij1PjX4KurVpoZT02fodtPahJESahKsIRDgV4dS7TbKPID/4ojRk5JOyY6QY2rmc2rEteCKKT+N+ct/LqFLKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877969; c=relaxed/simple;
	bh=FgISdIgca1xXqXP2FH+qblBtIUVIylfyUHamP1YgR0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1akHGF3Jlx/uMrSp2p56D60Y+qDvoUNrMmbgD5Mjmu0ySSbtSY330lBjlOQZcVNpSDfQDG6cF/50Q09QCdeJFsEze5VpwJl2QxC60krFKRQhCpEM3BXa49KtpAVX33trx+n6SDTCE3nTTvko/E78KCpMsK6TJvQDhHofogbECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0kPB7le; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAIEpL022517
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xpH5LnDLqPp
	lqQDe5uMXBSo64o86rKmUu4KIOqTfDTg=; b=E0kPB7ler9H1XBVaItMKmLw/Uiw
	GZPTqVMbhrNYg5mBLE8RcJs1k2duI4GjZrT0T9UxFKB2MkOYVtMXH+UTWjyHuhbK
	eS+60esDczZG8Luu8n1apcCt72moc80lqTvhoQHVxTB2S8t3j7aJX/DkE6y3t94U
	ypIok3jQYHQwZ62nYPKvIe7nNFxbJdwA3eVFNii40nAL4W0me/3JSYPuWRNTQKkv
	pCnXgXEHiwsvc0jwYv7af39KnbAqllxu5WvsuYDJfvz/jvanN/6P40Sg1u0L7xfK
	LHQqK7Ur5sBADG5nflWzM97/OFdyCY8ywTXMhrYhfaHlTgho5kTvM7/m8qQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f6b829cfso1038555ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877965; x=1751482765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpH5LnDLqPplqQDe5uMXBSo64o86rKmUu4KIOqTfDTg=;
        b=iEQr/vWH6We366rSJAaPkF2R4vV14SeSNBrEAQdQMl4XufGFQPUA8ttfREannoCvo+
         ZQahlvRz9Nm9eo9rc+Ybzi/bEJcyn1HifXfS2zq66U2nUjD6lez0o83kaK4p1ZwepMfC
         9GhmXJ5R13gClVT78W4B4Gy153nzi3HDoxbS2iMPUfqj3BvCg4phdM8fB2Yd0oAbR5ST
         ggdnB/hWZKtP/Lb6aS+kp8hzrpDDS+f3lHV5pFz1CNF0baAzHkvgfD8dVIBxITT1ttGm
         Ru4uT3DkxuY4sW+aSAKP3n7iVV2asxVfKh98A77hF4RhUR54KWLrTNgUPWBbF7ZNIzxh
         99tw==
X-Gm-Message-State: AOJu0Yz8+I4NX274BD/kt4Jo1pTxksGguL7WKZHndUbMZ3jf3qg3Yrb6
	5U5+P+YEsAWZvooI8p+hWn6H7/sVM/pHere9yY/PlU6tKNCV8enPKHCN/dmrwrVZfPAJKZL+UBa
	S4KlSPUInBFXssXNZGNE8zAwUvA7S8XmX12FMbISmrT8y65cfcKjzYLWFlayQfOHr5anU
X-Gm-Gg: ASbGncscAiFWxZG1PmylUX4GLiaiSApQJ9eHiMGkdkGvD7e6AYD/pwSAsTWfw4PibPo
	dqGBc8I/T96Ya+W9qjVf9Epju3otj2LqN9IVJGWUtQadAwP8q/bnCbk/FnoPP9ZkWRTCGEF30vi
	61x92nmBsm7e9ZAMVT5HF3vRhuFnM4JJNgGG46hjTJST3RyvI4M+ufaBLbwlaJVSiiD9ADT2cqh
	woIbRDVAMjphUUc6zBoTDqwpAYUkry7gHzWsABIqEW9pwq45FtbPwuZIZEfJ8Q3mfHtc1oLLo2H
	lG8fPEEkWrmgM/+w0VLVvPwoXoF5UxJs
X-Received: by 2002:a17:902:e88a:b0:236:9726:7261 with SMTP id d9443c01a7336-2382404d970mr68388435ad.39.1750877965183;
        Wed, 25 Jun 2025 11:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtVUuEZYb41RLKeTVjavf65tKB8NX8TxZxdhFwSQPFNvRi5z1jUVtVE9kmMQW87zfFtvY+yg==
X-Received: by 2002:a17:902:e88a:b0:236:9726:7261 with SMTP id d9443c01a7336-2382404d970mr68388205ad.39.1750877964797;
        Wed, 25 Jun 2025 11:59:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8680b07sm143765655ad.182.2025.06.25.11.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 42/42] drm/msm: Add VM_BIND throttling
Date: Wed, 25 Jun 2025 11:47:35 -0700
Message-ID: <20250625184918.124608-43-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c470e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=9ew1I-5mWBoiHqGEK3IA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXx+g5pWo0d9VZ
 kHIEHzMfAZORYVbK4rLwl+8DtGKdbxw4X6TyRWFTMjJoUKW34XHLl2be6UttrKneyby2vStCYmQ
 0XPr9QVVm99dChroMuf9bOksCVprEFf2S4k3LkZFTyxsOGk39i1mV+Li2AtO56akNg4xdrXNeWd
 p3vOhaDTs0CyYaP9fgcfrmeoe8Rf0p0boftGkYkov22vxE605zbNBfj5SL7VIZbxsj+jWBiIKRJ
 UJEhjSYY6lIwWT2mbfGj4okEEX3bgy0Sfbon35tjLUH+pBLKeMUc+93EUjZo6cSISlUQW2G8vHo
 VbRQBolJ+t5neNFV1Nfgq7cLvZ0f0eQQCABF6nGv74kyNDiJ0mIuUiPGbpf+dHfCseOSi+vJFU0
 +K6EIGXRHP/90hg4hWBPYJVg3Go/B5ajcdmuIqpJzb4hWtRDMCXRClpkxzwDI3KZDeE4ME2V
X-Proofpoint-ORIG-GUID: ERUZ2TLfrH1gOPo_IBqdRs4rWIOxWCVo
X-Proofpoint-GUID: ERUZ2TLfrH1gOPo_IBqdRs4rWIOxWCVo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 23 +++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h     |  3 +++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 907ebf5073e6..bb3a6e8320c9 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1089,10 +1091,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			to_msm_vm(job->vm)->sched.job_scheduled,
+			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1428,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 31b83e9e3673..5508885d865f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -555,6 +555,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  *             seqno, protected by submitqueue lock
  * @idr_lock:  for serializing access to fence_idr
  * @lock:      submitqueue lock for serializing submits on a queue
+ * @in_flight_prealloc: for VM_BIND queue, # of preallocated pgtable pages for
+ *             queued VM_BIND jobs
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -569,6 +571,7 @@ struct msm_gpu_submitqueue {
 	struct idr fence_idr;
 	struct spinlock idr_lock;
 	struct mutex lock;
+	atomic_t in_flight_prealloc;
 	struct kref ref;
 	struct drm_sched_entity *entity;
 
-- 
2.49.0



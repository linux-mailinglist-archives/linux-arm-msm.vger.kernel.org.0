Return-Path: <linux-arm-msm+bounces-60413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B85DACF747
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C16D189D976
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8003A28A1E5;
	Thu,  5 Jun 2025 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt+kGGO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE528A1CF
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148442; cv=none; b=e3MPdoC9K9i39eHZqiw8gzHrnuqtOvZI+6CmJADFepAR0E5BtO0D1+wrTeJos1cbbkjVEWbX8V8ZV/fN1keTTmGhwOXlBQPgEmEXXtSG7XTvQ3lnloAkkA9H5pYtM4tkvxXEfLzV42DVQQoRrYmnSbOxVC2Gk3akoYAcGxqZYDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148442; c=relaxed/simple;
	bh=EplCkbkulILusxv/wohoVfpD+NhRaGSSQ6P4eW0lfgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5jfGrzP6Iu5UmZV+ykBXki6aIolKQjzuXfUm+r5SLjqTIMArw2HanG6TAQW6YFsqRx5OqtORd+VLZp7MzNBwD59P9KhZF4VoA4mN1s3Y0+G33oE4n6Y9ZMXf6NS48fMjTBfmTmkk71l4Y8bS3dUvd8ovuwFQMAbdQGxhBX8Uw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt+kGGO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555A0b9t012737
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aq5Mlb2wvM6
	cddTJVtPFg+Q8+IGCZmAcY73uOcj02Js=; b=Qt+kGGO5q7zuA0bUvX990t53AK2
	aorO+Z98d+v2HySgmc1Jfv4IpuLsqOC2N5HGaIV8myIW+CyAo8cuSyiuCcmlNod3
	BynZ9OJJ6UtF+LnCg1MEyCPjAt3YIQa8LBnGz78er7c4lHi2eL7LEERSaPJCzSgf
	LWJmsihV6AN/SJrIG4pCQu0v57sUXC2Q5xg4+GUx6OUCnFzZX7kdiLKpu7tjwfh1
	JjnqaYGk/OVU6Cz9wEdhTPwEhtgYrME8sOxA0GHmqSfP4ezA+TG6uwmENHbcNvFk
	LxyNgqJ3PzQMzNOQojJwa3mURpQmYl+A7Iqtm1N8PoTuK4qVzKPLiigyYiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be861h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2355651d204so11999885ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148405; x=1749753205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq5Mlb2wvM6cddTJVtPFg+Q8+IGCZmAcY73uOcj02Js=;
        b=U0QeJHYQ6Yd7ht2bCqHCxlfX933kT+I1EUdkvRivHg/6SDeS5LIbQaBMvjTWmwR9lw
         dxTKjN+pQN6LLWnYs1d/Qsn+cQYW39ltSAOhYKyxoZGMg9CYnZTbOapfHYbkMc9/JEU6
         RaogbIcnHwMhsQOH+63pttTihf1r1s7RVmFDZx6h7syqcaaSOu9Kimy3VDxJC8HJOnLt
         TSrY4ol6iUJu4e2VfvIbA/sCK0sekPCyRcDW3QJjPnIvH4wL6yOhbu2XanHPcj67DJNo
         ex4RjV9uXi29z4PfJRRiJsBw1nT2GwiaQBDwV/xAAlGTNc+4Pz6qUj70QYUoBP7YfPtp
         OViA==
X-Forwarded-Encrypted: i=1; AJvYcCVE/csfUXqMv2jfBnbBrNyPkcXvkysEXV6Y49neZwuq4zokLyqLUHf5FWL6sQbgkNaEEltqJ/VltTv/WgXZ@vger.kernel.org
X-Gm-Message-State: AOJu0YybffXTHzLJoGFJxpU4iLPyu/rtqjbsIhtPONBMpDn0/itaqUxl
	NIlUsg46Ae6rXLLfenKaikKVLrTIgDQP8K/mQ9IUEz9bmIIEMSA711dsVUYOoFEotoDaej04h10
	typJALv05riDqDXiKHCwoe0HDpRIT2oKENFYT4Z966D2OICc2G6HOA09xXU2QKQCEtROa
X-Gm-Gg: ASbGnct1IMs2N18/tzPlpjA5C3XQ1EapKe9FBnr4yLq5uqPZkFbZFMBjqikGrviE1vD
	oZO4y56jXhD73xJorAAxuE6akbCzoX4uWvqs3cxC5eB6NjHmXm7JSXdBshH2PLTN1tDsDk8+Niv
	dwwShGEI6kWhJsO6hbN6Xa+cQyY9IXoOVlpDXYKa9LElRwKWpa8l9cG9GNX/FxMTmUMuj7MBQDF
	VwkIOfHSj/Cg5k8EedMfza/2WZRE/YwaMU4xnDNWVNhIbnI8Bdqe3+ryZSrsIGA5LFka1QiWHyV
	jGAyS6qMgyZMB7dsJf5PsQ==
X-Received: by 2002:a17:902:ea11:b0:234:f19a:eead with SMTP id d9443c01a7336-23601ed546dmr4753945ad.43.1749148404751;
        Thu, 05 Jun 2025 11:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv4pHc4fnYu4s1RXNlIzNDDJsXYuIILJZfiVF+w0RPFujOSg/3fi9tGM3rphg+6/s7TBErbQ==
X-Received: by 2002:a17:902:ea11:b0:234:f19a:eead with SMTP id d9443c01a7336-23601ed546dmr4753535ad.43.1749148404374;
        Thu, 05 Jun 2025 11:33:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47c0sm122369965ad.175.2025.06.05.11.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 40/40] drm/msm: Add VM_BIND throttling
Date: Thu,  5 Jun 2025 11:29:25 -0700
Message-ID: <20250605183111.163594-41-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e316 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=x_1jt8ETcTvhpFk4nSoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: owZS26_L3gCNS7o_O4mEOF0niKeGPNUc
X-Proofpoint-ORIG-GUID: owZS26_L3gCNS7o_O4mEOF0niKeGPNUc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfXxigUR4YUXblC
 9b5DDEoET+IuHGLppx9dmTo2FdokC1q8v9GJDFNMSEfYBp96uLUO8sN+pywZwAU3JAxupKuwIWd
 EeLPmPYYBFq2ridJrdtqB3Rp/vEGtowRe1Mws35foYRrhCaAubNTeEjJy+gSz0fYu8y+f52CT+e
 g1xUP/iE6c9OSWYXsWVfWoK8jU997XvSOFTztolUxNuvYzd1pE5BbTwrG6jqf3R2Qqj9yXEr9Ij
 +W2wfa+1xOKmCaYrw4NdRC0Lyfq9rzPL8SW2RxrfUQf1/31Oi0H9yT4yE8zhanW5aa22EVwtnLa
 ZmKDKkFSJN72A13cHH+Ih+lhRbD9iPTYpGsKxS3JhafsiRb+WgybQ8SAi+PFR/TTQSiSj9/4w4y
 u4VcoZOlk8puugtixinZ2YzUgRDAaeTjQWRRHWneRZ9n33dDCGfx4A526QC+HmGrGcn2HPrU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166

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
index b6de87e5c3f7..83f6f95b4865 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	mmu->funcs->prealloc_cleanup(mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &job->queue->in_flight_prealloc);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -1087,10 +1089,11 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
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
@@ -1119,6 +1122,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
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
@@ -1389,7 +1406,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
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



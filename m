Return-Path: <linux-arm-msm+bounces-63029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A385AED0F8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89D3217447D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C2126A1AE;
	Sun, 29 Jun 2025 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VjChzmTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F97266F16
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228244; cv=none; b=IzybtKwTPdLCjNVG4VIfdsDB6uYnOSmCkS5LS1Jk5MxV7KTOW90vYs9HqFBMeyCGo0z4iMHKOxffQwnu7Vmf2mJdo+SeGNzYRM/3Jdjg/aR3xghfbsDtCegj4lsKZT1MGHR0wRfIpLfCDCFWN2bWfY9R15ZjgYkf2rmEpnwFEKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228244; c=relaxed/simple;
	bh=GA/euJZvPnrn04HD6YSSPSTZHhMAiLYipK1JN69VVyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UW7gJE+nSNQbcjrB/trpkdFkQKZZB42L3oxWRiVUHswjmuZoTDEW6DdCFDlTtSyLyQFB4UrN0tbFx8DOCRf/fkIal+6atoGtWNlpg/QvRcdShQ6d381i68ac2gXtWQcC3S6LasTQWwRrPayD3kcX6ciz5aidP7ev/PH9gyaK7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VjChzmTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBViZ3003873
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H+PwAR+LcFx
	tNvXZN+nlHyJ0v2ma6kEtDHyNZ35oe64=; b=VjChzmTfPSxjfWmUMp8tV9s2/Gs
	ED6SfbfXB3F/E1CCpfu9EBlCJ38Ss1XUqy9YwMPQ1Mr6zPYXSaowRap1J3otU0oy
	TgBqYzYwAtGP7HyACUvsGLA4IHCOJ+a1G4AvndsSR/y5TVFTdAiQ3wqKjIXDSLHO
	7mMrQW0/+KFhclAidNpWzt3WWnaSPhga269VtS8dV+KO4uvsDXwqzupEMD0jQrY6
	PvxnXzO3djtea/hGuztR7db1ENiiTZ3Rc+/sM7g3L5JhJpVyUb/KA+M/61xKladK
	LtxkI+6DXrKEIeyR6CgKnlosfAYlYjWpfZz9idw/h2o2ykzZZAgiJLbtkTA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tpmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so873106a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228240; x=1751833040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+PwAR+LcFxtNvXZN+nlHyJ0v2ma6kEtDHyNZ35oe64=;
        b=XG4AZw3JNbpUYeTpUcRul5puVu9Ffxl86m6BTJZTfXih0v9rbELILOdBhraVUof9Px
         CeUVQS6VNSg69RPNLDfBW6Y7IFuqwXzxV5rmo7MPYBRLHkDcYx08hVmeAdf+nlLS3lWG
         gpD3/9p7Slcgnwxrkl7gGOqvNIQq8FxhzWaWCrP35CUnJio7cj4mhOGCsLnvpjVWN4i3
         WAFk7u+m6dA315dpyX0ggypP+vOQ8JI/77TL/ABixP9poQmWSAcKLJlWqegB1T8nEFIO
         Jt6Ap+CPwTWYiwe8PposxBAIgtgO/8DVwjIMXLp2TbSGxHxRh0O13AtlVqDnjyJJRSFu
         aRmQ==
X-Gm-Message-State: AOJu0YxWnFR3Y62SITJ1LRY+ZKOr+9GFLX3w87xWlEa6e5bXUqgsR+Bd
	3lha4BunmLFJuyUsz4btlNszvtti/XwCTCHc8qK5GNvWEl68v2yOqvt2OL3L/gpwXbZN1oEWNf1
	ZYQT2VYajvysdklqWXVbPiLaqDMMLMLN/3ft7+SV71rXSFk/v8OecqSYW6Ynz5v0H1528
X-Gm-Gg: ASbGncv0E62bA/D10oaIQIs9A3oQTX1ZnKYUq2/AhQXDXzN4KTok/TVYJLcht1gw/1J
	zGpeWLlNz2F8Ir2J+J5wRQsicQrnOgiEHuRBSfAfFaQ1YaMltof6XA0c/qhYkdP+XQ97feTd3ir
	w5RIGSibPgqCl5ts21dC0N5g1gWu/OCIcL52G/WOl7j28MtnojI+JU8X68FvQIicGa+vlC/UMFp
	r0aNqHsyJ7KqM6Oisoy4Zrz81GB00hB3QXPY5ntv9o/0X6Dy0m0nUcj5gwF3gcRz3OIp8mB5LoX
	VEJ0LulyhS4n25R4p0+aKWDt9RuTDjqUkA==
X-Received: by 2002:a05:6300:4041:b0:220:27d1:828d with SMTP id adf61e73a8af0-220a16a31b8mr16389657637.19.1751228239886;
        Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+DNxLLr1TV8ybCvuLW2bEtYQJQDNo3DFmHJc+uBq6Qmv0Y0YvTITh2swb06/IBU6JeCCoDQ==
X-Received: by 2002:a05:6300:4041:b0:220:27d1:828d with SMTP id adf61e73a8af0-220a16a31b8mr16389620637.19.1751228239357;
        Sun, 29 Jun 2025 13:17:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5806380sm7545854b3a.172.2025.06.29.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 42/42] drm/msm: Add VM_BIND throttling
Date: Sun, 29 Jun 2025 13:13:25 -0700
Message-ID: <20250629201530.25775-43-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX47qjfDYzYVhO
 g8QYnypiDhxkNCnjFyI4bQJOfyU4RnWBq4mk+3PelVRcR2GY7SOpXwEb3ebMy/2DxZur5pnp8Fp
 oo+uHjNPVIh24w3yLmPcySjgg0BVa5Zh1QjJl7eNLd0kka4dJH4cEDWWO7dCx96GgmDOAfnlJ0L
 7eJ2WIUUf0Ca0P5TuZERoNAhezWd3Qu2tSbnQJQ7K0bYmDB1fPKsdgKnOcJkdS9YKEpznzhgqIR
 ZCUiIPnX7kyJ4ry4s5rZD+YFzg46aepCLo1mum3EeoTbRxZS28nmeQwou7MlmIU5ISetXPM/XZY
 rMSclezkKwbHojt9+IPYgxt0+a1nuAUdGmvZ8048pK9+0Df5SxzxWJUrEqbJXvBZXIUnn5EFk0w
 OZXV9MgKF2WLZaoXOcC70SofWrW2oMWKNDu8tuBC2O5KE3ObdigBkXVf2Bi/WovHSd+ntmQn
X-Proofpoint-GUID: XbyJLnCtKN12MXrJttvtoo624fag924V
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68619f51 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=EjYnvkII5fvYeB9zoMQA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: XbyJLnCtKN12MXrJttvtoo624fag924V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

A large number of (unsorted or separate) small (<2MB) mappings can cause
a lot of, probably unnecessary, prealloc pages.  Ie. a single 4k page
size mapping will pre-allocate 3 pages (for levels 2-4) for the
pagetable.  Which can chew up a large amount of unneeded memory.  So add
a mechanism to put an upper bound on the # of pre-alloc pages.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.h     | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c | 28 ++++++++++++++++++++++++++--
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 5c0c59e4835c..88239da1cd72 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -75,6 +75,26 @@ struct msm_gem_vm {
 	 */
 	struct drm_gpu_scheduler sched;
 
+	/**
+	 * @prealloc_throttle: Used to throttle VM_BIND ops if too much pre-
+	 * allocated memory is in flight.
+	 *
+	 * Because we have to pre-allocate pgtable pages for the worst case
+	 * (ie. new mappings do not share any PTEs with existing mappings)
+	 * we could end up consuming a lot of resources transiently.  The
+	 * prealloc_throttle puts an upper bound on that.
+	 */
+	struct {
+		/** @wait: Notified when preallocated resources are released */
+		wait_queue_head_t wait;
+
+		/**
+		 * @in_flight: The # of preallocated pgtable pages in-flight
+		 * for queued VM_BIND jobs.
+		 */
+		atomic_t in_flight;
+	} prealloc_throttle;
+
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
 	 *
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 63f4d078e1a2..49f460e4302e 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -705,6 +705,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 
 	vm->mmu->funcs->prealloc_cleanup(vm->mmu, &job->prealloc);
 
+	atomic_sub(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
 	drm_sched_job_cleanup(_job);
 
 	job_foreach_bo (obj, job)
@@ -721,6 +723,8 @@ msm_vma_job_free(struct drm_sched_job *_job)
 		kfree(op);
 	}
 
+	wake_up(&vm->prealloc_throttle.wait);
+
 	kfree(job);
 }
 
@@ -783,6 +787,8 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		ret = drm_sched_init(&vm->sched, &args);
 		if (ret)
 			goto err_free_dummy;
+
+		init_waitqueue_head(&vm->prealloc_throttle.wait);
 	}
 
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
@@ -1089,10 +1095,12 @@ ops_are_same_pte(struct msm_vm_bind_op *first, struct msm_vm_bind_op *next)
  * them as a single mapping.  Otherwise the prealloc_count() will not realize
  * they can share pagetable pages and vastly overcount.
  */
-static void
+static int
 vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 {
 	struct msm_vm_bind_op *first = NULL, *last = NULL;
+	struct msm_gem_vm *vm = to_msm_vm(job->vm);
+	int ret;
 
 	for (int i = 0; i < job->nr_ops; i++) {
 		struct msm_vm_bind_op *op = &job->ops[i];
@@ -1121,6 +1129,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
 
 	/* Flush the remaining range: */
 	prealloc_count(job, first, last);
+
+	/*
+	 * Now that we know the needed amount to pre-alloc, throttle on pending
+	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
+	 */
+	ret = wait_event_interruptible(
+			vm->prealloc_throttle.wait,
+			atomic_read(&vm->prealloc_throttle.in_flight) <= 1024);
+	if (ret)
+		return ret;
+
+	atomic_add(job->prealloc.count, &vm->prealloc_throttle.in_flight);
+
+	return 0;
 }
 
 /*
@@ -1411,7 +1433,9 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	if (ret)
 		goto out_unlock;
 
-	vm_bind_prealloc_count(job);
+	ret = vm_bind_prealloc_count(job);
+	if (ret)
+		goto out_unlock;
 
 	struct drm_exec exec;
 	unsigned flags = DRM_EXEC_IGNORE_DUPLICATES | DRM_EXEC_INTERRUPTIBLE_WAIT;
-- 
2.50.0



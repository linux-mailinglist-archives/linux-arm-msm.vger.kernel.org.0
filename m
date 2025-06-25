Return-Path: <linux-arm-msm+bounces-62549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8951AE8DE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D591D1C25B7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AA92FC004;
	Wed, 25 Jun 2025 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZzKlFUqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01C2FA643
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877963; cv=none; b=DD8ncmqyMADKPR9kSss+Y8TfnQ+77ZKSXI/86BJstwFWuN9zBFZa3c1GQa3LLu3085Hrat99gieTXGpuR002PTZu/rJlVN8EPy6BcwJHvnI/zhl63PZheUMk5r+doYw4sQTWtbh7b2OEYHs6hWNxvAghg8nXM+OYcuk+2IL3MdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877963; c=relaxed/simple;
	bh=PsaIIHYp0cre6Epw63fH/Cz+I+fRn0wM45fSqqUqlsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJTOA/21zeHscBcUeZyJIOHSPiz45ldtpqu6LYsm51lSlZCZv37gZzAnuKe0m0oNBJsgaNMUrOjLFaLOI69qL5R3dcqBUhKgxlqIcU+xnXrwTEXgS1dB4QJ+zM5D1Z5kHe1B6qR2KRkx20LYOQ+OV4Tdz9k80sY9svKGWtpi0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZzKlFUqK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDBIIi015686
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=St2ndJNB5T5
	qxjvTBi+Qboj7ahOA3a+vNQ3fmIRIIqc=; b=ZzKlFUqKEOVyFXcMOdJUfarENsq
	O2Eb5I7wLaeCVGo4vVuFEMsHLMiOzr7K1po5u//ATfuu1UzO7AQrZqYX0JFY3u+1
	4pONbArdLl0JLXNQw5fuSzeI3/4vNR8wUsI7ZC8iU3HtpjCGX+aPRkBQEae1yB8g
	Whjw4ki6Shcf3Z/B4kLj8W4Vvawr0+tQkwpnLQ07qj/UWBrs7byXdnzbnqzNqQZn
	q7TP4eABYaUMzzZJcKUx9fGdpcyezNd2j+qNEEcdrl8Ah4xyA7paoj6QVIFLvoBt
	ItFgY7A33husmTVHRyCBwiWpADIB++/OUE9NXA8XHXcM2j8yLrDtvlOchYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq15ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234a102faa3so1564525ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877958; x=1751482758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St2ndJNB5T5qxjvTBi+Qboj7ahOA3a+vNQ3fmIRIIqc=;
        b=uVXRG9irS7eHRkWg61OiWvYyXrwP7vcTJQbP9kQq17vBUpCg6Hl0Vo8k9ivaMtjnaT
         +roUdl/YonIq3DepJMS8P0TCgcPL1XvoHyEBiiTVjxgkgJiUTjxzWoQI8P4B7iEm9xG5
         KWye7r6Lw7nynqBS4IlcxVq8hai8FmejO7bApa4ZfDDMzrALA4d6S4nriaJ6LVzsR0s+
         vOuiuBC+M1R3ErpfnFC16Vg6g01DDbuxMIju7hrtmIRt2Rn17O+xQuy6TnH6icMRHYRy
         WDxmUetxLr6cSg9n0G+iy57JGkcg+MO7eyUhujKYpWR0vSlYf2TMXSZvv7/g9T8qNCgE
         lYcg==
X-Gm-Message-State: AOJu0YxJKt+aFqKoouATsjBfyrTvwctuqsd1hkJ86JX2MvJUeKcobAVI
	OgX08CM0gILn3QgFuH32KMsMnk0giHz7p/z2T5bO+KizMXGrgkJPp5t/JTAOwysAUoiXIvzdpAL
	GpabxnNGTrQdmRtY7oRNxTPuzaAeI5uJr14DcKF12+TgkKk4cea1dU/GpFAr6/aMPvJjt
X-Gm-Gg: ASbGncuxr7ANHUm9ciejE2fCW0e0XfqMgtOFLFVUy3DQgPlHoOcb/XnxvHJpMux/9tj
	pC7miklYqVal1DJ2VNMKv4E2+YPKMU423zO6h8Q2PqRvs6TdapJLpvZTO0r2PpTBYFzCtJFYpgG
	IbVgYnsEzesBqff8TZBb3zcUVwBo7ZCNqxvRl3F2DOqLDCSpKQZLxW7wKr5v6Mv76fk+iTiiXcN
	1BHOhz2ByvGbqy+QlEG6AXckKqozGRoGm/PKhRc2CK6pybG8rH8/qU2knojDnKz4XQBaSe1VImY
	dP2KFGTFUn9ER5gBEgC2qSLMzKYguvon
X-Received: by 2002:a17:902:e890:b0:235:6e1:3edf with SMTP id d9443c01a7336-23824039f7amr77982965ad.34.1750877958532;
        Wed, 25 Jun 2025 11:59:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/Y9lB16IKtQS7RqL3y30IZ+jiD7LUeSPJzyPzPcOjdlpXE/X4dI8MmjryvmUd3anc1LWsJw==
X-Received: by 2002:a17:902:e890:b0:235:6e1:3edf with SMTP id d9443c01a7336-23824039f7amr77982545ad.34.1750877958122;
        Wed, 25 Jun 2025 11:59:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2380d1a9d79sm42665515ad.93.2025.06.25.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:17 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 37/42] drm/msm: Add VMA unmap reason
Date: Wed, 25 Jun 2025 11:47:30 -0700
Message-ID: <20250625184918.124608-38-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c4708 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX0nNgq/pxtbsa
 UZgGHwoGibFDCc5ojfCSlVCGfy0W+jwoDGsHf3Q2FN6lwkgW+mi6Ve/psl+YUlj9OmKvy0WkbQl
 U+8g/VzgDd/oEN/97l7aD5LYl+BclVfLHzNKzHPq/7IFQzYyyycf6VYwdCUU+6UbH40T8DtJn34
 HIw8qeJX8EDpPUs/39e9cMIdWbZS3IynpNcJhmUcCGTbhgle8Fy9/xgAhes78zIGWGCrFosFBNS
 UYPQGta12TpfoGqC4Ht7lOWMNb1FdIVZxkAC/X/FcCywwREXwogzb2zHHidpn9YcfqcBKYBHwI/
 maltXusgKlX/dZe2dPAAvQ9gqgEx4LUSkP1KF6ejJf6pIUSxFbRNSho7hpISTrl3mhUXFOGVPkc
 2QKDSg+xlbreFitsBidoIU/tT68OL1nGWkpdbgez0eHo5ooT0Ltgc2Zgo+hZgKQccilkJMn0
X-Proofpoint-ORIG-GUID: fYEs0QRdXod7iNntIkYJnwSjMO0xj6OK
X-Proofpoint-GUID: fYEs0QRdXod7iNntIkYJnwSjMO0xj6OK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Make the VM log a bit more useful by providing a reason for the unmap
(ie. closing VM vs evict/purge, etc)

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 20 +++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 15 ++++++++++++---
 3 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index fea13a993629..e415e6e32a59 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -47,7 +47,8 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 	return 0;
 }
 
-static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close);
+static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+			    bool close, const char *reason);
 
 static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 {
@@ -61,7 +62,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "detach");
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -101,7 +102,7 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
-	put_iova_spaces(obj, ctx->vm, true);
+	put_iova_spaces(obj, ctx->vm, true, "close");
 	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
@@ -429,7 +430,8 @@ static struct drm_gpuva *lookup_vma(struct drm_gem_object *obj,
  * mapping.
  */
 static void
-put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
+put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
+		bool close, const char *reason)
 {
 	struct drm_gpuvm_bo *vm_bo, *tmp;
 
@@ -444,7 +446,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, reason);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -625,7 +627,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_unmap(vma);
+	msm_gem_vma_unmap(vma, NULL);
 	msm_gem_vma_close(vma);
 
 	return 0;
@@ -837,7 +839,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "purge");
 
 	msm_gem_vunmap(obj);
 
@@ -875,7 +877,7 @@ void msm_gem_evict(struct drm_gem_object *obj)
 	GEM_WARN_ON(is_unevictable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, NULL, false);
+	put_iova_spaces(obj, NULL, false, "evict");
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
@@ -1087,7 +1089,7 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 				drm_exec_retry_on_contention(&exec);
 			}
 		}
-		put_iova_spaces(obj, NULL, true);
+		put_iova_spaces(obj, NULL, true, "free");
 		drm_exec_fini(&exec);     /* drop locks */
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index efbf58594c08..57252b5e08d0 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -168,7 +168,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_unmap(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 729027245986..907ebf5073e6 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -53,6 +53,9 @@ struct msm_vm_unmap_op {
 	/** @range: size of region to unmap */
 	uint64_t range;
 
+	/** @reason: The reason for the unmap */
+	const char *reason;
+
 	/**
 	 * @queue_id: The id of the submitqueue the operation is performed
 	 * on, or zero for (in particular) UNMAP ops triggered outside of
@@ -242,7 +245,12 @@ vm_log(struct msm_gem_vm *vm, const char *op, uint64_t iova, uint64_t range, int
 static void
 vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
 {
-	vm_log(vm, "unmap", op->iova, op->range, op->queue_id);
+	const char *reason = op->reason;
+
+	if (!reason)
+		reason = "unmap";
+
+	vm_log(vm, reason, op->iova, op->range, op->queue_id);
 
 	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
 }
@@ -257,7 +265,7 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_unmap(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma, const char *reason)
 {
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
@@ -277,6 +285,7 @@ void msm_gem_vma_unmap(struct drm_gpuva *vma)
 	vm_unmap_op(vm, &(struct msm_vm_unmap_op){
 		.iova = vma->va.addr,
 		.range = vma->va.range,
+		.reason = reason,
 	});
 
 	if (!vm->managed)
@@ -863,7 +872,7 @@ msm_gem_vm_close(struct drm_gpuvm *gpuvm)
 				drm_exec_retry_on_contention(&exec);
 			}
 
-			msm_gem_vma_unmap(vma);
+			msm_gem_vma_unmap(vma, "close");
 			msm_gem_vma_close(vma);
 
 			if (obj) {
-- 
2.49.0



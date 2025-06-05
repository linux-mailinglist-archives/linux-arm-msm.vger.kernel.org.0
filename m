Return-Path: <linux-arm-msm+bounces-60406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1353ACF73D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53FA71892368
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DC8289823;
	Thu,  5 Jun 2025 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P4UxTq2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B346227E7F2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148432; cv=none; b=UyopbGl8RR7liNrAhfyDUGYWoD9bkqG60IkOOa6YUMty65Sinas8lNvV6pBR93JO4YsEYh+/hY5Z4EZbSMvMwjETBdJQH4vpiKvBxSe+kTZgioPP7dcrdL9i1M4l4ODkFfE5fk2QZhjTKQeaUXJYRbK+Wcju3aSbyU4bR7Daj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148432; c=relaxed/simple;
	bh=q1iQ+ZwuiqvjwJZLXEoi5s9n0yhPtWG5EPeGFJIoVxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHqKdUIJiD4sxH0fRYGakm63zMQXCg9XzfASanmb7rNRWs82QvmjVVRmc/dMpleDs7jUpoErikIoJ8WWWuFPccpwwKYn7Hk+uLCCK5e2Mp32FSff2xAeyzy0b+ECdgzwOn2B9wXzPg7EFTvgxQAR8wauNqC71jHE+W+Opq6Fk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P4UxTq2K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555FgEfG032469
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mhg+7koyMe2
	2VLdx/7/ei97p7J97kc5Kcsq5C3Qay4E=; b=P4UxTq2KCtS6reJ+1/wpbRQgr1Y
	8cCv/eyfWiu/9wuc4OR2PnqsZQF3DqaB3Y+tLC7p0polvQyw4vnWRB/QCQxQS4Hp
	NDee9bwLOJOmhykTYn+6rKvkEuLCsGOQUmF/z2/AyTtWCKCyr3RmmZHYbye6qegn
	KMEPbwZ0EeJPXPIFT4eYQglPpKlJYq+X6HBKh+QL5m6C9GwjEuW4yUkngx/rWoyp
	rmoRgqNVSMJX7dq4vOasLNZRitkJTFb9Pchk6HdNdNZ5Z+irN+Iq0mXSCnfBrqpA
	4UXtSju5VJYdYlttEXxHv/rNibQlG+1Ox9vO8it4npzplpBmfCUDIti4HUw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv17xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so682810a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148398; x=1749753198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mhg+7koyMe22VLdx/7/ei97p7J97kc5Kcsq5C3Qay4E=;
        b=RfXDYdTb/UNBshibgSlAosuUNXxh4DkWCxctEMs5lb8ogzk8tApy5O2SU/K3E6HbHr
         FijAdUt6khOuEyRS00I2uMSbB2JxSoEY2O2+Oo6/806qVNA+eVKdOH7Tg5DaNzszWJ+r
         v8jdsLzsjUrwEncP9EdTb/5LFJdmqZKnIJQbuvY+/rOW9nitDFWgOJH+6EBTexToM8Ie
         Fy/EW4DnalZuXTWzuqKXgyXyI5lc14YLJ2+koDONxqNKwboogI0JlEXbqjJVOZVoPTGm
         w7PiHW3w8N1q3kWBoZKqfbTtW/EVSjqKE1VObj8ysmOxAzNbYSYCN3cuidvKB4SfuebO
         CBUw==
X-Forwarded-Encrypted: i=1; AJvYcCVyBLlAZZupEI5YvV/UFQwpdjXMLYCG0pkT2f+8oKKcxxYa5MYE6AJ9hwPrgZRRfyVQK9gg0O858nV3Iu1H@vger.kernel.org
X-Gm-Message-State: AOJu0YwlvhPKuw4l1VA9tI7CofMN9Sprkw2B7V+OqenAsMG3jspVHT9I
	j12ffrFgVFcdAf2TchSZbndLe2hDc1W0S1MnoxEzm8w1VBuZCzw2J9xF4b8uYneYgzVlZuBulAN
	mZ0Kao/hS1Qq6zeIGI+BGKRz8HYeo7hI3kKKS+Q/whQGbd4gbc0eWFmVqFPHXOYiEIquc
X-Gm-Gg: ASbGnctZBPF3+ftglQojcSLjzcFn4YsWSBcQaZw/4dqhff0CqxiKqG6g4GOXqFAk1y9
	f0r71izDIN+drwrEFcxWW6Fw/UpTqNxoG9JfKbA51bGLJMth4esidMmBMJSAFP92NaBv0yD7gtI
	dzVB7MjbLrxLg3ioI+tWeavIo+izcIWw+5NrbS7yoIvV7paMDrqmKlnqDIbNU2HLakUh52iu6H2
	X9DhLV1o58iLk5B7rjQ0c8mhGg6ofbFeNv0aMwR4D2FeE7v8MKZJ6KUcIc/QHLWGZzTVu3JfUsl
	SEWrpF3Z9k7Lq98EP3/wkw==
X-Received: by 2002:a17:90b:4fcc:b0:312:daf3:bac9 with SMTP id 98e67ed59e1d1-31347077489mr911962a91.34.1749148398247;
        Thu, 05 Jun 2025 11:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjDsIfx3jrnAvxzEYIjomq05BnDcBK9KkqjdcW/+24UL79HmWGPX0+sBZL4Ans0KuSMxmN8Q==
X-Received: by 2002:a17:90b:4fcc:b0:312:daf3:bac9 with SMTP id 98e67ed59e1d1-31347077489mr911924a91.34.1749148397819;
        Thu, 05 Jun 2025 11:33:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132ad9a4aasm1559479a91.1.2025.06.05.11.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 35/40] drm/msm: Add VMA unmap reason
Date: Thu,  5 Jun 2025 11:29:20 -0700
Message-ID: <20250605183111.163594-36-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841e2fe cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=S93TA_zjY9FrSvCmoiAA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: o_m3Vaq2lkO4M3jndK2-WfxmELGaEYix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfXztoXXOAqsWX4
 Wof4CUdq7JAiObpN026B8S306Eln9JzxewX6aeakty3IOBdibfVvAf6IH5iQjnBQ1qMhO+mp+Cz
 EboSXS+z4js9nw92wenOu9+tocC8QJFi6aHtXC5xlGPp+BJEbgS4c/FTEDQ5O1MCmFcj6gSvOHZ
 jlAEpHqW5xtjfui60mHBrgDtnI4Gv4NbsEocgSXsWNRuje9KJpPCt4rgVpIwjK9qJkv2m57SYNS
 LwuxpZ3Hr4PJC6j8dApG8XX82WtiKP8noJrlGNe8G/lpd07gwl2e+i9SfhZ3yeL5GHnQaz8UBP4
 0e+2RS5NplX9WosFfQS8PYpK4/n75qTQae8eW/ze5HqTNQvAnPb5nXP31qmVpTup2CPG1J0moeE
 b0rqn9ZAYbXKJoSyuFcmnndkMGXjvHrMqqueLJUUeooXJFnm4jv5TbYdr7AyLbIOtTo0Vyjm
X-Proofpoint-GUID: o_m3Vaq2lkO4M3jndK2-WfxmELGaEYix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166

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
index b6760fa9dd82..b6de87e5c3f7 100644
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



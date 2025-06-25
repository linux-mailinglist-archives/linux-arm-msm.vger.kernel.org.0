Return-Path: <linux-arm-msm+bounces-62514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16412AE8D57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9D401BC091F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D252DFA51;
	Wed, 25 Jun 2025 18:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="da29qsGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6962DA761
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877889; cv=none; b=uCYUmNH855VIT6qtQDiVVL769KfyNHgQVlU24YCU/3Y7oYuqmXpxliQ79545lfEK5MCqypDUrG1bwbr2ua0u74IyO1CpM51bXUbG6bMXPLN9OC9wNzL2MGXeA3CrbnJKcmYDiDwhqjhl220OGYO0EJLYqj7ScFW9tC302sfpBqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877889; c=relaxed/simple;
	bh=MYuEJE+0SdySaYO3CVU/uvi2cgNQjyHkEeNQNPJjWt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdreDFcd37HDmlSQrVaUjcO6g8vpaCZ77VgWXcxekqtfDMTn0L88+oFgL3x7sqU9cEfhGl1+nJBDCGKxRXYJOqr1bAfgOWGPW9fEhuG1KG/R7lDRV/raMXGakuJnQueTrZvtJYZs00E1eoByyigJ4ouhPLX5NjzB+pvjgezbwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=da29qsGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCtnMi020753
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IBNhqEhlbdF
	Pkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=; b=da29qsGvT4OtnT+b9gErUpruuBe
	MbPkvR/17J5GQSA0qkKEu59iIjJos0c6bbk6pvDnpS+Z5vgIHrJFUMdhpdbGb3NO
	d51/W1KvSnG1x7rltqLI1dhyr0iGKiUbGOeIDvrir2Tb9up9D/k+Pbxf0e/+plDQ
	yFcve5coFZzFE/tUPwUCZkfAtzyRTU2DhCPl9yrJQa6EmU803aME6t2pecmX7+4u
	8vL8MMpDRi7ecRqy0GK1NIGKpcI9v67iJuVvwmaKqP78U+ozmIjArTSLaRrmRCDv
	JYdLnbeMljGPI0P7jsx+ikSuuXNl3eWM26rHeJFTlcCz8BOU5I6+2Xp9TbA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40ryy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so259699a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877886; x=1751482686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBNhqEhlbdFPkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=;
        b=Kj7w2ARn4aQWGcgVDv9iguek5m5E3T+iAtFkPV2CNBicR/1vVe1U/QfcV7gtDhtNtj
         ++0AlqPc2hm26PJZbMXNX/zwaTV0WNOBAT7vpvLRCcXxBVfL2TcGDZky1TVK6q2HLa0Y
         lPva80Rkj2XyNOf9ejzCIalIMkJng8oAv4Uyq1DK4/3XQserkDWfD5u4O1b1cpp2gSBI
         19TOg8lsZrFJChyXJJzhuAl25WLGPy8F8iv++tk1zCu0Cdw1Q1EBNb/djiEmbSiAI6TY
         xZJ3F339nE3j8vU2P0JQ9PORRZtpV7qNnxkzIjQm/MZ53Q7orPqpSlxiN3sgOR4TUoUk
         g2gQ==
X-Gm-Message-State: AOJu0Yxavnq+PLAu85SWe+tpeK47MWUtS4kHoRaVQlKXXI/7SNifYXfK
	HNdqtQ+BHXPpoaxkA6HBehw1/M2M4Ow6ERNQL7IO+cgsHvCNOZZChneAJodnXEgOtVDc92tFOl/
	6xFCavpK/pWW3QWwpKHpI6X8L0XY2UyDO8qQrWGravMWRlrjOLWa2PSx5mDene6Va0QGS
X-Gm-Gg: ASbGncvzYT+3vKOhsq9yBm/TRF+a5BIF+LGoWEzaJsJRz4qzWtkFR/VR2c39CcpjxqQ
	U7sb393//oCZZGZv0Dj1PeqRHHNDrjcmVgP4/G+FNg5LSiWy9dlfo4CPe95DJHEhT2fKfe1uBzD
	MDBjtnldeaH6eDE1pWXxae0hRWdG9/wT0UQ5N4WnbYYcBrbfWhlmEIF5i4FOyrB8BUuqWmAw1bi
	dqBJtxhjAazwwJe1UulG5Y2hVEiTQaLIwS7X/rzS908ddV3oO0fi4o6tZhXt7TYtNYydbnB4rdq
	kopNe8h/iGcS/61ik3P0S7jgNBfweyaX
X-Received: by 2002:a17:90b:5706:b0:312:1c83:58f7 with SMTP id 98e67ed59e1d1-315f2525a76mr6759985a91.0.1750877885927;
        Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzUt3jRFX6LjL8FjMPCTktnh55EsI2oRHpomnsO0iMIJLz/9ZiWHSBy9AyDL9vaYvsYsSP7A==
X-Received: by 2002:a17:90b:5706:b0:312:1c83:58f7 with SMTP id 98e67ed59e1d1-315f2525a76mr6759948a91.0.1750877885476;
        Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5437befsm2531993a91.39.2025.06.25.11.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 02/42] drm/gpuvm: Add locking helpers
Date: Wed, 25 Jun 2025 11:46:55 -0700
Message-ID: <20250625184918.124608-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX91wvfHMX+6p+
 mvH5/aBXNgyPk2dvioR3sx8j7XwwXfIzLWedAZd7dH1XKwqoT2CgizPBMZbciKYVcJo1AjHRXYF
 7ki4Mr25t9xrxpENotjoNHL6MUMqWss+N8/2LhCKhYTjsxNfWtjBes+6AHiMfo8ZdZMdEAatvyk
 Knw2+sjP0KIp/kV8kyHJILpS//7JGG8rr3QDkBtCL2eBzwsMIxPLz1FiXu9c5sZp9bUgzJrrQNv
 2n53Ue1QtDF9PKcLwR3Q+T1+h6tUrJiHd/DDvGQrFqu0JjP5TWib7DYf3VJXL5MfWhGEeLOurhk
 A/XvNInkMd9W+lrtBKQRQmQfZzYslw0eNp9uFkPcDzUEBiRk0qLMNJOfw19sXNgGmKTmPEeRJWP
 LzVSkRcol3Q6H2O7nsMP7IQKkKD7yWfovlZN/iKVdv6vwED/WmH5GkVZrxkcTnSJZVzBJoQE
X-Proofpoint-ORIG-GUID: 3ZQuqCDljyXMRxQ5Caiocs1Sg5zIxSgD
X-Proofpoint-GUID: 3ZQuqCDljyXMRxQ5Caiocs1Sg5zIxSgD
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c46be cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gXmLzIc8hE4PcKHQkQgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]
v3: Expand comments to show expected usage, and explain how the usage
    is safe in the case of overlapping driver VM_BIND ops.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 126 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..a811471b888e 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,132 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+static int
+drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_exec *exec = priv;
+
+	switch (op->op) {
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.unmap->va->gem.obj)
+			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
+		return 0;
+	case DRM_GPUVA_OP_UNMAP:
+		if (op->unmap.va->gem.obj)
+			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct drm_gpuvm_ops lock_ops = {
+	.sm_step_map = drm_gpuva_sm_step_lock,
+	.sm_step_remap = drm_gpuva_sm_step_lock,
+	.sm_step_unmap = drm_gpuva_sm_step_lock,
+};
+
+/**
+ * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpuvm_sm_map()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @num_fences: for newly mapped objects, the # of fences to reserve
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * will be newly mapped.
+ *
+ * The expected usage is:
+ *
+ *    vm_bind {
+ *        struct drm_exec exec;
+ *
+ *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
+ *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
+ *
+ *        drm_exec_until_all_locked (&exec) {
+ *            for_each_vm_bind_operation {
+ *                switch (op->op) {
+ *                case DRIVER_OP_UNMAP:
+ *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                    break;
+ *                case DRIVER_OP_MAP:
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
+ *                                                     op->addr, op->range,
+ *                                                     obj, op->obj_offset);
+ *                    break;
+ *                }
+ *
+ *                drm_exec_retry_on_contention(&exec);
+ *                if (ret)
+ *                    return ret;
+ *            }
+ *        }
+ *    }
+ *
+ * This enables all locking to be performed before the driver begins modifying
+ * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
+ * where an earlier op can alter the sequence of steps generated for a later
+ * op, because the later altered step will involve the same GEM object(s)
+ * already seen in the earlier locking step.  For example:
+ *
+ * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
+ *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
+ *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
+ *
+ * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
+ *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
+ *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
+ *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
+ *
+ * Returns: 0 on success or a negative error codec
+ */
+int
+drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			   struct drm_exec *exec, unsigned int num_fences,
+			   u64 req_addr, u64 req_range,
+			   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (req_obj) {
+		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * See drm_gpuvm_sm_map_exec_lock() for expected usage.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			     u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..274532facfd6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
+int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+				 u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0



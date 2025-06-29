Return-Path: <linux-arm-msm+bounces-62931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF7AECD0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 599703B34A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D30A224B0F;
	Sun, 29 Jun 2025 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAedCRys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809F1DE2A4
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206025; cv=none; b=dys7lnekMt14kE5EcdxI0jVjp6Wijo4jHZjopb3ABs7a2KD7uh6NXMblyFb6sWquBYWT3rId3iWas14buQdCG85w2tvBmfI7N0tC02Ru0RxcOQl9uGdW99/JgXSCtWfropi4nX7r2AlIeUJawrSDu8T4UOybX+f04nqUqgatqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206025; c=relaxed/simple;
	bh=rfpJAaPwovudJjMudjp8rOGcHhiThmEP/oenwjR3k50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifKC3Njpmtx2NA7SY0qhvhMdKmUpTZzK4CCK+f0mkkAKLVuD9dd7KwODcBjuQuIIcTKAqYv6r8Jgt41RuMR8ZBFOn4WjNqCvygdGP0ZYIvHRyKj2CHD6PRWQGqlExskLuYyNG77AeHoq5ETXWgSFUQRtUvsDEV8oZEKqvbh5bE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAedCRys; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBoaFD014333
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3giSzjraTy3
	ka5GjGMGM1+HP9AjwgWqhZykCSGcdkbs=; b=gAedCRyscmRZVBByRZkr4RnjgbV
	OmDPMpSHfODB8+PuGvjU4vC3WDVsGxbglW9T7o/niac1i1+qyL/cNbjjU/u6B0GN
	X/42JW+W3/MYEELy5ywvU0CvbB0FFopZ0oV+9CSuxfsvaUgd8LkD28qr4JTuRAb9
	XW+VKTpMjBRSiJH1afgRism+rSGFfppjJrEG3Yg2oELrKIN+d1V7ssZLFfZjZKKQ
	y9XheLdKZyAri20zEzgIRglg2b4sUz2/Kt+N/SXJr3QioJlH2J+bnxqihKjX36bE
	z/nSjYbg2JzK3J8OXgTngHdF89oys6lWWpA8xdPCSKAu7MUVE0rAKz12TMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2dxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748cf01de06so3282438b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206022; x=1751810822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3giSzjraTy3ka5GjGMGM1+HP9AjwgWqhZykCSGcdkbs=;
        b=pi/ux+h39lrq6qkfbdlrUbRT75oBsFut+VAEYrGG2kybGVjWoUNyatDJBnd9foNGjI
         VliBjp/CDz9NOmoV8fvwE4FSQzSQBNiN5N86V+jOG90OqeuWLy40ZTl/ocn0D+c+qR/K
         3G0j/J5bk6NbJDyg86C5mJKblZhC15Q0J/xNHLXTxnWga35MV3giX+wFblSI/PpROXWc
         QYiE89mCdDWqsEDE5Y8yCvVTK6r0L3mEek5YIDQxyChJqj2/s7Mu2s2BZtNUOSw7PlTe
         23NekKTBFlL3xin3dJ4jcI0TiUxMWQEuN3vPj+Ep7v1Qq1IfESU5+0spGFzQnzydxrxs
         Ylmw==
X-Forwarded-Encrypted: i=1; AJvYcCXfK/OePJ/5CsTiM6Ux5eSwMZ9gbYTVaJGiwrLbJ3BVKil/rj1FO1Pc+EZsKlocq7c1euN2mpMqoXtUhdaG@vger.kernel.org
X-Gm-Message-State: AOJu0YwcjWeDiqyKMRyvOiHJy0A8RK1IRulE3zKTtFkCaiZ32vh6fzQ8
	BmZ78Q4OMKO4h0mKmPtUJ0ErWRzr5IX2OBY4BmK3i6ek5fB33Ouel5+U/eLY64jUNy3djyYmor2
	Ba6g71aKSRKAwqDiQO7OOTaR/FcMElfKalyqmpSM3HlSRbmXpUSPSbEAExEuEYm2KYPFe
X-Gm-Gg: ASbGnctukYa2+cmMrSC/0UXNnhTCqeW01bJMla8jfl169COLYqby0KSleha17KlziME
	Fht6fVMMk6TTFcHAj+7QCtKjQTZW+oMJ7AmuFdLriO5htumr8HLrIgibPWn5b6dwTfvxzn7qmib
	LXSNe/gXPOtkRmPeeGxUgRVC6ZOUcIAo/Lyx8C21ETYZ4pSQ79GiyH4AxxZASvbWRq5OaSiMGZA
	Zy6psQ9pq2vJq4Pvsn1dse+jlStWJ98WaSAXVzSksGmtx3hGPiLZ6a2qxHbSR0oFbQo4GXroTEj
	eSzXmqDAca0jutjMot6XlLFvON32mjDn
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74af70a7cd5mr12081311b3a.21.1751206021992;
        Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH8aoymgZZWAQ1ofdh1nraDblcv+QibjcBdGmQ1h2Vx5/pIpyp/HOErfyJRTsXKoz6RnP7vQ==
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74af70a7cd5mr12081273b3a.21.1751206021463;
        Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da436sm5837098a12.57.2025.06.29.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 02/42] drm/gpuvm: Add locking helpers
Date: Sun, 29 Jun 2025 07:03:05 -0700
Message-ID: <20250629140537.30850-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68614886 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=gXmLzIc8hE4PcKHQkQgA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX/FX8UjynI6sl
 2yBvdc9T7ZnoccOlhSwV5BQxu2jk1Ot87RSlx90MKSUE74TKE8fxFeaFqtfsNJPPL8COKe+jdtn
 51154sbBNswyh/LvRc4WprCnDK/UBIwUPumIHfHa9xU6gSmUyGCwu11CSwgU7Cf5hJ1ctAC8few
 a3nLOkoBvL2K5HBGoLj0teMUfWWTBiMuPbJKQFewHLg0WCcqzNpoIHpwMN4/21rULNZX9ufPtny
 +7eUEoiRU4nOxnGGRvgiTxW+l1odSrAbN++yLlDouLYJqC/Jk0isyOrxcil8GozcyAwaR49qbrd
 mROM9Fd9kVZ41+Vv0GlUeiJwOrBcDIM7NZMr6/db3g24/tmdbFGiiKFu4udoTq+CWgSpl3Gj7KX
 9fY47xUs3jkSt/Oej4MuTz6t6Kj9fNjDHibBPoAhSSZhRi34PNgZAyFrFkRkUbA26Fup9N0c
X-Proofpoint-ORIG-GUID: F9-w2EXQj9j9CaLcM8_AnPt2_aHzdHoZ
X-Proofpoint-GUID: F9-w2EXQj9j9CaLcM8_AnPt2_aHzdHoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0



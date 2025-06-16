Return-Path: <linux-arm-msm+bounces-61460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C75ADB4BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863DA3B22B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D91B21CC62;
	Mon, 16 Jun 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq1w1Y6j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B61A4F3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086021; cv=none; b=VB8iLwTlB1ycn8yi962FENjl74au8pr0ofzzYzFdVZaLmZKVABqLSKxg/OmusLVWqcZm7vOSztaTPXzEeNKYbYzlZtzNaDHzQ404iI0GfIkCwOl76hXKfbSuvF5X+eo70HMWMXL6PF3K0Ul2hkXHeE1aqA25mmx9OsuxEbi47Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086021; c=relaxed/simple;
	bh=AQnz321Cbkz9+V5DaGF97fSoVS8odeOv59+RE5dDUFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qA99gguEAATLQB5Xugl7XFMYy47q6rIShTm+9dgdkpuSS7FF+FChSMOexW6etKeCrvVftHOwUod+sRMK0a8co8fmtJASsDkamEKpM7QuEtRFaD5UAcxhpwSKdrL6ioVzWAL13DEeN8TKHbs09ZnFsPECSFPAocwyUMKHDooYoX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq1w1Y6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8TtFG000891
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oC5JJQBiULx
	rFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=; b=Kq1w1Y6jV+ZLj34FxNYF7nLVk1m
	+FmKeSKqop67aenrJbLSs6hwSg3afjeXg0tt6hvRFefVbsZaL/QvHUHcV4e+wEiq
	QlaPX5kOwgw7Ijz3KMfKau3HkRM2GCH4n5tGhod5+0G1cyMVlQgkvOzUSLYsm7vv
	b/pKzK7fwuiqUS6sUR7YHaLv72bcTHLO85xp7KVTE+qy0ty9L+AFX10nweQcz64I
	M1bzJx4yKT7ngh4nAqZC3M3+luHxD6sCBWx0cEcihHX2rQohPjoLWLKQ4BHlM6S7
	DZpvK5RFGmrOx1wxsId8LZd0E5H6VCyN+OUlfTwnb5w3mE4fM9pkNI9b+rQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h94xnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:00:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2c36951518so5691549a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086006; x=1750690806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oC5JJQBiULxrFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=;
        b=Hc/Yig/ZRvBPrqPfw/BER0rxADcTWZ77pmXTqDfRYCbI7wegsir1xXgSQUWcpA3SCe
         pLUqN0o5UEimnJwOmk5ec+ydWlyB+ueMtnVvFtQ+e90U54dDGHshx6VA7jJ07v8HnV2Y
         /BBxKpW7sPwXcXsnAOhuFgcbq9YU2nWQkWa/lPgX1aWKlw6ndWKn1s89mS91WpG//nIR
         2U/FNtp4x7+Aqlxyw4vHHgK1rhZ0rkQ/AUmqTiLvUy+2V3PTQ4sev1jlr9r13RKdDK+f
         +Y3d73gcwpDbrfT8mlctOlHI+9feVCp0qCj5wNzoVLqZF8ptBKVCMClCxarYD7zVHbdX
         T2CA==
X-Forwarded-Encrypted: i=1; AJvYcCVl8Ih/t1xKHrzL1kJczxZDmQBeRYShG9WZp5hztV6th5lZE7d1Q7pHXmL57gMjHjab4wnYtGgqjHtDunJT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5TbJ45XdlkmsqI90qbUzJ6ua90Ysqa6cgZ5rxwQwp++RNYn76
	WMfir8BId6IO5eaz/wos9PsY+ht+Aelxt2cay74c/Iso4i2Sr7P2tCBdIuPeKqemWZaJ56c29U1
	hFO8oXpN7r1PhFW+RalsyOEOmDdCwV3IVVmIDjBRBN6Sn7g8oUDSZ6GIZ6TVm/hS9vdu9
X-Gm-Gg: ASbGnct4MtStPMUfA3tc1RZT8n4eY+y68/YYly9LkGSKa1cDL8Inq4fRm0u5dFeN3Z8
	fl6mHfPuyWJbF2dIBCQdJ68U3YTwIeCB4xBzDf8thQUvoZHtpaqft3owcJ7QlKzM2drQhpkby3H
	SQaMSjGAWta7S3s2UdeYcl7LBP0pyrt210C7QPBL3nymKs5JF9xBBPC3VL2Go/wQRoZXL5xPmwj
	HDjPu3b87gffdfboy48tPPnlzx/7oqWq5qDVXpyKw/UnRNQHqBIsS4gKqsxp1PCFG+CYud/IeEs
	vKoD5inip26nw0LHXjuoQTy2nt0ya7BD
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id d9443c01a7336-2366b3de71emr137982655ad.29.1750086005975;
        Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnfSQJYXmMmDrm6U+uoX2a4jwex23BTSF9bmaN4Y4FWllhK7O5JeT0I0bKsdQT1hF7bDaSpA==
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id d9443c01a7336-2366b3de71emr137981935ad.29.1750086005443;
        Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d44c4sm61807305ad.252.2025.06.16.08.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/gpuvm: Add locking helpers
Date: Mon, 16 Jun 2025 07:59:57 -0700
Message-ID: <20250616145958.167351-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iEN91wioIVeLRfHGMLi3GnHK3BHwixAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfX7AEQmHod5lt6
 adoS/69/q1huEAyQ3Xh2uNTM6Z1b99+vui4OeuedhWL52gmKrAY+MzIlzf5xPt5BPlXxk0QgQ5l
 sxbEH4zL5WoWOTla5/YHN2DirxuXDX6nQjuS8tYeQc8qrKW+dd4b32ZuTG5KRzdQycmwY50qshl
 mwUvI/ahZk107+u4RTGX/z3ckdTf5UJw71Kxr+U24oV55JNKqzHZcBbUlsRwaY4usTeELAALZ+9
 2zDVgFbMd5SbM0p76dYvPbBpASBIvbKBIiGKCj6zg9/MaAsOfzKqgzzok9eL6lx30whoAtgSNuf
 PxwoXyNdhlHdwvhIe2nsIk6Sfvy3mOkvuRfo8RVHfeQZ5B0OrsGkYY2U03q0X+ox1PS4ieOxLNV
 KbHqsE3np0wG9EOVGvM2G6FBKGU3AqKLHgbUu+UWsYvk0C7s5cqKseflS5hym2w/TDu1UVGV
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=68503182 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: iEN91wioIVeLRfHGMLi3GnHK3BHwixAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160096

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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..b8b0c7f028e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
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
+ * Returns: 0 on success or a negative error code
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



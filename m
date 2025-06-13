Return-Path: <linux-arm-msm+bounces-61281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A26AD98D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 01:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B3E17A8DB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 23:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A2D28FA89;
	Fri, 13 Jun 2025 23:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo+7wYcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB86328F534
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859036; cv=none; b=bAH3XTGfkXzPDd+YCGKwJeIgmNjk1kGCZWWTlA2ogqYHdUfOKIu3sZ5favfVNeoRdy5K+2zZD6OVaQWK17GFTbX3Cb6KHds90ZHYn2mn8/rPDGQMsQ7bRKvBPaQqmDvGDQu1Y8AlYVBUS0C0nlvurPZriqZl7OIk/UIlsiS3eLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859036; c=relaxed/simple;
	bh=fZld0obXT1+aG8FOaQwUccJe8Q+YKfPzBOMa+OFU0Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iC5qfzcCt354VwkhEU/e1EM8N72yrFHcMwO6+o9MCCmajxyM6P81lU75pqG00J0yQEA2ED2EI4Q9xx2YcEEyCNQrFqH+Ec/+S6OdSOUemXC8gmqxkpa2LoU1spcs3sxI8AEuXUTBa35qwYVlwNS9qeWUjANfB7TxcgxGaAYV7Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fo+7wYcc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DNaTBR031829
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yLq0/X+CD6R
	T9BCguCxV4sLsi3w1/mhgkTuVhmBkydE=; b=Fo+7wYccuOU6D4fAhl/PvOjGLIP
	dxpZ8MzY6HuCkuWEoRFn3mDyXtTNJO2gRDA7NknZSidV8idS/A3pDu51LpzcezWe
	cpvjM7BBflAReKPPZdbY8PS4psN5wD0YLFjFDNUBGqaTLwtpXL5BXKa00cFP1u5p
	ExFK1iox+1etOzdWynPZyCsOLQFFufxR91lJkmwI23sep+tfdokNVnw0U/E3c/xb
	/RUxiqte4RXIE3X9QljI5YzK123NvZ4oqZtBfqZ60u0jTXjSnhWC7p4TxctHgcxK
	r55a5AMp5TFxK9Tg1Ba/AZ9qvZ2ZpYzdOUOAqYeYRPCMZbQfeS7KrXaWFIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6mqdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 23:57:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b115fb801bcso2694493a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 16:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859033; x=1750463833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLq0/X+CD6RT9BCguCxV4sLsi3w1/mhgkTuVhmBkydE=;
        b=F2dhACXGYFOioMCaQI1GrFuh9H+Qi0VRMlTvzH9CRi+AVlrVj6tFu93uLWVAsrqz7r
         fPKS7FH+I7rYvGfsbE0MUr5y/Yy2LEpCT40DkzGPmTva/ePNzKm5aPCfCYT+0AnmJLKj
         prqgDONlXkfFrtrz23E5zrsqn8/Ry5KpuCnNbiteUY8nkeZYUTkVkfVPGIOmHhqhQQuC
         ESA5uQ6/y8/CYP0L3cB9GdQXt/ThL1J2CgT56OUK1Cqe8G6c9qLEWytW7MYjWg9wezrZ
         bKBunryPlyocynKKJ7Zxs6+dJtPfZqe1iC61cv4VCrUeSj+PvqKAYN9udS1Gs4eEkMUy
         Dr2g==
X-Gm-Message-State: AOJu0Yw5XC1fJb6SKkstK8ZgfhTjPxgPCiFRFwJcZMuDBbKk/bqh5Hu5
	Xw+MboZOuTbeG8qRIOHGT36W6rPgBmuWGUMTw4/ZUass4APFX7C3xQOiPqdp+TZcO9GQpMJSyRt
	sPL7Ee7ghap+hCzVpd6M6idbialHgf/KyrGxoUPCyHIjlrX0FfxbAPUFhN6u+Jg4nIn7H
X-Gm-Gg: ASbGncuE10VdtL4yiyIHOQe5eaywyO7rJizkevNCdjZ63sW9BUf79RJmRpothXk2niK
	6JDymQ5hlPfh9TxhJgn4BKfMXRKRf3BR49BRj+vYtnmM3yg3FILVpWix0kzRaUB0M2QAHONnkJP
	NodOKu0d4RV2sdZqL/K6Esrul/ctU+cjhgNeBU02fldbXgNfskPa6uZ0gYdRk1RXOi9pHX54hYD
	9ktFFm4f1NdAZjP2eSVCkXKZ/CbpUoI8KfhG6SqGIQzvKrlwK5IAiofiKYFVvCgWfQHMo0uMVic
	Sz1B05/HYy+HuZu6HzVaUNyTTxFAfapZ
X-Received: by 2002:a05:6a21:9991:b0:21e:feb5:9cb8 with SMTP id adf61e73a8af0-21fbd5d4c35mr1592005637.38.1749859032707;
        Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEhTcTitEJ4ZlWzhRai8zzxxCScgdvvoA2BJ4VUJEL84zgtN+jTH9QJ8KF6Xuy0gdvRZyX9g==
X-Received: by 2002:a05:6a21:9991:b0:21e:feb5:9cb8 with SMTP id adf61e73a8af0-21fbd5d4c35mr1591977637.38.1749859032214;
        Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b30948eb78asm1767813a12.28.2025.06.13.16.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/gpuvm: Add locking helpers
Date: Fri, 13 Jun 2025 16:57:03 -0700
Message-ID: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NSBTYWx0ZWRfX73uDlCMStu3b
 rSrAzMWUVzWHp6HR4quh86ayhP67oUYc83kLRNVJjJuewnt/QkDhPqwI96W0G/xTMPLi8HEuHKL
 SBEwTegiCAVuVCmHoTdUvFksAOqLj/mj6wVUS5itTjEzlPUaUOrf5GWlcaaBKq8SM711JdDfHUf
 QCRtdR0Fl0wNdUBDIzu4TkrEv2ZUKB+3N8lju5OvX7iKwypLz7f/s9qwclEqVYjxS3SZkGPnsZV
 yhbrQ98Xprzen0+x2NrgJYMtc/Iq10PIXGZECeAGdjo5gjqulFD7RZvolI90teU2hIcF2lR9hBk
 mf8j16tXApZWq9tXDvHNeFH1/1dx06a810wr9Mb/ix/TvysRNCM5KeN6JO6nog/YVZAEwpcIRTP
 LKacQCeIgISJfOfe7Bj76K5Lxykh02cjJyf2foee28zGHu+IhGo7gPwro7b4hjw4C5xq1qYw
X-Proofpoint-GUID: QzlYUyh26yJmQ4AQkSTzlyhmErQjDYjL
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684cbad9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: QzlYUyh26yJmQ4AQkSTzlyhmErQjDYjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130175

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..197066dd390b 100644
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
+ * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm_map()
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
+drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
+		      struct drm_exec *exec, unsigned int num_fences,
+		      u64 req_addr, u64 req_range,
+		      struct drm_gem_object *req_obj, u64 req_offset)
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
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
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
+drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0ef837a331d6..a769dccfb3ae 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 req_addr, u64 req_range);
 
+int drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			    u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0



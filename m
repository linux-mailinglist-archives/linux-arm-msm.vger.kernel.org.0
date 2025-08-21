Return-Path: <linux-arm-msm+bounces-70034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F935B2E936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 02:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9601F189F2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 00:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB8314A09C;
	Thu, 21 Aug 2025 00:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnNH4hbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F40437160
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755734680; cv=none; b=F42qpX6T+Bp68wfHdUwyX5eXZsH6JlkPaQGNnQJD/ojaNtz2/uLHj+k0V1BA7o8gbolm1FPJ1tUANhbsec1sIVut1sB5jqtIZJlt7BSC6ba2dwCoXj0PJFRJDFuSKfaVONqkhqFx+fFlLQeQu0t5ggfVBnR9hcgp5z1+9goxzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755734680; c=relaxed/simple;
	bh=Q+iv3Gx4AwJ4uL7gAQ5BVjYAf5nK2oKipZP3EVLxtRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWjtitbLKiqp38ZCxdwdTFflo8pI67UoDHE6tUJUJXPUBB774HkLqRs/qBs1GuKMHljAPOu2jtlQr1n9iIMCQKdFDE5qwOnHZxVSAvVIDYLQhPyO8QUIp6WpayNbaAzIRtSfkEa11ztB7GAj5Tw038bbOs0T669aLOFeLqcCDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnNH4hbQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KIviNt013810
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qp/A80ntMQW
	zKIpfCuvJC05mBAON98quijLhbVW9wZM=; b=dnNH4hbQwF1dp70I1AK4GDd7LPD
	QA6H48WypGfAO9OmxYlws9xAzKsvDrZsDs8jJkSat/QdWkh/nLRYnarZ8SgaJohJ
	eIrOwL5ntNZphB8gylta/McpcLVfYzkF/gvlgEnbB3R2r6pjLkWRAN+WmvmyTP5F
	0yUGEqhSxD6QuzpVmDwJEn7hAqRYnYmURnKKVDpibhlJ2kqwjvvpPy1Pj0WWJ2+E
	UPWMXKfyE090ZF09g9H3VAvUOUjN7TrpFAVQYvh03l6H2x+bUpwHoQiApghNZtxJ
	A+oXiSWFzPJ8NoJau9GorVIqtxtgN+9KFqBzUA6g/LeBN4GHrFgMcbRkbBA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdh92t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4731a95babso255214a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755734677; x=1756339477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp/A80ntMQWzKIpfCuvJC05mBAON98quijLhbVW9wZM=;
        b=Lo84sea7KKHFeXwg/e//4YxQRsgUgh62On/WX0kYGhIX+0kcbhlfirHujRHBDpoGoS
         +IULg59nUB4SMrIcThoG/lCLMd2gJ5rIkYeo/9n17j7UJ3XENs/nZx2GU1ZHWJzLA/ga
         dIaO8yQxq8Rz5qBrWdOFsE1rVx5ZVWZ6p8VL4RFDC+KuLBAU4H+MRpJ+OKLXuK35Qh39
         sTPXgBt34OgqMW3jfe+ioEOGn7YUik/rXx/WkDPOhdoRrJoPAVD3tWIKRK+wzxMubFw2
         UMcVS2Mnq1VFkzEoZkc45K8dAI9KEFuxS8wZgD/oIip04CnEX22Mjnmu3QKEz8VSby+6
         8IHg==
X-Gm-Message-State: AOJu0YwNBEEAvQjHStZJtk3h1Q5Yu9Rxa1T/boV6IRl/3uSDY79EKLkd
	8c59IFq7CC1KwLjKugxoqePKx0Lnq/CkNqV6LOPHfbNwTIXeNrye8l/bi6LHXhxWTKi3NX8PDBz
	c8P1kYl3g3XUPkPhLjfXgqFpFZuXess36SWOileObE+ZnUXXGFDVF3sXLj02eMNa3f6kK
X-Gm-Gg: ASbGncu6Xd8jB+Ru9mSVqgphpjYwdAtiCR6CmtzY1s8yhTdQEUL1bnnaoY4pANYXHbP
	c/sAbuTTIQw4lsA2HL8ixoIW94+hAUQ4q3KO7q97RO2STNfuAVsKnRZcL9zz9/kBaBnhmdC7HxW
	sUNtGCDBSRrMLVARkAQ5gazRfnHZx6eI/nG74YGiLLpVuqNGbwJaLiVUZvgsJU/yscFCOIulFTG
	mtE6SmmJsaDDIPbcB8iB+e8iWJEAV7XfS711wskrJegifeF5BsD36GSBVDI2TST2DfAUfqNSAo/
	177KKI28TNqmsUEdjEaDBE4nClcsvsXwLEKCrTGIwk4kDd5ix80=
X-Received: by 2002:a17:902:ce11:b0:240:9f9:46a0 with SMTP id d9443c01a7336-245fedb7bcfmr7679255ad.38.1755734677472;
        Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5tsfZ6UJAKOwZ9VJcJCpxgsE7IAQWoLU/G9aFnHsuF58zIqAfzhOOeqY/ioG4KuVujNrLA==
X-Received: by 2002:a17:902:ce11:b0:240:9f9:46a0 with SMTP id d9443c01a7336-245fedb7bcfmr7678895ad.38.1755734677061;
        Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2460273cba9sm2170355ad.63.2025.08.20.17.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 17:04:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm: Fix 32b size truncation
Date: Wed, 20 Aug 2025 17:04:27 -0700
Message-ID: <20250821000429.303628-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a66296 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=ZgH9EFzBAD-oDO0bpbcA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: _M9m1YPo8h1PsNa214hY4_gOMGEgCa29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX5j8qN7sOpkBx
 Y3gLR5wcdIhnGhSgV1MuYoq+XcuNSMdQqLzQt1mcabtoNvjH6ttf8OZl8O1DOxYbIWtN824fz9W
 fTd47tedPbQaDN/ohArQijmCns75U52FkUeCpdMJRzUtrFn/Gxqmhj8pnyocJfJ7KfjA1q+FbwG
 FePQ3BGJJ1SVlFPJF5SBwji3hVv09N1uTcQmJmtQeQv6YcjPAfv3UdSneDu6Fd4KhaR0aLJ7T9m
 WU7Au1dYD31MWJCoxk9KV1aaM+NY9z++5WXoyYpMX0VNArCfQcx3/Odr751m2Lh5apHqLmbXm9L
 TZJ1LrZQtLPnWCKh8rwAlEYR0wMQMmiqM8HOcK9mTP17+TqxKYGSYthBt1zjoqQl9NwJTfqci8v
 uB4heMvQ+rbFB8DkR2KProSVdwtXbQ==
X-Proofpoint-ORIG-GUID: _M9m1YPo8h1PsNa214hY4_gOMGEgCa29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135

Somehow we never noticed this when arm64 became a thing, many years ago.

v2: also fix npages

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c       | 21 ++++++++++-----------
 drivers/gpu/drm/msm/msm_gem.h       |  6 +++---
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 958bac4e2768..aefc82184eec 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -189,7 +189,7 @@ static struct page **get_pages(struct drm_gem_object *obj)
 	if (!msm_obj->pages) {
 		struct drm_device *dev = obj->dev;
 		struct page **p;
-		int npages = obj->size >> PAGE_SHIFT;
+		size_t npages = obj->size >> PAGE_SHIFT;
 
 		p = drm_gem_get_pages(obj);
 
@@ -1142,7 +1142,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 
 /* convenience method to construct a GEM buffer object, and userspace handle */
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle,
+		size_t size, uint32_t flags, uint32_t *handle,
 		char *name)
 {
 	struct drm_gem_object *obj;
@@ -1208,9 +1208,8 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.vm_ops = &vm_ops,
 };
 
-static int msm_gem_new_impl(struct drm_device *dev,
-		uint32_t size, uint32_t flags,
-		struct drm_gem_object **obj)
+static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
+			    struct drm_gem_object **obj)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1244,7 +1243,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	return 0;
 }
 
-struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32_t flags)
+struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size, uint32_t flags)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
@@ -1259,7 +1258,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	ret = msm_gem_new_impl(dev, size, flags, &obj);
+	ret = msm_gem_new_impl(dev, flags, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1299,12 +1298,12 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gem_object *msm_obj;
 	struct drm_gem_object *obj;
-	uint32_t size;
-	int ret, npages;
+	size_t size, npages;
+	int ret;
 
 	size = PAGE_ALIGN(dmabuf->size);
 
-	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
+	ret = msm_gem_new_impl(dev, MSM_BO_WC, &obj);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -1347,7 +1346,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 751c3b4965bc..a4cf31853c50 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
 int msm_gem_cpu_fini(struct drm_gem_object *obj);
 int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
-		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
+		size_t size, uint32_t flags, uint32_t *handle, char *name);
 struct drm_gem_object *msm_gem_new(struct drm_device *dev,
-		uint32_t size, uint32_t flags);
-void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32_t flags,
+		size_t size, uint32_t flags);
+void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t flags,
 			 struct drm_gpuvm *vm, struct drm_gem_object **bo,
 			 uint64_t *iova);
 void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *vm);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index c0a33ac839cb..036d34c674d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -15,7 +15,7 @@
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	int npages = obj->size >> PAGE_SHIFT;
+	size_t npages = obj->size >> PAGE_SHIFT;
 
 	if (msm_obj->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EINVAL);
-- 
2.50.1



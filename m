Return-Path: <linux-arm-msm+bounces-69842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DDB2CFF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 01:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA51188314E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 23:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68782274B30;
	Tue, 19 Aug 2025 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrRQ4pbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1E270578
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755646158; cv=none; b=t9OUZql0bUxRxEZLKpqmEgpVAMJnE2g3RUFJN7PePjvlAkkxr808lTmPf1Fz1IJXCudCbhO/4uUysgocSyAXsfu5B2PKUbK4RwAvPMyGGYj7wVYF/bBHh8BKO+qQkowZ0of50y1htkmHACyeFHvHomClJofU+O/S368aopac/+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755646158; c=relaxed/simple;
	bh=TZW3VxvhUM24qUwSzazaXCqg9DEgEYWXWf+PtMArXF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRjQRWlAfA/Po6WK72xe2Qcu2gimmJjQ22cr4fiHBk5B0pN141ivZC63Raobhe3p9iE0d9VK960kT3guZgzmW+nz0/4S0bCCw9ALPFYelFi8/d6WGaiLZT2ONewZS7vBKAZNEau05Aq6EOlXbDf6oE4Y6fAcUZvvHip5AR8L6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrRQ4pbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JNDMJI011872
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eorQnuKwFmy
	2NP3qxzCVt5IHD0p6HNwhfpue4EH5fbo=; b=PrRQ4pbQgGU3zIbwI6WUS/i+lbb
	QwgBCdLHKiuGmdVJhDU70Kzzp1XfZraBmqmhhuYi6zCCV8p1KjAyWLGclhjWB/NR
	49KOhpakQ1bvvAAUukhZBfOjZNt9pI+k9qjqiWuVu3GnPxCp7+5/Vioha3slOf0h
	GlyrLJyPTiSlG8ekygsd1yierTJ5YcC5KVA3X9lGADoFh++EbH9lAQHNea+GI6us
	HW/TtS8ePp56MxRIUYSF5obBvHOoW6DzXUhH3jZqnRgxTr+q9ByMpj7HR5ms32h/
	7MsxoC5x6smZzogi+ola7robDSTkdSki1Tsg6TvaF1LLqBinpE8iKJ8wuCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tdr8p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:29:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f4f3ecso70036345ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755646154; x=1756250954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eorQnuKwFmy2NP3qxzCVt5IHD0p6HNwhfpue4EH5fbo=;
        b=v6E+cQ/HR1593fKsnhpzfXCeAEm8dc1TMtVpMM2aJ4ZGvhg6Y22T7Ar76SqiRbRBVp
         w16NqzHTHtRpZQ2QXCRxxjucBYv539FfFZhuKL/qdQ1+EqZoi7wTIBjDzvIiiQNKPDLk
         utXeBc1fQUV4kb9via6lTR82UbvVlWkRv0TjTbGPoSGAWfQ+9swZRAcZMvxX7+WTG1og
         4CPUhnfD9oPjZB8y1ZX4RrX7KEYCiD/myh0vWm6it6MRlMbZqrahiadlnF9Sv7AedVWK
         KKa8HkoZ3zqwl2XZLB3Y3G3BF7qn4rGPv9A67bzetPmEK5wY043UMYrOYR2pFshd3qBG
         B/NQ==
X-Gm-Message-State: AOJu0YxjU6Y+xqBDhCkNZcn+gucuBuMQ/5p0w24pL7+QEvQ2ymOSAav3
	pPGaaf0daaruEgsIPdAy7NHaPFxCWq7ufiNLTgNyXV466QmgvNGz+lV43dt7vsN0y4IkhigJBj8
	a0lReX4J4nek8TU/QidDCd8FAcVh6cqj6A9vfpSfm1xPQMv9O8+nMzYfaPPJ/SKEA6cW6
X-Gm-Gg: ASbGncshQgi2S1Dv1s4XdLMpB4zKg9x7VDVICkslQeGpZKnib5mawmxUR1scPC3NVeA
	DIg3gFKjn8Whe0SkkNf/ghtS0PJ6hBoLbI5YtQMWuMEi6F+ogzgK8XmxofkghOJR2RE7345LrZ8
	Sr6ExZj0b4N6ZcFoCUn1gk+98qQSM/EwYMsEhgV/2HYnCoJUL3JhXsqt9l06TmkcfjQuV4bSau0
	FTQ1lgxx/QvOczwAlz0W332p1hNqsKoEBWye/gpZb2UaLmstN+wp7daqee7khjGP9c3UfwF3ZSv
	DQYtjNM1FtLp+6cmmvjoMX4Tv1yfKsKdyCGUNrrcoKu0K27j+L8=
X-Received: by 2002:a17:903:234e:b0:243:963:2a70 with SMTP id d9443c01a7336-245ef156358mr8027615ad.25.1755646154005;
        Tue, 19 Aug 2025 16:29:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlmpOombDfq8VbEjWHWMgGH5Q1/mKcc7dH8Jm6GIHXrGX0qRiaR2T3uKoERFwvEKAF5ww/Bg==
X-Received: by 2002:a17:903:234e:b0:243:963:2a70 with SMTP id d9443c01a7336-245ef156358mr8027425ad.25.1755646153561;
        Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ebc4esm8040925ad.115.2025.08.19.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm: Fix 32b size truncation
Date: Tue, 19 Aug 2025 16:29:03 -0700
Message-ID: <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a4RpNUSF c=1 sm=1 tr=0 ts=68a508cb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=Zku5-IFyaxskcEPfeVAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Uhk9HpS_cWvT3pQaT6-J-wAO-dnR3nnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX7nGNOAEMJXp4
 5xjhg7d7ZqsN57/VuV2IhyrtTc13c7oa4uN2nohHxpQmgQMqwDVJiT4XeOLVt2scemgeUCVyCXx
 s+2t1cRC1J8JJaeMxvSKT1e246ngZZyiH1cJrAkrtJA1qDrQd8cAHusSU32LklQ2jGOjpWtsbEZ
 0sv14tkbi/gJRQvDZI26BEVzleB0G0rHs/8c4OM7FjIrrNKun3S1FcNgvT/Wt258fQ/7UX+1XvY
 mjuVqU1xq6nzuB8f2nfoWXZRvIbLQqAtgkyYvgMOZg8KV6UxBo96dMaI8lonPul8SETMiO3Ehgk
 +8h2FI26/0oTuSwQT/Z9yWN88pdLonvkVUKfNoYd2XSABrHEhMNwOqa1UGHL9/FxJXeJdY3Uzhw
 qy0XM9eflOiA0rKz0b6whiOc0vTXcQ==
X-Proofpoint-GUID: Uhk9HpS_cWvT3pQaT6-J-wAO-dnR3nnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196

Somehow we never noticed this when arm64 became a thing, many years ago.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
 drivers/gpu/drm/msm/msm_gem.h |  6 +++---
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 958bac4e2768..9a935650e5e3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
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
+	size_t size;
 	int ret, npages;
 
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
-- 
2.50.1



Return-Path: <linux-arm-msm+bounces-62945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AFAECD79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20F3E3B4211
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8A9237708;
	Sun, 29 Jun 2025 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QPdaBB5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C11236A73
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206069; cv=none; b=LfQzFjEM5jJivkqzVSBR3Pk1grwyGVOUc3P6ENEheAGvRt1JdAH53Z+502vDsDcE0ZKQS1kyQyjHprW50U6tKR6S/Wp6VcmXb/yQACoZULD3d8uZpsWAMEFB4oK1V1KGa6lhyvqIrrOBmYHWvjWWQzp4nx4KxBc37BUVlzUd7Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206069; c=relaxed/simple;
	bh=8ynhkJOScfi9ikAGiRHB32lhFvswULa1Hiuup/gNOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdihZlk2WoGZ9MgJHhzEVp8KiUCEkMBfXUNrKFAn3L7+8fDdnHj19bM3h8x1f2yumbOXcdnrdgygHVW7sJhYRFG79k/Z74oxQyQM+rpzsl+syMrcu4Szi1PlrB3S2tcdQV87zef+/nK8vzWMp8d1iSyxoP8qWYtPoXC/pkt+si8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QPdaBB5h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDT1Pl000443
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F07tE0vJpnj
	OaneIx6xxhc1GKaxYebaabLke4Ul+Piw=; b=QPdaBB5hrC5+N8q6hltq84lHPeI
	Xj0aupFFxgYu9O8n6GvJGuJJMOZ8sWyDulg0DYlfizNU/cII7eGLH1nJ9R1bO/Wt
	EqdF1eymGEPaug/rhx+q56CR1/MKZ24g4I1qMSH1pOcHn5F0422qezn7jtt1tZzV
	wA19yvtexLscyLfDA4TplCkXFUXInYxtQeLa6Kw1/h9A3kX9YbQJ8vEd5FSQXKs+
	tNnP+C83fQCvXWtkPXr9q3bW3kUDCpJ9vLZ07+J/pq7OPCxSD0Zya6Z8S0AO1iN1
	7HsdI9zS7L8Zsau/wEI45fg5Ys4kTzFyXMzOZsFW5ywDiFPP/UrCc9KkECQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2ewq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235196dfc50so30308435ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206065; x=1751810865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F07tE0vJpnjOaneIx6xxhc1GKaxYebaabLke4Ul+Piw=;
        b=n/M+wnu+FvpWL0r2d+4Ox/tMphHgxIx9ZK0WJce/T2etX03BoVHRUupO+Rpem+QHjm
         xjlNjvoOjpCzDfQ6uqdieb4th0Yc++2z7LatRbpQ33d00bY5/AoGVa44Za7dmnK9UqYr
         y+cOR4pw288vCZ3vXNvR2Bg6c0FXdSxLZDtxtS8bPhizFFBCSQ/vidC2pktidaYSPKg/
         7Q1Wi2mmv6KtmKRDm6ADzGBNx7c5CSsog2zN6FncgZvtNiu8qA/QKJvNQp+Ox6YUbvjx
         8qLeX5WDt0lqZa5mVhWtsDVSBCcFy2BZqsk5W0FcS3tgIBh5RR2rhnYotUSqJKgOqaaa
         rxbw==
X-Forwarded-Encrypted: i=1; AJvYcCVMBWQDugImIRu26f/8KH7wEH69w+TSUkj/ACfTmiGU7+1pWOHO7tP2U1PeEhK217hJfrVekzZspVcIu1n1@vger.kernel.org
X-Gm-Message-State: AOJu0YwfoQwO6GVtWImrAknLh9f9iA3kxmoAYfE1XMS5ys7QHL0iSI06
	AE4iP/ngtEY8lPdOUkGZz7A/j4bvvKtGyGKxFXurRGBRd1/RMHlreMZbJBf8QrZ2PwgVvcfB36n
	gLNMEWTQ1pnuNq/JF4uxlpiEqOvFyvPGMbMH7dlrIQhAr12VS212OiKWF7AnYDhA3blNJ
X-Gm-Gg: ASbGncsc+HdgznLPKPygIrBs/9pzzyrelSphi7zcaMdr2H1sqZUM9WnTyQ61qrYPh0r
	Cukew7LQH24QVi1+Cu8jvuMUtdcivXlBO/4Ox4wYiusYOQm3fHE08KmopiTBZ8nFLTDYMW0bynD
	v50bceT12fmgauVYQB+5pNAuHpJ/D3EO9HFt2gEuJLY+qr95EGfS69ejlAuwtfMs+mxLVA9v6UY
	jHZ80Yeet3cACoqJnDST+HKBSXyIRIJ3DE9vX4ElS/DG7k03Hu2W2lsJWuRDdZ0P6QixAp7+Kud
	8ttJ/BUteirbB8NxqiIrpDCYjYZ2FrDx
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23ac59ab6a4mr170031675ad.13.1751206065113;
        Sun, 29 Jun 2025 07:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU2ZoZF1wsNzdvTcLhOOZH0w2oac4X1cVf9/aBLg0ihQ3Sg5MG0OwPeKZY+JtNgKAyuZME+g==
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23ac59ab6a4mr170031235ad.13.1751206064693;
        Sun, 29 Jun 2025 07:07:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1bc3sm58755845ad.28.2025.06.29.07.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Sun, 29 Jun 2025 07:03:19 -0700
Message-ID: <20250629140537.30850-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: TNI8IXJd2Rm5U6Hj3mUZi2a1ES8ogymv
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148b2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TNI8IXJd2Rm5U6Hj3mUZi2a1ES8ogymv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9ocGGtdQKXop
 lx65mpPCJtyS+Zyk4Y4/A28hPXTenZUliGBhMDrj/xIL5rGMetH9mTQGaILyuR+VI4lqDPu2BAP
 c1ft39n5k9u4x0ocIIV/6O1mahZ6BJBxEQc7wrl50w0KUMO62rPUkRPFkTlm4N8CYogh/+TdaDA
 O0i7Uf6Mh2LjU7TdEsmhRVmOezUS3OhyybkzVdSXiuoh/nGjP8jNA341dJNqK/K5SlABTqgXo9/
 fPXRn9oKUkhzLCwhBhmo3w4OPvktJ85mWgaxfjWMSJoidOVqcpSGOmB+EXSpfP9oUSrt5ED0LBD
 uG7BnQRjYSAyegTegyCW6sDmhVrvegOV0N8dID/RSYxO3c5aGUvWPNpP/KjgXel5+vEl15P4Obq
 uQw9VQsD0Mx5NGSqmeHn9ENkeVs3Q5e+JndkBTtRocSjRVWprVsBzsue445C8LDWuKWELdi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

From: Rob Clark <robdclark@chromium.org>

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 763bafcff4cc..20d5e4b4d057 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -462,10 +462,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -477,6 +476,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 892e4132fa72..a18872ab1393 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.50.0



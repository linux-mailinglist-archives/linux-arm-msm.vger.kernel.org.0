Return-Path: <linux-arm-msm+bounces-63002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627DAED0BC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35AFA16C976
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB9D23F40A;
	Sun, 29 Jun 2025 20:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7ALFKfM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C4247294
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228204; cv=none; b=MoKyHzDkRu8VVidTf3o1VrTL8ECxaHST7pIZybkP2FdGQo2tuh14BjwK/Z3gOCEgt1kifLu6hKvJTdW7MdUke818Ux80IKYVdWPhXVAC5sMx8e3VbyWGQxFe5p9MWo21P9Zzvqq8zP5JYEKtvNi4O0OGIj9l00W8QDHdJf7T5RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228204; c=relaxed/simple;
	bh=8ynhkJOScfi9ikAGiRHB32lhFvswULa1Hiuup/gNOrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ks9ZBKIFkZuDtqvWyoGvubNXIIM51jc370wSZUTv0hLlBT60ZVjd33x5Q5vaDbqtUxyGoiFHGEQ/4tLJwMDQECZQSVT6Zr6Q+yXwLfz4fz2xkkCSzhOfcTFRW+BgcGR6noGd9HCCqZTnNxs+pwScFbzRUcudPXTC4x+vW0bJhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7ALFKfM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAp8lk027695
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F07tE0vJpnj
	OaneIx6xxhc1GKaxYebaabLke4Ul+Piw=; b=Q7ALFKfMm4jtxOyMHeY5EvUsq9l
	61NeJT5RolmYbyHuoiatb8eVQF2oSjXO4pFTJAJuyb4/9Oa8Xy26VyJMLyqOc0wc
	NoeaixiziPKm/tDFHfcGmG0Dl3lgsi+yTz49pgmSpKB3nSRWCDgSBJNLlbcBtjbt
	qGDsnIvnooFT2Dvh2GlBUjCepQE1jD//ALAcLEmnYZHkfOP75uioT9764trMl5Tx
	34cevQHLeC/j6WGXQrWAwVPmMa5IQNUfXYIqPlKkOcLh3fe6Quc0Bm7nqjPGv5yw
	3P06RIHL1OSeZTTTLE/hpHkLdAlw3TtaU22dTkb3IZRXNQHkvB3hMgo5zxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tpjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3510c0cfc7so136961a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228200; x=1751833000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F07tE0vJpnjOaneIx6xxhc1GKaxYebaabLke4Ul+Piw=;
        b=oLq2mRHxNKncg8uPmEdlBqgHanX2gTjArnJE43ojsTtMJyHBd79UM+fPNliBi/QeKx
         71ELT3805CmcikUhokqUlsL6lwlQ3VloVUsSnmHTIyt1+8dPBH+BsvLoM7ttlxv9rqCg
         mHJUAisKBNfue7jsakw5nptSphmkbhGmpVzdY78xL+FNWwOsO1omu88sArdIzCiPJEvw
         E+nDjTkcDqgwii+A5ra+0D9qojYjxDCq9QzmSQClZbFaqZTNxkgOCxQAs2DPCuOutfKF
         qzdAtsjixIlQjywHyg4dJHzHoMbj2CRuJGWabzjK0Pq3h3mMoHtR+SQwUF223s9dTdv/
         O0iQ==
X-Gm-Message-State: AOJu0YwxIpPTuYLRc2jNUNDSbGCQHdQubyDbqa7NNuIVLj6U9IUlMRQY
	l87PkYj+soXQBbBsgHN6huoaRPCvLPR/DdoBmIjKQE54JX4aWa4B/0M3g+CfKB6ZWULl+Q4wVCk
	QYIfGdzI/hNfEznJAHiqRDU/+wZBMsv0cwKmPjA8Nw0vCFdUTs7N+UV6k0FgwK5qvYe9+
X-Gm-Gg: ASbGncsKqYnC75E7c0KQ+yLgXRk2v6yLj1u16H6DL7iiYrnckkXBamf+SKuNt2hFuR3
	bSh8t+sUoTtlhhjBzfXDL4YIV/Y8hCiKZjMWmg0KHxDgVbeN3dVhdy0ikbfSKfEi2lW1qUiFL2e
	7Ekw7wEUbFCEMV3R0MKWk5/TFljP2UQeatMI0Tqq1VXyeE9W3oJZNhhZL5mGCNzq8Dg9cXKSEgn
	wIdShn5SKfru+IMD+ynE8tI8QH4u/uEOEZaWyybwAhqGp1i5p01W1C2O/56zLUXgb/evc7OKfwq
	6dU1umeeyVGj+rwRUzYYHQNMxtrgZ6+yAw==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id adf61e73a8af0-220a16e46d5mr18754442637.31.1751228200593;
        Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELqQu+0TYmCQ+TNpM1MfGezE3TlblWt0dkgODaaYVhQOuwJeIcM6JHGprl9661zvuA9IyEQ==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id adf61e73a8af0-220a16e46d5mr18754407637.31.1751228200109;
        Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e300d808sm6372068a12.14.2025.06.29.13.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:39 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Sun, 29 Jun 2025 13:12:59 -0700
Message-ID: <20250629201530.25775-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfXw8IyEF5F4+j9
 6b4N4GsLY4kApirPV4wPljwc8sMla4f8azQJHtkP55gWCUqHmho0n4dAvywoGe2eGmvXdR6sKW5
 kS2GbvHvB9J0tTfkaw33mtK8b3m2LypK/o3JWQKJYANRJ3ublrOsIad1vxgI3ns1jDuuJrPFnVt
 zfP76nrKNZn9V9oOJS5eV7fnDhHxstSRx1zgWT/dyV8hIUE17WhT1CpnKsjOkveUUWqWJ+QFX9Y
 DUr4SGRq71WqF1KZ2WNuYqSVVplo2ai/XIy4Q/HkQ/fD4HvUvVjzxkkbMLpJaV9zGh/b2FxzPN1
 SMNzFUgKuM8+GXkiiq+YsdS5gJ0+hDcOUHWHsuwWa7sO3XdTqYeBhPbtyQdBmM28n92YcspYGWc
 0whumswql5lBrXFRbDbVRMKjth/WlTtEcMh24l6BFTqotPf0aasekhlP4A8W6uBBclOkXMJa
X-Proofpoint-GUID: z4N3nX1DOmi75dJJX7MB-BGVAzxDSXKc
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68619f29 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: z4N3nX1DOmi75dJJX7MB-BGVAzxDSXKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

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



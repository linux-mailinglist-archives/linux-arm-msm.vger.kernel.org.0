Return-Path: <linux-arm-msm+bounces-62536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D4AE8DCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9E1176F2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896D72F3623;
	Wed, 25 Jun 2025 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIGvpvDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8122F2721
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877943; cv=none; b=K/Z623q2IrKW+4cw4JGZ/4UsT14gqd65VA7aEQUzxNQc64AtDhcKu0xQQmUtlV0hSHbmPAdBaR/eCA61+vI1xYKX4czbBczKpEpM4vP0/EduLxWnQlZb1DzqjykELLFYkJfLWAIg3IkhrVLpLVT+ePqX/4rapiYBppSkysT47n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877943; c=relaxed/simple;
	bh=hd+SGUOq+Yjn92HqZGWhDKi1nbHdVQyx7YshAq31C8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OYdgqAn1KHqqsRKVUpID2+zgSRrBaf9moNNXBxgyTyQ+dOjobGIcZnfaB3YAZayxbjU0GFvubGLXBB2OZwxk0D7BDocQzrikLrCJc81f7BDdpXvowkkpsp/r0VDbVZ+ge8fUXNNFX97vCzh8kkC6K5Q8ZBy+MLZWinJ8QMgh5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIGvpvDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9SrBU001664
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nqziWkTpKn7
	+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=; b=eIGvpvDehYgqN9sXz+0//R1otJG
	hEi0O7yl1x1v1GTQp+D6tnG2oKP2eWY9Ue9tHjF7Z8UXtulyyxmTNu82jVWKIAO6
	qDQgycWIW4j147uo37iaUrFzr5iUAXBfKxlPsbzsA5tsFov2NQE4ivfzPab3uPW8
	MnJLE/JWZ7Tc0EKD5xyMXJPzWa+2PRDxgLGZmbfqeD0AXrC6RYlGmUYx5EGCcuLJ
	jyIVG+ilm3kA6fSMEeLJm/oVoszYDqXmKyUJ4Ye7zZWeBuBQItHinXJvqB1Yr/hg
	q/rN7s2qgVKbQan+kMEutmXFV5SGqOghmE+veOxLZIVu4vSPWb3r61YmjBQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2eea1c2e97so97970a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877939; x=1751482739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqziWkTpKn7+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=;
        b=i5tdOXYL6MSXl4MiEAv0gnG974En2camlN3Ng/sefA6SMfs/slysN7A8lS5Aq1IiAE
         NDPNdb/LgOMrklNOjEihBjrThOOW9Ny0YEP+08rIyx0/32oylCF7gJMPVHLVdxiXnPhX
         Jj7KMrwBfuaLEjBxP3GO5IpMIsnRjlT7lbN3MFG+7Gsvjk4MWwZjrA6tQ0kUU7JXz07D
         1gUZet9G0hOENPa+i4jMhm8CDdmUfqQyS5MB6C+hnGkJ/UPDfqYXdqnDrSs51lAzYZtM
         ZWuooQ4BS0qP1oszC8lUzhpsyBvHXgtbla3HYyWCqnWqI6/F6hUIPvWUE7A7/nfegCqI
         BM+g==
X-Gm-Message-State: AOJu0Ywxz4LSmug7jK8YTpM70LMONeP5OT5kafIW//6PovmVKYTUJdwd
	WIL9Y8Z1CfZEFSyLzsjB9M/dRc0OMmclRK2DpAPFTzPIOQoBKFeerHJqosAAQBwOHUehdY+umJd
	+TPkvSrMTH4u6cQJUkOZ5/+jeFv9180ue9dEoNphUDbADIbdBB1fT1sF1U1LsKPwOnxPK
X-Gm-Gg: ASbGncvR+e2glwHfYEI9oWzWb3BbwGasm0mOhpTapVOj87RxGDcqfQNqhuNmFBKbcfK
	XxKlB5uBj7COr1CDxtOohjhOMiYdliSpgPFzzbQGPl9wnemuEJI13K+XZH+Qc+45XG0u6zMn5M9
	WuvTKQ+wCWVC50CPZsGwLCkFy12meIMZBfLmUaqqCkO0PP6Vn++M8Md5QCuNirpNAwsl+Ul8G2V
	pETAZEJZJZ3hPMaCcO+byPK49Y9ddsnHGpTagCM86eatX15yIkLJR4YDTSbB+FbdMtRcbpiyyc8
	Jyr1AoEaoc1BLNUJJlEGOthS9taRJjIo
X-Received: by 2002:a17:903:2f4c:b0:234:b41e:37a2 with SMTP id d9443c01a7336-238c86ee132mr9721435ad.11.1750877939036;
        Wed, 25 Jun 2025 11:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQyQ5uDlaknabIX1fOYhjGPTFIufwUdkrN+G7wbVg/TJZF7xfMrXlccspbcvQ7vz/RHivcvg==
X-Received: by 2002:a17:903:2f4c:b0:234:b41e:37a2 with SMTP id d9443c01a7336-238c86ee132mr9721035ad.11.1750877938619;
        Wed, 25 Jun 2025 11:58:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83efb71sm139513385ad.75.2025.06.25.11.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:58 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v7 24/42] drm/msm: Add _NO_SHARE flag
Date: Wed, 25 Jun 2025 11:47:17 -0700
Message-ID: <20250625184918.124608-25-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: d1bJvE1JlruVu4BmyXkkyft0ufqfGM_f
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46f4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: d1bJvE1JlruVu4BmyXkkyft0ufqfGM_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXyiCBiQFUTFYr
 fk5qb8HpfuF6XSBiAGthOCWF+qIgPmq6oZy8YtBiahKefWBGxWMjGq03TbsOANvdMqEgP8HT5RE
 XQKbS4KLtKE/xlOlkSW5axDOfU1zYQVJrbymFTE0o/5V4NuBWfsqkPDgQD27a3uxtaXjvo7XbLS
 TtGBo2iBl7pqNAJZheneHNPwuKvAyN6LU9mGwCYjna4PyCnHjPaJrdYk2xF9hrkLuf44tH5VJ7Y
 r1/CciQztNYCevZ5j/Aw5bS2Rc4IcSzGE09W+xHcKXD9zmhouEFBF2r3K8NP0GUSe7bhDGCMJgN
 ZetJeVRRCa07KrXDGMj2/CWdnoB9i1Md3qPH5d+9VBPE1e56nR7Ed8jepVjNkRjKtodjS1H1iJ0
 6b4G6hsPFWUirP3+reQUzjWBniQWLs60Xgc2W6mAs4roqkDTB9VVt016aDgzhARFmwmRCQle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Buffers that are not shared between contexts can share a single resv
object.  This way drm_gpuvm will not track them as external objects, and
submit-time validating overhead will be O(1) for all N non-shared BOs,
instead of O(n).

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.h       |  1 +
 drivers/gpu/drm/msm/msm_gem.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c | 15 +++++++++++++++
 include/uapi/drm/msm_drm.h          | 14 ++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 136dd928135a..2f42d075f13a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -246,6 +246,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags);
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 142845378deb..ec349719b49a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -554,6 +554,9 @@ static int get_and_pin_iova_range_locked(struct drm_gem_object *obj,
 
 	msm_gem_assert_locked(obj);
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	vma = get_vma_locked(obj, vm, range_start, range_end);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
@@ -1084,6 +1087,14 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
 		put_pages(obj);
 	}
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE) {
+		struct drm_gem_object *r_obj =
+			container_of(obj->resv, struct drm_gem_object, _resv);
+
+		/* Drop reference we hold to shared resv obj: */
+		drm_gem_object_put(r_obj);
+	}
+
 	drm_gem_object_release(obj);
 
 	kfree(msm_obj->metadata);
@@ -1116,6 +1127,15 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	if (name)
 		msm_gem_object_set_name(obj, "%s", name);
 
+	if (flags & MSM_BO_NO_SHARE) {
+		struct msm_context *ctx = file->driver_priv;
+		struct drm_gem_object *r_obj = drm_gpuvm_resv_obj(ctx->vm);
+
+		drm_gem_object_get(r_obj);
+
+		obj->resv = r_obj->resv;
+	}
+
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -1148,6 +1168,7 @@ static const struct drm_gem_object_funcs msm_gem_object_funcs = {
 	.free = msm_gem_free_object,
 	.open = msm_gem_open,
 	.close = msm_gem_close,
+	.export = msm_gem_prime_export,
 	.pin = msm_gem_prime_pin,
 	.unpin = msm_gem_prime_unpin,
 	.get_sg_table = msm_gem_prime_get_sg_table,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index ee267490c935..1a6d8099196a 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -16,6 +16,9 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int npages = obj->size >> PAGE_SHIFT;
 
+	if (msm_obj->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EINVAL);
+
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-ENOMEM);
 
@@ -45,6 +48,15 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+
+struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	struct page **pages;
@@ -53,6 +65,9 @@ int msm_gem_prime_pin(struct drm_gem_object *obj)
 	if (obj->import_attach)
 		return 0;
 
+	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
+		return -EINVAL;
+
 	pages = msm_gem_pin_pages_locked(obj);
 	if (IS_ERR(pages))
 		ret = PTR_ERR(pages);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b974f5a24dbc..1bccc347945c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -140,6 +140,19 @@ struct drm_msm_param {
 
 #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
 #define MSM_BO_GPU_READONLY  0x00000002
+/* Private buffers do not need to be explicitly listed in the SUBMIT
+ * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
+ * buffers may NOT be imported/exported or used for scanout (or any
+ * other situation where buffers can be indefinitely pinned, but
+ * cases other than scanout are all kernel owned BOs which are not
+ * visible to userspace).
+ *
+ * In exchange for those constraints, all private BOs associated with
+ * a single context (drm_file) share a single dma_resv, and if there
+ * has been no eviction since the last submit, there are no per-BO
+ * bookeeping to do, significantly cutting the SUBMIT overhead.
+ */
+#define MSM_BO_NO_SHARE      0x00000004
 #define MSM_BO_CACHE_MASK    0x000f0000
 /* cache modes */
 #define MSM_BO_CACHED        0x00010000
@@ -149,6 +162,7 @@ struct drm_msm_param {
 
 #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
                               MSM_BO_GPU_READONLY | \
+                              MSM_BO_NO_SHARE | \
                               MSM_BO_CACHE_MASK)
 
 struct drm_msm_gem_new {
-- 
2.49.0



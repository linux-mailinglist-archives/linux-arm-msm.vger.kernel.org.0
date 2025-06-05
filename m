Return-Path: <linux-arm-msm+bounces-60395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BABACF719
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F243A6FCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB71A28469B;
	Thu,  5 Jun 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EG+GBmbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30BB283CBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148383; cv=none; b=LFF1yo6upf8OMJiUUSghY9Rc5R5SZms96ib/ha5lWTFvUnXWE378Aj6QGEGf2zsJgha40q/zab1eo0RnL8KWYJWeC8lORl+mIcAnzu9IexyaxOiNbcaMBXv4Nf5npdYGDj7/wyIR1gUF4Iky6J9zjn4BYPND9YOW8ZaxS7MdTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148383; c=relaxed/simple;
	bh=hd+SGUOq+Yjn92HqZGWhDKi1nbHdVQyx7YshAq31C8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCJstxbqfTzIK/HBW26dtxa+zenB16Mod86ub/Tf5GCuxQgaPtcHLqQJ+WPHNmRFrSRb2tqidy+VjmPYQhmxMrx+0i/+jh52W1wcBrSHA4ccNuvtHvgYG2/NYoF3MtZm/YiOfJ+ASTzkaZwqhsObr/BHQIfNhLTaGBdwvnFS1pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EG+GBmbC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555BJb13030292
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nqziWkTpKn7
	+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=; b=EG+GBmbCNcEOpSWi45XyesNxaYZ
	dQbxM+yhtbmtR0ULneuEC9Oj++r1LltWpg22pMAdrNpcBi8KZ44q43OPCHbefStO
	oKtocQFqJHw7XMMpsTXrXFIWOvlzKV37Jpr3O7jIrbmYantwirkqkPF3RVAQcpqv
	Aq1vIADXSy5ydJ68+9a/tJyR/DjJ8O2cwExr5MJ6yI7RXZTtcU4bSuf5n7sZ/i+Y
	jpVWnIk5TLNRXy4/rGLMqWKnVqSq4lb8OdEDdS0T0LaCCTkkeQ3FXKC6NWTXSOtx
	ejobqcFLdBfj7NAyTYTcs7ylwcpPtygHVLYLR/iVyUgcSJJNqK2GOmVMxIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be8619v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234f1acc707so11270975ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148380; x=1749753180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqziWkTpKn7+Zo16n4ZbnSlGZfnmg6jhLx65Rn+Pn3w=;
        b=sL7SKgSn/pIc1OxgaT229symLBRehKyaqANISPkAyO49PXQlcJiCUg/R9/b2CBxtvP
         WFhyrfulTAWMvijL13tlT8cYki+4TKHXzziZ1GY5WQiDJzPdeAuUctjPrrq4rVkmjtXo
         6L0CcNLOtuKo2UdwkqiB+1xGSsni0Cf9NOhGREiL24a/Y+EMDrJYIt8Kdk3tW57ljoHj
         sK02Oh3fz/geWIK/YDoCWVV2pt+B4sxm/FZqJJBltpGtpuI8Jj/FaS/dqNFQJPN5dJR/
         bbXgTj0RFKnu+E+bIIPEre0bmQlq5vNY2HNkL1hjOPyymkZqACw8N49xeQmlYMianAm0
         3WsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQt+ojrY5KGe4RmNfZuXGCUnKo3JZRAGbZeJKACYPgdB6ctk0Vb18Qe+SHf36hoDDUc3SShYSYc02H+dOy@vger.kernel.org
X-Gm-Message-State: AOJu0YybNBBLis4MSZkQWfSpTXIruRJnPF5LzRHPVj/Q4HWpVQ6g+QCF
	69V6rrC+Bhl6PE3+XjppSyK5DraIbPJ23lNx/7AB2+UXk3gpjQ+71D34PwZMFTw57s7Vl1S3o67
	9O2gv5nI7m4RR4vUZ/4TGwCHlky7RUGZg7vIkLhtvc5O+iaGAvK1gnejKSHwPDfBpH1ms
X-Gm-Gg: ASbGncvsMKyiNk1uUzy/sg+AfRRiNX8ctAeK47zmsxxuwipQzlZ68N7JnA/cwIDH/Du
	ysePpukIM/GrXe9H04b8M/DrTobuBVXRP3pebafjLwUK7Ms13oyV/ImUTNIKgJgvqqVMLhYrmOB
	26ciF+rW4HYE6UO5jeMsq94x3OlClkfXjVRsdIALsUSTaDKzcYng6V+jbdaK+KbsIWBH/PCpb+4
	xxND4X5rNSAvqn8aKJAhsIxwYfGu423BeViRoV832LDxpMDWxoQAygbM12hgVJGsL9qPCjNY9YV
	XBUCyqWsix3j0owxnD1CoA==
X-Received: by 2002:a17:903:46ce:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-23601cfe62dmr6543895ad.16.1749148379771;
        Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Wc1ozqWJdEJOY5f3ma/qLJznKI268nR0qhjqBDV7W/JjvQrcki5qtl7M6f4gTc8B77fmMw==
X-Received: by 2002:a17:903:46ce:b0:234:c5c1:9b5f with SMTP id d9443c01a7336-23601cfe62dmr6543465ad.16.1749148379354;
        Thu, 05 Jun 2025 11:32:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236024815ccsm367605ad.69.2025.06.05.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:58 -0700 (PDT)
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v6 22/40] drm/msm: Add _NO_SHARE flag
Date: Thu,  5 Jun 2025 11:29:07 -0700
Message-ID: <20250605183111.163594-23-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2dc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=5GAAy6agFmV6x6zTEMEA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pykWP3Jky-lC5J-9xsQX1krbgWW8asUq
X-Proofpoint-ORIG-GUID: pykWP3Jky-lC5J-9xsQX1krbgWW8asUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX4DMXFAZnEFcU
 SJnZjogxiMdlZblB2vk2lEt+hQ+oDa1p7t5MMuvk63Jvueg+D41O7G2ADf48E9puV6mLLKyYtbm
 T05kHjt21Q9xPSuK8iB5TVb0r1OdFaW0ap96YT3IP0VujUQbPkrxAioKzEhKXXBMnuvh1Iv6Uq+
 9mi6PwBWkN2eP1dkoqm7iJxlp+AKoo1IEXcDNoT881EEsc3ouQUTsCiSIQXfcKtN6Kk909je4Yu
 wqcL9ZlMIxuoGpN1+AyHiK5oYZqR6U7Z2KynWJxdxD5WMyNyUGfflOMzcp5U+ZRoMLyrHuCBPm3
 yRN5PfZo9vMNclMIC0ntaUk+mg0jsggi0JAsw7apPv36lrcZsHj9OXAeQzOCIKjh+9xEzXZRRls
 zpViEt87yI4lubUTniTZ4LwdeY3QZ4m6izBd/ek4BfQyQuwqQSz+jNUPNycsjCWASFw5xxET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

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



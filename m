Return-Path: <linux-arm-msm+bounces-62541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B873FAE8DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ABB51C249BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBD12F5486;
	Wed, 25 Jun 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jsjj11g2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C232F49E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877951; cv=none; b=m7vqDgPB1wTNw+rIQla2U/Y0JvWxXI3B+B/2I5U75qPZ+9lwN5SeGKI8GWo3J8JdM62SmW3v5fXOKaxQRlfmjaDHM3D9bshS1Ii1QgzQfltRoMgfQfLCO7sH0oWG3AZU/y1ih9ytVuzWDjJkO9/1e1ImrjrKUpveAi8LDKuYsv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877951; c=relaxed/simple;
	bh=J0pQNbB6x/H7ePaaaS7ZUOpUGbfsgtn3CSHqO9Dcccc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eL7fLdZX55FVd1CjXIeNc1y68ygCBra+Res+CZ98K3hePGdb/xoSXDt14nKqNSkDh+Uq7KvPkICZF5mNDwQj1XLsJz4dWRrfGu02DSWDlydoMCJ9q0ko5G6uuBNaStbMGntD46IVaKImzuQpc/JZB26mn05Taoauz9tECqMFsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jsjj11g2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD4G71015282
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F1yQ7yX6yaI
	pkwDE3wKH9/Crq7XFmKQYbQ8fPyvBhLE=; b=Jsjj11g2GaQ7eLpMX999DlmpRRZ
	Qdm/Ot9DBdj2iOFXnlkYR98in9o5uGBvdnv1k+wkco73TQPDbIYTGRVgUPmOQ7ow
	/n/2bFPspIRN5jh4DSRjlSD3kbTpCTjBL/I372r8pp8yrYw2mMtbEwJFFOjzMuak
	4zyG8LJ3c915BHAgGSBWBs2MsN7b/EXj2hzv8VC5kcPJgIYAu60BEB3ro7XTPB3i
	fXFfgFvyOsBMVZhj2IunSw2Y+xwnysfAszBTpzVcLrk5CPfadmwWaIZ5WFYwcNZL
	3V4RD6mV3Ltg9+zGKghl11tkcSygCgzTKoYbxK0BbxwWnOsua9PYFsyO3sw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:59:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7489ac848f3so384966b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877946; x=1751482746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1yQ7yX6yaIpkwDE3wKH9/Crq7XFmKQYbQ8fPyvBhLE=;
        b=YwJMvT+Hca6Caa1/IzBuMVN7ipkLIC/+9KoyLtIMzjBzAApO6rkz0ORQA3Lc13xLfp
         KE7/Z2AIkx9/q+/l8kbFo5nFqzzHwbwNmMXq0IuHASyy4+ZCJvRaxaYPQkYeSVKaURyi
         qTMoP3nFDP22F/Fc8ppwrKTYLnnSWsNfHRiCzOj+tuL6eVoTNm/ypIcEwFhaJu/h2AWO
         aX+GAXa+CT5bRqQdQCnCG/6BsE2ABFav0umx9kTiad4+3pfM2H/0iyVwMuThMKyIER8C
         37fObLIslBuIi7f3D5kuJo7YIKwwuupnlHNXqb7PVN5Qr/PHd5jNWa/ui4WjZnw+mbtT
         W4Mw==
X-Gm-Message-State: AOJu0YytKuF4MUuhveLkBlWdhPsEfqQIzFyYdPION8MN2o0OT+UcT3fP
	jsQnSldXHuvkp8Rdqpa6/5K/MIe24E81YuRWzxhQgHQq4nVlMylo49jctXQMnLJmgg8i3qUJrX5
	DIPtp4muxXtZe0Iiu64lSjr8buFc7OXKN9RBNT4+PA/dTkQP2g+fHycmNXriG8h6RNN1F
X-Gm-Gg: ASbGnctAIuOvJToyPeUwbRaPm+HZiaJlHI9SkP5quV4GDPzCvP3TRY+4syMETktoKsX
	3H6QGfWc/DK/uBgLVMGzC7EKqddIKU44qbMBG3uea4rthYcT3olHpjWFtxMOI6q+x6KJx2x9Wn+
	H3edk9Kh1uN9bzmN84EnjJ6ANfA40/K3z2s1YEyCB+fJSFTz013QlRjObUbsQrrCC1FHK2C+8ku
	/x7WSVDD12lwLXo3K9yymWArbgtBExJYRaIUERTeewhu4LiBvfGkDoOKMluQ3O0Wn6mg0iqnaAX
	Gj/r/PThhPJpeWzipOKNhoDnMWIGanzt
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id adf61e73a8af0-2207f1adf3bmr5936417637.9.1750877946419;
        Wed, 25 Jun 2025 11:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1LmWA4B37cTCZvJEIcBbu0dTeCfOuaoULsy1QTxM37zp0IXZvdQikKnG42zq3g+gUrjS54w==
X-Received: by 2002:a05:6a21:680b:b0:204:4573:d854 with SMTP id adf61e73a8af0-2207f1adf3bmr5936371637.9.1750877945889;
        Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f125d668sm11591495a12.54.2025.06.25.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:59:05 -0700 (PDT)
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
Subject: [PATCH v7 29/42] drm/msm: Extract out syncobj helpers
Date: Wed, 25 Jun 2025 11:47:22 -0700
Message-ID: <20250625184918.124608-30-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46fb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=ii7SkllToyZ1umWTbp4A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MCzVM4qBNZ4VqIXk-r9Oyoq6X45HPqsT
X-Proofpoint-ORIG-GUID: MCzVM4qBNZ4VqIXk-r9Oyoq6X45HPqsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX+rzjcckg6ZBI
 5nJAHc+8Cdnt4rJdQjSscVM2Hl6OCKeOoLIrfbScwVaM0SJxIZ9x3OYkDi7EVyteEwjyI8ug1Dk
 wUFZvZaaZhRYiOx1VosDp5Zxoc29Pr8UN7omUL+3vQ1e+J5sHmh7jSWyBxitIJqrv/ypl0Qeocr
 gUM+1tOuZ2sRM+cocL0Q8lbQeYDgpVKsZXRgpokpjCroBBDNZjG4xb2mD25x8ZtPHoiv3VHNQtn
 xZsV2ZslKAnY/FOrv4i3cYy8ESXNV5ItB1KBmiw9xSyZqoeP0Z+RhYMd/sW7BzA4Y4n2/+5SYni
 PYL373UIjMnEQB6jwes6rQIVdj1QyIfKcTi2KqsfpujNk/CdaxPMjctgF5SjoVkfdjtmyEA3DGE
 6eaa83WEDfUMdiXmccphCznP1+W/Uz/CkAG7p3KccVokypyYSTVRdYD+Qazv/fDueCfblvoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

We'll be re-using these for the VM_BIND ioctl.

Also, rename a few things in the uapi header to reflect that syncobj use
is not specific to the submit ioctl.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile         |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 192 ++-------------------------
 drivers/gpu/drm/msm/msm_syncobj.c    | 172 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_syncobj.h    |  37 ++++++
 include/uapi/drm/msm_drm.h           |  26 ++--
 5 files changed, 235 insertions(+), 193 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 5df20cbeafb8..8af34f87e0c8 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -128,6 +128,7 @@ msm-y += \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
+	msm_syncobj.o \
 	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9562b6343e13..9f18771a1e88 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -16,6 +16,7 @@
 #include "msm_gpu.h"
 #include "msm_gem.h"
 #include "msm_gpu_trace.h"
+#include "msm_syncobj.h"
 
 /* For userspace errors, use DRM_UT_DRIVER.. so that userspace can enable
  * error msgs for debugging, but we don't spam dmesg by default
@@ -491,173 +492,6 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 	}
 }
 
-struct msm_submit_post_dep {
-	struct drm_syncobj *syncobj;
-	uint64_t point;
-	struct dma_fence_chain *chain;
-};
-
-static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
-                                           struct drm_file *file,
-                                           uint64_t in_syncobjs_addr,
-                                           uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride)
-{
-	struct drm_syncobj **syncobjs = NULL;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
-
-	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
-	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
-	if (!syncobjs)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < nr_in_syncobjs; ++i) {
-		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = SUBMIT_ERROR(EOPNOTSUPP, submit, "syncobj timeline unsupported");
-			break;
-		}
-
-		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
-			ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj flags: %x", syncobj_desc.flags);
-			break;
-		}
-
-		ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
-							   syncobj_desc.handle, syncobj_desc.point);
-		if (ret)
-			break;
-
-		if (syncobj_desc.flags & MSM_SUBMIT_SYNCOBJ_RESET) {
-			syncobjs[i] =
-				drm_syncobj_find(file, syncobj_desc.handle);
-			if (!syncobjs[i]) {
-				ret = SUBMIT_ERROR(EINVAL, submit, "invalid syncobj handle: %u", i);
-				break;
-			}
-		}
-	}
-
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			if (syncobjs[j])
-				drm_syncobj_put(syncobjs[j]);
-		}
-		kfree(syncobjs);
-		return ERR_PTR(ret);
-	}
-	return syncobjs;
-}
-
-static void msm_reset_syncobjs(struct drm_syncobj **syncobjs,
-                               uint32_t nr_syncobjs)
-{
-	uint32_t i;
-
-	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
-		if (syncobjs[i])
-			drm_syncobj_replace_fence(syncobjs[i], NULL);
-	}
-}
-
-static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
-                                                       struct drm_file *file,
-                                                       uint64_t syncobjs_addr,
-                                                       uint32_t nr_syncobjs,
-                                                       size_t syncobj_stride)
-{
-	struct msm_submit_post_dep *post_deps;
-	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
-	int ret = 0;
-	uint32_t i, j;
-
-	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
-			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
-	if (!post_deps)
-		return ERR_PTR(-ENOMEM);
-
-	for (i = 0; i < nr_syncobjs; ++i) {
-		uint64_t address = syncobjs_addr + i * syncobj_stride;
-
-		if (copy_from_user(&syncobj_desc,
-			           u64_to_user_ptr(address),
-			           min(syncobj_stride, sizeof(syncobj_desc)))) {
-			ret = -EFAULT;
-			break;
-		}
-
-		post_deps[i].point = syncobj_desc.point;
-
-		if (syncobj_desc.flags) {
-			ret = UERR(EINVAL, dev, "invalid syncobj flags");
-			break;
-		}
-
-		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
-				break;
-			}
-
-			post_deps[i].chain = dma_fence_chain_alloc();
-			if (!post_deps[i].chain) {
-				ret = -ENOMEM;
-				break;
-			}
-		}
-
-		post_deps[i].syncobj =
-			drm_syncobj_find(file, syncobj_desc.handle);
-		if (!post_deps[i].syncobj) {
-			ret = UERR(EINVAL, dev, "invalid syncobj handle");
-			break;
-		}
-	}
-
-	if (ret) {
-		for (j = 0; j <= i; ++j) {
-			dma_fence_chain_free(post_deps[j].chain);
-			if (post_deps[j].syncobj)
-				drm_syncobj_put(post_deps[j].syncobj);
-		}
-
-		kfree(post_deps);
-		return ERR_PTR(ret);
-	}
-
-	return post_deps;
-}
-
-static void msm_process_post_deps(struct msm_submit_post_dep *post_deps,
-                                  uint32_t count, struct dma_fence *fence)
-{
-	uint32_t i;
-
-	for (i = 0; post_deps && i < count; ++i) {
-		if (post_deps[i].chain) {
-			drm_syncobj_add_point(post_deps[i].syncobj,
-			                      post_deps[i].chain,
-			                      fence, post_deps[i].point);
-			post_deps[i].chain = NULL;
-		} else {
-			drm_syncobj_replace_fence(post_deps[i].syncobj,
-			                          fence);
-		}
-	}
-}
-
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -668,7 +502,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_gpu *gpu = priv->gpu;
 	struct msm_gpu_submitqueue *queue;
 	struct msm_ringbuffer *ring;
-	struct msm_submit_post_dep *post_deps = NULL;
+	struct msm_syncobj_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
@@ -745,10 +579,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_SYNCOBJ_IN) {
-		syncobjs_to_reset = msm_parse_deps(submit, file,
-		                                   args->in_syncobjs,
-		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride);
+		syncobjs_to_reset = msm_syncobj_parse_deps(dev, &submit->base,
+							   file, args->in_syncobjs,
+							   args->nr_in_syncobjs,
+							   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
@@ -756,10 +590,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (args->flags & MSM_SUBMIT_SYNCOBJ_OUT) {
-		post_deps = msm_parse_post_deps(dev, file,
-		                                args->out_syncobjs,
-		                                args->nr_out_syncobjs,
-		                                args->syncobj_stride);
+		post_deps = msm_syncobj_parse_post_deps(dev, file,
+							args->out_syncobjs,
+							args->nr_out_syncobjs,
+							args->syncobj_stride);
 		if (IS_ERR(post_deps)) {
 			ret = PTR_ERR(post_deps);
 			goto out_unlock;
@@ -902,10 +736,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	args->fence = submit->fence_id;
 	queue->last_fence = submit->fence_id;
 
-	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
-	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
-	                      submit->user_fence);
-
+	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
+	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, submit->user_fence);
 
 out:
 	submit_cleanup(submit, !!ret);
diff --git a/drivers/gpu/drm/msm/msm_syncobj.c b/drivers/gpu/drm/msm/msm_syncobj.c
new file mode 100644
index 000000000000..4baa9f522c54
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_syncobj.c
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2020 Google, Inc */
+
+#include "drm/drm_drv.h"
+
+#include "msm_drv.h"
+#include "msm_syncobj.h"
+
+struct drm_syncobj **
+msm_syncobj_parse_deps(struct drm_device *dev,
+		       struct drm_sched_job *job,
+		       struct drm_file *file,
+		       uint64_t in_syncobjs_addr,
+		       uint32_t nr_in_syncobjs,
+		       size_t syncobj_stride)
+{
+	struct drm_syncobj **syncobjs = NULL;
+	struct drm_msm_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	syncobjs = kcalloc(nr_in_syncobjs, sizeof(*syncobjs),
+	                   GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!syncobjs)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_in_syncobjs; ++i) {
+		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (syncobj_desc.point &&
+		    !drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE)) {
+			ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
+			break;
+		}
+
+		if (syncobj_desc.flags & ~MSM_SYNCOBJ_FLAGS) {
+			ret = UERR(EINVAL, dev, "invalid syncobj flags: %x", syncobj_desc.flags);
+			break;
+		}
+
+		ret = drm_sched_job_add_syncobj_dependency(job, file,
+						   syncobj_desc.handle,
+						   syncobj_desc.point);
+		if (ret)
+			break;
+
+		if (syncobj_desc.flags & MSM_SYNCOBJ_RESET) {
+			syncobjs[i] = drm_syncobj_find(file, syncobj_desc.handle);
+			if (!syncobjs[i]) {
+				ret = UERR(EINVAL, dev, "invalid syncobj handle: %u", i);
+				break;
+			}
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			if (syncobjs[j])
+				drm_syncobj_put(syncobjs[j]);
+		}
+		kfree(syncobjs);
+		return ERR_PTR(ret);
+	}
+	return syncobjs;
+}
+
+void
+msm_syncobj_reset(struct drm_syncobj **syncobjs, uint32_t nr_syncobjs)
+{
+	uint32_t i;
+
+	for (i = 0; syncobjs && i < nr_syncobjs; ++i) {
+		if (syncobjs[i])
+			drm_syncobj_replace_fence(syncobjs[i], NULL);
+	}
+}
+
+struct msm_syncobj_post_dep *
+msm_syncobj_parse_post_deps(struct drm_device *dev,
+			    struct drm_file *file,
+			    uint64_t syncobjs_addr,
+			    uint32_t nr_syncobjs,
+			    size_t syncobj_stride)
+{
+	struct msm_syncobj_post_dep *post_deps;
+	struct drm_msm_syncobj syncobj_desc = {0};
+	int ret = 0;
+	uint32_t i, j;
+
+	post_deps = kcalloc(nr_syncobjs, sizeof(*post_deps),
+			    GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	if (!post_deps)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < nr_syncobjs; ++i) {
+		uint64_t address = syncobjs_addr + i * syncobj_stride;
+
+		if (copy_from_user(&syncobj_desc,
+			           u64_to_user_ptr(address),
+			           min(syncobj_stride, sizeof(syncobj_desc)))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		post_deps[i].point = syncobj_desc.point;
+
+		if (syncobj_desc.flags) {
+			ret = UERR(EINVAL, dev, "invalid syncobj flags");
+			break;
+		}
+
+		if (syncobj_desc.point) {
+			if (!drm_core_check_feature(dev,
+			                            DRIVER_SYNCOBJ_TIMELINE)) {
+				ret = UERR(EOPNOTSUPP, dev, "syncobj timeline unsupported");
+				break;
+			}
+
+			post_deps[i].chain = dma_fence_chain_alloc();
+			if (!post_deps[i].chain) {
+				ret = -ENOMEM;
+				break;
+			}
+		}
+
+		post_deps[i].syncobj =
+			drm_syncobj_find(file, syncobj_desc.handle);
+		if (!post_deps[i].syncobj) {
+			ret = UERR(EINVAL, dev, "invalid syncobj handle");
+			break;
+		}
+	}
+
+	if (ret) {
+		for (j = 0; j <= i; ++j) {
+			dma_fence_chain_free(post_deps[j].chain);
+			if (post_deps[j].syncobj)
+				drm_syncobj_put(post_deps[j].syncobj);
+		}
+
+		kfree(post_deps);
+		return ERR_PTR(ret);
+	}
+
+	return post_deps;
+}
+
+void
+msm_syncobj_process_post_deps(struct msm_syncobj_post_dep *post_deps,
+			      uint32_t count, struct dma_fence *fence)
+{
+	uint32_t i;
+
+	for (i = 0; post_deps && i < count; ++i) {
+		if (post_deps[i].chain) {
+			drm_syncobj_add_point(post_deps[i].syncobj,
+			                      post_deps[i].chain,
+			                      fence, post_deps[i].point);
+			post_deps[i].chain = NULL;
+		} else {
+			drm_syncobj_replace_fence(post_deps[i].syncobj,
+			                          fence);
+		}
+	}
+}
diff --git a/drivers/gpu/drm/msm/msm_syncobj.h b/drivers/gpu/drm/msm/msm_syncobj.h
new file mode 100644
index 000000000000..bcaa15d01da0
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_syncobj.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2020 Google, Inc */
+
+#ifndef __MSM_GEM_SYNCOBJ_H__
+#define __MSM_GEM_SYNCOBJ_H__
+
+#include "drm/drm_device.h"
+#include "drm/drm_syncobj.h"
+#include "drm/gpu_scheduler.h"
+
+struct msm_syncobj_post_dep {
+	struct drm_syncobj *syncobj;
+	uint64_t point;
+	struct dma_fence_chain *chain;
+};
+
+struct drm_syncobj **
+msm_syncobj_parse_deps(struct drm_device *dev,
+		       struct drm_sched_job *job,
+		       struct drm_file *file,
+		       uint64_t in_syncobjs_addr,
+		       uint32_t nr_in_syncobjs,
+		       size_t syncobj_stride);
+
+void msm_syncobj_reset(struct drm_syncobj **syncobjs, uint32_t nr_syncobjs);
+
+struct msm_syncobj_post_dep *
+msm_syncobj_parse_post_deps(struct drm_device *dev,
+			    struct drm_file *file,
+			    uint64_t syncobjs_addr,
+			    uint32_t nr_syncobjs,
+			    size_t syncobj_stride);
+
+void msm_syncobj_process_post_deps(struct msm_syncobj_post_dep *post_deps,
+				   uint32_t count, struct dma_fence *fence);
+
+#endif /* __MSM_GEM_SYNCOBJ_H__ */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 1bccc347945c..2c2fc4b284d0 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -220,6 +220,17 @@ struct drm_msm_gem_cpu_fini {
  * Cmdstream Submission:
  */
 
+#define MSM_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
+#define MSM_SYNCOBJ_FLAGS ( \
+		MSM_SYNCOBJ_RESET | \
+		0)
+
+struct drm_msm_syncobj {
+	__u32 handle;     /* in, syncobj handle. */
+	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
+	__u64 point;      /* in, timepoint for timeline syncobjs. */
+};
+
 /* The value written into the cmdstream is logically:
  *
  *   ((relocbuf->gpuaddr + reloc_offset) << shift) | or
@@ -309,17 +320,6 @@ struct drm_msm_gem_submit_bo {
 		MSM_SUBMIT_FENCE_SN_IN   | \
 		0)
 
-#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
-#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
-		MSM_SUBMIT_SYNCOBJ_RESET | \
-		0)
-
-struct drm_msm_gem_submit_syncobj {
-	__u32 handle;     /* in, syncobj handle. */
-	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
-	__u64 point;      /* in, timepoint for timeline syncobjs. */
-};
-
 /* Each cmdstream submit consists of a table of buffers involved, and
  * one or more cmdstream buffers.  This allows for conditional execution
  * (context-restore), and IB buffers needed for per tile/bin draw cmds.
@@ -333,8 +333,8 @@ struct drm_msm_gem_submit {
 	__u64 cmds;           /* in, ptr to array of submit_cmd's */
 	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
 	__u32 queueid;        /* in, submitqueue id */
-	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
-	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
+	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_syncobj */
+	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_syncobj */
 	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
 	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
 	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
-- 
2.49.0



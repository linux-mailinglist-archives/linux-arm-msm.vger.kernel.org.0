Return-Path: <linux-arm-msm+bounces-60410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC5ACF745
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0D118855D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F2C289826;
	Thu,  5 Jun 2025 18:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYPn6v9w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A36289832
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148435; cv=none; b=fCRtpvQLXi0pDbCESSFNwCei+kyahj7gGi3oz3hfsqOuE7Hu5/amVKlCPJTkqpqIl2uvFsTVYHGkwDFjmtVxmksBOOfI1d/QP2nLvlTfYYxjZdifgREEajINCmXgFvuxpeTAFQNwYIT1TvpW0L9gulxvE+4kd9QSckMzYDkgD+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148435; c=relaxed/simple;
	bh=CNFpqBCpJTApkLdrqsBLeL7yC78BMVJQT1X3MZKnBuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glCjIRpTX3P8AyMTFm+jrEEhD9L/W711Hxt9sSa2sisOF6NCQki/Cn9ZtAc7Anxm1V9B6/3+Fp59p+W9+QZISzKuRNeqll/XooDtwIK5MlYtIW1lIxTI/r0zREBFvkdzx8DDM6sxwMPo/QTMJ5CYot4i7QU4zsqobQazCfA9LPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYPn6v9w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GmKhA006326
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l1oDcpRqB1J
	+a1cJgnMEhleqoTcWJSa+Q8URyBzUP58=; b=TYPn6v9wYWE5PHNPJDBGXtHAdCV
	NALzwp9L3ij9piPI8YtW3JuL10sFQKM0wqMllYLgP2x/IKWrcqB6iWWPGL3PUQTB
	YKN+40xjqikm066CqIzW0Le+ZvC3L7Drt+BsveJmqw+jTcPIaxSS7QBZxz/IjA09
	MYO2/OBQWID0IVbBiHH54kVTM5uuDF8KgPUOMYwV/r4IHm4qxZiQnxJZg9+gIkom
	Hj/t8DrCEe3wdPZS5JTfXCSyvQXQbIx38c9G02dEdrIkUZPoyhXtjukCrdgy5wRr
	PM04FqfVqD0Y+U2TpXUaDLi+B+5BrawYgnIWx17hmx8kR8tEEcJmiohCNkQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2amm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74299055c3dso2056064b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148403; x=1749753203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1oDcpRqB1J+a1cJgnMEhleqoTcWJSa+Q8URyBzUP58=;
        b=s1rM+gNoKFXl84j6GRurgcud9Yjw0gmGAJrfe96uzbfpMhY3Sy457k0AozR4UmP2m8
         ahyRAYjcl9z63F7zIAOk4+ZmGDUidzd1izMkkEfSBayeFLvGrtZq+ydAAiH6appNHoeL
         0p2+IeURdylE08SuZrQjzEwtqHezStXHHK4WecJP/Bu5GRXQAN/FWszqiIVRhJj4FrTf
         RtaayPEW8TaaG8nPGJhsUNG451v/ffqx39VzoJ1S5tdBk3tMsGTmOa1O5pq1weSZQsKb
         uHAKPHnVhtxPkyxvw0jHbsPN4IvRk0Z6LxEeiE2b0EVGGeJE6fCNm1rWps7SP8ws9MEI
         jVcA==
X-Forwarded-Encrypted: i=1; AJvYcCWiXXDDS++uVd8aJw0M03NLDck4WuZvut76Kwf9Gx/F1JH0GZm29ITVboFZ3ZrLiA7N+y02IEeTMGZq0v/U@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZsWtEz2nPnV17BN4sxfGSoy7JB12g7NcvllMp7VHr1IMudTY
	8Vm5OPIDeb7KuqBaL+rdm5BwsJV8xozfYRNn1XOfadZqcuqNarM+kaU9JRz3+8MyJNm4Nwmx1Bh
	P9RyUOPWzw5D86+6jDGgqUTGnWHRNZ1cyqESuMw7VBYoDoSDHrqch3vW728W8KleRo2Rg
X-Gm-Gg: ASbGncss86Do2S4m8xaz3kB+FWPz9XySADkgH35Gq0JQLDLSGEgHX5lrMqsCAtpD2TS
	8vHj3lN2e0xd2NqT/9POBbeANxTLUINmLer/RQoVkEeKNz2LGP3VHUGbzSjLNZ/hvCnVT4DAGNd
	/8y/s88KUPs/nsDN4TirDcCkB2udF7PCMGc2DQZswEfae78SmlPaH76n+JawAdWVacaYhTraIid
	yk7X69AkjZ/QjMAu0cnnGmw3oPZIYc1FHxAlaOzp1M6E1ii6KQAMV/cupbR2nR3r28FN+wNRMVv
	nuFnw0DLDc91r38s4mypp9f6FUQd7FkO
X-Received: by 2002:a05:6a00:cce:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-74827e50eb9mr1048526b3a.2.1749148403489;
        Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMNkt3VnPgo9LHcMEBOOISZcxlTtccCk13++zwvFaeLaKCW5x2JsNvx3t7Oim2FO7VOM6X+g==
X-Received: by 2002:a05:6a00:cce:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-74827e50eb9mr1048489b3a.2.1749148403058;
        Thu, 05 Jun 2025 11:33:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafc55sm13562918b3a.96.2025.06.05.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b)
Subject: [PATCH v6 39/40] drm/msm: Defer VMA unmap for fb unpins
Date: Thu,  5 Jun 2025 11:29:24 -0700
Message-ID: <20250605183111.163594-40-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bv547H1mQLuck7fwDD2Vj6PefmJEWzNC
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e310 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=kRuV8PDA-HUW7Xa4O9wA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bv547H1mQLuck7fwDD2Vj6PefmJEWzNC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX3wqdmuQqko2e
 SV/N/FDfIjdC+w5i+cAWVCcPN0XsSX8TL/pNg3yJnl3tmL8/VGoU2+bo1VjEJqfEoeKe7yvbwlW
 vrvC4wKTocwSYug9MrKXBiD4Ecnyo25OyaqMMjAU0OSkEZLvZtXeVL5n+zMlXjWd0s5v24/KeMf
 QBPswyNOXm7QJvXaYSmFIbQXBstdWdDv7TtUUZkbAZI44xgFEmz11L6aK08/u5uQoYgCnt2F/2W
 3u4zNkBoS8hSAMy7SnHTPIpKn55jcEE2UOoGoQdXlTfA+F0xRImZOwzVhLW6cpLeVcCUpUX/Xfo
 oYJBbRLZVXttJlOPBHupr5raW0ouUSIaNUi8NS0Tt+uT0u3suG297Pzf08k9+Qk6e03orMwXFkI
 cm1j8Kv52VnJrV1b3uG4DGhb08xZmeqDWvYmbV8zjpxzwjRJMr3wsBwJ7iD9gfjA++Vt7Eew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050166

With the conversion to drm_gpuvm, we lost the lazy VMA cleanup, which
means that fb cleanup/unpin when pageflipping to new scanout buffers
immediately unmaps the scanout buffer.  This is costly (with tlbinv,
it can be 4-6ms for a 1080p scanout buffer, and more for higher
resolutions)!

To avoid this, introduce a vma_ref, which is incremented for scanout,
and whenever userspace has a GEM handle or dma-buf fd.  When unpinning
if the vm is the kms->vm we defer tearing down the VMA until the
vma_ref drops to zero.  If the buffer is still part of a flip-chain
then userspace will be holding some sort of reference to the BO, either
via a GEM handle and/or dma-buf fd.  So this avoids unmapping the VMA
when there is a strong possibility that it will be needed again.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c        | 77 +++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h        | 29 +++++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c  | 35 ++++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c |  8 +++
 4 files changed, 124 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b882647144bb..55a409ac72f5 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -19,11 +19,11 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 #include "msm_gpu.h"
+#include "msm_kms.h"
 
 static int pgprot = 0;
 module_param(pgprot, int, 0600);
 
-
 static void update_device_mem(struct msm_drm_private *priv, ssize_t size)
 {
 	uint64_t total_mem = atomic64_add_return(size, &priv->total_mem);
@@ -43,6 +43,7 @@ static void update_ctx_mem(struct drm_file *file, ssize_t size)
 
 static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 {
+	msm_gem_vma_get(obj);
 	update_ctx_mem(file, obj->size);
 	return 0;
 }
@@ -50,33 +51,13 @@ static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *file)
 static void put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm,
 			    bool close, const char *reason);
 
-static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
-{
-	msm_gem_assert_locked(obj);
-	drm_gpuvm_resv_assert_held(vm);
-
-	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_find(vm, obj);
-	if (vm_bo) {
-		struct drm_gpuva *vma;
-
-		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
-			if (vma->vm != vm)
-				continue;
-			msm_gem_vma_unmap(vma, "detach");
-			msm_gem_vma_close(vma);
-			break;
-		}
-
-		drm_gpuvm_bo_put(vm_bo);
-	}
-}
-
 static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 {
 	struct msm_context *ctx = file->driver_priv;
 	struct drm_exec exec;
 
 	update_ctx_mem(file, -obj->size);
+	msm_gem_vma_put(obj);
 
 	/*
 	 * If VM isn't created yet, nothing to cleanup.  And in fact calling
@@ -103,10 +84,47 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true, "close");
-	detach_vm(obj, ctx->vm);
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
+/*
+ * Get/put for kms->vm VMA
+ */
+
+void msm_gem_vma_get(struct drm_gem_object *obj)
+{
+	atomic_inc(&to_msm_bo(obj)->vma_ref);
+}
+
+void msm_gem_vma_put(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+	struct drm_exec exec;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
+	drm_exec_fini(&exec);     /* drop locks */
+}
+
+static void msm_gem_vma_put_locked(struct drm_gem_object *obj)
+{
+	struct msm_drm_private *priv = obj->dev->dev_private;
+
+	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
+		return;
+
+	if (!priv->kms)
+		return;
+
+	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
+}
+
 /*
  * Cache sync.. this is a bit over-complicated, to fit dma-mapping
  * API.  Really GPU cache is out of scope here (handled on cmdstream)
@@ -281,6 +299,7 @@ void msm_gem_pin_obj_locked(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	to_msm_bo(obj)->pin_count++;
+	msm_gem_vma_get(obj);
 	drm_gem_lru_move_tail_locked(&priv->lru.pinned, obj);
 }
 
@@ -518,6 +537,8 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 
 	msm_gem_assert_locked(obj);
 
+	msm_gem_vma_put_locked(obj);
+
 	mutex_lock(&priv->lru.lock);
 	msm_obj->pin_count--;
 	GEM_WARN_ON(msm_obj->pin_count < 0);
@@ -664,6 +685,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 	return ret;
 }
 
+static bool is_kms_vm(struct drm_gpuvm *vm)
+{
+	struct msm_drm_private *priv = vm->drm->dev_private;
+
+	return priv->kms && (priv->kms->vm == vm);
+}
+
 /*
  * Unpin a iova by updating the reference counts. The memory isn't actually
  * purged until something else (shrinker, mm_notifier, destroy, etc) decides
@@ -679,7 +707,8 @@ void msm_gem_unpin_iova(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 	if (vma) {
 		msm_gem_unpin_locked(obj);
 	}
-	detach_vm(obj, vm);
+	if (!is_kms_vm(vm))
+		put_iova_spaces(obj, vm, true, "close");
 	drm_exec_fini(&exec);     /* drop locks */
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 9671c4299cf8..fafb221e173b 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -211,9 +211,38 @@ struct msm_gem_object {
 	 * Protected by LRU lock.
 	 */
 	int pin_count;
+
+	/**
+	 * @vma_ref: Reference count of VMA users.
+	 *
+	 * With the vm_bo/vma holding a reference to the GEM object, we'd
+	 * otherwise have to actively tear down a VMA when, for example,
+	 * a buffer is unpinned for scanout, vs. the pre-drm_gpuvm approach
+	 * where a VMA did not hold a reference to the BO, but instead was
+	 * implicitly torn down when the BO was freed.
+	 *
+	 * To regain the lazy VMA teardown, we use the @vma_ref.  It is
+	 * incremented for any of the following:
+	 *
+	 * 1) the BO is pinned for scanout/etc
+	 * 2) the BO is exported as a dma_buf
+	 * 3) the BO has open userspace handle
+	 *
+	 * All of those conditions will hold an reference to the BO,
+	 * preventing it from being freed.  So lazily keeping around the
+	 * VMA will not prevent the BO from being freed.  (Or rather, the
+	 * reference loop is harmless in this case.)
+	 *
+	 * When the @vma_ref drops to zero, then kms->vm VMA will be
+	 * torn down.
+	 */
+	atomic_t vma_ref;
 };
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
+void msm_gem_vma_get(struct drm_gem_object *obj);
+void msm_gem_vma_put(struct drm_gem_object *obj);
+
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
 int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 1a6d8099196a..43f264d3cfa9 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -6,6 +6,7 @@
 
 #include <linux/dma-buf.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_prime.h>
 
 #include "msm_drv.h"
@@ -48,13 +49,45 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
+static void msm_gem_dmabuf_release(struct dma_buf *dma_buf)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+
+	msm_gem_vma_put(obj);
+	drm_gem_dmabuf_release(dma_buf);
+}
+
+static const struct dma_buf_ops msm_gem_prime_dmabuf_ops =  {
+	.cache_sgt_mapping = true,
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_map_dma_buf,
+	.unmap_dma_buf = drm_gem_unmap_dma_buf,
+	.release = msm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+};
 
 struct dma_buf *msm_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
 	if (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE)
 		return ERR_PTR(-EPERM);
 
-	return drm_gem_prime_export(obj, flags);
+	msm_gem_vma_get(obj);
+
+	struct drm_device *dev = obj->dev;
+	struct dma_buf_export_info exp_info = {
+		.exp_name = KBUILD_MODNAME, /* white lie for debug */
+		.owner = dev->driver->fops->owner,
+		.ops = &msm_gem_prime_dmabuf_ops,
+		.size = obj->size,
+		.flags = flags,
+		.priv = obj,
+		.resv = obj->resv,
+	};
+
+	return drm_gem_dmabuf_export(dev, &exp_info);
 }
 
 int msm_gem_prime_pin(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 8a0f5b5eda30..bf9010da7e58 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -527,6 +527,14 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuvm_bo *vm_bo = submit->bos[i].vm_bo;
 
+		/*
+		 * msm_gem_unpin_active() doesn't drop the vma ref, because
+		 * requires grabbing locks which we cannot grab in the fence
+		 * signaling path.  So we have to do that here
+		 */
+		if (submit->bos_pinned)
+			msm_gem_vma_put(obj);
+
 		drm_gem_object_put(obj);
 		drm_gpuvm_bo_put(vm_bo);
 	}
-- 
2.49.0



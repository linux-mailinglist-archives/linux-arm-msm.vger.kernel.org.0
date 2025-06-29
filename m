Return-Path: <linux-arm-msm+bounces-63020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E09ECAED0E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BC2E3AA162
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE5026057C;
	Sun, 29 Jun 2025 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSmfV4mc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0F025F984
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228231; cv=none; b=mUzjuMDK7I8krUIwsXzgjaYi7IKc3OhKbXDZX9EkSR4RSC6cRduHHoyLrqhUy6grZW/iSYusVhIbdtUiGVKjjNYpL+Y7HvMUAx98ZjkNRklRrhD59z3Oji15ijdkl11OhgGfxCEyExhdOVxuZIaVRFkVkKncyy6DSaweWeesAVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228231; c=relaxed/simple;
	bh=MPo1IkqWJ2Qo6U6FxPeDsi41WXUD+qgCx9wi/nJZ6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdTn0b/x++8b+3/kMtLCgHf32KLvK3XLXazk64B/g8hzw5Dc/bLaKPtHo2fD8KOc3TnUPb+Lz1RAAfEimZLQ3pX1tfTQf9DmxoB7SRP2Od9JzTPllvasnx6BE/bIjit1Mjl6FCys8y7jtCS3EG/X5/bHw6IW3RbZpDIR+f1u0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSmfV4mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFPDew001208
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
	ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=RSmfV4mcvX5pQ405rpyNr43/qDU
	7sAdjMrbR9hT8P0OK7oG1yg6B3Wq8RHgbDJ5/pIFs3dDGh9D9LAqVIYXCb/n9Wdf
	G6F1K+376yppN+S1oddc6eRkMo919bSAJATg3QUwhVnegGjPLm3X/TcSBOVIesri
	9q8LMjyUpTSYAPMT55dpYht1xmYn5KfYwg8Zi2wUaGq4HGqr/KtpRjjR1fCcMn9Z
	D3abonYgAdddvhUAG42wEKJYLiMEyX0+NNTRxKEoRkrRIbrCdBT7bts+8Op3ZDrl
	aPk3C3irtBbdoXiDAZaAX+Ec5nJW+7ynPCEywSHu3y8YwdEBjRt5rT+V/mw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jptha6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747dd44048cso4323253b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228227; x=1751833027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
        b=B/E8kWDwuxDuk6puyycd77Ih4WBeAMLqXxRkJ/cuU0YmW/J6qVBjo3fuxS5StXYn/S
         9H61VRTbNRNoAWb3iwrxGNlTDS8NT5HdGwQpz1Z9d4CNFqMO9vIzrvaxVHBn8LvA0cQZ
         UZMX6GzRacl754Bcgnw9q4U5/C49dHMdJbFdvC0hgFYduZvO1vyJIs4i6GAiobIKP0/u
         N82Ac52d9rXBs45byFLyNbXOLNs8Le2u8UYaFSrQy6rj5Fr1F6cRu+6G5/6vqr7FnHdg
         g/vFN5hslMilXpwWOF+qWLAwl3hJ+TEUjCSodQkSuqzh+0cxBXF5/xcoLhwuogHWQGOp
         ZzuQ==
X-Gm-Message-State: AOJu0YxhqXhM40iaQm/GKlC9g2m30T0NQbapsVdeBZbnRxR4muUBzGJM
	CUoj2ddjR/H5Ujf1tytFAarm8wwW4tVNrzQSc/UlelceNcHOPtgiWECRnid375dTCmIyP0SvmKB
	28c4eur0y+sTnh820k4nHnt8p3T6bITBe+2LWwMlAZ/bTEhPCD0raFlqZb9rkx+FwLFcY
X-Gm-Gg: ASbGncuGBTkcNAngiYqLRD58cEg6Qn94yK/0LsJryozFYdsRaairjZy5ipdVTaa3gNQ
	0uBKXiMYgQ0Oz+tDufAxIwY1fptYYvPyDU/qzPrXe2zvRRi3E1dcfN7BBSlyg+WOk/0zIeSMhvi
	gxL/b9PC6OFauxgk8450R7PGOwm7UOF2GOg0eqQ42l3v8/VdBLFxaEh8wXkK1xcWQAnRWz0/BLP
	fUTqdjoyqkqmMiqphrBINUYzjZ09C2g6Ozazyf/HnYJQqJXE0Pfx/AjswfvVW8q5+j6ku0xJrvC
	R3QpnMfLXtiN2f/O5yJMfpAgqA3uiZ9w3g==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id d2e1a72fcca58-74af6f5b39amr16188984b3a.24.1751228227433;
        Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9aruV6eSL2q1mrAooTzltJ0Bk0WGQyzvvWFqX/Eu7bihRZwCW1HMVKXXsx1qqK/9yIQBAVw==
X-Received: by 2002:a05:6a00:845:b0:749:540:ca72 with SMTP id d2e1a72fcca58-74af6f5b39amr16188957b3a.24.1751228227015;
        Sun, 29 Jun 2025 13:17:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e302378bsm5914877a12.23.2025.06.29.13.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:06 -0700 (PDT)
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
Subject: [PATCH v9 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 13:13:17 -0700
Message-ID: <20250629201530.25775-35-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX0vnWFqgJUlc6
 FBO+Fv6gEENNJDm/moHAycg9ZxnyW5rxegs+whlrVxdrBnRrUpXBHb2PL65yvg5xG81VaLyGXTq
 hWXAOBT7OWo4cJaMfpQumtlNoKxfu/pUnUEFGF8einylzNMfYU9tGI2Ek3q1JeXeOhXQ88nEpOm
 mHJX6P5dRHKmXSNXg2TIMPfRvIWijhe7cBR3rHRSq+dxNYoRRWTU6N0irWBseZ7NYZYCxqrEAzR
 PIHs/Da0vLsFGlJPATVRUvyo/T/vyk0mnC8gsqDKR/MbtoaXdx7RSG5fWO6vmm7FVK/mRwLD8rE
 /SAmiX5AeDtD064wkQmopy4twSv5clEB95R4VpVK/E7FwSmVcNuv/Q9QarwnycRMrEYYpVV78FK
 oy/cDr4FdZse+tf26+/AVnSDLT80xKHqcdy/xiwpZUJxlN5mWpLKLsLLOGGkx2vfrCOrVVQZ
X-Proofpoint-ORIG-GUID: 87giS2wCYClzGnLYomM7iZ_ycGLRCWR0
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68619f44 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 87giS2wCYClzGnLYomM7iZ_ycGLRCWR0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.50.0



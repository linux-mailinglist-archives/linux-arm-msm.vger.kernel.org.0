Return-Path: <linux-arm-msm+bounces-62964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D98A5AECD9E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EFFB189449C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACC12459DE;
	Sun, 29 Jun 2025 14:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGaXb+qk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB907244196
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206094; cv=none; b=FFyFa/WWpVBR8krNEVl84QGtszutcNa593x4mYXfJXNI92Zm5t+nrb25z8jZdFL+Xq6GO66FEySw3HeutaMYb9llmxE/I1LPuHhUYpRwsZ9lQMNKw2oSzOvtT5aX3PH3B+KgxSQm7FkqMA8tNrD2QPS4SO5VkxDblbHnCVuGjgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206094; c=relaxed/simple;
	bh=MPo1IkqWJ2Qo6U6FxPeDsi41WXUD+qgCx9wi/nJZ6nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6i5oszGrJPQnrZppsKDdYKg1bWOyn0+122uvbhZmet8KMBBwrQkXkY8D5o5A6KNLDt92Yxt31MP6z25Z604+XBWvxO0WAlXKtKYT6h6CcxzSt6wYlODYhUwnxmTh1FITjuzEHXs4w80AqwKMCiu2jFBf6YjmjBIw6Io2xvFc/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGaXb+qk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAeHqB006623
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A54UdMciCNB
	ls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=; b=aGaXb+qkNkHnKCMQbHKywKgHKpR
	BL2wXJ3XgRy9grgSj28Hcaii/GvaLwx1rkb7D25TLzS4Kkbd+NWfXNZ8JmqRmTln
	1MNpAqz9rSWsx+DZwMyjtiugpHICVfVDqAnJHbDw5hVEBRIGuuvYev6R5tjN0Fsx
	SJgauruyd6TvQyv7o1E449TL5Brm8keuQj1CnFAb3b4+yGAec2CJ95auxetRV5e3
	RgY2fmH1m4SgpCpTRkdBGnqsevJ1MjbzGI2Lh+KS4VLJjmUkApCBp/EcXCMTbExF
	1T0Lzb4SNzSGxw1/9t6qsUQtHlPpL1is+Na/THTPn4TCBFGoiXZgPDLA/og==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxa8g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso2804544a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206090; x=1751810890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A54UdMciCNBls2/cngumRMQ7rIW/ZCmN2ztDtF1NIpw=;
        b=I1Ufg/r5tQt+iQ3mEjaFxS2c9b8fxCtgCnqXfexw6qSvMgvLuojCKS+NRb3q4gTihX
         KqvrY6WPfJ4XCFWa3sxUp4JsWJzKYVpqUTaDR00xPME4E7MOc30FumZjcWuDx2p3KIJd
         9TBsEOCAn25z2hCOTzXqs9nlVMSzJxt9bT2gzW6HZXCMwMRvuqN+p7+Rb9MnwzympnJe
         2uP/JZe02+d6EI0YA7YWBR02Rb4BLX0JQrk+rZ4Lm6PmOIN87fq+ti6f6hwQfONJupH/
         WOlV8ThIa2U2ePXf5XUwNdzU9yvpMZhUukyN8tlLu6NZK1HA3gOuMETkL9FAwX9aaYtD
         9hGg==
X-Forwarded-Encrypted: i=1; AJvYcCWl6mtzUTMaZvIlHVRDlmJZWur64ed1Sa6GpIZiFQD8WzD7d/nb2mnxm6PNrrpRDYYlGwSEG8EHSMWmOyWd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbe/yQPAS1BzDG2H3i4l76sjZevpuIDYIlRgO6gl6KeqcFASCd
	u5ucWMxDKJ+a3Ehh7jRgDvLwUITjjq+1k6/JYXGNqlKU+vZ8RcLqpxqurtlh677ayq0A2FCezOd
	B4QAdtfEBJejSyVmXyyFa8pqRkRj/gIMjBekbAdxb+pYYav2WgRRW9psOkPcEy3LuQrsW
X-Gm-Gg: ASbGnctk7P89xur28GToJIU0CvAFi0IWRF1T4yaoNTh1FOQRyQVRQ7ozcJSHEuB4kFl
	j7xsscFwDwygQN+IYQOv9SR8loIKxGgXRzX6D/z+d0VUAVH8wMV02c3TXb6x5tTV5WxYXcvoz4f
	SoW5Og+L2uSUbmbGblBDbdZBHMrvy14gO3Rnb4eUiR0KAKIScms4iWIi2bP3YS4B8jbu3MuOMvE
	OG5cf8TVeYXE9dbM2GG+FqXDnxRczzrLER+HwSdEIIXRUpg70hwUVuXp0NRaoClcmFfRQbNgLQ2
	biBoHE6MvuIAv0dOhaE9+GhhY9vsed3L
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-220a0893979mr18746142637.3.1751206090159;
        Sun, 29 Jun 2025 07:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8rwemeeKoXa3dY68CP5crYj0elFksFOZ4WGRjdgo7BPXpcPNprB8m352xNp9ATYbOhE0nUw==
X-Received: by 2002:a05:6a20:2453:b0:21f:53e4:1919 with SMTP id adf61e73a8af0-220a0893979mr18746079637.3.1751206089570;
        Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3adsm6718564b3a.106.2025.06.29.07.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:09 -0700 (PDT)
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
Subject: [PATCH v8 34/42] drm/msm: Split out map/unmap ops
Date: Sun, 29 Jun 2025 07:03:37 -0700
Message-ID: <20250629140537.30850-35-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX7kNo5paHLyw/
 D1mGFWzvG8QL9002rw0DNmgKBSBIbB9CO57tKz3RXBmcZ2SLxrQBDnlRDkk6rKhgjD19wb0KkQg
 kg9rT7PE8RP3oMAA9dhzsQNZ3woed9eYWJtdcrokaMGLRyFPrYzFNoSiY34wLzvvE6kzyShxAqC
 yMQMTxG6Sn0mhxrak26bigCd63So2ZKMswBE0u9cpIk3DsZ2ZTeDEe+pUHbqdcxKBIiyY/6WmRj
 +sGe5TxeE+ORvQI/1Pz7sUNSYA+5Nn2aU16er59J2tjXnuWldIzThSqUwmapumjBtAUu0BvaCM0
 e20ZAAWh2Eg48AlyyTXWg0PhZjKofsKDkgZCPH8OZIkSzNcz/w9k9+Wt/cIx5yYUEz9UtVdVSsw
 9NmA2RrimAIBKFYzQCE8Yz6lh7aOLg6rKQCmgFDa9ZrnaGeXihrjnA6EHbYXYJIEf/tSkn5m
X-Proofpoint-GUID: BWP-R7ETdrXmtPhNvsxycA_wrvMFHUAs
X-Proofpoint-ORIG-GUID: BWP-R7ETdrXmtPhNvsxycA_wrvMFHUAs
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=686148cb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119

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



Return-Path: <linux-arm-msm+bounces-60378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE923ACF6EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BCC0166772
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2986227E7DD;
	Thu,  5 Jun 2025 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpdhTPiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F19427A105
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148352; cv=none; b=nAPPvfMjCkBkX6XFZMxNd0p3k7Xl+rijjnQSIePq3zHhW0jdZ656j6/0MABKdK2eO3VN++kxXV+0bl5nU0xSZGnp3DpA4GdspYG23Ll9YhuZiHChVa/hoE8TP/dqIZWApch6IO3NVAhOrfj0itAM50BEE0N6EQYodQYNfrJK55o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148352; c=relaxed/simple;
	bh=x6l1U8SQbNXar2T+nKC44CZbNnCrpWZd9rRpAvG91aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFp8iAAzSLqKt981FB8JxTJgv866maaPF1MoWTM8t5hVWy1As5vzOHfRbQmv8LJ/D1U/hmiM9UEMRsrsx3+txl6bkDNXhMkBLjUjprCQyfWCmZLeML/tgw83QXTzbLfF/f/Pqr4B1WQBxrPSEMgDTzKsi2Mr+LTrDLzkYvQPQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpdhTPiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555AC5q6013969
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BHyE+ROYmr1
	BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=; b=jpdhTPiKagEF5j6KX7pPe0LyzeH
	OZTEVdqkA/8sYYJSnJXLxEkmfBiCgiLYEGmqjhlJ6/nYCHn0OZYObLKwfBJX1DpA
	vqmJDJhYS1cO2S24WA9NsAk7/cJzj5hj+pB4/2Uce+IldRnNRPJewIt8363Q0N7E
	OJSp1k7MfJrDoaw+etoLMlGkHSoSV3rmWJGunNggNEL++DL1l3gJ3WtAIrfXEiR/
	cz9JiCaafyZo2IYAeoQ8CTV6epyZ7Q0V0c/+RFPT+G0gcJ6q/jKn1U/zNe7mSRU/
	tw4AaIQI4NXPjPdTDmWiY2fwWiz/gpnXlgx44mNb4UOShSsdXn6l80RJ22Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be8617d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742951722b3so1111279b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148348; x=1749753148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHyE+ROYmr1BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=;
        b=ga848YfwCHKdflMnrhZgksG7XaJI0fihWK4WWC8914e9ZEthqxuh0e8cFlrT7J2Xrk
         NmKf9KCp+JNepsbl/sEdZuvlwWiwtFuG5hsRxhHpelMLJohssOzZbIN1su2flqWfsXRe
         RBpLPIzf1LzdjKp31AsMz6t1a1x9BugL5XOTNW6r6v70pPqOk+H2dFSPUr/eQ6C8CRNz
         71RvYgOuw/Hf1400p/jPwReta7merdf65eSiWdASNpH/n0z2rLN0AonrcZcBG2mRvnmu
         zGuemlsFH6zUAttaZ/br4FlRezIY9nBNtNdrl0jLQNaB6pA8XvtMQYvvqjd05YyRYK1R
         DR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3idmLSUpfwh1fEOlv5rFElWg2vjORz1jnBEW33EUa+pcGDfPvKoPKgQm5/xjSL2CWV+H0WDAV5VIY95tY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MPwvPBzRfcTDi6N+l6LPKTMyBFChBToaSJ133ZWZuFP+Q3Ir
	h8x+i5ZAIlXKydayVB+0Uns7xfJmHnu6qY5J2SxI5ZklRbT6KeDgzwRL/Nwr4pK3c4sl1o+oMDa
	X1hVlZQthWNiPJfkxKL0bKqMfgjQqX9ywEcfCMBfy+5vO2KEEuzaqLOPqefkr3aTtCqtSKiQ/Rd
	C7
X-Gm-Gg: ASbGncuNrYteDaNpeD3VjzENaY/itWq7CXi0CXZ9IsX6IleqlgfDYI1OyKI4B015vIM
	uZfMgpAI4SuKsvUXMfPUhvhoQ8K0wRhR4EPxM6Z8ORtZBLO4UKkue/bSIqOXsL7mXTEIHzEXNXL
	ale53183XsdC5HS1L9SvB3mF0YK6YCFtrCP3/ESvc9zvtiWwUvhS3yGkAoqTGxad1rsz4Kx9gZ9
	dSHMyvfY+Z3GRoGld5W4DSi7tFZt9SFKy2xdK9FgWIUf4m35UcNQbat8pmQkeC6gLk70ha/qo0B
	troyMHJ2ogLv9t4culuKF8OT/hPmycm2
X-Received: by 2002:a05:6a20:3d8a:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-21ee2637d11mr356808637.32.1749148348141;
        Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVrfLgNyWqLp9DNSwslns/gOD9utCo3fzpYrtaVTz2iGKhZuHEW0/CiegXluYIPkvKb67fXw==
X-Received: by 2002:a05:6a20:3d8a:b0:1f3:41d5:65f6 with SMTP id adf61e73a8af0-21ee2637d11mr356783637.32.1749148347737;
        Thu, 05 Jun 2025 11:32:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcfa0csm13511882b3a.131.2025.06.05.11.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:27 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 06/40] drm/msm: Collapse vma allocation and initialization
Date: Thu,  5 Jun 2025 11:28:51 -0700
Message-ID: <20250605183111.163594-7-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841e2bd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Fs5xBETKxiRrdmql5B8A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: N3HaW6oCNu-oywNygStb1TqjXL99KCxx
X-Proofpoint-ORIG-GUID: N3HaW6oCNu-oywNygStb1TqjXL99KCxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0gkIP2NzX/Ry
 yGzSjfINo5fwDUfxjobyd+bQMfaH1YS0UXCDNfq+aW8ewqcYsyc+v+pkgXbkwEP9w19JBlLPNKE
 zoKiYwTx2szJho8XxlTzryzxuZ9TdXPSdYA0rO3P8IQZmprBLUnOZ5KiFd5SX7qLKP9OXOeSm+F
 mIn10JO7LSU/4wwlaN0SlxAkKkXQboxk5g/6ohtn+k/06RenpIl++3k3j8fHAFiDxXGV+tNi59J
 o0s2YB8yjXBD0aWM2YbdB2G+zTTpNd8Yih3Zj2myuaPMGlC93vYMtVX7tZlrvpi2E3ZJDG/mAM7
 8F6GuCEMegE2GlsmfOP9Eq7oPnjnbynaSw8T5ZyYZeBVuZVLZhfT2hKaEvtU6OeWMDnWVqe5lRX
 knUWnztrOn1LuM6eYwg/pO2oAVoVdBH/9tahFA5UwYugoLtdcux+QyaHtK+aOgbWMYbdbNnM
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0



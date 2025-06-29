Return-Path: <linux-arm-msm+bounces-62957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E116DAECD92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 442861644F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34EE229B27;
	Sun, 29 Jun 2025 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3WXG8rQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4023F40F
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206084; cv=none; b=P5KZFVH/mO6u9Z/XfTLyuc8HoFisdeZbreK3hGwdzYdPHRQkjn/tZPjFLYwv2vJHps3xV4SYPMoa1+aiyDOI/ylETXJKLB/ZAjKEfWuQg26xGujg2ATBQ67dj0P8ovpjNTPsAX/tp+K3EKY2qFUNXiyrHBFw+MIyLgxl+Uz0SUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206084; c=relaxed/simple;
	bh=B/MJJNslJOsQHJswCv8VSXBdVcsWoC/DDELjr3YL7Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5RkFaXPxHgM9xfrB+Da5TXKM7loxeq4dvVssdiTgmQGc+TRtUBrJlHaRvfUerwZWxCOkWDLmc8caXJTgewbIBhvPGOYyjMVxztA/MrZqPc+iX9ANikRTa3yqZ1loekFDuXW3OXWIjufALlBi1YQVGSsG+g3vPI9jcykFM5q+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3WXG8rQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TBw9Ds003844
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
	eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=e3WXG8rQ6vHuJOqD6VGdpzNnBbX
	PUBJy/yVEcAa5UG18CIGIWSs1yGDkldBONwQjE1deVxapBFN1T6q/SlheZqziWPs
	5Tx32azGmi13Qd8CtDjfEujKkelZvouXKJSj7YIDhgohch0uX2KjOWbhD9h6CEX1
	lZB2IwbgkoJ65QtLXd4FwYjt/evKDDpikKmJRxEEq7VGRNJFc+ZJe0oJX0UYaMT+
	76rZiPYJ4dfAwmD9b4yAqyAPMmRVrsRej2AeD28ApyXSedTG2L6CoRmlajDSDeTU
	J+xhkFB1+6JwZe2pSJ8C/a2PniwfETZWjYvM7iivaZevT2AKzs9SdaDOJuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2ey3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so3263007a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206080; x=1751810880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
        b=YAa9rApGyEEuS8Q5VrIl+ajSrBi9HxYqsKunMW+RUZL655zqhgmoPK0p/OdNA/GEnp
         mb6HzMI0AEXXjEdeEpYHuKvZ569CxMdTl2gDNPWeRTfnxZ1uB6ZE+F4Psm6eS6Fay3x3
         685WFOA6+EJssuzDefXhjcRypuF/fJMUkyv+2hm9MXyBhlr3D9B5ZoVw7iPL20NCwdbe
         4ETNmbl7GDtuKjdrxaRO6hQfQxXQuisZAFTg/EgM11QE/h8f718xUWFBVi84hDPSILIK
         BaIoYx+++m7g1V9FL8teq6nTdrk2EndNcUI2al5ueqi4MoXIoHGfkXRYR95e0AkJ+Hy7
         /y8g==
X-Forwarded-Encrypted: i=1; AJvYcCViSNJrVXwUFU1L0W+Wvwqe+Wcd6Zl1sjZ4PDxFqWafc7chLWyg+1dzPC2k0lkuP4wW/ujxWyFGIXMScwyj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+lWVdOhZFSCXAC53E9B9l65GjZB6v0gjy9fnzXl4GOSS5WqGA
	TajNlVsbuPUWGwVQzZgrwFW5/F847Em271Skkt27P+8I+cBPXw3AZLCNog0ugmroswsOopXTPl3
	GyDAJwMyL32z7P38croG3XfwNxBHPNrqKf6J9hDlaFSHQEJIpaPBcCEo+ey/HkQpXcLsG
X-Gm-Gg: ASbGncvxkWWwoFVlTDy90zZB4I+RJKK4FqhFHbLvzZRL+RTXu8kW7eKyGYxPShZ5Euj
	exARduihiabZu5+k3LiJzLxw2vk0r0DaBBEXSyq8Q5PNvpMwV7Qsl17Zlh8wBisqyEBD9pH6QMm
	LBqll1NoQtPtfgC02aN7bIuYfLI8+vmZbG2UIYE6s1u9mn4tAJgVG2fTnhLD7blxGBiVwNCnDnp
	jRp+zB+V0kcujfVFY51XgE7GsiBcXqPvRqy47NcR3L6hZJ1I1dHMHctQkfv7fjUb1olRfFDPWNX
	GYkb7NC08al3rdOGhyOQGCNhRPwD+Pq2
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-318c8ed854fmr13825620a91.13.1751206080079;
        Sun, 29 Jun 2025 07:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2yCfAWZdhnM43W+FQAK7Ei13wp2HdXGViln7XgoM6zEbL0poVm6fbDuQVtD+plTe3hIuSDw==
X-Received: by 2002:a17:90b:1844:b0:311:d258:3473 with SMTP id 98e67ed59e1d1-318c8ed854fmr13825561a91.13.1751206079616;
        Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5382f02sm11175097a91.1.2025.06.29.07.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 07:03:30 -0700
Message-ID: <20250629140537.30850-28-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: DhCBJAZ_R0SBabhuf7PgA9xFvYAnwBmR
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=686148c1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DhCBJAZ_R0SBabhuf7PgA9xFvYAnwBmR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX3PP9fQdQWiJw
 9+tyhhT+KheN1IyC1EmfBF7bQDoapBeHBBFmGEJMcdv/qXD4ZwpFpzNz2O/tUmUlgxLIDK1XGuR
 uS9dalJWWbAG3dAUwgAT9WkAD6Ms1S1GYgXUfzReCFs18VIHv1ncEJyLqisXKaLctu642MVYDJK
 Cgkf15i/HEUFeL+KhuzYMOEj0RlnbqIQT2Jpc3ewVNRZWp7vAOSmk3gQ4/ucwyC9OMF//ax/OEU
 KjZJeZRHLLiFDF6yULwBw8JQIwBfjBnUgm3tNxlUnswqDxoy2nJ5ohm0wsiIaXCKHUJYcniZYFg
 QlRS4diFLs21252EwRO0CIPg56dveKyFLPvOJM9oP1vCPZqwDo9++kXbbBj4kFsROKotGIfN2EE
 Q5JIjso9lyD9A1qjgrExWoZv0PhmN16dTYgqItBGGVrwmdNFtSkT5XPTgRz6X7EO6/k8yg3Y
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

In this case, we need to iterate the VMAs looking for ones with
MSM_VMA_DUMP flag.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.c | 96 ++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 0a9d5ecbef7b..ccd9ebfc5c7c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -241,9 +241,7 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		if (!state_bo->data)
 			goto out;
 
-		msm_gem_lock(obj);
 		ptr = msm_gem_get_vaddr_active(obj);
-		msm_gem_unlock(obj);
 		if (IS_ERR(ptr)) {
 			kvfree(state_bo->data);
 			state_bo->data = NULL;
@@ -251,12 +249,75 @@ static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
 		}
 
 		memcpy(state_bo->data, ptr + offset, size);
-		msm_gem_put_vaddr(obj);
+		msm_gem_put_vaddr_locked(obj);
 	}
 out:
 	state->nr_bos++;
 }
 
+static void crashstate_get_bos(struct msm_gpu_state *state, struct msm_gem_submit *submit)
+{
+	extern bool rd_full;
+
+	if (!submit)
+		return;
+
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_exec exec;
+		struct drm_gpuva *vma;
+		unsigned cnt = 0;
+
+		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+		drm_exec_until_all_locked(&exec) {
+			cnt = 0;
+
+			drm_exec_lock_obj(&exec, drm_gpuvm_resv_obj(submit->vm));
+			drm_exec_retry_on_contention(&exec);
+
+			drm_gpuvm_for_each_va (vma, submit->vm) {
+				if (!vma->gem.obj)
+					continue;
+
+				cnt++;
+				drm_exec_lock_obj(&exec, vma->gem.obj);
+				drm_exec_retry_on_contention(&exec);
+			}
+
+		}
+
+		drm_gpuvm_for_each_va (vma, submit->vm)
+			cnt++;
+
+		state->bos = kcalloc(cnt, sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
+
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			msm_gpu_crashstate_get_bo(state, vma->gem.obj, vma->va.addr,
+						  dump, vma->gem.offset, vma->va.range);
+		}
+
+		drm_exec_fini(&exec);
+	} else {
+		state->bos = kcalloc(submit->nr_bos,
+			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
+
+		for (int i = 0; state->bos && i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			msm_gem_lock(obj);
+			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
+						  dump, 0, obj->size);
+			msm_gem_unlock(obj);
+		}
+	}
+}
+
 static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 		struct msm_gem_submit *submit, struct msm_gpu_fault_info *fault_info,
 		char *comm, char *cmd)
@@ -281,30 +342,17 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	if (fault_info)
 		state->fault_info = *fault_info;
 
-	if (submit) {
-		extern bool rd_full;
-		int i;
-
-		if (state->fault_info.ttbr0) {
-			struct msm_gpu_fault_info *info = &state->fault_info;
-			struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
+	if (submit && state->fault_info.ttbr0) {
+		struct msm_gpu_fault_info *info = &state->fault_info;
+		struct msm_mmu *mmu = to_msm_vm(submit->vm)->mmu;
 
-			msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
-						   &info->asid);
-			msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
-		}
-
-		state->bos = kcalloc(submit->nr_bos,
-			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
-
-		for (i = 0; state->bos && i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
-			msm_gpu_crashstate_get_bo(state, obj, submit->bos[i].iova,
-						  dump, 0, obj->size);
-		}
+		msm_iommu_pagetable_params(mmu, &info->pgtbl_ttbr0,
+					   &info->asid);
+		msm_iommu_pagetable_walk(mmu, info->iova, info->ptes);
 	}
 
+	crashstate_get_bos(state, submit);
+
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-- 
2.50.0



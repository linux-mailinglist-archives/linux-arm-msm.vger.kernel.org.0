Return-Path: <linux-arm-msm+bounces-63014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CDAED0D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACABF173217
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453B325B309;
	Sun, 29 Jun 2025 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NLAWhJFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCF2241131
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228220; cv=none; b=OccKPiaP5MLN/XmRlWenDm+BFx1CIqAkDYmJtOZ2Cn9ooj9mP81pmWqCG3CT/Nx+FBYCk2dcRif1xkpmKg+qv+m3RlfVDr9lYFa8jim27e3P80y0COvrqoTre/EBuW+8OstN7kKDYuPEZl3Gc4RZNpPSWsNb0dcAU/ODQqb35no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228220; c=relaxed/simple;
	bh=B/MJJNslJOsQHJswCv8VSXBdVcsWoC/DDELjr3YL7Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EH0Zf1wX1bac1NFyeoQDYw0QhsqNr8oQtVD9ZdhLu/jOGiygzji29pZ/7bFkoPElDNoluPnXdM6a6e1c5+DfpxF0WvsZh0L/phOxVrmZRp6fU8XYBCb3WyaHFGCeKS2QuOaPHDA37b453+A6WDsXX4w6dDUksDPZX9rSSJo474o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NLAWhJFP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJ0O1h028632
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wKngwCavAFH
	eJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=; b=NLAWhJFPbq39BjypQRne8ydDAaM
	OolAh9mjryiU5IR4UO0JxAmwV0D6/5e0bkjZyAn4KbFUEBpTylJaCPQfzuVtn5pi
	oG82sdajtE6GsEAoWing/jw5mB0wt7984SDNjudPS1d0IlV2wMF6wq4xKQyt58DN
	6h71dEw34Er6vX41qI+u9uno4j9MvDUmTM+xI6ckWCO8MKbzlvEY48S4rR1l2PbP
	MVzhAhWYp/oGyXsWq1aVItSEctqXm/z5Xr5fThOb80h6CzH7ONP2hZe74tuue6xA
	TJjzAOHlDH1/UZn+ltJdl0GEedUwV749oaKtTamMawopr84fqDV/xlvYDLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2tk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso44131865ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228217; x=1751833017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKngwCavAFHeJEVVeeWKWIsmvkttEuyPvRiuEbDcy3U=;
        b=aPmmKf5dGXLs+MMAuExCJaW/9swLK2zqazfBWVz3mygsYCzQ3BtwVk8XG9CyeD3l8j
         Aexr5LNjgJzkzdojjHHP0Fv4zPnOs+otCSQtXZXfYYeEfvupApLmaPRUkdJrtliT5+aI
         KsRDMWpt6vCRHSLqBL9qW2Ca/YH2gIpEo9V+HIW4B1EsskA7SZssAMNKFB8SrSwZfRoZ
         5v1o17w0jvBQ+UqHamN90tf+rdDmyglj9zhI2GTEkyhQUVUA9Z5qOqlOiJNxZeVUBJQU
         KC62lJtT0cE/anjT4ptbrkQDp/8C2CxFiqxrlhZm00laYo+Vx+4IYIbwnTPUVq9huRPy
         hQGg==
X-Gm-Message-State: AOJu0YwvwuxBrApHAOpleHDHvurej2DJZHCL6Qo2JgO6djh5CJ0HLY+1
	2+ptpwwjunG/yM/jfdGW1/mG/jN49shckgTYy9ZLWequd0AaJYHnvJ+nQmxuXlwHuCqqq1NsIgZ
	sRYvevAvkxRS9CeQIFZ3a9Ir+2HwlTvZuLmPRxcrw1zO9kHKZI/7GaXu6s2fmTAiwy2ij
X-Gm-Gg: ASbGncvnWFRCqKKbuAR/9vMZ6y9WfXhEuGab9L3BbeiZ8gjC+zRTex5v+ziLOPqbMji
	ii8hanGBoIM0K8BoqC9rojiV4x1n/gyD09nxotCt0vS9XayoMUTIerBwJhz9kRqA0qCp5sSmX9b
	+NEJfN+AUFt7u5aFQCT6R3q3+Wxxfg18bqNbjLjOQkNSxh8QNdsWcmHSI25eLEFakTJB0meAcT3
	5akeQULiKJkPTSr/87qSLuPL01K7O67IH2BkI0gQwE9F2PvTnoTr6QhpyywDnGdmt9epF/IkwT1
	FunMzQOW7HVjOtodmJ9IenV6/a03fI55Qw==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23ac40da316mr169235155ad.12.1751228216392;
        Sun, 29 Jun 2025 13:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaWGPydQV216i89tCogIBG6+vmTYkFs0wd5R8OzSvv9tHVI2ml64sOXsCCbBPTAcj30aV1kw==
X-Received: by 2002:a17:902:e88e:b0:234:8a16:d62b with SMTP id d9443c01a7336-23ac40da316mr169234945ad.12.1751228215987;
        Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b833bsm67473705ad.180.2025.06.29.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 27/42] drm/msm: Crashdump support for sparse
Date: Sun, 29 Jun 2025 13:13:10 -0700
Message-ID: <20250629201530.25775-28-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619f39 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MUnOxqT-vkRKCsmERf0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX4QTgMW4xs/H0
 MgLyLBTGrhjygv7LSDYCVUpO/DqcNgQefKpORvsE8Wo8laO3QawlsgEtc/ECr9Ss4qt64vDlGB5
 1tpwM8Iih4ReyF/bzTNp7aq5l64/39tOfeZZUxcggmSUsOJycxrjlYLH+uLIBm1Gd1xMWn0e4S/
 GF2GWZIUF8MFJ/g1wn94hacOM75X3OQFRlEjxKyl0Ql74ohgn4lbK8ujxPHGTmtrKjsME9Iy5t+
 wLYQg5Ed8VXQKqTVvfTqacIN76cyafnPi+9aykvt3+ONFJevnaX1a/EGua7/lSAtoy78umF5ndl
 y7UkWItrluDu3OEeNTRHqTKS+Z86VJ4k3PX7Zlrz+0nkrZAf08Nq33T0u2KTSfOgXQmyLfF7Z5C
 aSl+y49l+xbXpIpdZ9MFe49CnJiDhnFlLzJbCWuyzKThzwUkJu0rqien7DOGYuuh6AVs5UY2
X-Proofpoint-ORIG-GUID: wFVRQDNwg5pY48cV1j7fLIRE_mHfnk7Q
X-Proofpoint-GUID: wFVRQDNwg5pY48cV1j7fLIRE_mHfnk7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

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



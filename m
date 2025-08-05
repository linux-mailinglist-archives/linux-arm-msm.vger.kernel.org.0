Return-Path: <linux-arm-msm+bounces-67800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07920B1B8B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 18:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273B3180476
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67410292B38;
	Tue,  5 Aug 2025 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRIvf3C3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676A291C3E
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412280; cv=none; b=FekVXa9BWdDmpuo1crnzsKMB9VJpb9fhH1L3IKThGBj2IOrlfo/cmsi7bfNIjYoXEFSfr1adC+lGFIBEtk7gLjbpvNjje5PxukkeJQCZL4Ev4e6DMqNOkmbLozEzvqyLl0PznO9qvm+ca3xs3pWOU8ESc6mQvMUZPJdusvZkPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412280; c=relaxed/simple;
	bh=UZnh+dF199ZuP9pVw6ybGbzBNt4HIW922tlSPmWTD/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eCHn7MxlsaWQ0HnzKb/0OthWPyz9cZ9qVhNIlGOt4na2/F2Jp5tvwRAPhnWqoeozdqlAzpaNh8Jzhd5Pt3wo7czTJ0kBuzg7WE0N7oL+sBGbRtC31FJx5pDfcghpqLYJPUNx306LLleONmmN+CWyc+pNL+Uoj6pjXz3XxUMCzVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRIvf3C3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575A3ltN007598
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 16:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xFZ6cFO6wa52HtJqwYOKHtqGz7UHtTevLTj
	q7d3NNvg=; b=SRIvf3C3XrZjewO4zKbPO7X3F9IOLoIBzYRNbchpfa32QM2YoPm
	QDimi+wg7WVw8qrS879CcnYVAcm8jHG6N6dWEdwt99xiHvzAVB+iORPxpDVOfFFo
	kD09DUHvoJliAYG9UpyP2DO88sE8JyiEz+Y9IfrwFmp1ZBfFeP05ouGz2E3wjVl+
	AftroD2NAc1/SFIw1tMTYLVqQxWVkzO+EBjXRW49LtsY2CYwZeuKHerhJ4dTojZr
	tprPQiWbeWQ2mjabwiq/RIb0h2V8LSuokn/zaY9ogqq8WrNW/KqdQMbx20Bg8waT
	7cxFz2i7j3hJUfHIiLwcsE73JGBfMRUgUaQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a91v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 16:44:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c37558eccso4592240a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 09:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412275; x=1755017075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFZ6cFO6wa52HtJqwYOKHtqGz7UHtTevLTjq7d3NNvg=;
        b=ol1Fz1hprbY1m9MFtZD0fiUDB2fdDGIlL21uS1gvMj2pRDHnLPvg3/IiFLx5DaIrZ/
         2m8TlMrwdN00c9tveJjHHgOJEFCNB7J5055du+cFrRZlbMa/Ua0Ddrb4OwQDVhMdl1rM
         wyGPOeeJqOINW6H3wgMIH1iTaNMP0MGet0YMAXvHGGfMryifs20g3aqeOR+rr+cLcqEV
         dWVmJReSHkVm+4w6D4h5Sj4rFXXsdDe8bbMKXJWA5K8Zp0mOukWkx4tZ7gtvsQSn+PQn
         9u0ehn6t3G/W+xzu66IlJ4mM800idgzdiSucMyXRU0z4vM8nw3hMFTq9WOlPpTV5IuKf
         /Fdg==
X-Gm-Message-State: AOJu0YxL/Lc+1J8PEHo4m4ormLj5NmKaGZgX5E9AGhvW9hawfkFVFVer
	Ek1hxItbfPsg5zzFucDhYtLBpdVytoc1LXta1qnFCzIRVnu7rNtecYZvt9/JA26bAo31G/iLF5F
	l3EfHPYsr9+q5nEgxIbzCIkWY1PT+yjd2QkFM5RyFVETD0IuWemryTwWvkmbMzbon6jMi
X-Gm-Gg: ASbGnctiBC4zOq3buHs8GXZcGRIZ5JhV3sHLFX5U6xjUCh1CoKNR70Lc6oxzoH//cuX
	4IKlkovQ2/Ac0tUJKmAiL3O4sBMMLMOOyBbiyOZLp5zXHcEWEX58waBsbvZZQYdIl6VioppUXHT
	/GefZmKazidNtepYZdz46F8Ce6nQWxRUR53qYUEFiUwxvK8MKb2fueMAQzNLlS3E4qqPI2njXfs
	weuZIGOuuwM0wnWGEu4Om77JP0NR1RN4voBB5ONjTIzk4fr21Zoap8mFOQRi2qLh1Y5da3girR3
	YTkRQMhoJAQNVpBhSw753iNUWqmdKUDVe7KqJMDEBSwsvy1BRWQ=
X-Received: by 2002:a05:6a20:914b:b0:240:21e1:cbbd with SMTP id adf61e73a8af0-24021e1cda9mr4886605637.26.1754412275141;
        Tue, 05 Aug 2025 09:44:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm/6uN6G/KVi2o9cN+/U0oUl1Y1E1Sdo+Y+NbmDyrpK8rXomnmGpne1qkC2tg1XzKix+vaGQ==
X-Received: by 2002:a05:6a20:914b:b0:240:21e1:cbbd with SMTP id adf61e73a8af0-24021e1cda9mr4886558637.26.1754412274703;
        Tue, 05 Aug 2025 09:44:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7841besm11489904a12.3.2025.08.05.09.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:44:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm: Handle in-place remaps
Date: Tue,  5 Aug 2025 09:44:31 -0700
Message-ID: <20250805164431.24350-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=689234f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=54pnWYnEFG7XCx_V-2kA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: WBHAFqTlwI5O9PSMYB6v8RRKsQKK7B1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfXw+NtNFqnwUNR
 Vwx/JQHtl4QiFZZvFv0/RDNgMEhCwwD4WP53c4kVK5svaWD6mwWSFi/h9j1fFMXeIXyjohAkmPm
 zlM+emWHVPwzzXiwh1wRPEgGyM51wMoHE0bIYyabQbe4bcnkiDnTnTZg8niGsJa/yeAMvYnLXJ5
 CSkot0fdGphn3E5cjRC/AdCooiUCT5JN0vEHBIupd7LbY7i9PphEvv0UsBeg8TE60c67VpiCJfc
 DKPVbAdI500VlxUB+gkaeEkni81cvGTzN08+aCls+gbXMpAMw6t5Kb8R262aJuXpOo1HaKw4tc8
 DpQXHiXolUG4Ry7t8J5hcMzMI3Y8FVxX/4s+QM8gF6ZEXBQA5EnB9rGbcJsBoOhtvOFbWTunzUo
 7zviA762vXSqU35QymylKLEd+9GZ2CfuuyWToj1bNeN9eqIL4e9rGZFQYpmLWk7YP8OGivhb
X-Proofpoint-GUID: WBHAFqTlwI5O9PSMYB6v8RRKsQKK7B1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050116

Detect and handle the special case of a MAP op simply updating the vma
flags of an existing vma, and skip the pgtable updates.  This allows
turnip to set the MSM_VMA_DUMP flag on an existing mapping without
requiring additional synchronization against commands running on the
GPU.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 41 ++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index d1f5bb2e0a16..00d0f3b7ba32 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -451,6 +451,8 @@ msm_gem_vm_bo_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 struct op_arg {
 	unsigned flags;
 	struct msm_vm_bind_job *job;
+	const struct msm_vm_bind_op *op;
+	bool kept;
 };
 
 static void
@@ -472,14 +474,18 @@ vma_from_op(struct op_arg *arg, struct drm_gpuva_op_map *op)
 }
 
 static int
-msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gem_object *obj = op->map.gem.obj;
 	struct drm_gpuva *vma;
 	struct sg_table *sgt;
 	unsigned prot;
 
+	if (arg->kept)
+		return 0;
+
 	vma = vma_from_op(arg, &op->map);
 	if (WARN_ON(IS_ERR(vma)))
 		return PTR_ERR(vma);
@@ -599,15 +605,41 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 }
 
 static int
-msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuva *vma = op->unmap.va;
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 
 	vm_dbg("%p:%p:%p: %016llx %016llx", vma->vm, vma, vma->gem.obj,
 	       vma->va.addr, vma->va.range);
 
+	/*
+	 * Detect in-place remap.  Turnip does this to change the vma flags,
+	 * in particular MSM_VMA_DUMP.  In this case we want to avoid actually
+	 * touching the page tables, as that would require synchronization
+	 * against SUBMIT jobs running on the GPU.
+	 */
+	if (op->unmap.keep &&
+	    (arg->op->op == MSM_VM_BIND_OP_MAP) &&
+	    (vma->gem.obj == arg->op->obj) &&
+	    (vma->gem.offset == arg->op->obj_offset) &&
+	    (vma->va.addr == arg->op->iova) &&
+	    (vma->va.range == arg->op->range)) {
+		/* We are only expecting a single in-place unmap+map cb pair: */
+		WARN_ON(arg->kept);
+
+		/* Leave the existing VMA in place, but signal that to the map cb: */
+		arg->kept = true;
+
+		/* Only flags are changing, so update that in-place: */
+		unsigned orig_flags = vma->flags & (DRM_GPUVA_USERBITS - 1);
+		vma->flags = orig_flags | arg->flags;
+
+		return 0;
+	}
+
 	if (!msm_vma->mapped)
 		goto out_close;
 
@@ -1268,6 +1300,7 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
 		const struct msm_vm_bind_op *op = &job->ops[i];
 		struct op_arg arg = {
 			.job = job,
+			.op = op,
 		};
 
 		switch (op->op) {
-- 
2.50.1



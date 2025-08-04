Return-Path: <linux-arm-msm+bounces-67718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAFB1AA7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 23:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31D7F189CD86
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 21:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CBE23E358;
	Mon,  4 Aug 2025 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+YzSNwr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1223BF96
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343806; cv=none; b=FGMSrqtXIrEuanHKUiPkEDgrcFgCXs7z+SlnRFRw6SAy8CPvNbh+X0ws1O+dPSaGosOLr3xAF5aF//m9xXrxSAPu6rSWoETMbRVIPAy99BsD87bEoh4mHp4ws/EIubL7zt80kHl+AWyOYcr/KQv10UVFxkm09NQ/GsfT8XFPAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343806; c=relaxed/simple;
	bh=MHO/qp+UAkFUDV1KW+FRY1st72hVPxPQhofJO3khj6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmU83zxHcLqED6ngmExoVOm7dzJCInpY70XRgGZH6+7zy0wzLTcpA7DyQght1iLH3erldqWFFm3PhMRnYsxS0cA/OjQ16LP6SQWqVaJUGuW7g/6fFFJtowRNW4URmBTHq6PqiN3/UMMG6RTGQlreh/Y9mVf9El6Rf/tL83SEkMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+YzSNwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574Fc0eG031047
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 21:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nwBcV4Oemt5
	w740AAje6mIColtrmwRWXKq31FSAZZI4=; b=J+YzSNwrVx5QkBv3++Hw3EluqR1
	qWxOSWwL9oqpkBTSOLSuhyMAVAiSqYlze1z29tUONI+9grkO9n9vVIy5wHLNaPBL
	cFx7xN3QSwN4nJDjBppse3DrOLfn0S8lKBpceSQwJI/9V0n3dd1PG56TgfT5KDe4
	7j1uHhvQB2VcvcYeBzo8KrlbxFvdJDUqcObF1s2WHWiOOUkDTvkcvTou4uHWx39R
	uuMpxbt4YId8LIROoJSwDiaEQDxrFnA0bKserOJ2WggiK3MHIau8jX2OYumKmPDN
	gOV8f30JLwQYwAov1Rl9rAYQZgkSDFErp1j4acnbHX56KAvOuzDdgg3jxEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek6b3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 21:43:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23fd831def4so37075965ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 14:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754343803; x=1754948603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwBcV4Oemt5w740AAje6mIColtrmwRWXKq31FSAZZI4=;
        b=KXx+eDtuqEq/rjRjJI64qbrpshapz1/rRHFLXG10elyVv2CPwWCZHig7diXHnEjzkN
         gKcc0mlr7bREoSLxR33kpu1CdUQZSrhCakH9yVmFR/LThGFFXXSgXsEUMzHBsCPYGESl
         bFo8AmEoVgeemvZFJ5hDZuiqFbKli9Ylc4/MRGL7BhScZ+0eizr3Km4jPR3XJ7LNf/Qb
         +Xg1GNWKtwtGmLAJDRfGMwbniWW0D8Z46cfL/LDS1u8HBB0KFheVTaBa+RPXoFP5hblU
         dA7OTawcWvDYWCgkFPMm0pZl+QVr/yxIhqKl0LpuUoySghJDLGuqlczHsV3h9r5xJ2xc
         lMAA==
X-Forwarded-Encrypted: i=1; AJvYcCWB4ZeptYAIt3s6QF1nGPFuEVe+kXop64DPTS3zvBo3/FJNuJbgoYdDLMFxzvELX59JkwpZO9SHtmU62K3K@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+dwZ1yVztDQKaD1LcNqjLglMhk7CgIA38PqzhuHhgJrkycLD
	gEDkeOuFPGL1GnbiMM2PoB4G420Yd6SBBi5wyha7LUPjUMUBrl3vluWNDyTEWkcXQnQGxIeUJUw
	1O/ylQdBOyByIBobZuAm7hlio2qRnndaKs+PjTlSmLTVyfUJZonGReOZVlu+bOAsE/jOvodFXEE
	hp
X-Gm-Gg: ASbGnctEZSLpLwE8WiFvy28ybNUpsSSSEjxFnHNdQjOZ9fy9mnM008iLMAVD1lEf038
	0YruFA5BpFZxaOjzHbXQznXV8BpAO9oQ/CJTglFYcYjbX5LIiBl2R/wRB4GDVKJ4DmCjTbg3ZyV
	nwhz3C8FtyuHk/adpRm/dxY43z81fIHI6mT1fXRjyp+bnxZdqLAn4j5i0O7IoIcp8FUuEhmQ/PF
	A5GDgStITYftH8ws5xdgsns4HhNPEgbmbNZowyS7vZux5bVAG9M6EqAiBSNoYtPtcTZnO2xaOrb
	OBUgF297L2NLUYNBNkbtuud1ua4wgG6aprj/9HfL6oikmP0lRgc=
X-Received: by 2002:a17:902:e0d2:b0:240:49e8:1d3c with SMTP id d9443c01a7336-24246fef44cmr85653355ad.35.1754343802680;
        Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6a9/8RPndKLMzz5ytDiVTCVnElsJWsamSeHzO2/TAvn6vk7dklmlUiRe8K/yjPhIcb3dkYg==
X-Received: by 2002:a17:902:e0d2:b0:240:49e8:1d3c with SMTP id d9443c01a7336-24246fef44cmr85653175ad.35.1754343802269;
        Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef5fbdsm116628865ad.27.2025.08.04.14.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND 2/2] drm/msm: Handle in-place remaps
Date: Mon,  4 Aug 2025 14:43:16 -0700
Message-ID: <20250804214317.658704-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=6891297c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMiBTYWx0ZWRfX/0bqzcI/+yn6
 xAw1Q3f5rc1bEVq6Ow1Yc4msXJcFaF8n7LMO1s+Rzwz+lCAayjfIVWPo1+bFb7iGKGI8YmdDkb+
 2CBicTwVhsrOmVx1N2MXqG20KwRpKEN1rzj6VcYlWgFN4791P8QYUm2D66fL4Hi5/6JDo6GtamD
 izszjy+SFTAbZIPJ6wMATbhpAMf/AOozPrKFBiCoBbHEveclIYPBtinOoKBbL73pll5g/DvNGZg
 J6v/lS5rv+uBi0q2WCNi4geUSJZ4DLEB64IjPcnG3e92Wpm7+m4kwZWNExQPxvvwB89sntmKCDy
 BkbZShzHiYE9xk+JIBSzz+EG8FhCSgj6FLOqHCFfpGn0sq9c9hg4ui5V/auEFc4ByTEaVqfT//g
 IZW35OrpcGfaIVwvnL1fhHswMkMkoz/R+rzwe9uCPTemt3oVBK/oiaGKzKZjqK6qZtXPumb8
X-Proofpoint-ORIG-GUID: XUZhcixGIV9upmL7MlqoNa-SiHgCf10J
X-Proofpoint-GUID: XUZhcixGIV9upmL7MlqoNa-SiHgCf10J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040132

Handle the special case of a MAP op simply updating the va flags by
detecting the special case, and skip pgtable updates.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc54c693b28d..d4b1cfb3aa03 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -519,9 +519,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 }
 
 static int
-msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuvm *vm = job->vm;
 	struct drm_gpuva *orig_vma = op->remap.unmap->va;
 	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
@@ -529,6 +530,18 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
 
+	/* Special case for in-place updates: */
+	if (op->remap.unmap->keep && arg->flags &&
+	    op->remap.next && !op->remap.prev &&
+	    (orig_vma->gem.obj == op->remap.next->gem.obj) &&
+	    (orig_vma->gem.offset == op->remap.next->gem.offset) &&
+	    (orig_vma->va.addr == op->remap.next->va.addr) &&
+	    (orig_vma->va.range == op->remap.next->va.range)) {
+		/* Only flags are changing, so update that in-place: */
+		unsigned orig_flags = orig_vma->flags & (DRM_GPUVA_USERBITS - 1);
+		orig_vma->flags |= orig_flags | arg->flags;
+	}
+
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
 
-- 
2.50.1



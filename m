Return-Path: <linux-arm-msm+bounces-66369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A9EB0FC8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2F381C8738E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43BB270572;
	Wed, 23 Jul 2025 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWICn2Ap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330B427055F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753308784; cv=none; b=qSYO8LoABTTlVrd0EuLTM598Nu1j0MfQULSwFwFwDJ89vjpWHL2KINz/OrFNwFfN2f1oPEBytepEIzmiQ1+t7mY7Go9RI2SMRmtdNVYn/v6+zCKRRRbf59dcTZw7oHFmXV2t1x534pija7RddY7Jci26Pf2/fH+8uS3FFAMC0VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753308784; c=relaxed/simple;
	bh=MHO/qp+UAkFUDV1KW+FRY1st72hVPxPQhofJO3khj6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRSRcKiLn6hABHwVu2uJ17nq4qGNFwwIpXo0Zb1lBpI0aosTuq4r+1tlzF/U9yiUWywd5VR5j/dzrlXc/UKjz2SFxplujN/Np6ChZvkpr0A4AAm34kSRPCj3BCSEZ6bvKzLyuHODBxGW/keqeWtVKzlcAAoy2pO/8AgN4eylM2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWICn2Ap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGq9jp024471
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nwBcV4Oemt5
	w740AAje6mIColtrmwRWXKq31FSAZZI4=; b=AWICn2ApB2hptKoeZROC9GpzaY5
	SFOn2Ft8ShfZYY1eOrWzBCbUCM9IEdHDe24FI+bSASpuOLAtwDefPQXyw+GumzTq
	XbtgmrE4Q0LY4qQbsKoVG2r0VEQNCqYxMFeaXT8ELJbN9GMGuRZ16Vhe9RDXna8n
	8hB2ymR0ZL/m7y+4ew/0C5oPpUx5658CNlQpY9vHYy2onO/NEtrtjqGHZVKVF1uf
	GiePYIFU9rF+LBJ6QgPeS1RS56CYyEn2fg8A76CaTbB6hh/1HzwC3EwFXb37uU+G
	2NCM46UhzpjmsQC7BLbu7sUCnC9+k5Yy17RjQxfFoe1O25R70YGAt6lLJ5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3esfxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:13:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2354ba59eb6so4007045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753308745; x=1753913545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nwBcV4Oemt5w740AAje6mIColtrmwRWXKq31FSAZZI4=;
        b=IbtNfVB6PvCO4bzVxJYcX09PinbpVGS8N218ESykPk9S6WeRC6ERm9wOQZ/7au1VA6
         LVOlGFRBQ+ed20In0d2IVzR/pF1Q4pFMKR7OnPtggWic/gyACThFegf4RzKlOhCH+qOY
         /93vRRMvGTk6Lg2sNAuPjwxy7EQwMWSnMzVK1nCOI8ApT95Di5TK3vko6+2N5b5DAoqZ
         8SyyZRu7x0ADp1JK9fTl9jS/x3k9bIrZ71h7XKI2B4bzOxe7eS1pkxykVhgnQEuPXeua
         fDmnMhlHcASEC95fPKusEBQG0/sC+T6A1bBnyqc3eHwblvbwKV1YmPHTwb7tDbbZ6yC2
         ovdg==
X-Gm-Message-State: AOJu0YyoCoFo/UzPY9etE1J17VhsNqrltBoI8nNqJbFXr1MMIIX9CLGn
	Sy8cHDBIeQS5COhf2Yi+l874cRrCVpF2cR5FMSMd8r8U+VI2Us9L0f1IVjiYRqJ9/HKByz4ch+j
	ZjQKfUnKA6gPNwW43xgpGRCODl+gd/kTSLG0XTz25yw7cM21QhNM1TkX3iV+Z6LRJjkoJ
X-Gm-Gg: ASbGncsM7STHT4UmaIIVsVKnVv3BJ6KBNwQtgokbgfXsF8NIzS9ez+Kual+uWuU9u3P
	Xi/rbmRVMPCLyvy1ly4OvRfzIYLcp2Zx9xCdeSHZz+FvR7m1N1edG8OrKKlFVC1J6g1wtgB9P7C
	aplyx3x3eiPnqvp43PTxqvrcTJuYQXITc6q49MgDiBlrW66yAnWTHMWez/azNJ1Aw7t5RSJFRd3
	DbnrfjIPVSsONjWHMfrgLLEh92Ee3QeqAHvALp+NaHYvgRTsG+k8rckq9ue0hDjRXE60LWGvOQb
	AWtiYB5bXqDe23eJpElqxapv3Iramb61TF9y8qj+JdS+geDgDbI=
X-Received: by 2002:a17:902:e943:b0:235:ec11:f0ee with SMTP id d9443c01a7336-23f9814207bmr57803095ad.14.1753308744785;
        Wed, 23 Jul 2025 15:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkj+Iw99H9WbS4Td45rekkyuGG7wRyakRiLqXabI0Xe5dEzjqYnRgG1GK9hr915l7+gNcwMA==
X-Received: by 2002:a17:902:e943:b0:235:ec11:f0ee with SMTP id d9443c01a7336-23f9814207bmr57802895ad.14.1753308744415;
        Wed, 23 Jul 2025 15:12:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fa0f7sm449255ad.169.2025.07.23.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH 2/2] drm/msm: Handle in-place remaps
Date: Wed, 23 Jul 2025 15:12:12 -0700
Message-ID: <20250723221213.36325-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
References: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M0qPpp5QLBVVqkGMkmof2G7J0HyQIGem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MSBTYWx0ZWRfX88vUJ191lTIz
 D/jtVAfLRzKXk1qAl3LPpWF1Ue34X3zgk5jYvGvAZeqkwpH22/uFNq3HnNdBIeWXcJqPv4mOQfO
 uqWgoTy1+MqJJVQUYOOayN3PMzUfChP6bVMAzYyOObyBfOmdfZby6AQrXQG8Yk0FgJFmWXF+ZzE
 INEVL98YgaOoYt+wsCuZCHX/XaOLF58PnofqOMRZPmCshlDLskfYH5huixkEpqcrOhReq+eiq+I
 7wsFqL2kzXF4sjsAqpWp7cAgTqQWQsc2k/GhV6/xcp4fjMM8h1G+Ep0Ufr4pNJqa8wNX0czjc5f
 op3Qjhd9I6kMEGOvhQLfzRNXP9fQW6ZXJ92oGoluKxkCVmeokI6z87Z9nwEQx+4XX54AqLxXp3C
 6V3qJWfHv9j+dNm/GOoFzuLgUPA0q8QZQ/fpd3WK1VdfJQYBbluIxY3RwiG8wOwaaaRIYaJK
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68815e6e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: M0qPpp5QLBVVqkGMkmof2G7J0HyQIGem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230191

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



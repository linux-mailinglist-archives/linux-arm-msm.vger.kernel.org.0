Return-Path: <linux-arm-msm+bounces-78418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9ABFE665
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BC1B4E573B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D522F6184;
	Wed, 22 Oct 2025 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJWQ2Lh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5DA218AB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761171660; cv=none; b=EnD/OUzEiOs/97myjIlyoDrp2JWbp98K1pd1nrhiQWZk1rTGLl8ZjHqXnpyGa796fWall6xlNYxpX2ifxf7P04+Nqyi7uM9XTAqcfSJ5//x4JFIFqJmCXW+gMgDNfvzeGOWSjSj4A4Q01rNhoWpFnKMqV0oqMa7BsA9AfTRYEGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761171660; c=relaxed/simple;
	bh=WqqdxK3KDsMpE/e1giw4h0keHjdtqH8gBSJ9aZrVbOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0v6X2g60sqigr/A+sbBbqG9RDK/kJdvT1YPqzP8yi67F9/ePvBWeChjkIaHEAsYSzjMEexDoz8Bs69O9+M628oS81XXiBE6PS1oq6OG6R8adh5JvQuQ7JgY6u/tGQA8Kfn0DbYZAMVXyB6taeeR3gvSm31uVZTQrc4FA/IbwkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJWQ2Lh5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeo4h022471
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i0mvZxV1MDsJnYmRbT9+6JtzjrypiHsWcbX
	y/fmUaPY=; b=oJWQ2Lh5VafWunD4Unv+UfZakS3vkrcf0DavngbD/HJYJlHDM66
	WLO7Who+AlUzOjhwImK5ZWis7KpLlukheN2BrBsbXVGHuhJcF0lpIsO9qZVirh4S
	9Ql6n8rCZ37mDKMZyx8pDTElM56Nb6+amyzZ67A65RFiZcmH+3d3+kA6Yqt22MxI
	En7hoHryEMqWqK+sL2POcJD5BNth1EBxDua0p5qPVwD+trQWJIODV5PgF6c0+8gf
	9w8bhm51xQUImYfMMGk1GFofOwmL0sHnrtZIZmQxzLEpJXGjmQNzv9eADhDtPiZ3
	JkQkdh6zcc9KbQaGYt55cYQXa8wsCb3+suw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8695y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 22:20:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5a013bc46dso40395a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761171657; x=1761776457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0mvZxV1MDsJnYmRbT9+6JtzjrypiHsWcbXy/fmUaPY=;
        b=FZor+kha3HyF3V7jIpFFfGOc/PSM2tfN3gexC7Hdr4O2ISkSDSaL0ccy1F62dvmBD8
         bIdsfBWTiaS8n6cVRcv9qWyWs752ekLrbvXKER5kOtelcfxJcwQxxMI8JpT4g8d/FRxh
         u7xX2VkaL+bHgWREVbMnW/oHt23vyqlu1xT4R0tIVLaq+Dic05axZI9mq1pRAd6xcgKM
         jJhrZSVdJ/hesOWGXtyxz41L1L9MtStGAJAr6UWpeNYQJH7B0AxJ6oHoVDoJ83v17Bcq
         zghcBt+ggMUWSp6wVgUwNswWODWxxXvRckzrCHa68KaVhEXSLW0EsLr+gIe92CWRPntB
         98kw==
X-Forwarded-Encrypted: i=1; AJvYcCUvqAGAGBHAvO0OU/s/GevzWtZ3MGQfWEeIgrCTEv25MIcyOdNvnDldklUu9u0qEaIsvAJnrPf0qN8oHIpk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc6ChueES/KbKd3+H8lypoDfDlAnruXqpJQ18so+bmuIsn5SoK
	WFkJ7XnvXay8b5Tf9C8oYWHe9xelx/wFHZusFurPCWvzIZq73NJuc0WJEaxBASkJIcpGyia8YKQ
	vEoRMYbzGdcquWthJ/CXggLhpBcYb0Me0BhbZowAkjFpUWzyL5LUGaon5rZ5g2U1yzR36
X-Gm-Gg: ASbGncub7JQ+mwn72iGVm01Qei7cyZtkL5G6LWS0xIxduhfEUjiUA/LzZsDu7dyxS53
	s0HErqEpmJ8iQwgp83ND00dR+zVpmNgyhdujsrFU18wYYV2OnpFUP7FJ/IWcXNU7ETc7eFECazn
	HA0EVeDX62AT/9elct5eiYRPHRZhxC9OCJcq2CnFhQY3K8D2AXKmk7lvnhSUjbUfVivtJ3CEiQa
	0RXKpyrfa+A+jfWmeS/gZhem0bZF7SKp5hGg5cIZUmbNfAjOcTfJJPUoZyCzJ8t2epxevvzXoZh
	1/X1+FC8fAr1IfeTcNqwXdA1zhfg6RouCWtAHnt4J25GaxwjXRMwVchjD64IoVjXgv5PiDjc4Wc
	r1h63+4woFw==
X-Received: by 2002:a05:6a20:3945:b0:252:2bfe:b65a with SMTP id adf61e73a8af0-334a8523c3dmr29215683637.7.1761171656705;
        Wed, 22 Oct 2025 15:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHcTg7biN0R67q7mojPROACusX0lr4TEu2AEKXPQxVnJV9gXrUyzRzXnKDQhdID1RaUTlQhg==
X-Received: by 2002:a05:6a20:3945:b0:252:2bfe:b65a with SMTP id adf61e73a8af0-334a8523c3dmr29215654637.7.1761171656232;
        Wed, 22 Oct 2025 15:20:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e0a43asm115793a12.27.2025.10.22.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 15:20:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Valentine Burley <valentine.burley@collabora.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Reject MAP_NULL op if no PRR
Date: Wed, 22 Oct 2025 15:20:51 -0700
Message-ID: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX0K6ZsTZ+KYW8
 yv9eZ0LLohtMfHOtEyne17CuyMhmFzBmNGswRAenHbagK2RQfDcFL+82eBMLuFE/US/R8I9fkcJ
 L3trzeGuhtyC1CiC25BGQU6MYUQj7zvGDEpZNfg+N42LMLnF4HQWgxRc4/QXStSp7jueemijkvB
 svRjiDL0d6mq+BTBJDibquoyuoB8Tz+LRQOg0E2pl59SXIbitxMRcB8dpTxovFNzAU1nLqcUHq5
 5TlpTiHAUfvuSVxz3Dv8oo8DoOMQRM0Rti2bEVOOWibGXn4z/qVfdxgR38MuijXgaNol9/+yXnU
 OevaAbBwPAsqSUk4uqMpvCxErhGskh52jllCiwjMVOin/fkzsF2M8Xqj1XGxvmNVv/unDXw27P0
 c6qpByHeMu9B9rTgobDCA+bYulcleA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f958ca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=AzObSZ8MGmcM1bWaoswA:9 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 9Mai1Umgt-38L9-CgpjdtgfXXMRJEcvu
X-Proofpoint-ORIG-GUID: 9Mai1Umgt-38L9-CgpjdtgfXXMRJEcvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

We need PRR support in order to implement MAP_NULL.  Userspace shouldn't
be trying to use this if it is unsupported.

Reported-by: Valentine Burley <valentine.burley@collabora.com>
Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37935#note_3153730
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  7 -------
 drivers/gpu/drm/msm/msm_gem_vma.c       |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 11 +++++++++++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 19181b6fddfd..f93eee67240d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -365,13 +365,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-static bool
-adreno_smmu_has_prr(struct msm_gpu *gpu)
-{
-	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
-	return adreno_smmu && adreno_smmu->set_prr_addr;
-}
-
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 90712586faac..96925a0f3965 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -964,6 +964,7 @@ static int
 lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 {
 	struct drm_device *dev = job->vm->drm;
+	struct msm_drm_private *priv = dev->dev_private;
 	int i = job->nr_ops++;
 	int ret = 0;
 
@@ -1010,6 +1011,11 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 		break;
 	}
 
+	if ((op->op == MSM_VM_BIND_OP_MAP_NULL) &&
+	    !adreno_smmu_has_prr(priv->gpu)) {
+		ret = UERR(EINVAL, dev, "PRR not supported\n");
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a597f2bee30b..2894fc118485 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -299,6 +299,17 @@ static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 }
 
+static inline bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+
+	if (!adreno_smmu)
+		return false;
+
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 /* It turns out that all targets use the same ringbuffer size */
 #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 #define MSM_GPU_RINGBUFFER_BLKSIZE 32
-- 
2.51.0



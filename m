Return-Path: <linux-arm-msm+bounces-62530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CA1AE8DC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFB1F6A06CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17D92EF65F;
	Wed, 25 Jun 2025 18:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YE+joRQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D72EE297
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877934; cv=none; b=aG/X4pXVofXYmXv2p7NEwjRZ9I+TN/8XAEycL0KMY7vEiwyDnDxGTCGU09mAM63Ruvt8YJj6/1L4LHgXGPB4GA4qGAzXydE0Mjl/yU22oi+pVWt7P9CYp5UugxDvfYJgtGVgqUyPWP05gZTPOc41Y5HjWOtFR6OwhySPucs5USY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877934; c=relaxed/simple;
	bh=QW16C4VF1d8e7Sjyfc+eli2odXO+RUUedY3b/XyYGGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFe+xlyKPek9cElfHx4gzWjGrDFJJR6J5jmbvNhpdvQgz8+tJkHvENDVQdVTUdSL2IxspYoaPCN4UP2t/zWKuRvcjEvt4vYgCA1PexPEdayQpXU8pKk4H1hVb6VWmFcSXHVDsgT0Mcpd/RAVfqkI+0oZ2srqX5nRGd320n0MFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YE+joRQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCL8rO028706
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZmGKliz2HfS
	kLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=; b=YE+joRQVeW83E173DEBd8DlfS6Q
	1GD/RlzoDgt9mkUKHzTtPhxxyyvWzbs0oRDmViGR3z86K8X6EbQdJVmvoMjS9LGH
	aCoGwGs4f7CoFbPCW8RKFxu0nImD+Acz1RB/QNxPSxhncmr+OH+n6tEm3Zf4RAM5
	107j05enx5cdOVRgumfK2cBxdTRVHF0WCnetEb0iBpys4sb4tPk063w2MOJRe5iS
	q3z3qbp3CUixevCYAQLdD73syXENgaIPdIrmX9ejOgWsMuMySJhm3otxc+CKtitr
	/Y4dhCGCp/6SA7JDF6HWb+Ju9gEAOe4c4bZOZOzV9h8m4VnbMe0QAUQILMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2358de17665so1743365ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877932; x=1751482732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmGKliz2HfSkLFaMboPGj46o2FCBYdJ6NdGmIRY3dt8=;
        b=bvbcjZUsx0MLjQxwlLCfNUOkvg5FUv5PgO6ag/nDrSHgAKTTOVYuxEPj79gphfrsvo
         S5/KGpp3lEK4j4kQJYmuTESv40an3Y0AcxKkkVYbpBGLsfx1oBgYyAtj+4tVrJGisiH+
         an64o89mv6/KlvzBtY71M1s1eDWiV9fe6CvFdN9IEEFv4zdkpM2j9nJXDMlVYVEYMlNn
         Q24WyFti/SC/6ZekxxeqslOtOgOjVr5Y42CrqpdyT5gPoEmuC40QG5fk1CRSUiGNF80m
         DM+ejota0IMrRtvgJDxQmXbSUtfJs8uHUIwRZgJm539LB/7wWSk3RZ1erNsHgxKifUFB
         aM1g==
X-Gm-Message-State: AOJu0YwtRCmNxKGvF0A1Hgu61EeBAWOBbFvxY0hmOMYEPwgd9/QWEwD1
	ubOkOD/YPW6qEX+1XDsH170ejulGRa5bZ+LEDKK2w35iTMe4fBhDp/umUBaxgewcYYzlDBaaMMY
	NhuZMzV5k+Ttnfx3Aibe437PFjfFX8IubrpzUH8nspq/ilBtQbp7ufg0RerPykV9SRvm0
X-Gm-Gg: ASbGncvCLw4TaYj92xElezfJaRNnpF/c91O7O7ncB1EImfthF6+hrdRIVZWxeL2Wkax
	vqiMadrvkCtuOPLqF6cpxguUvwRLMGnUJKz6poeajvZBCwakpYEbBVUP1BMsyG3w3+WgBD/YSq9
	7LfXkTK+x+alXqjfBOLeFfMrWYuCt9SJL/MkWck+QEDfFTj1lcGge0/NizWJ3dq3Foy4+sI6GPT
	AJtw3ZjCjFc38pxAIAd9ZbCV81zbrfQADB0jJGfRz/8jE2rrKZsh0hdmCXsvAxTX1MFerghTynz
	Eul1WBOuprNbBfSTCno7s4r2Em7l7bYF
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23823f95145mr55316195ad.6.1750877931640;
        Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd+biFg7tZ2NwXXiWCrI5tlm21WBzd0htJGfF806nU5iy7FUrbp/Yw9gOaS7aR3Qp5foqhCw==
X-Received: by 2002:a17:902:db0a:b0:234:b41e:37a4 with SMTP id d9443c01a7336-23823f95145mr55316015ad.6.1750877931211;
        Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f8d0sm143513745ad.175.2025.06.25.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Wed, 25 Jun 2025 11:47:12 -0700
Message-ID: <20250625184918.124608-20-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46ec cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ZrnbXXZvonKpCjWc7Wn8zGMbj1sTTQpG
X-Proofpoint-ORIG-GUID: ZrnbXXZvonKpCjWc7Wn8zGMbj1sTTQpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX6wpa2wxpIh06
 uVP3VeauBXox39rcnjPOvA+0sGR93A0SNgxOp3Xuj1u5WZyAF1+LcCVo9WCE72S0TcKfFckYKgO
 hLf/GEjAUSxthi1jJyuFjKaQ3onsanYqYaw+Lu7KRlRM4yNgkZUZIcoq7CxjVnKZaZrT31AOjDd
 KcTISOQ8S3/f8hst+TG5Svc+OcSc70op9bKnH0lF+daZpLf+IBKDGEJojVDGdkM2p7+FeOQNuxs
 5AxsPenyw7kE1THcpjn3k9iQ9RyBceHpCqBCtW+pnzP025UymoOd52PEEhtDf81UmZdoLUqbjAa
 ZAGzrQ1/EsPU1wOxqYny2iawnVBa3VOTwn4WWgIw550VMjBwjVDDesm1Y9waPzDyJXnfMl8GMnJ
 C3V3QCjjI4fW0ygDqoTT47QbZ5Y5Q9ImHHeTCg5/sKvWMkli+LnvCu2XxeeTmox2KjqTvMsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 194a15802a5f..89fead77c0d8 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -61,7 +61,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -437,7 +437,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -615,7 +615,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 2dd9a7f585f4..ec1a7a837e52 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -111,7 +111,7 @@ struct msm_gem_vma {
 struct drm_gpuva *
 msm_gem_vma_new(struct drm_gpuvm *vm, struct drm_gem_object *obj,
 		u64 offset, u64 range_start, u64 range_end);
-void msm_gem_vma_purge(struct drm_gpuva *vma);
+void msm_gem_vma_unmap(struct drm_gpuva *vma);
 int msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt);
 void msm_gem_vma_close(struct drm_gpuva *vma);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index ef0efd87e4a6..e16a8cafd8be 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -21,7 +21,7 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 }
 
 /* Actually unmap memory for the vma */
-void msm_gem_vma_purge(struct drm_gpuva *vma)
+void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
 	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-- 
2.49.0



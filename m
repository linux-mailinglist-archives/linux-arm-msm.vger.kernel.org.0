Return-Path: <linux-arm-msm+bounces-63006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F877AED0C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF9C31896425
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7788524EA90;
	Sun, 29 Jun 2025 20:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfFz9SbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67788248F77
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228208; cv=none; b=h7v3cJ0Ja/yFj8QU0xcBWbl2tV8bgyqecUCiVyzbUD9PKSbxNg/p6gIt3F3v376y+l535hVfZJj5rtQhXhUN3UCsXefqG2PXIre7POpmu5/d0mZIaCC4OtK8H2kMW3IT5xNvVEABfaODXLx8NwkLmjH56z98iScJg4ZksbvqgLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228208; c=relaxed/simple;
	bh=ESQLfaCKTG4R0R91DqiQm8NfAu6rY6ldXlZSVumZFv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdWmcUjz0GQ19nTybw4IbmhfhcHoEeNV+33KGxAO78MqEDCyP3TUAZDGwvoymSnUMt0GejPn/Q/AZbu0IqSmK2z1ZAuonDlECHNzbwjP/jbWbJLq9nfGtsHbtQwmRE9JAkP1tkWa35lfcG/Vz80d232qnAjkL1KOgadPdNi3diU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfFz9SbT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDqWEs026426
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
	CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=JfFz9SbT1oIaF0VZxe17kxpx1zQ
	y42O5dIOd7+otgw4y2tjiZa0ga+TJDQE578F1Lj/wr0MERp9ePDYYLEy5JP1MzTn
	jnu+KO38ASHn+07D+1JLTOifyxgSwAwc53gbSLc+Ga47lve5WwLrHJxqSOGQ8Ome
	nA8OrHRYanXlgpUKyj9IGU2JoC0BXzo9D15hDjIeTqmomR12ORLoAUyfD2mCBsrb
	xb8Qk03W8a6XfhCqZL9EcP6rmUiv4YLSEv9whb8KViPBsvgfmrNBxOxkubP4BgS6
	uTLTigHSMhzWrDZT76x0dK1K87z3zQDfsDNz8D96yaYm/OpLexdfwa+GZZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23494a515e3so27567045ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228205; x=1751833005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
        b=ZJtAhR0+uZA15Azn4W39tS4HG5x3GyaK9RTLWJxK+3c2PG6HCm2HkpK3admMUk+0mz
         H04V3RFELCoFr+yfK8MO/pc7x3bj5Vfz6RA1UH7apxKxTU8XwL9L65Kt23kMZGKOarC1
         47Uw0VBKnEPnuFgeDV2POU6LFJ5pwgRffm1L1+eSso7ju9Z7yoVNMezfL0i2jBkf7Hpg
         I65k8DKTmN3Ck8sfevBLJ+nAL8i7otRrLezq6si1iO06fXj7le260jXBi85sY6h5S/oo
         +XMAV6JewmyxdrVnF9grqZQGr31AcYPDKfcWv/NAWNu6NXRhxMe2yJwJiTduQVJIiYZv
         6Kjw==
X-Gm-Message-State: AOJu0Yz3W5Oi4p6h+76HFOB49mICpZVFIX0Ixvq0s519Ja+BA0p+H0yx
	lczsyNDX5X32NzFDqO2WjQXd5j+FNFRwPI9Z7A+zgw3fweJ/9Xl/kHgovLj057yHzkIidZYPvsX
	2UsIbKC5EkNgizajb8cz4dB3A7ry+NvKYPmm6q3r7bbwSEHSmVoflzQXk1UFA2avI+vlg
X-Gm-Gg: ASbGncvKSqOWM8c5SUWq220LcCtDjd5k/41c7urqeCNjD32NPgn6kUoMBt3ma80g8zw
	IyYVu1yjMKsUTokyiRrZWV0KvSnkaFn+k7pixlFg/hH78p52tQPzH7OpOGeAssfavoKayzOSvwx
	lunBQw2ZFm2V2h2r4J65jy5qWHn1dOhYhR2dLsj5MMLYJtHhRVGVjHoi2hPglQgL/dC+VJPfO38
	QJhkdb8Ga44Dy1Z2wVYTINVT1kbp7dDJFfKt17oEOub9gcN+8+nopUkDqHiqmI89snd+r2IPRKC
	uyL9VSxqZ1ASGkt3rw+hxw/YxEcG9Gu4XQ==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23ac460838amr190149795ad.36.1751228204912;
        Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi+FCZAiieRq2GK0HZyXrffH2uO26d9xwGr6VDhBhxu0D5CBsaqa1z27xVMPNiaaB4jVB9mw==
X-Received: by 2002:a17:902:fc8d:b0:223:4537:65b1 with SMTP id d9443c01a7336-23ac460838amr190149445ad.36.1751228204550;
        Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b0052sm64461035ad.158.2025.06.29.13.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
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
Subject: [PATCH v9 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 13:13:02 -0700
Message-ID: <20250629201530.25775-20-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 5cZIouq2nkwww240LwhS6kFlkVVNtneT
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5cZIouq2nkwww240LwhS6kFlkVVNtneT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX9IEeseDO3fbx
 l7XMg5SvW+xBB6TJcXa/fEniZom1SCqhlmYJNRegzWNJ/Qc0CLff/ctukyR96c8MqZqYXs9v9Sb
 c+M+W4TWQpsm1UIqzElsYocsV/c88Xf1gzPsB6O8XgoiH1lRp28SooZgOk7PoQ8us8V8o5smZ5h
 xrr6xzsflwmPxQeXKTG9m5rrSxcBWIPzhr1nw4dsjrXy7VMIQVwMh4/Q9qFcc5KtKxti8pwY/rH
 MhYKfktPIVlnXox0/trqRGu2ZR6XY8a1gjI3saoB0+D6ZtbJuAugE0yz5ZQ7i4bI3Jv9PuNrd1/
 QK4ThMRTXRFZP6+NVSXX5l8G+AAyso5o1/Bhh+rU/szPcyAlYWouqtdtjQ4udx11FfITQUF5ykU
 +ppiSc+BbvHy+vJSo57v0Blg6SzBdNXthibf/l35at3nS7em+bQKT7mDiJUP0XHn/6eZ9ixw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

This is a more descriptive name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 6 +++---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5c71a4be0dfa..186d160b74de 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -57,7 +57,7 @@ static void detach_vm(struct drm_gem_object *obj, struct drm_gpuvm *vm)
 		drm_gpuvm_bo_for_each_va (vma, vm_bo) {
 			if (vma->vm != vm)
 				continue;
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			msm_gem_vma_close(vma);
 			break;
 		}
@@ -433,7 +433,7 @@ put_iova_spaces(struct drm_gem_object *obj, struct drm_gpuvm *vm, bool close)
 		drm_gpuvm_bo_get(vm_bo);
 
 		drm_gpuvm_bo_for_each_va_safe (vma, vmatmp, vm_bo) {
-			msm_gem_vma_purge(vma);
+			msm_gem_vma_unmap(vma);
 			if (close)
 				msm_gem_vma_close(vma);
 		}
@@ -607,7 +607,7 @@ static int clear_iova(struct drm_gem_object *obj,
 	if (!vma)
 		return 0;
 
-	msm_gem_vma_purge(vma);
+	msm_gem_vma_unmap(vma);
 	msm_gem_vma_close(vma);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0e7b17b2093b..b5bf21f62f9d 100644
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
2.50.0



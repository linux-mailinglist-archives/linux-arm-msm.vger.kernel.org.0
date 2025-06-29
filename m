Return-Path: <linux-arm-msm+bounces-62949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C77AECD81
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E087E3B4BB5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B21239E78;
	Sun, 29 Jun 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJcrPvyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41DD227BA9
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206073; cv=none; b=fb4dMW7zd+yVGgvo4i1+BuA7lCFLCIwbpbbSBMxN7cDx2yhvXGVuzWnxzCzz8zJJX0ZhL4tyRL3M/Ju4uc008U1GZBi7z2LE0YVdbWySnwiy5UFPbLMSNI4DelKAA9SDYEZWlGOd5UviNymqRIrXdr4UyYXzlPK45rjaYdhYfno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206073; c=relaxed/simple;
	bh=ESQLfaCKTG4R0R91DqiQm8NfAu6rY6ldXlZSVumZFv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEuDRRbE1mIe2mR2nNlPnJ03uk8Bm8uiEG7/X+QPfGqWI4iHXXwd2yBsvI6q5MWuUmBjnw0bdEptjZ3Vy76dP9edfAjlaNz0abdCAw0q2s6XZCY+nt8ujjNceCZgiAh274MuwPA5RsuVYD5aYKvrQCtdzV5VL7F8xKMATgC0WAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJcrPvyl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAEeH9024207
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Aea4FNs+8GG
	CBuby38XbOoX3esCsoQzCfRoTW94GwEs=; b=jJcrPvyl7D1DSgJKQPuG2ZaNEJq
	TmxzF5N9gnvIjsoh4qX8XjmqJreN6TPHLp3w4XVWyIzdfC2siG4gibqJaH13qU09
	2uBU8gzgtrGERKfPnFx6Bcg4YyYX7Zk9LchhAfe1O2t+w/HmVy8D6GH+FinaHmqs
	+mOgTgj+jwa9m8u3lO8aeIbwVtXdP78OqLtfTQi9IaKHUk3gk9E0umTRvpD5WjS+
	Hs2exDFHz3iF9jGIJAPoApKed8WuCFF7dmw7xmBPbQ2VhN3gTv8qKKSDk7RCBO4a
	HBzPFEu/Sxn3X9lIoSrRVmYI+zO9Gxr9XWSMvgTJd+tzGuchbhJlsYFG+GQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74b29ee4f8bso43514b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206069; x=1751810869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aea4FNs+8GGCBuby38XbOoX3esCsoQzCfRoTW94GwEs=;
        b=DKxvbvPQWE/t8PXSlIcv2K/yIOL6sik+Y9QledhgIL+xFHcF6BYpFn+U8oeXk3wrHW
         Hna5OTtTYj6woKXoazBMYZJiniitCk57rycGb+00cg40REXeQKP8QrnPj/ax4o8KWWXd
         X1RkJkoKTF6LYhLmzZKxd80Q11bo52pUbJC/pxpK22x7ThaYQV6gJbug1pHT+lHx+QmN
         cjVw1rmdxmyJwtruAUYDe59aEBAFhSeE/qWzVZeXq7iF48gQNAY6d1t8qUM52QLX3GCy
         bbgbRwyoJF2B97fmyr8kW+DZ/kjzTAD+1Z1ArUTrLliKZtMonG3CaB2HX41Ii4JY3Ov+
         VPQg==
X-Forwarded-Encrypted: i=1; AJvYcCUaDyfPs+8HB4QBwGrv+8G/GvCB6/X3LTtAmDWrW8JMdqRPcFiGmY+mg5VTv57LAB71kIvx0h3hIz7TBrxU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywix3komUP4BxMhIifcs/C+NoCMGJpedDyiM9ATm5FuC9DvMgrO
	3Sbcr9ARP0X7uLJlh9w5Z9uMjyYMwP+TcdlXaKoa/K9hW3wiFt5rkCgO23i1hajobncT2oFeq5Z
	ndb/yr/+QBCQZVwKTtzXONjyESreA3Sprv9taVME3RWzAYYNW4DQiAGntMvnhU+CG3sSK
X-Gm-Gg: ASbGnctvFkF6AeUqlrIIShRaD2xHrpfYEPTdlPorwEny4Ca2fhTRhzWvgaLN8erifOq
	6sq3p6q/aSWZIE2qyE0Rm1ijr9nRnbnXXV56KMu1BUFrHGTr+ATbmJXMP9ujIDNVrtlDkT5J718
	xPdTzXAvJD5RM7ifhmQLW0KM3tTocBuZfVy70J7UXBbrhhkVpVmjXCLNeYMCzR1tkQraGsCe2Ms
	MoPlwGbc0vlotVR9Hadz7X/5ebN+nCRt85E5JQSNaHnrTRbd0X5A6aLLg6vbhUPT0UBTp0b/3Fi
	kRW+hlXDhyZhdALo30zvB/o1hwMVV2XR
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr15129144637.22.1751206069228;
        Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4h3RVVYdGoqKUxRhDHt+2Zko+cPdjWJ8H6//OEKtNu88w3yP8af8LGtq0ohnKwkPkhBc2gA==
X-Received: by 2002:a05:6a20:7d8b:b0:218:17c4:248c with SMTP id adf61e73a8af0-220a1696400mr15129113637.22.1751206068805;
        Sun, 29 Jun 2025 07:07:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541ca0asm6760251b3a.57.2025.06.29.07.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:48 -0700 (PDT)
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
Subject: [PATCH v8 19/42] drm/msm: Rename msm_gem_vma_purge() -> _unmap()
Date: Sun, 29 Jun 2025 07:03:22 -0700
Message-ID: <20250629140537.30850-20-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: NiFw3Qz-_3QB1tBcRoIg8nxOH_HfVjNg
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148b6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=jqtXezU9Yb2X64KsF0MA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: NiFw3Qz-_3QB1tBcRoIg8nxOH_HfVjNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXxNC4O8sfxpQh
 Znq9PetaIwZivVnkTIbptC2k9IGiwqNkFTri0NWtlKnqgjmgEe6ryqwBp59AuJYhc5PSN++8MJL
 2pPen6SCIOKdOQpatf+MDswh+n788SoC+cfsDJJnDolXmX4/JuymySJ2FGyrz01D3utOavh1Spo
 /686k+qppZJmuk0D1FkXqYwA4UrSJ/EXIHLFpH+r5tbo76U1oRk6UCuL2ILZOfvZx657EjuZwcZ
 PbktKdKQpue525XGFnp7nlrnyX2Sht0LeOY/j5fPM46UkP5kfGpDpUiJdyAZcifE07UtlqLCmGm
 lZJqbIYLkn8M1cfdacQ5YwUOSkz+AtNDv+WY2wGYxc56nP5HfYcFb+z48rtLOuCB3NTUSYFjiK2
 7FSmxsfPChpMXurCn7Od3SBP/XSjHxMQDoHlaqBmQrKT2HUFuoZO3jNtARPjJDzgcBhs8GdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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



Return-Path: <linux-arm-msm+bounces-62996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F71AED0AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B78AD3B5399
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AF223C8D6;
	Sun, 29 Jun 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B73z6o3N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DF723AE60
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228180; cv=none; b=b12zVk0L5S9S35Jw4++4XxYTJhRH6ijpKEWcSdS3pWeFsAVNiESD8UqSWvBW+iep62Wq7yZrasTyJ2lk33/oiJi1PeU6+lcxtQ2Oalp7hyETurTqbJtdFy3tKh8kXcWExvnwX1ZrYRCTiBb0L5tu6kdvp0+4VUzuT+4fpwlbXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228180; c=relaxed/simple;
	bh=au593a8+7mGZ4QlvT4X7cpF6yg7CCF/F42yjIFbyfCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3RkbSI4PLS+/X89GMTLNHtapZ/feySL0AMcdofUDlbWBppM8W6sUDNXcuggQrZdUwjlk/L8cKMC3FIHk0EIR28EkxFm0D9q5tQqCAxrsjnuPkB7toigzSQUXg/KLhOPjcHvICLcloVEBbsjifS/imxLair+d6DxYNa++8P+A7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B73z6o3N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDjTZT014995
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
	6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=B73z6o3NUOnTBeLRUz/v4CmCQuC
	NG0NvTygtQIVavwWwnSyU+uTSygQRtJT5ZZoQXGzz83y7ou/2k0HwoL0MboB2Hq6
	COEAlCbEjz/+hUcF64VO1IUF4pktiFoPpWxBerjO019dh06E8Gjtur8f4ErBeQiy
	CDIN18t6q/1/2slPbQrTJpzHMu+dGxmJRUDQEVbUHfocOyDpIoaq97VkBrky8R+9
	19/Tn43glh9WVt9wJzVC/9YAdiq4AM+L8uxkNE5kA/J8CpKCPs9zyiKMvfe8VUPk
	VCmCEn7B+XGmnU9GnEKJ4/SE50uQcWQku2UQ1UewhRHwJ4gUIh0WAldycXg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvjpp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234fedd3e51so11025485ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228177; x=1751832977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
        b=EQykwqDp7qX2vv9MXcAGktyVXeapQmQhuuG3OdaT/OO+wZunqdmY5QcA42TXX4R/dF
         2/WF+c34Vs6BxL4u+QeJuxsPJ+kuk1HuIMz/D6+/+lYUR1MNpczg30mgAnUMo97yrbkX
         lIaxVSW3ana2mcWfVLSwYQoQXN+dIiJ/V/55a27WkLNSFf3ZMSpvHxpk4S+YhguVp9dE
         edyJ+s3WY//5vTUKzEO5E6Qm0UI3xmmxyDQVcpXA+MJ36lGS1d05wOH4AaeVvw7AtOSP
         eW/ZiNbqlxfKuVO8VbS0mRmGFZy1BJ2v8R8iERar94bJQBtE6R4o/VzsT/cZd6ncizXM
         3gCw==
X-Gm-Message-State: AOJu0YwDr8ei/y1OgqoiNl6C6RvHW6/4Q3W1h2vNEOak1Gd/+vzSblrX
	AYYRchoSGu5N/7H1OCaTKc88qac+qhJFYSeCFomK2Ml9R/B7SONmsqDAzT10BcTVQpLFSKNxXBF
	TqsGwSQYn8yp8R+JgkMWCnV0vWayjk8rI7EZjFLXQYxHmIk54ZH3madVU+nPl+EXuh3ZN
X-Gm-Gg: ASbGnctoJo4h8jKpRZbZQNlmKyEstbNIVeHfHv1O60lQVwCjiIniHIAT9M6jeH7rOin
	8kZqPrMt0XXfYxwbyulbhg4r5t7Zso1vmjYAxcE8OIkfMuE3RKEi2JfVshn7KJlh/rOj965YMYO
	ts56ZUFb67LCcx1aykJWqmkAuAX2tvI9GouAW5cRdehBxvYUBAhwApp3oNMjasFSZAhaUTGSouj
	4xXrPRnv3eikXoN8SI1vsOrqMZRLziRx8tOabJI4bawUrMvPbHnJXIStyThEkDhv2ptNovyOhTD
	gFVJZRTL+C+rKn/xOYx1yKRmLMPnLnfX4w==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id d9443c01a7336-23ac46342d3mr183275195ad.35.1751228177197;
        Sun, 29 Jun 2025 13:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZqvQxwClmeSyChDksjaanlaNbbsqfLSli1B/K5dWQvgddHns82/yR5/PricjffDUOwiSEw==
X-Received: by 2002:a17:902:ce87:b0:235:7c6:ebbf with SMTP id d9443c01a7336-23ac46342d3mr183274885ad.35.1751228176702;
        Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf26sm64300085ad.107.2025.06.29.13.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:16 -0700 (PDT)
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
Subject: [PATCH v9 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 13:12:52 -0700
Message-ID: <20250629201530.25775-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: FoMWh8tiH30ukp0NGJgiOkbOMGgqu0m9
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68619f12 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: FoMWh8tiH30ukp0NGJgiOkbOMGgqu0m9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX3s/byZht3aiV
 ECpBQNACnCP20E2Fkkao5gP2NcVKtqNa6k9S9O19M0fiJA3v4IXSSJa9WCl0ULYobeQPoqInKpB
 PLa6wA2HndTuca1kccAGrCDXf6B3y4gXtmSjT03ut7AZCNDKZETKtL1roNbhZBKBbjTPd/cfpxg
 rMtwiuUpfJK2q8YvsTsRmxnO0Zba+g/FVz/r/sDxp8RPoRfEwvcbjNEirqL5HK/etejvFiH3J/o
 1c8tAwTDonouM/c+3CRhvoO2QcUHikHy3w3FH78k+9pNVbtlP2f+D10i10C4y9FkYO7mL1OE6ZG
 aQyYQ9m/niZ6Vh4uZ27u3QTby8q9xPsgxtMD32UgWNDw8SU7iZMyu3xRUxjMn9NbaKpExKtVii5
 in5X9vub5YpNQeiVVL/AXMUJ18qwLGK5ikZSILVyGdsP2n88oPM77sUja2c7Y+3s0hDW9bOX
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

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9fa830209b1e..7b0430628834 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -349,15 +349,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 	return NULL;
 }
 
-static void del_vma(struct msm_gem_vma *vma)
-{
-	if (!vma)
-		return;
-
-	list_del(&vma->list);
-	kfree(vma);
-}
-
 /*
  * If close is true, this also closes the VMA (releasing the allocated
  * iova range) in addition to removing the iommu mapping.  In the eviction
@@ -368,11 +359,11 @@ static void
 put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
+	struct msm_gem_vma *vma, *tmp;
 
 	msm_gem_assert_locked(obj);
 
-	list_for_each_entry(vma, &msm_obj->vmas, list) {
+	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
 		if (vma->vm) {
 			msm_gem_vma_purge(vma);
 			if (close)
@@ -391,7 +382,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -556,7 +547,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
 	msm_gem_vma_purge(vma);
 	msm_gem_vma_close(vma);
-	del_vma(vma);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 6d18364f321c..ca29e81d79d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -102,8 +102,10 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	spin_unlock(&vm->lock);
 
 	vma->iova = 0;
+	list_del(&vma->list);
 
 	msm_gem_vm_put(vm);
+	kfree(vma);
 }
 
 /* Create a new vma and allocate an iova for it */
-- 
2.50.0



Return-Path: <linux-arm-msm+bounces-62939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C42AECD6B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13BAA18940DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1F922D7A3;
	Sun, 29 Jun 2025 14:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOZOc4dD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BF225416
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206048; cv=none; b=IbHSLFz6cnulZEw8MBT+Dae3y1Dnf4YnfnLrkvbOiNkxoYQzdQ5g6ibd7jlFup89/3gqm/JVfaOspaHmcfDeT2YlxTDxWNc8XzhVplUGVsqFr9TWptUOYilMr3eIxcqifn1OiFxmy3/NWA5ap9gMGi6av5HqR4VktduJAqHRl3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206048; c=relaxed/simple;
	bh=au593a8+7mGZ4QlvT4X7cpF6yg7CCF/F42yjIFbyfCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSJrGUS5qrLUohhghX74HcfEX7jcj7xXncRfsq9ypJUSdM9C2BqUOY71J5mpuiNDAPf6I3clQG1JnLqfmdGz08vEWHcUhSovB4FZqgyeWQQ11U4SXQC3O2OL+UNqjYmIswn/Ws7lz4t15zUmwWOuSk0Bj0BLwKo30/OQYMILTW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOZOc4dD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCJhT0026344
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eRArZHg5kja
	6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=; b=MOZOc4dDi1ck9L+QRSsR4vZJwBN
	66eV4YkdpLb9pYkCICHe++0gI4JQ3qi17ivoNbzlGqQmEq0KZtVhP/qPSAI230+N
	g7I9mBAWanm13+hoPbJcgMEQ/7YbZQNoTbQ8OXftnNproAOLI2vBTNGhX0tEpAWm
	WWdQ7ojNKt7IqYLGfxZdoalrUMTNEkKUH/ysVIOI6zA4LO5zvimkfl0smBD2vfhR
	cNWasV/YbqBqdohcaeJZNvsitE7Z11iw+kG/JqR2DCy1fRM8bSsgXVFZK/+TvpDG
	b231lke2FfeELS6npd506UWJFulJ004DvoG4D6bSLL5fFD+89CcJ8y71RaA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpt4g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4041616b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206044; x=1751810844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eRArZHg5kja6OQg/YP1uRgtCqLo62Lhjfwd+5rkVLKM=;
        b=K742QwkmEUSMsTQpyz64I6xJLey01LLO8jD2CrVRCQ1tyNKPDTPAYC97btWdxsgZY7
         qZBIilw3/cgWtleLJka3N3PqwRc/lxpp10NUnPzCxCcBFauF+JDoVSKPE51YAiYQtrQN
         iIeU3PQmliE7wo4im4+7o7ny/iN/DU90FnVbBpaaX1XWzTp2Zvtb8w4xDqAzFIsRClI9
         gH+NNWf3+1J7zlqZOGaPMVTonAeZ2CRHz7JWYi2uFd2RlnMz6lsbZvk6UkgRe/fKSMXM
         itr2hmXZRc4NJVCVjCGfCdUzory2jkIUMaez2GfeZe2GfE7yPqaIPyLEmfuUPsnCS4IA
         Dq6w==
X-Forwarded-Encrypted: i=1; AJvYcCWffMeRu+xBRVB/7tzpOwZdu6bLm7DJDJbgMYq4ItLlBxAMugZs6RmFR/KMoccvftZfsWCjqLxiT8NhyBz3@vger.kernel.org
X-Gm-Message-State: AOJu0YxC71nCKd3cRGYhM4pO5MUwTPyBxGKMHdCPyQE+QLkSu+vlwicI
	aNP6o4Kl+y/EG7VBIXyRfpbRohRwRnS7zo/btaNy14VnOizWHwkj5GfaHLayrxufKgTAWJMnxNl
	GDvQQLEGaL8dDXubaiJlDgtwhz7v0xcTiZrgMNyDRcRFVSv8+XIwOxHIMqCQoWxJDcHOS
X-Gm-Gg: ASbGncsA98DItKgePYP/Cb7Lwf/q+euq8KaGzVBGUSM0TDSRopNjTiQotSVsmvQRUyL
	YIdL4EWp3Zdm7YGRQcdhBLDsipJQX+ugegA30PlskYTXQvd7SmSro2wiPnlXgbpTUMBuU2vDrFi
	a2CvOlqv7sXDaH8YYNmE7dSOcmAfaiYK3dZHP4bS8XO7oKFZzzoZEx/ezQ9z2pgFKJvnwrb11/o
	ux/uJaVWOwmLO30ORxGaZOaA/FaOLKF1vGQI4LJ6XcMK1EN016wpp8Gs8c59UON54HWcwwJad3g
	b6KHPMe02bR/thtmoiVFyoHWIyCAeSIa
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-74ae3e79e9emr15110875b3a.2.1751206044389;
        Sun, 29 Jun 2025 07:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzFoHhs30uufRxyXEDa8GNhAGcI0a2y/Q4jf783ZXcR3TPwpNn70ssWWhJXCFQV5WbzR2gNQ==
X-Received: by 2002:a05:6a00:8c8a:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-74ae3e79e9emr15110847b3a.2.1751206043958;
        Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bb6csm6705036b3a.41.2025.06.29.07.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:07:23 -0700 (PDT)
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
Subject: [PATCH v8 09/42] drm/msm: Collapse vma close and delete
Date: Sun, 29 Jun 2025 07:03:12 -0700
Message-ID: <20250629140537.30850-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX0pBUZ8ClasQM
 l4covLsosJvp/yl2aPgrfgmLdggC8q6+IEhKAJF7oGFEmtDIpP+N9/m+149mgeOYeiH6UeK+tLK
 Fc2NeJqtBPsdbCOBsQ6CemaFGEscJaFbyljjDVceVAF1pymgtd6homfLiJWYmK4qPBfFNmOYLXo
 W4G8juhvUwfwAX1ZHm670H6Tj0OwlFe1tpBl6IWwTIaYEP4YLi9mlAliOvdck0JAmXj8lKl0qt3
 8+z2anzOXiqkzhDMQummXOULe/wmZP4orACrXoK/EyGtiqXnSLE5e50vAN1LBd/ZfUEr/9LvFHy
 WdOqBJy7+9Ltc26onkB7PVCTiE2rpPLVI+lS1QbdzGiPLZXNUSZH3FLobld2vpo8+f3FhxHf1vQ
 JgtP2vzC6GBciClBGoDYK58XiobR/wFQedHR+sozF5i99xVmeME8TC9jPaBTZJopbi25LnjQ
X-Proofpoint-ORIG-GUID: km8bBjFLe21QogsGdC7xxjFcIQcGwSJ7
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=6861489d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: km8bBjFLe21QogsGdC7xxjFcIQcGwSJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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



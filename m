Return-Path: <linux-arm-msm+bounces-60379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E6DACF6EB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0E9F16C1C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9267727E7F0;
	Thu,  5 Jun 2025 18:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAU+I33u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF127AC25
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148352; cv=none; b=sXA1Zkr3xuzpEM9b4h6pyK2nKt2C0g1rt85FpS+ZHbDVx7/J8UTy4o5O9QivLOWhrU/d3wlQ3L0ultjVeyd47JDbnEF3jiYPc+T0l1+p6Q5/bHcd5PpOUYD83CRiKZEAKpmz2EZX+/P9QT/jbtdfk4n1xGjHJBn34FgXzDD0b6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148352; c=relaxed/simple;
	bh=Xoz678jgKXUU5eflKb2/hYyyho0cK1Uk/BBv29BM5m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgvNHufN06bB8jk0VTMkX5Qc0qW8rFVvMebirkoKuMgJa5JmhrjBxvyMAVqt0RMvZYd7MCFVXMDofzmiGgLpeJ9hH2HoAysWEY1UFtru63PkwGKGp6Cuwez0PoyBXkm6Y2CQ+ZxbBhqjQh6/QZj1h71Li1xaE/l4vng0nEL5dV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAU+I33u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GrJTZ006553
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
	aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=RAU+I33usmA4f5r8pB/+83MjQkd
	nKgsaG2tXLsDYbppqPQXrhFQ9cEOS3ywU/JfEcPn+zjix7z2kjfQelMFU2j74uQs
	WEA/QJWQLT8jZHTTf3FivbTD81qu0lJCsAxVd0myzt53FUz2AGloc6iT/38hTF5b
	zqGtx//1a3B1gKH6HLqgqGVQBancscjVIpqlRmFjuch/EFy0CJ3QZ7AeILzljkv2
	tPjht7o4fWU/Mx5i8oRTR+WHjRUqfQ7ywMMaNclDNB93Q4lXNA6Ji99IQEHSYSI7
	IHXDSCx38TBNVsdCHjhUzCoQ+dGwAewCnnwFGaUZ6ruPo93RoRS3lrqmExQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2a9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23505adcac8so11470845ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148349; x=1749753149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
        b=B1vF4YTPuR6i3yo77dRdAPuhVj+TlOTbgazaNlTRWmRknT3WpPzNF5BlC+MaPkBbUb
         1BS0A7LhEq9Wz1kVrfxWhR9XPtB0RKVmBhQoiQXxC3A8ZaHbcXiovCFPt5VXMIawnNjJ
         Q6g4KybWFgHpqSf9WkXshUTeTvn3kzc4WpKasfNPWOgVYnPnVq2onasYaBN4DMnXwTnE
         NWWLJwYqd6hFfxU0g32VXH0VmG+GuexkiJ5sEKX8NObTRoydx+MtTTSzh4zjdejh11iL
         GCPxnB1BHiaJjZFf34IAr/5wzrY7k0/Rvg6Zky8LvDrODj6uJB3URzFsHtWftgqfa/BB
         w6+g==
X-Forwarded-Encrypted: i=1; AJvYcCWQqqcLWw7bJk7BZIlBFgeZA6rIg0gxJoQR1VUpUzvm2UhldVND6Z7Yq6/nIS+2fvd1wv0uzva4rWJrHgz/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/KcdKReRdE8C9i9FqXyWwJ5XoezhobCXB4kpO4rmjrNW4XpFN
	gfcY6XFBOTiLDmmgrQlhNDzqZz3cOSO8MIJ53fP4VwAHazXXsSvkKcaOp42eCpCv7mXiv431Wvq
	/y7PN/jfTMWV+k+tsNSFl/Cq9IldK/S73+DIxYqW26Ee4s2qgLzej/jLb9x4SVDl5LoVR
X-Gm-Gg: ASbGnctqbm3/VmfJwnUCHD46b6Q4sw3pwv+AQYmvO7QEpdDPrWf+BEt+6HOqILwIqcq
	4sjS8zQvaSfnp6mfXVe5GEzuE2eMtSjJWvB4FxQeMrEQYcS5Pl6E3c+xcc3peA6bnzQsYJpseS3
	oajmFFIsri+acNE5d7Q7Wu7RUiYfClkYacZHMykwL8kMCFBs94M9RJVZez3p+t99r/dgF9Tx37Z
	2IZnCf1+tkbPrOQgCOdnpPeLZrAT08twGmpS3N8EacVSQzozdmWnprwr2nJy0xUDwu/coPYeC2R
	euPtUwX6Yxeivr/52hUJwkXB9IAK5es5
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id d9443c01a7336-23601d22bcfmr6076315ad.29.1749148349352;
        Thu, 05 Jun 2025 11:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZPYl3bi4wrAR9P4qs263RGT6xV2qooQoNsSl5TQxnW+d38CFd1PSGOkF9JdpsRdaUXFkAvA==
X-Received: by 2002:a17:902:f70c:b0:234:9fed:ccb2 with SMTP id d9443c01a7336-23601d22bcfmr6075895ad.29.1749148348947;
        Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47c0sm122361975ad.175.2025.06.05.11.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:28 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 07/40] drm/msm: Collapse vma close and delete
Date: Thu,  5 Jun 2025 11:28:52 -0700
Message-ID: <20250605183111.163594-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bTBlHbOy-cKJTIsotbx2zbl-JufCK3py
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2be cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: bTBlHbOy-cKJTIsotbx2zbl-JufCK3py
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX0vfzUOsRNQvG
 W2etn5KO2EtmT3amA+qhI/loFs0G12IrPfPs9guLKWk+Rns2oBLfcEFyyWtNPkn73OpgKPEW4RT
 MNkHkmTxZONJC2RTtfmo/u+cbKdo46zMPtotladQzjBpd9PQTb79KybEpSziDdnTlmcHNqTk9cx
 /E4IPJTrn73RwpZ4vxqPJfkVmrR/uKEGKClYQDWyeUJb/ZdUhydM9pNwbmg8mM8UicQZIl1oGay
 lDhBsbNcv718UDFSirZzryb4GWNvJIdbZxRTrlWMBBAaBS2QGrLgTldMvhNdmX02tAiZdlosaib
 pAtW5n66yKliMSQHuVQpytmLr0l2m4Q4/4xi28rxJQvBFJTYII9enZadmScsSkEGL52zoeako3v
 o+KxSCry57nH9VLzt6dCfwyO3lDx733MRYeGk6vJ+msZZOJCchlRtAHf01SBXmZTbNnYi8UV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

This fits better drm_gpuvm/drm_gpuva.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 16 +++-------------
 drivers/gpu/drm/msm/msm_gem_vma.c |  2 ++
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 29247911f048..4c10eca404e0 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -353,15 +353,6 @@ static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
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
@@ -372,11 +363,11 @@ static void
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
@@ -395,7 +386,7 @@ put_iova_vmas(struct drm_gem_object *obj)
 	msm_gem_assert_locked(obj);
 
 	list_for_each_entry_safe(vma, tmp, &msm_obj->vmas, list) {
-		del_vma(vma);
+		msm_gem_vma_close(vma);
 	}
 }
 
@@ -564,7 +555,6 @@ static int clear_iova(struct drm_gem_object *obj,
 
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
2.49.0



Return-Path: <linux-arm-msm+bounces-62521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F065AE8D9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93AA6189B7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46862E4259;
	Wed, 25 Jun 2025 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ui1VBoV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FC32DCC1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877911; cv=none; b=FGWry2IvGJjhe+fLl6OQvCCln1OTwAWFUr9wah9rCW4vf+iVSxKcm8+x+uUWI7WGrpDdeNL3XDMHwhI2g1hDsSFAGEBqkHnUMbUEK2FMhLmtLCez+FM8gpQ4InNS4NvSAe6f+Z2OtpfexqcS7ydcPGkeqQ9mMyZkAneUf0K7xOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877911; c=relaxed/simple;
	bh=Xoz678jgKXUU5eflKb2/hYyyho0cK1Uk/BBv29BM5m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgtHMN3B6zZYQ+pB1LLhO8SPCmTcerN/GTYfZw9aQ//fOxeY6lNEr97SU+s2DxX5G+CklKd943RacvcKi6M9w6nSjqjqnnV7FaTK/Z3XdnzUygLmF6MCQXQTJqkYlXiB4U4qXG9SNlGOBcommUN6VWFO2Cf/5vSymStQIxAkBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ui1VBoV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAgeh6002957
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pRucYDqGv/m
	aZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=; b=Ui1VBoV+IXmMp6fl+lfP2dmVQoz
	K0nEfJCd/5Zr4mZvaokKx6Fii7Tyn889iyNEhz5PDYfWySxA49w42Z7kHSlXhjTj
	p+TQqBv5MqOxoPx74BjGy0of1mVxkZKb8F5kS4bF1Dzrl8tnl5e7DC5EyVlVQJWX
	cJMEv28as7h5bYJz7ULR7h/T9U8U8uP6b0152ZYXx5MLp2LdCcXRyDlr54LFNpkg
	YDR8DApCPgQZzmoxNKNeYZq6Ec/BC3vHJO0Jx67tTWWcwsYNjSisMtmLqt8x771G
	Dc/0NXGyfZV+cCS3AWSkOTctvOQbTaXLSeUvbCaS6OO+74BA29wSfJIu1pQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b655-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so214252a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877908; x=1751482708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRucYDqGv/maZtfEL5JUnKr0yOuvQGJ3l3EY7Z9RO/I=;
        b=KmeAWEdqNjdXCYASj0nsxPQNtovxNltNxqZp7M5y4DOuosiAOCYer+8XErUy/E9TXO
         wVV9X/0a5MLOCZuYlBUetOG9ivWTO5U6kJyL1jJtkjEN34WJo6YtPXWVR9VNf5ZHDwha
         2SovzKipIhyk7JJIjVDS8GF6qKtvikkZAXk8OJwfFANBujyH8oILJ8XVC7NvZmjq+caQ
         f9MWUW3mxTE/Ut0eYXqztlyyr8HxfNn+wFJLUfP4kxmiFHfmHu9mGvvMn4KYx7Jh+LWe
         QsQPeRMfUGD0pHO9LwJtnJUyEVZOAeuXQ2pct5gDRwz9rHhT43oYMN57W3Ygtjv2Vt1V
         DGLQ==
X-Gm-Message-State: AOJu0YxCSuNevRu9tOc0oPnAVQ0j7uKIMoIs9DXF8cSIorTBHA6mvlFR
	x7vA+H5oEpqLpF0JnEWC0KO3MK/SH6qCOQxXoMG3UFificBesZP2DGgpT31qF3fbJnIQGAl9z1P
	7eVQmoLxjLE32khC1nKM+DxFwgcMZ5WIv58QZwweLqMWsGq0U48f/kD2180YaHXOew1SV
X-Gm-Gg: ASbGncv7hOu0SN5wTvcI/u2xzJ7IDrh6Os6fbp5sj2yaDc2iqT1g7Yak/l56jRPjh6u
	6WzXuWSpiMd8E2ltWAgcLl/iQb8cWlE/wEYmRxhPitSG8X2iY+aIDpj5NBAPUG3nkoSI6nqNDbV
	JCg9Pq+ovmOeI/y/i7B1cBIUNMfQGh9jL3oqn7fhx3irQoka6FUEvFpEQyeGysUkJp7fmz+ZcmW
	wC8vEgkNkMuJociXUq3MdhWXFubVIZR82H55uGTUzgP79rq6LN3rTImjgAtpuEOBvkCdpKKyG0h
	Eb0ha0ddkCLGQEB1OhIS2CNPEdaS9XUZ
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id adf61e73a8af0-2207f318fe2mr8507913637.29.1750877908101;
        Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOvgejDLBkS6INLNWDK/Gkek/+S3lKYyWdUsJlq2UMYP86RfIoua6q9zR3X9TSiP+SVESMTg==
X-Received: by 2002:a05:6a20:2455:b0:215:dfee:bb70 with SMTP id adf61e73a8af0-2207f318fe2mr8507887637.29.1750877907712;
        Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118f7d5sm11937530a12.12.2025.06.25.11.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:27 -0700 (PDT)
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
Subject: [PATCH v7 09/42] drm/msm: Collapse vma close and delete
Date: Wed, 25 Jun 2025 11:47:02 -0700
Message-ID: <20250625184918.124608-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX20kRk1DOoote
 OWPSoXXHQ4x2UXoUYZRMDM+8bGGCTEc2Y9jdQtxOHawbHDkXK4G07Hj1gS5vroaU2cR8j5wZHYE
 nDryQSoWKYeK6jnQLWJuRDrHtmoR/YL+XAiNSk+5fWBR5rNal1pkH/mrCMVbvXZxmvpvB9nS6WX
 Ws6KEL5qEXke7wdlm6/nh7+HVYlO/Pp4tRNnsOxS2bZBIImVwcXySL3P9d1In5LkCdd2Ftn4aCg
 8DlRwShcQ3CnInjsjRM7POWpYNVT/5m7ZP66EkAMam7VbTHcZdSWAwN+uxsebSaJDVMhQfQ43Tb
 fr0Kt8Z90M7dnoLgoBSH8EiiEWaIVImxWo75VLpTxzPj06kzKuuyHyLDaCKo9ar9MDPP5Y6tZQ9
 IU78TIwP6XPMAIYQnhqHSShEXSM3DY3sU6UI1vY/HMmsqAe3csa6O7K8o5oFwRS2DkZZqqL6
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c46d5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=RIvuzEnNBJp2qadMtJ0A:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: JGxRdN4J2m8VSKSKxMZ9bXmx5yAe4tOk
X-Proofpoint-ORIG-GUID: JGxRdN4J2m8VSKSKxMZ9bXmx5yAe4tOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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



Return-Path: <linux-arm-msm+bounces-60387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0782ACF70F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C93189E454
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FF4280A22;
	Thu,  5 Jun 2025 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLDwzUCy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723627C150
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148374; cv=none; b=TYcHxgbdMcNx5bVd27lgaFYK/o8OSW9hu7rErZtZgofPv1qELbLuwBpnZ/5LIL5YFuu8URkrwrqmUnGFLS7CyHR37mU2vjvszL3yII3mmvfZGp3FzKT45oj8KLdjWWNshNsjMAUavu6w2Vx7yuqB4Ipio0s5hoC4ivuf7FQMOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148374; c=relaxed/simple;
	bh=2jcccFJXFCYh6q0iCZXWcRWf5w1lUItpk77t2RSn1c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8k4pmOZ70uAKia/bD8ap/6URLFMyFo9w3qgVwO+bba9+uu/sHOFgKNBVib34NYDUuUsL9pnLfpuiRWwG8gJZ74/NKV/yzy0krX9nlrai8NI24qoZ3LlsFfjEdR4B4AVSq0xdngIVQmbBmnlgWmxGWMS7dOGsLXYG94DB3egoDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLDwzUCy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559dR1R012867
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
	xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=oLDwzUCyVCYeLYOHG2XBA209dTT
	ReThbQhzhxZSY4hH7BkyN+uKBchW68D7jC2DHKFOGc9VT+CWaWW6x2XIMHHPM1sj
	C3PgRM44WTpZoRW/bWD/+AyyiofyH+Cf2A7FE7pvAkynok4XyfWUdXr0QswTRCBb
	1xW01ojnVMoCvmzEOJsq2tuMFCCsssT09JwbgQ4/I1AjvrSbYf62U8wpJrGhlj53
	m9Qjb3aniJJsciAM02OlBWI9MxF1uMXlGtFlzGKJoIt54YIYoxoYAh70LhS6DyjO
	UiR3jDbHmkbc92Q9vx5ks2zFoobl9kKLjh3f5Rrdwnw9mwXATV/LLTf/QAQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47202wg07h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2354ba59eb6so18405775ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148369; x=1749753169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
        b=cbK7b6/4kOrstKqCjloiY47bdhK3d62xtmb7LA8qdOprE/Kyf/ZK3BIzTZWFmYbSVr
         nXbRubbVLLdwGIAV7rGC2YTIk55IvBv0/ZUWrns6hI5zhODafyGMjp9+38rLL9q9lshR
         1ZdUSBfoqQNpNdqAzuC4NawvPTXxlUyutWhS30qtI2YaoSJ8SwzhRFHANciAVSkir3Bx
         wX5q+68TjeZe9SPixN/7kimd0jpZmZ/5nSEbswIGyDxForNAmEZ0I/pIsYh5hWkIkN0X
         wdDwV1gz0PG4RFVQIac1DXXVrBd5BhJ75VKC26UixNcQxPU1kx1BgokF+F6s/68Rv+8a
         /kLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIn+aWTSEn+X6FMr2RjoRThsttTj3C2T8EKHc1SjfeFK3WQiOxILQg9odCmWJZ2tBfy9OnEG394p10HJ8b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2grXJDyCHaMK4PRXuTc4NBo/eL3BpLlUG0+bnmkt6qzhhbe+c
	fLxwqnlN7zaTavOk5Vurtp7n0Sp9C6hTDGq9mQHqX+5aViN4j1KKuk+tJhxjkpMT946p9DXuEPV
	YDA+NatRjnrik3KDlbpg19g1zW1sIgosRz9mFpZicp7CgWSmreCBDrozgAVtcfNTbD0De
X-Gm-Gg: ASbGncu7AIzNwUw5xiMansuGcHu1wY9dfkjAplpce+2cutW53J1oh6CfL2YGYbahXTY
	is67HKLkXVA2Eo96U+pXqvCW6b95spLwXLCycqh9exOacfMVMDMF8npkKwcgpheZd6vYKsJrM5Y
	C4dlKrYsjROTHjyfHsu1Vrob7NYJZyWgvOtuJ4kjo2bEDM7Mzx2bWlAbpAlbqqUmXlmT7SL2QRN
	AqnTkDxNN5BefBJd/f4D8Vs6+A6I+SeBmuzehXXOfB7Cp3jBm07cf+4ew9JDsHDTWVIbItpLrhO
	Eus/woG6V3rLIpyhgEsPzQ==
X-Received: by 2002:a17:903:2392:b0:235:1ae7:a99c with SMTP id d9443c01a7336-23601d712a6mr6064985ad.32.1749148369020;
        Thu, 05 Jun 2025 11:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYILqDVPmHZvxHv/qNui1W3IQVf5p494cYJFRBE2nev6jIvXhPxt31NUKQzkFHvGjIuiZeCw==
X-Received: by 2002:a17:903:2392:b0:235:1ae7:a99c with SMTP id d9443c01a7336-23601d712a6mr6064655ad.32.1749148368674;
        Thu, 05 Jun 2025 11:32:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21802sm122518805ad.215.2025.06.05.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:48 -0700 (PDT)
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
Subject: [PATCH v6 14/40] drm/msm: Split out helper to get iommu prot flags
Date: Thu,  5 Jun 2025 11:28:59 -0700
Message-ID: <20250605183111.163594-15-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: azNrmgTH7pHV1v8jATyMRaPFS0bwO8sW
X-Proofpoint-GUID: azNrmgTH7pHV1v8jATyMRaPFS0bwO8sW
X-Authority-Analysis: v=2.4 cv=Y/D4sgeN c=1 sm=1 tr=0 ts=6841e2d2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX2t7M5oEacp2m
 yWfryhD8ge8gPLvAMsGBxma9QN1LpUdfKaOtDuCOy3xtmbBbh7fbHFFlM3scKp4CU4sBZLsHRrx
 br1H/9zkt3x+RaxJK8a5Xubbt990JXa9J+UD/13vzzTtcNToT9pHnWdkqa1I5Y5IgKpkpzk8OVJ
 8scBueMmj001gb9N7/X2luplsS4h1PXJrW7cVo26y8jG2ed19p/7sWQ/rXRFmRKUz8aDVefBI3A
 3U45ipXzqxNBPMKJvay11+Flucc8G9jFco6yox1SGYuK+hqMM7/pOF22pnfx5KqGi5pOe9wMhkW
 Ikfxsvi8QeXv8Lz+rDdLSWWZ8KvPwMCQ+r0TSQg5R79X5Cnuic/WdkRhPkqywn22r4hxuEUyyE9
 k9O+48b6bb+4vmkXy2eity9t31x8BdgabN5+VUZkFXFXP9WI8KgsQnwoIETayDRhciHX8NDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 87949d0e87bf..09c40a7e04ac 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -466,10 +466,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -485,6 +484,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 557b6804181f..278ec34c31fc 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.49.0



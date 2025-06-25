Return-Path: <linux-arm-msm+bounces-62527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA6BAE8DB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F84A1BC4F0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB7C2ED86B;
	Wed, 25 Jun 2025 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ2KRNFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A382ED163
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877931; cv=none; b=sdUt3DnOsFX223q1rNjoXjIaXeaxBY1+/XqUx3HL4pjx09sFMet1SwyIYuz4vSU83DAqFFVylxMx+a4Xp02NqpppJYdODmSUHJvn7KKqs9IrVPmLtAZKAh7Ro9Mws2hGOy8gbVdrGeY5c3DzlnLBciOcZF7rnSgr7lkTyk2SZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877931; c=relaxed/simple;
	bh=2jcccFJXFCYh6q0iCZXWcRWf5w1lUItpk77t2RSn1c0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3oQ83Qsp+LAQqzXZBcMiOoJVJcPQseLgTgZT8iUKRC/qYuhKL8sHT8s0trT8OfTM36xgdBuYdmBGD423He/9sB6vCrop4I0aq9rfUkNaajwdRIBTK3WjL/eWUHVXf3pnAuIw4E9MBZQl9dtDsjHdYZRzNNOBM40KDBlkMK6ntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ2KRNFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBwGlQ020750
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
	xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=HQ2KRNFVzgHdRLB15LaR2n7rCIq
	DnEXyjQAhx7gJdmYIYh2GKjQ72x1vtNs1ah96RWUMn+XgPLDT16NMrBy88B8Dz19
	ScTYonCVUsUfs82L6rHD7zNJTcVlICjfAeaN+pcXrDvVvzQux9XOHol9Vvaw/JSX
	VJYvdAhlwBtE3oHVYb1GffkqyDr817jEyY92gnPcQaGcEV7E1kVvh+pwxCWxeFWp
	wXQIiPl3tmipsXWYY+kLceU9u64Edc9V5Lwwxdch5BlJqfQ72s6MRGBqTnna8T7q
	JZzhttO741kiNWreYCw+WKokD24+5RumYjxNM4/QLsFbdzmv63xfkro361w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2349fe994a9so1236285ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877927; x=1751482727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
        b=YsHXul2dZzEQvEbNFQJlxtDudlZEo0pF9NkBx5WTUgWY9HqtWpRkPxN3HL9/zMEhB5
         4BZ6S6RXm0nV4UBwyoWlTghD/u05edNQ/DhEt6DEwJbS1lEu151mW+bZlmd+AilNFNPr
         9XlT93kZ514ksWhvELR0URjS8vy/ZWtF+NgSvevlKNyEN4810TPHf/vevhcw9z70bu6T
         yox61X3MZPVczOTrn/vghz/ZiEvj3gHaflLMA3tzIXZPJS+vSgHdkLQrKCeUK6gCGLaG
         7KjO0b1gXiH1oAp7L2nYV+yz/Qennu+vJUpTCH6k86XhXwQyBHiJWSHzhydQ2AkyxShJ
         Aqew==
X-Gm-Message-State: AOJu0Yx8/s7jgVhIZBP931eZZrVD4KgHQb5CwOhKfANWaGxg9evazaVk
	ob4rBZ2CbDeDusoM8da/eQm5hDe/24zXJC9jZXAYbL02GX9Z03OSWgTH7oSSiyWlLezCKEWfcTy
	3bGqg4iA74A+dQKddFtOMKw5j6VhdSTy6K51Wu4nvLHAgRnBDLKcZc3NCLLjQIVrcwFGr
X-Gm-Gg: ASbGncvI5FRoIWuVWCz+KvS0xY3o0G8GoOZyYFBpPPQGrxpRtuo0I/16t89sb2jlPlh
	CthGVma3vh5CtO/yyhdFp36keMcNgQVM5970Ddplexot3Qm0T/entOnSnVXStbbPY0ISeuwl3ww
	0flNHmoBa7WMbyinCRw6PKcQ9pOm2Vi4yu1z4F9K1ajentW2T+rCobW006EjnxguoLrL5m2jvrv
	p4PrpJqu5rHAuVtzhiZTfteO4kOnaNr8pFy2P3wfLIFakHG+S5HMeVQFxi6KIsQ2cnnpLNbfjXv
	vFDoJlMOjQNhLLHglUN4+bj7fcToZXTJ
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id d9443c01a7336-23823fe14f8mr72556815ad.21.1750877927355;
        Wed, 25 Jun 2025 11:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFuXPf9rljBk9fO9uMHuDT5eLJ/AwD6fL7woWfRkVupOMVq+NgBkPNYRPET7WG+oVc3xFc5Q==
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id d9443c01a7336-23823fe14f8mr72556455ad.21.1750877926896;
        Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d868f878sm144060625ad.184.2025.06.25.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
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
Subject: [PATCH v7 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 25 Jun 2025 11:47:09 -0700
Message-ID: <20250625184918.124608-17-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: omNspgi8xgr7HD3r40fXzZhKyBBoP5Ip
X-Proofpoint-ORIG-GUID: omNspgi8xgr7HD3r40fXzZhKyBBoP5Ip
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxWDCEQvo3Ubm
 58iV8CMK6YC4dZMgvGBBGljhXaHXYzdwwLc15v8b0wsmZydHRM9RSM8LaOzoUQA4g1YdmgtLPuX
 mJx9VhSnYsJDBv0qRb8HmFvnoEm8BPlpLz3tIr40ixKM3dShzRK66mLwptSaYRhA/N+Ki5s5wCP
 McOgMAtjFbrqb5g0CA4tmdfTkvULqsQ4bYpI8I23zG70TOSn7D76EtZfqhxl8UNkraSsJOQYd1/
 GtECu/xSfj5Z67GTJnqxxEUujfvuqKtM8wWj5qvvxo6Rd0OOCEFTTUf7kN2ZidHHPRgqlWmmLiV
 vjHbTQzB8MVSa5pRuvq6Mlq2vvIbnjvYCs4jA4OIJfh9eLYoX7houtC8aF8C83LNt+EFM/QBrC0
 NgNYufSu3H29op9CmdY9QwsRqJ1yw0QjcogE61+HVYTK7jB4pLu8gdT0evHmkAFw0cHaQdW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

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



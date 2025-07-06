Return-Path: <linux-arm-msm+bounces-63847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10EAFA49B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 12:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CE0A17B201
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80818209F56;
	Sun,  6 Jul 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9HJKwee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B41E2063F0
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799051; cv=none; b=rVQMiec4RS5LWM80xx1IU6aLWFRVyfTWUlMwQvZBNx9iDnxAM8sRpYKO10Z7GbTNxFPsod59hz972IoKDEnQm/P4xKOCaPRgDvd35iY2BlwHu9BHStwDuVRSvljuky1M4kYKel3K7IRQ4eyk394YBlsOB6PzTRsElhE52xRKh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799051; c=relaxed/simple;
	bh=CVAxMJ583rYEGC1+K/sUzP+WPoNKZGaqzP5oZqg2sAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CwcdC5wFry13nYj6ob+B8u5NZYbX0jf1una9ebPciK3d11sS8QWialfslZJ6Bi4/34FDkRqT9h9O+8pTSBYjzkWBWGmz2G0AfnKxpPZxHcXO5YnV6Ma0hmWRNfYT96kVb44PKqQWCjr5mvxCYyknxB4hQVW2SV1k5WlH5eZkpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9HJKwee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5669Tfan009792
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gQwF7BjTXtg7965OybbDmRj0hZykpVfXE58N/V76Bys=; b=Z9HJKwee5TLv50Zw
	jjBRKSb+twj3ZK0Kls/ivOxeaVRfH3rRcJT59qXJXEvXLfoqGKhRGYEuHZumMNqt
	diUZwR3TASXONH00f5XJ8l1LvHs+jiAJvJ/h1U/hNbriShmnWHo0WF/Zkc7nWrh+
	cpnGOHZT1SkVzYLnmq21We2O6Uo35xeulz0PbAeqj4x+DPZedtyEovdNT8B4Nv6P
	XIjcUnu0qKcXJUr8CYzHNQXQhCIkFUBv8dLvF1e0MZQ7+xgbyTfow9aF5+DSFRVW
	08+LEt6o7lSF3EXVGbJn3Kpey/9iAtYwWb8wxnjbpbaWtfR4QIRqEZTInWBCIoBL
	tqq+Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv973f3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 10:50:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d444d21b24so369873285a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 03:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799048; x=1752403848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQwF7BjTXtg7965OybbDmRj0hZykpVfXE58N/V76Bys=;
        b=GgZrnS94cao/dV/pGohYOCRD4T5DzlwDJi2gL4TNhA2wg5WtzWFi/0HYvNdEEyps7d
         r15K/qG4RPOKuET1f4uNJfqRtWG/asJNByl+RmHJ5XU3wmdxlaa57q7DMTLLVEpgNdil
         iyRUgK9feZnC8P8Jn06h11qT0c21jLUuMTbvn1StCm+7ipcVafkGi1viGmzAG1bf5ztz
         FBoLnRetqtXZGh0AJaE2hlJfA+SPASUILHRa3ER8P/+2+/eh15dTC9ygssET+7pKosgL
         C6UvjKMMuH62axnvbiV5C7LIO6P0rOcG4V8V3M6PPS86p2+JPoyU4rwVUQ7BwiYKEk4r
         NFgw==
X-Gm-Message-State: AOJu0Ywlz5NpBKYAckRVcy9ZibyGNykJgg9SQfXxeEE1JwXpHuxYNzgP
	swbFL+2zQz7sKD+UbuUeG+H+NFHIpoMO3xqQkmNXzNYvZRXWMz6DS6BmA8SKdcFoy00J7AmU603
	cNpf5DWH5D4fmAt+lDhmql+MRMeDcUjjU941no7SNyN06KcEznywxBhCyHcAMHX3XcIsK
X-Gm-Gg: ASbGncuzORrWv1MWE5F2Qvc/u3+aF1SmehCp1xJ/3MjOhT0gFdaUczMHs38UplHflrg
	PphA0INOivYKsyXlCFvrEymln/ftJ9LfOHs2JM4V2PFldHTc0smp2RFic/c/LcNLCWwZwnRhkwS
	N39oFbpKqgphaVTS1PLCKNAqQ42hsOwzJ8QTnRMO6aolh6Fvfi6u+w7284nyt7inPI7B6k6CAno
	+mQDaH1wFgak/0AVuBlXUnPW+vBdOmQlY4HoiTELYbA7s4AcnjTw8rLBy8Z8qGYTJU/+BuTtVu2
	aqr467iMrdfmF+tHInxBa0tpjGcQp8uLSJJRNM86YOEcmZabaWZ04id0Gr6FAwoKXDCYUsGDSq8
	BoWFCPDBg4h2/tLXcXGucWZV/JJXeqt+sm38=
X-Received: by 2002:a05:620a:7014:b0:7d4:53d4:578d with SMTP id af79cd13be357-7d5f10fa22fmr697622185a.36.1751799047542;
        Sun, 06 Jul 2025 03:50:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtyZ9ucK7jsORVaYGW7av0WIAu76YoLf2T3keQ5iRHn3mdAtAO4h06LyQ2I0lncFhsncDHXw==
X-Received: by 2002:a05:620a:7014:b0:7d4:53d4:578d with SMTP id af79cd13be357-7d5f10fa22fmr697620385a.36.1751799047134;
        Sun, 06 Jul 2025 03:50:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:50:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:37 +0300
Subject: [PATCH 2/3] drm/msm: stop supporting no-IOMMU configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-2-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1053;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CVAxMJ583rYEGC1+K/sUzP+WPoNKZGaqzP5oZqg2sAw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUB1+xuuKCza8FRxLDaIpuk4/9nNPUhbOJSM
 jVRNJAo8N6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1UkMB/9kTumwrySnCjd4VSt41UeB4BUW/u21VLeSik9PtHt1VuBLn6bQIhc2174IcmTnc1lQ0PQ
 SP8DPvssNDhjdb25NISWlpA22w5hYNeZnoBcwZ1hspvX01vSaHDyavJXQWSsfQAruHog8hEMsjY
 K+USDp5d+IN6DrP0nM3EJ6/beHJ6aDOyRiM3l9A5IXL7B3Xhe1LS20yXeokJ4aICVQf1vyfzSyC
 cvagS7NZpMysbO+OeFMjwPvp+N1nXsYGzKCR4R7UKBWs9QeyB/5afJLgsMOCBq9wNURns5Pz2od
 UJXe5YkdA+va3Df2WP+dyqGhfFsDNpcvDBspBEq4LKD/SDGD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a5509 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=bqLZAy-zUTJ7f3hpqcwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfXwA6CANafaIC/
 l3kOJQ3LlCHDxtbv1pHZXNnV+/8GlCiWsN5i9bQpEjTwv3FKQxODqkMACKgt5TnQLcL57PVqPxz
 uGFybmEIrEwmeVHhFrbzu4yg0viP7GML8lf3tK2ngiYKzCAwQscn19uqHNX6lkzk8oweADX9pPB
 ZEbxHsudYzjgHpsSZi4vnnpHzPTf6B5TB0m9s4YCTsifaecDg5oci4gWrwR0jJBALLG5w2o6uOv
 Eb/5yeXN53FkP6AvzO6l4gRIU4MMKiGYFgpxRUeg8Mrxt/tMHqkQ9dI8IEqoSrWXCBr3NRtiMPU
 rDYV9LFPDNZ3sdqJusAbZ3jjLQe5NOSpd0mhC0XoOLoortcCadplkk0PDePkcJ+ytqRSGeK/9wD
 +oRZAfD3SsLPmGiljWuqUf6R3h2eWTrbs61LN+c6SvCJ+zTmBmVFjEoM2ttBTvCs6sGe2Kij
X-Proofpoint-GUID: YThfa5oAcbbNDQizq4tdUuUa5pRArY0b
X-Proofpoint-ORIG-GUID: YThfa5oAcbbNDQizq4tdUuUa5pRArY0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU for an MDP4 device.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 6889f1c1e72121dcc735fa460ea04cdab11c6705..2e2ab93b0f6f6a462e99d54b33da6dc21b1e8435 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -201,8 +201,8 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev)
 		return ERR_CAST(mmu);
 
 	if (!mmu) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
+		drm_info(dev, "no IOMMU configuration is no longer supported\n");
+		return ERR_PTR(-ENODEV);
 	}
 
 	vm = msm_gem_vm_create(dev, mmu, "mdp_kms",

-- 
2.39.5



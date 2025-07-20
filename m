Return-Path: <linux-arm-msm+bounces-65799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07390B0B605
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ABA63A6E4C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9EB220680;
	Sun, 20 Jul 2025 12:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CK15wmZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EF121578D
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013862; cv=none; b=Xr3vflBZlazfnf1s9Ig4woybPD4rGFo3HdqKjE5eUCl5mrPdjCdXifOZDxIh0AhtA+t8bnbKylOG2wgl7g8VySgtqkMDzOC9nY6uytoMT3dvug0aRDA/dgzLJ6CzBCC6iVLJqf0737LyHciFIm1Ulh2CHh/IpkeEmahfMJ6jexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013862; c=relaxed/simple;
	bh=wqLkCf4B4+rAHo40MJEHOqWO43efxrMMyMYz8FlTqtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifUKnRigyhDG5PE7LV54enEBZyIs5zd/rptosLvqQpEKw5Q5NO/ndPhoPDTaj5V7JemjV/Qw9pAIhY/O77njZhSwZakQSDSqQtDb2hHauGqyiVX5qOHLNoMAg05iNBA6TZXmUghvuFzHoIgJqI95zKVhK261zOIMkq13ojq2ih8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CK15wmZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KBGGaT024975
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBmzzhW5Jj0p8WIW9/VlZBWqiN8JQGD2ZD52IVaRVEk=; b=CK15wmZjwLqVxFF+
	HUoGDkBx2r15Oxpj8YJuVlT5KgPd+CVdQnGrA3QlXxP75VuQoymPj7Hb0Qr6SgH9
	IAEZRMKDhNOWQau/kqrm06mIB4I61SsEBEAVjl3AQ3uq2oe047iyzR4+/ogMSI8S
	Oc8hDNwOYNFyR11olShvu9ilpL/auQ1VnO+p/J9bkQ0Eg9x15gwmh0j3W+X7Q3KH
	H+Ts4JuRVgKv4qUXKVQOaCM8YIdGA4BuxIz/LM/lpkjCYWKCQyw3EiaGji52jKiM
	s8Bfx2MLDsSJzUOYSXSZNOk1SEVOdsZtamAgRDk2IcrUt6lmr5vGGrePKSrhdh+9
	mMX+5A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vt5c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747ddba7c90so3001354b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013859; x=1753618659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBmzzhW5Jj0p8WIW9/VlZBWqiN8JQGD2ZD52IVaRVEk=;
        b=uVevTdQELm0UbFqQWrLjyTqlXNAMbxbPMW0W6i0yS0ZpSYocyNBAIn0khNzKB2XPFG
         W8g6Ji8ZK8bsTleGDrWA4qS6O2lYt5XHEzYTdEIksQXS+hvNfedhpGYYISCTziYdqa4o
         NGM1COibFM4gOotrmkwyOoIxpyxLiiNKNbulsk40vPzTAo2kKxcQnBTkgfkGmgPjU66l
         8uMT6SeuA8bbwaFIjoxiGD3cCST05Lt98IJFTMEePCbs4P4IiR4OwdcG58S6+7ejmZ7N
         lpKS0eCE1UADa1f5W1Y0vhQWtQm4tIE18ndFMS6vccpBtllXQ9XjzTDWsF5l3vjSbnVM
         5YKg==
X-Gm-Message-State: AOJu0YwkSHm0Q1BXqVX3FvpTYYF9jcxx9Rvlv4dlvwJpW4KXVPXtWz6r
	nfyoznmA6wZBEJoMRwL+KBcCPlM5LjePTLDyoOWmCKR+vFrmOkZW4OyUoJ3vi6YsFNUdrtl0CW0
	y6PguFiDdckZS6mD+3d5S7YSpDvpGfYTH9Tfi8cNsfUgMbKg2VsbCNsANLwtn99lhP4clUT7UTy
	Ba
X-Gm-Gg: ASbGncsQlr5zJgfLIngs1eQseSE8y7khOtsKSDNWjP1ekTmdOTo3tAugtnU3tTaDQn1
	OjARyiDkf9WoNzEW5Jx9JL23QSiOHyIjjV2Bw6oFkOTCEyE8pBlDCkiweLjyavjk0k5EYv8ipZk
	dp/McbccGiGoUiqex3r48Ds4kUDRFgcsDPD3r5+Mcmqs7A4YbLEtl/h9DcQxsSwKBq+Tr8NQEsJ
	j8tIjcXTswClB139CyZKsda5bW8hlGygfM3M+AIquWLNqd0LcvPG4+bj/0cJweSZqbcD00hYLuz
	FzEbfhk9nc+4P33YtkTRI9lzWNKAxDFKu1Gn8f7Prp+/y+TJzy1s1h+v0ZewWP/Z
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id d2e1a72fcca58-75930138e54mr15194870b3a.18.1753013858937;
        Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHky5Ub717uk0wP0u9f8RtsuBSVWNnbbl9pWx4XoUOaKPKD1lY6iSnhVS3KCoxJyIWeda1fcw==
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id d2e1a72fcca58-75930138e54mr15194831b3a.18.1753013858492;
        Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:38 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:13 +0530
Subject: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1263;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wqLkCf4B4+rAHo40MJEHOqWO43efxrMMyMYz8FlTqtg=;
 b=57s3/rl0XfByZyUpDrauyiUmLfsidvykGjHJF25PhHK0hs0Hz0klsQf6cNk5NMPG4Gw8jnW4b
 RIB6TjQpayICXoNmtM+GNdsFQFkeP9cvdQ8ia7aHmoGMGigvy0nd2ix
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687cde64 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=_nbzAfXQmFRcFNHC6JoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: -EaUv1WU_nra5zXGw72V6lLJ7muL5PW-
X-Proofpoint-ORIG-GUID: -EaUv1WU_nra5zXGw72V6lLJ7muL5PW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX3mvLC11AgfRO
 9wo6GRNSHrEGjo3G3nBgx+vB32B7KOQkrYDvHwxtNL+KK/yqQnCywfPNxEVMB7XQbIJO/uIHuyA
 Y1HnTj/Z5L8uEN9TNilIzCF5C/tydtBkdFh/2VJmOSd4EmDszO1L2O0Bp7INV495NGc1pRf8GG7
 QXl1uo857wxYnMm7R7YpsfCxQ9/BfyvMUMVMRP7hnRb5A+rZxqx3PXpMFFoFA2anjFiO2a3xT5z
 3EKaqEsONqQIWucO1rHH1/KZ7v1lkpfXzT86Gthp9yQOy5enk9Qm5G5Mus+N1G0hgNXiulwdKeJ
 bPpEvz2oZWRd8nAmf8oljI8Zw+AEPAYGHVFioSzuzTMRqEmpSpiAczRv/fYwTqEwksmg1vi8+Lr
 P1zOuGBHouyMOYgHYmxEir6EbQwSRqaBil4yNwd3l0i/Il+lYlXengAkqgFOfRojQRKh9U94
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118

When IFPC is supported, devfreq idling is redundant and adds
unnecessary pm suspend/wake latency. So skip it when IFPC is
supported.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include "adreno/adreno_gpu.h"
 #include "msm_gpu.h"
 #include "msm_gpu_trace.h"
 
@@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return;
 	/*
 	 * Cancel any pending transition to idle frequency:
 	 */
@@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	if (!has_devfreq(gpu))
 		return;
 
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return;
+
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
 			       HRTIMER_MODE_REL);
 }

-- 
2.50.1



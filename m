Return-Path: <linux-arm-msm+bounces-61243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B233AD8FCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 16:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00F127A71BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5A018EFD1;
	Fri, 13 Jun 2025 14:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pay6qyGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC57191493
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825714; cv=none; b=XCLL+dEtZTnSulyw5d79BqYRUZwK3uEsXUeIJGkr0DtLFsycX5vdESc5RTcMx6Gx2Fqp40qmLwHuo2xEgYpA7mwwV2mK5xaEvcjP+YoHdwyBGnZaGuPR2L84VYo2ymj9i97eNIxU+Dxd6qv+nohcnwLejzAaoWnM/Ogr6OpFjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825714; c=relaxed/simple;
	bh=xR59NA9k6u+fku9xip3VLu0AuEwpmUQHbSWP6W9jjqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKNu2V6oF9nMtz/Vl95iowrKaOyxAWLSpc37niwyKsKfqQYb2sbiX3OIS7HWbF+kaWUx1WOmGAMzglzQ/H91RVOnHoYy/p5okIwdyS7Ga30qoCAscVCZIEHO4aEr4GPJk8P8d4Lcg0RU3pcT5P5tXc7TM881mSGPpNPDvD4yC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pay6qyGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9JSXF014952
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f8LvzWRSramzprfrBFvO2s+C1Hm+tEbtLlK
	RSfKO3eY=; b=pay6qyGVBWCIHRDWXvnRM8KGHFLmvqXlScGFJW1m0kP6ycHs2uS
	12j1vP2HUfI22Sr7degxe/C8v4R6fxxYhLv57pLOoCbayh9KEayLx7+NK7O6hgL9
	GH+9vx7+SGAgNh/saaT/p5Mp/MKWG+EyfGDn420awxfDOvJssKc2T8S4x582lllJ
	gq1YxzsYSN/h2RX9lAiWznmrGMSyuzMbADosqAZFJ0+CCue9LRI671oLRcPz7/0n
	EeQHxpoK7V1diHe/VDtMgNat+5fbczjHOaiQZoEU1dGPr0i13bLtFLbYckKQ8Ce3
	XrhamGf/gXNpoNmmdyQ98akCJ6PWmTBC1wQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8krmy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 14:41:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso1476976a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825711; x=1750430511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8LvzWRSramzprfrBFvO2s+C1Hm+tEbtLlKRSfKO3eY=;
        b=IMAE1C2l3DS4U6VNqO4o7GTcIGuGgzjpH8jsU9Z5OAe3euoUnK5PQA8amATQ7OlIP7
         piqr3rktl3pcSCuLySlL1H/WlWW+ePZwoqdH/zlzkVnUR7qC0kEim/NrGLopT3q6u1ZY
         H4quEwUf/8fg+RBZITQhc4T0dlssmYZsB3qEOh7PtGRL26zyBBrfZeaWn6smA13suJKZ
         pR/z4BN8rzUQnDw5sjtF8rcoK0yfLmh6Xi7CtCGU3tAtPnbjKGY1GacgAafQjVVRVL+M
         +iIbgr+w5XsO4x49L5MigcSaKp8Eqrq4Bbp0hdmX4X292rfmo5DR9fbF51dYD1tjB6cv
         yfuw==
X-Forwarded-Encrypted: i=1; AJvYcCUaHvGODCZysAACJE2hRECNpPjwxlxfWd4i8GScQP0mOEFEQB8MdzUyIcfaRaLuYs9/YV+BpR15t4uRhbsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwtRVGllwCOjTUzgGQ5lz8wkBiGVCJo4clvrGKQtiWtGT+xp74O
	wMUHQ68mapTjU7uVatYg4ToYiGckO3UBwkkqv697BWHVgZmqd6VRSgz7kg9AGcO8XrvX29lnC/S
	iv9Lmf+8ST5Nl6TK/ZSQy/Yq/BtuCZnetMTp0JVHvSAJlCF0hrLHdmo4727g4sD0RmEUX
X-Gm-Gg: ASbGncvm2RrKhuJQDbYzf4uxfhSjrqRFZhYxLrAjD/NsY3Bbk55tbPqhqgPNOBO3RCY
	bMLfQQCWQxPx9axnnfDa0F56GPp4Lh1uCzxvYZWgX3Rqy56UJN21XBqsGZLpHSQ96V5br/KL0c7
	pUQbDjkvGdaH3foSCQb1tt98CBuG1iwTv+NIiotaRxeQRUysZ4KnnTZFR5v6RbcY5okl5xiM+BJ
	heG27nfABMb2GOw7TLZ4a4jzEQUAIouodnh7w0CDWeKXrPB+9JTYMTti9jI9HSxy0BgCNzOv656
	Z54SHHV+OrQK7P1toKUw6Mmbpq+/nAQD
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id adf61e73a8af0-21facbdebf9mr4553234637.14.1749825710750;
        Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GnAOt+z7rv+BSeU7ZHDxFM735EmwOZ4MxONhEpinIvFL7k6YOrMe2Cgq92R1/zv8XQne8A==
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id adf61e73a8af0-21facbdebf9mr4553202637.14.1749825710353;
        Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c5fsm1775491a12.49.2025.06.13.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix inverted WARN_ON() logic
Date: Fri, 13 Jun 2025 07:41:44 -0700
Message-ID: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 55YIUWDObSGMzGEZs9dj0JFGwLIBT3YU
X-Proofpoint-GUID: 55YIUWDObSGMzGEZs9dj0JFGwLIBT3YU
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684c38b0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4MAclHcQAAAA:8 a=r-1N9bTl5XODNADl1y4A:9
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX4OQwRaHPcohT
 F5COy1pgsocF69Ql7xoFKoQycuRLzIaXiOnkBKL9KBV7fKrkNgrRnVkHmTZnEeW2s+uG0maIq3N
 0poq+xoWfoEJ2lgOJRympveuN57ZlFXuJ+fhWiduSAJIIM+XR7Yh3S/aZN3Bnqxi3jnlMpzLoTh
 E+6FhU0ut4ecvyVewAnuU3FuUQ32PaqHaiT5y3X3EHRLlSNjXfZ8QrmxeY3PVOpOOgE1xtyKKUE
 /DgtfcOd2SZVb3zyZmvVDiFrPohoDzG+Dm2p0kl6gND9ga7aZQbZFt+wAdm+gVh2djbnuOm0RtW
 4b38HEabAANfI+X/5lZy0q1qLZWGSmxj1MKUqV0uayqcE1JBfk5Lhw11frTLbL2qUxpmPyMkDIr
 ebadeb2ayh6HU1cQew26KdE67U4OvKaymy/n67vzog0Rt7pWa8NZIfqnqlfCcpX+ajL6GXdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130106

We want to WARN_ON() if info is NULL.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 0d12454b1f2e..5c52d392427f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -217,7 +217,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 
 	info = adreno_info(config.chip_id);
 	/* We shouldn't have gotten this far if we don't recognize the GPU: */
-	if (!WARN_ON(info))
+	if (WARN_ON(!info))
 		return -ENXIO;
 
 	config.info = info;
-- 
2.49.0



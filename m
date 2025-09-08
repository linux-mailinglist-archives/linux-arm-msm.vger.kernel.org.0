Return-Path: <linux-arm-msm+bounces-72514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23BB48703
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D69A31B2264D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98E52EACF3;
	Mon,  8 Sep 2025 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2xuWFxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D42EBDCA
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320059; cv=none; b=CP7RTIC8b8lD38vXdzzJyDc7rwAVS7lyBlpVSxEtuiMWytCyeheYdwOr+rdfEIGzVs5sBqo311GgEW2hSuUmbYeODlegS4sJ2aPfVtuGC86BYcWeDu9yr1QOcTMmlkm6+ePn87Fl5tCCzYk+40hrqba5HDN1YuVJZZzsJfSW3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320059; c=relaxed/simple;
	bh=35cpBSeGBdUH66FC4H+UsUPYwwGJgjYHwRMkfK+RjKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GOQ9ELGT9YQv8pIBDzYNO/XjmG0eqXA/CF39HhiL+PlRYBAXHBU2M5AOUgWMoyZIkEbVHtSSoUihh4mT/Wb5DpQ+4dSjOWuPQp2xYL+U2/UKGIJY232n/T65LsI+AfcLq+v65wdYXUUcPEdFzOdo0G9PptmPXbmK9LO0QMsIHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2xuWFxh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NUmof009916
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdRCXOUq+VTaRYE/Oa3hlCeqy/ZqfVMBxdnUcOZZReY=; b=O2xuWFxhv/JR6w69
	PZmQtW1nP4pMRYuaVV5+Xvp5xipHHGW7Rn24NcppvNrFjdK9xLbez3DH5eQmLQ4M
	g8pVXpvuqLOnwlOBY10A8XxswqfNMy0D/cpNuR+mmaGrZHCYydwquC71H9nYjT8x
	3GbN8eJRxkcUcWFIpEmkRcfv5lCSJGIIzaDaisvJFiiwRpVIl9LBH6osof8f1fM7
	Qq/zpXXKamka1KE01hcXzrH1DewQ1/vkNaS7hOUUE/JjwQrhIjEbKVcXalMXvvUG
	m+vVm6yzGo39//ObPqdyt/3hE2ZoIE9P+5qulFP8R00gdhFyseauUmb3lM43qBik
	p5o6rA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapc1y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:27:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7725c995dd0so4085322b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320055; x=1757924855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdRCXOUq+VTaRYE/Oa3hlCeqy/ZqfVMBxdnUcOZZReY=;
        b=glBIOjn7HHvv3FBLFw1xXy3/DGkEfyo3efh7ejDG2gU9krCnXlXEe96cvjHZEo/yra
         wW+LqwB2y2zvBhfHA5WPAEzrcWrWoT5+I/2/anyy8w/xrBhZADyHq4w0O+QgqUJgX43P
         OfFfj4uQQ0WZ6tMAioRRe/tdoYrniquU8FHdgtBDbFURNhL4cOevpYaH5d9itF1aVWTn
         0YIbcIF3FuavfH/Al5fs8DeDwVp/Wcghog8LEmPQOJTglDNPlsAxcgTXeCHGYNkHJ54m
         ATlCs0iyoCt9+JqpLHr0X6+ybpdAYbSC9L6YCBWE5x9ObqB6h5lad+I8JAH3Y7XWARTt
         39PQ==
X-Gm-Message-State: AOJu0Yw+UoIvMR2cnYWfpW9W5Qa9558jhIbR6JoPFrG6BnZ+yODtFi5j
	oMR3W9x7jk0H+XhVmI0rN99WXKwMoXov2eKr2GL30WCIylijorkXUTcLHrG3CJTGWIGHa0oVddW
	JpztN68WBWRSYLiwRA4eDw1dpeyf0lyK7ySApTcx/x6cNuYC6be5yKVussoR4GGH8Y0aY
X-Gm-Gg: ASbGncva5OGp3qZgYz5Q1sNskaSMnSXOTAhovmZB2UNXPhAInQU1b01K1Rx6InZo/3+
	Ci9u7SGISP4uvHov3y45gIDU9w7Sm6mY2DMBYn4rfFIDKbUFVjyAMa+/LTP999jOvd9cN3AQv4a
	uFhqWoWD1zj49TaVIYH1YznuvS3qsD4d3pLZL/KhNLIxkm6sNz7+Ftf/6/dWHNwSTsvcxRXBC+P
	6BGd8rwaFwEaihrdDuThl14I5c7CqvRJ7OoLyqHGtYmbdP3I3teFA5B2bRQvcq7PSA0SfsOtLw6
	eC3K/+2y29HHUuo6cZiumVATwqaEy9FMTfq+Qk59J7y+C/+gQfmlpshSjL9yAz2z
X-Received: by 2002:a05:6a00:4fc1:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-7742dde571dmr9634393b3a.18.1757320055058;
        Mon, 08 Sep 2025 01:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoa7rPmKEoXy5bkSRtHuEIinaQc06jt7tvsoCi9S+fbJrxZSLSkUe3lj6xgSq9+7CmJWvh0g==
X-Received: by 2002:a05:6a00:4fc1:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-7742dde571dmr9634345b3a.18.1757320054591;
        Mon, 08 Sep 2025 01:27:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:27:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:56 +0530
Subject: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=1605;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=35cpBSeGBdUH66FC4H+UsUPYwwGJgjYHwRMkfK+RjKQ=;
 b=OZU+SZ4r0JqnOoFtL4cOXGhnhsKN5lr0wigU0s5og9yKoEQ8G/GdA8oV20D3i86tpktTOK4RU
 6ZfUfUEkIU4BOwAhLWMVNE8XB/6fzyhgC1jU6Rn3QsW8rvaqWHNa7VW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be9378 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jdX7vir1BwPwhWCwAicA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MO_FIGzO4_JwlfIq7BvIGKqJj4rmVl5V
X-Proofpoint-ORIG-GUID: MO_FIGzO4_JwlfIq7BvIGKqJj4rmVl5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX7em3vSFjxPTQ
 rOheho1J739jS1fsz5VFY/cv2J0RtPi/xlpkouqzhpElX3uIpVMarZN3XZsGHrjcCTnfQ822EBH
 oSL6lPdHTDSxyjXu2ByC5TlHnulgr8UUeeRWRXcLxPq9CF/Y4L6eqrZeM0S1QT2NVheVVJEYI1t
 vW71/TZr1Deuk52Y9h6pABy6T064F/DXjlZlVUHOP7ivJLiTBB5ISyJSQ/J6mPcQ5e6rN40Y6cT
 2qmiJDP2RPUNCsNRoaU5OVhaA8QZ6rsVCzRdcLkRHcoeky0YcKEJpZWczM4hKpemnS7Z6b1t30f
 00yFG6yH9mZ9Q0CIXzvPTzre0vVOQAoVc81Sd4SatTtEvtwDE3J1vuu35muk/dWd5kreGj209oI
 enAA+8AM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

A7XX_GEN2 generation has additional TCS slots. Poll the respective
DRV status registers before pm suspend.

Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		val, (val & 1), 100, 10000);
 	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
 		val, (val & 1), 100, 1000);
+
+	if (!adreno_is_a740_family(adreno_gpu))
+		return;
+
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
 }
 
 /* Force the GMU off in case it isn't responsive */

-- 
2.50.1



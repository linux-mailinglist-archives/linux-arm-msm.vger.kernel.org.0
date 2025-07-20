Return-Path: <linux-arm-msm+bounces-65793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC9B0B5F6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C42F67A9BF4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A5320B80A;
	Sun, 20 Jul 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGlAy1j1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D0218AC1
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013829; cv=none; b=mljNL6qeCWp5BMbW/bzH7Jzuxy3gvqSDxSN2dTaDOfPElIQHUFCAZACGpEwHdcZGEny4vSRzWnxkKL5Pn4FFsWqNmVP68axEJYxgFwiXFpw1Law79ldk/bqKyapM2qGJuUR8xjEhUQDOlURWPKDCvDmaT/dRA1ng8DHG2XgQAAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013829; c=relaxed/simple;
	bh=3stwORXOyD2lHblr894e/45a/C3w1GwYkrVrwU46SQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gla/x/Y6VVpvYWqSUbyDByUU3IBPHnjrbHkEM2dGUpa+yoh89fYPlLRaTuykiJJST+9wtgxaReW8/HviQxt6N8DZq9GRn1R9ybbmGS65FyV9uPeVBvL6xh2GteJex6u4iOkW6OpHa1bCPyniqxSYxr40SRXmHeZXKQBc4hjjR+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGlAy1j1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KBDAxY031469
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kW1RdFmcoOsd1EwSoqf5o3Zsu7xmMON1mp5RNrIB+Pw=; b=pGlAy1j1w0BPkw9q
	OqoPVYZpD1yWIRztmchbQhabtaijsVtXSxz0ii10+HUti0UOP9Y1chBEXfCJ6wPs
	cr3ca4ZYA4CXzyao3IcYNyXzs6oU8uDdX5Eo+iIapJonSnahqpsB6WFuHY6nIOAz
	rPmZa220YEvmQ9CPrivOoQx8Btnc0giA0WV1B/c1Z4sYT8eTqmD3TMmnyQmmA1Uf
	gzdmOb61QzuHM0ixyaGhwZdONlTYHooKWhqLoonMN50LsHnLjZiyj6FEvGU+divW
	iZ4MXt4ReRwk9sAb2Txj5jWC7MIZ3RSfBbpu7Ne8+zzSZre8nlgcwnx120cx8EMF
	bMBEVg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9t3n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748d96b974cso3377592b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013827; x=1753618627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW1RdFmcoOsd1EwSoqf5o3Zsu7xmMON1mp5RNrIB+Pw=;
        b=rOusi8B4pBIF/Rdw3nv9BmLZx6rcjrWvvFu+8D+wFGgZFP5AZ12p4ld4W7UAX1kHhP
         CJyF0bFip9dkMu/yDzO2wxDettnMn4JFZD+lK5OVb214ubxkhal1ffbEHaOitvi469ot
         96YX8uinrod1nP5bMZSdKvp/Zgf7vHg6vr3woebqlMs/rOCpzBpjBd3isUnnTXcW9+5N
         8F8t2gs/27JkxjXUZYJ+h7gAjVyW8wvKDYRiQnnYpFbCOspmJxUBL19U0JeRVrZ0jpHS
         uQEDQtnPJts3esZ4yCMkuo/Rc+DMqObxwxjx+qpH0exNd4Ao2rT2WqV/nZ7SxpLU0V/7
         O1Tw==
X-Gm-Message-State: AOJu0YxNXN5k0wLNUXOBMNPyP0EGdnxr4VEwncSCh3nI3Gzxn9UVP9ga
	uFi0PIzVmJr4/kPysPC8PQVocnF8PlvD3Gbf9Sm8Yi9dWIZpg/qm7DSi6pLz3RL+PXV4lwbu9F+
	Q0yeU6+Xk+8Er8Lr/Ym4SfOPdbzUkh1IeVt/Or8b2DXBrUCDpnerBF2XE6c4h1Lwm7Qll2FhJZJ
	0V
X-Gm-Gg: ASbGncsojy0sgvK+tvAWwxsMTfcL/0Mz1zaGOsgElZE4Qlv3P9nY8GBIkdFsT6oNxfW
	gAPsEVo4boHQb6DGfHtC8CUhieGlXg2fmvjygG2rTXryvI1RfwJ1imRh2Tssgn1PiEfalKpcAdF
	14f3Q/enbt9ytrS+KeP0l7c3v2cNRnmgDyd3wx0ypdzm9ANVwegK/+a5h1pL38/q2buw6MosV/v
	mqDnYrZZDCd4m23FJ+v1ZwU8PjA0hXON6YU1l1tyHo6EewuhbPXIJzvjAtidtFER9zY1fgSLQu1
	V/e0WXJqVAxk/empFIy76Nrfgs+Wj4AiYSOCrem2rxes4it0KAa8AFO/1zc+m+he
X-Received: by 2002:a05:6a00:92a7:b0:74d:f997:1b45 with SMTP id d2e1a72fcca58-756e81a0b16mr30560716b3a.8.1753013826563;
        Sun, 20 Jul 2025 05:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJCPBQtnMXy/jZOOBKiFVdjpswk8HG9jRo/IJ5LNgu7cBW5KadTD0q9XkvVA+KGaxqwWZhYQ==
X-Received: by 2002:a05:6a00:92a7:b0:74d:f997:1b45 with SMTP id d2e1a72fcca58-756e81a0b16mr30560678b3a.8.1753013826033;
        Sun, 20 Jul 2025 05:17:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:05 +0530
Subject: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3stwORXOyD2lHblr894e/45a/C3w1GwYkrVrwU46SQM=;
 b=18D4fLzbFzbWn0lxY8knNtoN1Y/tXd2BzOVJmRzc5l+AkfoVEX0r2tMLbpEmrVxCkaWemcti7
 3z95YWbq0QbC08z2Xo5a7RbYiQ7+dZgYQcq+GPAXdz3j6ZBQF1W+rhp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: xZx_BzYK-WNppu2ZQeprNkjvw35cETTP
X-Proofpoint-ORIG-GUID: xZx_BzYK-WNppu2ZQeprNkjvw35cETTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX9xMz/TNH5eJ4
 KRvOm9rm3NvC3uLINsA3i1cdeN4Wexj6vfxZNMrXclbk21CH2XFFmuIPjjkXbM3lDauZceEDO6y
 12UadjQe74sodDbIpEhAgzLazecIARaHMIRCnak3X9cWu3kPVp1eRr5fg4AQa3ouYWObVKZpJfn
 4N7KbXohgkMotRuIpP5ngUPBaPhISeimfMPqHlOB9LkxrDqs12zVSmk2fGz5kz6fN7nsv3gK+Ke
 f3jIYGxkAaoSrewSw0fsUKqAkzik55U2BKrvAF3S+eDjSzj8JmFbzabCR3uyNHzHL02b8r1mZP8
 10cS3ecvc1YruGfuPw/+vAF+3wfdYX2ECxyeXeopr2VIGHy6+7FLEddILgW4JxmxS8Cr5vZBDLI
 LEq+xg3L3ArNdW2CHFq3Im0sL/yKFq5E9SqM41xXoE/Iwu1MRuAuNFpC419qN3uScQIdQnWE
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687cde43 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=D93cZsf7Dk1NQdFOo6kA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=881
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200117

A7XX_GEN2 generation has additional TCS slots. Poll the respective
DRV status registers before pm suspend.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
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



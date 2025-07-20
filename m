Return-Path: <linux-arm-msm+bounces-65801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB0B0B60A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8BAA3A7052
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879672222D6;
	Sun, 20 Jul 2025 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpSL+t0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C46221DBD
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013867; cv=none; b=akma35CFVwFFqi7kIdbroekSq1ePVojlpHQ9BlrRLIeLzKD51xe85INajFzwNAR21KMORk2OrkDOQ+p1pvn0tFFC+ILohvIY73CyZSNTCnEEBFpzFkhueoZuxXo7KctIITfb8JdYUxw3WsdgrBbdcgRlhWE682rNKuUVONyl3Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013867; c=relaxed/simple;
	bh=UufTwoFz7ovGUA5R50wL9c78uLvl6377i+fkOk6Jefs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLn6Sp1H88Ig8WDaqgi1nMU2HpuEwC1oHkb01vEfbltr39TgxCA3sJaNpxBhjeavCAwIANm3xxznNrv+rSOhgj/amsxA3JVt9zm6ypWnRYue7Cl4nwe0QEGcBjqotgc3enkKkWwO3sV+2I41ZWE6wHecgSF75JVk+SQiqcXIbOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpSL+t0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K8U3vI018919
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofDofdzCPVMyjNC6oHyPmSF5XE7uMFwOH2VSJyJTTw8=; b=kpSL+t0X+VTqmfqT
	c2f0IZ+qkOAgDrsZGF2kMOPsNS02qyarYBl8Om2IgKbrlukyqREtOzxwtG1kuNaI
	Y4UDj4OcL2N9UA6z5m9rjL1v5Ay6wpWc8AEUcVGg1O4GUzuQidhAx14aMR5+FbDn
	c0sDFBnF76FuJL2/VHY2lf/YMDJSTkcQy3o6UURWUHTpLTkk0UTfk5Rk0HovbtY4
	3r14Yy6zkk1Ec25pLmiSZjOWEoPi8lFhjf1y/CvrrXeOJwcvmN1GDCN73Lk4ztu2
	gCziGNMme/dvqeFmvrc42redOInDPL9nF+eWrNULzfzW1c1SkEONW7i7Jg8sRt1C
	1KSjfg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045ha5xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:17:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e4637739so1974900b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013863; x=1753618663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofDofdzCPVMyjNC6oHyPmSF5XE7uMFwOH2VSJyJTTw8=;
        b=vwCkadi7TH8n3u2/0Bln3VqELI/nDfmoV25kVJYaI9RaPrdMRxflLYigFzMYt7Xufk
         hWmkx/VIPGlLnXZw+bW3pFaJxevcmKYaTulRFPctKnKwdpwBilkEmwDHp3U+2I9qDExa
         BA82faeBYtjiWU5JYy8CVX1s05Hki8ypdNIHHgeLCT4pTbAZ+/PiOsO5pTc76/lRqZ8j
         9RSjQ4R3+104tWGK32GYP67EXCt8TIwKjRIUQvCsf/reWfHfv01VwA/I6MDaYW5BS6Ox
         nSJkJfqlPkNy7y1pywAF6DI5FnpMZ5Gb7W6+UfbM44faPIA+hiADbOVS+aV27jwqw3SZ
         EdmA==
X-Gm-Message-State: AOJu0YwZYEY4TKXizdy+uwDk4wmuh6XANAN9La13xUKhAIB28DUviYkF
	HuJ9nHROzOmw/dMX7KYweMDbqJeBS6TbCja38uzRWJIPelyGPbICT5XnIOKFaOCew4QDgcAZbPv
	hYDJGpXB3+jG2eXBXjX4k/HD5mq6MXHiG2C25YAgDitFBI9wOZDpm9KMwE0+CPvQSoMJWb67uL2
	Ag
X-Gm-Gg: ASbGncu8Hw4AQbALjviBhwmb8PMhvxioCD/pEMCPR+5DIN7Ow21TzJNZ3ms0o8nLJib
	dmjtBmwBmbzk2Di9nOsLWKbGTMKrdfWEErkOKOJ2h5G4Ik2c+MWBx0YSYmcwsFVoFaDRbG+ynlp
	54HPqU+rDHL4i4YsY9ZCM9HbXMYvrLd7GyPGVQDo51TQP+I3aCjOPhlTCHZH7MXA2rZ/hhJ6b64
	hn3H1CxwHC8mEa16JjwhVPTataBdlTnsrerQVT8JFeNhmd+bdM5ycULwiJoKILU+iXOKuSkgqSQ
	XjYiGJpjJy0C09t9tpYRl4V5vMD6cA/i3Hi46PT6sM5z8V/+tgjbbjR7tyMnCx5H
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id d2e1a72fcca58-759678986ecmr12599047b3a.1.1753013862989;
        Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmonQVHr4Bjv8W5fko1GeaHvzAIAD8dQNVPtEbw4P9/DZLSf2HcJy5PQKUDsuSf2r4OOuJdg==
X-Received: by 2002:a05:6a00:9189:b0:749:eb:22c6 with SMTP id d2e1a72fcca58-759678986ecmr12599015b3a.1.1753013862475;
        Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:17:42 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:14 +0530
Subject: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1726;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UufTwoFz7ovGUA5R50wL9c78uLvl6377i+fkOk6Jefs=;
 b=CiVkKyycAjZFKjOMucGztI9T7mQEvFBYqWl/BB9hRnOWHJ1sN/2PxQHpgp6pXN3QaATDYWvrR
 h4znFJ38/PUBWDMBMqYvqyGNY0QXINe0yb2jEOge8498e2dGzdryR8t
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZtDtK87G c=1 sm=1 tr=0 ts=687cde68 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Q_N0S3AoeJwl-lDGPIgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX372kMRlr1FOc
 kuR2K/JkWTOoWt7Ong/0ysYPFML8OxnBZQhYT9EcO1LZf57NPY74ilI+pG2V5dPkyIkNlsuXSU9
 OWaxOmE0jeFZA7IxGXHfabHRHiXZCVqI+ZdLhzqAuZY9xh1XkuOC5sfkhzzG37ybTKDnwV+QYoS
 PjdeEsh4uKktJfeOWZl39biqrN18jls/rxbM7tGSlfSOuBl9KB64M301GdV+06NgBsUaFnQNH9J
 Z9g6jRXyzi0iSovUFGaOEygThn5HQprFgoIS1fc2fQwsrOOEkF1nbtLXd2isktq1UKmr9fZuIKc
 N7o857TtKwr1kHj/agCCrvm9sc691B/zzyUCnmlukBTgqxx4b2LHb9SF6sxo0nfbUTVYv2FfAgL
 rHtszCJPZC0uaBgQ7XOSWkLPhUMKwqhV18Jk/Pi6+Og4jTAHlOSL+W3/wwqeRCw4qWtDd++p
X-Proofpoint-GUID: OMaeFoQv4h6YAkX9FlKC6MW2UK5GS6Va
X-Proofpoint-ORIG-GUID: OMaeFoQv4h6YAkX9FlKC6MW2UK5GS6Va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=658
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118

From the hangcheck handler, KMD checks a few registers in GX
domain to see if the GPU made any progress. But it cannot access
those registers when IFPC is enabled. Since HW based hang detection
is pretty decent, lets rely on it instead of these registers when
IFPC is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
-	struct msm_cp_state cp_state = {
+	struct msm_cp_state cp_state;
+	bool progress;
+
+	/*
+	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
+	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
+	 * lie to the caller that there was progress.
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return true;
+
+	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
 		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
 	};
-	bool progress;
 
 	/*
 	 * Adjust the remaining data to account for what has already been

-- 
2.50.1



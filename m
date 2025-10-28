Return-Path: <linux-arm-msm+bounces-79180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F66C1471F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3536119841E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275B230F7F1;
	Tue, 28 Oct 2025 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzxpnBkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2D30EF91
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651998; cv=none; b=TmXX1GgrMGVN9r41/ufxSX5R998ZkOLgau4u8piZZ4do+FRQKn/RSH6o8nBcGHZVhdO2GOF6Z063fWoPmp0FhKJGXriNViJVmXEHfXR/be/MkuYZBHDOWMIXjJoT/qUTOL2KttJ41BlsTBrbbRXrlcuvFTu40chDwKJBdQ0droY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651998; c=relaxed/simple;
	bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsdA4op960D7HZEjc0ymnTwC7fsw3rVA+5ljG21XTCpJbDErMt9XQe8cjHVGrwjAdSr7x/xxOFtHu8Rur2JTTa0o0BTId8w18X9WuAlX5E9MZ3qdhMJ7NX8bog670z1Jc3CgCOqMAarPsIFj/MlHQSuwxapnHrSHHvKhkOzOXQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzxpnBkQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA6L9Z354204
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=; b=KzxpnBkQ/iPM+x6b
	JwzP6NlSbWI2LPuBEe2oIWpTt989YCxXvT/KNfMPYwjKorflEvO4IxuosrTb0U4V
	qK2hlLXsy6MqiuyEFAolwx+Z4lxUXwvSyfo/65nAfkQSiEQUL26lrqOa7CKOcczq
	lNpiq7z/HYQi+BiG7GjGEA3Tn07miY2vPcAtzYYB9osvHOa+kZZCUz62/1cBFKBj
	tdHcLil15MS1q3QGRFEwBck1zrTidt6bwNPE4qAp8ukyDCJnWnMQrX8TdcVvVtiX
	c+BcURsFQQkzy0uWWKS21aJWggGbFVVYfJoFFC6CBLbcmtva9FTLazK+vNtZB6PA
	XOldQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrsfne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf72a45f5so78430581cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651994; x=1762256794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+e0kmPSERHqC5oqgfvQz5PD2Os0wmkHOTZ+f+cd7qww=;
        b=dhSU5GIVp4J7WwScpNplx2ImpD0aTkZOIUZqDBH0jDfA4TAjdnE/xaXqSS36eJS1k/
         /mFJ5MaTcWmbQzby3V4q2WyTRYBpWX0qavKrRTD+PXdn2qUEDzn9twkbNS/BBI+QHq9Z
         m0cvabGQ5cvr8K1yZxcPps2HUnIxHC7OdppwxmNjycYbi2xFx/YoG+p/Rb8JSKaTBWhZ
         DuKAkouzGC0Jn/myz1uj04iA9Xvxtl6XohAv9R303Yuygq/mFFjo2uWqrDfPReOBKhKS
         PEaofLLw8GxIfEao07dqTr1FqzufFY8e2MLS/bc4YilxRpeSY2Ymte2fOfJTpvzKUZaU
         ei3g==
X-Forwarded-Encrypted: i=1; AJvYcCUJB9zOdJ0/QzrNoP6MT5ss+8jxiRB9fkeX2637RrzU0OwvB2h8LP/maaAvjYls/F+Nn26mpBhLJS4Ni1rQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxBILHAN8JGe4nx1SdU9d204wjfUcnR/8QReE8/3VUMvLB6o/gV
	lVsEtypHlnXnlurHklxaq/JSPBqCR6UO5uTUb/ibLmdRHwoJBqEyP9U4F5QSnErKAUeNdNY35L9
	lVZIrpKMI80W/JkeCYgvIXvE1Rrx3zIpQAvMC4zb6jnPSXHW1GbGBN0irtVU10sTJAxLH
X-Gm-Gg: ASbGncvLd1ChmTR00mPQozx5AYTtDuNmNllziUqxIb1v8tLez4vnZ8V6ltuOL/b1vBl
	D/anLJqgx8xKcwAb4YHVvh0k02j/D0yomCmlC0BmDD2gx9tb2nNnlhEjBVRocszm8gQzKteLhDk
	0+3XE+LVdndHo2/rhsor6dWvS2khALfhWGksyagjIGH4nLJM6XkhObl/mPZ5IPJELwOXg1ZhRRZ
	Tx+G2erThs9d3DXW/5xjLkIOmTGoDCqdeHfBQtTpEZqwHeOs17NQ8ixMMvdxO7VhVQXW+yHR2qT
	/jf5kASyGZrGNtor92tKJgT9rep8l4zQegEptW1eV9NOi31+l8f9N9+eKPFViZOEk6dFxtHvjqP
	ftjxzhQC2JK1a43FnrdRmyYWUNKE0laO0VCoY8OfXGs5hl1Y9jIXJMx54JCH8AAfhji66b47jh4
	LNqHKGJkRNx1Tw
X-Received: by 2002:a05:622a:1983:b0:4ec:ee5f:e057 with SMTP id d75a77b69052e-4ed075ead8cmr44032181cf.67.1761651994296;
        Tue, 28 Oct 2025 04:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPdyep33zieqq9ymIFf1QeHam3SMWH00VNYbqjTxTd6ngmg/6fH8ql3fHc8hhslsjfAg+zVA==
X-Received: by 2002:a05:622a:1983:b0:4ec:ee5f:e057 with SMTP id d75a77b69052e-4ed075ead8cmr44031881cf.67.1761651993830;
        Tue, 28 Oct 2025 04:46:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:24 +0200
Subject: [PATCH v6 5/6] media: iris: rename sm8250 platform file to gen1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-5-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ebl4v/VkXfD1I64iutehxYEDpuSCR37dBGPipaquSZg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0RSJzPitVU8mSgc9I6m3hvDaUuZVbfkOsLv
 4v1jiD5uMyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1SXRCACLSs2lpfLAOajSrrl0O0GLKc5qXCKdJ4cIxGnRirHlcx8FMtLp9wGjwR8jbLNXFrmOpFH
 bhTkztGCJl1xMmgm5sj6m9gZCRs1m3WZsXCfJ75Up2dDYuWMSPJTKu7bRA6GyUd046jmP4Tmiax
 tEB7zwZH3ts6gL7oDpMp/IyWs4NZG79RA0xF2uxAKIYlmscq8cBB1ambr4oFuN/NwVWQ1dlpVxI
 gMWvuHSut86efnZso+rMtM0eFiMGH5gfzeegYleLCiX7n8bNhAUIqVB3enkqsJdqnk7aJpfxTXR
 kJWy1IMMDHZhvhqPibTZfy1vUJDPCxo/xp9haZd4T3fZAnlK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=6900ad1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=OYuIXoeRUKmE5Kzn4ZAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: fXGR_xN5K33DBrdQ1n8QgcUrxrB5j6rR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfX3k6gPcW5uoeb
 CZ3muWUa5R2Jq8E0+hlIffktEBN66oDwk+KQI8URDiPAWBD2ILopuCSq/RktVvW14Eff10EVM/i
 zF3RMg+/dvtuEfEPJ0trKPqLHT+IxR6juUOu+eoO8F/nQ3d0g+QVj+jfaGF9aOoTJFghsqkdsOH
 Cr2MJBMVRGzTy1BXq7VqpCJv0Xgkutl6jkSfQogTH7hHPfk78Z7uEeDTwDN66izFOanQe46mjWg
 +BbdKzcJki+d/6tRulaGgqXfVqX8HfsxDTVptaihKZ60QRRaH/SZnpn8j/+kRPt+aXadczNGccv
 WS5ecoCxjaI8T82ATRPxfyOqOq2Gfqyy0ISxzzTLeIOKzhzLvoeZ9YZ7IvJ2IxNKEnZISxQO13c
 q+Z6QydXHV8FF5PKCkw2ZR3dxlHksQ==
X-Proofpoint-ORIG-GUID: fXGR_xN5K33DBrdQ1n8QgcUrxrB5j6rR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280099

In preparation to adding more Gen1 platforms, which will share a
significant amount of data, rename the SM8250 platform file to
iris_platform_gen1.c.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile                               | 2 +-
 .../platform/qcom/iris/{iris_platform_sm8250.c => iris_platform_gen1.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 13270cd6d899852dded675b33d37f5919b81ccba..fad3be044e5fe783db697a592b4f09de4d42d0d2 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,7 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_common.o \
 
 ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_sm8250.o
+qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
similarity index 100%
rename from drivers/media/platform/qcom/iris/iris_platform_sm8250.c
rename to drivers/media/platform/qcom/iris/iris_platform_gen1.c

-- 
2.47.3



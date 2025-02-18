Return-Path: <linux-arm-msm+bounces-48318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70DA3933F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 06:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72FFB1890896
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 05:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026EB7482;
	Tue, 18 Feb 2025 05:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnIx+RHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D21B4235
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 05:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739857966; cv=none; b=i8FMH27qyNNz45DR6pDEn9BXZP91YSBu5roe1lafl5dT7v+BM0YKlCnUBgCygQWULDatqJJ/DWcRJ0gtUMbRgeNDzj8084bCrEc77/LldDYeAOKtRq5QSaUAI0ixGj50n7Do8ay38tSXAxDVx1Z223eda5Lwa6t5QkBIPfgcHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739857966; c=relaxed/simple;
	bh=OUNgeBG9Yaj+w1qNJC8+eYpKidf1r39gmgSZpgb8UuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OBZ+CcTIKXZsK99oe7lvjPe3UTT4FrUJUBIOV9kTHYQgDAoYWVklhllCvOV1aCmkVY3jq0frc0FeCTJdU6CXp4YnnkwXynWi77s/ycng66Mx31Aw36x94Mv+dyg173aJxB3PLGAPiBwexVAX93yUObXPJFAIjTgWDknEQEv0VXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnIx+RHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I23QU5019060
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 05:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8y/PCaTCRg8VuI/K8qxbSF
	0ICUfYwKH3o2vnyNihc+M=; b=FnIx+RHErlZr+3VgJrn0odKWnHTkOGvqsjnbYZ
	jmfr18Hrn8mG6nsgWysEnJe/OSpaj6+DaRHm1Q2OP9pOtn54lb80JFzv2Ykngg0x
	gyUDfu6tc+GXYI56xwUVXXMlN9uZ7Tr4JquEX876pLdsQlzD48Tahra5EE9ojHcQ
	R5fY/UXB7BdGyy6jl2NDH1radTw3x1ZXG1K93IyrJYeG1afcPHqPsiFarSmADvXk
	fCuZu8LScruZB3ZWYoKcGTJ+L2b4fPKgQ38hYQwWVCk/ur+rbcQTBOOnhij9x40E
	2nHez7CuAxBd5FFpbnyFkELEpClVvyrmraVGzz4JS9khfXBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7surnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 05:52:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fbfa786a1aso16075302a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 21:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739857963; x=1740462763;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8y/PCaTCRg8VuI/K8qxbSF0ICUfYwKH3o2vnyNihc+M=;
        b=KgF1osLuJ4fn770Z/8Wrej5EovqBVZawDuwwZQLVcrqG/BPF1ojyQ50/mLxP+vuqmq
         Dz1hkuwesGTUvZVkk78ZRKNsLvwilyEih6iwq1hXgzuutwzhHEg+YcVISo4LKt1wj02b
         HLSMoj7qFrQ7JkbiQnwZlDScNofxm4f7xov1wXHq78xqKTW05sYDHfSVYyVQonqa03lZ
         2ifZzR8EWy9qqjTr+gFPvyb4yQSAmuifzL/vsQPJYDz1ueRafa4itkGerQ0BG4wCrHjI
         JTY+9wh1srGyLmJhT7rBUOSaxxoVCAkJJ6uwAIhr8AvMZeUbMwQvkMuHwPopryKEzfPE
         3EFg==
X-Gm-Message-State: AOJu0Yw5izjhReTTkx1SMl9bf5LU8NYpZDEH8w95f2O2a4JvY4dRHls4
	oBLoZGDAOIfJBhEst+8CPDzsgKd5iNVSdMIOW9fQD7HDg8hUjBVqeRsmSv8YEuNeeDXxDq/IHFl
	xkCb9t88Q59DvfnWNy6oz2KAVcR3bqKDRzRwEHLZz/gVaSdRYJ5XanphSC1LH3zD+
X-Gm-Gg: ASbGncvIESkEZjsEJT0I9PvoRb2qBfl10GeCO8uKTEAxNDzKvLhwVNK/pIn80jHcNMR
	akPGAtAmZDjJKxhVCKWUTJksZrfiUEwdIzXuaSFpwDx1MOJYypkLBaxTbuT9GhXZLRMD/jWJpJ1
	EGS6YbKr9xdCOl9Qwc8x+qUirm0LBhjkz+m4hvTfiT899OKC7fYJAkkK2wCec4WwpzrkQutw+Lh
	Imn+dsBYOsTT7Z5/LmFCmhXJHf9NgLWM/c0To5V3gmdO5g7VSPeQyGWV9nGxKtQUTf1b+Fv9AxC
	jAM4Hmc+gel02CHevIg=
X-Received: by 2002:a17:90b:3ec5:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2fc40f0e8a3mr19003260a91.9.1739857963335;
        Mon, 17 Feb 2025 21:52:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrPhFKUnWnGuRnxsogYFBCvCkW8IkxawKxO8olNqU7YqWZjZGaLhP0OfZuR3+wWGio5vXsyg==
X-Received: by 2002:a17:90b:3ec5:b0:2ee:d63f:d77 with SMTP id 98e67ed59e1d1-2fc40f0e8a3mr19003223a91.9.1739857962891;
        Mon, 17 Feb 2025 21:52:42 -0800 (PST)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ab07d6sm9145057a91.2.2025.02.17.21.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 21:52:42 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 18 Feb 2025 11:21:48 +0530
Subject: [PATCH] arm64: dts: qcom: sm8750: Add RPMh sleep stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-sm8750_stats-v1-1-8902e213f82d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPMftGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nz3eJcC3NTg/jiksSSYl2jVIMU8yRDy2QjYxMloJaCotS0zAqwcdG
 xtbUAtCO2x14AAAA=
X-Change-ID: 20250217-sm8750_stats-2e0d7b19c234
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_lsrao@quicinc.com,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739857959; l=1001;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=OUNgeBG9Yaj+w1qNJC8+eYpKidf1r39gmgSZpgb8UuI=;
 b=yTIGDrwcxGB+ErvGVYneeBSikR3BaiY7iLOf1Obb7uKOzIhCLdxh7HtRZq3Ik3D7YsTkcDunO
 4eDjWFm76JYCXT1A/8m1UHAlN4Q/LWfRwE+M2Wh6NseDfkYeb8hVtnd
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: ohFuAIyF_lUfyGqfOZXvW_EvmIEzX0RH
X-Proofpoint-ORIG-GUID: ohFuAIyF_lUfyGqfOZXvW_EvmIEzX0RH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_01,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=715 phishscore=0 spamscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180042

Add RPMh stats to read low power statistics for various subsystem
and SoC sleep modes.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..7b692e1798496292b2f457ab61c63d3b0bb648af 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -1978,6 +1978,11 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,rpmh-stats";
+			reg = <0x0 0x0c3f0000 0x0 0x400>;
+		};
+
 		spmi_bus: spmi@c400000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c400000 0x0 0x3000>,

---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250217-sm8750_stats-2e0d7b19c234

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>



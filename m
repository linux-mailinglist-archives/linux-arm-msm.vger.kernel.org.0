Return-Path: <linux-arm-msm+bounces-58861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1576ABEE00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 10:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67188189E871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 08:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F16238145;
	Wed, 21 May 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOFYlVVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD796237A4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816358; cv=none; b=MhkN0Yr53CuH5MivOSi1XOoQNhheAmSdjnZWe05BhcHxvN1l0sLYj7G4oZDhnvNL/QVk0sOXmDm3yAAmTBoUqQa+IOQQVbCL0SithNLFVt30HeYZLvRptf2O9KuJWczDn27/h1S6dSe0Bw5L1X5BpGhBNJbuo8Bovc0xqW3H9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816358; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Raxo7BtGhPF/p0iXcTtwijfazRMRqtoKlWMVZZXmpMmzwcDh19FDXvl1ISZlq2ZFpmFyIHv3T42ye5te/V7rtUZ7v3+lBEw8518kPw8nM+L1W5ezqvxS9+fzZrm7hXWbuXLJ30fXxYdXvYGS9NRGy1WSIcB8FQc7xJ4WSFhlgXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOFYlVVT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L61dDS006884
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=iOFYlVVTYd97TA+M
	ZhChquoX6E6IFjCIlPvWvPuuNRbyUJ+P7AHmRalAXljt09QrAFs92dsrB6bBZ9e5
	lSwnO5/ivtlBCRLSpEIiRlcU23HlouBKpAdPAHY6AlJwg/TWpt7pugCxA9ozc4Iy
	WivM+mSbEy5EU8yVSAW8J1M+XiFi7yXCTrWU/BbPLavE9fOLmmZNBkaq5MZAyU9o
	eh645nHMU0TdIiVdrLwFfSv1BjRvMYY6zyV+OnK7vui7ua0QyIxnJ9YHP6Ds6YxS
	L9IiSpFg+R6PLmkWMlOtSbHm3TeN2gpu/QhppQ4GWazyWJS0n2jbHkQgzzWIkC4k
	ANQB3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0j837-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 08:32:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-231de0e1ca3so44096075ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 01:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747816354; x=1748421154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=XXoGZQGv18RygmYbvMch9Kbt+rpgnsMfrsQMMoUaFEhxaMx/ckC7eIETWpE7izLq2L
         UwjrW9qq+qbnvkQtuI9NWUBpX+0hcNRbF5wowZdy6xJxHcuFZV7XPKQYMdrHMhvhJRjs
         s8pE2IFZ/VoG62HZtu35MHhc9Y8p1P0XGs2jD8vuhU1mkM+TappHqmZCJvy+LR7aVgw/
         Cm5sp3GjN/ZgnOcHXLozGjCB3EoFAUL710209j3pg5klwiD/Cez1QBiPV38VQE7YDAQi
         tNMYkXrjsXJTnqQXQ5DNaAPw9By7hM6uKmhvtwWy9IDiHqgaKcC9lMs+tIM8EO/NiYKB
         GvFw==
X-Gm-Message-State: AOJu0YxX+O8JHKKe/tMlSdXAc7VPcG3ACUfkG695M1PhK9XXeLciF7Db
	n0dQL53a43pRwBbmt2KheY5cQ36Gy99X0X7Kw6tzJq9duuz/EI3jV/4j9U0VfWFPBC8TAlF/Nzb
	MCJ0tAQsazaLpVMOmrfae28HFOiwtn1VECdx1lIIl5Ohocg7tVSCeG7kwbsGve2MRDEzW
X-Gm-Gg: ASbGnctlcK50mU6+/8d5Hld8lQIqWMd3dDtZGCN1B3HLWCu+PMMvpOe6klrcs+jSI8w
	C9F4jmfwwSt0QnGzM51h4PEqJinaD1/T5AtEuHyP98/Dfek95F2S4ROFKsIjmWaGb72KGiW5zCH
	5HtobY0zMTX1Kho25IyMqQFR9OG5PhO9kyVGkRelbTpU+mLLaBiGVSRpt1YeXmwYHp26169r3Wf
	36vZe1GMQbhfdzqvj0bHpoY70/UCioMbtU0idCWwiz59cw15UUtwb/6CONmtE12MdFvSu28183W
	EIrhfkFhQAEZoo7nhi8STnKEXg==
X-Received: by 2002:a17:902:f790:b0:223:325c:89f6 with SMTP id d9443c01a7336-231d43d9ba7mr361417075ad.10.1747816354372;
        Wed, 21 May 2025 01:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEy/kg9EaC8vrO7GjPZbBJOrkxGMVByaa++GMMGsnNW1V04OXOaPLDepVmlUhDZHqqoHLiCA==
X-Received: by 2002:a17:902:f790:b0:223:325c:89f6 with SMTP id d9443c01a7336-231d43d9ba7mr361416705ad.10.1747816353991;
        Wed, 21 May 2025 01:32:33 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233abb99a06sm13194265ad.254.2025.05.21.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 01:32:33 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 21 May 2025 14:02:12 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ddr_stats_-v2-3-2c54ea4fc071@oss.qualcomm.com>
References: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
In-Reply-To: <20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747816340; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=gS+r51M4CZgGumTWm6b9SNQ8vTomZ2XokuytEKh4urcNsRHE+aAgwHfYtoySC2y+xfgU27xMx
 iM9h1yeqTAeD48OfoHC3S+zQAEm4r52VyHdcNvVNkluN3sh0WhTud5H
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: z7Rm5vR09x0gjosQxMuhNEZL_9N-sjv_
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682d8fa4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: z7Rm5vR09x0gjosQxMuhNEZL_9N-sjv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA4MyBTYWx0ZWRfX1lYgiSCHEOHc
 aSJELo8OXjiqeI3pH4YIk+9VRGZTT2OZUsa1Ldqw+VKU/8l5StW/3MEkEI/9F2v7P3eBL+4Pcnh
 BTCNOc0/D4QrzidjSybeFXEwp3C8PDQlW+gVGyy9LHpC87etc8HRTm2YIct6b02kqy18aDEozgs
 DTtvLrJyOZJcV/hHT0qtKX9tXWxeTPKDhN6XRLtvC901k4ON8w7vjgoY30ATWxtWkReZ+9JPe35
 lOBxEGnpdk8vO0ZLhDLi8pABtt2WoaIi71V0MXq1f1N5wemhbBFLZb2sgDwts0opciDUEVPY60j
 y1P5GXTBOMThmQHjVYueht9XIlJ14a/5fYtlvTxgR2zFsnfaJdYYwD/DPFzbJqDEhZ3i9hYHaia
 NTcS2zssvMHZk1Lx5VSfELXlFM7jKd9gzfbaLz/VJgJBc9k8aAvRWY6nEPEUrFqCXvvWVQcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=684 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210083

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2afa51084c510eddc341d6087189611..33574ad706b915136546c7f92c7cd0b8a0d62b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3739,6 +3739,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..e8371a90b9b98fbc12a429def8f6246c6418540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3943,6 +3943,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..875b5a89d2555f258665c881ee3d96965b6d7a6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5725,6 +5725,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..4c54ed84e2d1ec836438448e2a02b6fe028f4c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2490,6 +2490,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {

-- 
2.34.1



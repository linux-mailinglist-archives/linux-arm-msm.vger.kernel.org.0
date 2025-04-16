Return-Path: <linux-arm-msm+bounces-54476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8C4A8B3E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 10:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6682C3B6D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 08:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F4922FF39;
	Wed, 16 Apr 2025 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FELFO+EJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E618230BC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792179; cv=none; b=VHsBSuNKQS3iuQAbo6v9rO+PWOI7kKfKEDeHp4qIUZ0hrwsI1id34jLhAmezB1VVf+Rr+UQq0SS7frmu/cY4jYt+HKg6NNP4OhXvPDXuuz9h9A+td+GLbr8SeIpHeK5L/NOpND3DUPY0ByAOeah0tx1V9oOA6xZQIZCd15uHYkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792179; c=relaxed/simple;
	bh=na1/Zw24hI1uKkKNkkoiRtkTYgr19cUVzwcpNyunse4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fa6m7Y4d+VBLfGE3KN/sy1skLoQOpNn/0M8D5cCC5Qt3MTdK4TSEWHen9jMcvL2AkPVm5Z8gX2xHQPZJMF1zZiQO0zG8n6gFCLTBBYwSc7a5G44mV99VQLXtuEPRbM65191//ZZU43nQuqvkE+FGqCwgd4RrPHmjxJubcszuirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FELFO+EJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JOk1006425
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWARJA4TOUUcn5s9GU1UvI0az8KnFVRHVyq68Mr6JyY=; b=FELFO+EJk3iTsq3E
	R1YaD2noOJiXdFukqikMq3veVSAns5RdQ28BTrRn/M46I2RR4lfuJ8kVsCLMFr2T
	ygQz41ddOJH2j0XPzNEfi+CzuYKKAMel7hNUIKimNEqq/MyOj+Dn6mg11yFWUk+5
	5VMEbSJWcfUWX3U/TmI/qP0lbuEKX+17pqu/DD8A7xmciDli/I9vP8bjoZpUjimm
	Alm1JaJ7veWLh4aXiOiCQlJFDXzxvmHsaNhA+e0p4nk3PcK0ncMYOZhqM88Kt9Fg
	reiAB68hTp9hwC4BaHDVUn2xCgo2WMAUp/Y9UjLhFd+2EfM1Qyxv976um6PoKKN9
	gD7uQQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1atnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:29:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af5a8c67707so3981034a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 01:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792175; x=1745396975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWARJA4TOUUcn5s9GU1UvI0az8KnFVRHVyq68Mr6JyY=;
        b=udX7Xgn+xpK3dEzSZSrAH1fsoOr+BC2DkfV4mULyzEJ890a965dD6yhO0++ONNwdU3
         wi40tUyRkNTuQo6e+mqrZ6vH0fBtP2dW3Wsw7AJPFm6HIDgO7TziZCaqpxaguV7ZRbSz
         c9mWDW4IqzUWalFg4IoqjBba25SkLom9tgS84+n1BNBML2AyDotLG88SGaQj8Qz+fety
         LJIzu1uVTMUQ3X89RWtwusqnT/F4S6ikqXxxTsVtuP6Rp40+Y7JCwMFRk14O1fNIVWvm
         +cROAucLJNwl4hzlczGSLjJxUE+Ovn5bIC/nUPevZYhXmo6QNfALQABiNVl0B1YipSXu
         WfHg==
X-Gm-Message-State: AOJu0Yy0sXn7JIlUAYc2RG2gJA9B0f08NdfeB5bcQHFym6N/Ndprydg5
	oljIJRvczWzntAVzre5S1ILTyHn7/WN4iPnU0tjMX3yVLEum9yusJXkJOJIqPgCGPQgeQiTc85L
	NwWkTfsSSJqFU5xQz+yxx+PgaW5Qpuy6wVYraCJBL3e1ne3TbfeniE26hKZiU6knJ
X-Gm-Gg: ASbGncuGqZusvGYlTlY1YXltvY/wAkA5FyoPmGNml1Ejux1dMaic5hlsvns/V7lLi4o
	w8XzhYCx3tWoTOdNlI5nmWV5x2EuGGHDJQfGcs6xvsS5xcDLdBzUowux23zJn++ymy70aYxJ9Vi
	yHJsN/yRwJpqG05alvGu/Urh/TJjOc9M+8lwE/ITTAklaM/+5PCNjtUrJ6HC1c2YG3x13SEUKCg
	Lw6zpkDdDL1+Tgl4Qf3zQ1oIQoPOM0c2Z/eQSV65GFYF0nTi3OTLPy5//dt5QuBXDq7xNTLZLlz
	ZFT1Fz1tvnYQx6xbyFIim5gVAvEh2q0ltpuFoBHHhqz1Tf20SqYvaLSA+9c4GN/g/FU8JcHtkIf
	WhrFN549W/QhUCa0VKR/XoA7GZ/XC5nN1+j1GW01Qufvk44M=
X-Received: by 2002:a17:902:db0d:b0:220:faa2:c917 with SMTP id d9443c01a7336-22c3596db15mr16780745ad.34.1744792174753;
        Wed, 16 Apr 2025 01:29:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG06rUxrdzAHKOZGs+EmUFQ4eIFU9Ex60xOVoX1QsrCuGTbmlzASmqV0FH4//IiXg4bgYsd6A==
X-Received: by 2002:a17:902:db0d:b0:220:faa2:c917 with SMTP id d9443c01a7336-22c3596db15mr16780365ad.34.1744792174341;
        Wed, 16 Apr 2025 01:29:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:59:19 +0530
Subject: [PATCH v2 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wdt_reset_reason-v2-2-c65bba312914@oss.qualcomm.com>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=1346;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=na1/Zw24hI1uKkKNkkoiRtkTYgr19cUVzwcpNyunse4=;
 b=yjnfq6g2dSPN2XqgCgNy6ddNjI3ndxAMrR4pzsbwEpRmPnnFBvnc5FqqrWEejDn+lU8Iz9Ef7
 y57tFJLJdu8BtrZDUzr8NOENBpRmI4IfieN6worrjH2OBI0pnB+Imab
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67ff6a70 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: pIovZT2nABJY6zfNe1k0O29Grkoc4ZGY
X-Proofpoint-ORIG-GUID: pIovZT2nABJY6zfNe1k0O29Grkoc4ZGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=891 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1



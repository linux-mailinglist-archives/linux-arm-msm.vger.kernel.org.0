Return-Path: <linux-arm-msm+bounces-106495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBU6CxnI/Gn1TgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 19:12:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A684ECBC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 19:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 199183067C40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 17:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8093EDAA5;
	Thu,  7 May 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDVBFLwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amU5tuD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D4D44BC94
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173747; cv=none; b=F5puX5wxJYJsUHWmJPoL3qn0uQEDAbHi5mGkLm/GFmp5ziqi5eGAISiEEBLpQ4kyS3D7Ijsn2PJlIi5g38f3rr6y+/25Me2TdZYqZGfotXwGhW3WlvvJbhLQE05VFV0MZUwNuOzkeupAmK8yzmRUAB81SDujNqpNGRV654vapCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173747; c=relaxed/simple;
	bh=fGsX5jTijVhsczN9EAOXSAXuYzgEZRfNrDPIE9zpGUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KG5CNQ9Hj49VBC1aKI2hpWAd35ofKvii3MdLPXwK6ETn/Eo4BadoSRNCxhq8Y4k09fhweUwM6ebuAmjSJkWvBPrMfUyPWXoao4tuS0rCQ3ltNusFyyqSiv2dEuaE7nH2qWtDhbubpWGQaAW++Pi4Xti5ipoqUdzfowYAQI9w5Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDVBFLwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amU5tuD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BenjF3157738
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 17:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QxELV7B8rD4Ykd/BB9siA3zRacO6nLC0hbHJlnTx08M=; b=YDVBFLwUAzI6xDMA
	59bTBZ3ACuQQwphWvpZtXgG8K2US0EvCqQ7O8o74/jTIWvEsLylG7RWZVGpp2BWp
	8+sGdoAbeVJJKLTd8NuehhwfVAOZIjogUJs3fXNW6tQgUhGG6ZhENZVMo9NOglKG
	xp+BGCal93D8pQ9CeOnaoOOeKfsqsMv9chWS5c1Gg5LKCYk5o3d3MkKPKv7el1qy
	P1tyN7+TT9vO3rdbc5sZ6r/0k7kKZof17A0KF6VDLAbPdgzIwu7x+IqR4lq2Pcyb
	JtQ7oSOH5xFRwjS4YKiq3ZYOBN1NKerPU+eAWzzaMnb5pqCIXQrdS4oZ9fx/qzS1
	fecAKA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf2rn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 17:09:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso11968555ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 10:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173743; x=1778778543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxELV7B8rD4Ykd/BB9siA3zRacO6nLC0hbHJlnTx08M=;
        b=amU5tuD31cIHmrIixJuY2y/zJCATLlZw195XeVHm0io6Vheac2/AsgRgERLq9/DWPw
         ldm/AWNkSjPLYJOb8h82sSbwbmzXdmPow6ljSImXHZYGV3z7yBF+kOEedjo8N1u9gecP
         e+YeYPkqBosbdBCXs+IP4zxac3gifgeNRmjmNJLBc70nnHDLM03xkCCfvYcrzn8oS+bk
         SwLLDBDZrPaiwVisfLgPFnQC6XcVLiBL6NT9/jfQc2Afvi4mBif93uBMdWd/H6LRJZdW
         hwhxX4stElIr1h8RexJR/pDUnHuAYQv7Hl9UUnDHv8mjygPU1q7Vm1g578bvrqJGj3/0
         VzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173743; x=1778778543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QxELV7B8rD4Ykd/BB9siA3zRacO6nLC0hbHJlnTx08M=;
        b=LAmUPSZzpPFbkJcDOYJolwMbIcgdNCiJpNctgBUBTS18fOdV5AO+bzPgsoBeFX9X5V
         LLneJ5LWMVk6cBk7NO+psefA6u3hcIpkNOnoJtCyOn4uaH2lpkCuxUTcuRIEvU9QCR22
         31I6+OSC6lmbNeTsltM/LqVE73Yz1/+cOHpsH9Di6Bez2vpO6wA3lCGhk6xUCAsdMAIP
         MeXODZSMyj8YMKSDUNYLJt49aCESd1jm/tzEaDc/bBPgYGcOUJDZDCo6Mv4f2A5fxy8x
         Etvx1JigewzPldkqZpQUxdyvL8Pcpkbz5GE4h0SwH77THE3ACU+WnF25+mw4rF+aGV0d
         k13g==
X-Gm-Message-State: AOJu0YxNU4Aa8Jcohy86RAfaAH/juc2WAf+v7DKxS/Q6uOZHt2KcjMvC
	ULG0QOp6iT/syBN7i4XLDKHXMqp/lDEdsIF8WsiqOBmCGrEMEfvxTbxDWZvDHa9viC/yGB9G/8q
	UBlauCocNChdEfaqjQ9eeQUv3lZhSM7ZUKTmf0QFSDY0Gp2HGdujZZWx3v7Eqvx4j2BUx
X-Gm-Gg: AeBDiettXUDP2hZgJQkeEGOuz8+F6CQaX8aAiVOYzCpTghSCwxKvGEvQ3f935GB3u0+
	IW/AwVIHFhAWn0VdqPC0erosP7KyKRoXF1wtZX6ftbUURB3bJIh/Rg3R0J/VjzE43PH2poPbO37
	QleJc2XmsY9DfeVxrQ6bNXP7g1kU1hJo/WJAFvYHhMCENHVy3Dc6oYoJfz+yFzWYemgMstsRn5J
	8toRTeAvmOKZJFwvt+l6Fjem2kb0tr2AGim8ym32kUqxPL2Lv9IgqkEH27iNWbsLjaOoY+/OYb8
	G5dWF8VDFNkFt9HJOoRHRDy5A8XY16MYiWoFOTowtHRz8Ck10HQp6K6M05NamMNXZ2Tx76ZAZg6
	PhPd4dBafYJSm3zqQF1eFTt5lg0gDo47Xf4h3YJ63oVr/brmXzUz8chiU+oGuOzxy683QQbI5nN
	cLYoWM4w8ETuDyA66tJxBjHCEGJp8ip30x27ctX2uu8aFXzqrbUvX6XHXi
X-Received: by 2002:a17:902:fc85:b0:2ba:c453:ed3a with SMTP id d9443c01a7336-2bac453ef9fmr36359325ad.16.1778173742450;
        Thu, 07 May 2026 10:09:02 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2ba:c453:ed3a with SMTP id d9443c01a7336-2bac453ef9fmr36358945ad.16.1778173741932;
        Thu, 07 May 2026 10:09:01 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:38:30 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ipq9650_boot_to_shell-v3-4-62742b49c991@oss.qualcomm.com>
References: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
In-Reply-To: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=11166;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fGsX5jTijVhsczN9EAOXSAXuYzgEZRfNrDPIE9zpGUc=;
 b=IOafgl7q0CvdEJgMBBtdxuZx7X/Mibhz9G7LkRcijI9RVwz8WOqKwCk/COmEyJPWQbTsknv1C
 vWeV8Ou2itIBW+c7/SdB1kipT8BZTO1xG1iUNl6Ii1bMCuYSHkAEo6r
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX1tFzjr0P8zif
 AKUvJUT1EsX+0XC6JsiaUSviAs09qduce1c+lo1SN+hq5zS87P99naQv9/R9YKQo8ikNUWz9uQG
 txNm/PuVzmh8Cng+uCfLsIlIp1qC5y/YOoMTLsceP8GkRqqNVan1yhh0KpmmKRBLfIfEA5IaAKQ
 QO8srVM+VzFhC9/CrjJAR1CRkqokeyI4PODMCsc411wDAvyP5eynUhkk9MmY+GZ3oA2294UZ9Qg
 zVtU9P80nXRiZ3Wn1ifr6L72ARzVoBiV9n/qd3wL8Qv8FODHdmhHXs5+M1REXk6s+9QVZJGGbYU
 5tC+8TX+TDTVOv6FFKcaC4MndVELbMccxx8oNrVRnksIQpVQ9kuXWgrZwyG73+xHiCFZP5fzG8W
 QRZ/L7wDIDCWLeepBbG696rdRd3sP2T94v702iyJu5fr7GMOuz8KV0IZn8DgmfPoq4k5XKryeNM
 Exz9vVDm5HgdS3T1Jrg==
X-Proofpoint-ORIG-GUID: GVR43IMPRxRApvmtk3dQZIs3z4ZCf_na
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fcc72f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fBkTXTPqfNaV2XDYC8MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GVR43IMPRxRApvmtk3dQZIs3z4ZCf_na
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070172
X-Rspamd-Queue-Id: 80A684ECBC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106495-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add initial device tree support for the Qualcomm IPQ9650 SoC and
rdp488 board.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts |  79 ++++++
 arch/arm64/boot/dts/qcom/ipq9650.dtsi       | 377 ++++++++++++++++++++++++++++
 3 files changed, 457 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306419..dba16311ca2b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
new file mode 100644
index 000000000000..6871f3dc4eaf
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq9650.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
new file mode 100644
index 000000000000..a1bea8e648cd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/reset/qcom,ipq9650-gcc.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&intc>;
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
+		xo_board: xo-board-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2_0>;
+
+			l2_0: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+
+				l3_0: l3-cache {
+					compatible = "cache";
+					cache-level = <3>;
+					cache-unified;
+				};
+			};
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			next-level-cache = <&l2_100>;
+
+			l2_100: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+
+			l2_200: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+
+			l2_300: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x400>;
+			enable-method = "psci";
+			next-level-cache = <&l2_400>;
+
+			l2_400: l2-cache {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-unified;
+				next-level-cache = <&l3_0>;
+			};
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scm {
+			compatible = "qcom,scm-ipq9650", "qcom,scm";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0x0 0x80000000 0x0 0x0>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootloader@8a100000 {
+			reg = <0x0 0x8a100000 0x0 0x400000>;
+			no-map;
+		};
+
+		smem@8a500000 {
+			compatible = "qcom,smem";
+			reg = <0x0 0x8a500000 0x0 0x40000>;
+			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
+		tfa@8a600000 {
+			reg = <0x0 0x8a600000 0x0 0x80000>;
+			no-map;
+		};
+
+		optee@8a680000 {
+			reg = <0x0 0x8a680000 0x0 0x280000>;
+			no-map;
+		};
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		dma-ranges = <0 0 0 0 0x10 0>;
+		ranges = <0 0 0 0 0x10 0>;
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq9650-tlmm";
+			reg = <0x0 0x01000000 0x0 0x300000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH 0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 54>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,ipq9650-gcc";
+			reg = <0x0 0x01800000 0x0 0x40000>;
+			clocks = <&xo_board>,
+				 <&sleep_clk>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		tcsr_mutex: hwlock@1917000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01917000 0x0 0x57000>;
+			#hwlock-cells = <1>;
+		};
+
+		qupv3: geniqup@1ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0x01ac0000 0x0 0x2000>;
+			clocks = <&gcc GCC_QUPV3_AHB_MST_CLK>,
+				 <&gcc GCC_QUPV3_AHB_SLV_CLK>;
+			clock-names = "m-ahb", "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			uart1: serial@1a98000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x01a98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE6_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				status = "disabled";
+			};
+		};
+
+		sdhc: mmc@7804000 {
+			compatible = "qcom,ipq9650-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+			non-removable;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@f200000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x0f200000 0x0 0x10000>,
+			      <0x0 0x0f240000 0x0 0xa0000>;
+			#interrupt-cells = <0x4>;
+			interrupt-controller;
+			#redistributor-regions = <1>;
+			redistributor-stride = <0x0 0x20000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			mbi-ranges = <800 160>;
+			msi-controller;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4>;
+				};
+			};
+		};
+
+		timer@f420000 {
+			compatible = "arm,armv7-timer-mem";
+			reg = <0x0 0x0f420000 0x0 0x1000>;
+			ranges = <0 0 0 0x10000000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			frame@f421000 {
+				reg = <0x0f421000 0x1000>,
+				      <0x0f422000 0x1000>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH 0>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <0>;
+			};
+
+			frame@f423000 {
+				reg = <0x0f423000 0x1000>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <1>;
+
+				status = "disabled";
+			};
+
+			frame@f425000 {
+				reg = <0x0f425000 0x1000>,
+				      <0x0f426000 0x1000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <2>;
+
+				status = "disabled";
+			};
+
+			frame@f427000 {
+				reg = <0x0f427000 0x1000>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <3>;
+
+				status = "disabled";
+			};
+
+			frame@f429000 {
+				reg = <0x0f429000 0x1000>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <4>;
+
+				status = "disabled";
+			};
+
+			frame@f42b000 {
+				reg = <0x0f42b000 0x1000>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <5>;
+
+				status = "disabled";
+			};
+
+			frame@f42d000 {
+				reg = <0x0f42d000 0x1000>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH 0>;
+				frame-number = <6>;
+
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+};

-- 
2.34.1



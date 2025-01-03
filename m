Return-Path: <linux-arm-msm+bounces-43827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D14A00470
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88FA9188370A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF54D1B87CD;
	Fri,  3 Jan 2025 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Piww7JnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F61B6CF4;
	Fri,  3 Jan 2025 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735886255; cv=none; b=YWjaWTFEKOivNRoQzPmNcmDwxlW64mGQsnQURHwias7LWwrwieQrpByR4i9n2WFgCtunu7Dr+h1EVE69BflsyxC3/kxuuDFXbVfeSZjXSazdgcLr5e0QeJOYL4IV6VJVzs3w/A62nbV2HzgCDdFCGJYAzrIpgTUh/CVs7FLoDF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735886255; c=relaxed/simple;
	bh=fi9dPEBpkMcdZH0fe4Kz0sZFnAZmsiw2krl61iey0YQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BjsGRkf+O0K5Bp/IjYyQW96w011dgPclDLPr4mbyJu1dsBKcXMBhsVw43LgxyMOHhzReyILvcqnnHNxt5IanmdBar2wGwEqi8Tfxpz56MnFuP7mYBmqaPSoCuTgkCRrSqyEeS8CMMT1ruJ4YIccBRGqM24bXrf2gyBAUufYHsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Piww7JnK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5031hcHU016523;
	Fri, 3 Jan 2025 06:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YC2IkMX8dAREBp3oDMij1jugeNR8aCW5D8YjM7wdPmc=; b=Piww7JnKgCKYyj4I
	tR0FAuILz/BestjDVsMIBhY+E4crUkQqsTKCHGdXICUWUlwKvzqQQR12I5yHR64s
	gyT2C5lzKox+fMSuAyjvbXo5zJd55QfmsRv3ckP3EtLB7Nnqu6yKayn3SW9UsLxM
	E17bIkFrEmLHIS+WttdUTa/tqpfSVe76GuJdqvszeuzejxUo7H+JWSHzypvnXh8b
	PsEOEhGVS54343DpnrZ2ix4q+02tlPt4QRo9GLMVHULkP1B3iyOF4WwyaKKha8HM
	mXJ6Wu/sSNeCcc4Xm/rf5YQMMGngAkGhAHJQiYnAAAOw+Hphte1kC7zlMuD3zw+v
	nbDgow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x6g0ghg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:37:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5036bUw2028540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:37:30 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:37:27 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: ipq5424: configure spi0 node for rdp466
Date: Fri, 3 Jan 2025 12:07:08 +0530
Message-ID: <20250103063708.3256467-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
References: <20250103063708.3256467-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -YNsZbGf9SvqGgUuThN9dWuWKxF_Od4R
X-Proofpoint-ORIG-GUID: -YNsZbGf9SvqGgUuThN9dWuWKxF_Od4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxlogscore=800 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030055

Enable the SPI0 node and configure the associated gpio pins.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V4:
	- Revert the 'renaming of spi0 to spi4' and follow the existing
	  naming convention such as spi0 and spi1.
	- Update commit message.

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index d4d31026a026..60cfa8708eb4 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -23,6 +23,36 @@ &sleep_clk {
 };
 
 &tlmm {
+	spi0_default_state: spi0-default-state {
+		clk-pins {
+			pins = "gpio6";
+			function = "spi0_clk";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		cs-pins {
+			pins = "gpio7";
+			function = "spi0_cs";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		miso-pins {
+			pins = "gpio8";
+			function = "spi0_miso";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		mosi-pins {
+			pins = "gpio9";
+			function = "spi0_mosi";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+	};
+
 	sdc_default_state: sdc-default-state {
 		clk-pins {
 			pins = "gpio5";
@@ -57,3 +87,16 @@ &xo_board {
 	clock-frequency = <24000000>;
 };
 
+&spi0 {
+	pinctrl-0 = <&spi0_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "micron,n25q128a11", "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <50000000>;
+	};
+};
-- 
2.34.1



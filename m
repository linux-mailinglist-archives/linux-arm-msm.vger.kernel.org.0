Return-Path: <linux-arm-msm+bounces-95793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHbeFmu9qmlXWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:41:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F621FC19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D891E30DAB1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 11:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25756388376;
	Fri,  6 Mar 2026 11:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g7aHGQxK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD735B125;
	Fri,  6 Mar 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797220; cv=none; b=lFDh3RmN9qI79ulc95Wpewbzs1gW4VdJl3cXJ15YDgXGoFe65PsgoR2pieI+Ndxm8wILuGinYkEZPLj+3X/NAD33135Qr1/rJyy0aNFhH0o30KHd2SiR4ppWypiShrnTuQSavKCGAtjcindJMa0Yqi+JXZ/DWos36OKS7gfM4fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797220; c=relaxed/simple;
	bh=RVLE5clXMZmqaaQYnwUs7+KC/qKABDk+2cTm7hqnB5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUFyU3uCHCqBFuJkmXcnHS8iceukVHP4tIXl1G5k6Hg7ZX8/TvvsnwKbqQF4P7rtuY2mOvb6KLA81g/qbPtdXScKtQHjCoFEg8tR9RZCoYXC92ni6hIVwVWGAZimZ/ourIh68TO/W1HS9TJuc1XBhxScn/LW/FwWZx+BUPrPmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g7aHGQxK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb2YC037390;
	Fri, 6 Mar 2026 11:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecHBRky23/q1tERVn6DaD1xsNrsUhW9xUXxgFgQXktc=; b=g7aHGQxKWNV4BRKz
	Nci+Wu/JhklPuJcELov5aczY3XeYNY/l5THFObkFsXtyPDn8F6NZNya70it6KIOU
	mdosLPv/ZyiqWULUELA1+Tg1QTqV6sHtj++nRnige0oB2KxchHs/6cZmlAyas19w
	/CpdleIkYUbv4y/FxtXg+QnmQAcAhFcBSHhOutCDWQc4uWxsvxRanJKljb12tA50
	E4jiXH/3O+OPFsSw83IJbta9C/aOeL6irQ5rlg/o/1MeieJfuhzOQ2+eh9UzTnul
	+FYhkoXxu5MrWxIWIDHGdwV3Yg1n57PFL/39aeylXyv3uEuZMC85hkQ0cAFxNNAy
	lejUvQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdskqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 11:40:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 626BeD5X015923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 11:40:13 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Mar 2026 03:40:08 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <varadarajan.narayanan@oss.qualcomm.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v6 3/4] arm64: dts: qcom: ipq5424-rdp466: Enable QPIC SPI NAND support
Date: Fri, 6 Mar 2026 17:09:39 +0530
Message-ID: <20260306113940.1654304-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306113940.1654304-1-quic_mdalam@quicinc.com>
References: <20260306113940.1654304-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cbuVKjSuosprLkDGPG32AnJaCKLpm2L1
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aabd1d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=GMCKaWqv3SNeHD9qFv0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExMCBTYWx0ZWRfX+pMbtL0yofnf
 GyglAq5AyH0GrDVnZ6iLXGkw9MU46uy2OEXQnioWwIJTCbnfVdGUS5qj/Ivsrhp9mGv0HceQoLV
 viX6I3SpNxmk+Ag13InqYigZPSXmD58B5vSHbcO9liWXwJrhQLSz8jzDklK8ORrx/BlHAkepG/l
 g3vz3v58MbjZIfmZxlz6X6xRjaii8Iw+xc7JaIQD5UmPyMI/2fxas5OogjyLmnJgwiJAxV9ogIX
 +V+PD3d4zY3Nt7790f6L/LGgLQ0BWB7aN6SClnwz2w1rQr4cXXzSvCpXYPGLpCXVejJX3KrNySV
 5f9x6uejRaQIhv7zg9Eypa6qm9H+74ZKYV7Uif9R5YWPL/YGUHHSIPd+79sY3zVwEGeaKuuEP34
 j4y3wqeHCKbk87brCd1UDtYeRY+wJQaHN4qF6Fl+BjGUCvm8ijlA1dWoOY4g4/uLzVEzHmpReE4
 SwXuHjs/B/8kE0M+Slw==
X-Proofpoint-GUID: cbuVKjSuosprLkDGPG32AnJaCKLpm2L1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060110
X-Rspamd-Queue-Id: AC0F621FC19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	TAGGED_FROM(0.00)[bounces-95793-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,quicinc.com:dkim,quicinc.com:email,quicinc.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable QPIC SPI NAND flash controller support on the IPQ5424 RDP466
reference design platform.

The RDP466 board features a SPI NAND flash device connected to the QPIC
controller for primary storage. This patch enables the QPIC BAM DMA
controller and SPI NAND interface of QPIC, and configures the necessary
pin control settings for proper operation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v6]

* Squash the eMMC removal changes

Change in [v5]

* No Change

Change in [v4]

* No Change

Change in [v3]

* No Change

Change in [v2]

* Added Reviewed-by tag

* Added \n before status in qpic_nand node

Change in [v1]

* Enable bam and spi nand for ipq5424

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 44 ++++++++++++++-------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 738618551203..de71b72ae6dc 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -124,13 +124,6 @@ &qusb_phy_1 {
 	status = "okay";
 };
 
-&sdhc {
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
 &sleep_clk {
 	clock-frequency = <32000>;
 };
@@ -201,26 +194,26 @@ mosi-pins {
 		};
 	};
 
-	sdc_default_state: sdc-default-state {
-		clk-pins {
+	qpic_snand_default_state: qpic-snand-default-state {
+		clock-pins {
 			pins = "gpio5";
-			function = "sdc_clk";
+			function = "qspi_clk";
 			drive-strength = <8>;
-			bias-disable;
+			bias-pull-down;
 		};
 
-		cmd-pins {
+		cs-pins {
 			pins = "gpio4";
-			function = "sdc_cmd";
+			function = "qspi_cs";
 			drive-strength = <8>;
 			bias-pull-up;
 		};
 
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
+			function = "qspi_data";
 			drive-strength = <8>;
-			bias-pull-up;
+			bias-pull-down;
 		};
 	};
 
@@ -246,6 +239,27 @@ pcie3_default_state: pcie3-default-state {
 	};
 };
 
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";
-- 
2.34.1



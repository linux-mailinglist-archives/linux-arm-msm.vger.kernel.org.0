Return-Path: <linux-arm-msm+bounces-95794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCbGHH69qmmnWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:41:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352521FC30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C8F30F43B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABF7387374;
	Fri,  6 Mar 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K/7TjQCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF64366804;
	Fri,  6 Mar 2026 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797221; cv=none; b=URN+Gl9Zr/yO8GKhg4zgPHyy8Mu4LdqbTl4veaOw+QJZ2NQwzsYLGz4o5/bK+PoPN5pcoF5z8ivGBTUAzbkjb+3fajC/+cSjPcEsNMbW1zNpCbJlK+uUscgLrDMHmJPFYjSfPNkrB0Tw4jYfRGRrN0BHDprObgXQTjZTCnLGsfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797221; c=relaxed/simple;
	bh=N1JF/sGoAcVE0/yOhipHhqIRwMZ/HZouTJK9nBKXFS4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEPEsyDB29j5G1oXATIXi8AZVlzkehz4oNjQ1mVPPvMdazsLXieijHIFdayCPXv5Q2wtc9tSJXlNsRksynt+lM341msfWt28fm/q5IMhroZjTW0aPoAUMRdxXZZAtmacBTG4g7ZW0KLm+M1Qxmz22oQHQML1e8F7eXcvBRxExks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K/7TjQCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbSkA1189522;
	Fri, 6 Mar 2026 11:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4jrLW0SU2/xlHZkGDJYRWaUYcZ2N8900DMdWvovsgqI=; b=K/7TjQCOLNb0rVv9
	IkXea8+vNUF+548CPZ1caWXbq/5tWODu4JwfVcjW9z/f1z/Ua3vx2kzeNWrmmvQk
	oX+KC+Snj3OAq9oV4ysl2b4rno4Ul6EEWi2Bpva8PC4OohyIssjGJN+iWSuo/c44
	k9CIIUwrSOpo/G+aoAwQJ1yAPLpFbQjUT8BhSOCLpHvZvru02axfInai3nnOsSR6
	XsitpY8zGJv8Urh/Kbi/dw6CJt4h4U2dEW9iQNIha+5SbNhUBCYlttU1eNnUZbjh
	npwg4kCVkv8jZ5Pmju/ceodJsv4N9ySftRxHVIj30Mk1CVg0FZU/jL8A3iVtIoWE
	ejy5IQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14g1kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 11:40:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 626BeGOD027640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 11:40:16 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Mar 2026 03:40:13 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <varadarajan.narayanan@oss.qualcomm.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v6 4/4] arm64: dts: qcom: pq5332-rdp-common: Enable QPIC SPI NAND support
Date: Fri, 6 Mar 2026 17:09:40 +0530
Message-ID: <20260306113940.1654304-5-quic_mdalam@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExMCBTYWx0ZWRfX5rbz/rAeW0BW
 ZxnNvUjjdIREPt3LosBWbZk6dBBTRQAYF9+5byFsvCt15f7YVcMJ3Vp9twK+VUBu2l6szGlKeCI
 VRik6sMtITxUfOdvqGlbwcpvwMsVtU6sAjRcyMIOEYbRIMy1VxZW5I4XqCbf/slkUvZU5rHzn8g
 cSRjiqeqkkQjayAJJs64/57/Bu69cBd2lZyoAUxixYugCWGM5qIregdizHO4vwfwpSAU0SoTVr8
 zddElp7+MLtYldOqa8gCgR1hz0q6/cUaCdTagNG06Aokd/yebvEEVpSzKZa03/z/bWgKWjmbnkB
 ocGBgDkgBuv8FeDNdY6j0HS9IVKdwK63cF4JdKHfsJwO1mLxk+pZOjgGn6sro2qTEWoJnZNfbrN
 o74pxG7QSrQvi3IoZOp9GxHLW6pj+MMffmiKp6OHeXhwNxBvEaMO4FpaDY9NMJtQYn14GyOcJqR
 +AwFjy9zvT7Sw2CV1fA==
X-Proofpoint-GUID: 5mADhFkxCwTtgteiJdPkqBBXWZhegGhd
X-Proofpoint-ORIG-GUID: 5mADhFkxCwTtgteiJdPkqBBXWZhegGhd
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aabd21 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=GMCKaWqv3SNeHD9qFv0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060110
X-Rspamd-Queue-Id: 1352521FC30
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
	TAGGED_FROM(0.00)[bounces-95794-lists,linux-arm-msm=lfdr.de];
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

Enable QPIC SPI NAND flash controller support on the IPQ5332 reference
design platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v6]

* Squash the eMMC removal changes

Change in [v5]

* No change

Change in [v4]

* No change

Change in [v3]

* Added Reviewed-by tag

Change in [v2]

* No change

Change in [v1]

 .../boot/dts/qcom/ipq5332-rdp-common.dtsi     | 44 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts   | 34 --------------
 2 files changed, 44 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index b37ae7749083..8967861be5fd 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -78,4 +78,48 @@ gpio_leds_default: gpio-leds-default-state {
 		drive-strength = <8>;
 		bias-pull-down;
 	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		clock-pins {
+			pins = "gpio13";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio12";
+			function = "qspi_cs";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio8", "gpio9", "gpio10", "gpio11";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
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
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
index ed8a54eb95c0..6e2abde9ed89 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts
@@ -35,17 +35,6 @@ flash@0 {
 	};
 };
 
-&sdhc {
-	bus-width = <4>;
-	max-frequency = <192000000>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	non-removable;
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
 &tlmm {
 	i2c_1_pins: i2c-1-state {
 		pins = "gpio29", "gpio30";
@@ -54,29 +43,6 @@ i2c_1_pins: i2c-1-state {
 		bias-pull-up;
 	};
 
-	sdc_default_state: sdc-default-state {
-		clk-pins {
-			pins = "gpio13";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio12";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio8", "gpio9", "gpio10", "gpio11";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
 	spi_0_data_clk_pins: spi-0-data-clk-state {
 		pins = "gpio14", "gpio15", "gpio16";
 		function = "blsp0_spi";
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-95791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJj3KCi9qmmnWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:40:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B8321FBDC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0775B300E4AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 11:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6EC36681C;
	Fri,  6 Mar 2026 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LuI+keRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B4366810;
	Fri,  6 Mar 2026 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797211; cv=none; b=dqXoO264xgjw7T12/bdrZ7lNhTca8dme0oAS1HLbQjbRI9kb52yjQCJa6yftL8fOAZAx/dr5yV4nf36DoCfa4FtnG2DwTLDEG5xKaQYDFUrWtiaLglMYRILErZG3RTcUx6VB3+lfCU5tknDpFMyezWr1gX0OCKiTbZfel4plVDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797211; c=relaxed/simple;
	bh=Xmw4+Xr6lQXaBOt9mvfgLo8Kbow/kXIKBDNKrpgfUuQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vo1H41PesRdbtVTHLTCHbCPW9rdLz8WlodBhN4sgLQEl+42IggpTxqkmUYVLmqiq849it7hyVfS1Tk8TZzGkOuWGwKmB2hrApAoax+j9jZbpEaF+K+vAypvCdtPFR/44Tr+6T1AjnIEdVeMN/mktTOIsZAzr32MkY8JPY+6/CNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LuI+keRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbFOU4150967;
	Fri, 6 Mar 2026 11:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eo9WlZpQjAZb5Qy8mi1Fgm0Ywes5MXLEHNnNumDzWwA=; b=LuI+keRpXHuFzPtm
	9/kONuxVNpRTp3H/aqg5t6Q+t3twRUHIVvLyubrjVlwomYtqapuDKUsCjMt5EMQ9
	NHQibH+2DKS3jEhBP0P5z0L2k3hRXdA9q+KOuEUECCsbbPqGzzJbZiEPi7ynXsi1
	MEyQMzTmmcBRCjKdfAtyRM8Z/0xmgGs5WFwGfptKh38yhxMbX3MTs/eyxLAJdj+y
	LnrPNZ5m56kLV259NrAY9DN+/FaSMi5oVq742HfxuBRQcV+rlClJvlsITZDr+gtv
	fOXA8JjMOdSMawM6f653ev+2Pxt45+oDvTIebzcOy5gkaABXmk5CTtAHUAHo/nBn
	pNE9mg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqf25u0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 11:40:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 626Be4k4026641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 11:40:04 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Mar 2026 03:40:00 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <varadarajan.narayanan@oss.qualcomm.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v6 1/4] arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
Date: Fri, 6 Mar 2026 17:09:37 +0530
Message-ID: <20260306113940.1654304-2-quic_mdalam@quicinc.com>
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
X-Proofpoint-ORIG-GUID: d5r3a9bL-mou59jVyPuG67ZPjxt1o-5f
X-Authority-Analysis: v=2.4 cv=Uvdu9uwB c=1 sm=1 tr=0 ts=69aabd15 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=XeRMpaAEaMlpgmDeE2wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExMCBTYWx0ZWRfXx4p+kHYbvTAo
 4XJ/GUqMr70CHBt/wPu42FepvR5C/C9Qng3f2lJbjL9u/FBWKzcqgmOCWAHJLU6BD83iFc2X3A8
 tCb59sZAF25FTxVWwB7oaUm2Tv9OeiCjLotE0gGj0KkiqnCYhMt77hPVc3WQ/nRJSFvwfDjhtkS
 +Upkl490jeomlQ9aL6P6zUupkUL5Zwyba0YhWIhTd15+4G8r0WLRu9H0wW9V7SvazpudzXYKAoF
 e2eToCiOxoHV59+flvlpXmRrHsNII6vsdJJy24FdPOelRGCZw1IrVdZ34G0NGdW3mCzmOGpUOIp
 CfRWKbxCBbWRyMIk4zFcGEJf1O4n5WQR4EMvGvvJen3cFXLX6myJwbsV+QtkBfDA7c+7BIy5SEG
 tk1E45+Gok/1jyesZbBJrE4Lbghq81MFGMXX87awB70iqf8cljd36yny6vmH7OqRT+PyeNOl1yP
 nU4h5Comb568UELw02g==
X-Proofpoint-GUID: d5r3a9bL-mou59jVyPuG67ZPjxt1o-5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060110
X-Rspamd-Queue-Id: 99B8321FBDC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	TAGGED_FROM(0.00)[bounces-95791-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,quicinc.com:dkim,quicinc.com:email,quicinc.com:mid,qualcomm.com:email,79b0000:email,f200000:email,0.121.211.128:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.119.20.96:email];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree nodes for QPIC SPI NAND flash controller support
on IPQ5424 SoC.

The IPQ5424 SoC includes a QPIC controller that supports SPI NAND flash
devices with hardware ECC capabilities and DMA support through BAM
(Bus Access Manager).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v6]

* No change

Change in [v5]

* No change

Change in [v4]

* No change

Change in [v3]

* Reformatted clocks, clock-names, dmas, and dma-names properties
  to one entry per line

Change in [v2]

* No change

Change in [v1]

* Added qpic_bam node to describe BAM DMA controller

* Added spi nand support for IPQ5424

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index eb393f3fd728..f20cda429094 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -572,6 +572,39 @@ sdhc: mmc@7804000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x07984000 0x0 0x1c000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq5424-snand", "qcom,ipq9574-snand";
+			reg = <0x0 0x079b0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>,
+				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core",
+				      "aon",
+				      "iom";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx",
+				    "rx",
+				    "cmd";
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0 0xf200000 0 0x10000>, /* GICD */
-- 
2.34.1



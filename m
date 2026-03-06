Return-Path: <linux-arm-msm+bounces-95792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCIKBE29qmmnWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:41:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017121FBFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 12:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B24130B659B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C25389115;
	Fri,  6 Mar 2026 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XxNNVd9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF3387570;
	Fri,  6 Mar 2026 11:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772797215; cv=none; b=p5KdcINt0I25fbgPvADt9z7ieWxi7uj5uyq/Vidh3xj8d+O/tIco6y+tLZMyaEh+JovNBjYebnQwt4OD454fKlUOduuFhRkYgX1G/7Ov3NU3IJUpHJLLUsTCQDJWJfc7xIaesqlG741Hrm+FNJ00y3NCyPGY56BD35QGAFheMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772797215; c=relaxed/simple;
	bh=HSwDjLkSW8G7dkwqS3mvTwdsKr6ACx/8jHCK2pdWh9w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pbi4FceMkdlhgYQptjGAaZtPoKbJnkNnJWS+YtafspMfxEjZIR0E5dDxF/qBMCMV1+wCm7cxPA5T+W1C43gTkSfPfVceqnkuaVlQCAqIOZ/jtXECSrr16xitQ9jLubvA3zt1iAwZpDb1BjD/aN4o98vxX/qMnTJJR/qmuzp3VxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XxNNVd9b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb4Ik1189035;
	Fri, 6 Mar 2026 11:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vUwgG0IaCXRoJ0sTxyIwn8Nj1eZuTdC2tY8/MRUmhl0=; b=XxNNVd9b2Fl9eXoK
	7NcfBZnpEMNOambyRXdZ1bUB8lnqJCCAlxO1iCug3330aRBYXQ51VPEFwdGiTH4A
	tgiNzKDUIwwRnUNlbwlcirRh9M02ARImv02CmHtCnQlI0Nc/4eUUrEZe8qaCp9+E
	A+TfuNM4bBGnxo0ZhhY31wJlgz2Nexe9SxZ4kXxIaHfcn2tKfx491LSr2fk5iac3
	HM6t+xeC3gJQubaJ0zf0XycuyxzCR/lHJumAzhZOZvNtiiK7g3wFC1Wn1V70vPCM
	pbL3nE1/pJ1nkSJ6BhkMmcw8cKWmfSImzqnRQuZXZTTtPqloxWOOSr3O1C9O6pgP
	PUqbyw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14g1j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 11:40:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 626Be9S5015717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 11:40:09 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 6 Mar 2026 03:40:04 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <varadarajan.narayanan@oss.qualcomm.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v6 2/4] arm64: dts: qcom: ipq5332: Add QPIC SPI NAND controller support
Date: Fri, 6 Mar 2026 17:09:38 +0530
Message-ID: <20260306113940.1654304-3-quic_mdalam@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExMCBTYWx0ZWRfXyaRDTcAp4tTg
 FBFYqENARKNsfioGwP3RMzlOv4GFeI+0C5FA0G6Rbrgu+mw0HIA2/7nr8ck964OCcy7hzLyHNnF
 rnNscQ9Pfok4zEdVUGPc8eY5xGcdKT1PMkqic8LYHsC/5jNhsp9CYlOSIWZNuaOpvw0o9Ihv2Xg
 ii5S1oBClovBf6bB/P93/0Tv8kvlbByY06mZQHrAaTyX5yiYbPeBJvzHI3tkX0XUJPw/WEwAZ8k
 wYFMuB8r27tZ/7X2o6MDb+WyL49FTitfvsMq8zLrTWBBi9hCPRDb3XuxzGK8gZJAhpKwhWyMh0j
 q4xMUZS5oYNV1tqA2yHGDCj/ke0zHChQqNbcWwZuTUWZ1ryFb5ejczWgq+YG/zsLA+W5JohuTB1
 ZLUa0/jv0fvsFvXTCGE+ZzZ1SyeJJ01Tctf1SVnQ7yL0TyPHCWnvC46+ZMSEm41Tz/IIHYNF+2p
 zwtbDq805lfmLOK30JQ==
X-Proofpoint-GUID: oTOd-54vxTf07frKNMpGRzAWoNRu-Rws
X-Proofpoint-ORIG-GUID: oTOd-54vxTf07frKNMpGRzAWoNRu-Rws
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aabd1a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=VHB9PrN7HM_nvZoolp0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060110
X-Rspamd-Queue-Id: 8017121FBFC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	TAGGED_FROM(0.00)[bounces-95792-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[79b0000:email,0.121.211.128:email,quicinc.com:dkim,quicinc.com:email,quicinc.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,78b7000:email,8af8800:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree nodes for QPIC SPI NAND flash controller support
on IPQ5332 SoC.

The IPQ5332 SoC includes a QPIC controller that supports SPI NAND flash
devices with hardware ECC capabilities and DMA support through BAM
(Bus Access Manager).

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

* Added spi nand support for IPQ5332

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 45fc512a3bab..e227730d99a6 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -423,6 +423,39 @@ blsp1_spi2: spi@78b7000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x07984000 0x1c000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq5332-snand", "qcom,ipq9574-snand";
+			reg = <0x079b0000 0x10000>;
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
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5332-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;
-- 
2.34.1



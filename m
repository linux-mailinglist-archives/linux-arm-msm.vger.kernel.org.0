Return-Path: <linux-arm-msm+bounces-93645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FiwIKsmnGl1AAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:06:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC9317481F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3399030197F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD3635B62A;
	Mon, 23 Feb 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F7LTmlKN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F8435A927;
	Mon, 23 Feb 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841179; cv=none; b=TmwhaEgMoaAr8BWEqqDdDqbNE1nicRgdYeJdt7RFcoJc9Z0xfj2fqA6978xcroNfTKD8HdYT9EGQMvufiCL4wATfErlfYcQwmJ44QxJ9wR50FKHO+xFbuIyZiDcsY0Ch2KKNY4XEbdtDmW4jxRneU3NRqIuqWdP8JcI7HwdYs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841179; c=relaxed/simple;
	bh=v8mX3EIsPkzxfDV1LxDI/7roAGAs2Fjl50ESAcAUtxA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcnnxIi2tjAMGDL6zYe9n2EpK1OaN2Dr8WTK3tULkltvZhiqOKE6PcHlCOk8qOT/Y5U2t47ECgePZGF5L72W23rOeyUT31oG1zGS1v2BRfQTNzS6KpGsrHBZHKwPj9fpga/EHTcSUzbcBSPorpfE+UlURLEpJS+WwZ4ktmPhmhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F7LTmlKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNUZ1E2013890;
	Mon, 23 Feb 2026 10:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxD5sy1vuNzVRWWZn4Hhq9EY3cpuxaxNEb4RwknaWgs=; b=F7LTmlKNgER3MVtn
	JkvhgtwPYdTPPuY3TUglWlSyhZChhQp0z4Gsa8OMK32ETfLbDsoW2Ow1lBAjWaeh
	DvovfwnMbo4IC/77MH2CN49zeKXTWFUFim7mb7+7mf7NQQsM9GjQUdnSVTf/jDcP
	4jNI29YNqjnRjKfgnsTV1ta3ZZy360pOO4zuIdWkEYBgu91LkU2kmDFbQnvwBFlL
	Y2McsVetMEUEO3RVB4XKMz7if409vUF1+vEkQ8+W5UcWfz2Vzc8izFcc4pFpuyDC
	IgMQiNcEr5Ug3RJzxTJUhNXrqV7df1QGU2oWnm7A9geL5yEQIUjTcYyNiWYjzF0j
	dIVNuA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbca4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61NA6FTH025559
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 10:06:15 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 23 Feb 2026 02:06:12 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mdalam@quicinc.com>
Subject: [PATCH v5 1/6] arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
Date: Mon, 23 Feb 2026 15:35:47 +0530
Message-ID: <20260223100552.1050303-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
References: <20260223100552.1050303-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-ORIG-GUID: fzbp0hJj-8U7WWNDy-Rctb41Pqf9ahzJ
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c2697 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=XeRMpaAEaMlpgmDeE2wA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fzbp0hJj-8U7WWNDy-Rctb41Pqf9ahzJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NiBTYWx0ZWRfX8ieGNQUwh6dF
 5cv4Wp4AtRdd8Kdgi8jQ9foxoofYxcLrEF/2ENIZKsnj/t9PpZnb2C/ZketWJb+AuVL03HN/zxw
 eTuE/ffHa9ewQB43ySyjZSTVCW6XeXONbJ19tOwh7sxu1xUlfwmQxRtqi7HAeq1tKCHDMTUEVuz
 OBhoj2ncFkaRl+sj7QdwV/LWY/9YECtg7LYRonS7eHFQHIEw1U3ioJ1AIhZaQTXqcljrnBN3uHz
 y43zefumQwFXiXX7g/uz5xXHdLHzQdmwjZHoGZdc4+eJ7FR/3ZqPHUieCfoJflJ/jPimMXC4VAv
 x6akhkuTL+OoFQvpnvn0qwnmDQAdm2p+8xsrYGGDctKhySueBdja83nFJXc+YuZkv6sm5iMelKb
 AZndCvvbjt/XPMo4EBEJfTIHLYU6zbw1VSbs9zA/hRWBZGlhBm/sdBBMpMYxiTbKuRDBcsb6njX
 JsPE7YIzbl5QgH4v2vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,quicinc.com:mid,quicinc.com:dkim,quicinc.com:email,qualcomm.com:email,0.119.20.96:email,79b0000:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93645-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.121.211.128:email];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AC9317481F
X-Rspamd-Action: no action

Add device tree nodes for QPIC SPI NAND flash controller support
on IPQ5424 SoC.

The IPQ5424 SoC includes a QPIC controller that supports SPI NAND flash
devices with hardware ECC capabilities and DMA support through BAM
(Bus Access Manager).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

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



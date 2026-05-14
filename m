Return-Path: <linux-arm-msm+bounces-107533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNWoD+pvBWoTXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:47:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC03953E7AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E3243037475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB213A8755;
	Thu, 14 May 2026 06:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DxJpSvc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ECIMWRnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16838F929
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741160; cv=none; b=sWFQTpEtZKoPlAKZjD2FL0asTN1+4lKKmXT7+YtGzW4UsPqHN1OoogPn+5DSSOy/gQBCP11xnd8ExaCU5tMY6fkAq3oOfMIqxehhEGKa+GgtwcbMTuL4GJhk4QXIXhaErKjPq0acZDXcdMFPo7wIOiVXifOAu1MdhYP0r3rN6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741160; c=relaxed/simple;
	bh=nMhvxZslWNDs8AVaAYTiaGZPDIUm74tSzi5558Uwa54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lv2ZR1P1HVwKwy1gO8GljnZUZenVm+3F76MSiTKYgozto2I2C7iSPTXiebd1ksMv7Jr6ravLKpgziiAcfzXjqMFjWDsLBaFZnlrM01XtSXHv2nf75DStKAg2RTyQUIR4AYCLpxdOIRhaqk9FjVHNORGhSz6Pma4ur5WaJcSf5Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DxJpSvc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECIMWRnX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0sdDV1620234
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNQLraJu9ipq64mXFo2hKvkBzYSACj+4yXC/i3vs0lo=; b=DxJpSvc0ejLXuMBk
	oESOzaeEPEcuxKDZ/dwZx6E/AuPFuP6/PsQieudlbB0HztRo1VVh/ZZsk39WoOPI
	vyXX8Wh0piCkmUOWnjZK07m6N4jkyHyQtit5tviZHnVBorFlm3DVNA7MliUTwr4U
	k6L+uKxdK7C2X4+iMHdEYizOYV7fm4io5EmwA4BKpgSE9jTKRBfFr7sQtU+KXRwl
	MGWcY78TwjScc6DWDPL66mXY2xrebtEp71ZCREsRB+DX/RlVYKCV5sEm2qNT8b3R
	lF5JqAz5c82IPtb2VYcyq+lM2nyROHjc7yPJ7cCz7dL781S0COOzeHNc74DzwEpp
	WtYqww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rxh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so4315294a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741157; x=1779345957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNQLraJu9ipq64mXFo2hKvkBzYSACj+4yXC/i3vs0lo=;
        b=ECIMWRnX3pdHICvZ37ClGWHbrkDrevQiaVN6oGNGC2qICN2G8Imguf1xbuBE3TThg9
         cIk1YpwBMn8fkfsnd9zPEiVeb0BGugRya98fAwmI10RtLWAEERYQpr/YbIRSCbfcvtcr
         SMihUTkMN0dOm+djI1vQrtvoob4EQ86fsjol1bQEXlpYj9iLUr2LN7JgmK8G7FkuhgYJ
         L6SzKzYTVQjoNwaG/ay2YCGoZlap6tifi9pd7v2QqRblBvAXj93y9AXwLIkKOVkK9PiX
         IMM+4TFW5Ni57ZiAy55ybUl7MSYcXozJcRKIx/6I/o+94fxOoRQOno+/oVTjRaWE6mwx
         ukWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741157; x=1779345957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MNQLraJu9ipq64mXFo2hKvkBzYSACj+4yXC/i3vs0lo=;
        b=QeMR/fcxMC/o2LkTbC379tRO8kTuJOq/2LoJGRfOHoJk//ssf3p7/vhlAPuSUzWB6J
         jWanvGb7iYpY7007KLMIpJPJhW0DmMcDAIKdcWa5lwmTv7HEW6t9x+5vs0xX1QaLlk2c
         KBAEU4qvh2NYmv4+iw/CR3IvJ0PBG5DA4JA9+JlxcK931B2YMnIbpeMgy+DFIZmvbjL0
         vUnkiEmTYR8MzAbZcHetkUqZoEROw8W04RyYZFC/P9LEoduFPqo6Dnuu9eIvVXDlDAg9
         ew8KisBFRE+IKIdWqFtucJfjW3NGe5YNnx/89NdsCS8IU/HUtMbur1MXTwNFJUBChC/L
         OSKw==
X-Gm-Message-State: AOJu0YxSJYlW+pnH93vOtZl+7QCDUTuoPNqISinx8kkeP7Cu6RRl7Ojj
	6536VBMZVR+JR6SGRdSUv6Ciikai2HX8NYmDif2rK5iLGBicGa4AqXLMvAK61O4iF2QAtC72zAm
	2u5BaHyHboEXDPPDOCXQ7MjSwbY5DYqblPnwQoKw3tBJjgc4xq8C6uY8vrUdlTDDHjVbh
X-Gm-Gg: Acq92OGJYnWd8gowWZ4UgXm6XvC6XF/7OYoiTL/acghVbJbqMpQWgD41q9ftEHAT3Oq
	FeWO0aXEZrUpTmOvkzlRblg7WJ4k+9bKFhOWm0s6q5/m5leEUPbyklyLPqpOl5NFgWaa2yVqas/
	apkCneCaA1MZwhhsbInvni7uJxM4zxJ/I1aGfFUPPC3Si03zdRQWHDaMuxYj5Akk6Wdrsm5rO0i
	Q7h3iw42AlrDDPMIxKzGv849XRFBl7jYCBpV0CnclZd3w3cpQLxk/igc0WT7O2+PkpGqW855pIT
	1L4K7JCjEoN6Y0fzcxhE9iMHaRCFuvOjpILtbtBn+UGrCZh6WXFtIJPi039eaWILaXCou1cpRcN
	nnlWmYkKfFSnype3kyesPWghx2feg1ZMP3oqT22zaS9CTL/jfepcSQY3TpTwfzh4/Hm9f5s7g9Y
	1dR8YLpUDj1XZEOFqeJDpRwHnXU+z91v3ZyqoiiID36AvClbP8N1o=
X-Received: by 2002:a17:903:4b03:b0:2b2:a267:784a with SMTP id d9443c01a7336-2bd275c818dmr67835795ad.24.1778741156772;
        Wed, 13 May 2026 23:45:56 -0700 (PDT)
X-Received: by 2002:a17:903:4b03:b0:2b2:a267:784a with SMTP id d9443c01a7336-2bd275c818dmr67835515ad.24.1778741156203;
        Wed, 13 May 2026 23:45:56 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm13387685ad.49.2026.05.13.23.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:45:55 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:15:32 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq5210: Add QPIC SPI NAND
 controller support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-ipq5210-nand-v1-2-cbdd7492e826@oss.qualcomm.com>
References: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
In-Reply-To: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: rsVLx7SgPTiHItV2KaYz5l64K4gdazjI
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a056fa5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XeRMpaAEaMlpgmDeE2wA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: rsVLx7SgPTiHItV2KaYz5l64K4gdazjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfX6190GSS1KXEo
 0LR9s2OzpCxiwFA0pbGqPVOngwRRGG8bZkW71Hbv41Jm2JhwXHOYclMrG9Nhjk9EEoPlXmheKHN
 yLnrgFlWPv/qPNwk+/K5W8IxcErSiOWqDO7FTfOw+6+mk4HWcdzVcGL6tPRQQkVCwNDYuGQwBDU
 hr6X43G8UPu/iA5V48WL5CQXWfRdtsxW01JHvHJynOddvaghesoWE2ZS3HhQjHisM19Hb38Au/S
 hWqwWi1coWoRH9ST4ICSKfL02KXhRZGtHRRYDbpmWn3ks5PSV60IwPMxJh4Y59lanVV2fcYYeIi
 SL8pvV1RY/JeILRw524GrJgQPj6ZlMFBtnyIxmWHU0ThdyeX9tMopUeo6XJCwj+7uDUAnfyfQmq
 9Y1yU2IW9mSE9mNepq7VHHvrN4HUcPpG+8StjErZcQu3n9km0aOJTOOh4aCRwEX4EZKyUK++man
 u3i8FeoEfHhBs96ssNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065
X-Rspamd-Queue-Id: CC03953E7AD
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107533-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.119.20.96:email,qualcomm.com:email,qualcomm.com:dkim,b000000:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.121.211.128:email,79b0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add device tree nodes for QPIC SPI NAND flash controller support on
ipq5210 SoC.

The ipq5210 SoC includes a QPIC controller that supports SPI NAND flash
devices with hardware ECC capabilities and DMA support through BAM (Bus
Access Manager).

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 42 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 29 ++++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..4813662c2d6c 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -20,6 +20,25 @@ chosen {
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
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -36,6 +55,29 @@ &sleep_clk {
 };
 
 &tlmm {
+	qpic_snand_default_state: qpic-snand-default-state {
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..7fd4291caff2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -204,6 +204,35 @@ sdhc: mmc@7804000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x07984000 0x0 0x1c000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq5210-snand", "qcom,ipq9574-snand";
+			reg = <0x0 0x079b0000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>,
+				 <&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core", "aon", "iom";
+
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;

-- 
2.34.1



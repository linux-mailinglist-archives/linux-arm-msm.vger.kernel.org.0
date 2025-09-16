Return-Path: <linux-arm-msm+bounces-73740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB89B59B6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F6412A7816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB177369343;
	Tue, 16 Sep 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYXPikbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7DF34DCD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034837; cv=none; b=B9/+iPrfV2oFxBMHO0qmGJWT0tnCqBfX0KJOfFy5/asPylLztzCAkrxuOG6vo/HzCBbtVqC8KJAN5XYBD8XzpDCkyfQRnYGk1rN5ERlSqI7bJ/oix+deFEW9MF2C4uocbMq0HbnhHdts54OuV92DHeto3Ye0dDG+uaaD7jp1vhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034837; c=relaxed/simple;
	bh=EVxv7pTuTXtbJBbTq1cFIyCcb5+PnMhD77kH76TEvKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WcQwiUTgj8esNNE2S4ILAdjCorBgGNbVRMHn98GsATTgjJraWV0akn7n1/9c9xc3XmsEIT3YAyV30Vv6X2Nmsr6QqFou7hYOhl0avo5GJ8T6WmOtZMAXMJ99yj5vy3KOqRtD/gsxlZT6YBRo1v7gcy8cy5OKRXrlyHgObMq7N3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYXPikbr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAQTM9005222
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=; b=RYXPikbrLDGlEhvD
	aVn9+vYOfZluHjfcYh7dop1N5HQXItlx7J6vIlux9taW3Ksr0o0IFBiwPtp04y8z
	XdzMId+eKnYMG3w4fG5L9BkgFmq2ieC+YdcZsXVbqKDx2+pPxfgBULQ/Kci7hPSJ
	5bKX6JulQfDINT3Pc0jSZ2wbjUOGdIjDiLGwoy6VmFP0tZiMTvJSwf0uNjrUyqns
	0t8ftDLBb4VB4SC6OmsNgZeIXnAyrW/5t6G4x3aPLOl2ShEx+stZ8LbIru2iK39d
	fRDf+wQ7W2CIfRQyvDzH5ple0UZIdf69lHFubwY8M+020xOX74m6pK/6R2UJDojP
	7eCBEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u596bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:00:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-265e92cc3aeso25972175ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034834; x=1758639634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=;
        b=m6hGMEfdRqUNU/YJK/5AjEpysr0yBkTPRKB2SRaHWLDzYo1WXjnClHtiOq6UBa2Ict
         oaKoGZF6Zqp/LObhWEMyiyWhBqTQWd4MYmK/3+SRgIuviNDkvfGMLrbB5g6O2codoRE7
         RznboSNzr5Wc0ya30HPjjMQfp+diWOcXokH0R/TeZ+Kg0OIVxExDViHDSSQ2TpOzqzpm
         iOuzVWxPNTGes9SPRtpvaqS6Xzjo46lSNRRZ8XhPqFAKuVRbeEm0JQl5S5QC9Sy4LHKw
         qvpttgGxh87K9qorJQ2QY+ymQnxRf2aC7W4DTd8RVabo7dzito+fnc5Y5XlcddOnSCrC
         dyXA==
X-Forwarded-Encrypted: i=1; AJvYcCUurs+CemoWF8MH2NO6hRviNGRCnj3iuBBT0DCeq13QLms05tb4AKupmgCq3RsZYrRYs1WE7W1CdWsiZiys@vger.kernel.org
X-Gm-Message-State: AOJu0YxcP+cjdpchfizDqfmllm9xMie8kcVhOoRjIuUO6RmeUzPFPNQR
	onSXfm9vBpE2+vkikm2Jc7QknqNU8emwk4yQ43sb1cgZJ4JwVd0yMv08x4HJa1MDXfaH/1H9oJ9
	BHNWmGZEk2l3fkFfVHc4LMItpK/sOomHp5jm+jdmzv6049Wl5mnv8g0awaClaVZTmnYbU
X-Gm-Gg: ASbGncvy8jiR+a+pJPI/Q2Go+6cb38rqL+3TmJ++2rlYRTYhF9l9K6NIOJ77WR4Nn6T
	CFx4RGv8RE1xV4K3bzxkePzyHKOunLVouBvnDAILiPOoknUW2TATmoZFRW+1Xfs71cMCL2JMx4f
	yNbA9qgqiDJUlQvsLS+3w4O1kJi8D7DdyJsm44eZ5RkDE1TPw8o8nvmGGAzwCVOKnz4O04/HN8A
	+tcTxkRkABZza+ZGfIxMh28sNilk+nn4byKu6lz3O/NZO1A+EUQ7FndnhJdA6Ot+drfYHEVOCLX
	kXtRCK75/lTSmVs3tOzZBeaXMYU3lFZnU+kjO63AXAA5dlMY/hjpCsKolrM3KCCsuDBY
X-Received: by 2002:a17:903:2451:b0:267:b697:4ea with SMTP id d9443c01a7336-267b69714demr78102995ad.54.1758034832013;
        Tue, 16 Sep 2025 08:00:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPBKc4oG1+F9yCdpRJby4Lh3p3lSPbZUVoBQDNJrpw1NiMFGEm/RzOKKvH0qJ3DfP5gn/i5w==
X-Received: by 2002:a17:903:2451:b0:267:b697:4ea with SMTP id d9443c01a7336-267b69714demr78101405ad.54.1758034831075;
        Tue, 16 Sep 2025 08:00:31 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.08.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:00:30 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 20:29:32 +0530
Subject: [PATCH v6 10/10] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v6-10-62e6a9018df4@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=3663;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=d0901W5oS2IB+UAGgSU2EHYZ0jt+yeCd47Ja4xYspro=;
 b=ypJXIiKLDhluYwEsejhys+yKyfuxi1sg+qQaO1HJXdGZ4WTiJYwLq4HfkEfkd5s4xzJmLRF21
 UODc1p62681BMPylr/ac7aKK2O4W6/rrLTzhx/ct6Z0igfDR2CJ1oM1
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: cwdxUjZbw79bRsSo87Izmvtbw4p1kTRp
X-Proofpoint-ORIG-GUID: cwdxUjZbw79bRsSo87Izmvtbw4p1kTRp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfXxqFQ8EL5DMuM
 LUF4wQeWSfBxXSnbS8Qn1S2yeMY47KKCn72K31rKk+r8TLnUvE53Z8vwNEj/xNr9mACc9M6GNtt
 t7sFu2cXiTmn1IqFQnn2JSvPAMPDKLRLjSW5B5mk2LakOFUaqYZzMpiWDs5cbSmyJ3c8b9MshXG
 FCeBbBRwB0IOZVG6it984cb7fYIL+xXNAxyl/p1iWvcogT+M3G22ICg1U3h/Sm7aEFRo9YW1pT1
 0ATULSd0avRNnVnyv6A8R1VXukcTCYtjOpUZdBgqXlQ64C3Z3fO/7qsq23l3BCALvcQZQGQTvVN
 AB8kK63cMGrHIXF9S6O8DIMCjWzz0bvNGHdNEAqNINXKcRsD1vGjOCXn0nlw+SNJVaZOlQcm9Bt
 ui8OmAm4
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c97b93 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

From: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>

Enable the QCA8081 2.5G Ethernet PHY on port 0. Add MDC and MDIO pin
functions for ethernet0, and enable the internal SGMII/SerDes PHY node.
Additionally, support fetching the MAC address from EEPROM via an nvmem
cell.

Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 115 ++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 0170da9362ae..d5dbcbd86171 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -17,6 +17,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
@@ -352,6 +353,94 @@ vreg_l8e: ldo8 {
 	};
 };
 
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	nvmem-cells = <&mac_addr0>;
+	nvmem-cell-names = "mac-address";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		hsgmii_phy0: ethernet-phy@1c {
+			compatible = "ethernet-phy-id004d.d101";
+			reg = <0x1c>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -404,6 +493,10 @@ nvmem-layout {
 			compatible = "fixed-layout";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			mac_addr0: mac-addr@0 {
+				reg = <0x0 0x6>;
+			};
 		};
 	};
 };
@@ -552,11 +645,33 @@ &sdhc {
 	status = "okay";
 };
 
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };
 
 &tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";

-- 
2.51.0



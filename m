Return-Path: <linux-arm-msm+bounces-73689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25887B5944A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6E01BC33EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127BB308F09;
	Tue, 16 Sep 2025 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DImXAdby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339E63081C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758019679; cv=none; b=PpSslE4Q4GHXmzPz15TVbCxjcXi8ZoVmjWWj3jKU29r/79T8Fun0blxumtbMEQjzlpN3U7WyEySPx2/EUOZKJOVKaskuaOXJ9C8V1KWFx4E0eYT11dL+LWtFaFuWkaF/+nVpsBzq9TpBrqGKJiSRQc9pu2+2gygsfUXVNtIbEUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758019679; c=relaxed/simple;
	bh=EVxv7pTuTXtbJBbTq1cFIyCcb5+PnMhD77kH76TEvKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsZQI2erEEZfGfm1MQCjgap/lUItGfy8hrgGPhNeFGe8mvwja9Ctilw6R+I6WUbfdvtagKL2Tm94N/1oQlmBUoGPS0pjsqPKlfK1iJDufJIdCgPuJ7b704TFw0ebT/02/yOv4sLYXD018pHvkR8p2qZTNh+5vq/bth68V7vA7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DImXAdby; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABtjY003560
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=; b=DImXAdby+60nerr4
	Dzmp+kxlH5hu7V/UUx7cNOaGy4IpVMbvDPpX6nLvLVBRuTqpMdj7KtzLFF20lKe1
	h8jdrKqgHs43vf70Duy77C/ZC3FDGSwkK9bR7ayq4d1GA6WaKVAWk+lvKJtAYc2J
	KEB/qPMpzZzVtRdwwDPj1VqIiXMVx5IOSp/rQS3wKhWtoLtwksIYvBlgyXDF3bYE
	F22adXU3/lQQAG/m1uiA8nLHx+M6/A1ZGkLaqvdF4TPZWE4xgwoXa1v8HZbCqpRF
	BTa3mbsLRK7vzbCaGnECQUPYuI8xFIrK+pm0aSTYdDoLjCX5dkFgQ3F/40z8/0RC
	d2BEtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr8uea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:47:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25d7c72e163so81527305ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758019676; x=1758624476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP2WRzsTd7EkrIRJP7HeDDxQJ4fUG5rGQbk5fNbcD/c=;
        b=gNn0OYiOmdHjIN38rKBjHSeicoztH0+kR3fE7nQXBc/wjnIFUxh8IhcD6bRG5v0eFO
         FbLnR6ywXDGMTTiIACMNIDnKNctTQp5cwu3yGcD2JCx2fwOZHeXFNLDiUxdHgtq6s4LH
         YBEl3cbplhpeojGCbnWwO7HiORG5zTP3JU8+0psBbAXiKdsm9w3asCo3VrK/2S1usiCb
         NXvTfROL8uuImyy/ZtJe8qtuB4TcmuORXN9Yas2TvK10zyYPwVEIp5EDVC0VuGbPiO2h
         TlcQmCggEmRtHki8e1Cy3SC288TqnZsQNeMqgfU9fVXGgWBZUyUJWw1Lu2GEZbzn/TK5
         7wRg==
X-Forwarded-Encrypted: i=1; AJvYcCV3mCJ3dMKhlOat/Z++5ybMCPySZLdCZqa/4XWumQVsWJmXmsMqvdoYiKWp4D831DMEboVpGDdQOuNIO1C1@vger.kernel.org
X-Gm-Message-State: AOJu0YyWU9wMoUV2Y02pn7KConrw6Iwembhm3B9rsja0HIYuKsW0+/Od
	3RJI8o1z6WZ6Hl6wscz2pvYJsdG05xrlca41ybq8pKTRZURqlfh5OFzgvV6awCVs0SnVGNAOHAS
	C979wjshel22ZWc7fhnaXgWAASxPbFc5mc6R38BIdSEO0MtRP76B1AmnkMi0xYGgc8sTM
X-Gm-Gg: ASbGncvJXujWtBKwhSMUyld2jAlsW1U0z75UV1QgVQLaSkFJrlrlPGdGXDkUfcwYS/f
	4+JRMEaII9+uLyJH88iWS1icbtMrcjaS1xoZ+aTbiGllNSU9PdbHjk0DQ8QkxW8cL+ZTZ1tH+pT
	0maNBXuOArOkgGeIDEYDKPX3+PD2282AuzpziucdBSovjIfxG+HuQ65bFVnqukaD96JtVJVox3x
	2vpoUn8zXEScd5kqQbA+Wt92TB0pxWpYF8WpbYfa9IZa3ydo60D87qeOCuZAV9MCuPx95cgn27w
	7ijpYBR713ZG5SfK6pTLLvwIO4LPbPclEyw8dAExhwICiGoyzsY8kKm+Dm1Tub/LLxfU
X-Received: by 2002:a17:902:d2c2:b0:248:96af:51e with SMTP id d9443c01a7336-25d27d20531mr220848305ad.45.1758019675670;
        Tue, 16 Sep 2025 03:47:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhaMhuKnR3pAjBpv8t60tJ004Bz9yN6AtGwrZpjJVtA5m9XzDgoW9T0S6/ba9fgL6bzap8Ag==
X-Received: by 2002:a17:902:d2c2:b0:248:96af:51e with SMTP id d9443c01a7336-25d27d20531mr220847945ad.45.1758019675200;
        Tue, 16 Sep 2025 03:47:55 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267b2246d32sm33122355ad.143.2025.09.16.03.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:47:54 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:16:58 +0530
Subject: [PATCH v5 10/10] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-lemans-evk-bu-v5-10-53d7d206669d@oss.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
In-Reply-To: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758019616; l=3663;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=d0901W5oS2IB+UAGgSU2EHYZ0jt+yeCd47Ja4xYspro=;
 b=rvMKyY9l1x9ja3pS3CXgVRZG9ysWFnYa7CyFQpUDBx1Xank5T/Mc5hl5+Q+cC0Vj5HTIOF0R3
 kuFZqw2/MK9AoDamBj2yds0dWyb3VbObnvctRJl/8IsH3rpc0UXcQJC
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: qsPr3Pu79Qpl1z2sDO_689OUs2K7Po0x
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c9405d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfXxGmtIRxhjK9H
 /ncdLBcHunzLpqOz9/f0CLWysu4tWxDqebXfAgb1kRFkor5ijdWA6BsU+71eBvBZzIB4EXwbfxD
 +mE8McUXpktbQPaBDaeAhtv8mnhjH/YIoqHd0AKu/k2Bnmn0O8qwwDgY5UEj2fsCJi5i1gM/beZ
 Y7qagpeGDJ+PjYpit4P+0BvxqAk/3NnNJpH44xvKPGSRvE+okziAuVn/dgxIkcoN8o5gu/0BhQn
 wH6yLrr0uZkXJ3Ey19tvULU6z2khuPTM+PJZzs/hCTRTHBX25Rx3pihl2KzotXaSORXiBiZzfkU
 OssB1GjppSswpG61VjyGGU2J1vlYv4awsWbFuMnz8Dtk7m/aLDwmPFkhImYHEJhvG0W3qp7pmQf
 EwExTLpC
X-Proofpoint-GUID: qsPr3Pu79Qpl1z2sDO_689OUs2K7Po0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

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



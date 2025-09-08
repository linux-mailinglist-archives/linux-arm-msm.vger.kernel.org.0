Return-Path: <linux-arm-msm+bounces-72506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA40B486BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C2E41B22587
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE3E2EACF7;
	Mon,  8 Sep 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ghv8pI1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596542ECD30
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757319673; cv=none; b=OGoX0mUpKeXPUtTSSa+Hh8FYkJ2w6qUdPPPi9BpB0+ndaEjyBWRmr0pmnKoGssSbpuKXgc5ZGAPK4x07q0nrCsvT32RndKQXm+x6AlxCrj0/K3388Uh1fitraHBDXnOQ4/hzz+345ZLBmP2EeunqdrkOiOsrcP8JtMBizGXHfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757319673; c=relaxed/simple;
	bh=ynWWfmuOZH738K5h1hVDK+fLyCGdjyFsLL3ly6nUHqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoSgmgh76KE1GuJDBFC7rK4ePrXvKqeY7BINkcczQn7h3NX/L5Ix5cB48J9iDhvVzHUQfXVDXAuT8oMc9CUNA6qLK1rTxI5k125yzAxEZRJ6sQGKB+yx28LM0Vm1jDtxtF99A+nIc1WLfADh1jT/w3OWWO1Mz8rFhcaTGWacaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghv8pI1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lu39T023900
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUehLoxPYFguIke0YZr7WflOvoeqoE8uy3ntTtXR3EY=; b=Ghv8pI1J01x6qXlw
	EDFuRbumT1PoHo+5KtQGm86gkFXXo66O9ee6HrQNcwLjLIaVUU1v1lEdZeLDNU9M
	b7vCz2hsWH573BT+aBipWZYL3e1WccaB+kOyRitLKR0pT6Qk422BG4M6F+QsLha1
	pVFwVmmVPsiVdmiTCljagLT3vMbWSG2lEPPeObUDOucaYgfwpNPv61qLjnUAYvr8
	neR2DO2tu6asW5qJBHLVw9Biy49s6UDyvnaJFDwwRSEpXMHhOMei5a0p3kuLV6Fy
	r2NY5BwpYEL4EigavpcrkqZuBpoajtCITuwJN3r/BhS1scKN45ewzrFtg//nbObx
	3reN9g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a3pba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:21:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47253319b8so3177684a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757319671; x=1757924471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUehLoxPYFguIke0YZr7WflOvoeqoE8uy3ntTtXR3EY=;
        b=ZFHvBb5YOCyk6sG4JMAFDfSQLek5Xu9XfLJvfWwBeLckQs3KmaJoAE1QqEPGUcirDe
         US97hfztEGLSYluP0M+7pcz8xTh1P0OaUe/LSCLGh54+S/ReLzL2o0T4NlNg77LbpCp2
         4L9f1v4SL7/yC9jzOb+UCcD03gOjyyfwhv/iFolD1g0V8qU8eMTVzOsYPKbFoIbc4xJL
         AyCZTmj1i18Ad+S6cNvtDmiORCdggFRIra7iUM4PSdELu60ARh7q/XnfwP6bAHSj4mAA
         pociH1LPB2V9N40O32U+owiGE2Z1rgnMZjk6tR5Epo76cy4V75KcDfzgbNb4CfvwHayL
         p/8w==
X-Forwarded-Encrypted: i=1; AJvYcCU0VrNmCPrjgZn704F1WYKwC1rhPqeDY3Mu+csfN63z8cPwyAXpY1RAZj2IsmOgmMdvuCDKqjpFKXex8B05@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ41Zpj8TycDYzLlHQhj06AlE2lHcqvjAXvgL1B47gbGXfpVA1
	YUD3elo/vgH4RvZb6HZAF075/41LSripeTPXrlPxXNuSS5HNl41wpaHsX1WCeJU34yXPeLxo5aU
	8O85sLdHzR8QTfEz5V3dzNhyyW02AOQwBHHKjCujgBcRamOYFnPnQyVAI8Q5xDlKprXEL
X-Gm-Gg: ASbGncsPmZF9B/efqroB2oh9CQKSKk/jA4mnWm9xz+KsW6ABiWLKnlmtng53GIsXK5T
	9VgDthJDlCSW86JDYo7+OdsODchy+CVlm1KcNimHKsXFRR7Jv7zJiIIVv8rCxZm05YMk7RZOxda
	ihg8SvYZzuxRMlOLfpCF1zDgQ1nEuyqVpi0UbR3sEFivYpk1bQWp096VxNL+eigvGqbFrOxvoGC
	CZgyYVPktdLFshtHR9EgsPRp8SNPAXITtNmyVh+m9hqGeW2f3yV+nxsn/3fydA8KNzCJEWH+Qe7
	mSonQt8qLvsMAJm3FAnDh9ZoCqQEKeh8FbbJIelXt1dP76gXPwNn81S7/ANwkX4heykW
X-Received: by 2002:a17:902:e5d0:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25172291ab5mr90918625ad.29.1757319670771;
        Mon, 08 Sep 2025 01:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUtcSUkOkO+dTfuatcYwsPYrubU+qI8Lp/5D/7A6MAMWz8SmZSETwtGcwyZVbO8TqpPMEBRw==
X-Received: by 2002:a17:902:e5d0:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25172291ab5mr90918415ad.29.1757319670296;
        Mon, 08 Sep 2025 01:21:10 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc7f988sm104852845ad.144.2025.09.08.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:21:09 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:50:02 +0530
Subject: [PATCH v4 12/14] arm64: dts: qcom: lemans-evk: Enable 2.5G
 Ethernet interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-lemans-evk-bu-v4-12-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757319602; l=3663;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=T8ZZhZAuKSNtjHcghH+T9PxS/Yw/QtH5Z1v/0Byz0pg=;
 b=Me+SBvge5FuSQ1h8JklnOvj+EWfveHntHOtpm/71ellh1kiesdCWibSliFZA3LDIZIkIId9KS
 GCSUJXHdIjIDvfCH1de1UK++8Mbfu+gi1CF2V632Znhm1E0jw896p39
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68be91f7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=z9nD9lg9_nmlpaFE3BIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: az8XtNmFnYGKSrlQMP_VDX5Ec2a7CjZ3
X-Proofpoint-ORIG-GUID: az8XtNmFnYGKSrlQMP_VDX5Ec2a7CjZ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX3rrxx0a/Ifxw
 frAc6ReVt0n0F9aw2K9J7FkFRpuMZCAEngA8C9klSBZIyPg6s+DZA8VCXZRsl0n3BZw9xJw0gyf
 exgRYxS6JWkYAVlR8HPCCJmFBaUiYIrch0wwxlYtceGo9aDt0bvotGEfZQ080jKSKQRso3/TS8p
 XBM74ec1VlPqEhPgigC9tdIcBX15CX5spKb4y+/A8hiJZFmVCkwmst5ro05q8ZrxkwQvwWqbTPx
 XL2IOsG1GvHbaHHL+rJ3mNUtLnd5IeIJ/z9OCWAP/LE+Tf2R9qhQknJiaQmfjmHgVIMEkjCI4yv
 h11XYDtHxk+0X5X4e3GsTQ35S2hWYChnX9/uyfJO8Nezu1AyLVbhNB/WqgPt+OSAvV8yIZ/l/wx
 v63FTyld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

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
index 60e365a13da3..3e91ac928fa5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -16,6 +16,7 @@ / {
 	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
 
 	aliases {
+		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
 	};
@@ -300,6 +301,94 @@ vreg_l8e: ldo8 {
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
@@ -352,6 +441,10 @@ nvmem-layout {
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
@@ -500,11 +593,33 @@ &sdhc {
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



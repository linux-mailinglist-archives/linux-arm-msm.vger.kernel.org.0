Return-Path: <linux-arm-msm+bounces-70941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798DB37222
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBC5F1B27E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045383705A8;
	Tue, 26 Aug 2025 18:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lf+PO+xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66089370581
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756232496; cv=none; b=F03oxzmKZDmJLgsN76TwVAdhL+x1DZD+p5zRHF+RhHuRP1+Hxz/WWV7ZPlkaHqdpwNaVWY//rPoa92U7EpmXGvFyFKJDBK+IWPTcD7loVFmB8tf4y1UHeeaRNGXLmMg0BT3IOgI6LfEL2gSLLHgUL91m0Jg884hMMlQ/BJ9ZFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756232496; c=relaxed/simple;
	bh=yWU3RivgQn3vbJTn8CogrNAVBOPhegI+Ts8EdEZi0XI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSHBYGQUkfwCu2GmK8N5Izgmj2E+w//gjHRaS8eECDaO96/9JLTBInn4SJ0D8HhC1bmk7nYCpDXX1gQrTJOFiSu/tBQfG/H9rdOTcOd4DN9pZTmNV2wUM/debl7wNTowV7/vm429h7Tx0a7jcb5+H2wrVLQP0VPUHIT9reysHKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lf+PO+xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFhu5T000432
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CWFtNYNaEgVqp01nisBqI7axE8gNr8sIPVugGWzaME=; b=Lf+PO+xzGKPfzJFi
	7wWVc/PwJkmE0azfNCuH3VXJvUSsnPRJlaAeeasS7PmZDeziIc8XwiulcLkpDSeO
	SQAMsan7QFLQ0TZNM9e+GQIFyreu9GNZwsEeUm8KrLF7KLG0nUJQtP2IOouN5F/V
	gNKZPV8UGa18DaOCC+kWBZsM9el7G234PbZtqWEDcT0vN7CQYnYPfapQo/PHN/L+
	Eb20Ibk8za1wA/k7RcICwJPy6RRjDBpI/uTrsf5oXgxoOtaQBVaBuqVt6K70E92x
	kDJ4Oa4yFo8bnU+4KRMOJIOqiL1k7YW5KaWE+8DGmdENqlOUrZ4CgDvetzlH2C1Z
	0brUBA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfhy4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:21:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4c22f91158so115887a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756232493; x=1756837293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CWFtNYNaEgVqp01nisBqI7axE8gNr8sIPVugGWzaME=;
        b=q+6vXqCtZ0vwlBk+gTHW6a0ovtFAtLdbO0D4IkBKdWHkSC6f7aoqjYws3TeCXykz+C
         PK77k8I9gOzl+ipsMQujPrMUi1+cQPv+06WTma4O24txl7ImSIIHX64nN/8m4G1Ggk2T
         sixFk47XlAb+9juV0ZIDpm3ftZEF+ryJY5nL+pmzqPIIxZB5HYPvB1Zll7h0mcho03j2
         nGQ6A37JtRfVI3JkzgzQ3lj+uNMLG1eGp7ywviWZLMjOohTKZ/Lxw/19xoPgYG9W1ldK
         vmQNfBdE547d1a/DuwEHV/aXdSmQ7j00XtdMMvnCUifglmRRapEO78xW+xeAu14xJd8O
         IfZw==
X-Forwarded-Encrypted: i=1; AJvYcCWl/8ifRhKnltdBFB6bKDG3aJM4aoj6pjVST/3RTPVYAowGpKmOmQZpy21ZSqhMWgpesYZnNL/oXt+K8Rr6@vger.kernel.org
X-Gm-Message-State: AOJu0YyBN1rVyYl4hDU44BtVucQD+YYT88c+64XYV+OYGLR8BCSx7fXv
	yMEKnCgnRhq/oyUGLZ22SSRIFXyyrZGQTJgg8tICQlv+0esECYvXGJfKakaFflgNgKvtOykTfMF
	DLNBJezB1QIIoBKOIvb+Itxfl/qpPlVRMRoUDUmWw43v82eirZqzc9cDnE4t3IpYrlNXP
X-Gm-Gg: ASbGncv0gPt1mgv84NnNSim3GKOOgED8TaS9t8w8oQibGDqT7CQT8IiBaWuJAnh9/gf
	pXKe4YC71Z4h9DUTxNcXM1zMGFGu2PVbvzt8pUBVpeNR27InBsNG/ZL5pmIcOReXTfMfONcT9hb
	3rY9rbw8jePIq5hm6v3YdJOFK+/oE50zEiKt1SSzgr4acZX8phfLPrzH/i1xnZn6bLSYT4vcYyc
	GZ9ux2jxb0/CIFGxH0cZkMvu4VGOF5zHMNUijv+hsuXDdgoGYf1Sy8sKI8NB+VoWCKKvarbiAiJ
	MZxeipiukIKri+yvGIdNfht6cTWa1g9ruHrGr39FuQU/mvyw5yik/k3LEOcn8WU9EPtS
X-Received: by 2002:a17:90b:2cc6:b0:321:90c0:bc62 with SMTP id 98e67ed59e1d1-3275085dcd2mr3198425a91.5.1756232492930;
        Tue, 26 Aug 2025 11:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr2OB2Tzya7V5bOJicBL0B3wirSQbAL+ZfTDUgv6121Z8M/mZAZO+9N9e/6vhBkZJkKiqf8Q==
X-Received: by 2002:a17:90b:2cc6:b0:321:90c0:bc62 with SMTP id 98e67ed59e1d1-3275085dcd2mr3198388a91.5.1756232492459;
        Tue, 26 Aug 2025 11:21:32 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77048989fe6sm9881803b3a.51.2025.08.26.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:21:32 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 23:51:01 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: lemans: Add SDHC controller and SDC
 pin configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-lemans-evk-bu-v1-2-08016e0d3ce5@oss.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
In-Reply-To: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756232476; l=2794;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=BtvHt3RnBFKrwdg4LW9eLBm4zcqkJ/W0U6ZHK95NmLk=;
 b=is7dhE0oGK+/vxF2srT20lK72sY+++kGuxaIMDfm2xKpK5ci5glE4cqppah1S+Kb1/g1UkIgf
 uvQfthfE2pOBAvKfAOfsHGCfuWNXLH5oy/Kc2mNDuK+ZCOlPxmGhK74
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXySBuBJaFPsyL
 mnEKx/ydzdv6QtbBQ/wrZ83yDE+lslZEYwce16PrdmCVjAkeuo+UPYycf8lHr2srG18b5py6sjp
 lXaIiWxrN67TtDmeYgApPSmG+i38W9EL2CEnX/etT2voonb0CkMwWO6tgYGS6xNDqXbmKrNKKPG
 AoWFgj4e8Y9Lp0HA8zSvGuzqDKdc6eNSFqeNzqlddlpIXYSRWa2dwWWfpTjkEECdMJ4AqsR0773
 jyZdsSFzQR6rCB5TXgabp9B5/Rs6FUfcZevcLHFXA+++d6edwZpsGRiVQ0quTGui7rOx+jYp2ed
 bR33bZmXf0/vDQeRZnIiRDkhEKfoj5Kf1nDpWwc6phhw4zlpB27SaGHrZpbkqAEjs/+CzwHlkP4
 V4S+jfrJ
X-Proofpoint-GUID: LfOdstXTN9CPxR5rbn94ITGf5wmAsxA2
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68adfb2e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=-whTAWJFRCiZhxz9DBYA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LfOdstXTN9CPxR5rbn94ITGf5wmAsxA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Monish Chunara <quic_mchunara@quicinc.com>

Introduce the SDHC v5 controller node for the Lemans platform.
This controller supports either eMMC or SD-card, but only one
can be active at a time. SD-card is the preferred configuration
on Lemans targets, so describe this controller.

Define the SDC interface pins including clk, cmd, and data lines
to enable proper communication with the SDHC controller.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 70 ++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 99a566b42ef2..a5a3cdba47f3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3834,6 +3834,36 @@ apss_tpdm2_out: endpoint {
 			};
 		};
 
+		sdhc: mmc@87c4000 {
+			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x087c4000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>;
+			clock-names = "iface", "core";
+
+			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+
+			iommus = <&apps_smmu 0x0 0x0>;
+			dma-coherent;
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			no-sdio;
+			no-mmc;
+			bus-width = <4>;
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+
+			status = "disabled";
+		};
+
 		usb_0_hsphy: phy@88e4000 {
 			compatible = "qcom,sa8775p-usb-hs-phy",
 				     "qcom,usb-snps-hs-5nm-phy";
@@ -5643,6 +5673,46 @@ qup_uart21_rx: qup-uart21-rx-pins {
 					function = "qup3_se0";
 				};
 			};
+
+			sdc_default: sdc-default-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc_sleep: sdc-sleep-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+			};
 		};
 
 		sram: sram@146d8000 {

-- 
2.51.0



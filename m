Return-Path: <linux-arm-msm+bounces-76154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B3BBC0363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E562E189673F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7C01DE4FB;
	Tue,  7 Oct 2025 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bq9XKxKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E71494A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759815918; cv=none; b=uXYd34m264XAk49zjI7bTnF5drLPSKAoNhZ8801IuFiASiJbl2oTsOegyh5ya18f3ZTYUaalx4JRRztmXYo5lyes5LK8Pi9/+zO7kwQz8ZF1GhVh8JiENwkqFfwh6hCcr8N9utcKFQbUHHF6pfxoRW8OSx52oK/PHDTKN+ETJgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759815918; c=relaxed/simple;
	bh=bQ7elM7f5BL1Lifxhw5fuJsFELFQKaeSC0XXu2tQuYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iYqfjuKqBtegLgOdd4olPqTe/ui3jwOa2IwF9JHw1BEI/6HwCvW974BnN1Lpl6XjdlbauO2rl2B8Um4y0FJ2JcCXEgnQR9iGmGHjx9dX4xJt/y5R1TNmMb8O/pOekTs9jwJSyT8/kM0QuwxqXB8ZEshMVIi4nflRokbZxsKv5N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bq9XKxKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59724tDQ011160
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 05:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MMhRpxaDY07
	1Od8E3CVtmEeDDOJ5yH67ZSz1WszGtF4=; b=bq9XKxKWCjKSbKImhp5r9pbnR9j
	FLH0kQuZM2L9CUPFYs4AfauoP6Tj55Q4hiDuIXg0BTJTQ5tz3H+bnNieYFWFBt9L
	sk1f1m0VdgQrT/soBFautmrmv4ldTICXbzPOdRq67+Q8bhBewWPhPhu9dHNTxQJG
	yN9v8+H8ZQtJDDLCuF+bIcDX+IxRzN7lkgy8OxArapUAUCgSTKIlFs6ieZKxtTHF
	O9WcNkRSXBpCBIrHSWa0kXAvIRy4JOzzcoZ7itaRNePVCowADvEcTn0Te/rUo9FZ
	kSRF7yJeXSEHft3D6RrGKM0fT6UTGq7DoVm5WEdaDbxZuytduUJUbDEOHfQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6x2v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 05:45:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32eb3736080so1515207a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759815914; x=1760420714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMhRpxaDY071Od8E3CVtmEeDDOJ5yH67ZSz1WszGtF4=;
        b=MSchtcAOQ2ADOHUMwNY8RXMyw1f3P5pU4jGZktfj2YziY87+K41CELtnBDH8nnTlFh
         Sd3IPrkPXBZaBr4bERdS5DZV1cbbGsxKHHRfDD8iVNpzBtKWwC3Kv6nUMxE9gM6R161x
         WgFfIYVM4KmraJIds7gBKnHJxIb6bdsdFkRNwkTGosCHShMo9gBq6z4xPODctTmJg+bg
         09TT/aUaJuhwr9uMW3WL6OwqvUPpTxBYFCy075QuMqQnquS/SzPX5FyrE9PiQObR1IXM
         pVqipl6TcIsEv8fBI5MHmEMLSaHrzHC0oHamOzqeoEfx39/ssZjHRpSRWI/KPCngCdo7
         DiAw==
X-Forwarded-Encrypted: i=1; AJvYcCUhzrnMUOM0wpFD4NxBCaKkOpAwzP74VD+LhyrhrGSxJslGGh44iP31Qmn38Ahwd+yCid4j6yX7nYtNrM56@vger.kernel.org
X-Gm-Message-State: AOJu0YyofiNkV8dfpoMw2ny6UKDV74unhSl+Pxq5W2mq1ZD5RbG/HPr1
	mnDPPOwltypjANHBKx4deK3EzLierwCPVoELTAhdyfYsmmci/myhxAjwy5Pe0wT108A0RepkGvf
	LlFULUE+STAp+bbQcggef0ZrpT4/C9WAKyzP2bZxXz0MOdmDrqvelYem666Tbq0NUskQ=
X-Gm-Gg: ASbGnctsqe2kftFYx1C1vTGWQYC3WirDokgriMuw2K1AQ6Rnt8AI3RolYiHUBObQkDS
	wiDM22fOCdumDwIyIgdnqGy17IBfi859Gj4PYmjF3YXHpmftUhS85YA9lHbLUqQKS0wYhyJ6NXt
	TXx/eW3jamFvy5DKrftbrbMJT+BVZmGOikAYIsHLHMzaNX5h2ajSPtctzRmOgG8JWK3qLq5ac1H
	E1JdjFu84/Z/nw1yVj34hl2Filov3ff/hGXihD0tteVfVuEJZ+QZ/sxJTQJfW36c1Q6wBCw1jBi
	ze0bxilTNIBCWiFInNPh42J801T6iUYY7K8AAhOp6EwvXpfwP+0uKidE0G1r4YENQaWh+tZgzTY
	E
X-Received: by 2002:a17:90b:3b8d:b0:339:efa3:e099 with SMTP id 98e67ed59e1d1-339efa3e3dcmr842448a91.6.1759815913989;
        Mon, 06 Oct 2025 22:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI88usWGiFCUosEbxk8+Vn9Li4jjEysOSm/+1UFh9yCY+hNAK+X5JXiib5yPF7jP3Awp20Qg==
X-Received: by 2002:a17:90b:3b8d:b0:339:efa3:e099 with SMTP id 98e67ed59e1d1-339efa3e3dcmr842415a91.6.1759815913464;
        Mon, 06 Oct 2025 22:45:13 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee976b81sm502624a91.6.2025.10.06.22.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 22:45:12 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V1 2/3] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
Date: Tue,  7 Oct 2025 11:14:44 +0530
Message-Id: <20251007054445.4096630-3-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
References: <20251007054445.4096630-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e4a8eb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=AsSGxY1rZHGoL8xKvT8A:9
 a=SDuTNzKu6uzCYS2L:21 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 89mW5zggjoDHd4K4w5RLpZONBH3flwhK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX7Bb14oROD0zb
 leOeqZyCf1vUGUSM5zeoGIvEb/lv/UlGwr0jnhb/9+dabNuxbCwwz5e6+kyeq06XsvTXy3OZTwU
 R2VWYjHoV/4BO6nPAMRaASyV5m0cpsfHNOemULg0xHyDCt0sIySy7o8Y88Cs0GXDgy5z0q6UPW1
 dOi4sDOJ4JWu342FSvLmpN0sX/3a38nwzoEqN3e02WXPAVSrgfAgBStDMKCnflJxLQi4jHNQ37h
 GQFa2a64yCXGfprqHOd9kFWfGKehc/5Nrsp/IB5nczrNTvIB8dkxerKqCYNbT12n8Mdx9ZgOlHV
 5AJRH9SF1PxcZQyWczPRmy0NwCPlsdpFnj7t2CG21+Arq+HoDtiq9kbF4kMVorqNARTWwH3C2JU
 7OucifTHdeDR8xHWjk7kRbymvEf8Ag==
X-Proofpoint-ORIG-GUID: 89mW5zggjoDHd4K4w5RLpZONBH3flwhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029

Add SD Card host controller for sm8750 soc.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a82d9867c7cb..dce70443f719 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2060,6 +2060,55 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				<&gcc GCC_SDCC2_APPS_CLK>,
+				<&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr", "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x540 0x0>;
+			dma-coherent;
+
+			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
@@ -3121,6 +3170,13 @@ data-pins {
 					drive-strength = <2>;
 					bias-pull-up;
 				};
+
+				card-detect-pins {
+					pins = "gpio55";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 			};
 
 			sdc2_default: sdc2-default-state {
@@ -3141,6 +3197,13 @@ data-pins {
 					drive-strength = <10>;
 					bias-pull-up;
 				};
+
+				card-detect-pins {
+					pins = "gpio55";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 			};
 		};
 
-- 
2.34.1



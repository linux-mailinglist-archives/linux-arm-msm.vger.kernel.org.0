Return-Path: <linux-arm-msm+bounces-69471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94666B29884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64ED23AA7CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 04:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16AB266B66;
	Mon, 18 Aug 2025 04:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEOEntO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6131265CA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755492000; cv=none; b=D9WaC/2Nn5kSTg9pSZk66NLpAPyikMzpE+1VPZ0qupO3E7kHETP75zQcqp14iNd613TFKRFIGtOwV23Iaa4G55AC2lRi44cd8psA+Qrqvt2EM3739hYNBDUkry8g7mCnq50tSsH5hXIoQ+KlfMzp3sbUzte58Y7wKpoelns9ogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755492000; c=relaxed/simple;
	bh=+29K0VO8BdnUBA9WUiyYSUXUy6xMthzIElpmWNLEhSE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFzJG6s0XITt9cL4B/3oTZ6wA/9VrH4X71IbdoVNC1vuMHhMByQAlnWt/corDU913UumCHn9hPNxK8FEWlo32M3xy6Kjs8fMr+Nombek0pPvHcAdW/UQ0/2NPigJSjwoa4K2BGf9y+9CcU7fnOuMP7s+jtHwdak5nD+YuuwThFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEOEntO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HLnGD1004226
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eZaZGVnx0GRSiVYm6ZFwpV5bxOweTD9Y9cZgyPiSKY=; b=gEOEntO0s92c3sTc
	Dfc+VOm9yHPdT5EAD2lJTyIZg3LAmHxpCykeuNeiSqJIuFCeBis/1q9FBP6U3YUN
	qNuzgXQ1pCtu6NIMathYFN0z5oC7AHkxO8MKfEGEdvCr4+CE+qW6tfOdkijlWhq9
	4WfGAMSF+/cfsYyrLBlzxFnPEOviYEUu0CZ+WXXjBspyRdGfIZD4x3YW4u6YDSEi
	JszH7u752SLzTEpGAY5le0xdTRhYTCC5VJOlXJ05DdMPVskSF31F6JH1OwsNKke7
	piemqA2uw6xRMR8PovlLbpKRZCvt4x9bVWYFjxAEeLkAHMIoUZN1Z0g9rLFU6GEd
	pjIdqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf3g2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:39:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458345f5dso37781795ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 21:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755491997; x=1756096797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eZaZGVnx0GRSiVYm6ZFwpV5bxOweTD9Y9cZgyPiSKY=;
        b=C+FZWlPKrbA14OCZzq5FA58P/xqm0okwmL4GRcRaPT2woMFCGtqnRM7Fj5mmXQgwO2
         1V5a1FTIAb92Y8Ejdd5hmeWhUd5OxchTvSNWz/o2wbk45A0cCRNf10iY+8m8Qnz4Bzvu
         Cwhgj9e82rPT/uj1/mTI488rZ4ZNMCgCjKfFGkHwMoWv4jMi0rpV9ctiIjvkZcgMRoBs
         990Dkmc4+oOeyrJ1dGZ3NDRuB8SpVIQ3IsOEDivRerCcL+bH+ueM7fDrWKg1wwlXD7iP
         1O2XwrWPZElZ4og6kU5q6xoM5MC52GOfNJ4VadgaOSw2s3zmoxrwCAcuu+zx+RU9P/mG
         1eeg==
X-Gm-Message-State: AOJu0YyUHRzaKShD+iDcf5NiaLpekgO5CvLUK9svHWx5Y6IpkDfsTpb7
	4L+XA0ZRRcnUEkImqV2Bup/V8GFrpsSRrOz6W8mrcgg4S9VZIy/YNqMoxvoTyIxEXgA8VfT0NQW
	0DrMQv7laDt2uHCZ9fWSd1W8EEQRbpcovVJpcbD1zSu0WkAzm0tGCF3Q/ehobXeUuJb6o
X-Gm-Gg: ASbGncsKLr28wArQWbgUhiZJymbWE1EoAaHnjd22vwln2Q8BAjEq92d/03rYnB35R53
	sTaLiSbYSEEmn3n0PBO49SbqlEd/ThKJQnHujyzp6ACGuE98q8ozvOsuQVLesZW8aDHfDmPcD6X
	pQ0xQEoO7XrxCl8//FWgsyDw3r70oyAngwNEmLxBlljz4mDPu8QOtToNu+MOHwWX+SGExxhAemj
	sKkAfjU+d6KH7Du5sJuaJpoyWZYyJSPWfrQkEyir4clsct2OwHp4CEs/4Dm6InvboBPy2mGzwxO
	Bt5k1Ohk16lj2Kdd4GGQHrn9f9Dr1PHyZrq9XuimnrDTbLeqPITjvYfSemV+Y+UaxRGkpFIbQ2Y
	eRay0EOBX2KwHXM7Gi24ZquTHd3QNyYczpcccs1VY1z/Lau4Wk5ZXdIbS
X-Received: by 2002:a17:902:cec4:b0:242:3105:1788 with SMTP id d9443c01a7336-24478fbcdefmr105805875ad.45.1755491996997;
        Sun, 17 Aug 2025 21:39:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQodWE51lV+2Fc5EfdK3jHxjX8OG70liBgBwxlp/SgW0oAQJUuNOZsS24yOwwZbDgYLCv8wg==
X-Received: by 2002:a17:902:cec4:b0:242:3105:1788 with SMTP id d9443c01a7336-24478fbcdefmr105805625ad.45.1755491996552;
        Sun, 17 Aug 2025 21:39:56 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9cffdsm67505765ad.5.2025.08.17.21.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:39:56 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:39:20 +0800
Subject: [PATCH v6 1/2] arm64: dts: qcom: Add display support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-add-display-support-for-qcs615-platform-v6-1-62aad5138a78@oss.qualcomm.com>
References: <20250818-add-display-support-for-qcs615-platform-v6-0-62aad5138a78@oss.qualcomm.com>
In-Reply-To: <20250818-add-display-support-for-qcs615-platform-v6-0-62aad5138a78@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Li Liu <quic_lliu6@quicinc.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755491988; l=5826;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=fGNhLp1bzV+vw2dicjQ8C1vkcf8uvjd338shboFKUWU=;
 b=1FMjljsmPDyHgiDq64nmdSLsx/quK5URHrDbDbKfuFj5MfZsgKrsvEaTASH8YSF+xHNmvexiw
 oujiRJTlS8RCjmL+NJxJ6B6YtVFg1byGRqgqmRiN8fRlnIKGteJR6Ii
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-ORIG-GUID: uOq9e9T3NJHqv9HiszWpyNM7xcYpU3Ym
X-Proofpoint-GUID: uOq9e9T3NJHqv9HiszWpyNM7xcYpU3Ym
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a2ae9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Aruvlyb1f0gT_6RMG9AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfXwKSNX/Kziu79
 cPqscaSaKujHAqIboKBrBs6GV+V0LDB0g6w9JG3yKCzgtgitsTAZrmkQNhmv2fhgZoZQpqPExG+
 IxJFVy3xLr/cyx0wl5GB+5KNS7xxGDdTE4tqhBffWBZx6QUVcSHrFxXAGRjjGv7zAyxkrad9Mt5
 gmCPYIQq/GNQb6kB3qQp9FesLMu1lbrk4eVcZxCnd5wbAbVpSPNpmc/9ebez5EHPg7Lrwrkp8rK
 O0FwwI+lUDf5M4hdYS1GB9LCuBoiOuWHxBJZTkY4j/MG/yE8ius215P2gPs5Timnufdo6JdEu67
 +LzRDDJA1HLOqcPd3jq2YTdTejtrsvFaGiZYGvE7kfjCiRM3Px7TKQvgFOL340C35yaTtbmZzGy
 yb8ipKhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005

From: Li Liu <quic_lliu6@quicinc.com>

Add display MDSS and DSI configuration for QCS615 platform.
QCS615 has a DP port, and DP support will be added in a later patch.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 182 ++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 50cd9275e4028eb8f689eae215bf47a9e06d4cfb..8c60875b5953f031fac8557d047d1adf3883db29 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs615-camcc.h>
 #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
 #include <dt-bindings/clock/qcom,qcs615-gcc.h>
@@ -3576,14 +3577,191 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sm6150-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x800 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,sm6150-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp",
+					    "vbif";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				interrupts-extended = <&mdss 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sm6150-dsi-phy-14nm";
+				reg = <0x0 0x0ae94400 0x0 0x100>,
+				      <0x0 0x0ae94500 0x0 0x300>,
+				      <0x0 0x0ae94800 0x0 0x124>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,qcs615-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>;

-- 
2.34.1



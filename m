Return-Path: <linux-arm-msm+bounces-75021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB84B9E27F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5429D1B26E05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31D6E55A;
	Thu, 25 Sep 2025 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKktIhKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785C326CE2E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758790758; cv=none; b=L0eU1dycFSTJOL5K4dcaa+V+7r+1iHwoTcB3sY4aNLoO03npO8MYCK8qye414Tgc1l7Ohg5HHSz1GLNJiWeoCwX7FzJSPF2GmAxtfZTymYiEhVTI8KHmI84bH02TbO9nlsFsLgfocB+hCT/cOAVxHslpC6jyMGqPUkIeDUFd0AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758790758; c=relaxed/simple;
	bh=JOrSz1HXlLFxPLLjWD6d1WYeOcWMe6xb1W47kc5uGIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UGOOJqwg4LlboxL+lLMLHJ07Sz34UEa2dQD0j/ewYQQsrIXjBDpiuwJY4+9exJkbZK2BHbAk5idtNgP6memxeluUEH/hGI2ztr8ted5/yyTif+TuygaLZmemJO7QlcI9H5VON2xfgLt6Fjkxmz2SkruNc+GGvTUx/Fs9+08UfxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKktIhKo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4a8MS026654
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qxnTysuC/hW7nodKqTqYaF
	znb9Od7XFr//MNjinRq9Q=; b=IKktIhKoKRWbGt1MLqt15J6mEXIqj1NMcW8OXA
	H8RHZD655ZRSNJ28nud2tdEeTyj0sly416amZxpMJH3IoBl2Q79WykvjB/jLTYDX
	QiNaH+7wmn3eNfVcW0hdEoRDzposfa7W5UJDbi9pQB085c9sN98vzqJKs+kkPbPp
	/Sn6fOJQ1P6cB23UJ78vsHOgWZ4nUaTqJR8yco4QxFTJdm0infqnlWcEDf7SxG30
	p3eW2ReZTuUlol27FZhDrMnXWE+sLnxWaHUKRAcv7T5PW2aFJG1f8K86j0qWZGkL
	KGOdl6Ljk0qiLXrjWS5SgFLd7lUoFNofM7f3EJfzIJW+wiTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0p7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:59:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810af03a63so162337b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790756; x=1759395556;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxnTysuC/hW7nodKqTqYaFznb9Od7XFr//MNjinRq9Q=;
        b=cHYRNGZ+DWWhgTZz/FiaXh4CvBGpdcwxCpiyzs/dRg5jJkyBTMp6tu+GUj65P+ESik
         V2GFd6qSLUEYmr1BhQNhhNc3qOZUjOVC+gZwthmOSwyiUJnUIQgyDCuFCnSQMKnfigTV
         LjEIj4vQCY54iwLlsDD0PG4ZDUDe4BxXtgM7mDK32/+R7WHabsArbtVet7glUffaPpzw
         hojwESBpuwSZZVgoaCONG9zUbJUJFWh056GaBo89BEUa/WGnLTOyh08mDyi55ntv8eKQ
         9kcXdZFMIBDtitjItTN1PjBTJaB+AksFghlpIuo3bCG42MY01hdbhwuL07vrE8zxtiTs
         tjmg==
X-Gm-Message-State: AOJu0YzDnKnCJIC5x++SwhrItRY1h6BS8TmCz6wtPZkxUmdizcX/dqIc
	V3EFkJWDphulUId5qE90RhJYfhuDSKgOPMtwk0T1dBkiWdcRBsiXN1iNZEf08yLv+XAGSwE3pTY
	UJVMbeB0K5OMhc2x6lVLnjK/FSGhoWGu2kPEcslpWjkx3qXDj144HI/nslfmU2+OmzBvQxv0Gl2
	kizos=
X-Gm-Gg: ASbGncu9JMQh7ZYVql1wxr99LQfTLBku/aWLPCqUWMfmOa/eC2jjprqS3U+UohDsZPn
	nN+VGBBQeypjOG55fjXkuTS9NXj1+RkwwA3x9dAJW5LaD+G9b9X8u6qOnl2kPX9iGEPgXNSshtO
	WacDl1piJXfnCTcv98Lj1O/9P10gnPbg2GjwyYtiW87HzL8IDj+eCXYGHSYLM5uNsjj5F+y7Q2b
	B1PjIM8HBbpzu90bCHe7UysA9Z4xsekTUT/VmgNrNSO4dGQp6QmEKZF2N+FRvyv+6QqCnxRgUYS
	MAVTanyUcnKog8RA1puULHtanXuWEJHeZ/DTqfHAo/gvTxizI7bO/NyduVWmvhQG6Uc=
X-Received: by 2002:a05:6a21:33aa:b0:2bf:67b3:800 with SMTP id adf61e73a8af0-2e7d53bc59amr3396169637.31.1758790755864;
        Thu, 25 Sep 2025 01:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0eJpD3qKeqYsWPXAHQB1UW+NDDK3QrRB3k0/4VNWzqwbZS0V3YIAgTG/cxv3dJIGeHCv/XQ==
X-Received: by 2002:a05:6a21:33aa:b0:2bf:67b3:800 with SMTP id adf61e73a8af0-2e7d53bc59amr3396146637.31.1758790755416;
        Thu, 25 Sep 2025 01:59:15 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238f3c9sm1322921b3a.20.2025.09.25.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 01:59:15 -0700 (PDT)
From: Mahadevan <mahadevan.p@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:28:07 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: add DT changes to enable MDSS1
 and DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB4E1WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyNj3ZzU3MS84viU0sQc3WQD48QU02QLk0QLEyWgjoKi1LTMCrBp0bG
 1tQApZpnMXQAAAA==
X-Change-ID: 20250923-lemans_dual-c03ad5c84a84
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mahadevan <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758790752; l=3504;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=JOrSz1HXlLFxPLLjWD6d1WYeOcWMe6xb1W47kc5uGIg=;
 b=ymlU+PIWyqgK6BPCqwMHjRqN2GYLxfrxICND61XV5t33J7keND4J1z4zHP7TKHzLiLGjcIR+z
 mwvphlPzY1oBbAqjUzwLxGbUNG93mv26VpT4SxQ+NOYfwZ6SdJaqghr
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d50464 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6WOxDTRmUopsFHP9N0oA:9
 a=YUZtwmTVGX311DRz:21 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfXwL1VXXnzRFlx
 S3jYURcfEO1UTlVCm1kRq0YHNgu0GvI4LgYHkdH6nORZGPPyWrc9EW4EW7FHqwoO9VJeWv6F5YP
 dtyZVrnB4EcfE6O0KzmD3bb1orco1Ikc9Quepx5cba3MGntlmQkGuxQKUiHVFwdTmZ04ocSrdun
 X4MRap52H62uRRD1ABos9Tnf0qRBVIg54zfLl8g/4pRbbS4PVkOEkL7VzVggVMC7+LS0n20KK1H
 xbsT8mRIdOHbxj8cJWj1gJ2hcVDBMXOH9Q3UVuZH7NL3SLOLBQuQ9FLnJQyMWrOWysAOAN3UyY0
 IcaxO+LwpUbXf2ipNs9+K+jI0OWRJRmKn83/pB6UvVXlDoSbSF9NjwmCyH6x74XwXkb/eJn2OCC
 jTCmrQoZ
X-Proofpoint-GUID: rMHva3zTJwIfn28q10Y1VUB48o_R-KzN
X-Proofpoint-ORIG-GUID: rMHva3zTJwIfn28q10Y1VUB48o_R-KzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1011 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

Add devicetree changes to enable second Mobile Display
Subsystem (MDSS1) and its Display Processing Unit(DPU) for
Qualcomm LEMANS platform.

Signed-off-by: Mahadevan <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 88 ++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 48f753002fc459a3e9fac0c0e98cbec6013fea0f..45c11c050d3f8853701fd20cf647aef5c6a9a8c9 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -6751,6 +6751,94 @@ compute-cb@3 {
 			};
 		};
 
+		mdss1: display-subsystem@22000000 {
+			compatible = "qcom,sa8775p-mdss";
+			reg = <0x0 0x22000000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			/* same path used twice */
+			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP1_HF_AXI_CLK>,
+				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x1800 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss1_mdp: display-controller@22001000 {
+				compatible = "qcom,sa8775p-dpu";
+				reg = <0x0 0x22001000 0x0 0x8f000>,
+				      <0x0 0x220b0000 0x0 0x3000>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss1_mdp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				mdss1_mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-375000000 {
+						opp-hz = /bits/ 64 <375000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-500000000 {
+						opp-hz = /bits/ 64 <500000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+
+					opp-575000000 {
+						opp-hz = /bits/ 64 <575000000>;
+						required-opps = <&rpmhpd_opp_turbo>;
+					};
+
+					opp-650000000 {
+						opp-hz = /bits/ 64 <650000000>;
+						required-opps = <&rpmhpd_opp_turbo_l1>;
+					};
+				};
+			};
+		};
+
 		dispcc1: clock-controller@22100000 {
 			compatible = "qcom,sa8775p-dispcc1";
 			reg = <0x0 0x22100000 0x0 0x20000>;

---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250923-lemans_dual-c03ad5c84a84

Best regards,
-- 
Mahadevan <mahadevan.p@oss.qualcomm.com>



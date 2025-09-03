Return-Path: <linux-arm-msm+bounces-71762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE5B418D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F22BE201889
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529DF2EBDEB;
	Wed,  3 Sep 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OuDn6xJf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9E2EC54E;
	Wed,  3 Sep 2025 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756888854; cv=none; b=RpEThQhRzjc0LHNF6s5Q1+6GHWjc9wW4J5uRNS/yyHGaQTile44wcwPSOe9fKzhMgm4JQA/8KPCHdAjav3RM80NFjPecl3W2HkoKvclYCZBsU4PUz0dtkJv704T2rozOS0Q6btCt7lVa2lHhSTIWNSegMXJXBUrv2V5Zby1Aai8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756888854; c=relaxed/simple;
	bh=ZTKORIyVWTy0kNpEKf1AGp7ClA1U7GAbhAcPjKbC2vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=s7kiwrRUVoQgP6AJe1QZIqcC2G9ryqsg4DTf88fSAYV8lJ+N7e94CX68qq0M8ILqRjR2YXDrsMYqFHSexjCc8KsLqYbI3U4OGIyUaffH7kzBQCeeWz5ZO5JAMKvhVj9KnGsqPymvAhWG5HgCfg1ckhy6gfiw4iH5GUDuGxXVf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OuDn6xJf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832b7DU004244;
	Wed, 3 Sep 2025 08:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aa2vXym0ouVU377eIG/Kbb/n4jTBEOaj8GwqFRs5kLg=; b=OuDn6xJfxild1uyD
	8bjEQqdbbTSMAxRI8B+4RplEPUkUJzeujzUBI1rwlghma/dVVxHdhYWXXWolxurc
	P/kZ10wir9Pm1DHOag+pOFil5NYDnbFZYdnrsEiJgLoa499XXU21Ekk69KLHTzZ/
	VshQ9PvE2t7KLMg02p3codrNlbSYYp6N8ivmX9Jc8H3i9BOP82gkkb6L+4ElVFKD
	Re45LZe7Izi6b/igHsEydlHZXjCW/pWWD5oC/1M3zsFjzKgpzqrcvxXcg1SHyXs3
	rBntj96uTRKQbOESTAy3Lmq3vwDl1sdScNA4KohkfgpBPeBSBSJYgP3AdGthfAKr
	/EUsDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjjtm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:40:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838el7r023861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:40:47 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:40:43 -0700
From: Wangao Wang <quic_wangaow@quicinc.com>
Date: Wed, 3 Sep 2025 16:27:34 +0800
Subject: [PATCH 1/3] arm64: dts: qcom: x1e80100: add video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250903-add_iris_for_x1e80100-v1-1-410e9e6c79f0@quicinc.com>
References: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
In-Reply-To: <20250903-add_iris_for_x1e80100-v1-0-410e9e6c79f0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikash Garodia
	<quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Qiwei Liu <quic_qiweil@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Wangao Wang <quic_wangaow@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756888839; l=2963;
 i=quic_wangaow@quicinc.com; s=20250814; h=from:subject:message-id;
 bh=ZTKORIyVWTy0kNpEKf1AGp7ClA1U7GAbhAcPjKbC2vw=;
 b=B04/gFV1i4W3Xo5J90idjG4xcu85QvuwJOAdxuR02vbBq2OaYkTYjispwYrLVt9hYzhpHqfcD
 0J970qNbeZJBvuE0UfJZuFb4V7QME+e6WzKVLv0MdmyJguLPkUsCibk
X-Developer-Key: i=quic_wangaow@quicinc.com; a=ed25519;
 pk=w32d+heQorY/WMv2MAjQHXfwz5WLNqBlarTPtMmAk3k=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b7ff10 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=55DSnZ3cHy12Uk8sBI0A:9 a=FrfzX8SyDviD42Bs:21 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -iLGz8DYtTa-HPn59b7D8EUOFRuGrqbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXyZDQsOW/aS9V
 YTaQkt0e0dRZiUz0S9w+j/4oLVuzforBsvPCbkMT/qV8DSrsPziv4C56mVwXeLw4UJiPBFvv9A/
 zVJsUFfx/1kURH1+2N8usASU1R4TNcxoQNuPXQMDqn22vWWg4fcBUfsm5QyoHsrCET/leZ/A707
 ohbpjb9XFmZlmkoVGg+lnB3lFaDEuCLfEPCkmHZMHfQs9jI+pAbQSibEiZ7ca1c9+snsYv8uYBh
 H2gFeCW+TWwWW9TMeIPXh8kOwy/RBrycwmRWEiR2Yax7ogo6V4q2AoqzKjUB2M4GX4OnPGGJ012
 YEZH1zTnVWNEZ40Y4B6oUhlpz2MmG94IDJB1YmgIYPJsjgfrh3DawvU/vdvEUgF0jSo6ADWMA75
 9B1yZ2S4
X-Proofpoint-ORIG-GUID: -iLGz8DYtTa-HPn59b7D8EUOFRuGrqbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Add the IRIS video-codec node on X1E80100 platform to support video
functionality.

Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 737c5dbd1c808300041cc8897ca1f7450e16e019..aac40875e583fd49db85e1c5d0ca416cc02d0e5d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5186,6 +5186,88 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
+
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				     <&apps_smmu 0x1947 0x0>;
+			dma-coherent;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-481000000 {
+					opp-hz = /bits/ 64 <481000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,x1e80100-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

-- 
2.34.1



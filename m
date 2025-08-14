Return-Path: <linux-arm-msm+bounces-69154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5BBB25FB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BD0D3A9C2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D296A2F28FE;
	Thu, 14 Aug 2025 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TVI7W/an"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFEC2EE5F5
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161587; cv=none; b=XPb9QHZpMg4EQhds/IDGtCyQ1Ab/LkKRI2fUGOVUCbz9tA6oNbWnOFMQFu5xy27/Muulrdwr652Y/V69UGTEhgDEb/w33ybKPLTHLptq+xn/hQQpwNqGGKxMbCfRF7/H/i98Cx8T+4lR9NeV/Ulhim06NjexlD7otq+ou/jwhEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161587; c=relaxed/simple;
	bh=gZm3ZSySExg5Ma1IWfjbw+2tWtzY5TEG+kq6H35x8Pg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AFLKAAd3o+MBfEdznX+IfDGCDENTiveKb0glXlta9TAkFj/XIzL7MLfnymzlXIsem4UGXd063vqQWiJiO8HjDs48KLYGVh0AtrZbmMFdcc+xRrBPt9J+jJqJs6xZYNH4OSB0cM5NmQN48J6OzZogQPw2Igfq7B1TSnLeuwEMcyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TVI7W/an; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMbjcu029114
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AUq6SEVReB4
	B8mcPNqCG0K6dhPWA7iXTcCZXwcqT3AE=; b=TVI7W/anddYTHiaZc08DDZW7iIk
	HF5shSoo2umAKmJ4O11TD5WBGU+TcJbVXnzY47O6hdtD2kr9sOi5TrB2apZwq4mu
	CIPabL+8OIDMqE4S8k03NEIujZU4BYhK+lzztesv3T46el1IPx4Gd71ND2OlmTUC
	OhMKz74pw7VsXm2MdcDeRjT9kOLM/SYyvKjYP/IXez83/73BD9KTCKYPLPf4SfAI
	qSTRpFQ8pOgci6K3/zq8QKntWphck5riok3u0KtbJTTS8CDal8b8et52C9K0Cb1R
	zPI6dhx06zWjf4fv+0b0NcXZdiXlAeo1IvVHauGgH+B8Dge6/nEsFRh+G7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9x2yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 08:53:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e87031ae4dso64103885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161584; x=1755766384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUq6SEVReB4B8mcPNqCG0K6dhPWA7iXTcCZXwcqT3AE=;
        b=NHiaT+ZUY47vL/t7he//i+Wuqv11TVfA94FOAN5JeRshJtqGfnHzGQDWi7d8Cv7mcY
         8CaQ3I/McauBBZcF+vU8GV6WKZtHdycYLHsyg1unwGUzKMt2OmMNDj5bfpuNFDCmq84a
         zDpfzt/R+2/NUCkHLRBb6bIQDjBehHpl3yitPvUTBGkglc57sF05hmlDfIG7+LXbXsI8
         8vsptGRGYIvMD133ojZnfwK31OijNL9f+s5sT7DJY29jqlLTe+AX452/RQHZE0MF9g2o
         NiCwOcWPrkaij/lVy0FLo90PcdCnxiVXjfERLaqLH2kS9dqaZkysSn9eNyD8zXiOZ8yz
         Dqig==
X-Forwarded-Encrypted: i=1; AJvYcCW5wR0yLoQoIJeOJpgsJ4+7SG1WMo0j21mfqB5hyoAG8enuto63Jz/tWunQ76cZ7Fb4Nh3tY9UAYIelFWg/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1yUVRuxucBu9ZjhnYy2YoLEh+sQp2x3O/s15rg5E7xqPKIee
	CK0tYYQZEyHvr4QCSn+Bl3sn70iZASRXQ4PsBqj814Ne3+Vbo6EHKy8ozBVizjhOCJp9TYGO48f
	JbV9BwYhgm1nAMFJNf7Zxz4AVz29ZCRxt8yy5Ac0qj7WhVEP3rDpoppZ1kBWXkbCjT+CZ
X-Gm-Gg: ASbGncvC8M9HBx6hyyusPN6qtUa01r+Ip6ZXx5bXYaQsjnH9j+mUqAV/MRA1lwe6KOA
	LZbZbTvwn8dq9GT+VtqNqzcuenJtJ4UiVEGwraOcpwmwOhmKjHRNUZzPRnoT1C/OEpWzTKJxI8U
	qvjq2UWz1ADhlEamLqfVht4nkLMnvvRZDmY+dR8G5jx3OX01T4xfojjBObUeVXHXW3w14GK4Qf4
	njhdmgzuHiHUdDHNo6Si9BY3K0mobS4DPru6b/LYwikohGgboL8IkoAtrhEy5nBKuif2NQ1Vth3
	MuzA321ihwIVU80KhLN8zs8TNiiMOGkE+fp9qTMBr799BJRuWhDUdBcdRPiH+MWozuMa6jBbRay
	6Ylvc/O+JAK1E
X-Received: by 2002:a05:622a:1f13:b0:4b0:71e9:1f95 with SMTP id d75a77b69052e-4b10a918517mr35987841cf.10.1755161583632;
        Thu, 14 Aug 2025 01:53:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzsEBFX0XFzWTx08N9omB5JXz7W34VN/Ia8pVMBYnsd56pdZT3Br6u/m6Ok1Uqg3vq8AZrCQ==
X-Received: by 2002:a05:622a:1f13:b0:4b0:71e9:1f95 with SMTP id d75a77b69052e-4b10a918517mr35987481cf.10.1755161583184;
        Thu, 14 Aug 2025 01:53:03 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc93fsm13155895e9.2.2025.08.14.01.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:53:02 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 7/8] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Thu, 14 Aug 2025 10:52:47 +0200
Message-Id: <20250814085248.2371130-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
References: <20250814085248.2371130-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689da3f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ysKtT3ROWiqemlrpScELnx5QL8NKqHdH
X-Proofpoint-ORIG-GUID: ysKtT3ROWiqemlrpScELnx5QL8NKqHdH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXzHZulC35GuGg
 h4/xIjUKMLEYO6mv8WF9TeCS1/stRIfuxuGp9jf0NAIZMgcvfTvol4F7dNMAdPAzJSTBa9xGTFp
 AYkocPVX+YaI1G96ZQtofXFg9Vod0UlE/XnulVnDrPKfALWjxhMbyBmHgRgOavFB2aWrgVZ+1C4
 v8Rr3w/B+LcMcK6KIF1zYowDAM/xaqP+61HabYw05ov2Odd9+5C5AjjXA90BeSrUUgnrk16iGR9
 Cx+Y31cOxWnAuy2Wk9TWH8FVCY08fHtQAxm/si/hfu+G0wVQn2y7zSi5JTuDKuFc7U3vfOG0TQt
 ExbCbArfRO470oUHrAITGTTVQgCjyX7b6wxsnUEHiqvNQYVvBN2h47f2TQys5GqJ/sy6THiH61k
 hz2fJ3M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

Add DT entries for the qcm2290 Venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index fa24b77a31a7..b1a31af1afee 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -2096,6 +2096,61 @@ apps_smmu: iommu@c600000 {
 				     <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xe0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133333333 {
+					opp-hz = /bits/ 64 <133333333>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+			};
+		};
+
 		wifi: wifi@c800000 {
 			compatible = "qcom,wcn3990-wifi";
 			reg = <0x0 0x0c800000 0x0 0x800000>;
-- 
2.34.1



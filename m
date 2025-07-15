Return-Path: <linux-arm-msm+bounces-65099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26311B06801
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 22:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDF3A7ACB0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 20:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E007D2D12F7;
	Tue, 15 Jul 2025 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGCFEoEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051CD2C15B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752612490; cv=none; b=aercdG63YgIe470Iq142GU4kIMKimEy1H4djiC4fqESo490cbZUu2zTV9HGrFCgZULytdYMhuNZXdRWXU7cBXtM+FHpuxnAr0HJOURBLKynuEKrYbnkexcLZdJE0JQlqqY1/hSMorgxmeteiTrMqyLv2TUsFL6FK+5AGGxTZZWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752612490; c=relaxed/simple;
	bh=tI4EJY+AX+r+95HyElw6Y87H6Z+WIIFID7OrbHLVJ9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZ3Hp1lQzbcdthg+cHws9m4AiIyByf/xRYOIQOl4MoGJyxDB+7Byr/nVkJ8JSb7KEO0+dO7jJbeZMvzQEEhsKdFUlvmed4fI926Fi7KLsnzjjptYyLLPR7ysyLubH9kI8umhobghW0hNE6Ve+zW6Fkm8qxYidB/fAAe25cYnNOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGCFEoEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDQoH014550
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cDNJIT1X4FF
	Dqpcezls1gtG8Nez0pdy1Boer2Zl4v9A=; b=IGCFEoEX1vwkNIi2yy0zlJ7Fz5h
	l7dIhVb1c9VmrXrQdIF7h7Myi3T5Ri4DKi6ADTuweG2/6STM3cJlhL89n5u8ZFb/
	chpfpGo3VDZO9ufFSahvQ+sZ1IE/HzWBkt4Cy8t1eTIYonVkq7F5Ry66SBjfyJ0I
	6ZKgnfcmvSk8lmnZpVY3uCJyAOW9ZS1jF5lt9JDmGuoE+tsHEJGZsshGUtCXk5ob
	i1suKOBCnZY5LUvPcUmYaeMslEbQsKrVtm/IvQOUmn4i+sKAz5s6N72Ak04oUCVL
	5WcTWFVOpcD9s9rOqzudoPX1NHiY1bLUItmdlN97b6UvOfM/BSd7kQJ7OvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dymf1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 20:48:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e32df3ace0so186778585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752612487; x=1753217287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDNJIT1X4FFDqpcezls1gtG8Nez0pdy1Boer2Zl4v9A=;
        b=oly5GckqEx/l3Qm7lGQaeTcvH+QB+JLLBXlrFy86OtndRWOfvjyxIZI8xgXFIsPjo5
         DBldJrSLErfDEGK9wZTORiGKHxGJY7/yNdkYi8tQKwUiKbh1akRUD8O+Ouf2d00gsw+S
         dP2PR9gxFWFvzQzn/fMas/sB+4vfCO5PWMmLKBS/lM8doXe0k3+AJyAYNv6Riw3r9Shv
         XpkP0J0mxOkmpmwN++SFRqGG2AdfIwTDXLBjhwItNdT7wq7Eyh0eBFpvKkw2ov02CDC8
         UY2swRsEcTEcAks4+Ah/RN7ocTDjjyAsdcDwWVukFf0aCzz8qy5GJ8e4f8MEcZYBdAaI
         RLmg==
X-Forwarded-Encrypted: i=1; AJvYcCVI1/iAgH+9ZDVus6wkJp11/P+wqpqudgzL0qlzBIaOvY/RZlKU3k/XMi+Fsf10V9B5XurNAYFGG/qnd1e5@vger.kernel.org
X-Gm-Message-State: AOJu0YyueJLpFn8RqWnM2uf+9DxQxGSeTZRL4xSFt6UyPJd2UrAEp5wl
	E6jZ01EfsYBBqmYQkL+ycDSrx0JWCBOOqdMHjukT1d0omph5M/r0m/tzLr+qKIIS1waBoPgUNSh
	mNWDZ/OPV44HwgpBUQJam+UNQeIHwdsrk7ROCppS+RAjGT9m6SB4YA2MSnMJ8QN0W6EvD
X-Gm-Gg: ASbGncuN75t64oU4nB5MNtgP2u1nAj54OWXP+SmyDvY6caLcxm+DEV6RRNtBGcv0sHp
	ha438mE94h4gmadrHSHqImBnHBSREFhVKQNfvpG/DURxfFu4pIYc5dufE/mY0WhkW/Qh6X51dKA
	0hjky3jKuYo4rf2d2QhZR5ttBq11T6IxnsO7LGxFEtV7zP2mTba73qyuaGby4YNoZn4y7zhsn5G
	0zDlzwn9rrVUlBm1ko8t9b615pbiZ3YkB+7P9hcUZJ2uOS0mN286eACwNHasuDRgPboCuMk67lY
	x1AZe20NM8678MpbqnboVkeGnKwIqbzrdSJ92f8iC/ARqJ4mA6JYbKpVtShg6or9/l9aOeIjkXZ
	gmjiG4nbkgifGAOUOAw==
X-Received: by 2002:a05:620a:1794:b0:7e3:320b:437 with SMTP id af79cd13be357-7e343351613mr46873385a.1.1752612486931;
        Tue, 15 Jul 2025 13:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaeqOjGAPeWkJ+TUoENrlyBUvMJ4sXuXZS39RAbxA2XpPfqiQ58OtzuOP9EGEQ7JHQRLcPCw==
X-Received: by 2002:a05:620a:1794:b0:7e3:320b:437 with SMTP id af79cd13be357-7e343351613mr46867985a.1.1752612486325;
        Tue, 15 Jul 2025 13:48:06 -0700 (PDT)
Received: from trex.. (153.red-79-144-197.dynamicip.rima-tde.net. [79.144.197.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm16331877f8f.38.2025.07.15.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:48:05 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, mchehab@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        amit.kucheria@oss.qualcomm.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Tue, 15 Jul 2025 22:47:48 +0200
Message-Id: <20250715204749.2189875-7-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: j-3KEuJv5s2efB_arxKCzBqL1PocOCGm
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6876be88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Ki5fnJvzvo7yLsyA0quaxQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5MSBTYWx0ZWRfX79MiFtutTOid
 t3ZrLRmRP42gEcV+MH5EDKROaDxxBhZl6ULCrPsVJEsGx0JYiJTZojVa3kV+7hkSOAx8YjpkY31
 fGs45ib4Fnu1JbCG4fP66pSAGHBBlIWJANp90MYQk5nwOn6qqlZoNTVSyEU9wxMeRIzDPSwPUd1
 USDzYG72gUvI6pU1aLPOncdTq9wB+QwlXdzdogDrjJ8EDNpWgXVDaCA1Cwkqeibye3B9n12jbCd
 f27n/QTwxBzSjui+qB9PqIR1hKr1q6vq055MZldLVww0WlaEzeDM2E/flB2Z6v3H8FpdvirLSM3
 8Uw3gDH7EUHmjNqbkhV5/1IhEa9Ooj/DEDebk5R4spki5i/1AePDfnTXTwsvXyZUwY8biE32gSW
 ZvvFb6vrP1j+uNnIS5n3nlIYNorlxhxq3cGxIVYxi7uMVlGeKcIusLfTUpfp/Mv7gq20rmYA
X-Proofpoint-GUID: j-3KEuJv5s2efB_arxKCzBqL1PocOCGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150191

Add DT entries for the qcm2290 Venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..7cfacd189a10 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,61 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
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
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1



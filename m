Return-Path: <linux-arm-msm+bounces-67747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB522B1AE9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 08:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD25C189B7FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 06:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71003239E9B;
	Tue,  5 Aug 2025 06:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D02aDSdc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C46233145
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754376289; cv=none; b=HgjlvVFgRPFKcqCWGWqo7NMIjnsRV8jgjDp5Dcw28LXKrMxGfZ87YD/7yEyWRCNmeLa31s9kaKQ+/OU5K5T5j+PNYC3mPDyuTmEWJ8lA4nFNLxWi009hID/TBoGHMjenH90YNf5ykPZoYIts+kVT3JkSMnxDL3bBCj3KgHWjcds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754376289; c=relaxed/simple;
	bh=tI4EJY+AX+r+95HyElw6Y87H6Z+WIIFID7OrbHLVJ9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L1iKpCEjUF2MBkKCOLlZxQSN+sodgFIMhDIFRBz1VoN3s0JA65TVEVlL1SOon6SCoO4eap3h0wLr7LfkEPrVs5r/ElZEAhPrIcoOUWvoGFMHLR/pHY3YODX+8ckAc+78ZogiVRZP32PHUqhluLuzJoPFqI5nTyZ/BWzyxhrNbdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D02aDSdc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5752TLdN016480
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 06:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cDNJIT1X4FF
	Dqpcezls1gtG8Nez0pdy1Boer2Zl4v9A=; b=D02aDSdcRPz9prtNGcJA4xDh/US
	8cONdUZnI3woIM7gG699HQF5mqr5jA130lWdEh06iOcXVhCy8ZktDEaZY5vvAwE4
	zHBN/cfPGvyCKx5RW4IzWJm6/RxuXhPoXzlT8AX9ugb8Q+whDEja405sFVVHen4H
	oztzaAVYIswSt+cck2Pl/T7JCcda62VwWKNUBTeeOGBvZNn+wvUuGkFTXk2ZSmVH
	eJdFl9u2kM7cJkVUf7Z2Fn68/yZpoz/DMwSLZn8UZCUXfFSMXkzCpcF+d73CCrj1
	rb3XX1oMxC0qN9qo3Ya54BwplszcMluD4YzaCe15sFvYOZSyoAjafwwm5Tw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv3puw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 06:44:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70771983a52so99480926d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 23:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754376285; x=1754981085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDNJIT1X4FFDqpcezls1gtG8Nez0pdy1Boer2Zl4v9A=;
        b=ig0uDFL6J74mbgfd+R72tV4UopIh8W8k9qSfdgZVfhnlAwEwqgpUElsY0CrXcFK7XC
         rxWvU5kqFCfM5ALaiSx7bB9N5WJHWIrZpWoPmjxpJ6h7coJvpfEZV/Ri7I+iG+FLwM9g
         EHqdHAWLn3NpyRRewz83u2ZMgTMYaHBwfVxY6tbjZoG5OkIVPSwOum8aDu7OZAFMg3Lt
         SWOQsNh88kks/qEF5z/VG99GeOOjzpn7ZwKxNkzDEWJBol2ljum19gP9WXUNP5awqZWZ
         N/bM0ZQjSTOU5KIKwRBIXZBOyiZR23HaOFptO68LWenBD757URRgd4QPg/d+e/FxgyLo
         B3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4uuwjpxBMeE0A0ulgX2XpyIHRtw+GUP04VrlUs4PliigskR40KGGN3bcTJl8kCfCU02Qa3/ZT7Zh/71wN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2h+rNZiZr2T6puxoXmanFESsXkJoKFdbVrXxi/vjt5XiR7S7I
	HKHd+4ATmNEIclcJyRai07AVJs03Z48pQdnCftdv02PprzpdniLqW2yciclHtcTvRN+CZCUuL88
	1o3E0K4C+Ls4a1jBkWEI41GerlylWc0Yk0YNZT9vCibMJWTkJgiVbtUDwf9nzP/KeKs60
X-Gm-Gg: ASbGncvk1Bily+iTI+C+rT4OgongRG2MV2tm6ewSpZF0wfoHgCTLbYkcvLF2HXlPY5U
	4OglYFbciHZZ1LqemkZHQe5xSmNTZEhRrqvGniDG1xWzmUMNnp7dvzp/FbbDYl/vZgUsa5LEgv+
	4NrXXHF66zBYCWcSW+C5UatlhmXtdNlJienE3jXtwjKHdct+DhWdqVb0Rns6V/6MN7i+qODCdWB
	OwEcBG204mZ7q4taMa1wll3z1DZagxgaa0Egw7ZM5sqHlZJjneedCVVmij+HjlKdmwIZJWcsGGD
	Ww0uwnlOqGpB0ENckdKnXJDR6HdsQHt3pT2F6UKPOZEJYnxIsiACMV6BRebBcbsnne0PWVtuEDb
	cjzBeybQmuOPF
X-Received: by 2002:a05:6214:400d:b0:707:b59:8907 with SMTP id 6a1803df08f44-70935f6f80amr172014186d6.14.1754376285314;
        Mon, 04 Aug 2025 23:44:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJlNrFRgTXjKLfqSDstiQ2o9wPR/GF7AHwgeyi/ta5LUK0tA+fpwgdxf2g3ixrItUBOCQ4ZA==
X-Received: by 2002:a05:6214:400d:b0:707:b59:8907 with SMTP id 6a1803df08f44-70935f6f80amr172013906d6.14.1754376284892;
        Mon, 04 Aug 2025 23:44:44 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57922sm194015815e9.22.2025.08.04.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 23:44:44 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
        konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/7] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Tue,  5 Aug 2025 08:44:29 +0200
Message-Id: <20250805064430.782201-7-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wmJtz9SzN8ZMFlmN6v-RrmEroWslxLi1
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891a85e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: wmJtz9SzN8ZMFlmN6v-RrmEroWslxLi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA0NiBTYWx0ZWRfX/JnRbtlNA5NH
 jo5pfHiXSvvFrENGFO36rr1F39KX+IOzxNMkrk2nfaWgHArivpNHYSsmR19IehR11xwEcpxaOPW
 BoSarAgSt5xKuI6pgU8rzQdK9B/TIi/mbGpUitKmc1ryBxjiFBiePPaxuLodM37FJert7mhSu3p
 9ogNZ442GbDm1D/7kVzCVVFQUXIg9xhWEl7fzyJnH1d666bd7W8e4LD4Bvk1b8o+LxderCDwVWc
 E5Fb/agGSW0TWpuHeKNAm+a+pJeQdfi3g4xThLi2FnAC+zx+zjEWeM4uIdm3Acvfx6L7HcAbWRp
 UqNYvS0+PlyTeFbCillXNSDsLcCxWz13VLbzy1z5vRTHjIIMTHN1GyQ+OIQhc8WlvsBttZNU8ME
 BE04WURZ/I1Y6zxmGVMXzn6Uh6aSekrSlYcB/9kMmpicl8cqn5j3vrMP9RRZbtPe/Mg5hba6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508050046

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



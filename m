Return-Path: <linux-arm-msm+bounces-68089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD6B1E4C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2853B72574C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929C126FD9D;
	Fri,  8 Aug 2025 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePhFp+3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B81626E15D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642983; cv=none; b=c3TnYKgl6gXyeUdvZyqj3KbOUpc2ji97VNjVXfrFiLHqiwADsFMjoJg8wG2ThBdkPecrCKffiSrc5xivqPDQ7lHdB69p8oSVffogsfvCl4ngCU9HGaS2PJ1Gt7D+mbygSwENJ/END0w7Vyv85CkZdrXI/V5nhaXrLzA1fncu5Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642983; c=relaxed/simple;
	bh=23E2L3+GM5Ne5G69gtx+iV/0DudIvZsRZTXNlVujEsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sx4pyuYWEFp/Hz2T42Z87tzmrWTBbXDv5RelAYYQbxFEbFFOGpUFFXKTlpcpfQP7+w5fP//uWuDGjchbUEqMQVWH9DBOI1+Z/NL3UIqd45ze6vrGy7ZpKHTOKtDROtGt7qQElRw6j9nA15LziTNBwGXlZsBL5nUWqLvAk5Uv2Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePhFp+3J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57871bJU012668
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXsE/Pq/OO
	0HhZLOEUiCFKFRSimd89W5kjcE0yBaHY=; b=ePhFp+3J2AxulnJ0tRa7EH8+nlp
	o6OyCZuHRYAWinKlnqgWs4l9TJQWCpVPoW8tqcLhbELiVJ3Ydmx5CVNOa4CvpD8G
	E/e/IcMy9Bmle2GDTppOh2CzNzdaowot41jM5sw2/TYrjjd1117Q/AqQ2ZFOnAGJ
	KuL9rgQhSj6u6S9EIg9O+Mn5z6CFqhUo796IkKNHDCdoGDO/g8jlO4dI03m55sGt
	HlzVyGdli3lJzOpgPSM8DDnObDLkJDxyDzetyOKuYp1BsAEbV0md4d1p5KCMCoiV
	1Ao/GyS4Kt/45NTFBC2c8e2GzPNZGfu08Cs9mVXDEgSdrAFez1HryuapVhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybhfxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b061ad3cc0so56063121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642979; x=1755247779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFXsE/Pq/OO0HhZLOEUiCFKFRSimd89W5kjcE0yBaHY=;
        b=fmGdklVoc9ULkvUAVJDmivoQtiIGrsCXyqSY99qgJKVse8T2iAF7r61p+HvOmdW51r
         /p7NAk63tfpnME08DetiewG27kEcD/HpJgmW/cs9ZWyUu/iAs3EP2+BfBUG4tTDAfl61
         GSOJ/VByKI0Nz2ESoxwT/2Z8klfIVnY2D3nJa6ywbcy41l1p/FGqgZVh74W6uBcMk7vL
         q6wkQpRSSh1V8UG+2TyX11FAl67VaQaVOGxGcrjo0PKYVqBdPRc+09NNidJitCTGlIg3
         OlxnguY6s1gpmWze1SgbIoBDk+zm1KqybOPXloRhlUu8709YbaDY7aJAj4UgbVtkduzd
         VzYQ==
X-Gm-Message-State: AOJu0Yzh+Ang+QOHx1EwVpxU3vq0lwK6r4B60Fs1xrJF4M0n0t+4G+H+
	R+Pgf2wDWL4WgVNpr1DtcEuxednj72V+044PUZrZn+wH/RS/g0y+5mSEZvJjhmCYofXaemusi5A
	E0RJQEFNRI8TCPqyGqJF9Hg/0RRMdAqL6gunN1574xHcY5dvlwN7PxkGT5pXdHxFYaEaL
X-Gm-Gg: ASbGnct4eqBu/Fp+H1xff0ivh7wivJ6hJFt9a409fm6/EaEev75F40jcDZjRyah+JYc
	WsLObeNWbrvosIMQk4o1JTC51HD3f+d8pFSEo3QT4oh1TF6XGFUZkjfgrNi44nKnjKSCP0q+Qc0
	eePIzFwbOh9/tG6FkhUm6OsrS94Aejsk5MjHSyuxWgBfW9xPnH7WEnsJXVWeUrgh8ayPN1pEvEB
	2Y7C1xn8PdPmQ0iisNxehHAwWz/wRa11gxceGpPHAI97Gc6hsVsjxUpr8WHhpaYT1y3rYejA9NV
	AJtVUaLgnkcaOR9L8HF81HpXies8budglRszmdixcFmHQ9/LuHpqeqJL280uG0l3Bn1BVFvGrgK
	MULNTpT9gDib1
X-Received: by 2002:a05:622a:1a93:b0:4b0:8e1c:d87d with SMTP id d75a77b69052e-4b0aec59704mr30866061cf.2.1754642978969;
        Fri, 08 Aug 2025 01:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPMIXHPPD1tdceQhbz+B4qpGQUoHEbS4Q68Djht2hs0DqD2kW+fYFCxOmTWJ4VNIBaNufslA==
X-Received: by 2002:a05:622a:1a93:b0:4b0:8e1c:d87d with SMTP id d75a77b69052e-4b0aec59704mr30865781cf.2.1754642978561;
        Fri, 08 Aug 2025 01:49:38 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:38 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/8] arm64: dts: qcom: qcm2290: Add Venus video node
Date: Fri,  8 Aug 2025 10:49:22 +0200
Message-Id: <20250808084923.1402617-8-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXx2UqrGSoBrpU
 +mbhA/Ype11xzoouF7gfLyL+WLqA820wSv5lA/GGiw8HI/Nr6w5ckXKmzyQWyeAwvbJZ3cvVhrw
 ujrC/O5c+yX5nFqDo2uF2W/r2CO1ZjoFkTW4XOqVNZoni5lV8O94bsbeJ7QbOB27ZItbH6N/O8N
 EYj/Y8LnthIdcVhlKuIR2qtZUXmECAvfkXjjF8QYPGMirW/INLegeqcW7UvFTos10sISXE/Tor3
 Iqc3NEKvg+uAqLDUA35eUZdHudwJGvdTnXIFmE4ZzJqEcpH4sQTTGHBems2bADp5ckfrTXI+1i3
 XAlWgXKxMzyp/3MsmPn1qckNd/UYWTIjpoD7JufoLha+nRcBdg0p8mU9U5A9SfTyH53RH+CJRxS
 5w3Pr80v
X-Proofpoint-GUID: eeVNm5QS39p1TKamjSxYp7T4-oX2qrV4
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6895ba24 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=KD12_Wl4P5iJQNenjFgA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eeVNm5QS39p1TKamjSxYp7T4-oX2qrV4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

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



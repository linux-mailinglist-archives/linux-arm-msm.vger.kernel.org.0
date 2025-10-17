Return-Path: <linux-arm-msm+bounces-77811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29253BEB02A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 19:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 977561AE3C81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 17:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B41302CC2;
	Fri, 17 Oct 2025 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlVAKuzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F582FFF94
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720973; cv=none; b=XidIXGn+17ZSr3Oj0IDDPyXkeed/nYBXPXCsIBwVHT7e9UQon5FAs1YiC8eGKwqDQFRyVMDV35Xr+jKvNh2LJ2zcSMoo4PQ9NRjFr+aUNUjeLbzAw8r3uGOLPBtx7bgdRzJdhpsvPOY3m0conX21fUAVb2EWQUIV3Lh31tMzl0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720973; c=relaxed/simple;
	bh=eubN1SNcEiFBUmnvIMKscUak3a9TkLmcxn/pNLpftMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBwfqOGRG4bP8vwTTiKl3aSuP/AxAoAvTMFO52wYPult5aYUHZmIg82+q5Rmf6Tm+DP5PForcp+AC8nQimAU5napss9kgnPWvOV5WvOMm53JSHjI1C7X+3vud44cO5affBbjLU2PpAWcNTg22e08paUXurY2lPCpMlji+wC5FeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlVAKuzH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGDhl2016204
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dHkPqzKL5cOW6aLL+kPJl4pl/S+1jflMOk+MByC2fno=; b=HlVAKuzHh6zu+Egu
	DSqD6lycJX5+oBGVKBDWD9ysgND+vCI1g+jjSUtG0Trybpsyawxps/OhKXviOyVm
	9tO75ZywroCnvPQu3u/Kebe2WZtHw6LkS/nhgdbsiiPz9NVENM1EXuT8+sO/i3Ku
	cyYY+isDWLcSVtSJqhhuPFZvhtdpWp9MNBDZOyAPesAAx1/Yb+fzEkNhH75iKCZY
	JMld9i6FVGzectTOD7OxDU0XUoI3BaisR0/TvFs2xV1bre0fTRIsOksiHYzTBu0/
	uZcrWEns+QY/cjP3q6QgdYCeP128qg1bKd5l0VDaSKzRzZvrHKh2+SXUPul67zrU
	Oanv/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5w8kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 17:09:30 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-26983c4d708so18706535ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 10:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720969; x=1761325769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHkPqzKL5cOW6aLL+kPJl4pl/S+1jflMOk+MByC2fno=;
        b=eAeKYaCsac9JNpammH5eJekBC3bp3JbAmTMiwsd3sYvCuwQLdywBygUXNW+LQSWclE
         sNIdT4UvJoXJMITZ0JcG7sRtwBtne3ZYNTJcfWy794KzKg3DcDjCkOsmpryFuhKzgmir
         RXKEatU6G6v3nUIvCYtDcP6wfjx+9WsY+8YYnR/8xs7dwkZiPJualcs+G/f4czri7zet
         2i+YPM91poaCXq0GMAX4ZyXKHIo5ZXQ7r3+pyqpWjVGkehUqAipT0uZ/6yMIW00Xx9/n
         vDt1eUFerMR2vNmshV7dwVJpcQ2QxtXHFiLpZFwjbN59AdRtq4InIgwWevISavC4q8Ed
         15Tg==
X-Gm-Message-State: AOJu0Yz8mprESdiP74q+sa/othDygIXMnmfY9958x4H055HfsFP/4u/l
	kw+fM+CaXpKvRYw6HihwqL8Ma46B8RWm4yLjgzsm+Zmv3oymX5gmupRN2F6exhIGqzqSY7dpcCS
	KqNDvc3qWZQ3UR+ZRjF49rjp9Xanej4X5WxXx0P4qvGB1X4lHlsdDeOzVBN4TgazAOhJ4
X-Gm-Gg: ASbGncv1K90Xsod8rBL7vbt4JJ4rFgaDRDbeb2rUeu2F9Qm5sYz403wDvFh7rdwa+WJ
	9shIj4iBKZYSqQUfcRsbCdQE9rfwharw3QatP9yhkK0auXIdUP7zksNt3iqVvTB8Bzo4UO70x+A
	HBKToAZVO25ylbd7fh4BYqOkU0YbID30+TKEX+pDepU7tpnPhLzNdKJprfumOiFHV9xXXGIUR0u
	PQsDCZeY/NOxcrQbrFFPwITzMkSHaoaB/L0NT1v0QSPvH/jHRbiocs7sZlE7D00wY9zhAnc/vBx
	ufJN4igxh/tjkPqJBuVfihqnUBchwVzaOXgol3KEgc5iBHfYwz9koobU8HmyO7rH129dCpcQBz6
	Jj3LOAwjWdhCo5FrEGCX3/JY=
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id d9443c01a7336-290cb17c05fmr56313185ad.42.1760720968742;
        Fri, 17 Oct 2025 10:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUHA1cKYoK5EhzqViS61RGZd6u0Dhx9U4B3Qz8Ha/inD8zekpvuLlC6BeCF7KMumjqYTzq3w==
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id d9443c01a7336-290cb17c05fmr56312755ad.42.1760720968090;
        Fri, 17 Oct 2025 10:09:28 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471febc6sm173625ad.86.2025.10.17.10.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 10:09:27 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 22:38:33 +0530
Subject: [PATCH 5/6] arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-qcs615-spin-2-v1-5-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760720932; l=3741;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=pYXZ8JyrCel0n/Z58j1178sF3I/9eN/SDHbJiB8QyuU=;
 b=cd5A5lv+d5mtTnZWr7466DoX8m11khu+CGe/Vzv5l+k/D49mAQ3av+THiJdckItV2Rx4iIEWL
 6AMy/VgCXXHAq9LXNnYVs3uZaOSZo+oOIZe7P42si7eYNgLZg0DYVTs
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: EX7Bf6FDGgdhixydUtVnvaQwqC0PImVZ
X-Proofpoint-ORIG-GUID: EX7Bf6FDGgdhixydUtVnvaQwqC0PImVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX2rZpIcHiQAS7
 DAXkCAYMXdNjI4PFU/mlLymbWWr/kQ/A5fRyaMzCk0JoN2wL2/a0ioEwwWRMj4DoaklR/MLmiRY
 yGgn9AwM+mlBaoGOcK9BFJN8T+PIBaStOQYuMS8kkI6zkV6y6BTZOdul7ILDZBzJpDnCQWLD4Go
 p1ViSf08JiB1O8XaL8Xt5MgvVeJ2f8sPVWl9HdEHMg5e2D1TcWZNUMgPV9SBHeNu92mzEy86EBe
 X/lDr/cVh76kBNOJHA8NiyYsr0K1/iGhXm5CQdCAa32hE4UfCu96/I3phZYZ0v66494AVKhmpci
 IX2aj63vYVpajOqXY/XTp0Sac/yHexfvDeiDbHhmtnrc3WYkU5LueE0Kdvk2pqizsW27zMO2wBy
 oqTAgpQhat4sltlGIwS0mSy+amyFbg==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f2784a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for qcs615 chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 112 +++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index e62b062c543657b6fd8f9aba7ad595855d8134d6..8181f63e4d6838b1d198972199756271707e6e49 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -508,6 +508,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
 			reg = <0x0 0x95900000 0x0 0x1e00000>;
 			no-map;
 		};
+
+		pil_gpu_mem: pil-gpu@97715000 {
+			reg = <0x0 0x97715000 0x0 0x2000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -1687,6 +1692,113 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x90000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>;
+			clock-names = "core";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0x0 0x401>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			qcom,gmu = <&rgmu>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&pil_gpu_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-845000000 {
+					opp-hz = /bits/ 64 <845000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+					opp-peak-kBps = <7050000>;
+				};
+
+				opp-745000000 {
+					opp-hz = /bits/ 64 <745000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>;
+					opp-peak-kBps = <6075000>;
+				};
+
+				opp-650000000 {
+					opp-hz = /bits/ 64 <650000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5287500>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+					opp-peak-kBps = <3975000>;
+				};
+
+				opp-435000000 {
+					opp-hz = /bits/ 64 <435000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3000000>;
+				};
+
+				opp-290000000 {
+					opp-hz = /bits/ 64 <290000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1762500>;
+				};
+			};
+		};
+
+		rgmu: rgmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506a000 0x0 0x34000>;
+			reg-names = "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "smmu_vote";
+
+			power-domains = <&gpucc CX_GDSC>,
+					<&gpucc GX_GDSC>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "cx", "gx", "vdd_cx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob", "gmu";
+
+			operating-points-v2 = <&rgmu_opp_table>;
+
+			rgmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@5090000 {
 			compatible = "qcom,qcs615-gpucc";
 			reg = <0 0x05090000 0 0x9000>;

-- 
2.51.0



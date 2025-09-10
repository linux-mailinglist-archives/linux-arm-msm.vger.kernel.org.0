Return-Path: <linux-arm-msm+bounces-72966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAB1B515BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADBEC7BF412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8B1277CAB;
	Wed, 10 Sep 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3R18bPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F930B512
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503587; cv=none; b=ZhFR7b9gLZNXGGO++8Lk21ApwTGfgWpzeCrAEEXvSHj+INAFWga+v3VKuZDmBsUJBxtWyeTgBiF7/AhAIAm4pPszjslSVStfGOnwsnuxvp2rYSHaI/6lP+ldC1ymEcvCKbyBqDbtVE4HbfXagI5xbnE45zWCOWoh0agRQMCFryY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503587; c=relaxed/simple;
	bh=yuCRPH4In9nuWIP15gnF49tqCzrlG95RKcO9BJSBpqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZsLRzu7WfRywzxi2730D96SFkzW9F4LGvg65FIW74+7A/4JhU+T3RD1vPReDS42LPeuGhlJL07hFxd7wWtP69uC3/ACzX6Y+NE57N+axIXnL/1k87xibJZbZUh41fACyYAY7MqRqDREmXKMZ0Lqv2kUJ2prakmi/z/D4oamn5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3R18bPQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AAFEGt031251
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8/MZ1Z0ivzcpEA1k3SkR69iuMbjvUgH0zMXaZpabFo=; b=N3R18bPQude7mWut
	GJgsCqrJY6mmuSz8al39IC7ldM3fdJMZML+DZt91m3Kd9+8IKIwNOV3rHGsRAbDI
	m6TI5/79DvCMnTAFUleWL+X0JByua+D+QqU4LokF1SwUHp9bx6fuClmv2KvUNqXl
	iJgLm5mIHuCDoQcQRb2aPdVQe6aoKEnRa4fs4XQgYmijNW4TKIKPUN5GYRSejNf5
	wSsP3F24XqMmDcIZFDBrwI/AZFsLfbKG9e6e7g6vP1Sa282basGOyRr5QZkbYGbK
	3qXKv1OU6HDbHlu4HJ9Ue+Q8mG87brzxw5aEfFxMiOfVDvuSnQAzTPAttgnMU0PZ
	hP4Yrg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t3803km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 11:26:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77429fb6ce4so4616386b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 04:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503584; x=1758108384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8/MZ1Z0ivzcpEA1k3SkR69iuMbjvUgH0zMXaZpabFo=;
        b=Uus1j7jyFYbSoAm376fhdhWgQ7htCDANtlXQxIV3Qab4v6MkZXs1dKcOAq985aNeah
         5zYUTKIGPbvRBJ7jTjDBsJNmw6vUo+cOLnyGi5/mNRku0EKmlQmqcSa5i90ky4dwjV6Q
         QcnCGBSbSK9awWk8kVcNW9DYX39WH3aNopiMbgRBXsk2bxzL1FuvmZ51/eXKxEoauzEQ
         EEcd75bgHr5dt1zV0fAj3DLVs1VWAr3+y1DNt9uhV4BK0uI6GtKv3M+STFyyCjL95GCj
         L7zYt/mF5JpiF/xQJlMSUJeQVhjsdgKtV7KuPKGlRgUxVWLuLsNFZ9YBHlh20zM9p+ph
         rYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYRl+yzskKJ/T7mQIhfxrIsuTziqUks68M3uevgOERxBMmVV0tReWv++rciwt3wx6odm9e6/03wtH+TghE@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQbvS2uMPWz0SvSNLRBnqJSgnaMgeqYpcACNIyYHqcX+NNhBD
	f9a3clJ0o3X19ogPWTwf9aLS2OfqkgrkPEIzuDYqdA7nYBJohioyC1UhqfTNGHFYEMpeSYl9MkY
	0vVnkSU4HuiZJAZyzg5VkgeJOybZWAEgl4MWTFLA4EEdd25Dita2fRP1Y9Or4gR6uBBa/
X-Gm-Gg: ASbGncsQVX4sbNJq3rSTFhLShK3NKrgdqYLsKnqyOnwOUtwcSwqGKiyvnuFk5kSb3HC
	iL1v7n6IM0NdoxeVuEd2vF/5ir/blsRWI6rJthyWaPFqUzQF2qz5NnnEtqIKVbdmw6NwvBYX3vI
	nDIXazrZIrs8D91zXfI5p1kC9p26wpmt26gyxlTsxsFCh3b2mPTLJoEdwO63BUuM3xC0k8jxvHJ
	PP8F/zPOMVRykR2Qr5AMaLJURFKM/Ps5NvHIOd9YmpydW+iSFa/KQ9zksQdA6X9oDeIRaGHJl3O
	1sxJZcm+rUp3mDi4XepRaZVaqseIO1nOWmlH9zl9DJWz2JGJ4r+7IJkExMYBYkw3
X-Received: by 2002:a05:6a00:84b:b0:772:3714:60c0 with SMTP id d2e1a72fcca58-7742de62dfdmr21101635b3a.18.1757503583882;
        Wed, 10 Sep 2025 04:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+vKMhfpRQd0UiLtmW+vXWqGOmoSTOstFxWxLpweYFG8NgPpHn11KXD5VBasK4LGW6+2qGGg==
X-Received: by 2002:a05:6a00:84b:b0:772:3714:60c0 with SMTP id d2e1a72fcca58-7742de62dfdmr21101595b3a.18.1757503583151;
        Wed, 10 Sep 2025 04:26:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7384sm4862260b3a.76.2025.09.10.04.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 04:26:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 16:55:23 +0530
Subject: [PATCH v6 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-a663-gpu-support-v6-3-5da15827b249@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
In-Reply-To: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757503556; l=4545;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TzSQIC476egRWEvc0vuMM1xOXcUXjS/jkSdKEYKiMyE=;
 b=jS5wc929f/JcNsB3utolzl03oS36/6yrhYFLYEiHFCDxSMXk01iodz4p9lrai9kdjjGsowLgd
 nZx6hRYwgNnBUurINoWely3+uMbzzGy/Y6zLEs9fySoIlg6/IFWNnQY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: CYXRtMHumD6tHNkw_93n0NwEmbzPTRli
X-Proofpoint-GUID: CYXRtMHumD6tHNkw_93n0NwEmbzPTRli
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c16061 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX5wCoQFSWbrR8
 DJY+awAok0FQLvfJ2BBn39uzPEPRP760BfO6l5SCOwMAcAeGudOkJDKVbXF0yGk4Y/wk4ZaJzEY
 cGedJ05c12WnzZ3JWwWgIQaeom07von253kW9WpRfevR7RB5ioOOuM81Z1WGUPO6gROm2Hze0Es
 y5PvpggZ6/pjTJOytcLMfNHeZRGlUjVqgXcWRMFw5Pof0qJea19eYLmOV3drK9WKYrZstHIgguG
 RsNKGkYFqJKi/z68a4Jy44GECPLDmxVrX97nYN7/IuJdBHlvZJ/zV4/MMhz+AVj5ORKGITSjcVv
 iIijODp+8JWuNzs4Nf7b1os1Nr23HzAIiRF2MfuTO0AHaucFobR8/9LZCcKTzNdZ6DCez5ct9+F
 jMEEIpzr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_01,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>

Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
qfprom node and wire it up with GPU node.

Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..bffce5a5d465b6360397290aa3d948268a254e41 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x3000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@240c {
+				reg = <0x240c 0x1>;
+				bits = <0 8>;
+			};
+		};
+
 		gpi_dma2: dma-controller@800000  {
 			compatible = "qcom,sa8775p-gpi-dma", "qcom,sm6350-gpi-dma";
 			reg = <0x0 0x00800000 0x0 0x60000>;
@@ -4093,6 +4105,113 @@ tcsr: syscon@1fc0000 {
 			reg = <0x0 0x1fc0000 0x0 0x30000>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-663.0", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&adreno_smmu 0 0xc00>,
+				 <&adreno_smmu 1 0xc00>;
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
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
+				opp-405000000 {
+					opp-hz = /bits/ 64 <405000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-530000000 {
+					opp-hz = /bits/ 64 <530000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x2>;
+				};
+
+				opp-676000000 {
+					opp-hz = /bits/ 64 <676000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-778000000 {
+					opp-hz = /bits/ 64 <778000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-800000000 {
+					opp-hz = /bits/ 64 <800000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-663.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x34000>,
+			      <0x0 0x03de0000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub",
+				      "smmu_vote";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+			iommus = <&adreno_smmu 5 0xc00>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.50.1



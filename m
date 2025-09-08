Return-Path: <linux-arm-msm+bounces-72650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7103B49A36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9163BFF5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424232C0F7D;
	Mon,  8 Sep 2025 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WihGC+Lr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F682BE05B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360431; cv=none; b=JIiG0jaOis3KnjhDZYiHB1wuQIuKEW15MEtiE0mgn1C8K/0RELo8hkCnSLL3xZWFX5HSGB8vwFlLDQb7KUy1hDcemrF4sDlC+hC+mxDTTA+iJ1Y0DbE0++gxJEL2Mb/ufRcIMJ9DDIVEh2vplk95NVLJDFbXeg8oGsFZ/06j1tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360431; c=relaxed/simple;
	bh=oAApktWGpyWZTThnrD0K+69jVWvx+ZQQkSZka+lA7fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJSwkoP6dAee/Ioab+zki8PlSa60FMrx5OhKdfL7tChvM3vEelRPvHoKbCnl52UrRv26w8AtKbS1TMe9m7kYLFImKPP4LVZidpspM6zzppf6ajabSxepgeoHdFPF3u6wUjwqligcHFWz7I6qSrGn3e7zKn5MisdURSQy6m/HohI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WihGC+Lr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GwlEm022590
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzYEXvdjJHcyIwrownt6Vs9jxJ6nvcy33OfYj3o/6ps=; b=WihGC+LrizXzkal6
	7JzKhriqvi133pO1HnV+4qoVIfhjFZ3E7Xb4UQdjd4UWQTxSnWSqmDruydL79L80
	gv3maxYGZBwYdGAaVH+HZaSqXOChOmyOimqbTvhWItLBHzVJJn0pBit/ekcg8Ela
	MNPdLbQWBR89wQGOTF+HagYlxH8sUMtfzxszM+vGH13z1nS5lvitKcQW2Rd+n0fl
	AhWhaj8GvmOkUwe9RTRqwpBHvq7JDksCpPjEC1vwq4S6F7Ev0KRqeX/nP5jb07DN
	iB9idJ1FDZWaP1JyzFLw+CEi2Z2UAPFbZYEgsJbCtCnHH5H14mKye7YBjiZtW/jU
	41kDAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc21s1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:40:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24c9304b7bcso50520775ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360427; x=1757965227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzYEXvdjJHcyIwrownt6Vs9jxJ6nvcy33OfYj3o/6ps=;
        b=dXQsi7GZv7tI8pKF55i4uGp1WKgxruRKmy7k0Vwe31d6OCKohNNz5FhN8i6rGHAgUO
         /OShbR87NhYp3mOe6MKMWn8oXIe59S+jDg3GEtEXOkkavLaHo4T0NWlaAJPeRrytM+dd
         c1n8CBG4anXHsnAu/2dNOshgRWlzfcZzaAekh4zFmdy43cHwESsS/gB/NpUKVQ/Srff/
         W8nhWRgGl4vo4UfysysFgp6KSz6+nXqm0ztQu0HRVR/xCCvFrB8Huxf435z4knWWk0Ba
         i+1l8ae+RK08C47+Jg/DWK5jNQ4AJ0pAen34KLf+i34gBOHMGAM6UeE+TjbmwYiVMXTh
         z3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbaZS3z0t1Je5tDH4lz5NB813dY8i6I7+lM3hfUyJ8P/12suFDJiu7dksAvvmeo670UqPv5hYYuPL4n10e@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4oUOBU+Yf57kl4hIUCbHAE899fQrw4NybB+kLI2p2bV/m/Smv
	HZVzUBtj5+SXm0CDn/bQubS6obR7v80gMTx3nW8ONLD9fNzHWpWJSN2OOTwMhAjYON1G8G5X0TW
	090glu91BnC8RrZgYs95PjW3blt3xMycF+ZzN40nyMH/g/ViUIW+TjXv7ro8SVF7MgdxiTywVkm
	RE
X-Gm-Gg: ASbGncv2Ugt2OLVTjZhBRbywp+frSd2i0Hx63bSJGHeuqIml1ApqkBHXgKWBUVrVb1l
	P4/6XvG/vSZ8q2EozBAZdq5/gD+zFCMxWMWO5Rkm6XzYMIy30SRYsjNtE6RvHmUQ/HM0HwnfYWO
	WwsfEjuzImZhzf2BG4HyZ5udXULxiavxgD0zrf5WS2Qvd+VzMZL+5hBIwSFVfxl7Os/R77/PfQ4
	/tCI4V/LAW8k9pAIsaH4aZQeVLJoRgBqRC8IBlIJ1NeygoKMPA0x6orz7rd2ZkzWyBM4atrfXWt
	EZdeQSS3VFNXUc1xBVfsf0UdZD6EORhbPT0VV6FfTHeju7Gw5ackMTVj1k3f26qV
X-Received: by 2002:a17:903:a86:b0:240:48f4:40f7 with SMTP id d9443c01a7336-251734f2f64mr110307575ad.39.1757360426728;
        Mon, 08 Sep 2025 12:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt+2g6aVsxbb+YMdB/kcZgcJmHNy7QrMgRUWz/B2tQqKW0XbprvTQHJgS+j3uyAhM9x2B3YQ==
X-Received: by 2002:a17:903:a86:b0:240:48f4:40f7 with SMTP id d9443c01a7336-251734f2f64mr110307225ad.39.1757360426235;
        Mon, 08 Sep 2025 12:40:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:40:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:38 +0530
Subject: [PATCH v5 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=4549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6zGrMCJTSPdrvTNao0mk6NK8QkI3OkgPqzaJ2kGlCJs=;
 b=88LYd1g5CwP/izlPMWR4r+amOExVQ8ER+AAEVv5jlcstqu+tke91LY1EWXaeToCK+tEI3BzvA
 dFgtVlz3MOQCUPXzbQYbYQ4u8HrEanbqLBkuA18u6EkdLbWWyZsu5AB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bf312c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ojw4lY7p4G-ryIi6f6V73kOTseOZtgJr
X-Proofpoint-GUID: Ojw4lY7p4G-ryIi6f6V73kOTseOZtgJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX9zSqcEgLiH+g
 cI3Yd+ujTynhcB7afS2cSB4ejgweCgu9LKfPiuIZ4kmnS37fwe9H/YVEFr/6nENaBcK9aeD/TL8
 QjsAdPRWbE/7i5DUq9wsSLd2fMj8hZhhK93L3TG/GgKRtH/92/f9OMTu6kJHza/TxBDbpFj2dzp
 qFRwiUInPOdfQL94hf8wCkf6LUIr7U4pf/+6wTRqkUzJnhHaz6i6ywBJnBbMb6blnUszDxoEmAu
 EwA214Lp09knyaUHLvrpMcXjfC64RichGF9ycJzFeagiik2WFXfAVfloWY4VCyhC9RBqdEOKiMc
 /PEVZgnMkbnQLGV6iWmUCsOAWMHPjIbj1qmI/y9r6C4w4hfnY2gwl4pOzJZYSGXujGe6lpgO+ID
 pFlplVji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094

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
index 8ceb59742a9fc6562b2c38731ddabe3a549f7f35..52c2533383920fdf34dc1eba11e5ec01209f4e8a 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -1097,6 +1097,18 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sa8775p-qfprom", "qcom,qfprom";
+			reg = <0x0 0x00784000 0x0 0x2410>;
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
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,sa8775p-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.50.1



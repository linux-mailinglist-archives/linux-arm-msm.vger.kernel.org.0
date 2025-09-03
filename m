Return-Path: <linux-arm-msm+bounces-71728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC585B41643
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29CB3548C08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E842D9EE2;
	Wed,  3 Sep 2025 07:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmKYjV8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834DF2DA740
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884034; cv=none; b=oz1WiZ5EimOB2/xL1W3VyKFCXbixCaflwAyTN7lJ2ZXhaaKdafUTZlRoj4Gegfq4lsM+fqZp3FqtYmjrDuWtUO23diM19OZC68qp4p/bbcA0CvZvTRESqbnKTO7gkEHQ2WePqPHPG9HuYnp4UOOcRCPvw4YvO2ycqbAa6gUC6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884034; c=relaxed/simple;
	bh=Rt+uJIP9yhMYsZGl3Ni5LGLHO0NjDFQ9aBLE6yz0egI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UvRfWNt4cNC883VQuMzw/TVNKsajVSKYsXmJeHFihe/fPV4lRIgG96aNrCRi5/UnqpY0pxE/7od+J3bN3MpJMDw5Pts8M7t4FCKGBkuUGLgC/VVagjKjqPE8ijotE/45BZWpIEcVyMi0l2ncV5oDHDwIx7gSGAJWFTs+iF+E9og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmKYjV8y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832ZHev012309
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 07:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gD8qutWEStZDNubpi2rWDL7kuXRdLU/Z53l7eIhvmU=; b=jmKYjV8ycL51+iTZ
	8ZrqDWNmkWqlAeEPRlIo6mXvkUEIXXndvFerD6H1b7eBJNJmln7rUbMS5R6EPHUS
	giUjCHEqXEkCiGEJ5Ihu2rKYCFD4T4/aQfZKpO/m5W9wSQoU7u/hFkxHQh4Ep+IF
	eKyHI5YfeiX9zJps7BxtVyQ0zvbeEAe4RGatJVndYA1hAw0xqdekCD6xsH1U4wd/
	BlI1Py8JgCQ1Mn9phx4+rPnu41udKjK2qtUO78tZ5wQD3sEK12tmN1Rvk3jT6aTD
	AWf3/6PoWPHDFsx6KjpFQU6wYwZUNOsAWVhqh1f8p1p/jB/BGUqr4ZyG6nmW2iF4
	wEUXvw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fjfya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:20:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724ff1200eso2745443b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884031; x=1757488831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gD8qutWEStZDNubpi2rWDL7kuXRdLU/Z53l7eIhvmU=;
        b=aDYtaeQCu8a+MelOl4Em0KrQalE03rxL/5l5XRoqsi6eZQZGR8M8zVLiQXWCniBWv+
         2PZOGf/jtVre6eZjz80paYzm3MeMoienpSF5juWHYLdXdDWs/wXiWJ0Ol4dFnpCdqGXJ
         2xGA1oJQQmzU2HwgG8B3iPAQQd+SvWIITHFnxT6wOZTkSZ2UQQ//MI6vsbCDgEm5Kbuq
         VCNZ5fylg7PgFPAzHZE4PpQa2SlKxxexA4ZtHlO0E/s8s9ml8diUVb3CIYfBRyAFDhSR
         coj1huthW9tbcU+f7WCcnQkzlq65wrcAE4KdH8yZKaOvgpHFsHDqhwWNN0tSpzirOWbh
         jC8A==
X-Gm-Message-State: AOJu0YzU47pp3GfY9Eb1OntOFAM8JtbocwkLs63k5IxiVxgZ/pj0ndW9
	tF64zUb7U8lfH9CgXE0hiBxGfo76MmNhPBQHtRz/feyR5LMEvXpXC0h90oyb8y/Y14x897o2Ogg
	zpgZOpDxbpUoXMNQTDnztSnDhpNhBu0PbJCPvoqVFZUc3Gigg8rBruDRWvW8DlIImFaMM
X-Gm-Gg: ASbGncv70InD/+DkZDPXe6qGHuev/0/lqIKDYwI/P0nu9yJOffTnfs7NrLLgbTdo2Qb
	aZ1V1I0hzZrmgyR4pCbA47YQHGX6z/GGaZLN7LUlSOOopa9e/UAP3o7yiZtvL7lS3UYmRnh5APy
	AQ39OyqGeGkryhE/PeI4MdWGm/rBhBlPpgBJW/InbMneQLz46Nt0uhqz2gBcU3Hd1/7075WURy7
	g2ZVzy6X8CEA52BYPGsXfuLFKJgMzOY8UHc03eRLkLLibUuttDxwKDMRcQJdkdfGbphfgliSX8X
	agadRPJHuH9CKFmuTlqqOUYJwoWXJWSThwc4GySTC1hpknVprjoLZVU9wC8cBo87
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id d2e1a72fcca58-7723e3b1c5fmr16627553b3a.24.1756884030785;
        Wed, 03 Sep 2025 00:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/VZ+eezWf10NsdDC2ah8ohwPyf3u6U2AGy+CxYZi3Y89RHsi9zo/N0N7Fd74Q52ZM1qd6cg==
X-Received: by 2002:a05:6a00:7450:b0:772:f60:75b0 with SMTP id d2e1a72fcca58-7723e3b1c5fmr16627514b3a.24.1756884030249;
        Wed, 03 Sep 2025 00:20:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:20:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:54 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-3-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=4180;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3SVCOq1sUsaaG/McjBG1Nl1zTTKQqCIctO2ttcMNFK8=;
 b=BbTief53o9N8JFHS3Yt30CjJDyW3NZXLWVKqf967YbaIbxFFCHlyi5x0qtJHelPM25s09xqrI
 GGfGqLavwrDC7mDTKDKJeSeZ3WliyA65moxk1FSIgvchPuI4QVRsp1J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX/PNczEsTerJy
 HiYYJnEvfGbr3V/DVMtSZnR8eWF5ZZv3flq8NTjfKs2z/HKTmjzBjuo+GTW7V6tDcH9g7p3OsNt
 pFbDrccebIXtX4VGu928hUpuU5/ohzLIFVRV3lnmGhEBKAevQwFapgyuoD3pVr2tU+ITNMSlA/h
 CaAeIQyo1mAOy03o0nE9XmROlfs/3R6G2MzKvfePjaMwwY8YS8pfb1zfbMFOvh7gxYtZL+varsx
 q9CKGBQ/q9z0Am23OlPxdw+2yqLlwJEYTV+mjdlj378Wq1um6ZOaKJ/RqWZHOOb56ED8XvvJeeB
 vStL8Vjw3mP+mz0a2W2kkMxBguMjOhkBwQRAam2Q4BbX8mmnNlA6uGcdPQozQdR0HHttTR9/XNK
 FLUXqleo
X-Proofpoint-ORIG-GUID: vd9nRNKI53OJ3L8vdkvzWHnUbtDXyW_h
X-Proofpoint-GUID: vd9nRNKI53OJ3L8vdkvzWHnUbtDXyW_h
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b7ec3f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=D_IGQ_qLm8RrHFHUsBgA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and gmu nodes for qcs8300 chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 105 +++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 0024a75916d0dc3d2f48912549d9544c124e27ff..00e6131e6b24def4ff9566c14398aaa86efe557c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -640,9 +640,14 @@ ipcc: mailbox@408000 {
 
 		qfprom: efuse@784000 {
 			compatible = "qcom,qcs8300-qfprom", "qcom,qfprom";
-			reg = <0x0 0x00784000 0x0 0x1200>;
+			reg = <0x0 0x00784000 0x0 0x2410>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			gpu_speed_bin: gpu_speed_bin@240c {
+				reg = <0x240c 0x1>;
+				bits = <0 8>;
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -3903,6 +3908,104 @@ serdes0: phy@8909000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-623.0", "qcom,adreno";
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
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-877000000 {
+					opp-hz = /bits/ 64 <877000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <12484375>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-780000000 {
+					opp-hz = /bits/ 64 <780000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x1>;
+				};
+
+				opp-599000000 {
+					opp-hz = /bits/ 64 <599000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x3>;
+				};
+
+				opp-479000000 {
+					opp-hz = /bits/ 64 <479000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x3>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-623.0", "qcom,adreno-gmu";
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
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "ahb",
+				      "hub";
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
 			compatible = "qcom,qcs8300-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.50.1



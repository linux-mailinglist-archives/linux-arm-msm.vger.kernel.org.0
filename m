Return-Path: <linux-arm-msm+bounces-84375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B1CA3D38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 261FE304D87C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D80A345CBE;
	Thu,  4 Dec 2025 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNceVEqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/Dhy8R9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164AB345CBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854583; cv=none; b=rMORKkMS6FW9p9Es7Ou6lZNJNA4zBA5X9qjL35j+NMGvvNnGx7gaekchYsXXDx7FFlP2MkpBGrHb59tYtm6pQhHnEJ5z3vmiQzuV/DcLcFvGYXAM/NEU9XJQq3QGCWZma0FIRnTstKtLBzah4tLg/HRRAsRG6JkRKHRcSWPa8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854583; c=relaxed/simple;
	bh=MHrvTu7/8qNQc0daC7QAY1RnVJSYBL5V+AMbLTuWEFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtLQxwZNOR4Vg3tPLKlmdwCTMK68vrVFQfRqDG8bDBbPem/kWJs65Gxo5TB1UD9G1FfpHzOT0+qTdl2NL0rAiv9DpLX5MWFbT3QWLOZKcRcpmbHHtWP8IFsOELbbk7nLETlH3bHKbOEbXNjzFWcpFi2rYi67K2789EGpL/dmHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNceVEqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/Dhy8R9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErV31130933
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=; b=LNceVEqMWdgQd8we
	UYftBz0UMbuvslXrESAVtRCXr5kA1ZAErHkLjrNYNbg1Osein7n5TTRnqYsfUqfx
	7igfa6geIhGqNPXy2KutSgW7LlJQkQ3aIPRTpFgQRK+1689xfw4jofwl9bkvRFEG
	geGXL1tYM2cG3okq4T+YRbPZlZwYVf1GAH6h65//CaL1tsmcr3kTP8BfcEtO2iUY
	QYl7ZtSVMlu36COPpylQbRvePKLrNwRm79QHjUDFOUnoO+ub77w03cXs0W2YLhg/
	eZu6L5jzSvl3sp5ePUpXaQJKqXbaFOQ+zkxuTqdj13F+ftKf7WJIUHuVZIneWWjT
	IdNamA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f01t7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:22:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-342701608e2so956334a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854577; x=1765459377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
        b=a/Dhy8R9rCMCDid+wrf0lyJg5oUIqP4A+YqDC0QeSh/Mwx62m+TpISkYeWaSdnNjs3
         oi/FTDzyeclTYO+Gep7y7dCFmgiOnaVOJ8WUSTzYB8Yw5EFwKn0latTXNei/DCUUNbXu
         cA8Tj+Xt3haXIBK0QnRP+t7zlVlLtTfEc7yB/VJoSZwOsNkrNxXzuiRtPJ0XYMiDWexB
         mktbKJRFQ+nBrSTUT9Sjx3w1W15YDQjKKIKAP6GblZpVqBvT5hZZhiGX4ZZouC4M6wIF
         Uw73qIKxdawGmo0MLuap7JaA5z+3H8bAuNoYejjuJUwgCUcTJKw+6979vihv+cobzZLa
         gf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854577; x=1765459377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
        b=eFeAERQpGkR+mNVTUhHxiKExTzkfrgm7e9sFmveNP7jE3/q9KGrrxFAN9k/30Kp1/l
         6vkxKapvzV9vJxfd15YL/65Z8Rf+7f0EgN9QA3SYqxwGIf7pz6AtlDAIZS9Wxi2tBed+
         Z/R6KgEOUHNwNB2u1TD+9m7uiQMDkBvHzaSLWEilxBYn5dC9XoK0gcVV8ox9UQxaVKKS
         yxaTdNh3aOG4r0beRLKHZnr5nut7sxHCX4bFL143QILqAq+XbMcw12vgt9OpChA1LJDf
         WG+u3BWHgldfkwff8c77JEj7Drga+2x8SGh+NMA/nlvLnAMjuNQ03LAfFAIm1I0OHV5g
         B/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUHj7RtL5CvnvYPNg9rHZUxwcYXjx7xTj8UU9KXc0et6vavEvcurLULQxRjaelB+AL27yv1oatTDTQhZMuB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/YJksLuiT1wzXxYtbrCHSveQdYPg77CThahMnQWAtwxDYRXb
	s+Je4WYeRQL2eJGzIQXf9jAuy/28Y/erGCcIhwAMP7018j3L7viYHltOhDTNLGEIORjeqwQQJyi
	WgxQ8GB+PRcyCmq0ZaS1aaolu6MsRjOmS2qRY6FSdMnK/UqaUhYTcuUkdE2PYAmRDAvmS
X-Gm-Gg: ASbGncteWfjOV/ZZI49sG2fXLxxJ/ZMGEpwlz5gwNSR8k8/FK+z36U0qTWwo3kKHG9i
	KxzOg11MepTLmqV1ImlY8MCms8nZf5Jxi95zkYgJiS0XSp0latZHvrN/2p/3xUjllA7AEa8f1Os
	00dSqe7wnZ+Dhfg3yjBTbRJUs00r6pKPtCfKiXBfvEEJOEFXcOQj6d3A6H9h7e2Bfk71AFEYipM
	DK8ueEOE6At20btCF8jTZBjKyd79Ixd0QibLO0tbCOQGfup9dwQyCEaHleLM1d5ORv30FuXCOee
	54ckBlwJIpN6zqZsIJImmQ5hl/9hl26ribkhscEcyfHYfjpd3Uv364QJWXwoe86nGxnpGzVClHM
	UfGQ6xly6FgKgejJF8pUTtkmtlfCubDVhIA==
X-Received: by 2002:a17:90b:4d84:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34947dbdb27mr3128657a91.15.1764854577104;
        Thu, 04 Dec 2025 05:22:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcpCbjmSwssoTfYUpxyXaMGpsyHUOSMYz8k1GAE2HmcLSOMIemcOqA+wI2mgQM9qIYfbIFXg==
X-Received: by 2002:a17:90b:4d84:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-34947dbdb27mr3128618a91.15.1764854576598;
        Thu, 04 Dec 2025 05:22:56 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f38a18csm1914740a91.1.2025.12.04.05.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:22:56 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 04 Dec 2025 18:51:58 +0530
Subject: [PATCH v4 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-qcs615-spin-2-v4-6-f5a00c5b663f@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
In-Reply-To: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764854530; l=3724;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/Ic4dCF9kYuINmZwU/AYUbdQteygU/T9WSrlkoT+d5w=;
 b=qNk4tAwrnemxEuK5xd/GlGi+oYz+dXGri6Ad/Wph42i1wZHfJwjPdz9TvJvDoSxLhIIpH2bZj
 eEhW9mtyKG7Ci9yHdGZJjQj4KVdmlJW+9/uLNnasWAkIq5a7NaFjVnv
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Qc4G6CgdMG-FByNqCSr_l5odB8xOTRDI
X-Proofpoint-ORIG-GUID: Qc4G6CgdMG-FByNqCSr_l5odB8xOTRDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOCBTYWx0ZWRfX9Y92khWPtGHQ
 mC/E0nzUnV7Lf1WkHRUhlR/WOc+MsomIlD3kpGbM67soSA5BrDJzeS7f+mZoiiiVr0Cml7WP+A6
 CJCuOHwR5Xx90No+Raa5zh3SNpI1zS5LOni0t+zk/onFYV9cRx59WkPA3RMFrQrifX3VQwxJWoy
 mCpPGESliGQ33Cb9gTYJwZfKo7PyXDul/JiT/BH7aN5KvBhctcN93H7sNH+BJOgpA0QagN90yvk
 +b5+mbNFKH5hNRaKIKqHCsbSjmNnsTxlI2mpSrf5M4wu7T6bNJqBUkpoxez25bjr2DqpiVpfSbp
 elVJavSbaGB6FYlcZ/9Twrws5gC1UU7qgfzR10/pBvpvuG2AsSD7ZILug7XaTk+SQj02Pu2QKwU
 U4YEj1u09P0SpiLzgJhCM5RqTfFtaQ==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69318b33 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=j4o8-IGns93TBVLKZIsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040108

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for Talos chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 743c840e496d70133bf82928e9e0c3da9653a5ee..effaff88df83d5e6a0aab45a2732a00cae11e83e 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -647,6 +647,11 @@ rproc_adsp_mem: rproc-adsp@95900000 {
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
@@ -1826,6 +1831,111 @@ data-pins {
 			};
 		};
 
+		gpu: gpu@5000000 {
+			compatible = "qcom,adreno-612.0", "qcom,adreno";
+			reg = <0x0 0x05000000 0x0 0x40000>,
+			      <0x0 0x0509e000 0x0 0x1000>,
+			      <0x0 0x05061000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
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
+			qcom,gmu = <&gmu>;
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
+			};
+		};
+
+		gmu: gmu@506a000 {
+			compatible = "qcom,adreno-rgmu-612.0", "qcom,adreno-rgmu";
+			reg = <0x0 0x0506a000 0x0 0x34000>;
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
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob",
+					  "gmu";
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
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



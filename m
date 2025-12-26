Return-Path: <linux-arm-msm+bounces-86665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE66CDEE81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A1E830010C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE81626FA6C;
	Fri, 26 Dec 2025 18:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXUWgU2J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgZ9O0AL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64F1EF09B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773847; cv=none; b=lc3rlNx6G9IWd0LHIWwEh/9nB9PcVx4rOhRrveuQQxH+wYlkj07rqIE5Vm8GJJo/oRhSVhP0mHPq5HQI2MQwgWdHeqVshrvFdJO+efeEKuXoqtIewZ0UwdEylrzbUAHZI4xLHSm+zq5yDGAdcrVQ96w6cZnV8jBxtNNQs6HT4ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773847; c=relaxed/simple;
	bh=MHrvTu7/8qNQc0daC7QAY1RnVJSYBL5V+AMbLTuWEFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajztj6iv++GCj8y4sU19M1zCryHxJ5I+Rv1ldTEEEZMMk7R2oXXCGiy3fxdwb5FbG91dXiBSGu/jqa/ZXrZXc8MEBQE/sFWS6JEA172sth0gbI2QvjoXQnHM626+JcyaliZUSV0Xr/W2KAVNv2EipJ+6Dph2iYtxwXJ1bu2ntow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXUWgU2J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QgZ9O0AL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bbaM889912
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=; b=fXUWgU2JJCcwiRqc
	T7eQ7CzOk1aO7EoPZ9uIHsuhvC/HH4Ltk8CHP97CtBdo52nqWH+5SpDoKNXZzueh
	bf5kUpfDRY3abMVHY/tBTxwcCZqzCBq6EjpgGSwCPd333InSAuBHh7QuSDF/benO
	B5VE1bx/1vgYMNEOAkFRRxzmm7r8P8yq6mna9yN9L3CcqZyF9x44O3+Kgiv5ZYmF
	Qc2BWQSSamforomW0uwtwnwi+//gxpwTV2qsyHfDcQFbHYsIzF6k1w0baN253vLV
	SftUqgNVuNmNh4Qsp3TiaNCresh/Gl8yGj2VItNsyxex18ih/IGLRCq6qzQkMKBa
	eRcVpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8xvcbh5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso16157458a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773844; x=1767378644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
        b=QgZ9O0AL2n/Fntn34+py5KtSH3rimfNgwjxSC/4m+W+X8ouUG40kPRLTdeCwizK5jh
         //9QTBS6HsZWpTwlsa+P97eu1K3uGxr4lZPazG+ghYrFKRjH3h8O+AsYAH4qOjM4XHW9
         ooefNSGcjhrybDZd8T/6Xpars/nqjwaIju9F537sv58myHt1PJxD/VaU2v9HwRSjFI82
         JFhtrk29p7mCHT8PGfmhqNToJGFYubF+P7H4hBIjOZlSh6vtiWs9RMNLLNPHGGebl28x
         adO84ItRH+bTd3sbcFV76lclaYtGBeJpKCmNd1DQreSkjluSmz45tyvUesB5p1q+HtjL
         Pybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773844; x=1767378644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IyKbMEU7RDCEwbjehbdfTgNXZEiXM/MoJRl3Or3JxNA=;
        b=Dxan9e8ZzAirLdnh72cJsJjBbMcF7UezNcFUrpkNKit2fUQg6pHGvwXUJTsaXo3UVZ
         LTY3sxqKyXPNs2z70lpQvyCJtEJWzN2C+6v34d+afJVkq4yqA66uf/cwX5WT1fuGvLF9
         nNDrTI1An65ic7XYBr+ssju7SPENa+wnqyBAxV8JQU9wKU1XGbIJmBODa/r6aKQbcyEg
         PncIycp+9pSIeX2B9NNaSKClgIwbJq2NoYcJqsg8Nnqv9/TPNzgZdBh1+okMYxu4Y+LP
         caN7WsAVrgqkIbUAg6ct26lEjueslkWx18leQO+gPlxLN4emFKXhnOpxYUzAZELfgdw3
         vOVw==
X-Forwarded-Encrypted: i=1; AJvYcCXc+GaR/yNPP9W25ESDieIv35o27N13YXdBVmlVkeZrzcsLlCW1v9OG4VG0YQOrVko8+lOVEqD93DiC9SXt@vger.kernel.org
X-Gm-Message-State: AOJu0YypTWKN2kFIDW9datW5AC9DS7KD62iYH9GhNbmzHXTw9f8Xishb
	ijh3WGFrJkBewQ7Sz3oh9JXZQ2bTDz5vHOLQnk9oBqWg1iaNJIlvXSOhEYmgnhyYtkqZYantIIq
	g34/9cgtPglQoH6GlNzLvDsAjw/c3pFMUpgm1s/M9RLg5gRdhWdE+3zxF7IE5YMmOkDtW
X-Gm-Gg: AY/fxX4Idu/oToYhaLQQK5A3U1/nSil2sey/EuE/61TlO4cyfpiHTE3xek3WyeHsw2d
	mrDaxjNSDXpb/hBarssTopn9rK8pc85t22cWLSONTwCO5BL5OrH0MkLGpFeolnNZQeogz4AdZkM
	8mEU6ZF5lmVrSjNql+2pb0dVz9QgGGw0W+TlzOlLB6B8tSUaqRFjBMYRSmmMmDLUMld1Ii0d6fD
	BlQGuomC5KHI1ZoeDmQ8xaROMhnREskPwfhyuKayLDnInSpfAKnYKBMzRdtkxRz8Kg34jv21KqB
	RIdtTTR5U4yJEPF0+xitvstl7Ao+okjdd+7vIYNNA6fbfGE66q2kKf2FBzFS2F73vSPRFYGFe4M
	3GuEKlI8eMQACQrwCdhpIHOKd5uTQ+vdP7A==
X-Received: by 2002:a17:90b:52:b0:34c:94f0:fc09 with SMTP id 98e67ed59e1d1-34e92139d60mr20093576a91.10.1766773844248;
        Fri, 26 Dec 2025 10:30:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsISMnhPRANRV8HGLXZG9P12WKnd6txaK1ZJfD8PdYetiEIEZ2uKy0+fbOWtVju1/nWgVE+w==
X-Received: by 2002:a17:90b:52:b0:34c:94f0:fc09 with SMTP id 98e67ed59e1d1-34e92139d60mr20093543a91.10.1766773843749;
        Fri, 26 Dec 2025 10:30:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:43 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:39 +0530
Subject: [PATCH v5 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-6-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=3724;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/Ic4dCF9kYuINmZwU/AYUbdQteygU/T9WSrlkoT+d5w=;
 b=Q0bKa3g7tTottDF1rl8WZKZP3QKMRcDiKitHVNeE4RofYvkg1E7VGFCt6h4RgZ9tqfFfG2ljC
 CsUZfS7k1mhBsjxpPNO8JcBzeLnrYifehFu1H39ZVFn3+WIoofM1sjC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: yUdJ2tzWRYK9_GJf9H105Tr5ADidww4l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX1PTrODVxNaw6
 1liKlhk0hFzlbDC/uKuaKD4LZ+d2ef53yy0GVX1PrbrBfO76Z9wDc0LRMTbtNHaUn+Fq22rXno8
 ypoMqa2xNFOUeWQj0DAPEYz+UdADuBAUg6e/UmJl6xmSkBfUVSSYKtm5EtmoLNRvpMu14AKKb5V
 WVBSMoZzKxZVo9RDzdx5/5zfukRmFyY8Czv7KQLZx0mI4d2a19cHyIQ/WkzP3HEDr2WHEsxDCrc
 RYLBSepIhLy262PiO8UlZPerBVTHd+E++aj7n7db5x7prGmTi+hWQBAaKIZViatedc1cqBy4ejR
 E8qpkL99Q6BgbD2BZYbEUPenCr+xDwXO3o7p+dhTaBeXjHOM5kAkX/wvUxcX+ptB3dfn6RIe8is
 Vt64U4AfU6Ioy4pPrNP6bl301NnYL2BfV/5YaZYxpbt70/p3Y42tuK83/p2II9PTUt8Ebf0tuMh
 7jdkOX+3aAAdDnC8uIw==
X-Proofpoint-ORIG-GUID: yUdJ2tzWRYK9_GJf9H105Tr5ADidww4l
X-Authority-Analysis: v=2.4 cv=M4xA6iws c=1 sm=1 tr=0 ts=694ed455 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=j4o8-IGns93TBVLKZIsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173

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



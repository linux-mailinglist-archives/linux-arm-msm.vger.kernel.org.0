Return-Path: <linux-arm-msm+bounces-87081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4AACEB96A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A033F302A459
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2367025DB1A;
	Wed, 31 Dec 2025 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="haay+MYn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeladMnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9531281E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170790; cv=none; b=nWjKRKuLK09HIBLBj0+2NtuKq4d2iCVxycbVAjL0yiPcfAObFeIjnfyc3PrrfEBZVONR7g4vkR+FrgFxQrUH++LBLZ9GwRuT86dzBPhXImlY46MGGa9s+79T97H3WlUAkv537OYxOYtgFYRJOaMnOfCUJfxByiB/fRmPpRxQnP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170790; c=relaxed/simple;
	bh=l4eOR8kZJV+C+Iss2h5xt4YdVpdDGcWWAjLQKTHE2PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G52zfOFbxpBUWT8ZT43nDz0+8RbttqRW8+3RaI7KOxb1+VTBQxwOuopUtHlbp5sIRC6WQl5PlXCCMIrTJRoasuIAvIY8fMuFXF2pxTWQSPVeywDOk889Fs8QDxDjbDgLv3OJgUIyIpiNqY7JLcQREJAMO6N+eMwA6gLiU8qjGMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=haay+MYn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeladMnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV6UIT33539557
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=; b=haay+MYnSmV8dwpB
	PHqAPXM7Us7ml1+DivxtIfO7Ne00LE4tcZDef/9pa9aJ5oV4eKg/6xuRp9TpEtAc
	8zwFjwv3LJKArl6xz79vEl7buSBw6tUIA7DFUSgVgIvOFJAleixor0UMgzckQolL
	GQCGL+Rpo7fM1RLIetRjl9Ge6UmdYLh3bNgBNCtvqDYHQ2CfW93oivnpX+yElmlp
	vkdjkbJMXUHNatp97ExNgoDkE0oaQ4D2jflFKHPGoil3jRTOPC5dsOi21d/cwtFA
	CQInU1QiODyWiyB+16FkxPL8RJ1oeG9w3fidBZKgrLorG9cyjCvT7m/fd5UE63MF
	clD8aQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yk652-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34a9bb41009so17192564a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170787; x=1767775587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=;
        b=JeladMnAkLksm0gQRlmjyVxdUDVR2MFnrioGiAWjWESUJPA6gn7Al0IRJOkhGgcOZq
         60z7RLmqHstN89+A746dvwggrjwLIOnbjJxiXANxRmlPPrKSjFhKtcuWzoEOpUGuBU6/
         NDhHsU/xq+EyBoldBN4s0Y7kUUcSio0u/pqXxj5YclUHOTGXeWZfIxWfMGcUZ7k00xr4
         MtWGwCIhLZDrESjbxK3yIIqG7rbmic0SQY/4S8rblNLiIQRFYIE9wWfmb9Go8AbkobR3
         woy8EKPtg/zdqUZxOnLinl7IaIZqCd4tyin4UQJbDyfTEuO6tuaPDDPfRokl42987tCl
         SBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170787; x=1767775587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QaNzRd1GwTYSBjf/Z+ZwMZwMyMVSlmGG88hkiAFuNcA=;
        b=CjkKPP3tFSAf9l92EVDMHoMVLM62p3vHQxKNU9DuljdWO1Dy8PlfskF697AT9GMIYE
         zUhFZ6c701h4vkUo5dAUK0hKCTEyhJWrfVTiQgVOIG0Ay0/jXx5R46+jkHap9JSlRmht
         JUPZ3cCPBg9WcmwG04+5DpNAQkEAIaPGTUZ4Q/16d/R8ZSEZrlhNlv6o6dugBcQSk7fF
         qE3/iP1WD6zT6rpAclkV8AzBAUsq23wFDwN8E1+oPlFlrYH0LgS3sa/9vO6o25/09tef
         IyS629am8elLqIvpxu8TDcxj5wXlcmvHp+67Qr4O94PtZV2x/iCSfmsw2NL7PPkF7HVc
         x4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBo6jPq2U8SeARthWbr8FWPZKTz/egwFJhWCsaBl1AdEnIKsprWXpfFVelaVXHeSPGw8gwLdAYm3Ynm/gK@vger.kernel.org
X-Gm-Message-State: AOJu0YxktMCF+9euRMV9Sim6l2zC7g1vFhDg7uvyQxlxA3SmGBlQmfwJ
	uxET0BbNjh3F6jVFGr+6D0JiEeqUTouT//zQBNaBFOwbnJWwLZQkQ6buBHcx9gpDrZ7G7d6sPrd
	yA40LQ8DBlOTPhzhsCPbvLrIcZ9hJbsa8Fl/p8Pyj1Bacd+CBqPsojqRLESK1nj/4zB0K
X-Gm-Gg: AY/fxX5qkc+f8EZaVwCWrmntPkfyp9duLyh22sxa6RtihbBZhJ8f4LqknH1lhBFCnza
	7GEMZqSNnJju2ZVUpH0+vxR/4uBRH7I+A3WGLhHk6WYYwvWJmjdBGedwYx4fDcv9GW9cJNWFtQx
	4zixyB5/qfPYuu576eybZ6H8uAJJ9QZdVwtxLX8v7XGRdbyBLvmxRUWRug4TwpSojAtTh9Fzrze
	30s9EaKiSCNRVsimH4Ggg1vVTSCJVWKr2F8zEMLZnQ/nLp0PEAfB99FwkXFKuxAeGa3EtecGbnr
	xlVD4ZvOPyb7/Nl2V3OZE6NfUSEejZueDpyZLWXA0kOZvj3oe7eSuJHXe6xdkV5q3t5K48SMZRt
	fmrNYpEv0g1r4gfwOOvVpmXytcJsEDDwxdQ==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e1df with SMTP id adf61e73a8af0-376ab2df3afmr30047392637.69.1767170786703;
        Wed, 31 Dec 2025 00:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu/EZ3oLGF1NZl2KMcyUSJhtDfGW2zPYLbNsW86lvNNZKwJtYXyj3PHGDeUbAhfuXdkhwrRA==
X-Received: by 2002:a05:6a20:72aa:b0:366:14ac:e1df with SMTP id adf61e73a8af0-376ab2df3afmr30047367637.69.1767170786180;
        Wed, 31 Dec 2025 00:46:26 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:46:25 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:27 +0530
Subject: [PATCH v6 6/8] arm64: dts: qcom: talos: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-qcs615-spin-2-v6-6-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=3729;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lPrDGRXmTexYyR40CdhB6xnI9xlISq01WTO4Z8VvcR0=;
 b=MuisKXRywC9OCQqc/3Lssr80BMzgApYmNNGxqrut6L/gjG2mHNSAWdmmrHRC7wg6/d2LxvVNs
 JrFpwmHft6sACbQ0ZH7ZZcuqyYlIXpEfINFz7uZ52+1D0lwQuA4eRe7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6954e2e3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: S2BM7J5Z-QHhrRBW9T0E0x0hOGFpqMk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX5n5tJQlkss45
 0XwPpLqZ4HZNVsrw6JyNrbXbGdSolDnEmxC/S/AECUbAcc5lLzAhUTENujJg8LutQnU8lvUxC35
 MFTK8Is913kLDePiTTYHcSRkMXE9QkGt7Y0IdCs8s07KGNke1BtKU+TAvpPNvZ1l7ARcUPcoHLE
 6vGpnCallMqXTUDZH1U0rk4BTEIIAUsT712RdyGUXwyUqN+StkUk2knd1zbIuUGEQ2NiST26Cuw
 IiHXGa5M/nxOtqDU0GQkIg7uiVWs96Znf4SAON/N+aZZqBEvIHE3gNYAjR/7u3AKDZ+I6YGn0og
 qUiWaoW7gh3p0ueBiZF0zm+ijLCDh5Zkw0fJ6khRNxQZPPYJkHRPqjR8XPspfsCLwNOEcv7BEsq
 F8SvP3Bcv8rdDEBnjDS5mMRsMinFxxtbMTRPP/e+UgvzwiWCb4TJyrl8JYKERw1iks0K6MkbjYg
 RUv1JhUkQ+IdZMMltCQ==
X-Proofpoint-GUID: S2BM7J5Z-QHhrRBW9T0E0x0hOGFpqMk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for Talos chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 743c840e496d..6880630e6735 100644
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
+			reg = <0x0 0x0506d000 0x0 0x2c000>;
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



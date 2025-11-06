Return-Path: <linux-arm-msm+bounces-80673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 950BCC3D6B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 21:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 126094EB486
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 20:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4A62FBE1C;
	Thu,  6 Nov 2025 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACQIiwax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F3DBOjV6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A77301475
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 20:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762462261; cv=none; b=idjwoSr1AHy4Ef5vU9lm9UzqDEoHfKDnKhmF0/KSBpc35QhWACEaqtacwSySGY7eFhBVp2YsvAUnjzI9EJ51rPvaAv7cjOesJ4iQw1OkkRHLQqNSb5ZfstE376/YyZhKj6RTeygvffbzqiA7SodoGAcK9jdYeccneJOnvHIctek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762462261; c=relaxed/simple;
	bh=8dI9XOba2jAlCHcw6erGfoomUhKbEisdoyPpP8p3+1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itJfnc3/scEWEqbQ/mwdx5vb7AeE/123l1llbClaXwz08/kTJoNB9HqSzgH6+GCiqnfqiAA+3nMKoE9t8oWdVw2EqskPC1O5/PYEZtPxs7KCuFHFD1CyU57bfDZ8dTpVD68v9y0fNrE0UbB56NedzkLfF52sg5r/YkdQQEIhd1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACQIiwax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F3DBOjV6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6Gs8eI583595
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 20:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=; b=ACQIiwaxE+4/mWMn
	oh63h64/SFdH2jMTWK9X6RjEblpxpSntEtqf+gwGXZz92zoQ9WWMaY/FehapgWhd
	jPm/xcDZE4pFGy3yjGG/r8udkf1us3nLl+koHsRI07JSiywaAwdiYrPXTY5IhGlc
	HdBIPnNDH7iIHO5p/UKqs0rck7J1piaC/wAVXWguQFY7V19LR33/dmTTg2aHszK2
	iIfmt5y+hzaL00G7FxrVrM5+l8YjridQChQr/ADJoI7hWJC42SeI5pWndWbFEDL6
	ErWy95R960aU2TjMVUX7sV7lFn5uCzyf9l9EyTWGKHRF7VpBVO2zDZf3oB4t+xuu
	tD0nEg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktgp6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:50:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295b713530cso760895ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 12:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762462259; x=1763067059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=;
        b=F3DBOjV64Spp/RSqXOvt5qQkrnt9EXuzkaRIJKeeyjqpr2mN7q1IFi05hBjUACxEXt
         EWOrWpjUMT0V3Ru5LA59HX9vmU40PtfKdSLOcjMAh8W1kY9zQrS1mKvR903YvQNWiWZ+
         JuKz9+tKahwbbFb0zU/oh9W2cbHz9Or9jKwtMhOJyYx7mWslv8ETsQOaskE7JTXz35FJ
         tYSxBZYM0Wv81azLeGAoTMuPqzsbXcQKDdCDYQXlbJvVSjpAV0QCYJYQHHk53xTd5nP6
         ZTAzdRofhBUJhMVTOSZNqyTaWt3I2ec7EfmgE6z2KrasaI5Mzxb7XcaLR99UIPKjATHn
         g2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462259; x=1763067059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4alXn5Z9NyPSEeuSzUYUetC2BlPUE3MPJ93LRIGuum0=;
        b=F5EZG5Z3oQcKX1+DtCZmsryvddofj/4Hb5Y6pdhy+Tvn8ulzcNLmGMjmjzIqWh/1lS
         FSq4o0S4aOlm7wlD57UEjylb0l7o1GbZTXsO6Hb8Zzyd8pCZO3r95XHyCIWHqOSZmATq
         2TV5AypA6ya5ywhV9EFQ0us59hBcqfNieUVB9elLMa20OLxk7L383K7+B/xF1m/u2mNd
         DipNdPUa6dO81cbPXy0s4P/Rnxg16YbBy9Il9Ju5d+J54sNfXZkAuuNd8qDzT3d03Qrw
         noNm69cRxVWLNElO6qZcxjpBkUwip1xYTZjmJMhmOfo/e6ezMwQjf3uGyyZiWvWHvSMs
         dhyA==
X-Forwarded-Encrypted: i=1; AJvYcCU/cJrw9Te82yxJD44rKtoccGdteNSuhKPlBd7CxNuM9ZwhWI1OKdd7CGeN6ayLwWHa4FddBcQdQC2hFrA/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99wo8ZaJXt4iDBgervWliJlGMu0vIu+rbvkl70v5wm22bZ6I8
	7mnqhCTm+6QsG3elVm1ZovGTUvP1cLlWWASTqouyNatfOgqLpOEgnoffObKskljjANtVVdNSxx5
	6RIDEfMF6WELmou3riXvtoEdAECx77TuB3I9C6Ndg4ecaZkO9bxAsuibDkgZoZMHrHEbT
X-Gm-Gg: ASbGnctHRviEjEX4JTQ5/si3+8LarLdhWXH2f7NN6RN/O8cA0iIKZKL/Xp+YHitxGM6
	zJ2yLiPEm3/DBT+M/Htte6l0QArODJh++n/YT0rIiFnm8rF6DGzJhG7I3+fON3sY8ckUISU6KnY
	pRYugalOhGtNcObu5KnOZVciOFEwa+JjQiNjpyvI1Ug5bm9xeRisWhtt9S/DE51viDIPf18Ow6J
	cU6KJ6E6yHXh3WLlhcPGzSLi3SApMyycbyU3rk7ZCwUDT5vzkOSQIZs5Sjb1QyaB7mhm/ePsS9n
	ZFU/B9Y23zhmdZqQNdkkxatGTNmTTjxR9cQTrztojgPbUq7sEiX6G19WQakBblnrhofjyhgFfER
	TJSYAKfcTVftnIjw58Z32+Yc=
X-Received: by 2002:a17:903:1110:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-297c03ab66fmr8998765ad.12.1762462258824;
        Thu, 06 Nov 2025 12:50:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvzjLUzykk5qQIPuXJFJNx8GRGolqHLiDIkvgFyorR08sPq55A5GPVLpAmt2J6lNFfm5dTPg==
X-Received: by 2002:a17:903:1110:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-297c03ab66fmr8998525ad.12.1762462258295;
        Thu, 06 Nov 2025 12:50:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651042c24sm37408815ad.50.2025.11.06.12.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:50:57 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 02:20:10 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-qcs615-spin-2-v2-5-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
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
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762462219; l=3661;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ct57iacDgaVMt56kXqWeRFWhEb4Wd5ogLzmDMijMvgs=;
 b=e/BqN8mgOUhXSRNrqolpteNBwbBYXhn8yVoEJAQU24ywpExTCCdo4JQAZUDl39nnqVHMjSSmi
 nEk4WIRahHqCtdIsmGZFSZMBLI7z2vBtWPVJCebVLHYsPrMPQg5VWaN
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690d0a33 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oLkBJA7EC7U-5CBQHAvNwYyTp6GJFQj4
X-Proofpoint-GUID: oLkBJA7EC7U-5CBQHAvNwYyTp6GJFQj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDE2OSBTYWx0ZWRfXw/7s7qyTufbF
 KjQ8BVGqW2BVip1cipX+bbxz1ayRAJkizzo3j4a4aQ4dyejBqnlKVHG/OBU26osQRAbMg0or2bt
 Bg7NG4btJPdwXU7NyggECXuOUlqRfkwARjPQRlqham48HLu0xz5Gvv7i3DTv50ABKc/8TboWF8W
 VAJ2XHEJRN4dEyVe+1Cet13wocbtTzWxCvyRuy+nHtEVgksiqZ+0oQygobwYbZarzT89pw1z5ad
 i82j8P0BRH63wyBkoLr8NBiojaWEGvbLiP7J4vBzIA2wmDYIblW34qzxEqJrymZKJXo/0U3JZn4
 UMLUM2oZwjNfF03OaYBg3jEgqj8uFODsJ+xB6ue5zOY3O6hjpO2TdrS0pcvN3scTdxcgx39h8CH
 Mzjk96zr7N63l1C/Z4+jkMaNvXFpAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060169

From: Jie Zhang <quic_jiezh@quicinc.com>

Add gpu and rgmu nodes for qcs615 chipset.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 113 ++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index efb753ba1747..500587ea9ae4 100644
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
@@ -1826,6 +1831,114 @@ data-pins {
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
+			power-domains = <&gpucc GX_GDSC>;
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
+					<&gpucc GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "oob",
+					  "gmu";
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



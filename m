Return-Path: <linux-arm-msm+bounces-102534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFoFISns12nnUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:12:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 927133CE88F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A55CE302AB46
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E713E315B;
	Thu,  9 Apr 2026 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHt5epio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQEd2yCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D73E316E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758315; cv=none; b=OjM/oATgp+7vAKKozvlXHcDH9R/1j4WUOHTgwNb36rn52IfU4D4zKu1UCM1heikQhJ1zL/nsEDnMQcMt2sd9R1YAiCkO+ZbpQphu7M8uINb3SFrvP4sMUSifShnsco0aMhx9t2w52uFJuyyCU8kmx3XKqk3bAOLbV2UpVBvl9NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758315; c=relaxed/simple;
	bh=8HmE98bm2vvUBgQcewxXo9ROBKezJmPRccXHHbG81A4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwQOUWHzE37Did7JWtKpyJ7N3/+u5LJi9lQ431gQGaG2i4slIsS1um1xGXgxb3tSOSvsxBkGX8x7nW7T6YP6HuELvEe3A/cpR+gOnbtiRtFhggKAk4OnkK9auCqdttUr+94bOLrU4BAht7qfcRdIqMcc2lKaOFgxoTQHS0hE2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHt5epio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQEd2yCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1m8o2624686
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=; b=XHt5epio5cFRDWxq
	HkwPdJj1EDoY160Mj5/L9CiczSF99rZy+kQQrAw/5KOLGJMJMxmvQB5rb9NkeUP1
	mIu1l0w4X5UlkSKIPzJ9RMcxtmmSLIz8Vj26Llcy1dsC0tCpIiVQK4eJzKEek8D1
	lXoaOm+y99rz1qMXEZynoelqBzg9y3+lgN2HT6yZaLd46Ess3+2Rn2Kov6PnRGrl
	Hk1nTSBqtF3A+QGY21/qXYL0rldoGSNRmweb007b74ZqAY9iZvSNVp0BoSZz4WMq
	glvdOs1wpv8npsOtMYnHilgLXtiv9xa9w/kJ/jQIrwNBio9Xksyxrdozr86dqTHQ
	TfCbXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu15q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:11:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b242f76113so15133425ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758311; x=1776363111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=;
        b=IQEd2yCHdI+3uAOL/E2pdgI6PTei/PGxtdAuVIeLhVIUfiAuoOFOt+E5Wv7ym4JTho
         pbIbntfpda0GhEOqrpq/+ia+A/H9dYs8hqisadG8dRmIXH3VpaAOSYv8j85yUG45+OIc
         F8fmEdFaqlwR7NIF3kl0a/sptMAoaJAQYtkcei6sWyXallPrL0tygK7EpRHrQHMFfvJy
         hpowVRF9sCzatz14ne3a52tbnzZh93hQf2cYfH2BRP8iQ1r/5pAUgRH/UdQwimNkyvBF
         DKVMEg2u2V/JJyn5y3MTDAoGLYPeUISc03UfWv4mensuK+Y/ENZtdlztjOPngIIfTPXb
         Ekkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758311; x=1776363111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=90mdpQup8rBx7BL1jnOaOW8ntM6siN7SFRLLyNJz170=;
        b=mD2LKGCLK2GUhGsYpJFRI+vSBnHiQC/8cRcgPirbBD5BaHBR83iOMXMEhgF7zL/0iY
         3jx0TjfSE5eLt14B5Ccq5/CNRG+rKi3eYqv+1Hv2nBw+u1iCTGt0QpAbsCQUEW6szfFF
         sHlEzz61vFn+1EXvcz6hG+UnPK6T94z8NMl5YMd/xvUnAbbUCnAyE0/Xjx/5gRMMG8+E
         K/Rzsm6zGovwb/tEjc7OzqQ+GKbjqzak3CGYPYUYeJjSqPFmxB4LQKBJ6eG3nO6dsEa+
         Z2GOdTvsks5UupY8h1HvJLV2tGkv2FGkc43OruXl1fyxT3c0Tj5QBE58PFzWVbBGKdj2
         8Fag==
X-Forwarded-Encrypted: i=1; AJvYcCVIYL6GtZTsZehxLr1gDCEelcqrVWkMoQLAyaGkX+Zun2Nkkr/Y9HnmXRanl7DSn3bcUisMFzxG+lD6naKP@vger.kernel.org
X-Gm-Message-State: AOJu0YzisOsolufjHUusVyNmjFynDitaRd55lJDap7ZpAmu3vfNRXcy3
	BZDCn2HkkzHqYgZCWdP+f5wI0l1d41colUJ13phSahiZigwFiWJDW0rpS6TIrwi06MqbIfkWYDr
	P/ctBtmdJWz5W7Wd7KhRoRCzp/H0myaaGn3i3ytbfEnw8GqCHdF4hqTKVJL60MGQVpF6n
X-Gm-Gg: AeBDietkKQAuggsrnfQL6wo5Igh+vXA93WyJLLXDxEoJvj8iUQx2pse1s3RbggjBJZw
	mhzEYJQ6pYKo0HSGdD1+uZT7lHkV9nuI+nWieaQpRYq2OOlsg22C8DwZn5oEEUuz/WUxWZkPsoz
	Tbtin0iIS1HoX9WKd0qNsx+a0bhxkNWMHwG2hq+Pk4WtoGDPSqQk7b2fc9rj9+JCTyux7ta/jKV
	Vs9VtNF5PIP6LTKxgYKn30i4D7NeFKW0+ThBG2qJvJsjGFQ44EEv/UBINrrkVZHo5oI6V7I7Sm1
	QopnOO8Z4LpjPKL/FD+RknsXd3bJo0EfAA1nPsKwNqbcPZ43FWbsrA4kA7hXG+YRRkrBE2RiuCi
	El9t9d8dBOOG+UAbu6/88L8BXcxTD350bF58CD5cf2id4eQ==
X-Received: by 2002:a05:6a20:e291:b0:39f:461f:be7e with SMTP id adf61e73a8af0-39fc8342976mr5438790637.44.1775758310716;
        Thu, 09 Apr 2026 11:11:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:e291:b0:39f:461f:be7e with SMTP id adf61e73a8af0-39fc8342976mr5438739637.44.1775758310061;
        Thu, 09 Apr 2026 11:11:50 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:49 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:49 +0530
Subject: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 0jeCfROs9jIQsTLB0DJkqvzu2Gv9jBWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX/BCXktTmsF1B
 wbThy3Qd8TfXrULDv0VF/MeAlXSWNDN9suXqiPFX8U5cQxpuJwuDxdDl0+F1nTIOCs2ZVyUHDyK
 lwbsPdV20wbkucD5NttbejnFabnnSWnm2nkCJJljwlKJr7gOC/nVI+XuR6lCo9DXs3JvUB3ahcv
 4Yd3POwDCwGVjVAi3SVFydkfbfzoW7ATUuPB0An2po8ESm8upyja7jknMqDtprvN28OYcAm/3/M
 AfmgR74v+IgXzS6CXZaaEChjWQd21NEA2EZmNCzOfQ69tubApqbbBAeSOSeNNayHC37APB22rea
 BPU3+yWMUTAAsdegBsPkYHylIuh1Z0QLJZ14edi5SmzKvCRB3GX7/aA6RVF8iqYCyx71ZlPlE4z
 PVUX1roKys/aY36EKq50aaiqG9I6+Z/LSRo/0oEI5Hsk1lovQHx6PF0+8PbslOvVy7HipEbwPYG
 W1w5LlKWcBzjcsTG9vg==
X-Proofpoint-ORIG-GUID: 0jeCfROs9jIQsTLB0DJkqvzu2Gv9jBWQ
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d7ebe8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lLqgR-C0kdikbQ7S4h0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102534-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 927133CE88F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..7a2a3dba86b9395743781cdf724e81733140ecd0 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -709,6 +709,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +874,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +912,31 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1



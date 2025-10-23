Return-Path: <linux-arm-msm+bounces-78559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39EC00BF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EDB33AF897
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D2530E0FD;
	Thu, 23 Oct 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bi8D4zGn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27530DD39
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218989; cv=none; b=rY+n8fGywH20Dk9jynGbXgUTGZujgcCJNeHvz8eEnnDMSPDsqsvUGllez/avikdE8aGrUnBGx/OCh3/R0GFNiXTcKXtDFDMmCqtK40q2qet/W6AZkQBWj/LCGh+mFWMvmuPbktgRtLwomvTnPx0jAOBO1UBO87iUmG3cS7C6y7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218989; c=relaxed/simple;
	bh=PAltBAsIq1aC8Ll4WARAbUKEgytDMvDlximclKmHu8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jz477uvNTII9zDHG2wnwHYfvWWVh4KPVPhnoKoJASyw8c7+jH1dHClQ7lyk3pl4mzBeWcM70uCt/wSTJZrnhapU85R2M4zf3Bu5caWejzTIEI+NKXwmVnkDP10d2lQg+7wK9oCwSvqcL5pzj153TzJtqdz97bcFYeUHVXyOoSJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bi8D4zGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7YXxh011794
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=24rSamGepFz
	DSZ1Cho4Jlk11+RwSCiIWbyoT2pF6KQs=; b=Bi8D4zGn5ip19fLDopOrHkPIOBW
	8PQzCrrE8zLRFMtQPT0+lh3DiugiQWQLqJVmWfTtfa7iv4HpCdoC9nHbW3c5EdAu
	dZLQijU+Yi9dEPpA2OHb4aiwJxHTVYjwiKVnDBv58Sn30o0x8tUvlQZa3v/BPkgc
	UgqEdLrxT5pbUBiDRxEVyNRYRZqPNYhXEaCZ0ElAegqguz7IBUeM36qoi0UWmyh4
	YOpmZVNBB1YakU4Skk8/gHuJA1rnYMY1AlyW/dmy+z24BppqWTcih6dYMyE7c8II
	z5f/smGL2D43x5cQ8JED8MMO2yzCl/kMA4cUgEauEOledn/wyV4LbRJ/6yA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524acrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:29:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-269b2d8af0cso1556865ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218985; x=1761823785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24rSamGepFzDSZ1Cho4Jlk11+RwSCiIWbyoT2pF6KQs=;
        b=HLWm1uqSnDOFElXfO4mYhNQw4fCpR852IMzckGJflcu64uO2IiLZXUucfFozphw6or
         nWkpi6qRQE4R0hkeYgFE1AfadxxXhwEvI9O3jthNEXq0jjiEbYtlPFt7vLG02bjib+sn
         yIudNOZih43YjJD/aaOd1Om849qC2v2m1W08f4KAVKhLjuPcno7BZ1qrQnAa8hDkPAxq
         LPRvtRq97KdYXC6ZJPYIS8NaR+MnjN53KaSTF5s4BWKpzG6pEZz4507+dyetBCpUXB8P
         HuKt1nItoP9jx25RYYf+8eLtGdWi3cbI8fgX8FoxaaFyRtzHD+PfjZR+HYsxWIlP3XPF
         o60g==
X-Forwarded-Encrypted: i=1; AJvYcCWewaeqaaVjUN6X/JUaU0YWFz8MvMVwB6zeU7gkDilkZiHC2g6q5FeG22AT29mZZm1vDyKr8VUSzwoF5GdF@vger.kernel.org
X-Gm-Message-State: AOJu0YyqTD16V8OGG1FoXterHHIN3qCs9uD37b/Zkj7WOXnBA6+6JrBy
	Vy3ADxtZjDgSdDevCGD793avxUe77RcKAwtmdD2m6B44VEzPM6BlWXMtM2jldz6BRetQggIBeWy
	+vfHzWbUVPl7NRjmPzIlhBewE4JgSMMlBrpNu28F2emOCpcP23hEUsB7Eep64eppbO30=
X-Gm-Gg: ASbGncuY6CMzHVl+LoqbLwmTaKTadntwiK8SNOWGOwwpK/w50st/LObhs8+yMz3wB+Y
	GrE/8z53MoKyHU5XSfSXbkRBven2uCuWa1pxgn4xoigGs6DXT6Q5PUFS9tlB8b9X/OMPm82PO3v
	IsuDcUF8N7217H24dqwA8QNSCxGz8pUUcuSRJFRbX74G8yoQy8PdG/CcPn2drPD7TpqKXWKKo7D
	mI97+WK8ZZ+Lr92ZvO03kxh3Y0BT7x/cQRbjZOhEFLQt1twY4NAqvSwrDXHJt2vZ5pQ3J5q58HC
	c1cX+8CCgDK0Y1FiWik0W9yjCjHfB1Ix8L7Yad+c52XnsCc1vR/0Zepqy/hlJZRL4Is+ZVocOhO
	CUvhaSC4ek2NCNTlOyhyNZMJZY5Qh8w==
X-Received: by 2002:a17:903:2bcc:b0:269:85aa:3776 with SMTP id d9443c01a7336-292d3feca86mr66027295ad.11.1761218985443;
        Thu, 23 Oct 2025 04:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8WryTUVK9uIGvfA8bBiYDlVUzKkwiJHvUyKvzEQh0yxPMRvKLMdCz3fmuq9JzQW1dIcYc+g==
X-Received: by 2002:a17:903:2bcc:b0:269:85aa:3776 with SMTP id d9443c01a7336-292d3feca86mr66027105ad.11.1761218984963;
        Thu, 23 Oct 2025 04:29:44 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e1231b0sm20438815ad.97.2025.10.23.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:29:44 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V2 2/4] arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
Date: Thu, 23 Oct 2025 16:59:22 +0530
Message-Id: <20251023112924.1073811-3-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX+nsggEUDqoV+
 FRXYDx+HPqJ6dBybt95u2MDf7GGgjnLqsKhmDVJjxE+/zAinv379mHWA0zpnq4FpvOYdVDP4w3Z
 tZwQqraMHW/mhHyQW4nW6hIx80yToKXaItrf5Lu3qgIq+3TPMqENXPkKx6iLDgb3TG5WOMjRp+l
 4lW0n+572dACi4fReUndj7TgKqO2JrqVAM1hvGUfjjvoBvehRVDKkzH5xBjm9v3BsQjGrp+foeb
 UAA3KunITjd27rQyeR8TzMFaEsMc5DBBh6loo/EaHFKnJqQGqUSvL6hqiapRDGbe4AD8k3YJT2Q
 L0T6J40fqz4atvQpt224cuDK8nn+YAJ1Flpj2Jj9LVJyiZdhCS7soRd0VMuSYKJNa+6oO1BX9/Q
 +1yrf26e6fSvOk1iwamLWnhjbadbxw==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa11aa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=AsSGxY1rZHGoL8xKvT8A:9 a=pcaSXIDp9BJpxWmU:21 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Me7Hq-b4pVQj4xgeEwZHHrUKO-Nus8-1
X-Proofpoint-ORIG-GUID: Me7Hq-b4pVQj4xgeEwZHHrUKO-Nus8-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

Add SD Card host controller for sm8750 soc.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index a82d9867c7cb..1070dc5ea196 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2060,6 +2060,60 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,sm8750-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0 0x08804000 0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					&config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			iommus = <&apps_smmu 0x540 0x0>;
+			dma-coherent;
+
+			bus-width = <4>;
+			max-sd-hs-hz = <37500000>;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
@@ -3121,6 +3175,13 @@ data-pins {
 					drive-strength = <2>;
 					bias-pull-up;
 				};
+
+				card-detect-pins {
+					pins = "gpio55";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 			};
 
 			sdc2_default: sdc2-default-state {
@@ -3141,6 +3202,13 @@ data-pins {
 					drive-strength = <10>;
 					bias-pull-up;
 				};
+
+				card-detect-pins {
+					pins = "gpio55";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 			};
 		};
 
-- 
2.34.1



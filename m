Return-Path: <linux-arm-msm+bounces-64546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC0B019BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F6C3A11A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEC9286D61;
	Fri, 11 Jul 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/iFu/mx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD95286409
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229565; cv=none; b=jMo9Y//gC5s7R2YUODZgbOcAeP8scVupoZQfEnMKgk6yVXBBXbWnrLicUlzogxCNmpiONhHvqmWm/CvbDqG61QIZ3Xlu8TV+14inufgIfATc9s9ByiIDSbn/5SAcJyG7Ujg2jR+EosaCm/aELDeeQUToMe54bhxiOO0R/YVKG0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229565; c=relaxed/simple;
	bh=fgdTM4ITM88GWY3Neg4ZqJewXaeotsx4jj7fF3ssm5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6apEN+R66Zb95BGY6F++5iC7xVYBGdPIZrkaAyk0Wmfayqx9CtWXJkzkQdeWtVleGh6PtzGHPCpLlnLwH9PeWjqWmIgyFnydDJdyvccXvx/Yy0JgyNAHfpCUY8JyGWccTTgFIq90qGVErAIIxIBx87DFZc3t5YybxX0iPqhSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/iFu/mx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BADFp4021884
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xj/5EZbPPiA
	iEjVwB/H1Xk1YvlvBGlniJy+i6YLozd4=; b=Q/iFu/mxM1ajpel2wQ64IpkZxNx
	jSxtLyCb7zGMcgIkvMNPEd8c6UtCHQsfbQ2MtXX6uqSHlAwMUdi8BeKhqr1LVB5H
	ZZg3o1VWzHSX42Fmd2v6pN5OQ0sTN+3KXGVGXZTW3rdEOOJ9UrDyagLj8y2POa7X
	78x5MqvoAheB7Bu26AVYbkk/7Ktf00P5RrMS/HeA7lcxQ1ndrAjywsvI7zVMTNaJ
	U4s2+U4ulkmyWer/HfXTvkXeSS7pfLdqqqaMn4bRyszSf9sTawfqeGpiUk5ULs6L
	MWSaVccElpgL+Z/67PUierycwuT6np0GIrqZZJHt0wF+sgyJb4I7/fEXmvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b198g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:26:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2369dd58602so19610715ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229562; x=1752834362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj/5EZbPPiAiEjVwB/H1Xk1YvlvBGlniJy+i6YLozd4=;
        b=Uj1Ho8+dfj3OLZUoOlGeXSvYmRhrCr+Oatsjq+VXwltpk9mddvvDPcR4pGVMintjgI
         CYBHtmLX8/lUPfdxlsoHvd2lwh4Tywuv58nvK2XHY9Fwdh1EmUAcesUKDkj/gGT269Cw
         NS1KgZyOiGK5rW770xMBwXAQx0+yKzAzJVUyYlh3ldUeKG+KonwTTuHQnEeaX6Nkl6uO
         vO+/3plrLvrzIu9EfighjoV/M0wNNJW9YsLv6wJO4Syx3Cj8aK8o/6BB61pdajId3xw7
         oCT8jadvoHplHkJajPxy0jxoRGEAeFdGykF/bwptuBM2jQQDW5a6E1kTXJq/DfeLOQFX
         rMJA==
X-Gm-Message-State: AOJu0YxfELDsqtvmhenFL0nPcC0q93nOHpdiw6SGzLFYh8wm5erLWDrk
	oPmBErRxlxEXBqJNyxW2adE/crBMk+BJvy4HFxgmsQizs9Gn0MSxmYBCTqUvT+rLZrZqVS34U0q
	nSandeJtlNSiK0tKdq7Gc3DWcscYETMHkMjDhFinZTb+ULUyzzZ8hFSmvVxYzW+UIWSNW
X-Gm-Gg: ASbGncsNC/WSerFOSaHFBdbKul3dyG7EDooue4Ecm/6r6XpkB2QFYeGDUMFb9IU9txW
	XIgweqCqpX/Jq5g7zrcVVlzFqm9XPcZLCUrV/Zu4rxVICOG+Ueo7kLPw0H35eyZAo/TYgD40uDH
	dGwMs/yhpvWQgJ1ONPtf7Bo1v80C83h/LvDQufJy77022a0GEwINRCm/Wr9JsLMCxaK/x6qe3IC
	qpnWDk/wFbA6G+aZGww+j3fs/bImfAisFSCBwhiA5phR832w2xZIuBQbjhUHN7T7mvlPrJlSrW8
	bXkYkYI4Ds8OoGIfXzs5eB3/rTiWiusRuYCXmE9AjEyQMrogdHBpHqH1HfETLl4HOhTzrKbPS3W
	54UM=
X-Received: by 2002:a17:903:22c1:b0:234:f4da:7ecf with SMTP id d9443c01a7336-23dee1888e9mr31559585ad.8.1752229562207;
        Fri, 11 Jul 2025 03:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9gNVwJIyP5KQDtwpzbz8gmKpf4Cj0OJhjLdP0IHV71VQm8NLRGpE1x9Fmy1PpHQKgLA1V1A==
X-Received: by 2002:a17:903:22c1:b0:234:f4da:7ecf with SMTP id d9443c01a7336-23dee1888e9mr31559315ad.8.1752229561795;
        Fri, 11 Jul 2025 03:26:01 -0700 (PDT)
Received: from a10065738a1d.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436839bsm42861375ad.253.2025.07.11.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:26:01 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mdtipton@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 2/3] arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node
Date: Fri, 11 Jul 2025 10:25:39 +0000
Message-ID: <20250711102540.143-3-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6870e6bb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=U8kZZDKKErrUKwT9OYMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MyBTYWx0ZWRfX4MZqEqaJa85p
 9F0NiK/B1TSoPYyELnwj0lD8OZqEy4+tEjiNZW6FW9r7fPrROkzIxPDJXnu0uW9qpifPMmqUmDx
 szlZYxkE2O3QimKOdikzBR9ILixXNd9fux4tt4q+PV1y1qfEMT/Z5OAwMTnTEfxGTlZB/euLPLR
 zWO5hwET2aOAfWg/zELo5K8hWfxymahWsHiVyDrlRuR+pYu5Y+wXmw3khM8Oye2bVC+/rf6Nrqf
 C0bciv8LWWz7/gZlYAwCGLk+BJdyBpuEUZT1x97rCti7tRCDNud3ZyuS0GBN49qkabDXwawhxKu
 rO4vKM7YsPAbQ/wMmNGekyxP6FPRRPgkfq7O3CstUSqv1AjyObzjqAfmZACyTxThf2Z2Yyx/+u1
 wAayCCu+5S+h7aG4or/RUArWZTJ0BQ8C9i38dfR6PjIyBMEJB8GN0LWW4d95kDiE4nV3yH0n
X-Proofpoint-GUID: nU2zWXqHo7Y_0kMGn_JNOGjmN9TwbGsR
X-Proofpoint-ORIG-GUID: nU2zWXqHo7Y_0kMGn_JNOGjmN9TwbGsR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110073

Add Epoch Subsystem (EPSS) L3 interconnect provider node for QCS8300 SoC.
As QCS8300 and SA8775P SoCs have same EPSS hardware, added SA8775P
compatible as fallback for QCS8300 EPSS device node.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..d6a58e228091 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -5433,6 +5434,15 @@ rpmhpd_opp_turbo_l1: opp-9 {
 			};
 		};
 
+		epss_l3_cl0: interconnect@18590000 {
+			compatible = "qcom,qcs8300-epss-l3", "qcom,sa8775p-epss-l3",
+				     "qcom,epss-l3";
+			reg = <0x0 0x18590000 0x0 0x1000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,qcs8300-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0x0 0x18591000 0x0 0x1000>,
@@ -5455,6 +5465,15 @@ cpufreq_hw: cpufreq@18591000 {
 			#freq-domain-cells = <1>;
 		};
 
+		epss_l3_cl1: interconnect@18592000 {
+			compatible = "qcom,qcs8300-epss-l3", "qcom,sa8775p-epss-l3",
+				     "qcom,epss-l3";
+			reg = <0x0 0x18592000 0x0 0x1000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
 		remoteproc_gpdsp: remoteproc@20c00000 {
 			compatible = "qcom,qcs8300-gpdsp-pas", "qcom,sa8775p-gpdsp0-pas";
 			reg = <0x0 0x20c00000 0x0 0x10000>;
-- 
2.43.0



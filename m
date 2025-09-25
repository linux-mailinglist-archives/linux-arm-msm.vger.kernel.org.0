Return-Path: <linux-arm-msm+bounces-74962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ECEB9DAFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEFBF2E1AE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C8C2F83D6;
	Thu, 25 Sep 2025 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WfpX62q/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCDC2F7ADA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782045; cv=none; b=RLqgc57z2CVS5dW8gN/YPZhlc9SGsqCN3AEhGAesye6U3Pa3cQZRHkyHE0pWwseUgkTvtQrBA9obXZc+aK9yum5KXXWluP0mYBxl/bieWw6qvt7/UI2eGxV+ZSp5vaauGJDK11r+dTBqIsn26LUo4cggE1IPbIqy0PEX281I7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782045; c=relaxed/simple;
	bh=RDdBDErVPYkb7kQ40hn7vPiyirE4liN5DKCLZ9h9OKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDbymPTVLdaG779r07Hdru7NtEVHSSrqcCW4DXJp+9cjbN6mCNR3oPA1DrBhT0QHjg9Ui8meGN0xCqehx3SENRyjLD8o6EcG6Fi2jqyoLBl0f+RYRT4LdEd581HaBHsmGo7K6f6ZervyKDvBzeoBoN5HISYTwzsBQm6s1CPSlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WfpX62q/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1GdQj002789
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPvdBTUqrNUETXTQBR3pTDVkd6wGbjn3B7OmL+KStu4=; b=WfpX62q/4GsiIfut
	uE+xpwlbsmoO9dtOoufieNFOXw//7IikGiemx9BQPxHgigzMzLyx6zesycWP/P7F
	j3qk0mmWUcd4jPouEqfBuRiUwvLfFeAoVayaihGH2UxyukRLbprRAeoUqUpDyG+R
	N+Q07r6V21Y8Z0Ir/KBuNxkEM7ygWmEXtlxHoD0va9KWYmTi6kkl3kYblTChTWex
	eYNBWr5xoj0+D2m8l2QP0tkgWjx5Gp392u7yjjGJsaw4xAf/wgVD9hoIajZZmnLb
	t1mmMxxLQA+Qy6PTUY91wnsD+Joi4GjqOHAlk7FFWCdZlRxbbF5xAnhgakVX3W9n
	Si/+/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf1jsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:34:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2681623f927so6682295ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782042; x=1759386842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPvdBTUqrNUETXTQBR3pTDVkd6wGbjn3B7OmL+KStu4=;
        b=o2mALAmFHtOi2HFGnnw1XknNpr1YXysJBSMfLNY//jnmos4koT0ABSFkiK68azigK7
         mnY8nZhkVEGhlU7TESC2ZQWKKENuq4BB+FvLAjobzsz2EGQ/45JvDKC+VXwoVNTHtTzt
         9qgoV229JTD5AcG4FNkswWNBEJWOvVMJr3/i0DZlK+XbdNJ+gueIxsi1jn/F8DLLMY67
         iaorcWH9znhvONZp+ltK35qTdHAdyU1peB4OI8b5yXt4khMAp4LaD2Cybq99n7Jnhcor
         dNA8PfwM6bbPj3cW3nWfFqgUGuWOoIICP5RgfiUObsK+KoPzSqIdrZTO8ZE2XpINRwgJ
         N94A==
X-Gm-Message-State: AOJu0Yz/Dp7WQS6VoM1tb/YzfvgBrKfytz6ET+M8wYVXtkGO4AtFbioZ
	hjq5lj3y1CvBNJ7Bfs3Qqusy1bZLID5prEwb3oscf3HXBx5QHjShyPAU1KFUqFLJ+8DPxCJ8ipm
	kWzlm/um3A90GrzsyOtFiXflD31kRj3s/KyhiZrvByHWrVZJ9EZ9MlA5czCmQnyat0+hp
X-Gm-Gg: ASbGncsePPsqcHvI8mHpclyzvaw9rHug+DJtqKWw5dbNWNyKJ/Sp1n1nO3GO6sC4V5+
	e9Gak0MaRQH6e4trtYA03lTQ6m5ap/VIzabC4T6kDFdrJkfturFZAvpdaXjcMzCthLZenPkScps
	iIQZDLoH06rUxd0kKDbTdqspUQD7//E2IhloRwEiiUooMO8RY2VMACIxRS/m+qsHyt2zc9Ycs8Z
	rIBZALBAed98z6PXe9EECkMgElZGWSlLu7XXvs13oatBK2dCK0dKuWL/PGhXd5907GdalZ923fg
	dn2sK9rfm/43ogLuZgT4bUOD1AO6jq01QOdJGSKsoTF2PB/hmYHC53uuwKP1NrGToxlex9+v6YJ
	BvVKZ2I4yyWdnFWRGNXmaAfjLADOV3UQWnuvxYXGwrnaQzVA/PIzkpEBkatsl
X-Received: by 2002:a17:903:320e:b0:267:c8d3:531 with SMTP id d9443c01a7336-27ed4a315c1mr26738725ad.25.1758782041978;
        Wed, 24 Sep 2025 23:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQgcgZDU2SunFVKkD0cHmqO8lPq32ZQY5YtfTzu7YAWS30H85HYs0CKzASqq3pi5ekw9rxsg==
X-Received: by 2002:a17:903:320e:b0:267:c8d3:531 with SMTP id d9443c01a7336-27ed4a315c1mr26738365ad.25.1758782041421;
        Wed, 24 Sep 2025 23:34:01 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:34:01 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:21 +0530
Subject: [PATCH 13/24] arm64: dts: qcom: Update pmh0104 dtsi for Glymur CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-13-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: EJpVeddbodOCAlq-8UdZrJ08nkJBBxnd
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d4e25a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Bl1eJC4Zh2N44W0__HIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX0YwrfGq97d7r
 i7yCk7M4rwkQo1t8SGlnTyDfKVVTJcA6t8x8Dso1aYes8hyETcSBFuUCgK8hUF84oNoWwoiMiyp
 A5ZkKnBsMWx6R/f31W1MQAdrveJvWRzHCMzucrUETD/z5jVFGYeg2un1klYEs2+ooXkZXJ61Sgn
 8FOm0/33smN6F/tCPmGtnWKTnXBwsBYfYCZBrQrnpOAC7CLO42SNn24mlF5KGPVf8ZW1OaFImSf
 kuKBu8CoR3r6EVbZ0F0lriXhFwh2QDcn3r/ibTRUfLdGBhUbpUk4O3UAZynsC1OxfWmwfKccz/c
 ZN8JAUzuuqBhpwIs6fxSnnCUyj6T4QOW8O1O+q4cEyx0ukBMxKTE6Enps84NEYyVbur2MR8LvrG
 SxKDJX4G
X-Proofpoint-ORIG-GUID: EJpVeddbodOCAlq-8UdZrJ08nkJBBxnd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Update the pmh0104.dtsi to include multiple instances of PMH0104
DT nodes, one for each SID assigned to this PMIC on the spmi_bus0
and spmi_bus1 in Glymur CRD board.

Take care to avoid compilation issue with the existing nodes by
gaurding each PMH0104 nodes with `#ifdef` for its corresponding
SID macro. So that only the nodes which have the their SID macro
defined are the only ones picked for compilation.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0104.dtsi | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
index f5393fdebe957ea0caf4bbc16117374b4759bda3..d3ea7486d842ec813a79268fc1466e1513426d78 100644
--- a/arch/arm64/boot/dts/qcom/pmh0104.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
@@ -6,7 +6,63 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+&spmi_bus0 {
+#ifdef PMH0104_I_E0_SID
+	pmh0104_i_e0: pmic@PMH0104_I_E0_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_I_E0_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		pmh0104_i_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_I_E0_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_i_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_i_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
+
+#ifdef PMH0104_J_E0_SID
+	pmh0104_j_e0: pmic@PMH0104_J_E0_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_J_E0_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_j_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_J_E0_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_j_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_j_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
+};
+
 &spmi_bus1 {
+#ifdef PMH0104_J_E1_SID
 	pmh0104_j_e1: pmic@PMH0104_J_E1_SID {
 		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
 		reg = <PMH0104_J_E1_SID SPMI_USID>;
@@ -30,4 +86,32 @@ pmh0104_j_e1_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+#endif
+
+#ifdef PMH0104_L_E1_SID
+	pmh0104_l_e1: pmic@PMH0104_L_E1_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_L_E1_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		pmh0104_l_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_L_E1_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_l_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_l_e1_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
 };

-- 
2.34.1



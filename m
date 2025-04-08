Return-Path: <linux-arm-msm+bounces-53473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC634A7F8AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 10:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD364221AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56E8266583;
	Tue,  8 Apr 2025 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtqcE8Pe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04A126656E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102212; cv=none; b=AtTVQzC6z4S1+d+rQoQOm2Pb8LDqNX64L8kEsSsKNoZ2mlvJF0Pnk9F2sFI89rveCuDranGFc8H5RonifQ5W//M39AernFpMP5MXM0u0BtBix52gSXpxiy4nKeFZ+oTKS9Q6YM66GV3vF12L6nS/n2EfZglP1xLlFGAIcbM6AbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102212; c=relaxed/simple;
	bh=wg25rGgJb51l8j90aiDWVM9XpCM+HrOAyDR2G1yCzu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSkE9JIzKt3g4dANYXdQGMQcneKdDHX16Iom4n1RoJbn1x1iYvvuTC10E2ems52+Hy+oG8AAve7YwCm1fnrbm+0O0yODUT/iHf6Z7UlwXVZNgT9P2sSTa7KEv7Ahhtd9w9nwALOQFqYR2eFGCO+uJVANbjUp6bm1Sz9lwd35cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtqcE8Pe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GLvS000833
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 08:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27NBhoEy2du6Q4/8LfMbFlMU0Ee6Sl5Su0armAPxRpY=; b=mtqcE8PeN3d5NzIN
	YeuKQhoiO8UW5yao1Po4LBOYR//dDoUebRihzHtX5ui6dGFQliAWW+oFT49+rR0j
	BvV34MAlhXw6NvweiT0LHibGJz3otoxsDSAiAO823L/kBCUET1JtM8gmRdwRo3MZ
	gk0J0ec68J3d2eOPW5X73h6RYB9vrjj16ZdHIS8orMPl2bYbedORW1Dh+J2FlrIw
	DTL5ngnzXTqtuvVCw81pbkHlCN7SGtA3NZKLMI4Laxau50/s7kzegNdFjswuMqrj
	yXyFz7kK/ZCUONk6W1WJSir1HqAcbRK+aGb9BrYANLEIsBGxlhyI+87B4iuc/ut+
	50exFA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe758n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 08:50:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5156fbe79so5943772a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 01:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102209; x=1744707009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27NBhoEy2du6Q4/8LfMbFlMU0Ee6Sl5Su0armAPxRpY=;
        b=OBN5jDh1fINqzWcXppsvx4f2nghVdK2XdORwCFA2w3Wml+8iXLaVrPA0Je4G3yTu/0
         DrnuMaXeumPgb6p1yG1MDULl9ZgZxFf7dvmTIE0xPFrQPhmZkaSsgQRL4Kg3jv+6yiDO
         FoIwO7imo6EHaVubddrAibF0jMsAd6GZwZX4d/AHOE7x5LcE2JnO1F6JuUaYJcxr6e1z
         rq31+UxikIvWVIyqfFhNOwXHdU3WCzQ+iwPjgkVRx+BL0EWPImQK6zvcsqYsO1KCVddA
         lt9Dp4gNBmWgK1QDUHRcfTvElFsnTgRtk9ANthRF90rqbQ6qWdg7VHv8YUiyK5UmCwv4
         7+Mg==
X-Gm-Message-State: AOJu0YxkrQeCRz3SroqKFYWyd6lCHvp1lWw4iFjnqTlgfQR4ldt0rRph
	R9QKK/HV4WY5aKbS49eZWg363+GPyCzt2xuhx2QreRrtL54yxRABJnqRMU5mzfxzxRgByDxhFC9
	XLUr85WfGFJ5tz+s8AOTSpjJW4iIVwfWFS0dRBUj6UnCRB6Cj3cEOa4cJR5Y/tLwx
X-Gm-Gg: ASbGnctfjBzis1yrGWi0r1ttr6LZA5sLMmLHuDWCq5kVpRA9mHF50e/fNPlqpMPIqiq
	p0DLC04NMg/kV64yXmVk6epWP/R5RglF/+WAs/inM0VEeZSams9o+YAt6MOBG3jFhyL0Xs5YBe4
	eHkphr03tYhmrKqmr0WIVOdluLDUUXPzNENOIHVc+TFcJbwDmwFhEap9xEQ52cESlr/C+S1KXRg
	H8UCTWhhOdMF0A+BwEiMIr+JNw/nmbjpbabuU44+aROz6oK9GI711WDpy6n1X9a4EIS9C597Ufc
	kGHM2alR3+zbTa1/uCld7JhXwvSteQI3NtRWj88IcmS6FC2N70GJjyf89AyBxQ7t6GH0HLyDsrI
	er18JId+JoDw4/DaaDQss8LeCCm/RfwgjBtJbGkaB/E7MAHPrkSI=
X-Received: by 2002:a17:90b:280e:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-306a48b391emr24196800a91.33.1744102209266;
        Tue, 08 Apr 2025 01:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfGlPsXrOJLeQRSEXfWds77zcH9NxMS0qbTvAKAsWWWSNrFeI0ExEzN+bmcSgAFTWCM6YeCg==
X-Received: by 2002:a17:90b:280e:b0:2f4:4003:f3ea with SMTP id 98e67ed59e1d1-306a48b391emr24196767a91.33.1744102208887;
        Tue, 08 Apr 2025 01:50:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:08 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:52 +0530
Subject: [PATCH RFC 2/6] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-2-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=1136;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wg25rGgJb51l8j90aiDWVM9XpCM+HrOAyDR2G1yCzu8=;
 b=nRs4e/njdUA6zmbiVfwi1g4hbBZlP6yyFq7nWXpXrnSrORfevKpgfbUgV3C0sVXWRmaUBqxpO
 R6M0TiGdlCZDTteK0mBwkorzjh5jQTtZPPlvCir/dMT1wflQekx1ZAy
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: RQg7wlYJktJPpiw0uRMKJ1v4iJzJfKQM
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f4e342 cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: RQg7wlYJktJPpiw0uRMKJ1v4iJzJfKQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=647 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality. Corresponding DTS and driver
changes will be added incrementally.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..a772736f314f46d11c473160c522af4edeb900b7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1000>;
+			ranges = <0 0 0x08600000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-74932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B65B9D99F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94013BF65E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16BC2EA753;
	Thu, 25 Sep 2025 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hr/zeZSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27942EACEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781767; cv=none; b=n6mUGYR3celOWkJXB7VbTg2gIfvfl8uaSmP/SK2nZptzUnUZd1o7utzMgouZ4qBuBq9N3LhQXT8CMqoJH08+vKdXDOvMzrj/UxI8OHYVx51DLpkpoFImi3dt+eXVJvUnqrkDrEk4ZyjQcCLkqlphpcg9PaX0YTxNTu2OztwHJkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781767; c=relaxed/simple;
	bh=gQJ2ZTluSPl0btbHY5JBZLmKAc79qMYc1ayPNK0oRzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NmGZx4SH/HFpLJpVBISxWDWcrotLv/ghA6yFWJrQG6E49z2U4vKlXwYHgByd9aGAYygu85O2dV/80ITUSIWMW1GfwJ4DpzrO2PJ+TCD5jyxFKGvoHyznb48jR2ix7m6arL4NEGlmhdccKxEFf83VLrN/G4xcxRgsq+FhPirpWIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hr/zeZSq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Aw3w018033
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yYpcbaYMx/nDHjUz0/6uYp++ThN6Ho8R/IOjzK2L/PI=; b=Hr/zeZSqSDgxV8AF
	TeO4UHX28Wz9bGgU2fajNjP1rjMphkYgPzay7OvlYgrBgqaQm3RNRC1TNuPIcxji
	K5ti4X1u39wG00TRmGNn+Ptnk2dwiEHMRIKDSuT6g79Fgw/qPwVjPIGdfcyCoems
	52P6RlQE72GmPmuFAq0lHtOX16D0CLgP5CvyJVxQ6QkVbM+5UDqwlKSQUjRv+M5T
	EKbWc1NEPGwwmG5pmbNSCGuZXhZal8QaASa0N/QS8OWqYZOZyHiUuG4THEQTR6PI
	NTMKh8q8Tj5+y5IwCl+yH+Q5C7r6JC3DVegYJgLEW4W1Swo6l+OSke+hJkLC+Jj9
	UZgzSw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkayys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-780f914b5a4so705618b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781763; x=1759386563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYpcbaYMx/nDHjUz0/6uYp++ThN6Ho8R/IOjzK2L/PI=;
        b=qw7c6PUfOCs8JxVq32Fmyi6YIOwHRk4Ya9mPOuMb/RIrx/cEvPNj1zBbStJEbrQvHR
         hdvTSruUfKgru2tlk3nBnHT9QoMfCfSG8GlZfbjVPzmZPZuioBEaW/MkIh0+CyGYcK3Q
         M0YjbnN9GXqT8gWDz4Rtjc+Q3jao6f8XFXZb80/3dKIh5VMVRGHrqagNxoncN71Q54ry
         OVUVCKYd3L6VfAmJvGMfpMm1gquYBZg4Pw7np5hdis44FSyi1WRLC8lcN3Qbdel95tbv
         eljANGxaOh89eEnSzBLXvEwGq1W+D5AMsxKrSHzRC0n1kiD8Jhfs417vMgKGCYRCBrSM
         pBTw==
X-Gm-Message-State: AOJu0YxJEKUVIdecEcXJrATiY3Pj/xclIiZQjBYA5S1hPUz0Dl3NwrA7
	8L0WGWOmiS50/t51dy9Ek0sgxquBJQKKbsO7kv2EBmrunvqOJHUFK4RRedxMohviCJpTgy7d/1t
	dUwVb+w2Hotqi7Gn9V7SxF5l0jIj07pe7Zys0FLUU4EVCstCkUM0iDDX8zJwjWUqxSYbsnwol6b
	+t
X-Gm-Gg: ASbGncuwQZ9zrpT9FcNjmr8tg43ZH6M4tjCMcRWBB7Oc6PGq82rNGQm1u0HsKIyNtk8
	XaSasLQ+JTBb5ImugvGQZMd7yXxXBF9/dJR8aHM2VWEkUuStgi+s6ImfwcjjuE1g+kq9cua2Ph2
	7quxWEHZlrfAB0G4Dw5By+vCpOikQId2l7wyqkn1q2Fbhp7+NoDDmZuc7+tr7uegeNNaYnX1csa
	IxQjQ8Y1qFCptkQ8IDezV56nK/FUT99e+NVWkIPuqlf1h6a/xznLHkgcn0rk78+v0MU3XrQB4dO
	6zjxvp7Nwns6mPuXAuZ2x0a94J4mIXv44gz9PkXCsphEWMApePhhKm+Oiuth9+fiDkdeozi3phE
	JxcYjX/U0cKb6fgp/B+/ce4hl8YmMcI/mqXKjbIzB7Aew7kxFok5v/1RdACHB
X-Received: by 2002:a05:6a20:3d19:b0:262:22ff:f018 with SMTP id adf61e73a8af0-2e7c593529cmr2766514637.26.1758781763473;
        Wed, 24 Sep 2025 23:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxo5LeMeioyJuwiummPZdVoPbqv4zt6qWSmdXrcD9wR88cYa2xcnvU+gin0rC3c2sEIb+1Og==
X-Received: by 2002:a05:6a20:3d19:b0:262:22ff:f018 with SMTP id adf61e73a8af0-2e7c593529cmr2766480637.26.1758781763073;
        Wed, 24 Sep 2025 23:29:23 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:22 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:14 +0530
Subject: [PATCH v2 08/24] arm64: dts: qcom: glymur: Enable ipcc and aoss
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-8-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Iv5rodAD6YJkODlnu9_jlfwkOPJwL_Gk
X-Proofpoint-ORIG-GUID: Iv5rodAD6YJkODlnu9_jlfwkOPJwL_Gk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX2bbaKM4b5iGx
 ZXNX3E1Te1srTBCO3ORl49AjjWbPvER2gFLzYKza78IJlpWuP/nalVqBxXY+LIFfAwGFr1/IUXo
 /FCeKcd6d1qS3Gp5D2RRGGDd2hwQ0j95fgUNPKxdD3R0g2pe7cJzLOyD8IL68Cze0i01Ts+0UH3
 3HS9K+KP3Ldv/oh8BMJzNKOEr3CudnyW9k0Bf70aJ452E5PoZE9ia3rlbNaxtZ+l6gEjqWdLVVJ
 XjuqodRE6oyRmglXJ3zeW1OlGgqR/AxHZ2uLroURRam+OnqCVHwfmf+tTpV9b+0mstZUuJsn5CU
 xd6luS6cpiJvZa25n5WSLUVcBzXDPhhShIUg9ap2Ag89+sfNi7ovyO2yhGATTfIaJT27k1xXyWD
 VR0xmHbQ
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4e144 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=f5wZDNqicMbGYsbpI58A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Enable ipcc and aoss nodes on Glmyur SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index d924b4778fd37af8fe7b0bceca466dee73269481..2632ef381687c2392f8fad0294901e33887ac4d3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -2536,6 +2537,17 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		ipcc: mailbox@3e04000{
+			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
+			reg = <0 0x03e04000 0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,glymur-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -2572,6 +2584,17 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,glymur-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0 0x0c300000 0 0x400>;
+			interrupt-parent = <&ipcc>;
+			interrupts-extended = <&ipcc GLYMUR_MPROC_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc GLYMUR_MPROC_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
 		sram@c30f000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c30f000 0x0 0x400>;

-- 
2.34.1



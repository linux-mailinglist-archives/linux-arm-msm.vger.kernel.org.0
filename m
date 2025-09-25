Return-Path: <linux-arm-msm+bounces-74957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A8B9DAC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C44D17F9FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713042ED159;
	Thu, 25 Sep 2025 06:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EShHlFp5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36762ECEA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782029; cv=none; b=pHAFaC+xgCejfpW32BXtGgSZt36SNN6VrSUSX27blqIgu5p2Z10X2Owv9KRoMTiMWynXCm4sMv+MGHk/HZ0b/ybI51tUc2bqSBOetbj7xFRu21AdRUp5hp6+Rg1pcpmh66snepbxJi316jOYAEg8hblfLYS0Vujl7CESs1w5tGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782029; c=relaxed/simple;
	bh=gQJ2ZTluSPl0btbHY5JBZLmKAc79qMYc1ayPNK0oRzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6yBrQkeXRoe7fUz3Nm5t1a5KAiEUw+C5GMH46g3Nk/38eWPXtKbKwoic0CXBEhl+2U4ppQVV5/du9KI9V56aCaEom2JbIHIqglqKbKWPTn9rZOZx/pv6Q/zdeRWvenloGSFEGzrDRQKQkGjbPzFvIZ7QdT+fzUAZeER7XIIhiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EShHlFp5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1ajYk029565
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yYpcbaYMx/nDHjUz0/6uYp++ThN6Ho8R/IOjzK2L/PI=; b=EShHlFp5jJGjED7Y
	nIe1GUeLSr66Av2HpOrqTqt7tlkRtNpbsMUkxqm8SIdHKIVzNC2MQDCPtuwE/I7J
	rkFjvnZT9bjxGR0pUDYoBW4voeLxYzvAzA88rkk/UCm0VTakg+MQUyZV/d1AfnKa
	ewbyLcTaAJJ6g+SRRAhZH4WvvgK2Kmf1aZbR8kKX3DJs0NQwXiDOLalswjOXI0OQ
	zRoCCa440n+sqid5Xfk3wfWjm2kTiqhSeY7OzmNkXuRhLSFF7+WIB8Fu6qdTX4JU
	r2scOQVVOjKiCFYK/heIFl7CS+aYTyfywfDsemYuaKSmYa3HwCUk8Vg348iQuGjt
	UyZkiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpwu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6ee6so7264815ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782026; x=1759386826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYpcbaYMx/nDHjUz0/6uYp++ThN6Ho8R/IOjzK2L/PI=;
        b=QFwC162FcfFDTBBEjgf6d+r6UWhdrKkgFkkD51MNL95cThgHJAkAFOD7weOVoPC0hn
         Q8BGIPh8mzIDYWe/aIsV66fszEUB7XaVV7fsfnzccCSS7zK/PzyB5FqiQm43B8qXRpYv
         iM5kCL+kN0Uboz2Ry2HCgPBwzJ9AFZxo35W9PFu7sK6mjGSw0ZbkC5gPEl9zja8Ifrqh
         SwkbrvVsYfDMzxUYPvsuvjKHp+jZsjVhJwz67W33JEHr90pWQPw5j+NFEwpRu/Y6cQH3
         hZF1dK6NXTTccOwjK06YSUA9HYDBZxV9Z8SZt00k9hUODwo7cR0kY3+mR4Va8l1pFu3l
         8pxg==
X-Gm-Message-State: AOJu0Yz3QfTVIoUqZwGxn57e0rD95JpK5vFbzhgWyozS/Rw1H42QURg7
	P8TpRFBTeF6su4xzGgK4aTwtAvCnEYRhGLveQdEGt9OiSXICrDAjPqI0Ew9Z4QKEEO/6Z+q5/eG
	/uky20i5h62uKxs5ZI2i7AN1Kr//oY1v1Xr0G4k96QjjyRZoLP5ELvsGUi9PzXEE5mIKy
X-Gm-Gg: ASbGncsvNcOAQXG7hjyt50sw4FXifS02/xiYSAs8iCfF7p2/S4OIgtRRrra08CZ/KpT
	dSX4eeXglaQkzaYbMEKUHyZOwEQNxkgYZgH4WjvShRNHoFbqe1Z+1h7FAzyu9oxgTZd5gPV0V3r
	hJQsrOgq2lS9fFKebfVHxswHSqpr9AEWBBxeNkLlPROaiZ+1lzSxDpUEMNU4fYuy/+rrP8KbKlj
	kIg0Vyky/TIYLFxMmzLW1ewS23Gjg3zT5BmKUtzrgodKrjd+UPkMiarVVcc1PY/2GqRsWrmER/b
	UZZcAuI8GTlqJBj2DKifjcthHRxHoDKrVNR1c/84KbnyZf5765vK0khIqX4TXIEpAYSRZKQOzc6
	g58cQHJJfWZs9h3P5ZHyNUZB6v2k8L747UfWaOVAXXdCbRZ0tYMCdSbjV3vdW
X-Received: by 2002:a17:902:c402:b0:26a:ac66:ef3f with SMTP id d9443c01a7336-27ed49df693mr26537865ad.8.1758782026196;
        Wed, 24 Sep 2025 23:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvM2LDyqLNvkc0nxyhLAA1mDrXFQTQu+3sbzXmRSdxmhazBOlTMhhgZ3KJl7wIoNnhs0bfvg==
X-Received: by 2002:a17:902:c402:b0:26a:ac66:ef3f with SMTP id d9443c01a7336-27ed49df693mr26537605ad.8.1758782025732;
        Wed, 24 Sep 2025 23:33:45 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:45 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:16 +0530
Subject: [PATCH 08/24] arm64: dts: qcom: glymur: Enable ipcc and aoss nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-8-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: gME72tEhMIxPyW27_r_U8YpXIEPEauRB
X-Proofpoint-GUID: gME72tEhMIxPyW27_r_U8YpXIEPEauRB
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4e24b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=f5wZDNqicMbGYsbpI58A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXxs0sc4xIGtXV
 Y6AqxFXE8Pp/CKkLQH1TowBhRq+CM7XfjtH7TN66tkFHkxfT+duuMhtuRBXmkhN3/orJuILUO9u
 IqLLKXc6KyGQeeZfFr2ivlfzPaq6Tb7Zrzgpr3sNLt+0io6XKS/mN3vXgIZ4oKjhd53KXweprbk
 64L4BC7cbJpyaKQrsq7aOb6Z5UBCbbr2aM1QeyO7Twt4pLin/nDTL5Lk/x7tQCgTgTk9mKyhl50
 UNUwDxlG2dags/vCVZPx32r11mI7bA6e3lGy4L3Z1bG6JDe5SJtts95Z9PM6W7DpV5RbCItOlRa
 9cH/BHEfjVi8oQpgeH54OD2rx6MYA6pHsOF6OKrLm4jetja9mp0jMe9wliFisYgQUQFDksrUlek
 +hPYeR3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

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



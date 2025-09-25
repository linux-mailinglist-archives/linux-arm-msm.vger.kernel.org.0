Return-Path: <linux-arm-msm+bounces-74822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA0B9CDAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA96D4C0E5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D3F20B81B;
	Thu, 25 Sep 2025 00:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtuGyUBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2251EDA2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759467; cv=none; b=UHogZhzQS49MUaiNCTywb3S6W/9KQYwG+VTo1/7RVRmmW3mZKXqOCriaLiLhSoHmhQvbKOk2tyth8zP5Qh2iOvkii53cZYeslHDQMBwte6uOah6hdqGByxMY+1Axh8wKKw743QRT7Eb0SWrBm2eBweDot2NE/e6fYcHucrJua4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759467; c=relaxed/simple;
	bh=nIpTB0NeAUptoXv4uxWQfL7M88V4nsYNIHhSqJZnTHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QadncmIW1r6m9BMD0Fi/Q4Dv6pKiagWAdPO07vrs3ItU/NDetapPkB7Q9CyxfnVsa0LnmKvwFxuH5s2xGsP3UyQ/FqoWDVwkFSS4gh3p3xr3iYgB04Va10cdmAVkuNZHbwEPs9ZW+QDTFqM8tS+q4glcurdLcIfny/q/qa5ynr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtuGyUBM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODGCYm002400
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z41//8vHcA5fSlqMz3I2iIH0TKSTeYCJ9WHm1jj5e08=; b=EtuGyUBMuOIIgZ0O
	0ESUKQydhRP5kbxZFvC/zZI74PyfVnwCAElVBfTtPmL9Exd8qgtkY+jkdagoVQWt
	Pui+mIKp23ABsMbaSXe7oT6nyi6BCm/A+myHYzXxW2kXAtRKisgx2laU7cVtwElx
	XupNlOmCzYBxZvXXLPSPQ9028C+ibEeLFyfrXC9rH963qP0FDpLbsEfGlzLdxb69
	aNKB9kVpKU4PZz56gVMEbY+DmgCTDRiK4hrdZQ9eZ+6BJbTbhs491R3seMqWRsyC
	Z+bU+TopYcLlijryWU5V+tNvtfUPI1IpQ3Aor5bBDHY3qiwobK+9ShxPUPGaKLJq
	aII55w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p5f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:17:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f3aa0f770so601874b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759463; x=1759364263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z41//8vHcA5fSlqMz3I2iIH0TKSTeYCJ9WHm1jj5e08=;
        b=f8IKO8iwS/3DvXF0WZXRVziJuYfab/Y5nZgSOZCQQvJMkm0I5WgKTy8fVKlKBmiIJX
         Z5hGaMRvTjUZI4UqfIGWAZDC91PUBUpRVSZImSCPOuvjlL/XuOarOCYYcK3l6T6lKeVp
         aMTDi0v0hY6Lh5pWDwmAiQ7XiTE7F9Gqz3mXXx88V0x5TIq6xEqU7N+sutjfUaQ9RmiW
         F0sFLQkN9ik4z6mBLgQZ12UkimT1zldPbAGfBtV0qIxu+5l/mFmuobxpuEdawFBH4L3Q
         n6Eq10+1WL7W9lj21aUosn9/4J2HEHDUsN7y0531Nqkvq516SfxaK84LH6PY4v3exJ/5
         ipfg==
X-Gm-Message-State: AOJu0YzF9exeg2Z+UDpoZlocjw+dXrFHeBCIONUWiLdDoe2phhVJzrn6
	2WIk/D0yg8Uip0FcOenUvTXE0GWqU90TrAgRkK9l+bIDxgm93X2tweKx6IZ1CzITQZtCapeAnZE
	HVh4d2J+Vl0Tqkbd75zTZsRkldUZQajvyLyfeR8LUQyBvrGZ6yNSzrhbS9mUmmfJp6hjn
X-Gm-Gg: ASbGncv9rmlsy9CvYul7GwkcNEPAG7G0iMGUsd5NmH9E/U1ZwAI0WJ6iaM6q1LAnUHX
	T2BqVj2pzzkL0UtDGqevdvtsz54z/dWAriTWHHcujy3oyji/hS6Bwyc9IdozlRKLrDS0RZgMCms
	KhKSultzV5MvxVpQKhJ6op888QmmeL39T1VbLnDoJUh3+TNW/eRM5rve6KB8z6w/hZn98atx+17
	UIEkGQOvX7IA0L1HREBo2GSl6Yc88XWMXKlS6YybpKz5xOqgPRVKwPOuB20lK7QQp9L5O7fCUvL
	FmGepycfd8dZdAQ1w2Y/0AjmOF5jLUOaHkYU83kaE5Yhw8zEpP+dmV+M0pHzok3Mpc4i1u8nwTu
	/PVpNZmPFcROzmxk=
X-Received: by 2002:a05:6a00:98d:b0:77f:6914:ed1d with SMTP id d2e1a72fcca58-780fced499emr1878242b3a.27.1758759463565;
        Wed, 24 Sep 2025 17:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXFps2R9Lt4KZbIoLbgABdeFUsajRzhyvUdyW9Ku8o8y03n5rHoNIZC3NOGcdofL5GqUsl6w==
X-Received: by 2002:a05:6a00:98d:b0:77f:6914:ed1d with SMTP id d2e1a72fcca58-780fced499emr1878213b3a.27.1758759463149;
        Wed, 24 Sep 2025 17:17:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e6fasm262748b3a.1.2025.09.24.17.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:17:42 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 17:17:27 -0700
Subject: [PATCH 10/20] arm64: dts: qcom: Add PMH0104 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-dts-v1-10-3fdbc4b9e1b1@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
In-Reply-To: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758759448; l=1536;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=PzGxNgs80hK/Q5JCvCqK5GCBIMfHwdCKONuBi7AoAB8=;
 b=/PYsSCARnprSR1JyZ9fqJ945vYHz6O5QqJ+Eg18n+k063EglvXO9TibRsFhZvFfe+r7KDxpWq
 POg2zkuB4QdB+25CLFax0wuBen5X5yVmyyebz4lPYcepV8OrnRZMXYW
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: yes1MkyCkveNXVGknUDIryze5FW8IAow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX/AtNCwekWQIU
 0EqH7iGx/f3o/ICJ/BPTbgVt1nallwyOr8bmL3hgIXl3x9/6ihI4wCHOOxL1VZ61XXJieA9hHPt
 k4i5RcTs016bbEW2wBuS07tzlODPiw/J5OF3OJ87z3kGzJ64msdYIvIkCR7Jzb09BfJ+R69Q8cF
 fw49BXiT7/YZnB9nBV9Setq6laC9/T0vfbXQMltH42oSS8xcFAfUHhM08JVZybLahs3HIV7itGW
 jNpiCP2ShfplbCCteDKA1yiTWkariQelbe+EeD/jb5QbeoOBsALv1V4BpfknzcM5XQfX3fIyU8U
 Rq2RmGrSGX8ccU3Q4wZBXNHOO1is9yuhZ4sbNJY2m5UM9Z63xwY/0rDK/Tijm6dtPMmOE6wNZYX
 0dSWweHX
X-Proofpoint-ORIG-GUID: yes1MkyCkveNXVGknUDIryze5FW8IAow
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d48a28 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tfDFkgPjZAY9trorV74A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add base DTS file for PMH0104 inclduing temp-alarm and GPIO nodes.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0104.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
new file mode 100644
index 000000000000..f5393fdebe95
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus1 {
+	pmh0104_j_e1: pmic@PMH0104_J_E1_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_J_E1_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_j_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_J_E1_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_j_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_j_e1_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.25.1



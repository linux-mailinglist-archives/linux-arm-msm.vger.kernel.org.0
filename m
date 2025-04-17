Return-Path: <linux-arm-msm+bounces-54610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769BFA913AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB0061907033
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 06:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455D61F561C;
	Thu, 17 Apr 2025 06:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppGgxkEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C561F55E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870392; cv=none; b=EQdc5J4vwJy4YxigsVi6voZpl8kGnMB4evFkA/VJ58cmohDSnZk3KnWJvlGvWcDH2gs9FJny/htWHlbRa5X9Ew10ROjPOPbJWVW2J0SVmt006UtRiTf+komUFXpO7lluO3iFNORF/NhkB6Gb47PPByJB0sEm/6vD2uFsxvh52i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870392; c=relaxed/simple;
	bh=aBUVvS9xAQ91tty8hH4HwDOAQ9yMQyJ+LuCdDkNyPS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FnvelPoVBn8IkLWopxdzzC1f6oZnNH6zLbXGMEdw6m5FJlA5UjCIZRsm5A/zuCyOvZ1zt8uu1pMIthQ3EmzyoUzWY0sQL4lK2sIy0UBtMoyrJFNtXVmALm7Xj2UcCmo/uuyEYtlen96373cizepBP9idC9tkiWFHwaVIf6vQEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppGgxkEA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5lOsi022602
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=itHfH6bY/3h
	7TLPI9Mw1JCHeWJZ+ZMkqoww52qELxe4=; b=ppGgxkEABHvDcUqAfya9Vz0RbHW
	8zNa9GX89rWd9j6yAtID6SVdSNwCOPSbxue+qXNr48FnGOPJL+F9Q0cTU9OjodjN
	ZBH4WqOSdUP9Ki6YmMCzRoIJtGZmVZV1pEFinc+xZiD1aH+yFkYN3OOMo3mylfSP
	z/m3hwGgJq0raQXe1GOmWbon/p8nJx10cBQZhrTU+M++ORLVhQ/AAtWPbXa206Jp
	2o60fA3SIQfgW8cwL12LpJknqNEo2p4l4Nc3S7xDqvtsjEwNrAZuURqjz+DpBQZT
	6QP/W9/4K+BAjgdiviRFh2bc9Bbrmuqac8/t3mBvRCGQn9+cAel6VNrlp8Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpwne2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 06:13:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so4235175ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 23:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744870389; x=1745475189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itHfH6bY/3h7TLPI9Mw1JCHeWJZ+ZMkqoww52qELxe4=;
        b=g7tHAUEh82bsJEiMqlg8z3T/GgfZcxJCoSJ61tClSHa1oxD8CbJxGkD3X0KKHCw0Qm
         WnJ4p7UU6xJVXcCzcuXKPKh8L4XmqGnFrCVBMliSrjA2YZQdZFYVBbpn2q61mKIuJ+Ox
         GPPDp0gkTwYmwBmU4+iIbPakQr1HXUpYgBbVHqYvV0xKsV1gvF+j1kPQtZ6DKHWdASJv
         1is1D+v2EH8HiRQohRJXX49BvjL0zCg/mIMDR0nRXbBCpK00B8aKunuj7+fZaNhEa0WP
         E8JHTH0cr7HvHeh8Zbf2YMxS8StjDM2iSL0vFrkDvUVmCeRBAhviTJqARFd6dYwSM5JG
         X/tw==
X-Forwarded-Encrypted: i=1; AJvYcCX3MNomHlDHQ94CN3NIaI2aqske7veJrk9LTlGvU++NzFbduWw27HhZh+rmyMgBu9o8bch1bDWLOBzANKSx@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgOwyKUBwYw/OAI8CLd4AT7hUTfGg520MtEwq9xX/QN+NNh/v
	5XInpSSElNH8LxjKs9h7pGIvb1Bvp36KdLyhGWs5TjgWW2h3EsMe+bvZkQ0oGEL0qkx3DZJjo4C
	uri+TMOOZ/hiWeHii7ftgllkyWtrSj/AgRXpyn9wQry8O9XlIAJRrskp8HeM2KODI
X-Gm-Gg: ASbGncvmY3bTcIkzunXJHDvUbHO9vkkXTis9WHEdey3ckDbeQd17P9GG++G+SZDgYYH
	+vi2HVDYd2wd/TqG1dCJLbl0C1qi6SKTyCrMWKyZRzXfkSAdvhu0iSOezDT63kkSZRddhu18yfK
	TACnysrdI2i8Gcaj5u4QcQZCYoEFab3D81/F7yl/oxVMjQfBAm5x5IIx1RbN2+PHfziUmqVRkwg
	dQUgyOiWgZZZP98JCr+0bI+z4vlVS4KMpeC14OlqsXfvGeUAj5a6LWYV7z66FAZZdecRAeJxTM1
	tN+7SlFuLqdw6YNydkb358eyVHp7iY30+Utu/8xNJbE5sbVbtL6x4Z1RpBnoCS66DkhUG74oKPH
	ZWJZlobF3DV1YFy5rBsKk2pNuC6vybyKMH9U=
X-Received: by 2002:a17:902:e5d1:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22c358de867mr80305095ad.22.1744870389185;
        Wed, 16 Apr 2025 23:13:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWRHuiyHrqfqGXiiGI4n9BjvUK44TaXx7xaPLmgh2B+1ejESohKulx7CQo3C9lbFHSX/nJMw==
X-Received: by 2002:a17:902:e5d1:b0:224:1221:1ab4 with SMTP id d9443c01a7336-22c358de867mr80304825ad.22.1744870388772;
        Wed, 16 Apr 2025 23:13:08 -0700 (PDT)
Received: from hu-gokulsri-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm25159725ad.191.2025.04.16.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 23:13:08 -0700 (PDT)
From: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: quic_srichara@quicinc.com, vignesh.viswanathan@oss.qualcomm.com,
        gokul.sriram.p@oss.qualcomm.com
Subject: [PATCH V5 5/6] arm64: dts: qcom: ipq5424: add nodes to bring up q6
Date: Thu, 17 Apr 2025 11:42:44 +0530
Message-Id: <20250417061245.497803-6-gokul.sriram.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
References: <20250417061245.497803-1-gokul.sriram.p@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3kvHq2SMNnMoBQndlrZmgtDe0Bbe7oM8
X-Proofpoint-GUID: 3kvHq2SMNnMoBQndlrZmgtDe0Bbe7oM8
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68009bf6 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KQ8NUhp1pKEUtHIUb2sA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=753 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170046

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
---
changes since v3:
        - added necessary padding for 8digt hex address in dts 
        - fixed firmware-name to use .mbn format

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 78 ++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1b..ff43a969c511 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -3,7 +3,7 @@
  * IPQ5424 device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -149,6 +149,11 @@ smem@8a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@8a900000 {
+			reg = <0x0 0x8a900000 0x0 0x2800000>;
+			no-map;
+		};
 	};
 
 	soc@0 {
@@ -541,6 +546,53 @@ dwc_0: usb@8a00000 {
 			};
 		};
 
+		apcs_glb: mailbox@f400004 {
+			compatible = "qcom,ipq5424-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
+			reg = <0 0x0f400004 0 0x6000>;
+			#clock-cells = <1>;
+			#mbox-cells = <1>;
+		};
+
+		tmel_qmp: qmp@32090000 {
+			compatible = "qcom,ipq5424-tmel";
+			reg = <0 0x32090000 0 0x2000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apcs_glb 20>;
+			#mbox-cells = <1>;
+		};
+
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5424-wcss-sec-pil";
+			reg = <0 0x0d100000 0 0x4040>;
+			firmware-name = "ath12k/IPQ5424/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 0>,
+					      <&smp2p_wcss_in 1 0>,
+					      <&smp2p_wcss_in 2 0>,
+					      <&smp2p_wcss_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			mboxes = <&tmel_qmp 0>;
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
@@ -724,4 +776,28 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.34.1



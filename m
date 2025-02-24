Return-Path: <linux-arm-msm+bounces-49118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB0A41577
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D61833B0084
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 06:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01211E5B82;
	Mon, 24 Feb 2025 06:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bv6Hf3zq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2931C700C;
	Mon, 24 Feb 2025 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378953; cv=none; b=csIgiQlFOq/HyoMcFP7iq9LCgRBdoetPFrZ2IYNsE/PJWi5PgkBrUm31XV8nm0HIK5G92O/jJiEJ0gWS17ygavZ3VsQiTctjErXXpkL8jHTvBYzKQqoGXgSsitbIsBOoLB8SdI0/sh+i+pVwQxorg+fFRJXltCrYVxDCVKFDFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378953; c=relaxed/simple;
	bh=nYmmUWV54h+zMwxJGC793ncdFOLbEMVB/ppAk5pnB7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stNeRlGCuCAe15ED/apt2DE0P3sH2IbVJqNiZPAw7bpvZ0asOSAebAc/zSwxT228FTiM9VHMLYndVWSXMQXXFYt3rp3qupGXj5BKs5qRAQz8oHDDNNqUwcywZ6Jvq2022sgSm2FA10gBEGZTLeGak8RvuKldPux2km8/NuVzXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bv6Hf3zq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NMSqwS004252;
	Mon, 24 Feb 2025 06:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAWB3Z8kQfjvBCkloXNDPZjCAwSJZhk3XrendQ7k6e0=; b=bv6Hf3zqHnuhg7Yb
	/ZRxL9XnUBNOQXAawOy4QwtmgZT/unN38yw5+H4ASrX6hVQ7TxCojG+CDORTQfpj
	zcBjqB5nh6pZ7fF8+Ih2KZK7z59r9U0zopCkCR8z7Z7gPZGel2l3r3q64APu129l
	lVuS2hSSsyKK/+kmi9C4SGyBkIG7d7p18NgnRoi2SxBVD3gTSVBnM2gQchzIIAjD
	RnGRzu7dT+xstBpU0eJhINhGU9EQ9A8g96Mw/UxHC0T3gLaHPithmzABbogAe2Pd
	WqBiuSjdBG5B62WdibpNO4z/j53+Wls5D4HTwCwmlPYMRTFzugSgPe73keLkbpLz
	RArbaQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntutse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O6ZlUv012965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:47 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Feb 2025 22:35:44 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v12 1/4] arm64: dts: qcom: ipq5332: Add tsens node
Date: Mon, 24 Feb 2025 12:05:28 +0530
Message-ID: <20250224063531.2691961-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
References: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Sjys2GfZCNkXYPGuOYwfG5uv1pjZw69L
X-Proofpoint-GUID: Sjys2GfZCNkXYPGuOYwfG5uv1pjZw69L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=720 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502240046

From: Praveenkumar I <quic_ipkumar@quicinc.com>

IPQ5332 has tsens v2.3.3 peripheral. This patch adds the tsens
node with nvmem cells for calibration data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V12:
	- No change.

 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index ca3da95730bd..cb3657bb8aee 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -177,6 +177,46 @@ cpu_speed_bin: cpu-speed-bin@1d {
 				reg = <0x1d 0x2>;
 				bits = <7 2>;
 			};
+
+			tsens_sens11_off: s11@3a5 {
+				reg = <0x3a5 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens12_off: s12@3a6 {
+				reg = <0x3a6 0x1>;
+				bits = <0 4>;
+			};
+
+			tsens_sens13_off: s13@3a6 {
+				reg = <0x3a6 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens14_off: s14@3ad {
+				reg = <0x3ad 0x2>;
+				bits = <7 4>;
+			};
+
+			tsens_sens15_off: s15@3ae {
+				reg = <0x3ae 0x1>;
+				bits = <3 4>;
+			};
+
+			tsens_mode: mode@3e1 {
+				reg = <0x3e1 0x1>;
+				bits = <0 3>;
+			};
+
+			tsens_base0: base0@3e1 {
+				reg = <0x3e1 0x2>;
+				bits = <3 10>;
+			};
+
+			tsens_base1: base1@3e2 {
+				reg = <0x3e2 0x2>;
+				bits = <5 10>;
+			};
 		};
 
 		rng: rng@e3000 {
@@ -186,6 +226,32 @@ rng: rng@e3000 {
 			clock-names = "core";
 		};
 
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,ipq5332-tsens";
+			reg = <0x004a9000 0x1000>,
+			      <0x004a8000 0x1000>;
+			interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "combined";
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base0>,
+				      <&tsens_base1>,
+				      <&tsens_sens11_off>,
+				      <&tsens_sens12_off>,
+				      <&tsens_sens13_off>,
+				      <&tsens_sens14_off>,
+				      <&tsens_sens15_off>;
+			nvmem-cell-names = "mode",
+					   "base0",
+					   "base1",
+					   "tsens_sens11_off",
+					   "tsens_sens12_off",
+					   "tsens_sens13_off",
+					   "tsens_sens14_off",
+					   "tsens_sens15_off";
+			#qcom,sensors = <5>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5332-tlmm";
 			reg = <0x01000000 0x300000>;
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-51696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E40A66FEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 10:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 863F6880735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6D620B218;
	Tue, 18 Mar 2025 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p5+OtmsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64022080C7;
	Tue, 18 Mar 2025 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742290469; cv=none; b=JS6MunxWq6BHupw7/TPBOtIcdc/lbKyJH4MTTtZ97lQ8XYuGEItsHt36nJjsP1/q3rrJSQb2il7RARU24E/KZUjy30FMCU8P1LUJGJ6u5X5uqS6Y6LAy38vIaupmf6HcaLtNJANYlbio7S2CGe/Q7rFLNMo600HzWBaHzQ3xrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742290469; c=relaxed/simple;
	bh=3Dj6eVY1WSl/EBsvpz2MDg4iIvygSWne2d3q2NDMDbM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EI5sRnn5IEHMz5jdi01Rug9g4D1vBpk2qHoyj7FRPd/R1ym9SPB2/Ig+anP2/rzPW4UalvEOcnsgbEBonrQ1mPJ6ZH+8Za6B3mfxo724/biG7O5a52DfKobuwOrHlfZRCyKlWv+6vl/FDBNm6tt+8O001+zFDrdPLlXpG9Le/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p5+OtmsU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8mI3N004751;
	Tue, 18 Mar 2025 09:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QiFmKa3T5KaSyubYItQyZ0y7iXImVhLC/yBm+hAxi0A=; b=p5+OtmsUL1pF9XLg
	3sTIrUIHkn/5So5xEo9huc0Fi6MJI6Bn0nOlFvwtnKZTbm1igls6pYoNh/5WbY8z
	SCnNJ7AngXcclFRvr55fQfO2ygjx/AZZLc4i4tL8Mw3dDCFgy+j0E10XYCwIQxrc
	pNVK3ha3sTqNxUt3AKQi7NpJ4x7PW62tO0GHz+jdiGFTRpB5/4ICpjzZpimZUXdx
	DN6Hl1TgkY9GmOk0EcCWSbu9SWif7D0HQN7gkQuhh5GP5jOTeZcn8hVGimTjHwuS
	PWBM9521MsabdTmLuMHpYZUZl5M1ZXIRDaXP0rsQTMKNjes+P/2Ob8rVaIgBjE27
	zt2MpA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbsthw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:34:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I9YDaH012492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 09:34:13 GMT
Received: from localhost.localdomain (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 02:34:09 -0700
From: Stone Zhang <quic_stonez@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang
	<quic_stonez@quicinc.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
Date: Tue, 18 Mar 2025 17:33:49 +0800
Message-ID: <20250318093350.2682132-2-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250318093350.2682132-1-quic_stonez@quicinc.com>
References: <20250318093350.2682132-1-quic_stonez@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J4h-CDDIEpT_1qc27Ou4JGgxA5moKKE0
X-Proofpoint-GUID: J4h-CDDIEpT_1qc27Ou4JGgxA5moKKE0
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d93e16 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=nl4eYnlUYfJmc7KBqTcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_04,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=931 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180069

Add an original PCIe port for WLAN. This port will be
referenced and supplemented by specific WLAN devices.

Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 8c141f0b414c..e25223d5be5e 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2091,6 +2091,15 @@ opp-32000000 {
 					opp-peak-kBps = <3938000 1>;
 				};
 			};
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c04000 {
-- 
2.34.1



Return-Path: <linux-arm-msm+bounces-41935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B49F089F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DC11168BEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D309D1BB6BA;
	Fri, 13 Dec 2024 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lddaFtVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8EB1C1AB6;
	Fri, 13 Dec 2024 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083608; cv=none; b=a+rJ1bxY2QWf5e6nNXHSmQqPL7BuWMsx6XAX2rNX1cdOBjAPD4gGhCzQACPkSvMMvSCgkztTtrlwyk4FFBxSggmCRcVv01nWsDflYw17vHjR0Tg2VvmWLDduAoJaG7aH3Y2FPuBWqQqrfbMHAdNNlLensfOeuvJAEfbb7Nv3x4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083608; c=relaxed/simple;
	bh=szNeSkNFXTESxT9YsrXpg2FsepdwW9zfSPjrqfYhUKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uFEwn2chM2XwfBU3Fm6iOu9nlvv6a6fxzxz02050Szrdq7YpKydif8TPflXPMtAyOX1dwn06iBhM5s4Nlp4jECnxz7VDxnvgTNqJWzqjMq0m8qRvKc2ThAtu9fdTJMKDEFFuWy2qYOEICRbCzS+2NjuUMvWawNWfVgNbbA18TPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lddaFtVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD3lcPi002014;
	Fri, 13 Dec 2024 09:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukuNn4898hDcBAaxoYVAnOwvnl440GEcFdWFRkwWpnk=; b=lddaFtVIDSlWxP/I
	SPh6NaCceK4VbrZFbeFxw4G1ssn1SNtMCjYPIpdLAbTppLjztIfc5a71VIeA+0Rz
	zP1yu2QbEr6p3+Q6McJBEUi8w/XXGoIDFG4I1Opc+ElHgLtNgZrRCHCCBVASOyll
	b5H8VrgTEPiFjuzzyBOJBoWf07+JobpGOWhBpoVe1Xk52AKbe4idQFLtc1Kxu1id
	EGZr7qPfWYNBYFjvGQMZNxynfv/tkXoh9PfT4i+P1vv65j005LGCrr+nM13CytUa
	cL+7MJ0ks3IGxs6HoRRLjrP3FuIq6AwQnAFNrun3iSKAGYfKmp1Eq2aPcBFL1ugr
	tgucbQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40nvn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:53:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9rNOM022983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:53:23 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:53:19 -0800
From: Prashanth K <quic_prashk@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
        Prashanth K <quic_prashk@quicinc.com>
Subject: [PATCH v2 08/19] arm64: dts: qcom: Disable USB U1/U2 entry for SA8775P
Date: Fri, 13 Dec 2024 15:22:26 +0530
Message-ID: <20241213095237.1409174-9-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213095237.1409174-1-quic_prashk@quicinc.com>
References: <20241213095237.1409174-1-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: 1-dRnCBJxbp5Zt5PwAOVH5i0pi-LkCLe
X-Proofpoint-ORIG-GUID: 1-dRnCBJxbp5Zt5PwAOVH5i0pi-LkCLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=495 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130067

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Disable U1 and U2 power-saving states to improve stability of USB.
These low-power link states, designed to reduce power consumption
during idle periods, can cause issues in latency-sensitive or high
throughput use cases. Over the years, some of the issues seen are
as follows:

1. In device mode of operation, when UVC is active, enabling U1/U2
is sometimes causing packets drops due to delay in entry/exit of
intermittent these low power states. These packet drops are often
reflected as missed isochronous transfers, as the controller wasn't
able to send packet in that microframe interval and hence glitches
are seen on the final transmitted video output.

2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
when U1/U2 is enabled. Often when link enters U2, there is a re-
enumeration seen and device is unusable for many use cases.

3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
the cable is disconnected and reconnected to host PC in HS, there
is no link status change interrupt seen and the plug-in in HS doesn't
show up a bus reset and enumeration failure happens.

Disabling these intermittent power states enhances device stability
without affecting power usage.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f315a51a7c1..7a50991daaa6 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3411,6 +3411,8 @@ usb_0_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x080 0x0>;
 				phys = <&usb_0_hsphy>, <&usb_0_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 			};
 		};
 
@@ -3500,6 +3502,8 @@ usb_1_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x0a0 0x0>;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 			};
 		};
 
@@ -3563,6 +3567,8 @@ usb_2_dwc3: usb@a400000 {
 				iommus = <&apps_smmu 0x020 0x0>;
 				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 			};
 		};
 
@@ -3570,6 +3576,8 @@ tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
 			#hwlock-cells = <1>;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 		};
 
 		tcsr: syscon@1fc0000 {
-- 
2.25.1



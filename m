Return-Path: <linux-arm-msm+bounces-42631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3959F62E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB5816877E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF47199939;
	Wed, 18 Dec 2024 10:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HCOoeUKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADC9199385;
	Wed, 18 Dec 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517675; cv=none; b=F8McP/6oIKuNljgBtB+GBNiFk4knuCQ+ugVL/qrxUccL71bd+SPAD8k45HHrv5LxKhNDzJ76ms6wjM2J1hWnLorjeY2+Hcm2IPUBcuM7n9Lt9eYiAOstnvOr8xEbdA9BtNw9Pf48fHNvNjf5nvbU6To9w1hn3KAvm6KczgV8YkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517675; c=relaxed/simple;
	bh=kiyXkb3V8nAFE11cuAv8cHd55oZ5x9Zkyl0hixMM2gM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NN9bSP+i0y3wOF91WJSxQOgxx7Hy4z33/q3eQ9T8sCz6FccfCDxiLAFY7TEvpmmSdi96nThVysA72rIydw56gNTLwHufLqQG86HdrNgbml8vg8n6UFAIfppn4S+wZKnuKbUGqXauhJFWl37oNu7aKTi/Hxg/AGrc+vzj90jfTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HCOoeUKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI4Y6ND003982;
	Wed, 18 Dec 2024 10:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d08adz+4bDN4JmKBzyHtZlczB05OYOZKKkihVU99sks=; b=HCOoeUKKRw8cTu2Z
	ho/kUsd8olRCgMHfXF4fGRmkaCh/F8SvHz4t9Jxow7l2ZcEpdc202UOFFt4OhLMm
	rDVWNuZh0OGvKYmVxdtl7be6pD8Lof0Z2r30eErf7q+G7sNXyYlLr5wjdOQg7Hlh
	Bs6nFFR8aHy98bBcMLNtETrGbrtbbgj07WSBhunqzrmekuEtV+aQ/qvtdz1vPGa9
	P6q5b/QfZgRK/g/Z32QHiL7sM/g00HJCcBXgaY0uDaUHV/bX24xO5krA5r4Xgh1p
	ixZqPJBCbyRFLQL0BqQxdhYst1unX/lNy6zTTPrlppZzbU3G4ShkBiJ2gdY2NI5R
	EHhFVA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kqfsrt42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:27:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIARnl1032313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:27:49 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:27:45 -0800
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
Subject: [PATCH v3 03/19] arm64: dts: qcom: Disable USB U1/U2 entry for SM8150
Date: Wed, 18 Dec 2024 15:56:51 +0530
Message-ID: <20241218102707.76272-4-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218102707.76272-1-quic_prashk@quicinc.com>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: DaYiYrwK0e3UBRbRSr6Uh2Dykr1RwO2I
X-Proofpoint-ORIG-GUID: DaYiYrwK0e3UBRbRSr6Uh2Dykr1RwO2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=469 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180084

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

2. On older targets like SM8150/SM8250/SM8350, there have been
throughput issues seen during tethering use cases.

Disabling these intermittent power states enhances device stability
without affecting power usage.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index cedae8d03a51..4dbda54b47a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3658,6 +3658,8 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x140 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
@@ -3735,6 +3737,8 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x160 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
-- 
2.25.1



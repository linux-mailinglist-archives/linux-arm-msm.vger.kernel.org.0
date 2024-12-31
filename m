Return-Path: <linux-arm-msm+bounces-43728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D29FEDD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388363A2C3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A6D1991CB;
	Tue, 31 Dec 2024 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KAjyVMKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4431AF0B6;
	Tue, 31 Dec 2024 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632757; cv=none; b=HBSTvilXm66coedS6ENrDcuRV1ManPQkzysQIM7H0zk/QHfbAKdNwuYLX+f8HAe+PUobqbAGuz2WnnSBDkVSL7twhLHkClwjwj79lopzgFnM1yEbAOiA4TLa0c1FLWfILjtVzxykWJhP7W4fUl3N1wkFgzkcFR9HMXCkuECdjHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632757; c=relaxed/simple;
	bh=c+vd4NLqJ6PmotMu00vZSylncJBPplp9FIXbxon44h0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AubxegGkDu2cJXmkRPRJ+MkqxnylQCalreC96yZB0JvdhM746X6zwQTsS5MJTTsaVJTSZXMYTihgZfgCXkHaXFJihvEUplZEf/TR3c4Y0OzxQ43bFoOiBg7Uz0+zgIVGOZ2VfBWgsq78WAmH+TXt9LwwAwIIdokbvq9R+TADIb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KAjyVMKW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV2lDLU000748;
	Tue, 31 Dec 2024 08:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eY8F10YBCuMv/8XsUUTbXu1E9X7OSGH6vEGVRFPGrfQ=; b=KAjyVMKW76CjECVf
	21Rl8RcwcrC1HnQXCzBUxPp5KJ6geTT0PQKdhTyE93MreynNUwhDO1s23dAG4s1u
	1Scw5lZV6Nr07RpkpK9Mk1ASX14eMiHt0YabP3mZXF1XsRKe9qUcKwxdyXJ4XNjT
	EoYM5qlVNltiCg5SW2x1RVEElu4BWzaBJODEm1rlqLPPrdpgVr/4H63TBL8NZbO1
	MLx7/FwdGIynraUd9RePk91UGR1eQdiIVIF6i1Rqo0qz6WQqtjgsNVVAOvQvE4cY
	1H9gJRV1WkdDD4smhQ9MVf/NbRPmZ/tOsD98DP+EQYgVX3463U840/bTC8qKyYZS
	EyRDKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v84jgmct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV8CWa5013475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:32 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:12:28 -0800
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
        Prashanth K <quic_prashk@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 15/17] arm64: dts: qcom: qdu1000: Disable USB U1/U2 entry
Date: Tue, 31 Dec 2024 13:41:13 +0530
Message-ID: <20241231081115.3149850-16-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231081115.3149850-1-quic_prashk@quicinc.com>
References: <20241231081115.3149850-1-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: pTYidJDVOfIOSwuvZtto6ahMSG2G67dY
X-Proofpoint-ORIG-GUID: pTYidJDVOfIOSwuvZtto6ahMSG2G67dY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=484 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310068

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

Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 47c0dd31aaf2..85e9ccfc9655 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1009,6 +1009,8 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0xc0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>,
 				       <&usb_1_qmpphy>;
 				phy-names = "usb2-phy",
-- 
2.25.1



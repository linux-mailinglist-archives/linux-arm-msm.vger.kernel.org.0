Return-Path: <linux-arm-msm+bounces-42645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 216AA9F631C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8260A166931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0427D1C5CD0;
	Wed, 18 Dec 2024 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tf619TEw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A41C5CB9;
	Wed, 18 Dec 2024 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517724; cv=none; b=k3SJK5hRyqPwRzLcFGPQ6qQID+rRaE1dVSComCKOOYu7yB8ffZWpJkjiOwpcEoOrN0Ktwd5It3pclEpbUKepZN085NmeKUFbWVkR3UTAGdJuxXPKAegKiClWk6s8y+PaNIk80L7eYyz6fPlmjTnfQMjWagxNOEJuhCahFqjz8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517724; c=relaxed/simple;
	bh=dB2YPTLKRMD3LzZrerXH/wkfVnQVKUDQSwKTvPpc8xg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWfulgQ8XqR5l1UD5VAb8yru80at/nakrgYRJeY74tHPZ888tmEaHaTCeD7jP0PEBAiZnikWL1Yzjr2H9UpXFp1e88CJYg/IpISlHQV7z0ye/K4hrmeTAhniIja8O66WZgLnwQwbStykyQ4SYHduyIAO+xu96VwaFjiGTmzNhlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tf619TEw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI0o5Io011854;
	Wed, 18 Dec 2024 10:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLzi6Tiry0D1QyvrHqQJPZaZPu5DcMrzPma/xwu+drY=; b=Tf619TEwRDTqmz+y
	Rr+DpvEXzwaY0jIwp4wLHFBGqIDBt6MuVbhmYDWNy4yFcUyrTLZdvu1knfnmi1v5
	ZU7vbGPf9ipf1LIvBs4WxHf09rAS8l7xfOek0BSEOO/0wvU/+OIMJSUR4er9SGur
	SGGV+DBUuf8SrGa+gJQZ7R4xHsjpGJyCZapTQGY8khsCIsfGjfDwLdMBxB5IXkXK
	EEWDL/7t9TlojFrmk9aLcDaj9Hk8rv+yL7iaGOz93mjBwMuQ7ZndfJLyWIivAC1e
	2LxyHrGQOFqNrgdG3Qaig3hyMAAUS968ML+jLhnLKmUv7JswJIy7PC4nfX2CRlZQ
	Od8uVw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43km6r98x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:28:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIASdWc001094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:28:39 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:28:35 -0800
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
Subject: [PATCH v3 16/19] arm64: dts: qcom: Disable USB U1/U2 entry for X1E80100
Date: Wed, 18 Dec 2024 15:57:04 +0530
Message-ID: <20241218102707.76272-17-quic_prashk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: a6v9Mz57ILSbiEQZ7bMpfVbf39jzEmqw
X-Proofpoint-GUID: a6v9Mz57ILSbiEQZ7bMpfVbf39jzEmqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=412 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180084

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
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 88805629ed2b..d522255bb249 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4063,6 +4063,8 @@ usb_1_ss2_dwc3: usb@a000000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,usb3_lpm_capable;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				dma-coherent;
 
@@ -4151,6 +4153,8 @@ usb_2_dwc3: usb@a200000 {
 				phys = <&usb_2_hsphy>;
 				phy-names = "usb2-phy";
 				maximum-speed = "high-speed";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				ports {
 					#address-cells = <1>;
@@ -4247,6 +4251,8 @@ usb_mp_dwc3: usb@a400000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,usb3_lpm_capable;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				dma-coherent;
 			};
@@ -4318,6 +4324,8 @@ usb_1_ss0_dwc3: usb@a600000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,usb3_lpm_capable;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				dma-coherent;
 
@@ -4418,6 +4426,8 @@ usb_1_ss1_dwc3: usb@a800000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,usb3_lpm_capable;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				dma-coherent;
 
-- 
2.25.1



Return-Path: <linux-arm-msm+bounces-42646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C373E9F631B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C93777A6CC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762A61DB363;
	Wed, 18 Dec 2024 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J6+r9rAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D9199FAF;
	Wed, 18 Dec 2024 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517729; cv=none; b=EQBYUwYdbFP5BciwXkP0K9t4vqYFRcI8eel/N5oiwOd8q0rDDuazZ8LWFcYsHbGm3zuxPd4OsPFpjl/TvyVaUt7oJ1YpsARN+1cNjbydPR6MmNhIlt/dq02fSWFlV/fAyrcK7V1oMcMP/ww/kFyqeBV8L7fN1BZ/AcxhSnQK57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517729; c=relaxed/simple;
	bh=20WJ8l5tnAPXinRP6IfA0c7urRNx9gGH1D45kCDVXU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jLwfrwvzzAa3tBI47XNMS84jbT02/sDZ5N2t8r2reKbDJQjbLRzLZjvLJpzZHLF1sxzkXluHLaiDJzy4vCDhsqU7Ymji5YxcZZokgsO7PmMZYwmyjKrp7RvJIasUWA9YGxphdOK7qakhEimbg465UWpd5TCB0GInntvvOKunMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J6+r9rAz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI0nuTr011655;
	Wed, 18 Dec 2024 10:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOevpz2MLuxkICRzP21x45Eg7tfW5k04JKTABMbmho8=; b=J6+r9rAzQXlaLHKU
	WT8xjgAatQMJmhvwjsA6CXHp3s9Ws26/cYVEemq5gnqEPJYN1IGdyD7MQigFZ7/Z
	CH2tjkP5EqwWA4K+vKNL7iwgumYfKa8T0pZbUhJeLiIM8TcUbtlOYNMC6ZNCh+YO
	AcYWYr8u2mrOboJ4TmlhvKv4+QUklo+rPzjk1Z2gOoE/Ll8Bb1qpK4pjrIhpJ9i5
	tR1qTh2gGsqf0bSJ/U2ixzeMDI33NhQNje+8XsIjEoJmlxTZvalXwRQfHNR8ByTa
	bZ/w79DaxHoclxXKq7bJKYoAAKVygueP/vwNUu6E3tTmbOqmmPjVFpSe2J2g/u1p
	WkNkRg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43km6r98x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:28:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIASgK8011989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:28:42 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:28:39 -0800
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
Subject: [PATCH v3 17/19] arm64: dts: qcom: Disable USB U1/U2 entry for QDU1000
Date: Wed, 18 Dec 2024 15:57:05 +0530
Message-ID: <20241218102707.76272-18-quic_prashk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 9sJVAC_3SKH__PzZk-eBBLq-fM9s6AoN
X-Proofpoint-GUID: 9sJVAC_3SKH__PzZk-eBBLq-fM9s6AoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=442 suspectscore=0
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



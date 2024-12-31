Return-Path: <linux-arm-msm+bounces-43722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D29FEDC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 421C93A29D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E42019EEC0;
	Tue, 31 Dec 2024 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OTDNX826"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6EB19E7F8;
	Tue, 31 Dec 2024 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632733; cv=none; b=SdKWG+XEIiubdkv4ISKVgfI7NsWhBHx0VX6KiOrKLk5g3WLctpUYWTQcnPHwe3Csfn1S9u1QZHUj7ykOlrjr9IoC5rkrq0r9C4UzcZ2rf3K0VuAyasd3+yLoAIzlk5sXNuD/foqQLAorbOeAgM1KCFBrq8VXKPURhG1dc+2CTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632733; c=relaxed/simple;
	bh=4HLzFAfLwYtmhqSPKWHtsifbC4PFes5RBbFBDPvfpAQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqi6Krm4m8d8bVkI7O3/xn636bav0zO8L2KETqiMOUhYbipKCL/B2brJlBKSqvnSiB0C+LRDng205TDZZ9J5tak/pNcjR6eS9wCZzoegW4Nn0f4UMdjM87Mf2dF2q4dHzQ/4sf03dtFP9YxctmCR5R8Oes4wY4HSwO/accBLHCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OTDNX826; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV32nkQ024087;
	Tue, 31 Dec 2024 08:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSUB+d126n+egwGgLS6yWRjUcpwiNb7UtbYsiwLDsng=; b=OTDNX826XWek/HJK
	JMRZyR8RG3ZuEy2sCIMMD7KNtNYrTkV4JlB240jxv00DqQpIiesRjVx92wzrhk1S
	OV9Ch7Do4jNgL1hSLVC4W4CDwgGkl9BZcS8Vu2mQBcM8KXk8bR/TjAdT7Ms+ywgC
	BTGQmlzmIJ30JxvMvi+2XMT2/tMRswrgdHh+HH1OEi7VuFMy1AlxZKNsQlJ439dU
	KZDzWymyCe6r+q3KPE45nDbR8pHfr8XRVWGEqeLGSpLQTEAMiTZb/44T7yaucS+1
	4SBB7cg5zfXlFSObuZPL/OrI5fOhOSJjKEmjIlX4WpenULLDN0TcgRdavr14eXuj
	+sBgTQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v8c3gkne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV8C7cp001487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:12:07 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:12:03 -0800
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
Subject: [PATCH v4 09/17] arm64: dts: qcom: sdm630: Disable USB U1/U2 entry
Date: Tue, 31 Dec 2024 13:41:07 +0530
Message-ID: <20241231081115.3149850-10-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: s8vLxQ_Hyw_3rVWa0wZJw0hXJLPhGuxR
X-Proofpoint-ORIG-GUID: s8vLxQ_Hyw_3rVWa0wZJw0hXJLPhGuxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=546 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310068

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

Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 19420cfdadf1..a2c079bac1a7 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1300,6 +1300,8 @@ usb3_dwc3: usb@a800000 {
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 				snps,parkmode-disable-ss-quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				phys = <&qusb2phy0>, <&usb3_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1505,6 +1507,8 @@ usb2_dwc3: usb@c200000 {
 				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 
 				/* This is the HS-only host */
 				maximum-speed = "high-speed";
-- 
2.25.1



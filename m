Return-Path: <linux-arm-msm+bounces-41933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B480D9F0898
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0EAB161CEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53E01BDA91;
	Fri, 13 Dec 2024 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YdQvUU8x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EDD1B6CE8;
	Fri, 13 Dec 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083603; cv=none; b=ZAXGbQWbHjBuJqCGUPiM5SlpLPSCYATPuX6vbr/Vu29Aoyktysy19oRjTgMeWtpMjiTGmBVpt2LDPDz1F+T/VlDsMSYDihmyLz6G+Ch0rlBImqlHzjSxV97tuQ2ZsDCuij7RymfU48e06j+/I0GnvFrw2gn+GtTkILWYS7SIEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083603; c=relaxed/simple;
	bh=3LCiapXts4kyo0YLgwwXscp+Bj5y6qe59HmBZh+D/Qs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IycLhndhiMCW+yRmckBnzem5bVG3KB+NbTqgBm2bMFmyHKOGw6mAXZfqKzbB8733zC1v/kRxYMbAyAuunAw2jsTVOg92ATvBu1zfq4c6JWMkaZpkg5/QX4frjrlaAkEdttQEMWoa/awQRfZm5kpDFGEqldIBpPE3yxhor78qT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YdQvUU8x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9nq4h017524;
	Fri, 13 Dec 2024 09:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8HNKNz/rSJhniyQrgcOSFY5YFgExI2W+YeNCd2c8EM=; b=YdQvUU8xsdzTvFWl
	TlyoybX7CdOHsajOc2j+JTdhEnASnZb43KD0mTBxu+9pyDrkplnY0iCSpJLMAof0
	4j3ZbFjM0UHU7Y4trtVww/eFU0mXnkeN7P0ncCqQjTObjECxl2yEuGzEdZ+GaZzl
	EKGGrxMUR4q57Dh6kkn3ocLYk/0x9SDOD6EbONmUEnGFMjJfq/860lP2uNfqOB3x
	Aij1UR13QHFTmXI3QXhssA7loY1f+MnYSbDlMoWC/5doP+xae+W9J7k7Bvi1HHY/
	3vYNje504xA1SVIa0D2jqj61AUefGJZGESM4fGwVxoCs4X/8pY+4//+FBovUrzl3
	M99Tig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt008k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:53:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9rBIM021780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:53:11 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:53:07 -0800
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
Subject: [PATCH v2 05/19] arm64: dts: qcom: Disable USB U1/U2 entry for SM8250
Date: Fri, 13 Dec 2024 15:22:23 +0530
Message-ID: <20241213095237.1409174-6-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: 3XGlRpLdv6wRT42pZa6xQmFh5HAM_1LM
X-Proofpoint-ORIG-GUID: 3XGlRpLdv6wRT42pZa6xQmFh5HAM_1LM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=469 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130065

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
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 48318ed1ce98..e40f3b21e37a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4207,6 +4207,8 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
 
@@ -4294,6 +4296,8 @@ usb_2_dwc3: usb@a800000 {
 				iommus = <&apps_smmu 0x20 0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_2_hsphy>, <&usb_2_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
-- 
2.25.1



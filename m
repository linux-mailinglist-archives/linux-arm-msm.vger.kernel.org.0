Return-Path: <linux-arm-msm+bounces-42636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E080D9F62F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23911168011
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4831A254C;
	Wed, 18 Dec 2024 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c7oi18Uj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D51A23A2;
	Wed, 18 Dec 2024 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517694; cv=none; b=I2AMa4eSlN1B8J4KZIHDb4uGDEPvCrEyUFsP4SVcMqNmE+lKDIx2y1OUclnfg1c8MXb1ALUuX5A/8YVSIYnCIPK5vKgd6rDfFyx3le64X9Q25DCqMkFhVM302/+J2PWBU9fdliUG9+0SNluFNrEKtzrL95AnwR+ioO2B0nd9cl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517694; c=relaxed/simple;
	bh=Yj3asRtddyq4TDxsuXKd7dU8nxgr/QHlbCTmkEHSBtA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g97kx0Zv41+Ju3dA5n6mMyq+8VMyWsaWZ6NyiBTW3nsMqOqNwTMLv6E/HS6pvxyUZtNCmx1DUVJJ5YwZjUMDgpT6VlLCO2PrfE1k8siuk271HNCypqFZHjorsxL0e/qo7w6ezrsin5Hqm+G0YysBMBN44V8mL7UO4AJVnHtSRJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c7oi18Uj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI4XolC003150;
	Wed, 18 Dec 2024 10:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJx1y1uI66Tkq+pF9m8i6c+tn67qqmlZS7hMU8b2loo=; b=c7oi18Uj28RxSPy3
	7orurZQ8CpaML8ea9xvlbBVaY9z5hnQjXbJp+fsjfZo2ajW4Oxmdc4GRY0kuI3qd
	sjJro3/0HNcSe56Z1XUyN6QLBc7wBQz+9xCPBlTSoF3e7EbFTQOS8U7rtGurYaAO
	wqwcCq00nPLew7f5zxfTgM0QP91qxI+RF6d2mkQkDg+VIHEuMRNaqNzEOseIAzNr
	qR4oPKKjfn6WBniI2WUmwUfDUiMYX4MHPbF7Gv1g8EPlxbQV0A/Oa6HaP/vKLOia
	DkQjWTAgJ7us7jMWI223BTHR65O1pgsbd4wN8xj5K8nq0BKsK0JY7POQ5vuMamu9
	VoMMGA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kqfsrt59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:28:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIAS84Q025072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:28:08 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:28:04 -0800
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
Subject: [PATCH v3 08/19] arm64: dts: qcom: Disable USB U1/U2 entry for SA8775P
Date: Wed, 18 Dec 2024 15:56:56 +0530
Message-ID: <20241218102707.76272-9-quic_prashk@quicinc.com>
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
X-Proofpoint-GUID: NjfNEh_j2q6KbUYZj6uKli00rclMRRcT
X-Proofpoint-ORIG-GUID: NjfNEh_j2q6KbUYZj6uKli00rclMRRcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=442 bulkscore=0
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
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 9f315a51a7c1..530fea25af55 100644
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
 
-- 
2.25.1



Return-Path: <linux-arm-msm+bounces-41944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D79F08C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 214A516946B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6A61DF99F;
	Fri, 13 Dec 2024 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PkDimKXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4D1B85D2;
	Fri, 13 Dec 2024 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083647; cv=none; b=qJcCmbLpn3u1/AqitBRZ6FGt/0iPL0RpjSGFFyGXciO9QyEDZ+Xx4SH/25e9t/TTbLCsza3rilVqmaLV0++5HVjTJfFISAPZuihg8Tg6eaFhvUOh/VIrDISIDc8XKn6DkF6RV2zjytOMTnXr8IPvBfsWeZz2nh1WFT2KAeMr3Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083647; c=relaxed/simple;
	bh=20WJ8l5tnAPXinRP6IfA0c7urRNx9gGH1D45kCDVXU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gnUC33QUQVznfWk7caBY6nnSYwTaKCJn23gHCR/nzsOkJHUl7YcQ4hJFHIjvMs3yN+taZiFQiplSp1MUCjHn9ysOSfCPNZnj59rLXAezlgCdfTSNBLVt8tRhVXGUtLQ20d2M7+SjNIHe2IGovwsEgvRjQqnVdz0eaAjKL2G4iu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PkDimKXg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCKVl91005941;
	Fri, 13 Dec 2024 09:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YOevpz2MLuxkICRzP21x45Eg7tfW5k04JKTABMbmho8=; b=PkDimKXgXzrOEWuv
	NmhOijBzCA0ln1wurZA0Sp44OPYVANO2znPmqLiCfJad41oro+853vyarbN4WCt9
	RnNd57+xQ0K4JOPaAP+FKZ1PEdfT8/3uJ+ZFRV7ulgLnONrnLq+dTfawJZjKMDWb
	FuUJYwl7TlAtU41QZADQ+cDxiH9FANv+HIo5oTuuH+xujH6SH0Hnqnb9eaBd4zmS
	gYWI3ssixHCujyRPj74ip1GT1R53L8buPZtVcvP2YKVjH06N6zVJPzGU5Q0eKlHZ
	TCJc8KkZVSO0rNGGUYPJMFAY/YsSq4j4Sv25hqp8FJfWoP5FEeHac1wERY0vWU95
	RwwBqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xusnwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:54:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9rwNA011668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:53:58 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:53:55 -0800
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
Subject: [PATCH v2 17/19] arm64: dts: qcom: Disable USB U1/U2 entry for QDU1000
Date: Fri, 13 Dec 2024 15:22:35 +0530
Message-ID: <20241213095237.1409174-18-quic_prashk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ShL3wqDAwOedFN7ZOykWO0qVzJTDBzVD
X-Proofpoint-GUID: ShL3wqDAwOedFN7ZOykWO0qVzJTDBzVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=443
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130066

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



Return-Path: <linux-arm-msm+bounces-43713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174B9FEDAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A3E3A2408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04BB18A959;
	Tue, 31 Dec 2024 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i1ZoyNS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA2816EB4C;
	Tue, 31 Dec 2024 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632695; cv=none; b=Arh8UqMYi2N1u4MTnx7oQQxikarr/Ymdu5mt4ycb3uxr3aVYrzsWm+3LHYp2UZxCoeAGmG9KpPtss7VSSjv2WUsMRQrsvGHfnjlkshKa9V106FxYFKZ9/sqk7mdazFVk0w7v3RWeFeR6aQ/M5+QdJPvHnwxEBV1yXVvkmVXoa5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632695; c=relaxed/simple;
	bh=M86P9YVZUlrl+qBoqSwO59Qz4BdCacxUEwvIgNQGvo0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r/D1eE2N1fso6PiDx5H88/i3SNDV27kgq8S3L5hL0zkfjpo8mQS/dAyfKwh+/vkp7BHSNyO+XfAw9r0gj3kVyRpMAxwc1S/DSsHOvyEBPlcKRdBX4wBzeze6ZN+o64uf4x/eb5MnVXqYdUgTENjbo1RTN78lj3S65oM3XEBzTlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i1ZoyNS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUJqhlT019833;
	Tue, 31 Dec 2024 08:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NFMBrFspZe95CywdpvJjjq
	blHGy1jZIF8W+c00SmeTY=; b=i1ZoyNS+dZERQOtnmccs9JMKWSwtbm2UAnv/8p
	DVXqaoDpeTM0G8Aso9ANyv6XspSLGRwykkPWDzjpIAys3TdKtDcFl7OFPTBFVNXS
	ydjEai7a00+kt/YZeeM60ix9as8DxYdONqY+ld+83p/8FvJLM9AHqlBr0tuY2uQi
	wnrKQhIdO0qzW4SimzHaf+OQwj/CPClnAZfiIsZhJTCoq/NybRzJF9l0px4/q1Jv
	I7CkgyZK2VgPFo+3hl/uEnN6mvYK45JF3eI6wOV3y8/4XoDfkyiUdT7Bn/wsI5ZN
	TJy0HeMYpau7woj4r/2QLC/UeK/L0IDp1rUpA//dD5Caj+dw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v22g95nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:11:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV8BSIp021155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:11:28 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:11:25 -0800
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
Subject: [PATCH v4 00/17] Disable USB U1/U2 entry for QC ARM64 targets
Date: Tue, 31 Dec 2024 13:40:58 +0530
Message-ID: <20241231081115.3149850-1-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: A8tRMQfyYF8XsoFABIx180y-qTyYJhgU
X-Proofpoint-ORIG-GUID: A8tRMQfyYF8XsoFABIx180y-qTyYJhgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=17 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=69 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=17 mlxscore=17 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310067

Enabling U1 and U2 power-saving states can lead to stability and
performance issues, particularly for latency-sensitive or high-
throughput applications. These low-power link states are intended
to reduce power consumption by allowing the device to enter partial
low-power modes during idle periods. However, they can sometimes
result in unexpected behavior. Over the years, some of the issues
seen are as follows:

1. In device mode of operation, when UVC is active, enabling U1/U2
is sometimes causing packets drops due to delay in entry/exit of
intermittent low power states. These packet drops are often reflected
as Missed Isochronous transfers as the controller was not able to
send the packet in that microframe interval and hence glitches are
seen on the final transmitted video output.

2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
when U1/U2 is enabled. Often when link enters U2, there is a re-
enumeration seen and device is unusable for many use cases.

3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
the cable is disconnected and reconnected to host PC in HS, there
is no link status change interrupt seen and the plug-in in HS doesn't
show up a bus reset and enumeration failure happens.

4. On older targets like SM8150/SM8250/SM8350, there have been
throughput issues seen during tethering use cases.

5. On targets like SDX75, intermittent disconnects were observed
with certain cables due to impedence variations.

To avoid such issues, the USB team at Qualcomm added these quirks
to all targets in the past 4-5 years and extensive testing was done.
Although these are intermittent power states, disabling them didn't
cause any major increase in power numbers.

This series was earlier started by Krishna Kurapati where he disabled
U1/U2 on some SM targets. I'm extending this to more devices including
Auto, Compute and IOT platforms. On a side note, this quirk has been
already included on some mobile targets like SM8550/8650.

Changes in v4:
- Updated prefix in the subject of all patches.
- Split into 2 series for arm and arm64 targets.
- Link to v3:
https://lore.kernel.org/all/20241218102707.76272-1-quic_prashk@quicinc.com/

Changes in v3:
- Removed wrongly added quirks from tcsr_mutex node.
- Link to v2:
https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/

Changes in v2:
- RFC patch was split into series of per-file commits.
- Added the quirks to more targets (Auto, IoT, Mobile, Compute).
- Link to RFC:
https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi

Krishna Kurapati (8):
  arm64: dts: qcom: sm8350: Disable USB U1/U2 entry
  arm64: dts: qcom: sm8450: Disable USB U1/U2 entry
  arm64: dts: qcom: sm8150: Disable USB U1/U2 entry
  arm64: dts: qcom: sm6125: Disable USB U1/U2 entry
  arm64: dts: qcom: sm8250: Disable USB U1/U2 entry
  arm64: dts: qcom: sm6350: Disable USB U1/U2 entry
  arm64: dts: qcom: sc7280: Disable USB U1/U2 entry
  arm64: dts: qcom: sa8775p: Disable USB U1/U2 entry

Prashanth K (9):
  arm64: dts: qcom: sdm630: Disable USB U1/U2 entry
  arm64: dts: qcom: sdm845: Disable USB U1/U2 entry
  arm64: dts: qcom: sdx75: Disable USB U1/U2 entry
  arm64: dts: qcom: qcs404: Disable USB U1/U2 entry
  arm64: dts: qcom: sc7180: Disable USB U1/U2 entry
  arm64: dts: qcom: x1e80100: Disable USB U1/U2 entry
  arm64: dts: qcom: qdu1000: Disable USB U1/U2 entry
  arm64: dts: qcom: sc8280xp: Disable USB U1/U2 entry
  arm64: dts: qcom: sc8180x: Disable USB U1/U2 entry

 arch/arm64/boot/dts/qcom/qcs404.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi  |  2 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  |  6 ++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  6 ++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  6 ++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/sdx75.dtsi    |  2 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi   |  4 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  2 ++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 ++++++++++
 17 files changed, 68 insertions(+)

-- 
2.25.1



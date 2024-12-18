Return-Path: <linux-arm-msm+bounces-42628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6E9F62DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 434F11894F4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 10:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BD11991BB;
	Wed, 18 Dec 2024 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZUlEgLGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05A18DF62;
	Wed, 18 Dec 2024 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734517665; cv=none; b=szLZKuQK1cpguID5uqR0zIgn9EQ9lO751NNglguAcP4AN7ackRTGycRFwacUu23XoJ5503yqj8cZt/ZVYQQLMnmf/mPebNSd0AvzboRVS4Pzi+fWBHwUTbEMLUjZN+QkL368+E+XR8L31FRaGAYvYT+CC8Ns2cDq/MUXYmw9eFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734517665; c=relaxed/simple;
	bh=+TSibuY6ziHutsEsrjuM4q/R6RBns2xedfBiBgSpX8k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OMvZssLp8K3RMJspmVeqOl4tX27OhRLNZrKWwGQQ+ZudZmulhXzmYrpZBed+K2cHS3s92BTjBGroLP6gPkAAUViI1OjxRN6DOu+jLDeZtAF2bhlHJYRQk9Bs70hsnMN7MXk6rk3+oTh+THPQL6h9SeOT7lHBDE/hB7/QDNYMzAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZUlEgLGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI4Xwbd003831;
	Wed, 18 Dec 2024 10:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Dh48K8qgICMwnlTDu0x0L7
	XHn+Xw38dZbuOPBDZX1vw=; b=ZUlEgLGf1kDE3jNVO+davJiX/Yl/NjVDMvTdE3
	Vd0YM4vuLzll7r/6qlPBkaBKYq5ZWOln1VaoJtj6q1B/d5LgX172RItDq6iImLG9
	5nMLctUaajAux6L2Bt7zok2QEoZWcIpRU2QA3EOt95YJwvWOcDC5egHKGLRP97va
	m/eeS1imzopXiKKksQ2qiAKFWevpytMAuRTcA+B5n6JBS18t2OOUC26GJjeYpNsS
	MUNk0UZdkACM6migw0pEufcWeIXM/+wypsIuleNrZvvLSWxgjgtDWpgBwJu3WX9K
	2JZrv/elWozdMLk7jTwnxAg96E+dbkxsaIo14u+8p6sy4MPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kqfsrt3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:27:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIARbvd011870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 10:27:37 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 02:27:34 -0800
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
Subject: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
Date: Wed, 18 Dec 2024 15:56:48 +0530
Message-ID: <20241218102707.76272-1-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: RWqRfUzHt9rXde2H_1hnsbobOSbC3i73
X-Proofpoint-ORIG-GUID: RWqRfUzHt9rXde2H_1hnsbobOSbC3i73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_spam policy=outbound score=70 mlxlogscore=-36 bulkscore=0
 lowpriorityscore=0 spamscore=70 clxscore=1015 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=70 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180084

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

Changes in v2:
- Removed the wrongly added quirks from tcsr_mutex node.
- Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/

Link to RFC:
https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi

Krishna Kurapati (8):
  arm64: dts: qcom: Disable USB U1/U2 entry for SM8350
  arm64: dts: qcom: Disable USB U1/U2 entry for SM8450
  arm64: dts: qcom: Disable USB U1/U2 entry for SM8150
  arm64: dts: qcom: Disable USB U1/U2 entry for SM6125
  arm64: dts: qcom: Disable USB U1/U2 entry for SM8250
  arm64: dts: qcom: Disable USB U1/U2 entry for SM6350
  arm64: dts: qcom: Disable USB U1/U2 entry for SC7280
  arm64: dts: qcom: Disable USB U1/U2 entry for SA8775P

Prashanth K (11):
  arm64: dts: qcom: Disable USB U1/U2 entry for SDM630
  arm64: dts: qcom: Disable USB U1/U2 entry for SDM845
  arm64: dts: qcom: Disable USB U1/U2 entry for SDX75
  ARM: dts: qcom: Disable USB U1/U2 entry for SDX65
  ARM: dts: qcom: Disable USB U1/U2 entry for SDX55
  arm64: dts: qcom: Disable USB U1/U2 entry for QCS404
  arm64: dts: qcom: Disable USB U1/U2 entry for SC7180
  arm64: dts: qcom: Disable USB U1/U2 entry for X1E80100
  arm64: dts: qcom: Disable USB U1/U2 entry for QDU1000
  arm64: dts: qcom: Disable USB U1/U2 entry for SC8280XP
  arm64: dts: qcom: Disable USB U1/U2 entry for SC8180X

 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi |  2 ++
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi |  2 ++
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
 19 files changed, 72 insertions(+)

-- 
2.25.1



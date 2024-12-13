Return-Path: <linux-arm-msm+bounces-41927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 197969F0888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C936C2821D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5951B412E;
	Fri, 13 Dec 2024 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iZbsOfEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D481B392D;
	Fri, 13 Dec 2024 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734083578; cv=none; b=kggWKC1fH8T0UUjgvE8bYSw2ZDlNpU/5m3utcW9HgJMwJ9yy88jyLYr2zHjQommwqf1yz7+qp/6EfZUpnqUgtaKmAaNoHvmoabqNzhv4lFRinM6sb/8UDxPf6Ho3Nr5lcfof8b/cxzwSIPHSL4IcTEISLoICMwOdXiKNCt7iW7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734083578; c=relaxed/simple;
	bh=D5x1kjQyUtSBg2dv5lB3maUl34jpfbsFMh2+wuE7EW8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W0PSFMdamLlLzNvUXcavUnGqSTys9xiDq1raHjvuQAY/X+VzvVmakZNafO+05QlPjNFR24toz2uUr+/f0Z/9c2H166TNkV5K0S849S/BSWgG3Do+9oJF6AeH70ztdx+Gd6u1JKAWyi5mL4aDLujLCnYCZSUVhE5pJivUfsxy3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iZbsOfEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9p2Hk018175;
	Fri, 13 Dec 2024 09:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=InPO1+WU5YDK73QFww1bpH
	G1jn5Y75852Jo3G2q1r/Y=; b=iZbsOfEzX/sgc5qNjYIntJnvwAKzaTsmjr0+Gg
	YDrxuQPSKf8G3uEaLBAS0nOb6TgaOQCST5PwjUvfP1r1uO/fFZ23HudDQPLRmfiC
	77VXhuZ67JW3eExvdfJrsw4SlMFaAJpzoQ8rJ1HJ5/TTtYU5GqIVTCgnHLCl5Xq8
	SJ8E3GoN5DfTcI3/34Hx3LzfJcyY30VvuFz7BN6v0ImMs9emL9BuSdm5iVxDGxh3
	DGzUaU83dbqDAlG/JaikYA5n9dE6F68T76Of8KK0PK6f4VMRHvhv6bZd6PAwjQEv
	TS69W69L82uEnq6M3VaWVoQO9UndWbabC1CiBKp9q6HfmElA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjnb003r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:52:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD9qqCA008828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 09:52:52 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 01:52:47 -0800
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
Subject: [PATCH v2 00/19] Disable USB U1/U2 entry for QC targets
Date: Fri, 13 Dec 2024 15:22:18 +0530
Message-ID: <20241213095237.1409174-1-quic_prashk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HUBxptbCLdjxbbemU0tGQhxtfXkqnfoc
X-Proofpoint-GUID: HUBxptbCLdjxbbemU0tGQhxtfXkqnfoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_spam policy=outbound score=52 spamscore=52 lowpriorityscore=0
 bulkscore=0 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 mlxscore=52 suspectscore=0 mlxlogscore=-2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130067

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

Link to v1:
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
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  |  8 ++++++++
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
 19 files changed, 74 insertions(+)

-- 
2.25.1



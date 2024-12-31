Return-Path: <linux-arm-msm+bounces-43710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71049FEDA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A7F27A1424
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BBA18A6A1;
	Tue, 31 Dec 2024 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KKGcSofq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39325188CA9;
	Tue, 31 Dec 2024 08:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632595; cv=none; b=HOcips1EIzdkgJbVEvyXczAVSDH1Fagx5fdmwGJAVfspe3sIh7gbC74jz85EaXa2l1XqQbOfm6yvqbHGpyzExnzyOgEZTHU2PNQx82SVCPb0MPQfuvrRPVJIaAbFeqFE2SSVEXOMkQ8qetDUupfbrCZKirf47/mx7Kctn5M+Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632595; c=relaxed/simple;
	bh=f4FpQ3AYTRHQ3om7AGHgyd0QjXDCbvmmVjkL8/5wCwA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qixBuRCrpLqqnOaZAvFQwWBHIYbRVHSSPioMIP0vtZ9Of62cAAygzJM9qoLuKSresEnmOo/hVJHPsRZb+g7+gwxbD/WxNZXRxe62PKfqLylgOaEqmFxe5fbHrSEGEPAL9DkRo+AsWmuj7W0RxBqgLSwNb3G888DSwoQJ0DWRxNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KKGcSofq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV4qXEt019024;
	Tue, 31 Dec 2024 08:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JYC2gFfL9Ctijpe0COODuu
	NI30zZ8sbIkqxmmz0/WEU=; b=KKGcSofqS7YwK9rg9TcY2bGUoXZ9kqhWhTHtpQ
	n8XxsNP3ln6b0UvLA2JsTHcwhNVetlbyL/JqmchMEGoHJd8IQE4xON7aQEdNIrHn
	PFERa9n47qecwyWD5LWGegAp2i+OjCXoA6opQm2x0K7+q28++3cAxJNqOVEgg3Jg
	uHV2n+/9lHoH13KclJ/pPp0tQJchWBJXxFyZ2cVqmG8gSulOn/x1OGoXPyoqKoM2
	wCO/kpm7LcT86e8l4H/2G6eX+MZtY56Bk6FwklIq7cGrNCMIqqq56PAKy4q6ipgi
	cGlnePFOdJC6S455Yxkhbimi53++GvDsLfhvqpMzNnGmDlHg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v9yk8cvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:09:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV89mfa029699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:09:48 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:09:44 -0800
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
Subject: [PATCH v4 0/2] Disable USB U1/U2 entry for QC ARM targets
Date: Tue, 31 Dec 2024 13:39:30 +0530
Message-ID: <20241231080932.3149448-1-quic_prashk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kyA8n1x6q7Q2ZXkFArfTM4OLUYIAY4j_
X-Proofpoint-GUID: kyA8n1x6q7Q2ZXkFArfTM4OLUYIAY4j_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=23 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=23
 clxscore=1015 malwarescore=0 adultscore=0 mlxscore=23 mlxlogscore=52
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310067

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

Prashanth K (2):
  ARM: dts: qcom: sdx65: Disable USB U1/U2 entry
  ARM: dts: qcom: sdx55: Disable USB U1/U2 entry

 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 ++
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.25.1



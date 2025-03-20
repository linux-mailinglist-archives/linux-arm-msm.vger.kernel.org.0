Return-Path: <linux-arm-msm+bounces-52079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E32A6A555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 12:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F638A0B48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82356227B8E;
	Thu, 20 Mar 2025 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g5MJi3Ke"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEEB226CF4;
	Thu, 20 Mar 2025 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471142; cv=none; b=NCNcN18DnuH4SNvEb3aHVz+m5LOdhD65YgZacaFVWe2zVNN7ZURI/mWLmlWy5ppwvZXUsMtSYyit7ix88Z4INCDuaprkBHWzz2QhTdnp+ZQTPnUmFv7MQFhcQVqEeejNSHTZAdo2Olw75y+jPl4q/0Ki66TTQDiNhne3/TXoyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471142; c=relaxed/simple;
	bh=AiG8zpJ+4Lzdhs3ZkkOdbU49oRwheNJ+GLQss5hysdI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvGOr6vrleXrhLSpGKqhZk0JH6/ZybU6Hjzl9eaFBEuv64qabM/JPJmGedVEAToCIzb+WN+777F/1ovr5XwwWLFZFL5qxR+9jZK68k6Uig30WwTMErXDtLnLgJLYV2dSU34FulMS/gm4ACzLsVVUics758TWEWpb12di8oenv7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g5MJi3Ke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K6Z6EL014273;
	Thu, 20 Mar 2025 11:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PVBeExWVDEEnGUKR4gEguT4G
	uIAycJmRZQQVissjodY=; b=g5MJi3KeqHzpf9S+Fe2RzqjwApOawCQ1yQ5vzFpv
	zezgbjNWdYOo0e6xYphqVfQBt3gyM87u7z6waBu0TmwkHITcwUDEOG4SQN3zcQ2f
	+k0+WqRbLaV0iEZucTBHMsrRdM5nYJf1013CY3MjO5wRmDKCHa8Mo9sMMq2uFyGx
	Lztw0XDgnjF++OgyK7HIZ+slSWAy+2yHfN/XOCdTQbQjjD24gU6R6O7DnjtxWSPC
	q1ftPTY+X/bbg7+8ENJiT2IK3ir7jvYswkAN0DatmmkOUQOFeC0MZZh3fQnPLBDQ
	vZQzEytQ5JWH2b6NvTuSy1jpsMCnpVNpnIS5y8yER17Qng==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g09f2ytc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 11:45:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52KBjZT5014641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 11:45:35 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Mar 2025 04:45:28 -0700
Date: Thu, 20 Mar 2025 17:15:19 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <Z9v/z/i6OyWXXe7N@hu-wasimn-hyd.qualcomm.com>
References: <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
 <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
 <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
 <Z8AWHiVu05s0RJws@hu-wasimn-hyd.qualcomm.com>
 <a8991221-88b2-4a39-a51b-587c4cdeebe4@kernel.org>
 <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
 <Z8lb889QrqluPXXl@hu-wasimn-hyd.qualcomm.com>
 <e00a7061-5283-4809-b652-5f6c5e1e4496@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e00a7061-5283-4809-b652-5f6c5e1e4496@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=BvKdwZX5 c=1 sm=1 tr=0 ts=67dbffe0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=YMAUWDJ-R26CST9i6d4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: PllAftRfbZnpMCrct6k3NwDDmHFYS3YS
X-Proofpoint-GUID: PllAftRfbZnpMCrct6k3NwDDmHFYS3YS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200071

Hi Krzysztof,

> >>
> >> Which piece of actual hardware is represented in qcom-ride-common?
> >>
> > 
> > All daughter cards like SOC-card, display, camera, ethernet, pcie, sensor, etc.
> 
> No, I asked about the name of the hardware, datasheet, ID or picture.
> Common DTSI represents somoething, not just because you wanted to add
> something you had in downstream.
> 

Currently we don't have any datasheet or document which is publicly
available, so I will try my best to describe our HW.

Ride is a modular hardware system with several smaller daughter cards
connected to single backplane board and each daughter card is stacked on
top of each other. I will try to explain each daughter card with HW
components and how it is connected to construct the ride-hw.

Backplane board:
  - It contains an MCU (Aurix TC397), CAN/LIN transceiver,
	Audio/GNSS/IMU-I2C signals, Fan header
  - It holds & connects all the daughter cards.

SoC card:
  - It contains:
    - SoM:
      - One of QCS9075M/QCS9100M/QAM8775p SoM.
	  - Each SoM is composed of either qcs9075/qcs9100/sa8775p SoC, along
		with DDR & PMICs.
      - Each SoM can be mounted to same SoC-daughter card of ride-hw.
    - In addition to SoM, it also has
      - 4x UART, 2x USB 3.1 & 1x USB 2.0
      - Memory: 1x OSPI, 2x UFS-3.1
      - Debug: JTAG/QDSS header
      - PCIe0, PCIe1 & Display signals
      - Reset button
  - It is connected to backplain board via B2B connector.

Display card:
  - It contains:
    - 4 eDP ports & 2 DSI-DP bridge
    - I2C GPIO expander & I2C switch
  - It is connected to SoC-card via B2B connector.

Camera card:
  - It contains:
    - 4 Quad DE-serializer, each supporting 4 MIPI CSI inputs
    - Total upto 16 Cameras ports are supported.
  - It is connected to backplain board via B2B connector.

Ethernet card:
  - There are two variants of ethernet card each with different
	capabilities:
    - [Ethernet-v1] card contains:
      - 2x 1G RGMII phy, 2x 1G SGMII phy(enabled currently)
	  - Total 4 phy supported, only 2 phy are enabled and it is used in
		ride.
    - [Ethernet-v2] card contains:
	  - 2x 1G RGMII phy, 2x 2.5G HSGMII(enabled currently) & 10G PCIe based
		MAC+PHY controller
	  - Total 5 phy supported, only 2 phy are enabled and it is used in
		ride-r3.
  - Either [Ethernet-v1] or [Ethernet-v2] is connected to backplain board
	via B2B connector.

PCIe card:
  - It contains:
    - PCIe connections to SoC-card
	- NVME, 2x WLBT module QCA6696/QCA6698 (Wi-Fi & bluetooth solution) &
	  GNSS module
  - It is connected to backplain board via B2B connector & PCIe signals are
	connected to SoC card via flyover cables.

Sensor Card:
  - It contains 3-Axix compass & 6-Axis 3D IMU (accel/gyro) module which
	are communicating via I2C
  - It is connected to backplain board via B2B connector.

Front panel card:
  - It does not contain any active circuitry, only ports are available
    - Audio-in/out ports
    - USB hub ports
    - CAN/LIN ports
    - 12V power off switch
  - It is connected to backplain board via ribbon cable.

> 
> > 

> >> |             |                      | +-------------------------+-----------------------+-----------------< sa8775p-ride-common.dtsi           |
> 
> 
> There is no ride-common hardware. If there is, send us any proof of its
> existence. all your statements here show you want to create some
> structure because you like it. I don't think you get my questions. You
> painted diagram of DTS, not hardware.
> 
> We talk about hardware. Not your DTS. Drop all DTSI, DTS, DTSO from here
> and show us the hardware.
> 

Considering outlined h/w description, following are ride configuration
variation each platform supporting:

Between qcs9075, qcs9100 & sa8775p ride/ride-r3 boards, SoM is changing;
And between ride & ride-r3 ethernet is changing.
Excluding these differences all other cards i.e SoC, display, camera, PCIe,
sensor, front & backplain are same and are refactored in ride-common.
If any variant of these cards comes up in future we need to refactor
ride-common accordingly. I will try to outline this as clearly as possible
in next commit log.

Considering current outlines of all daughter cards, following defines
ride/ride-r3 variant boards:
  - sa8775p ride    : QAM8775p SoM + [Ethernet-v1] + other daughter cards
  - sa8775p ride-r3 : QAM8775p SoM + [Ethernet-v2] + other daughter cards
  - qcs9100 ride-r3 : QCS9100M SoM + [Ethernet-v2] + other daughter cards
  - qcs9075 ride-r3 : QCS9075M SoM + [Ethernet-v2] + other daughter cards

Since we don't have a document yet which formally describes
qcs9075/qcs9100 ride board with [Ethernet-v1] card, I shall be dropping
this particular variant in next patch series and re-send after complete
documentation is available.

> > Actually we are not including dts here instead *.dtso file will be
> > overlayed to *-ride.dts to generate *-ride-r3.dts.
> > 
> > Below is the correct arrow sequence.
> 
> And the overlay represents what exactly? Different board? No, that's not
> how overlays should be used.
> 
> You have different board, you have different DTS.
> 

No the overlay is not a different ride board. This overlay represents
[Ethernet-v2] card which is different than [Ethernet-v1] card.

We thought of using overlay as otherwise we have to create separate board
DTS to support [Ethernet-v2] cards.

> 
> > 


> >> |                                    +-------------------------+-----------------------+-------------------< sa8775p-ride-ethernet-aqr115c.dtso |
> 
> How does "sa8775p-ride-ethernet-aqr115c" hardware look like?
> 

Here sa8775p-ride-ethernet-aqr115c.dtso is representing [Ethernet-v2] card.

> 
> Several companies solved it - most of NXP vendors, many Renesas etc. I
> really do not get why this needs so much talk and you cannot learn from
> their architecture how SoM should be represented.
> 

Our SoM is separate HW which is reusable in ride-hw. Can you share more
details on what we can improve here?


Thanks & regards,
Wasim


Return-Path: <linux-arm-msm+bounces-49636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA8A476B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84B83ACE1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 07:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D212121D587;
	Thu, 27 Feb 2025 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NGgMx6H0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7B1EB194;
	Thu, 27 Feb 2025 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740641846; cv=none; b=q65mdNHTJJidhSqVMM9G+8Yhqnh0sVsFbu0ytmJCIj/qQ3cRjbGOtq5Ndefezt42GCEuMeITrh8s4ilnp7RXvlbGwEwy1tHuJ8UCojzHIZpAnvh0SeamO9IDJQyhL+Iy/1IkhFeP8kMIcPxU7855tZYVZIxeLrUjb9Waar+puAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740641846; c=relaxed/simple;
	bh=d6+xsNMLGylxxEKXWbWqVK7LJVxyIb/Mz0Pc9ABIaXY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s32lJs9VLRiKpKU4sHz0LpfXDlJ0HS0iLErpy5jjaTnvfjgptshkx3mxfoWJkOh4fATit6Zvaz9Shznqa2FsmgkCuAGPyJstbVwIBm0mgKA0jlrz4c4L5jbCK8H4onIn0AaqTHiGJGQFGuyD/s55EvYLh+Q3B19UE7ZxLpM2F1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NGgMx6H0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKrh46017852;
	Thu, 27 Feb 2025 07:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EZhXB7z7YOzRnW+XxlpcUTeG
	X2DctPRP+TSIzjsr4os=; b=NGgMx6H0DlHKHOQoJfzsGPANqtnF2yrTHN1mFrm7
	3NcryYbQECZDgp4IXB1FspIVscjG8wgLLs4BTTju0m7UFIp7Y/anG5q9Zhh1AFGS
	YXRZgVfnKYC5AhRwTvF5ptyHqnrEk7qdJnrBazgZCm0HZOCOp+x2CeTMuQ/KwuzI
	EZWaw+7FvEP3IzbRdYAlYweatp30vxpVQxGx9akiGNyCTiXfuh/v668uNiu6MUDo
	6i1yhyDOz9f3zQpPrWzJ2rNc7Cu5B4AnihcE7tvjwhFSOIWleiCiFV+i5H/iioA3
	MvtvHJchL3khbMnpJxPhzJU67cFUEu7yQ7Kixe87LJVuVA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn4s24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 07:37:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R7bJ07017861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 07:37:19 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 23:37:11 -0800
Date: Thu, 27 Feb 2025 13:07:02 +0530
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
Message-ID: <Z8AWHiVu05s0RJws@hu-wasimn-hyd.qualcomm.com>
References: <4wmxjxcvt7un7wk5v43q3jpxqjs2jbc626mgah2fxbfuouu4q6@ptzibxe2apmx>
 <Z3eMxl1Af8TOAQW/@hu-wasimn-hyd.qualcomm.com>
 <xuy6tp4dmxiqbjitmoi6x5lngplgcczytnowqjvzvq5hh5zwoa@moipssfsgw3w>
 <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
 <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
 <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
 <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bVkyS-N2-HDk6rlfPnogYgbU2vuiEstj
X-Proofpoint-GUID: bVkyS-N2-HDk6rlfPnogYgbU2vuiEstj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_03,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270057

On Wed, Jan 15, 2025 at 09:35:34AM +0100, Krzysztof Kozlowski wrote:
> On 15/01/2025 06:48, Wasim Nazir wrote:
> >> The the SoC, I am asking about the board. Why each of them is for
> >> example r3?
> >>
> >> So this is not sufficient explanation, nothing about the board, and
> >> again just look Renesas and NXP.
> >>
> > 
> > Hi Krzysztof,
> > 
> > sa8775p(AUTO), qcs9100(IOT), qcs9075(IOT) are different SoCs based on
> > safety capabilities and memory map, serving different purpose.
> > Ride & Ride-r3 are different boards based on ethernet capabilities and
> > are compatible with all the SoCs mentioned.
> 

Hi Krzysztof,

> Compatible? What does it mean for a board?
> 

Ride board is based on multiple daughter cards (SOC-card, display,
camera, ethernet, pcie, sensor, etc.).

The SOC is not directly soldered to Ride board, instead SOC is soldered
on SIP (System in Package) card which can be mounted on SOC-daughter card of
Ride board.
	- SoC => SIP-card => SOC-daughter-card (Ride)

Together with SIP cards and other daughter cards we are creating different
<soc>-Ride Variants with differences in memory map & thermal mitigations.

The SIP card consists of SOC, PMIC & DDR and it is pin compatible to the
SOC daughter card of <soc>-Ride board. Only SOC is changing accross SIP
cards, except an additional third party SIL-PMIC for SAIL, which is not
present in QCS9075 Ride.

Other daughter cards remains same for <soc>-Ride variants, except
ethernet card which is different for <soc>-Ride rev3 variants.

So the Ride board (combination of daughter cards) is same across the SIP,
while SOC on SIP card is changing which can be sa8775p, qcs9100 or qcs9075.

> Third time: did you look how other vendors do it?
> 

Yes, we have reviewed other vendors. However, please feel free to share
any specific reference you would like us to follow.

Here are few reference files we found from other vendors where similar
tasks are performed which includes code refactoring and HW modularity:
 - Freescale: fsl-ls208xa.dtsi, fsl-ls2088a.dtsi, fsl-ls2081a-rdb.dts
 - Renesas: white-hawk-common.dtsi, r8a779g0-white-hawk.dts
 - Rockchip: px30-engicam-common.dtsi, px30-engicam-ctouch2.dtsi,
   px30-engicam-px30-core-ctouch2.dts

In our case along with describing the HW, code refactoring is also done
which might be causing confusion, but we are ready for any inputs for
correction.

Putting this pictorial diagram for updated DT structure depicting our HW.
 - qcs9xxx-module.dtsi specifying QCS9xxx based SIP card/module having
   SoC, PMICs, Memory-map updates.
 - qcom-ride-common.dtsi specifying ride daughter boards, here we are
   doing code refactoring also as this is common for all ride boards.
 - qcom-ride-ethernet-aqr115c.dtso specifying ethernet overlay board which
   uses 2.5G phy and can be overlayed to ride boards to get ride-r3.
   By default ride uses 1G phy.
 - qcs9075-iq-9075-evk.dts is the new name for RB8 as per new product
   name. We will be changing this in next patch series.

+-----------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                                                               |
|                                                          sa8775p.dtsi                                                                         |
|                                                              |                                                                                |
|                                    +-------------------------+-----------------------+                                                        |
|                                    |                         |                       |                                                        |
|                                    v                         |                       v                                                        |
|                             qcs9075-module.dtsi              |                qcs9100-module.dtsi                                             |
|                                    |                         |                       |                                                        |
|                                    v                         v                       v                                                        |
|                                  (IOT)                    (AUTO)                   (IOT)                                                      |
|                                    |                         |                       |                                                        |
|             +----------------------+                         |                       |                                                        |
|             |                      |                         |                       |                                                        |
|             |                      | +-------------------------+-----------------------+-------------------< qcom-ride-common.dtsi            |
|             |                      | |                       | |                     | |                                                      |
|             v                      v v                       v v                     v v                                                      |
|  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
|                                    |                         |                       |                                                        |
|                                    | +-------------------------+-----------------------+-------------------< qcom-ride-ethernet-aqr115c.dtso  |
|                                    | |                       | |                     | |                                                      |
|                                    v v                       v v                     v v                                                      |
|                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
|                                                                                                                                               |
+-----------------------------------------------------------------------------------------------------------------------------------------------+

> > 
> > With the combination of these 3 SoCs and 2 boards, we have 6 platforms,
> > all of which we need.
> > - sa8775p-ride.dts is auto grade Ride platform with safety feature.
> > - qcs9100-ride.dts is IOT grade Ride platform with safety feature.
> > - qcs9075-ride.dts is IOT grade Ride platform without safety feature.
> > 
> > Since the Ride-r3 boards are essentially Ride boards with Ethernet
> > modifications, we can convert the Ride-r3 DTS to overlays.
> How one board can be with multiple SoCs? If it is soldered, it's close
> to impossible - that's just not the same board. If it is not soldered,
> why you are not explaining it? What is Ride board? What is there? What
> can go there? How it can be used in other SoCs? Or for which SoCs? Is
> there a datasheet available?
> 

As our SoC is based on SIP card and SIP card is compatible with Ride
board, we could able to use same Ride board (which is combination of
multiple daughter cards) with multiple SIP cards.
These SIP cards can be of sa8775p, qcs9100 or qcs9075 SOC.

> You keep repeating my about SoC and I keep responding the same: don't care.
> 
> Best regards,
> Krzysztof

Thanks & Regards,
Wasim


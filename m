Return-Path: <linux-arm-msm+bounces-50455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC9A544CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C37317242C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DDA1FC11F;
	Thu,  6 Mar 2025 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UrQHgMRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431331C7000;
	Thu,  6 Mar 2025 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249547; cv=none; b=JRJs7/nyV4cdngj3T0mKxIjury1VtwGAuZJrgmhyOL68wQ77POYOgbJLuq/dXyD7DueRcj/zo0E9Cx9MX23VZkiPnMIS/NFbsDk2uCzypk/pBWyqkSYaIKWjz/+Mp9QpqWmB0XJqB2mtP18CXUbXKIH78ElPsPq1hOhbqcg9aB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249547; c=relaxed/simple;
	bh=3m56HwLijw9VVrjw2br8JTDtKj+ANzmMTldXyw0gsYk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mx7niLJSwaHFZVF8u4wv9vjvfCIfT575v+lSf0Tp0m5iauRBwgeJAZS1n2Xlm1tCRrivcIQDBKCCRySRkHSFvqpf2LFdFkSffJkxtWtwerWDSHiyYAraWHbRpM3sYSHpex/YVYmTyAXPyynWbFB6GY0vPjIa1qqhyq3w9G1Y7P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UrQHgMRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LqkgQ005689;
	Thu, 6 Mar 2025 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2JlKo72XqbHp8TzRdd0Ae0uxQJj6y8EJ7hPwXkcSpFU=; b=UrQHgMRCt74Keza9
	KmHIYYn/5Vk+QBwNvDLtjxYEHobX1TIlmecLRmFVn2KQxxsPCnF3TNkFsrDPV2uG
	xazi0LHSkXX6reQJUO96gyN8X/rw2Z3NcYt8uOcdDkvc1J9CuQr2YSdEkK3tM7L7
	nLYo6oRbSyvwdLrUITfUz41uTKKruWmeGBPVwqYYKLavuZj4ZD5jD76B2cqAN2E7
	YOVVXxG3ljWXNFaSm692TKlI4jBEjohSfPcrGH4+24geP91H5XOJMm+XtV0YA0hU
	4e5qKPYmeFgbAjKRyO5Jjx0xlFmgqHUwxEyRZQjvwNT0HfT87f9we+HEjwfsKLtb
	Vnu1Fg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tr8sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:25:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268Pccg009345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:25:38 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 00:25:32 -0800
Date: Thu, 6 Mar 2025 13:55:23 +0530
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
Message-ID: <Z8lb889QrqluPXXl@hu-wasimn-hyd.qualcomm.com>
References: <Z3gzezBgZhZJkxzV@hu-wasimn-hyd.qualcomm.com>
 <37isla6xfjeofsmfvb6ertnqe6ufyu3wh3duqsyp765ivdueex@nlzqyqgnocib>
 <67b888fb-2207-4da5-b52e-ce84a53ae1f9@kernel.org>
 <Z3/hmncCDG8OzVkc@hu-wasimn-hyd.qualcomm.com>
 <b0b08c81-0295-4edb-ad97-73715a88bea6@kernel.org>
 <Z4dMRjK5I8s2lT3k@hu-wasimn-hyd.qualcomm.com>
 <80e59b3b-2160-4e24-93f2-ab183a7cbc74@kernel.org>
 <Z8AWHiVu05s0RJws@hu-wasimn-hyd.qualcomm.com>
 <a8991221-88b2-4a39-a51b-587c4cdeebe4@kernel.org>
 <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z8laCxtHOdNm3rRu@hu-wasimn-hyd.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c95c03 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=I14zcgCu20LTj4TMwbAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: EzgHzsUYtzVMqX83vGv-_HoAWNSSY4_X
X-Proofpoint-ORIG-GUID: EzgHzsUYtzVMqX83vGv-_HoAWNSSY4_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=964 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060062

On Thu, Mar 06, 2025 at 01:47:15PM +0530, Wasim Nazir wrote:
> On Mon, Mar 03, 2025 at 08:46:55AM +0100, Krzysztof Kozlowski wrote:
> > On 27/02/2025 08:37, Wasim Nazir wrote:
> > > On Wed, Jan 15, 2025 at 09:35:34AM +0100, Krzysztof Kozlowski wrote:
> > >> On 15/01/2025 06:48, Wasim Nazir wrote:
> > >>>> The the SoC, I am asking about the board. Why each of them is for
> > >>>> example r3?
> > >>>>
> > >>>> So this is not sufficient explanation, nothing about the board, and
> > >>>> again just look Renesas and NXP.
> > >>>>
> > >>>
> > >>> Hi Krzysztof,
> > >>>
> > >>> sa8775p(AUTO), qcs9100(IOT), qcs9075(IOT) are different SoCs based on
> > >>> safety capabilities and memory map, serving different purpose.
> > >>> Ride & Ride-r3 are different boards based on ethernet capabilities and
> > >>> are compatible with all the SoCs mentioned.
> > >>
> > > 
> > > Hi Krzysztof,
> > > 
> > >> Compatible? What does it mean for a board?
> > >>
> > > 
> > > Ride board is based on multiple daughter cards (SOC-card, display,
> > > camera, ethernet, pcie, sensor, etc.).
> > > 
> > > The SOC is not directly soldered to Ride board, instead SOC is soldered
> > > on SIP (System in Package) card which can be mounted on SOC-daughter card of
> > > Ride board.
> > > 	- SoC => SIP-card => SOC-daughter-card (Ride)
> > 
> > 
> > So basically pretty like other designs using SoM.
> > 
> > > 
> > > Together with SIP cards and other daughter cards we are creating different
> > > <soc>-Ride Variants with differences in memory map & thermal mitigations.
> > > 
> > > The SIP card consists of SOC, PMIC & DDR and it is pin compatible to the
> > > SOC daughter card of <soc>-Ride board. Only SOC is changing accross SIP
> > > cards, except an additional third party SIL-PMIC for SAIL, which is not
> > > present in QCS9075 Ride.
> > 
> > Just like every SoM
> > 
> > > 
> > > Other daughter cards remains same for <soc>-Ride variants, except
> > > ethernet card which is different for <soc>-Ride rev3 variants.
> > > 
> > > So the Ride board (combination of daughter cards) is same across the SIP,
> > > while SOC on SIP card is changing which can be sa8775p, qcs9100 or qcs9075.
> > > 
> > >> Third time: did you look how other vendors do it?
> > >>
> > > 
> > > Yes, we have reviewed other vendors. However, please feel free to share
> > > any specific reference you would like us to follow.
> > > 
> > > Here are few reference files we found from other vendors where similar
> > > tasks are performed which includes code refactoring and HW modularity:
> > >  - Freescale: fsl-ls208xa.dtsi, fsl-ls2088a.dtsi, fsl-ls2081a-rdb.dts
> > 
> > That's an unexpected choice - I would rather look at dozen of SoMs for
> > iMX platforms.
> > 
> > >  - Renesas: white-hawk-common.dtsi, r8a779g0-white-hawk.dts
> > >  - Rockchip: px30-engicam-common.dtsi, px30-engicam-ctouch2.dtsi,
> > >    px30-engicam-px30-core-ctouch2.dts
> > > 
> > > In our case along with describing the HW, code refactoring is also done
> > > which might be causing confusion, but we are ready for any inputs for
> > > correction.
> > 
> > I don't understand why this was not properly described since beginning.
> > You had the hardware in your hands and went with incomplete or even
> > incorrect hardware description.
> > 
> > > 
> > > Putting this pictorial diagram for updated DT structure depicting our HW.
> > >  - qcs9xxx-module.dtsi specifying QCS9xxx based SIP card/module having
> > >    SoC, PMICs, Memory-map updates.
> > >  - qcom-ride-common.dtsi specifying ride daughter boards, here we are
> > >    doing code refactoring also as this is common for all ride boards.
> > >  - qcom-ride-ethernet-aqr115c.dtso specifying ethernet overlay board which
> > >    uses 2.5G phy and can be overlayed to ride boards to get ride-r3.
> > >    By default ride uses 1G phy.
> > >  - qcs9075-iq-9075-evk.dts is the new name for RB8 as per new product
> > >    name. We will be changing this in next patch series.
> > > 
> > > +-----------------------------------------------------------------------------------------------------------------------------------------------+
> > > |                                                                                                                                               |
> > > |                                                          sa8775p.dtsi                                                                         |
> > > |                                                              |                                                                                |
> > > |                                    +-------------------------+-----------------------+                                                        |
> > > |                                    |                         |                       |                                                        |
> > > |                                    v                         |                       v                                                        |
> > > |                             qcs9075-module.dtsi              |                qcs9100-module.dtsi                                             |
> > 
> > So this is the SoM?
> 
> Yes this is SoM.
> 
> > 
> > > |                                    |                         |                       |                                                        |
> > > |                                    v                         v                       v                                                        |
> > > |                                  (IOT)                    (AUTO)                   (IOT)                                                      |
> > > |                                    |                         |                       |                                                        |
> > > |             +----------------------+                         |                       |                                                        |
> > > |             |                      |                         |                       |                                                        |
> > > |             |                      | +-------------------------+-----------------------+-------------------< qcom-ride-common.dtsi            |
> > 
> > Which piece of actual hardware is represented in qcom-ride-common?
> > 
> 
> All daughter cards like SOC-card, display, camera, ethernet, pcie, sensor, etc.
> 
> > > |             |                      | |                       | |                     | |                                                      |
> > > |             v                      v v                       v v                     v v                                                      |
> > > |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
> > > |                                    |                         |                       |                                                        |
> > > |                                    | +-------------------------+-----------------------+-------------------< qcom-ride-ethernet-aqr115c.dtso  |
> > > |                                    | |                       | |                     | |                                                      |
> > > |                                    v v                       v v                     v v                                                      |
> > > |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
> > 
> > I think I gave already few times that answer: No. You cannot reference
> > from a module.c another .c file. You cannot reference DTS from DTS.
> > 
> > Strictly speaking you can, of course, but you must not. That's not how
> > source code is done to be manageable and readable.
> 
> Ah the arrow is leading to confusion.
> 
> Actually we are not including dts here instead *.dtso file will be
> overlayed to *-ride.dts to generate *-ride-r3.dts.
> 
> Below is the correct arrow sequence.
> 
> |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
> |                                    |                         |                       |                                                        |
> |                                    +-------------------------+-----------------------+---------------------< qcom-ride-ethernet-aqr115c.dtso  |
> |                                    |                         |                       |                                                        |
> |                                    v                         v                       v                                                        |
> |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
> 
> > 
> > > |                                                                                                                                               |
> > > +-----------------------------------------------------------------------------------------------------------------------------------------------+
> > > 
> > >>>
> > >>> With the combination of these 3 SoCs and 2 boards, we have 6 platforms,
> > >>> all of which we need.
> > >>> - sa8775p-ride.dts is auto grade Ride platform with safety feature.
> > >>> - qcs9100-ride.dts is IOT grade Ride platform with safety feature.
> > >>> - qcs9075-ride.dts is IOT grade Ride platform without safety feature.
> > >>>
> > >>> Since the Ride-r3 boards are essentially Ride boards with Ethernet
> > >>> modifications, we can convert the Ride-r3 DTS to overlays.
> > >> How one board can be with multiple SoCs? If it is soldered, it's close
> > >> to impossible - that's just not the same board. If it is not soldered,
> > >> why you are not explaining it? What is Ride board? What is there? What
> > >> can go there? How it can be used in other SoCs? Or for which SoCs? Is
> > >> there a datasheet available?
> > >>
> > > 
> > > As our SoC is based on SIP card and SIP card is compatible with Ride
> > > board, we could able to use same Ride board (which is combination of
> > > multiple daughter cards) with multiple SIP cards.
> > > These SIP cards can be of sa8775p, qcs9100 or qcs9075 SOC.
> > 
> > Describe properly the hardware - if you have a module or SIP if you
> > decide not to use industry-standard naming (but why...), then describe
> > it in DTSI.
> 
> We refer to it as ‘module’ in our datasheet, so I use the same term
> here. Thanks for pointing it out; we can proceed with the SoM name.
> 
> Below is the updated diagram:
> +-----------------------------------------------------------------------------------------------------------------------------------------------+
> |                                                                                                                                               |
> |                                                          sa8775p.dtsi                                                                         |
> |                                                              |                                                                                |
> |                                    +-------------------------+-----------------------+                                                        |
> |                                    |                         |                       |                                                        |
> |                                    v                         |                       v                                                        |
> |                             qcs9075-som.dtsi                 |                qcs9100-som.dtsi                                                |
> |                                    |                         |                       |                                                        |
> |                                    v                         v                       v                                                        |
> |                                  (IOT)                    (AUTO)                   (IOT)                                                      |
> |                                    |                         |                       |                                                        |
> |             +----------------------+                         |                       |                                                        |
> |             |                      |                         |                       |                                                        |
> |             |                      | +-------------------------+-----------------------+-----------------< sa8775p-ride-common.dtsi           |
> |             |                      | |                       | |                     | |                                                      |
> |             v                      v v                       v v                     v v                                                      |
> |  qcs9075-iq-9075-evk.dts     qcs9075-ride.dts         sa8775p-ride.dts         qcs9100-ride.dts                                               |
> |                                    |                         |                       |                                                        |
> |                                    +-------------------------+-----------------------+-------------------< sa8775p-ride-ethernet-aqr115c.dtso |
> |                                    |                         |                       |                                                        |
> |                                    v                         v                       v                                                        |
> |                             qcs9075-ride-r3.dts      sa8775p-ride-r3.dts      qcs9100-ride-r3.dts                                             |
> |                                                                                                                                               |
> +-----------------------------------------------------------------------------------------------------------------------------------------------+
> 

Updating typo: qcom-ride-* changed to sa8775p-ride-*.

> > 
> > Best regards,
> > Krzysztof
> 
> Thanks & regards,
> Wasim


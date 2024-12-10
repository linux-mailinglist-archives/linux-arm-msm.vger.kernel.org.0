Return-Path: <linux-arm-msm+bounces-41313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807F9EB1D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93E0D1889A65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A381A9B5A;
	Tue, 10 Dec 2024 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zc/Hsxz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E621A0B15;
	Tue, 10 Dec 2024 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733837137; cv=none; b=j5sNdL1J2gP2TxcmBNlhM7l8WmGUxiQeoicLcFGAqVLo7kbz1vBh0aqMXVQH2hlU2+JqfoX2+3sT3/qogJLaKJKnwnnlOQ4XQ5kfi3lLiEei+fgxoRmPl/+C1iWrt4okPKahyZYJ7Z9rM6YrHGupG9eS963nGB23ve1ru4Os1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733837137; c=relaxed/simple;
	bh=nTFsVJCiG/fGyjcBn/u/RJ4Wm9Xi+qtHH/1Yy6XtMp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tWQ4/iGq0GIoeTJLfj5/DrsEGFJxXDBh0yExRstfGobw6nH6vIpv5ao1sa61sz6F9g6wXC7qznkeSJYK31nnxzL22ivWzz4BzISlMWjFQj8bxHn2xMYIAs8puiM6qWAyRhUp4TnAgISw9AQQaT0tAUfQK2H6cB+Fsy6W09d0CLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zc/Hsxz1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BACkVqk014059;
	Tue, 10 Dec 2024 13:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAy0fqBw+sJaaAGWtwBcjlN1BVcv+m/rtwB2nRnyq/o=; b=Zc/Hsxz1etbRFyzu
	JMq9zKe+NmITq0QZht5xCA8gPp+VvsQt/Xwn3nU+Or2v3X3yOdCcqLtT183xvX6G
	pwOF24+1OmIFIHrWcrf0FB1A0ias/PZV0oE6ZyzjecpVlw3rt76FexIkUjO4lFuw
	CvSh5ABd7ntcR04frcPeKd7oWjAkCDQsXIi83xGPr6fbHVAaGl0LEAqqkRoNFrlh
	T5Do89YrRFiSL/tTGEHuUw0Mdk4uWCQeZrzsP80bD4yd2ammxO/N572jCXccVD5Z
	viFWSaNLp7ctgiAH9aZZe69e8ktcRxhE97vNj+FSJFAXUR77ZZHJcMYSvzBNmeaJ
	yih3PQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dvyamr0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 13:25:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BADPHQ7018156
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 13:25:17 GMT
Received: from [10.253.8.172] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 05:25:12 -0800
Message-ID: <2c28f9c2-c555-422d-8d57-6a555f03e6f7@quicinc.com>
Date: Tue, 10 Dec 2024 21:25:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/5] net: pcs: qcom-ipq9574: Add USXGMII
 interface mode support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
	<andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_luoj@quicinc.com>, <srinivas.kandagatla@linaro.org>,
        <bartosz.golaszewski@linaro.org>, <vsmuthu@qti.qualcomm.com>,
        <john@phrozen.org>, <linux-arm-msm@vger.kernel.org>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-4-26155f5364a1@quicinc.com>
 <Z1B3W94-8qjn17Sj@shell.armlinux.org.uk>
 <dc40d847-9a98-4f46-94cb-208257334aed@quicinc.com>
 <Z1Mm8nBR_sYyzBUh@shell.armlinux.org.uk>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <Z1Mm8nBR_sYyzBUh@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bMZB-OSHEUC8Xw4u7C0J4rwqPK9gIfgF
X-Proofpoint-ORIG-GUID: bMZB-OSHEUC8Xw4u7C0J4rwqPK9gIfgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100100



On 12/7/2024 12:31 AM, Russell King (Oracle) wrote:
> On Sat, Dec 07, 2024 at 12:20:57AM +0800, Lei Wei wrote:
>> On 12/4/2024 11:38 PM, Russell King (Oracle) wrote:
>>> On Wed, Dec 04, 2024 at 10:43:56PM +0800, Lei Wei wrote:
>>>> +static int ipq_pcs_link_up_config_usxgmii(struct ipq_pcs *qpcs, int speed)
>>>> +{
>>> ...
>>>> +	/* USXGMII only support full duplex mode */
>>>> +	val |= XPCS_DUPLEX_FULL;
>>>
>>> Again... this restriction needs to be implemented in .pcs_validate() by
>>> knocking out the half-duplex link modes when using USXGMII mode.
>>>
>>> .pcs_validate() needs to be implemented whenever the PCS has
>>> restrictions beyond what is standard for the PHY interface mode.
>>>
>>
>> Currently, it seems there is no phylink_validate() call in
>> phylink_resolve(), to validate the resolved duplex/speed which is notified
>> by phydev when the PHY is linked up. So I am thinking to add this duplex
>> check in this link_up op, and return an appropriate error in case of
>> half-duplex. (Kindly correct me if I am wrong).
> 
> Doing validation at that point is way too late.
> 
> We don't want the PHY e.g. even advertising a half-duplex link mode if
> the system as a whole can not support half-duplex modes. If the system
> can't support half-duplex, then trying to trap it out at resolve time
> would be way too late - the media has already negotiated a half-duplex
> link, and that's that.
> 
> Instead, phylink takes the approach of restricting the media
> advertisement according to the properties of the system, thereby
> preventing invalid configurations _way_ before we get to autoneg
> completion and calling phylink_resolve().
> 

Yes, understand. I will avoid advertising half-duplex in the 
pcs_validate() method for USXGMII. Thanks for the suggestion.


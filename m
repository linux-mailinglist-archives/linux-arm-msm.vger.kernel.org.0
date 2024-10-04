Return-Path: <linux-arm-msm+bounces-33137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B001F9905CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 16:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14701C21281
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 14:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC45F215F50;
	Fri,  4 Oct 2024 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="okL+ySG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B4521019E;
	Fri,  4 Oct 2024 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051477; cv=none; b=Vzz07y5qcFFjrWs6Iwq3LkrtsrsC1hWfijDIFHjeM1rvov9lDVmY4bwoqVVU7Ry37zpEsFwtObmKddAfXe8MYKC8YBEfv2G/GzHmX0DALiJZhb/vQqAHI6LKu2CudAjm2NMyR58BuyZIdm03zhFp41NF+CIX5/ZD8zWP3U4Pmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051477; c=relaxed/simple;
	bh=8FfT3emrxqvJFcw3KbN5joJkR82DdXfS1w056cap/s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WBgvYiMq6J5p9eW6uwc4DABIRl3Rf/WN6RQyHjx3H/CmKzbf/dya4TpxqjKcPvQxrmAMWg+DOsHrmft4jrrTJx/SwioKHsfzJYF809MQb6tK7InYMKuITCFgVHzFGybJNV3zvAxSBla0l4h0YWvIEJJlwGPf5Lp/dnpYJ1Sx+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=okL+ySG6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AU5tm026314;
	Fri, 4 Oct 2024 14:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xi8bYpIMhfxhd6tW59lHch1l8AffoYjX3hsuGpSRWCo=; b=okL+ySG6/Vu7fIGZ
	Ho03S+X4EpIsbquys6YHvj1teRYcaDR/Tw8hBiWraAf6lonWo2GEWLuZcWFYRC4v
	lMfnevgVmzEBE79J6vw8crT4AQtJdPknGdN3jfHVEjnR46usEjafQvgTlHrn/OQP
	0bxjTmqWeA85CSyLFFiCE8iHYNfW0Ed+hpyjLpDt5W+G1yvOmoASX+a3ff53kZSs
	hdhYug6SA5/GDKaWIEvL/pMTv+6S1zLHMwdyxNr3+AxM77lTzrb2Jq2CzKKy3fIV
	I2erCMposuYowvyMafNNt9nJYHe/v+3jvRI6Y4kl2ZfbqzJfERDdtXVeBwP50F1J
	SBzkrA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205jjae7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 14:17:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494EHSN6032403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 14:17:28 GMT
Received: from [10.216.10.52] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 07:17:19 -0700
Message-ID: <7f413748-905d-4250-ad57-fc83969aad28@quicinc.com>
Date: Fri, 4 Oct 2024 19:47:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Advice on adding support for Qualcomm IPQ9574 SoC Ethernet
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: Andrew Lunn <andrew@lunn.ch>, <netdev@vger.kernel.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Russell King <linux@armlinux.org.uk>,
        Jacob Keller <jacob.e.keller@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vsmuthu@qti.qualcomm.com>,
        <arastogi@qti.qualcomm.com>, <linchen@qti.qualcomm.com>,
        <john@phrozen.org>, Luo Jie
	<quic_luoj@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Suruchi
 Agarwal (QUIC)" <quic_suruchia@quicinc.com>,
        "Lei Wei (QUIC)"
	<quic_leiwei@quicinc.com>
References: <f0f0c065-bf7c-4106-b5e2-bfafc6b52101@quicinc.com>
 <d2929bd2-bc9e-4733-a89f-2a187e8bf917@quicinc.com>
 <817a0d2d-e3a6-422c-86d2-4e4216468fe6@lunn.ch>
 <c7d8109d-8f88-4f4c-abb7-6ebfa1f1daa3@quicinc.com>
 <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
Content-Language: en-US
From: Kiran Kumar C.S.K <quic_kkumarcs@quicinc.com>
In-Reply-To: <Zv7ubCFWz2ykztcR@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wVy-TASJvMHREA61geeiVwlJta8s4CBP
X-Proofpoint-ORIG-GUID: wVy-TASJvMHREA61geeiVwlJta8s4CBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040099



On 10/4/2024 12:50 AM, Bjorn Andersson wrote:
> On Thu, Oct 03, 2024 at 11:20:03PM +0530, Kiran Kumar C.S.K wrote:
>> On 10/3/2024 2:58 AM, Andrew Lunn wrote:
>>> On Thu, Oct 03, 2024 at 02:07:10AM +0530, Kiran Kumar C.S.K wrote:
> [..]
>>>> 2. List of patch series and dependencies
>>>> ========================================
>>>>
>>>> Clock drivers (currently in review)
>>>> ===================================
>>>> 1) CMN PLL driver patch series:
>>>> 	Currently in review with community.
>>>> 	https://lore.kernel.org/linux-arm-msm/20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com/
>>>>
>>>>
>>>> 2) NSS clock controller (NSSCC) driver patch series
>>>> 	Currently in review with community.
>>>> 	https://lore.kernel.org/linux-arm-msm/20240626143302.810632-1-quic_devipriy@quicinc.com/
>>>>
>>>>
>>>> Networking drivers (to be posted for review next week)
>>>> ======================================================
>>>>
>>>> The following patch series are planned to be pushed for the PPE and PCS
>>>> drivers, to support ethernet function. These patch series are listed
>>>> below in dependency order.
>>>>
>>>> 3) PCS driver patch series:
>>>>         Driver for the PCS block in IPQ9574. New IPQ PCS driver will
>>>>         be enabled in drivers/net/pcs/
>>>> 	Dependent on NSS CC patch series (2).
>>>
>>> I assume this dependency is pure at runtime? So the code will build
>>> without the NSS CC patch series?
>>
>> The MII Rx/Tx clocks are supplied from the NSS clock controller to the
>> PCS's MII channels. To represent this in the DTS, the PCS node in the
>> DTS is configured with the MII Rx/Tx clock that it consumes, using
>> macros for clocks which are exported from the NSS CC driver in a header
>> file. So, there will be a compile-time dependency for the dtbindings/DTS
>> on the NSS CC patch series. We will clearly call out this dependency in
>> the cover letter of the PCS driver. Hope that this approach is ok.
>>
> 
> So you're not going to expose these clocks through the common clock
> framework and use standard DeviceTree properties for consuming the
> clocks?

The MII Rx/Tx clocks are being registered by the NSS CC driver using the
common clock framework, and the PCS driver consumes these clocks using
the 'clocks'/'clocks-names' devicetree property defined in the PCS MII
instance's DTS node.

Below is the link to the latest version of the NSS CC driver currently
under review for reference. These clocks can be referred using
'NSS_CC_UNIPHY_PORTx_RX_CLK' and 'NSS_CC_UNIPHY_PORTx_TX_CLK' for each
of the six ports (x == 1...6).

https://lore.kernel.org/linux-arm-msm/20241004080332.853503-6-quic_mmanikan@quicinc.com/


> 
> I expect the bindings for these things to go through respective tree
> (clock and netdev) and then the DeviceTree source (dts) addition to go
> through the qcom tree.
> 
Yes, the respective bindings will be included along with the drivers
posted to netdev and clock.

> The only remaining dependency I was expecting is the qcom tree depending
> on the clock and netdev trees to have picked up the bindings, and for
> new bindings I do accept dts changes in the same cycle (I validate dts
> against bindings in linux-next).
> 

The only compile-time dependency from PCS driver to NSS CC driver is
with the example section in PCS driver's dtbindings file. The PCS DTS
node example definitions include a header file exported by the NSS CC
driver, to access certain macros for referring to the MII Rx/Tx clocks.
So, although there is no dependency in the driver code, a successful
dtbindings check will require the NSS CC driver to be available. Could
you suggest how such dependencies can be worked around? Would it be
acceptable to defer enabling the example node for dtbindings compilation
using its 'status' property, until the NSS CC driver is merged?

> Regards,
> Bjorn
> 
>>>
>>> This should be a good way to start, PCS drivers are typically nice and
>>> simple.
>>>
>>
>> Sure, thanks for the inputs.
>>
>>> 	Andrew
>>
>>


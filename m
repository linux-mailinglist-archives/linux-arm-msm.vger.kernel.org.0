Return-Path: <linux-arm-msm+bounces-42611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A99F5F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 08:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505581694A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 07:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A63915886D;
	Wed, 18 Dec 2024 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VLzrkF6z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855B014B077;
	Wed, 18 Dec 2024 07:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506738; cv=none; b=I4bI/cDwrPbSa9ZlXRYgzfS66fwNdeA9UnDFk3ZRGZl7OBTvSdWEpdvRahQo700QL9TLcHNB7mtXame8f5UM22U06hslwGL8W8yQYbwCjtkqOfF7l93k9yR9rotdh/i0SV7iR66CC/MuMjkkFovhybSPAQc6sj6eEAqdWOeY1Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506738; c=relaxed/simple;
	bh=Nyn2llNRgrE3c0TiG/8Iy4jQeqUsMO97SgApNunDDOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P4gLDCzHoWZEYqYCL8XLB7hPCW6gcF10Qyng9rFl+hFyDlD7fX+jR9/2v3YeYflUxaAHLorHEFPZWV3glz6TYe20fFAxG/87nH2TLNHRb9wkcy3KfWOu0ttBc0Z+A47tMp1F8xm6wGHiy1h1GQrGaD/E1WJI9cLDSrEfWeLEZTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VLzrkF6z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI4sMAU001865;
	Wed, 18 Dec 2024 07:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z4W6jFrpDDtKiC9NIbf8Go6/NgQkWsIptmOlqe3R6s=; b=VLzrkF6zlkeksGy4
	zV35pxH+tT0Ie3ewi/nR1stQr93QaUFly656LkqD7Z16hz6Hb1skufUYo+JfGlF/
	H6TC1wmTEl8sjJh7PFcrlczgXbxFsGYH1NvFsPx1M8A2ge46Y84qQtbeqaVY5Mu7
	Mb/3srZ6Zs3FDhsrG9zV9nnj3YcVwJsZhDjtBBukfi7goAWGrVTQOyV2euwHdkQu
	m5HMQR63Aof7q38WCuSJDdtoz+F3DPRQiSoI9HM0wV0aTVJw262kYYjImsQ9Mco/
	56HtpopJK9uipITuLvFPRJbbFJx6pBnfLpvizGWkYa1rI2s2Dfjcn+zdJHT4ryP5
	rlaj1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kqs3ga7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 07:25:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI7PSAe002277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 07:25:28 GMT
Received: from [10.253.15.72] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 23:25:25 -0800
Message-ID: <aa1dcdf6-94a0-4922-83f0-3cf49516ac4f@quicinc.com>
Date: Wed, 18 Dec 2024 15:25:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <2556b02c-f884-40c2-a0d4-0c87da6e5332@quicinc.com>
 <75fb42cc-1cc5-4dd3-924c-e6fda4061f03@quicinc.com>
 <4a6a6697-a476-40f4-b700-09ef18e4ba22@lunn.ch>
 <441f37f5-3c33-4c62-b3fe-728b43669e29@quicinc.com>
 <4287c838-35b2-45bb-b4a2-e128b55ddbaf@lunn.ch>
 <2e518360-be24-45d8-914d-1045c6771620@quicinc.com>
 <31a87bd9-4ffb-4d5a-a77b-7411234f1a03@lunn.ch>
 <581776bc-f3bc-44c1-b7c0-4c2e637fcd67@quicinc.com>
 <174bd1a3-9faf-4850-b341-4a4cce1811cb@lunn.ch>
 <d711ee4b-b315-4d34-86a6-1f1e2d39fc8d@quicinc.com>
 <8acf4557-ac10-43f1-b1ab-7ae63f64401f@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <8acf4557-ac10-43f1-b1ab-7ae63f64401f@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: A4ZjIu75VbPGB7_ca6tBmQcOQdnuVuo8
X-Proofpoint-GUID: A4ZjIu75VbPGB7_ca6tBmQcOQdnuVuo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=899 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180058



On 2024-12-17 18:18, Andrew Lunn wrote:
> On Tue, Dec 17, 2024 at 10:26:15AM +0800, Yijie Yang wrote:
>>
>>
>> On 2024-12-16 17:18, Andrew Lunn wrote:
>>>> I intend to follow these steps. Could you please check if they are correct?
>>>> 1. Add a new flag in DTS to inform the MAC driver to include the delay when
>>>> configured with 'rgmii-id'. Without this flag, the MAC driver will not be
>>>> aware of the need for the delay.
>>>
>>> Why do you need this flag?
>>>
>>> If the phy-mode is rgmii-id, either the MAC or the PHY needs to add
>>> the delay.
>>>
>>> The MAC driver gets to see phy-mode first. If it wants to add the
>>> delay, it can, but it needs to mask out the delays before passing
>>> phy-mode to the PHY. If the MAC driver does not want to add the
>>> delays, pass phy-mode as is the PHY, and it will add the delays.
>>
>> In this scenario, the delay in 'rgmii-id' mode is currently introduced by
>> the MAC as it is fixed in the driver code. How can we enable the PHY to add
>> the delay in this mode in the future (If we intend to revert to the most
>> common approach of the Linux kernel)? After all, the MAC driver is unsure
>> when to add the delay.
> 
> You just take out the code in the MAC driver which adds the delay and
> masks the phy-mode. 2ns should be 2ns delay, independent of who
> inserts it. The only danger is, there might be some board uses a PHY
> which is incapable of adding the 2ns delay, and such a change breaks
> that board.

Okay, I will follow your instructions:
1. Change the phy-mode to 'rgmii-id'.
2. Add the delay in the MAC driver.
3. Mask the phy-mode before passing it to the PHY.

> 
> But i assume Qualcomm RDKs always make use of a Qualcomm PHY, there is
> special pricing if you use the combination, so there is probably
> little incentive to use somebody elses PHY. And i assume you can
> quickly check all Qualcomm PHYs support RGMII delays. PHYs which don't
> support RGMII delays are very rare, it just happened that one vendors
> RDK happened to use one, so they ended up with delays in the MAC being
> standard for their boards.
> 

Most Qualcomm MAC applications are actually paired with a third-party 
PHY. I agree that the original author's PHY might not support adding the 
delay. However, this assumption cannot be verified since the initial 
code was uploaded from the internal code base.

> 	Andrew
> 

-- 
Best Regards,
Yijie



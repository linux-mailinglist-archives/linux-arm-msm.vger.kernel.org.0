Return-Path: <linux-arm-msm+bounces-65670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C08B0A5CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0B59189F579
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6568156678;
	Fri, 18 Jul 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YRG1f+xG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D34317D;
	Fri, 18 Jul 2025 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752847393; cv=none; b=Q6j25WyKdw13EZ3gb4YSzp6Pwwv0sDxBj5Wnj6R3o7J+btbCrcyAtjZ61a02a9qZvh2lNORGSD5bK9HxpSmHtvGNHu1Nna2eCKrH9IVu8mqQrGvIRUcqx5WiTS31x/V5z2MHNLqUVe0jI8niGsDsHuirju4HLKkzLTJlxAd2ICk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752847393; c=relaxed/simple;
	bh=7EtjiaCnsOaFwvUj7+2v568CxGwGBUZ9Oh5In+ed6ak=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tvgsLH9u5x70uqGXTN/+qcJHOdO/jER/82uhsctOWzOEdYZMchyLQIdtbWGMqc1/CsNwaA0cBUAguLrYDq/UqHe4/cy4LSG9xjlSsI5cp4EkfOiFpLC3O2iJMebOYKkn40UNsdT4eRsXt9522okfM6G/fef62NIa91jqK1wO0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YRG1f+xG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8rYXF007293;
	Fri, 18 Jul 2025 14:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JB+LnHjXE+q6ZfeW7JvS/qwLUqdA+SfN8MEMhEN8De4=; b=YRG1f+xGP/2isvYE
	xIrzHBfl8aTWuAxoPv3qU2G2sMrJN7oHRVY0rAWLoBC6suiqXGjxBdWiKXy/7L8m
	l8KNbAB+ZBCLLO5wkJfPKP5kUtijKvtnWmvSd0O1xWmVv7jN+Piq+lxWWuvVTK1c
	TntNUVwJVpLnpd3XehYYacqfm1eX8fcOlCsvO1FQt+KGIprHTXrOG9kcuSCHbfgi
	F80EJrOwAnGQiF/k0fvbgLqFijYTT4HAe0VaiJ8jHCrEb0eEnh7z3wtGkL/bC+DM
	pdCBMW+xq50HewAvkb0qvhVgrFmUeZbMjHVSym5O2BCERoYe+quGwMOUbpuYzte2
	WdRRvg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcacy9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 14:02:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56IE2tiN026939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 14:02:55 GMT
Received: from [10.253.76.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 18 Jul
 2025 07:02:52 -0700
Message-ID: <d2a686fb-1320-4702-8bd3-0d2d823d3839@quicinc.com>
Date: Fri, 18 Jul 2025 22:02:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: phy: qcom: Add PHY counter support
To: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>
CC: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
	<linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
 <20250715-qcom_phy_counter-v3-1-8b0e460a527b@quicinc.com>
 <e4b01f45-c282-4cc9-8b31-0869bdd1aae1@lunn.ch>
 <23ab18e6-517a-48da-926a-acfcaa76a4e7@quicinc.com>
 <87cace03-dd5e-4624-9615-15f3babd1848@redhat.com>
 <c34607d0-fb25-471d-a28d-8e759e148a0b@lunn.ch>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <c34607d0-fb25-471d-a28d-8e759e148a0b@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEwNyBTYWx0ZWRfX0gezylLbqJ1j
 FOJMgIBZ23gfvP+kogmSflKviAwwG49usqR5tuVDHvRS9oe+c0E3e0QwQYeBebRvArmbVVtfJbH
 BXS5nxOr1rLwCzRo8jYjhdWz4jVP+G+V3efVgJNYAROmnIyiktpB3kfWKo9vfGG77uM6ji7MM0K
 mihJ0nMTbGdMAodaf7lFSU7hiMnFv4eWZsqjDccJJVhwMk2S2j+QwWnQbY0MNouQNr7qX3SN5fb
 p+K7W0uAnxn9Chkk9IC+uIjVy+mi2+WsF13YbPIh0QHkTJGb9eg6c2m3p/16NqfKHcS7SePawY4
 VObBzfKs0L8ggA4tAjdIBZ20poFhXDinyj1ljHtkhjjp/qbyf1etkG9v7vULn8zeH0tFJyduxwE
 TvX8N9t+BMu0FrSkXI/oq6c+krgVNum1+PZagPDC6CjESzBAKOLAFpyNVAbfdyzR2tEVwlmQ
X-Proofpoint-GUID: h02htuvjx6mehoO-FzaU-PyKEJ7L2OLh
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a5411 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=Piafd2y1WuyyOIu429wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: h02htuvjx6mehoO-FzaU-PyKEJ7L2OLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180107



On 7/17/2025 9:46 PM, Andrew Lunn wrote:
> On Thu, Jul 17, 2025 at 03:23:16PM +0200, Paolo Abeni wrote:
>> On 7/16/25 12:15 PM, Luo Jie wrote:
>>> On 7/16/2025 12:11 AM, Andrew Lunn wrote:
>>>>> +int qcom_phy_update_stats(struct phy_device *phydev,
>>>>> +			  struct qcom_phy_hw_stats *hw_stats)
>>>>> +{
>>>>> +	int ret;
>>>>> +	u32 cnt;
>>>>> +
>>>>> +	/* PHY 32-bit counter for RX packets. */
>>>>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_15_0);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>> +
>>>>> +	cnt = ret;
>>>>> +
>>>>> +	ret = phy_read_mmd(phydev, MDIO_MMD_AN, QCA808X_MMD7_CNT_RX_PKT_31_16);
>>>>> +	if (ret < 0)
>>>>> +		return ret;
>>>>
>>>> Does reading QCA808X_MMD7_CNT_RX_PKT_15_0 cause
>>>> QCA808X_MMD7_CNT_RX_PKT_31_16 to latch?
>>>
>>> Checked with the hardware design team: The high 16-bit counter register
>>> does not latch when reading the low 16 bits.
>>>
>>>>
>>>> Sometimes you need to read the high part, the low part, and then
>>>> reread the high part to ensure it has not incremented. But this is
>>>> only needed if the hardware does not latch.
>>>>
>>>> 	Andrew
>>>
>>> Since the counter is configured to clear after reading, the clear action
>>> takes priority over latching the count. This means that when reading the
>>> low 16 bits, the high 16-bit counter value cannot increment, any new
>>> packet events occurring during the read will be recorded after the
>>> 16-bit counter is cleared.
>>
>> Out of sheer ignorance and language bias on my side, based on the above
>> I would have assumed that the registers do latch ;)
> 
> I interpret it differently. The register is set to clear on read. So
> you read and clear the least significant word. Even if that word
> starts incriminating, you have 65535 increments before it will
> overflow into the next word. So you can read the most significant word
> before such an overflow happens. It does not latch, you just have a
> time window when it is safe.
> 
> What i actually find odd is that clear on read works on words, not the
> full counter. I assume that is documented in the datasheet, and
> tested, because i've never seen hardware do that before.
> 
> 	Andrew

Thank you for the review. The PHY counter functionality is also used in
the downstream code, and this patch series has been validated
accordingly. However, please note that the PHY counter is intended as a
debug feature and may not be documented in the datasheet. I will share
this feedback with the hardware team in the hope that we can include
documentation for this feature in the datasheet for future chips.



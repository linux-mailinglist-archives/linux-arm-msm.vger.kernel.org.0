Return-Path: <linux-arm-msm+bounces-29752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E599623BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15AA51C20A5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59C51662E7;
	Wed, 28 Aug 2024 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nKToqbHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22469165EEF;
	Wed, 28 Aug 2024 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724838076; cv=none; b=QWSZJyJbu8MgVGUq8XMktm2hOT++SZPr0wlOl5HVNf3qsqdofIAQnPHt2Lt4mCUTJBWJsvX+UAYE/bdcyHMsENMi2gE9x1WK22EkuJ+AVT3vOgQHCY6BdBP3uGOmD/sl0+xd6tVqBBvQ7DAZJw0PTruooQWNbhFaBEN03rOnXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724838076; c=relaxed/simple;
	bh=KmLvLZCvXN+ISC2aNUSSVE3qHQPfDdF+tdNTgeSVTWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HrI3a83SwINRyZ0iiamOIgFJgsbsZsG5599Ahx0Mj3G7lcLpD2qpgxevYnVgV6x0HgO5o87HNx+zttRvvu9rEpgSYnG0kC4SfJjMSYDVmG9lkPWKJKELFvsJuHICWEpyXQU/bBXDvX5Vqz++7ClnB4MPBMq6tcs18OzWdpsrIhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nKToqbHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLqiP6027416;
	Wed, 28 Aug 2024 09:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Glnt4wfb8lmUVsOzwL5WYgQj8annLWuBVIaCfgWkSTk=; b=nKToqbHT0gmxAona
	PhABQ19pUEQOO6S2/XiViehtHBc0kr+rXqomks2oymgGZt+6UIQNPAlSltyUNHwN
	mB1QSgkLDflZ8uEhdm3r+IAjcGmk33pvjFH4sOSTT8eiogpN+Ie7q9oWYqVoouCk
	BQBfD0Cf9Odq8RlL7aJ/KmUolOgFP4GD1dALyIRQI4d0UC/kDfiKiTYLvSZirBQj
	PEjkzBixqzTc5zEXbFsR5UQoezF7u8w2Ev/XGruI1sdJKqcro1zNOGg1K1a0r1ad
	LAGYR7XQKBUX1N++kWD2Hb/2de0LHUhKUJimTKTMGL+U07JcnhkY+fJe7RgDkN5f
	KiUUWQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xsb8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:41:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S9f74C001893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 09:41:07 GMT
Received: from [10.216.7.68] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 02:41:01 -0700
Message-ID: <818a4f89-d64b-4657-8845-d01caec0a750@quicinc.com>
Date: Wed, 28 Aug 2024 15:10:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for Global Clock Controller
 on QCS8300
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
 <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>
 <bf5b7607-a8fc-49e3-8cf7-8ef4b30ba542@lunn.ch>
 <01c5178e-58fe-4c45-a82e-d0b6b6789645@quicinc.com>
 <049ee7d3-9379-4c8f-88ed-7aec03ad3367@lunn.ch>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <049ee7d3-9379-4c8f-88ed-7aec03ad3367@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 35tbvDru6ZV_oimTL3j0FtbCPK_ORpex
X-Proofpoint-GUID: 35tbvDru6ZV_oimTL3j0FtbCPK_ORpex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280069



On 8/26/2024 6:24 PM, Andrew Lunn wrote:
> On Mon, Aug 26, 2024 at 04:25:39PM +0530, Imran Shaik wrote:
>>
>>
>> On 8/23/2024 1:29 AM, Andrew Lunn wrote:
>>>> +static int gcc_qcs8300_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct regmap *regmap;
>>>> +	int ret;
>>>> +
>>>> +	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
>>>> +	if (IS_ERR(regmap))
>>>> +		return PTR_ERR(regmap);
>>>> +
>>>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>>>> +				       ARRAY_SIZE(gcc_dfs_clocks));
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Keep some clocks always enabled */
>>>
>>> Sorry, but you need to explain why. Why cannot the camera driver
>>> enable these clocks when it loads? Why cannot the display driver
>>> enable these clocks when it loads.
>>>
>>
>> These clocks are recommended to be kept always ON as per the HW design and
>> also exposing clock structures and marking them critical in the kernel would
>> lead to redundant code. Based on previous discussions with clock
>> maintainers, it is recommended to keep such clocks enabled at probe and not
>> model them. This approach is consistently followed for all other targets as
>> well.
> 
> I don't see why it would add redundant code. It is a few lines of code
> in the driver, which every driver using clocks has. If you really
> don't want the clock turned off because it is unused, you can use
> CLK_IGNORE_UNUSED, along with a comment explaining why.
> 
> What i was actually guessing is that you don't actually have open
> drivers for these hardware blocks, just a blob running in user
> space. As such, it cannot turn the clocks on. If that is the case, i
> would much prefer you are honest about this, and document it.
> 

We have recently discussed enabling the clocks at probe with the 
maintainers in the below threads as well.

https://lore.kernel.org/all/664cca91-8615-d3f6-7525-15b9b6725cce@quicinc.com/

It was concluded that keeping them enabled at probe is acceptable. We 
are now following this approach across all targets.

Thanks,
Imran

> 	Andrew


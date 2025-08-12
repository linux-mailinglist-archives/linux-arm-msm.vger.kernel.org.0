Return-Path: <linux-arm-msm+bounces-68662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F7AB22030
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6778A17CA56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75632DE6F7;
	Tue, 12 Aug 2025 08:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ceqWJ7AD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A56442C;
	Tue, 12 Aug 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754985835; cv=none; b=lVhDQhRig5Fq7uIc3IefKDYmkbZsYprYcDlc7S1cg2bweL1CLqEimxnvmOlCKLjoNMnZ8FSItSHg/KvLChtfjiMFMSeBQIOTCD7c9FMTp/hVwiG3IbESfETzkJ1h9fm+kNG5iW1nuL7duJSsvtKtPvqGfUOmFuUWFEJDXxmUTp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754985835; c=relaxed/simple;
	bh=zhC1bFpNgvEo+/bXsCr9kxpuP5NFxHWfs9bUmivwlBk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=NMXln1dqRCUPLXtCdbBEStvZV4RVWiXz1cVqgFyo+p88y16JRzT23Qj/bmEdrJKt5V9p4vvqgoI/Axa52AmaO081+784sPP8duB2qJz7zhAMwRkkhcKZIWKz9kNz14DLjLX30UNsmN8+zPRGHc8sQ3wdxPKqMryGfyWbCj7ufbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ceqWJ7AD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C4anuP019037;
	Tue, 12 Aug 2025 08:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jYGNuMqNEzyoSiM1coiwrxw+b216a1k5SRmtSYIjUK0=; b=ceqWJ7ADue83R747
	+DZkkOhxoJxK059vUH0LiLRx68v6P+FdU/Ei8Mn8NuKjlk7J1Yte56z3/yGiwKtH
	jYyjOIGMHBFFtCQrI4O/xGAtfL34t3o9mzE9Jlduvj0iTbhxg8q9u8jHps4uS43s
	+Y8ZeCTVSi8yKWTqYrI2GqnOihvPEMbqz0Oi1M9FyXngzwcAGBMtj6qburXBP4uq
	tPM6wQN7FNhoeg22Ij830TGjrQmgpqj9mZr7TxbssVRLSgPgyEGk85NM7FOpdUPq
	QpcYXl2mkiRv7pTkDLMsJelJ3A8bS+nrgxC5ms+eM7t+JIps2FZay1dmJE/sQ45c
	kZ2bMw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduyadp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 08:03:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57C83pUt010814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 08:03:51 GMT
Received: from [10.253.11.43] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 12 Aug
 2025 01:03:49 -0700
Message-ID: <0a6d6ae7-67f2-4974-b005-f36ee8707c67@quicinc.com>
Date: Tue, 12 Aug 2025 16:03:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
 <20250715051618.724475-2-quic_shuaz@quicinc.com>
 <ee84aeb0-728a-4642-9686-3abb9588bb24@oss.qualcomm.com>
 <e7e700e4-e87c-4e2c-8df1-634870ba91b2@quicinc.com>
Content-Language: en-US
In-Reply-To: <e7e700e4-e87c-4e2c-8df1-634870ba91b2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689af568 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=0mwEwrqexmEsALdfmGcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CITD3p83s6-kO_y15Mr0xYYgYau1HFGz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX1ofGM8DFBhxN
 g0oaSmMhAT3JdPx695ImdQr+fpUJcWVzWTP1mubDknRdViafKi31F/FX0/YnnGcVWQUb0WOo/so
 Vf/ueGWXq1HlMZpWuE8xs5cDT5nZSCJuC5f05K1M035fgZUiyEeQsXwRi8RgXu3tJJ3OpsTNdr1
 tbdveUllcmGfLg8jVF3meC9sp8EM0HaLxW5Q1wOIK6ChL5sIN2g2r8bnaDzLdiqk/BO1gbmD0zH
 oY2fmirpc9PyW5h0UgiyevjMARpvKkO4RXgHfqz+ej84lPV8Mj7r6oXFUg0buIo9xWvo+dPgAlz
 6DN2xGeiEU+MgQ5pD6d3C775WphSjrzT95vPun5m+OiA1Ep0rThN7h3m/qcZ2gME6YMAg2L03RQ
 frjFvY1f
X-Proofpoint-GUID: CITD3p83s6-kO_y15Mr0xYYgYau1HFGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Hi Konrad

On 7/19/2025 7:32 AM, Shuai Zhang wrote:
> Hi Konrad 
> 
> On 7/15/2025 5:11 PM, Konrad Dybcio wrote:
>> On 7/15/25 7:16 AM, Shuai Zhang wrote:
>>> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>> This leads to reset command timeout.
>>
>> This is a description of what goes wrong in terms of the code of
>> this driver, and it doesn't explain why you gate the code addition
>> with HCI_QUIRK_NON_PERSISTENT_SETUP, please share more details about
>> what you're doing, and more importantly, why.
>>
> 
> The problem encountered is that when the host actively triggers ssr 
> and collects the coredump data, the bt will send a reset command to 
> the controller. However, due to the aforementioned flag not being set, 
> the reset command times out.
> 
> I'm not clear whether you want to ask about the function of 
> HCI_QUIRK_NON_PERSISTENT_SETUP or why the changes are placed 
> under if(!HCI_QUIRK_NON_PERSISTENT_SETUP).
> 
> Regarding the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, 
> you can refer to this commit. 740011cfe94859df8d05f5400d589a8693b095e7
> 
> As for why it's placed in if(!HCI_QUIRK_NON_PERSISTENT_SETUP), 
> since HCI_QUIRK_NON_PERSISTENT_SETUP is related to BT_EN, it can be 
> used to determine if BT_EN exists in the DTS.
> 
>>>
>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>> ---
>>>  drivers/bluetooth/hci_qca.c | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>> index 4e56782b0..791f8d472 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -1653,6 +1653,18 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>>  		skb_queue_purge(&qca->rx_memdump_q);
>>>  	}
>>>  
>>> +	/* If the SoC always enables the bt_en pin via hardware and the driver
>>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
>>
>> What is the "SoC" here? Bluetooth chip? MSM?
> 
> yes, Bluetooth chip on qcs9075-evk platform
> 
>>
>> What does "enabling the pin via hardware" refer to? Do we ever expect
>> that a proper platform description skips the bt_en pin?
>>
>> Also:
>>
>> /*
>>  * If the..
>>
> 
> Sorry, I’m not quite sure I follow—could you clarify what you meant?
> Here is my understanding.
> 
> Enabling pins through hardware refers to "the pin is  pulled up by hardware".
> qcs9075-evk platform use the m.2 connective card, the bt_en always pull up.
> 
> 
>>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>> +	 * This leads to a reset command timeout failure.
>>> +	 * Also, add msleep delay to wait for controller to complete SSR.
>>
>> Googling "bluetooth SSR" yields nothing, so it's fair for me to ask
>> you to explain that acronym.. it's used a number of times across the
>> driver, so perhaps a comment somewhere at the top in a separate commit
>> would be good as well. I'm guessing "subsystem reset"?
> 
> Just to clarify, SSR is short for Subsystem Restart
> 
>>
>> Konrad
>>
>>> +	 */
>>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>> +		msleep(50);
>>> +	}
>>> +
>>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>>  }
>>>  
> 
> Shuai
> 

Please let me know if there are any updates. Thank you.

BR,
Shuai



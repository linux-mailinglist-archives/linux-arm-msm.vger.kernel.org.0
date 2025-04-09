Return-Path: <linux-arm-msm+bounces-53608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC9A81D5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 08:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4EB4427EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 06:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79771DF980;
	Wed,  9 Apr 2025 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FS0up6cH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A21DF751;
	Wed,  9 Apr 2025 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181092; cv=none; b=unrdiq1mVTHalw6UVbW63wU+KCDzWdaUYdoX//4ctqsPQaOhcXuYc3aMqhaANyxr0wyeivybPOE8BDU/M+KjWtpCYl8pbynA36l8Ezf9QKHufsha5MIgYt9yyhxmV69iFBGL+yGJxXT7S/D8n1jbU4vUh1rGw3gx8Ti2KW4/F14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181092; c=relaxed/simple;
	bh=/yLqIi4ei+1rxxZwU9HgqOKbkEgzjwW32t0OMobPk08=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ttzwLps/5inb8u2epYT9jXsDp9770mspndY2FkPLFbPfffb9tRIVP/AEzSh30jMdkFw9KO0XaW4lT7/uw5PClGG4IokeMFTkTuW1986kPhpcpvlF9KTsXOeUjYLVutX07aMWk2S8tGFD6KpcHk2QAiyqT12pDGzs8XrFuhpHT30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FS0up6cH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZRFo002911;
	Wed, 9 Apr 2025 06:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjxU9Wzug3C1/bpJyyVdvYu7XHV8AaWbS5sG+EoQisg=; b=FS0up6cHnaMXRdel
	9xohDLWDiERagrmdD2sjPcXzDCYYzas/GQ8E5gDevQsgaeS4pGIdmRlvYxpUlSuZ
	R5BaoHMcje/gf+9X47yjBQlf7B9coFlPEU+JD2S7yKW7K/bJDLlylxueQhKbjL+a
	ejQUHdbnw22TleULY/joUcPkNlU1vZfFR1JcwM9VqjYmAxCGmCl3DvJFvOs6ETT+
	b0lDwrXz+wUImMQcsoSR75LjNY091FoECm9LAbUF6GjKtReWJiXfeQk0zRjatBGm
	Du5t8lxpC4yreAJvAioOeHJxATtqHr/bhi0GPcj3+UjjCGsITrdwx8bVvTAduiI0
	S4v5Tg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1j7tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:44:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5396idmU014141
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 06:44:39 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 23:44:36 -0700
Message-ID: <c4994d69-a8f6-40ca-96e6-6cd9ed2081ae@quicinc.com>
Date: Wed, 9 Apr 2025 12:14:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
 <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
 <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
 <6ab62bb9-2758-4a12-aec3-6de9efc3075a@quicinc.com>
 <7bbe235d-be3a-4851-b9db-c3c9e956a9fd@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <7bbe235d-be3a-4851-b9db-c3c9e956a9fd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RcLhxEaQ9o46zmtvil6I3QMZoz8pGOz3
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f61758 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=yBufkzId0ZbioYoeXs0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RcLhxEaQ9o46zmtvil6I3QMZoz8pGOz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=706 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090025

Thanks Krzysztof !

On 4/9/2025 11:40 AM, Krzysztof Kozlowski wrote:
> On 09/04/2025 07:48, Mukesh Kumar Savaliya wrote:
>> Hi Krzysztof,
>>
>> On 4/9/2025 12:11 AM, Krzysztof Kozlowski wrote:
>>> On 08/04/2025 15:23, Mukesh Kumar Savaliya wrote:
>>>>>> +
>>>>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>>>>> +{
>>>>>
>>>>> You miss sparse/lockdep annotations.
>>>>>
>>>> This is called in pair only, but to avoid repeated code in caller
>>>> functions, we have designed this wrapper.
>>>> i3c_geni_runtime_get_mutex_lock()
>>>> i3c_geni_runtime_put_mutex_unlock().
>>>>
>>>> caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().
>>>>
>>>> Does a comment help here ? Then i can write up to add.
>>>
>>> I do not see how this is relevant to my comment at all.
>>>
>> What i understood is you suspect about lock/unlock imbalance right ?
>> I know that Lockdep annotations will be used to check if locks are
>> acquired and released in a proper order.
>>
>> You want me to add below code in both the functions mentioned ?
>>       lockdep_assert_held(&gi3c->lock);
>>
>> What exact sparse/attribute can be added ? I am not sure about that.
> 
> I don't think you tried enough.
> 
> git grep sparse -- Documentation/
> which gives you the file name, so:
> git grep lock -- Documentation/dev-tools/sparse.rst
> 
Thanks ! it seems little more deep to go for me. Appreciate your 
pointers here.
> Use sparse instead of lockdep.
> 
>>>>
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	mutex_lock(&gi3c->lock);
>>>>>> +	reinit_completion(&gi3c->done);
>>>>>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>>>>>> +	if (ret < 0) {
>>>>>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>>>>>> +		pm_runtime_put_noidle(gi3c->se.dev);
>>>>>> +		/* Set device in suspended since resume failed */
>>>>>> +		pm_runtime_set_suspended(gi3c->se.dev);
>>>>>> +		mutex_unlock(&gi3c->lock);
>>>>>
>>>>> Either you lock or don't lock, don't mix these up.
>>>>>
>>>> Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock()
>>>> if this failed.
>>>
>>>
>>> I do not see how this is relevant to my comment at all.
>>>
>> same as above
> 
> 
>>>>>> +		return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>>>>>> +{
>>>>>
>>>>> Missing annotations.
>>>>>
>>>> Shall i add a comment here ?
>>>
>>> Do you understand what is sparse? And lockdep?
>>>
>> Little but not clear on exact sparse attribute to be added. please help
>> me. if you can help with some clear comment and sample, will be easier
>> if you can.
> 
> You did not even bother to grep for simple term.
> 
No, mine was quick research, what i got is below from my search and i 
mentioned in crisp. What you pointed above 
Documentation/dev-tools/sparse.rst looks great.

===
Sparse and Lockdep are tools used in the Linux kernel development to 
help with code analysis and debugging.

Sparse
Sparse is a static code analyzer specifically designed for the Linux 
kernel. It helps developers find potential issues in their code by 
performing checks that are not typically done by the compiler. Sparse 
annotations are special comments or attributes added to the code to 
guide Sparse in its analysis. Some common Sparse annotations include:

__attribute__((noderef)): Indicates that a pointer should not be 
dereferenced.
__attribute__((address_space(x))): Specifies the address space of a pointer.
__attribute__((force)): Forces a type conversion that Sparse would 
normally warn about.
Lockdep
Lockdep is a runtime lock validator used in the Linux kernel to detect 
potential deadlocks. It records information about the order in which 
locks are acquired and checks for inconsistencies that could lead to 
deadlocks. Lockdep annotations are used to perform runtime checks on 
locking correctness. Some common Lockdep annotations include:

lockdep_assert_held(&lock): Asserts that a particular lock is held at a 
certain time and generates a warning if it is not.
lockdep_pin_lock(&lock): Prevents accidental unlocking of a lock.
These tools are crucial for maintaining the stability and reliability of 
the kernel by catching potential issues early in the development process.
===

> 
> Best regards,
> Krzysztof



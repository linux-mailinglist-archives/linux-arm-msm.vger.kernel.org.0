Return-Path: <linux-arm-msm+bounces-28108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B1294ACE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 17:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BBC1F21CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A19A823DF;
	Wed,  7 Aug 2024 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJqmGS+9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F722364BC;
	Wed,  7 Aug 2024 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044644; cv=none; b=q3LQ1Waj/EqkPTBVAqDju9RBx3OpJrgAMfUeV7e5lEFZdtJTXMxHNS9EICbUxOInxdwzZMKI9hcd9BovezAMFdUx8kpTWnAtwzMBQGLzhdRhgvkqWZShP3kvp9FRCkX5fbEqRr1QiYmX2+AcEOZfS3AkiX38gGDrCN+K+5GogDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044644; c=relaxed/simple;
	bh=Ybbpm3l0VgcY8irLKiG7R3KeEt6Y5ckns0lgVAzSTOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kbdRwqZ84l+zxRcG6sfheKKHJJd85WnfLfNvDpZISOP8GCqSMp+dHFhdSOv045D3Yecb1enEzj4RSFkQ4S4mgKGgHMEznNA84b3ESrvU0wck2neyrPEOrWX5GOHvvnAES/i84bZyKXAZhw21/5ZtGsA0jgqxY5HLG4IW1VezCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJqmGS+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4778CcNN017145;
	Wed, 7 Aug 2024 15:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rGK5FhqeP9Ns8MopLkGkiE5QSZITi9c8Z7h7WJQs1pc=; b=iJqmGS+9Bjwj2bvd
	X7qcEBE5XRrnx44NNVr5zfqJ6DIlXtEyrqPT1hnUQ3BeKWM4aT1fG0cAvUpe4A9L
	E3s6i6JtOuIwc7nWGFrdMQRfGpUEo/0jQM6nZe9lTsRyPCSBbPjl4fDeRrCaSVHH
	CoIRr7zxZHS2SX8X75I8VMAYNcJTAC4JgspnNMqX2ReKTgcOW/9YR1XDE9kDjytw
	LHDofJrJ5Q7DM7x3Po9aCyBWANhMuhvLAXOxsLhH5yDF/SpRCAV8dWPbQX1lhfQP
	DuOSUdPwOO4rV/VurXSpUwOVIEFuHnHtSAMlkWhPX06DgywoxlASQkBqA80LLR/N
	/+G4Kw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sdaeb1pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 15:30:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477FUcrD029076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 15:30:38 GMT
Received: from [10.239.97.152] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 08:30:33 -0700
Message-ID: <13190683-1d69-401d-8c32-adb42e4386ed@quicinc.com>
Date: Wed, 7 Aug 2024 23:30:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: camss: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, <andersson@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Yongsheng Li
	<quic_yon@quicinc.com>
References: <20240807123333.2056518-1-quic_depengs@quicinc.com>
 <1c0ff0fa-73d3-400f-a58d-15fb9b0574d1@kernel.org>
 <c2a3e578-b098-450f-96f6-a3ae321f2b4c@kernel.org>
 <85cc52aa-4593-49f5-9438-1ee3f09d2d71@quicinc.com>
 <336e5679-f04e-47aa-9655-df88fde9de21@linaro.org>
 <0fb55319-0bae-4bb0-bce6-ebdbdd68f765@kernel.org>
 <c3ed2b0a-3f59-4cd1-98e1-96494d15d172@linaro.org>
Content-Language: en-US
From: Depeng Shao <quic_depengs@quicinc.com>
In-Reply-To: <c3ed2b0a-3f59-4cd1-98e1-96494d15d172@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -AAtNakMsy82IIPvKglaep_BnvFfkEGH
X-Proofpoint-GUID: -AAtNakMsy82IIPvKglaep_BnvFfkEGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070108

Hi Kryysztof, Bryan,

On 8/7/2024 10:58 PM, Bryan O'Donoghue wrote:
> On 07/08/2024 15:51, Krzysztof Kozlowski wrote:
>> On 07/08/2024 16:17, Bryan O'Donoghue wrote:
>>> On 07/08/2024 13:53, Depeng Shao wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 8/7/2024 8:43 PM, Krzysztof Kozlowski wrote:
>>>>> On 07/08/2024 14:39, Krzysztof Kozlowski wrote:
>>>>>> On 07/08/2024 14:33, Depeng Shao wrote:
>>>>>>> Add CAMSS block definition for sm8550.
>>>>>>>
>>>>>>> This drop contains definitions for the following components on 
>>>>>>> sm8550:
>>>>>>
>>>>>> 1. Subject: there is no prefix camss. There is no such file, 
>>>>>> directory
>>>>>> or module.
>>>>>>
>>>>
>>>> Thanks for the comment, will remove this.
>>>>
>>>>>> 2. You already sent this, so this should be v2 or v3 or vX. Provide
>>>>>> changelog under ---.
>>>>>>
>>>>>> If there is going to be resend, please fix above.
>>>>>>
>>>>
>>>> Sure, I thought it might be a new series, so I didn't add v*, will add
>>>> v1, and v2 change log in new version series.
>>>>
>>>>>> 3. If this was tested on aim300, I am surprised this being not 
>>>>>> enabled
>>>>>> on aim300.
>>>>>
>>>>
>>>> It was tested long times ago, but the patches wasn't sent out for
>>>> reviewing early due to the team's internal schedule.
>>>>
>>>>> One more thing, bindings were not accepted, thus this patch should not
>>>>> go in. There were no new bindings, so I assume patchset is using
>>>>> rejected ones.
>>>>>
>>>>> It's fine to send it to get some comments, although would be nice to
>>>>> mention to maintainer that this cannot be picked up as is. :(
>>>>>
>>>>
>>>> Sure, I will resend the dtsi patch until the bindings are accepted, 
>>>> send
>>>> this patches because you posted the comments in other series.
>>>>
>>>> https://lore.kernel.org/ 
>>>> all/0324e8e8-2ad4-4ce6-9616-3038b8e02ff9@quicinc.com/
>>>>
>>>> Thanks,
>>>> Depeng
>>>>
>>>>
>>>
>>> Recommend
>>>
>>> 1. Send out your yaml and dts in one series
>>>
>>> 2. Driver series can be posted in parallel
>>
>> The binding should go with the driver. Also usually discussion about
>> driver brings comments, thus changes, to the bindings.
>>
>> Sorry, DTSI and DTS should wait till bindings got accepted to media
>> subsystem.
> 
> Yes you're right
> 
> 1. Yaml - bindings
> 2. dts + driver
> 3. dtsi
> 
> In this case @Depeng remember to
> 
> 1. Link back to the older series in your cover letters
> 2. Suggested by recommended - publish a complete tree somewhere and
>     link to that tree in your cover letters
> 
> Its fine IMO to restart the version number of your series when breaking 
> up into smaller series, so long as you remember to link to the previous 
> series and explain in the cover letter whats going on.
> 

Thanks for the guidance, I will follow them, and resend the DTS patch 
wait till bindings got accepted.

Thanks,
Depeng


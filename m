Return-Path: <linux-arm-msm+bounces-89767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4DD3C05A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E0C70405072
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 07:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C7D38BF76;
	Tue, 20 Jan 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVx2MO8D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RafWroZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8F83815EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768893273; cv=none; b=FKoBgdma529CcuZBf3JT4EuPinbBQo28AkSfcfLP3lCvTqyj4R4q6BxQwsmoO6LeZXnpJ2AzDXVv7QGf4G2Md66rK0+aWV76Fqo1LhkOtwy8uyuLqs4xxSah6q0QXH7LRpcjdGPIng0Jgj2UKEYjVfR2cTVbuuOolhFw3fn0Ud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768893273; c=relaxed/simple;
	bh=ItytFqBspuQoRyHZM+vKpFJFCBMwJ8g7ILTs3IO0lN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzyQtssxTo/iELqlZQYw5eclepz4gxFC7+GLk72e20RdPr5Z94Du3IGLpXp2pJge5v8xa0C62noD+lProPyfqCKQdW74nrnxZ7nFmcm+fIAbe9aRuefxPsadEpgQACMZZiu7dA+yLvey9yH0MoPEerFegjRocoHQK7Bakbfzu3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVx2MO8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RafWroZX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3sOSN3252513
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODRG3CpECAB8QETWTYVocJq9do1PHXzWAo6LIsoH8YQ=; b=dVx2MO8DkA7uq6qb
	R/EW02Eo+VaoC0HAvB84a10q/W3NVLWSReg89E85P/j6cyWSPfc1i/GyJ7leVb/d
	NLXolCoSF+BSA7LEFdoiE4YlQWsc+/FeA5ZEryyVujHRuw+2ZW4yABYXvmoeBLs2
	9FZaYW+XN/74HqAwjY2j64bbmTlpS9xqDxftpFyAvoRuyLwKRjNuBaqKVihrbfFj
	PDMOXRVioOr45kLwZhGH1u13qArLPsjiETwQv2bEqlYh7VepRSXpKpyw06GRYU+7
	3A/cjiJbCxOXpFwU15pE8sWAsVRA+swdSL+r+MPCX32wNn2TvVPN2V2f1H1oJu2k
	P/We3g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27agh8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 07:14:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5fdf523f6dso254593a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 23:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768893260; x=1769498060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ODRG3CpECAB8QETWTYVocJq9do1PHXzWAo6LIsoH8YQ=;
        b=RafWroZXoigj05lQ7K3YwJ4gLcG97MK1aq5XhWABGDmWkzBqgyiqH2pymw1vK8mT61
         4H9kUwtjqiIW7JSIt3LCdZTgfk8MJO1tA/y+bHMBucNqq33vRNR6jliEyVA8FWKK1zgq
         je8lJ4zJKgF0tWeKU2IYOjS0b8XY/275LwpdlndtggwXV/EClcFi9S/eq+swa/w0bD2V
         nVJMF8adpnXR8JuiFoJVLtxK0EM8NXUHnkG6nXKcA418CPqCKzQ9iljXuOkMwdyYSdCz
         pzzqGbrrKUpsH9j25Yyl0rCK0lljfXpaCXTk7C6v5GjyudpjBo+4zccQR+YwQKmIocdp
         ZGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893260; x=1769498060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODRG3CpECAB8QETWTYVocJq9do1PHXzWAo6LIsoH8YQ=;
        b=ARhXm/T+vKNiqf3QiKZQTN6Gn8w9+IXLYuOnAI6SRWcwgnBgnWs/dMYKhMTts1IKqp
         wXJzr5sQbPHBNh2LsMyBNaO3/Fx150BO9GIdklsBphfWdHHpre+iPOYc+KTU+WpGSSme
         vlhjNGr/pxSl+YD63r6PZL1jX8dOCc1N0gwuwbO9dC+J/T9pyCcdltP6DkP9OBOpOsTs
         J5SSTFdftbTeSIjygZKLt/moLYqfQ2HqTG6c4f0oitlyu8qAW4FE0IvqRWw11f4Yfvq3
         fnEd7/ND9zXMrt37ajeQij4EzfDgX3tk5GQg4ykefZNiRxUdqsW0YFHlz4g9VVonX89o
         ANfg==
X-Forwarded-Encrypted: i=1; AJvYcCUS1ZTTmTIyDtJjkBi5QuEReGXOafCrMTfQJsuDqBb2F0mytDypPFfbRlmwArDa/sctmF2R+UUhGUvVEABR@vger.kernel.org
X-Gm-Message-State: AOJu0Yys1ktvoa29YjlkZ1fPaHky/dbDlUgjJQWAoBgP0k9VrAFu1+MS
	YwtM5u40aDRK90xSwX2y31wAnSNt281GHr2fwPbS1mO1UKwJHKUA2SuZuf1yFIw2kgpdEsQFbRF
	SIjqrFVFKlilUKkq0pGofRhula1t/02LXYFRfVrjY356ZSGMpJ5Bob7zw1YwdmdCjzW3q
X-Gm-Gg: AY/fxX4A2QaHDB7l2NE2zzZd21Nt+253N9mWZ3I56frGV0lhoWkguLXex9CB2idlZ7T
	9KyBRpqW2+damDHkktKVJ0iyUhhk0y6qyzIE9esmxjVcgNVNMyxezOl971D7PKAWrQ0FVUtOOsn
	XZqGqs37f431YcWv2LA+v9+msk3c49iO60q297RV2mBIfyxSpG+5UzV4HDL5MT61jkrHJTTKwNw
	u8H02uc8Fku3ub3WfHynRRO0YM34eKbyVzJITzu8iSuIJXujDrK3WXFw8GG3qHETLVjqxB4R9pN
	T1wt/ygxlnG5yVLwGO7pzI0Ji7f1rHJKdmhmc+Yi7qfyOJxvHqeQEDk0h2OJxYFH43mCso831ix
	wRU6SbKQl6kJdNJ2MT6aHE3OR5fZ2CYxnUtj3WfZAN36jIk6b8tqZD788fL9ht64mfJXEtMixf5
	HSeZA=
X-Received: by 2002:a05:6a21:1505:b0:363:bb19:ed30 with SMTP id adf61e73a8af0-38e00bf65f8mr11516693637.5.1768893259557;
        Mon, 19 Jan 2026 23:14:19 -0800 (PST)
X-Received: by 2002:a05:6a21:1505:b0:363:bb19:ed30 with SMTP id adf61e73a8af0-38e00bf65f8mr11516674637.5.1768893259104;
        Mon, 19 Jan 2026 23:14:19 -0800 (PST)
Received: from [10.133.33.151] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf24dd2bsm11223557a12.10.2026.01.19.23.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 23:14:18 -0800 (PST)
Message-ID: <554248b1-1c45-4950-9b0f-ec6fa0a5bd27@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 15:14:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <jeyj5wqu4uw7tnm4h5ryatoqupdrqpkjcynnydgbum6oj2d4jj@qvvbbifrvud3>
 <ed49abf0-c2b6-4496-a3b0-ef040fd94615@oss.qualcomm.com>
 <b3p5yhstng6nbrrdavx67vlv62hqqlnms7742txbimpeswqklv@eomkmkkearwp>
 <e2dfb857-1fd1-4d29-b04b-6dec0b7563d5@oss.qualcomm.com>
 <45f650d7-7369-4a0d-b931-3ba9ac998f75@oss.qualcomm.com>
 <f54f4eda-5776-4a68-a661-b66619ef9041@oss.qualcomm.com>
 <8cea513d-c1b5-41b0-9455-abff0aec3c36@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <8cea513d-c1b5-41b0-9455-abff0aec3c36@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gMHmzfF3MoRJfDwwb7ewu-zx8SccX2eM
X-Proofpoint-GUID: gMHmzfF3MoRJfDwwb7ewu-zx8SccX2eM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA1OSBTYWx0ZWRfX3Hvkq42mqHmz
 3C0ikbei+V8m66xAlFk3zyBuEks61MFxeyfOM2vOHRtcEhjdmYpoPiFfmUMVYit+u9mu2nVUIOy
 ec3wjuY4iPqWhiQhMrEC2ytRjBJxVW85mTVLObuRpGVvvEYqZqoA2VIvPlU6Tdr3vdFo9lMK/FF
 l9bWIxFqoFWkQIx7vN+JFNoOlMeYTYA0wHKCuvuyV4sjjepYxoJEoOF2D8MlPiXIXPVY9pdup9C
 Ujy2bWlJhKeh4LXOMEgLXyYShkpJqlnFBL5J8GdE0dBCi0Fuz9FvL/Aw/X/kZe4peqFwHVGIHy4
 HugkJPSdfTbMLhk5HQfWzAn3bPJQyGN1jXIR8cFLDMDy87z/8bI8L79jhk9OkG6tzvK/+SLip16
 vQYIgfsiCMULCneYYITcO6vnMUP9DcZjxRQ0HCh0WS23GSqnoTS34oM0GG6+fhv/fiAhMm18b4E
 no/RrO6qKhzdUyaWmEw==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f2b4c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qrmmpx7_Vw25L0xD5q4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200059



On 1/19/2026 9:52 PM, Konrad Dybcio wrote:
> On 1/19/26 2:51 PM, Krzysztof Kozlowski wrote:
>> On 19/01/2026 14:35, Konrad Dybcio wrote:
>>> On 1/19/26 7:54 AM, Yijie Yang wrote:
>>>>
>>>>
>>>> On 1/19/2026 2:34 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jan 19, 2026 at 10:39:04AM +0800, Yijie Yang wrote:
>>>
>>> [...]
>>>
>>>>>>>> Changes in v4:
>>>>>>>> - EDITME: describe what is new in this series revision.
>>>>>>>> - EDITME: use bulletpoints and terse descriptions.
>>>>>>>
>>>>>>> Oh no. B4 probably even warned you about not sending it out.
>>>>>>>
>>>>>>>    From this changelog I can assume that nothing has changed. Is it
>>>>>>> correct?
>>>>>>
>>>>>> This section was generated automatically by b4 and was not reviewed
>>>>>> carefully. The actual list of changes is in the section below.
>>>>>
>>>>> But why????? Why do you ignore what was done for you and write it on
>>>>> your own, reversing the order, etc? And even if you decided to ignore it
>>>>> for any reason, why didn't you delete it?
>>>>
>>>> The confusion was caused by mixing b4 and git format-patch to handle fine‑grained patch formatting. The Git configuration Konrad suggested did not work for me. I ran b4 prep --manual-reroll <msg-id> to allow b4 to track the upstream thread, which caused this section to be generated automatically. I did not notice this and mistakenly re‑wrote it myself.
>>>
>>> I found that I have additional options set in my *local* gitconfig:
>>>
>>> [diff]
>>>          renameLimit = 999999
>>>          rename = true
>>
>> This one does not exist. You wanted "renames" but you set it two lines
>> below.

I tried this, but these config options cannot replace 
--find-copies-harder. Since hamoa-iot-evk.dts and hamoa-iot-som.dtsi are 
not modified in this commit, Git will not consider them unless 
--find-copies-harder is used.

> 
> thanks
> 
> Konrad

-- 
Best Regards,
Yijie



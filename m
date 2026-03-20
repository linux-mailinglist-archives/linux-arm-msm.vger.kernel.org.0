Return-Path: <linux-arm-msm+bounces-98965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tmtBEKeDvWnQ+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:28:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D169D2DE9BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:28:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6293330A4DB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 17:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62283D3007;
	Fri, 20 Mar 2026 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3ae2ZQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYEn653p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DA346A00
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 17:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027409; cv=none; b=lzu4xShCbcNiGlgrpm1ncQpauzko+9nimNxOoV6tM4vBCZjPxrMGmorlxxhSBXDf+66zOT1k1hFqJvthLg7wX55GThhqQc/J6nNNTjXYuQsFw7wu6ivTlqMv0nL6K6NZ6wsQEyb41SwzorwstRfvpW7aus6aA9v6OjO5XzPGxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027409; c=relaxed/simple;
	bh=OJJyQ7N3WF+j+dEurHCdLzCCk3xicc9di2O5Up0QKJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iGhA3z+4da8DdLmzti9qEs/xogDBseWp0cMAvSR9KYuduvAupB4emHobFFYioq7B9W5DL5vdL2jXN9JgNbZ5VF2QAaPV0ULA+G6Rvn616F3s9Nc3gMYU1TSCxhbjGh0JWKW9xsFtkL+tZrQHsTOXeVKy9QGaGmSK9qeFIvYgg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3ae2ZQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYEn653p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KDD2Ih1526395
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 17:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfbxDY9Im2+BtL9OZSyqlYbFE771o07gzHc0qIeYYj8=; b=R3ae2ZQam077UttZ
	x0zRwZTNWjAMA8FgstZbdBkdXRWea+TBW5pCL2WGntLuUy16AW+gGbhRR9cxIo/j
	FsOHoDoumCvoj01uDo5/MCv9rEyoyM+Puf/9wQnFoNGBxt8kB3T69HQh+KuX8UFN
	1ys0pb+a38go2TnOAgHcZ8XDcuZfDrOcJ2S8lT7Pq6fvcEhpFRIY29kNP+O3b17m
	gr2CTzfF0yCFcUTVoGl5uWAe/KPoeBgvy9LaZ1pWCbSaos6oG1Oqx/iFkP3Pch38
	8cycW3/xqGInoL/V9W4bGzMvf3jg5T0IqayrphghBQ39cNtowrCnbrhYl2nqgdUR
	W7OVig==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0jt945tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 17:23:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso162099191cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774027407; x=1774632207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfbxDY9Im2+BtL9OZSyqlYbFE771o07gzHc0qIeYYj8=;
        b=bYEn653pghZh5RsoGTyHdW+nluxCMPOQdzY+67+k3OhxNWo/IlzPCPcDMJ+x+gVRWC
         eDVlIbGJ3Z9JkgsLnKsDt0o+x1gu/JCxuGZLjzSYLH5NZDJLkK+CYyCiDLQxPdmPloXy
         777gVXOAphFiVGorx4ufXzQ/Uk6D5IXlywbPVlHJaVNVmAqnSnmOq74/Iu6sWJOiFppp
         jtze6H1otDfJ1xp+6Yyx13sld+/dFBvwYGVf7OZOPaccbyHcZgJX+3fYADtGfEBtZAWp
         ABTJA2aGwH94HZP7cNS2zLOhZQuiFHEHnHw2KKRL2gkmOPqSrnJ/uFCLLTUu5Bwacay7
         VUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027407; x=1774632207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfbxDY9Im2+BtL9OZSyqlYbFE771o07gzHc0qIeYYj8=;
        b=PuvQ6vUwX1184P9/QneNtNkt7qqKoreQXs3l6xDnQORCcwisFYwrpFhEIcyg8BId5y
         JsjGi+g8raOMCC3HvHfNtFVNoOH8t1fOgmfhnhc+uy2LxVnhb0W8dZtrZzlHej3iDvwE
         IppoDmWHtC6ROjEkLQIl5t0LRFIpUf9CVnoIZPlYPH9sOg135gWTktZNy+fVAKphr0Rd
         rL2lTH/kU82FwaH1Yk6zQ7Sd3ykEnxXcUpvxrr7439cdK4NiWhpeI9NLCVSYCrMt2PqJ
         bVdFNBcVc91gjL6iJyEB/THgXuQq1FYuCi0vVC5T4egBKykCin2rPchUvF5WbuRo2KI4
         068Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdiE+ngYP+3Ek1w2TZjzOql93Vpm0JIv5Au4gfr9+DwoA5RuT0wJpN2YsCZw2WKT+YQxYYFAf9TU+S0sq5@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv1HhwDZU0X/um2QawgY18AkIPQ9uEjEzVbkXfeGGlJkSmyDRD
	h0JnQXTNv0WLxRHmElw+WtasEPhrEjC+RkKRchPRPW0Q+LOjX9B9KpLeSY4HzLUlOEPpdxccDOo
	JeByIzyHhURdKQhZq3Z6jh5pble+LjNS+8SEOkqRxkuCcIzPcRFPNN8fkrBdZcgemgwlB
X-Gm-Gg: ATEYQzwAyHlZfQGtaYMdX8i4wr+WRU5/6ZWwHisCp9qaBWPEX9sqOXiPSg4mLAX004T
	tWbwZ4EbRmH1oMvAx5lVzM9qVCO4Av/Sc0mRFNgHhR+lDRI0mXKJxOanT4Jhh2O2GndnLRQ2wrQ
	lY4JZ0Q1TD824msT3Zihd/c8Ww1LmuG+lu0UJz7CUux6XXqWdd/2Tp0lXaayQT0GG3U1h1/tHTw
	3PPvnXV0tOmzQDsfoGY5AwPORFE3lNJSS/VfxQ+cwFWyc/e8PYdhses2AZnkTg3pwOxrF0Fncqy
	981c+BxHYrOJcU83uQUAV/e0mY+Lmcv4+K8PGgUgOI2XhY+Z1MtHzEkuCbYsnDofrPj2xdT9oKg
	D04Jp9PqjEjf6QFDB5ajJNowMFsYroHWDMsbuSHSWvJ8SNiSKu78eqb1yFWj8TCSTuijVHLR0es
	qZTJYzngnH
X-Received: by 2002:a05:622a:7593:b0:50b:1932:c9c with SMTP id d75a77b69052e-50b374b1f0dmr45800121cf.40.1774027406943;
        Fri, 20 Mar 2026 10:23:26 -0700 (PDT)
X-Received: by 2002:a05:622a:7593:b0:50b:1932:c9c with SMTP id d75a77b69052e-50b374b1f0dmr45799691cf.40.1774027406461;
        Fri, 20 Mar 2026 10:23:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b322d9sm139618585e9.8.2026.03.20.10.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:23:25 -0700 (PDT)
Message-ID: <faf511da-722d-4ea7-bf5a-9c7abbdd1379@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 18:23:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Guenter Roeck <linux@roeck-us.net>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
 <1db8667b-5546-47bb-8ba5-cdb99fd60848@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <1db8667b-5546-47bb-8ba5-cdb99fd60848@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _cZa9r44Didj2cb8o6slyy7Errul3WxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDE0MCBTYWx0ZWRfX2bKlRJa14hIX
 9ijXB6z407eJczMHE0SLb2R+Uxo6W+cCq+HkxfaqfqRe+KkAqfMkZkOeQ4tQ0BF3yMm/fIsPQNL
 mPEhYAfBoDyeBxF0dfx/YjiaFuNg6v/7AcubAZ8TXOwCeY+a+crV+FU3xAbrqJKv4Q8MnD1vXZn
 Gckq2mVJTXm7OhzRu62gOfcs9oJZjLIHfn77adBV6HEEsrV02TsR9lGgm863qRWcqhY3l9U2nP6
 +yZ+x9Lr2VYC1Z9LCUxSkoLJI4Hr9soTeZwrT81/GacRHcyodA8GxHLQHOYAM/ygGzyVQlq3ZPA
 Tif0Rlb8abcWDYMz5im+EkpVvcpTY7X02e92oRHIWQcJEB0gx9IxHKkHoTwtduiXkcocc/QQram
 eiqao8mdnIKTW5jk+Rc4+znHgVL8ClRqZYhJHKnCQZ/rALnSdnpuVDdT2h879YUoz3wcXOSTSfh
 z1OPZAf8LFnUSdxXPDA==
X-Proofpoint-ORIG-GUID: _cZa9r44Didj2cb8o6slyy7Errul3WxA
X-Authority-Analysis: v=2.4 cv=FKMWBuos c=1 sm=1 tr=0 ts=69bd828f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=N4zZDkH6pAkBRpc-Z9EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200140
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98965-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D169D2DE9BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 17:59, Guenter Roeck wrote:
> On 3/20/26 09:08, Daniel Lezcano wrote:
>>
>> Hi Guenter,
>>
>> On 3/20/26 16:22, Guenter Roeck wrote:
>>> On 3/20/26 07:52, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>>>> +
>>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>>> +
>>>>> +/* Interrupt names for each alarm level */
>>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>>> +    [LVL0] = "bcl-max-min",
>>>>> +    [LVL1] = "bcl-critical",
>>>>> +};
>>>>
>>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>>> and critical. Would it make sense to do adaptative min / max ? So when
>>>
>>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>>> an additional _cap_alarm for power attributes and _emergency_alarm
>>> for temperature attributes. There is also a generic _alarm attribute
>>> for each sensor, which is supposed to be used if the specific alarm
>>> type is not known.
>>>
>>> What exactly are the three levels of alarms ?
>>
>> Manaf can give more clarifications, but it is like we have yellow, 
>> orange and red alarms. So there is an additional alarm comparing to 
>> what is available in hwmon. The proposed driver maps orange and red 
>> alarms, respectively to bcl-max and bcl-critical.
>>
>> I'm just asking if it is important to have this 'yellow' alarm ? And 
>> as there is a missing alarm to describe it in hwmon, how can we use it ?
>>
> 
> Is this for high alarms only or also for low alarms ?

It is high for over current and low for under voltage.

> I would not mind adding _emergency attributes for non-temperature
> alarms if needed. We could also add another low alarm if needed,
> though I don't have a good idea for a good name for that.

May be "warning" ?

Alternatively, could it be interesting to have an alarm with a value 
passed in the event which represent the value in the unit of the 
monitored attribute ? So there is no need to add more alarm files


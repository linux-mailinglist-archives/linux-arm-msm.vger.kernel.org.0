Return-Path: <linux-arm-msm+bounces-91168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMNrGulKe2l/DgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:56:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F075CAFD62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 12:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30A873024140
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917463876B5;
	Thu, 29 Jan 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fr338N09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjlchsDJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954373876AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769687777; cv=none; b=NNLl3VoDu7qnJ1Vqt517925bD5+mZ52c3Ws/5zPr6Vvl1CAuoZ0fbRr9JylChuVJ64OAQBUoPlJ57sqx/0MvBNNKfRCu8PN/OejtOaiAIcnkmatdyC4tM8v5b1Y9tzIn83SIQnEr2nUI/Tx7izWjk+AXOVzgY14OqJIZR7vbsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769687777; c=relaxed/simple;
	bh=7ben1nzOgp6NuXj4JLhvupKl4cYUOi4ZHQrjO7Ao/EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXnRj6v2lh1ya05CGzGOMAuvo3z0+S2oL4h2zdt8BF5RNzZgTBXqRExyXweoZ1Adx6GC9bbkj6YoLBCvfd7TYKpJlS1IgXaKIsE0soRzYv/9bW49oDcvEVTXeth1C1aSweixrrHAbbjBLo+iilk+/zTcDTY2vVjwbGkY3nv4pnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr338N09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjlchsDJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAAa7Z3713391
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDQk3BRBpJ5FcpP/PG7QKmjxWd+qP3CsaWqRU/Nc09Y=; b=fr338N09oLKwgduE
	v6HCBwwmmWGv/TDQIRAbG8KrD35Zil/KNLb5EwjEizg/5HwqvYYck+jrtk96ZFGf
	OKrRIgCdnFJxsmJBNtzMQltOltSeTu81dsGuho7KVunKrWnrkI437yZp0kGdLHQR
	TrJLJGzMlhaM84X6cFwI4IaV9uq4gBqoAMTCJDFZ3RQykO8Ws/PV6ngvelciPcgk
	bYXkRMJN9yZK0RDERmSeFEK6+Qjx+edqlBtud88hAJZ6NI04BGLJ4ZFYLJ5VVjKL
	Nm7mcE2W0RqOUpolYJ4ClJsmEcj+zVDgbovo7Dt+9yT2LsZ6cC+HQUHV58vI33wy
	zYgt7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byxcu9pkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 11:56:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c710279d57so18496385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 03:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769687773; x=1770292573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDQk3BRBpJ5FcpP/PG7QKmjxWd+qP3CsaWqRU/Nc09Y=;
        b=VjlchsDJGEcAsIg355ndQzWO6N9JybmuSh3Aj9c9CtVCS+4WW60WMPZ3S5O73r6gi6
         uicvQQef1FttEVfYxCJLQUJgObIZHZddpH1CNdhljoolZJo6IuGq3Jgb9d9Bk09w+Kzi
         2lEgCs1HPk98ip+ZZEATlzWjGcni5X5lpCFlbUm0RGJx0742bZ62tyY/4OGifzUOH3fV
         3MOEXoD5Uxu7tbMu+2q7RheAOScP06dOrICWQzypsOOwGt3lwp+cFYVEbD+QxWd3eS1c
         k8Qiknl11rrq9dIGxGw2JuDUecEtNgpyHCPgVNsirFIa7rTLE8cJpKy28IrXPJ6WM8uy
         nPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769687773; x=1770292573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDQk3BRBpJ5FcpP/PG7QKmjxWd+qP3CsaWqRU/Nc09Y=;
        b=rhWp7fjsGNHqfQcynjKjLCgAWBkrdMxpGJb9oD11ZrpxD2fZplABoOC6BmTsPdroEC
         05gN20aeds4kKC0I/GJH6fEmQoJupP8HDNDQjg7nQrwVzAJukncZK0iespln6AE4AJRR
         +aO/0uqc041atnc7Uc8M50BdvuJ5EP5IV+9ECZi9xTODgRbTvVrsVKb2+3u849vkLQJl
         rJGEK/yCMy1CHALnEaYcTw6YUu6w+P/e0q6I34jM93U11zzNMfmnPF0TMD6YoNHzGEA2
         2iJ1wYz6HaCSVghfSs+S6zinDhBoMXgXhhf37/e/DOjP0+O74AB8AMJBSdKoslk3FPnA
         iqRg==
X-Forwarded-Encrypted: i=1; AJvYcCU60Ifp6popZE0qncMnGN2ra0cMrSYJshWEqJgJWCAMWrbXPnTKBLma/brtyZ2ipFoQIPjBDPZoREacx7B1@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpiqZEUBhdSweqcWO24ETwOPHb59vQla11RmWyyYNjJjmbVF9
	VeuYC70BAgY++kfxwkVmeBaxHuWp8u0Zw/wbVNJnFw5UIHaxexU2EB3VXzg81cN+wJVP7QjC51w
	RK9ECxF1oweOe4k5OmLuDB8VPzGCFbKrLzOFszrdDCaDsCWd1Gz6cu9wqM/OYNOrbFgm9+dXcrX
	kg
X-Gm-Gg: AZuq6aI3uzqo7J/FdVG35ALuF6gz7MunDBTD/108daQuOxfmQ9wsSGihiUcL15wRAvw
	JqwsspPEgD2Ys989OtRcmzSH+SWVHJBn2z+AA5UTdmgxLc0WRB7f7ZRS8mPh2ZMAbYscowUuwDt
	1e+s8joraBiKxdlziVIJJ/VwvjGjoZdrDamgsaGnxI9/cULVtWZVYmcT+86mLMehWZ8AyG75IFO
	qwEjRnYvAH6rc97yLuuOePm83PgtiO5I2gLiERS3oNC4JFKOfE2jneiD9XZ+ojQMXBlZE1/TrHu
	dNSBtiiQUxBeFdNtSy06av7JidcDMm6BvWb2JrAuOwBavDecoPIVG3tlnUTdk+Br0RMT76oZx88
	V/kpr8QJyFpuUT63sXrGrIoSOxby+r3kLwOK3ksvCDoldiwG0ZGrqhaG5y7hV6TTbrc8=
X-Received: by 2002:a05:620a:4049:b0:85a:8fc6:5c28 with SMTP id af79cd13be357-8c71acf3225mr341017985a.6.1769687773336;
        Thu, 29 Jan 2026 03:56:13 -0800 (PST)
X-Received: by 2002:a05:620a:4049:b0:85a:8fc6:5c28 with SMTP id af79cd13be357-8c71acf3225mr341016985a.6.1769687772773;
        Thu, 29 Jan 2026 03:56:12 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c5b23sm247562466b.57.2026.01.29.03.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 03:56:12 -0800 (PST)
Message-ID: <26e2aa8a-912b-4e83-ad00-130cc137aa4b@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 12:56:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Update EAS properties
To: Lukasz Luba <lukasz.luba@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xilin Wu <wuxilin123@gmail.com>
References: <20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com>
 <fec5907a-5619-4997-9e8f-034efdd31993@oss.qualcomm.com>
 <l6vdnit4sd5rx3k236dwrmywudkmydxfjprn2c5i7fsfmlqfnu@tabbezrje36b>
 <76c24508-bb75-475a-b973-d7ad18c302ce@oss.qualcomm.com>
 <2ca3a260-d05f-4f2d-bf3f-08b4a3908792@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2ca3a260-d05f-4f2d-bf3f-08b4a3908792@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA4MCBTYWx0ZWRfX2/8WecFymK7c
 AccNeuWDgMxM9i7C8LOlYG9pkqVOgyEQUnJpJM0Zbfo0dNgMiOrG8Qp32X6tLuLLdAazWo36PUl
 mFhXZxiAi809IqNzVpzdZrOWsZODneWIh5SOYGBXvANHsH1p7XQaC3gUKdk/X/q3q4Z054mEk3j
 G19xWia1zgXEM4s0MuLDMFZ7rY4eaROldygJBke3tgJ0RZL1u3TzAqPLx6UmToIprHVjuWmY7m+
 UazOZXtEGlq+hm88Dk+hoihY57l2rp8j2J5MYvUpo2fQtP1L2qKGgH2iqyJxtpLvGNK1L2corcU
 JlNdq3KEyf+j9W4EPNdJJTskFa4LpWO6fpME8or5TK/tCnsKcN9pFFdE6Rw00UByFlcz1Oy8Ol0
 zUk9FuYXVNn1zNVmUaP9loodePmTTrPmRBnDkTH0AzohANJbY0ZCKsRzYWsHU4N+aPliJ67qB0e
 ixVkPLYdehaJYcxrrEw==
X-Authority-Analysis: v=2.4 cv=QpRTHFyd c=1 sm=1 tr=0 ts=697b4ade cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=PiMsTdOUj7AAGbzPdagA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Nk81DUJevyZuUi3rWQbWnOzvFbaYEj5v
X-Proofpoint-ORIG-GUID: Nk81DUJevyZuUi3rWQbWnOzvFbaYEj5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91168-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F075CAFD62
X-Rspamd-Action: no action

On 1/29/26 12:38 PM, Lukasz Luba wrote:
> 
> 
> On 1/29/26 11:23, Konrad Dybcio wrote:
>> On 1/29/26 12:05 PM, Viresh Kumar wrote:
>>> On 29-01-26, 12:00, Konrad Dybcio wrote:
>>>> On 1/28/26 8:11 PM, Aaron Kling via B4 Relay wrote:
>>>>> It should be noted that the A715 cores seem less efficient than the
>>>>> A710 cores. Therefore, an average value has been assigned to them,
>>>>> considering that the A715 and A710 cores share a single cpufreq
>>>>> domain.
>>>>
>>>> Regarding the CPUFreq domain shared across cores with different power
>>>> characteristics, I think we shouldn't be lying to the OS, rather Linux
>>>> should be able to deal with it, somehow.
>>>
>>> cpufreq-domain == cpufreq-policy here I guess. All CPUs that change
>>> their DVFS state together should be part of one policy. Not sure if
>>> there is something else you were pointing at.
>>
>> Yes, they change their state together.
>>
>> The question is whether it's okay for these CPUs to have different
>> dynamic-power-coefficient values, and whether the EM code won't be
>> thrown off by that.
> 
> The Energy Model won't support that, since it's a single
> instance per-cpufreq-policy and we have to pick 'some' values (in this
> case).

Do you think taking an average, like suggested by the original author,
makes sense here?

>> Again, they differ because within that shared policy, there's 2
>> separate kinds of cores (2x Cortex-A715 + 2x Cortex-A710).
>>
> 
> For this SoC I assume the physical HW (power rail and frequency domain)
> is linked to those 4 CPUs. That's quite novel configuration...
>
> Maybe I could give you some hint at least for the EAS part (the EM
> for EAS), because for something in other areas (e.g. thermal) might
> be really tough.

In this case, these cores have **fairly** similar power/perf 
characteristics, as evidenced by the measurements in the root of
this thread, see:

https://lore.kernel.org/linux-arm-msm/20260128-sm8550-eas-v1-1-fb80615bed5c@gmail.com/

> What are the other CPUs in that SoC and their DVFS configs?

Domain 0: 3x A510
Domain 1: 2x A715 + 2x A710
Domain 2: 1x X3

Konrad


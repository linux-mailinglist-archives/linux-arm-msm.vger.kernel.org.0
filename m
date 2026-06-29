Return-Path: <linux-arm-msm+bounces-114890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jpfFDDIyQmpm1gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:52:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BBA6D7AFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:52:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XrXfmgK5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NldsEXyJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114890-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114890-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68752301F30F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F033F823C;
	Mon, 29 Jun 2026 08:50:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2313F7AB2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:50:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723029; cv=none; b=A2giMbXw8pv2xMnr8tjMlm0A/Xq+dIJ9kRPNdpeTUvfEmiPBXMjvTvHwfh1M3duK1Vd3jYe3j5uCVV0SLLkiU5KKowH2bEezSuPeNVAaa75MWPMvzY0suBnbvPgztgZpO2pyfOrM+auQdKOEcUiTKat8YyxR4hhget/0sCRD5Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723029; c=relaxed/simple;
	bh=0OYSF/WbAtQT1B+XtvWfZQrqX3y8eIw0JK7SqfNhNOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blpGdO/wx+IwUxaUyXeEIiuV9mcn2yFKNecv+afq//bu9s7E5uEYXN7aBNeBFZbmUodFmO+FsHGKTGZbOqXBLpxshznvYIsa57Tv/GUHKw5y4jOB7I7HSzVkMp08w2ttW1zwAPJFUA7Qqe2OJSIx9xYgvFZBqUQh+OZaAMKl8TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrXfmgK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NldsEXyJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rUIh2089871
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=; b=XrXfmgK5olvTM+Hn
	UhfkBUXmsBpNJKDleDtco3igakuFyVPZ6kmyhCUNLOg2xC9ldOIpNEHqohvWNjOo
	J1vtMIydZZF5PRE0MGLIEtJpaB7fTJ0DbtjVdnfsh8Oty8nixh1K3RJIbvrNgehq
	IyXab9J+d58QhkbYmnjLtiZVM0eIJdsrKIGWiEHSUENVRAyED+8P+d/3DHDvBhrx
	+Ex1cA5LR0Pg0AijNrdPWSMs7LXn/CUbU4gOH6JsqUq6x+G/E+XwVOk8Wndgt5en
	34205GUOASRBHVJlCG/c5FbLBhM2aBhtQ2Y1hiGU1tkjCU4QTlvnSsMfRICW+LK6
	IDrRWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vgspn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:50:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b8fc5cc89so421744785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723026; x=1783327826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=;
        b=NldsEXyJcgBPb+dC+GZa3fBl0QSmXpX7MZLyh2yD4Nq8tvw/lR/f9ybtYY4upmMtVD
         4AmmEqxeXvSDjtgTr0HPpeoLwdGdQun7a/K6h+GTfhr7fhqnyzsKLPHr14YfrpGeg3eE
         Z3LMv72o/5lJTA93Pa1WECIbiotqeDkthdnJfT08HBrXDtaa9j0rGCrcEJZWphjGfX2w
         orazOX7NQ8HrWs8qAhU4B9s5o8E7vTOJ1awcCH9GewTQa8hnnnpM6xAd/pKhfq3YXZ4D
         N0TBfMEry1jqy1DMzkooOJE5PRL7UNVXmy8BfzvO82wuUEpwB0+qf7qnO9GW+cnhABpi
         lAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723026; x=1783327826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apEPJZgEeYzgAqQcyDRhVflzg8tLIcKoNRN+VQHe4AM=;
        b=nnEwhNslC3wu3xKzv+YHkyy5DQx98W++fi8ble3YzSNGs6kscpmU8dvaKKVUP26/Ry
         LPOIIVlz/OIp62fzmDDRBR9hbibjKHsY35JrfjDgwVyvnikYsaXVbKy0rhf5nSv6u0gm
         SZd3jnJegb8MiJX7cA6ourzmUPigXDnf7vEtoiB2C6t5/GN46/oqVqaS5SGSUp/jaKsa
         h/iLoF/EiLLLcncGqsxowJfU4+yyXOglw6Y57U1T31M1bUsk1ICq2sLGuSgj1NZl1tsa
         fBAepQEhthIpgH54v3DlObHXg/8qajMC6KzTPMjeALUs3clNW3Q5HrSegO/EvVWdDm1t
         2POw==
X-Forwarded-Encrypted: i=1; AFNElJ8IsICDNmDkb4wRNlTHmmrLzdxMZZr4Yk+m+DJUSbFGzx5lPdvJLz53RDlzetCzWiqL06oGHyQXMTHlG9h1@vger.kernel.org
X-Gm-Message-State: AOJu0YwfUgRKCPdmCr8S8YYgwCEHo63E2E8cMkWclG61hx4LCy4AjsoK
	tqDmsBdrvWMmuj6NFEDz+bVPK7eCljnnTv3PnsRl1ky1ZTD2CS5vekplWgy7/+MymwsY4YanOpS
	L4Yqqxb6BiGLcKXburTUTD3ImHqYYfXn8fCLFjacDxd96t8CVOiQysLjMa7nE+YofUQgc
X-Gm-Gg: AfdE7ckJbeE3aNj0Ni8hf2gPBK3PUdHCJxoAZGeEqp5anCA+v2/FKMik3NhcpR/a56e
	R1EzteOcT/GkBmt25w+ktMgClCU/nG3rk9L9I+g7zwc5A8cSjx9s9ZAz3NjycuHfusFDqgf3XMK
	MROAtyZgVAHNFqT3H1RZMJN3P8hfFxx5ziic6A4Gs0tQrebDGnCLhOrZckhmt3XJUZ/XHD5Xbbg
	FCBm4ot1iVdZ6yx91Yyi/wcYgGmzoPafZanesjJCFdWIAVIUjPe4Y8JZTL6GFtLCpWJwkGO96Mq
	Ubo6GHkOCMyWJ7wm0tfNp5bCZ3ETveoClRVncuWt5nG6nqheON5/cJpFSbQchX0NQWTwurpI7jd
	jcenAGhbimLyxFwFgUHwIrhEzPlCO36/ZwstQP7SImvbK19LiyZ4cuTKQvDUBOwLu9gnQht0=
X-Received: by 2002:a05:620a:404c:b0:92b:67e6:8aba with SMTP id af79cd13be357-92b67e68c9dmr1282505785a.68.1782723026304;
        Mon, 29 Jun 2026 01:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:404c:b0:92b:67e6:8aba with SMTP id af79cd13be357-92b67e68c9dmr1282502685a.68.1782723025812;
        Mon, 29 Jun 2026 01:50:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:670:107a:d931:c86f? ([2a05:6e02:1041:c10:670:107a:d931:c86f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm100251435e9.1.2026.06.29.01.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:50:25 -0700 (PDT)
Message-ID: <650a532a-3950-4a89-976b-76866e5d3aa3@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus> <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
 <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <2efc0f6b-3dd6-4267-b587-88c638f02be6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WM2bpaRsG_U_uIqVPAhwKC1R3F8j40uS
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a4231d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=CtSfB17q0sxskFCUDoEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MCBTYWx0ZWRfX80EM1ijqUZaL
 PvnKXyB64OKeEEttfw3OTSRxLCGQVeWH0T3AVmrXdmAiA3kAiFNTM8a/g43untS8S6a6KPoNHUi
 QJ4Wesjo68EpTwkEuuEYlm2R+uobZ8o=
X-Proofpoint-ORIG-GUID: WM2bpaRsG_U_uIqVPAhwKC1R3F8j40uS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MCBTYWx0ZWRfXxPhlC6c/dqT8
 XgF7tC1BaBvQmqgcIzw2Km4V3/E0oFe1sW8ZsiDWPU6B2F4Zi8jhlO2K/GzSQD2Bt3FQzcpe4Mc
 PAA3OYXzV+aTsjWCmM/WIzHg19J1j8fcURv6aFuGCQ6lvutWAH10DrPU2q34fEX8eYY8N0jejYA
 Knmyo1OQih5w+SiwJf1VCdX488l55IQwV0vUiidgbcC5fg3yeZ8l+iIEoviurbF2bjaA4210Etw
 I1/dInifceGNcIbCdiVA/bpT4BrTAuGIwj9Vub1Va/xAZQQoCMJm6U6XW5G4Yn2zSZhKqCdnany
 qjLYKQUlqrpurjxl1tUMtlGulbQH3oT9tgm4IRkQbKVf00/54IOmygF/Z499b1zGrDpP4eU3LgE
 m52yZZjz8Ot25kiIlyPk5KOW9+A93rdi3M7x0UqgpS3EOpSwc8QgFHCw4sDT3xZeCFCULQRm9j2
 YoLKqu715mwB220UrvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114890-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux@roeck-us.net,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71BBA6D7AFC

On 6/29/26 10:26, Konrad Dybcio wrote:
> On 6/28/26 4:02 PM, Guenter Roeck wrote:
>> On 6/28/26 06:50, Sebastian Reichel wrote:
>>> Hi,
>>>
>>> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>>>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>>>> the hwmon subsystem.
>>>>
>>>> The driver now registers a hwmon device providing access to six EC
>>>> temperature sensors corresponding to the SoC, keyboard area, base
>>>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>>>> are exported to allow user space to identify each measurement.
>>>>
>>>> Additionally, expose the system fan speed by reading the fan RPM
>>>> registers from the embedded controller.
>>>>
>>>> This allows standard monitoring tools such as lm-sensors to report
>>>> platform temperatures and fan speed.
>>>>
>>>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>>>> ---
>>>
>>> I gave this a try and for me the fan data is always 65535 (i.e. -1):
>>>
>>> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
>>> t14s_ec
>>> 65535
>>>
>>> This is with the fan running:
>>>
>>> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
>>> fan-controller
>>> 2564
>>>
>>
>> Not really my concern, but those names really add zero value,
>> and I would argue that they do not "allow user space to identify
>> each measurement".
>>
>> Also, do you really have 66 hwmon devices on those systems ?
>> Seems unusual.
> 
> There's a couple dozen thermal sensors on the SoC and each one is
> registered with a thermal zone, plus a couple here and there for
> other onboard peripherals (PMICs and whatnot)

Yes, the amount of sensors on the SoC is incredibility high and when 
adding the platform sensors it is even more. Here on my laptop there are 
59 thermal zones and 68 hwmon sensors.

I agree with Guenter comment. With all these sensors, from userspace it 
is painful to find out a specific sensor without going through all 
sensors name.

While testing the changes at every reboot, the sensor number changed and 
I have to find out which one it is. It is annoying.

Would it make sense to have a per-name link pointing to the 
corresponding hwmon / thermal zone directory ?


Return-Path: <linux-arm-msm+bounces-117298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XUvrEkPjTGpPrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:30:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 913EE71AF1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 13:30:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cIUj0nlc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=W4X9ISlB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117298-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117298-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6044C31383EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D433FA5F0;
	Tue,  7 Jul 2026 11:20:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F43F8892
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 11:20:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423233; cv=none; b=ZoinnnBv9CeEiA+2PT45VtXeHvrMcU69Xdr3vQWVj9WkCQsBJc0Jzk2b/1zl7xTYlDqJRr5J/92wBtW5WgpBC+CbcR+al9bc4wVUM5eafgy8u+D75jHWKN+DpB8WTW4zOOwRE7WOaxFjFMNbkiMq1ibX7g1pNovyXMqK/yIUfO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423233; c=relaxed/simple;
	bh=9JF5HwykZ2AmRNb+eHzU8Lff4gCdca3zI5sJWYFn3Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NKQjHgT1YeklLP7MyII83lY427MAlLAjXiAZgl9SCjkIckOgwQcJjk2dj8pNAHTiy1Ky3GzY2bwVC9/tERp3EkRkrhc1M/nynjh4efdZiYAt3NZ06uWFqxHv3WLCj0B2HQDC0UIrN6RM+Kpkw7Fs9vHT8zt8iCMPwxN1jP3lY+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIUj0nlc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4X9ISlB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678E2uS3070519
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 11:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozhkHGrtbGn2tsUAvP7G2WOvGFBIMdlw1yv9mdDL8IE=; b=cIUj0nlcnv6d9nH1
	AguUkjqucMzGKOaEs8Q0Q9lHHBacaIqkTlDmmt6pPK6ue/fvmmkmm4TLOFV6nz2h
	hbEzRBb/d7tCncrtdMm4I4fZWVDyt1aukWRNjk/4Ap9YCW2jLPP3+z4Og78Vd5cz
	gAFbPoEJ/axOaeJtehRCbGytjm40KEIesbV/4rlXOduJpuXYM+cH1tKv7qPUXrSM
	MCK6ywHH3iOVuid+eHx5ZofJfDbPgQfta8ZQxHPlS256S4n0Hwwv5ZPC+lWPHmSX
	iNldsNKFroo/HK/iCRIhwVG6BeyA4Mu9eGCaA9lP9na44QM3l3f2CIA3wjVMH/2/
	CZZvkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8hqc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 11:20:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so51549381cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783423230; x=1784028030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozhkHGrtbGn2tsUAvP7G2WOvGFBIMdlw1yv9mdDL8IE=;
        b=W4X9ISlBW3HIFAaRyZGvhRKy9eJKiK6sAHhVvzjwE9jHai7G8HCszn6ggX8U38y8zK
         FvaHOEM6iwvHS0UL5Z8REm8hLxVF9rec+1s3s5ZBD1MA286qwE8MgVQ81/tbc3GulzIL
         2EMEr4WtzGl1Je+TrWc9wLMxmaqHkDHRvM+6qhVypuatYo608q/plSLzas8t75Wfw+Kx
         I9zVoE9C7SFJdebooAtCZNKA78mq+K48M+Q4+DxOLleAYl/46o61ILwz1bmDqPctZPaN
         wafH+w1aSX16Z45vzgedk8l/cSIsTyDOw7ipDYtIwH/JAfUb9XsF1i/04dSfmAtXQWQV
         bVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423230; x=1784028030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozhkHGrtbGn2tsUAvP7G2WOvGFBIMdlw1yv9mdDL8IE=;
        b=Y1UEXN8/6z3vjOm4tU3PAjl0h9U+ne/CemHAWOqSKx8B+V2L9ltqxkK+NDz8Vf2czN
         1YMgeuCAdrbig/UFO7/0lC9kcr3CKq2nMY+MVa+rEl1DPqQUeRm3qA+2r3iqkUPNsRY9
         kwqAcnLXTmBu4/NWp2y6kfU34T9wlvRvL/eFOpqWzz0nKZucolsZGCPsweE34J/lLQgN
         XJoHwJ1JRdh7vuDVGJw3gDFHnv7WMJsxRBHwzRMeipTl/HHFIuh1dHXSzzj4MEwwPJUE
         4PF0Vi/r7COd/or1LHVV0WB35vsZtx+2MwRLdSXH6L7qYNohAPR7r9sKQNdJS4ETmR4F
         qAUQ==
X-Forwarded-Encrypted: i=1; AHgh+RotXM37aiT46RQLYYNfKhV1A+6JBFTO56gcN5i5+reK4sgfiHM7fiXLZkKk7ddbqRXsECKMu72UG2++nEp2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8zkEYLUToIIGUSB/ij6kOEapg0F96kU3zurWkkyj6Ir9RoU7x
	W7cH4EOYlypUvuXkCcTliNtErJeKgYVWTqD38rikVo550ytdBIVa0PZf4Esi/kWgJ7ZJ9nXsB8I
	sTd6e8/cMjpwGurdVD73AQxTU672nTczb5Hl8msdJVg7znHdoKxjCkwn2okqQgrn1THss
X-Gm-Gg: AfdE7ck68fv25FrWXTNN3W4t5cTMEowT3CLAwOmiZXqkjSDpQeNsav5kG03wGsaP8v3
	BY3UolGn8wOlIvePgaZ9mMwRNoBzNu+4HbujCL8mKOA5X052TSRd68rHrgDGW+UREQgIMSc/kVS
	Se0fMlqVzj4/TP8HE4akI2NL8ZQyymANiIwCHfpN4uhghEkfPFDSUvCE9MsR8rQZqX+OUR2CWSa
	McDb2FWRQbbQGFVXLR3PlkLIKCYSLAByS8C3Z1ytZ0bCdRRbKf4C7Dbd8tqB0VF/PVYRgEmUMfF
	c6TzQD/GQuBfdj5bq7da2EL7NlOtnEv8GmDIytnEHmeMSJ6ZUq4DBatlFmzqIzW4vCF26eZ3zqH
	BmcDV9RSCitTNFqhdjWnzcGIe1xgfwFFxTkI5lMY0NZIhRk5UCHcuFAS6Wzp+SvNIegaNrlz31s
	hopNZN48A=
X-Received: by 2002:a05:622a:130a:b0:51b:ec34:292 with SMTP id d75a77b69052e-51c748c4b5fmr49468591cf.53.1783423230060;
        Tue, 07 Jul 2026 04:20:30 -0700 (PDT)
X-Received: by 2002:a05:622a:130a:b0:51b:ec34:292 with SMTP id d75a77b69052e-51c748c4b5fmr49467731cf.53.1783423228842;
        Tue, 07 Jul 2026 04:20:28 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada023cesm109077066b.44.2026.07.07.04.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 04:20:28 -0700 (PDT)
Message-ID: <0426b129-5d03-467c-a61f-055e7dcf5654@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:20:25 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <bqRcqVTcU8Jl1ClRlFeaaigWdG8pICB20xCQDPVqOB5QHXdtjWu1UYXWqhvyAuj30sim2P91BHvVLHLYgdD7vw==@protonmail.internalid>
 <7e36238b-96ac-4269-a6e5-0a6763e437e7@oss.qualcomm.com>
 <6b5e573a-c13d-418c-af5b-759deb40bfab@nxsw.ie>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <6b5e573a-c13d-418c-af5b-759deb40bfab@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwOSBTYWx0ZWRfX+TtKrkLUaK/r
 t2Z89aAA5W7EMYB4mYSxsw4mvb3Yx28NKLLg5BPDI0T498BpmRmdiyKL/8MXTtDyqqcXan39mDo
 Se1iNJ2IfyzqnyXzV8uzPA5/mgLVyMGxGDj9A0IzI9v/SZ03u8xyDObhvbTDLpOC9iQCL+aOdgS
 l1cham83Vdd7D8XcEWbRiWQ0BEHqbXfJk4lDAGiQGxueKsY34LFsewr7YPlZPy377HG9DzkDbbd
 iTJzBdh9hMchTRQibgoG03mo4ps5wgCx+ul90BwlOC16LHcWHwQtmG2xHscEI7I1y6nGYkUvG7O
 8NmStZ2iNJ/G8/3R/UcddLOcy1rjo2xv8BVBcOniaLToAiaf3Wcj5Ia9ol1SdJAeZusAed5qYo/
 vEedSGdinPG053iqPEoYA1RF7K04DPAj5ADXLkAO81009nZiqA4dW71fTQYcVg4+Mtb9Hu5UHwV
 aYGC8x7Qkok0QoyORpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwOSBTYWx0ZWRfX+LfJjlfeM3cX
 wkoraEUfM4ZKCm/ZdJv299vl1481MA/6ubI2UcxpBNp8o9BzXiB2wXtJF3tP0TQfxyfbC5U9S00
 TxZYeuqQ5PcLyNtReX97YFiUk/D16pk=
X-Proofpoint-GUID: X2idwKsw7rHQts_bGdwlOBFFSZa6pdwr
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4ce0ff cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=J2XvcvT0q4wf4MKS_j8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: X2idwKsw7rHQts_bGdwlOBFFSZa6pdwr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117298-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bod.linux@nxsw.ie,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gjorgji.rosikopulos@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 913EE71AF1C


On 7/7/2026 2:13 PM, Bryan O'Donoghue wrote:
> On 07/07/2026 11:55, Gjorgji Rosikopulos (Consultant) wrote:
>> Hi Vladimir, Bryan,
>>
>> On 7/6/2026 3:00 PM, Vladimir Zapolskiy wrote:
>>> On 7/6/26 13:12, Bryan O'Donoghue wrote:
>>>> On 06/07/2026 08:11, Atanas Filipov wrote:
>>>>> Note: The handling of shared camera subsystem resources (power 
>>>>> domains,
>>>>> interconnects) for child IP blocks is still an open design question.
>>>>
>>>> Why ?
>>>>
>>>> A device needs to vote on its own interconnect and power-domains on 
>>>> any
>>>> bus. A sub-device of another device may wish to ramp a clock for
>>>> whatever reason.
>>>
>>> Certainly a CAMSS device will vote on all needed to it resources, 
>>> some of
>>> which are shared and got their description under CAMSS device tree 
>>> node.
>>>
>>>> There is no "master" device in this block of devices - save perhaps 
>>>> for
>>>> the CSID mux / wrappers on some of these parts.
>>>>
>>>> We have shared resources like camera noc, system noc and external
>>>> clocks.
>>>>
>>>> Please include power-domains and interconnects.
>>>>
>>>
>>> Why? The common power domain and interconnects have already been
>>> described as resources of the parent CAMSS device, there is no need
>>> to duplicate descriptions in every child device tree node of CAMSS.
>>>
>> The initial patch and work for JPEG was as independent driver. I agree
>> from hw perspective it is
>>
>> part of CAMSS subsystem and maybe from design perspective proper way is
>> to be child node not of the CAMSS.
>>
>> However the resources shared by both can be abstracted in other
>> frameworks, example ICC voting allows to have shared
>>
>> clocks which can have policy to keep the higher rate and satisfy both of
>> the HW's.
>>
>> So maybe it need to be decided:
>>
>> Do we want really additional logic for handling CAMSS resource of the
>> CAMMS sub-devices by the CAMSS driver and create separate CAMSS API,s
>
> No, agreed.
>
>> or we can use existing fw's for that. ICC, clock, OPP which all allow
>> sharing of the resources. Also there are cases where CAMSS and
>>
>> is not needed but JPEG encoder is: Example RTSP streaming or UVC
>> streaming which require jpeg encoder.
>
> Yes.
>
>>
>> Anyways my opinion:
>>
>> 1. CAMSS is not prepared and not ready to handle child devices, only the
>> populate child nodes is not enough. I think it is little bit mess,
>>
>> some of the HW;s CSID, IFE etc are instantiated directly from CAMSS and
>> jpeg and Ope are described as child nodes.
>
> That's not the strategy.
>
> The strategy is gradual transition from monolith to bus.
>
> https://lore.kernel.org/all/d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org/ 
>
Sorry i have missed that. I understand now the direction which has been 
agreed on.
>
>
>> 2. Jpeg on its own currently does not have any dependency with CAMSS
>> driver code. It can use shared resources without issue and leave
>>
>> the ICC, clock and other frameworks to do the job.
>
> Yes as a fully self-described sub-node so that we can do 
> compat="camss-bus" with the minimal amount of additional churn on top.
>
> Make JPEG a distinct standlone node now, and you preclude the bus - 
> you have to make the argument to Krzysztof, Rob and Conor that "the 
> old binding was wrong but let me away with a change to it now"
>
> Not an argument I will be making ;)
>
> We should put the JPEG, OPE, ICP as sub-nodes of compat=camss so that 
> we can make
>
> camera-bus {
>     compat=camss
>     power-domains=<whatever is common>
>     csid {
>         compat=csid;
>     }
>     jpeg {
>         compat=jpeg;
>     }
> }
>
> a reality.
>
> Put jpeg at the same level as camera-bus and you basically preclude 
> that model.

Ok understood, lets wait for more review comments, and move to this 
model for the next patchset. Thanks for the clarification :-)

~Gjorgji



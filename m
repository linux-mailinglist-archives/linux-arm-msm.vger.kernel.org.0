Return-Path: <linux-arm-msm+bounces-117985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7xGjFTWcT2oQlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:03:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11E7315B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:03:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MBwA3+2x;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="As4/PEOD";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64D0E30210CF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E860A1C84D0;
	Thu,  9 Jul 2026 13:00:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0F1A6805
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:00:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783602033; cv=none; b=i9FzdTkB7JPRpFZgHGmrWASatLTatLJPxj5oaxhv7EzjeKCMmL8VoYZgW4rpnrMejzNkh7N4B46VIDO0+Ym4YQBKZ+BlXHz/PJR1I9PazfW/jbMFEkHavP4vdRpgAf6aPD9/Dk5PgnuqvxhqHZ72ROZPTsLgPEheoXvfU9h8WFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783602033; c=relaxed/simple;
	bh=2XuPq/WRba3FTjAu98ml4DQzHgnP+f5ycQ4ACjYVP08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKB5XkbAy9h9KWZLoAQMdAyLYVSpoZXZrkdBHqV2gf46ghAivObpiKDecuP8dk3cGhkYK2ouzSZy+VF+ZEzAzsP8S0FLYQ7tpHvCyazYbFQIhDta+QB8nUCnQVOBmfuE2PLlT6raoZxHXpksUzQ8HCNb93zPz4CcGrO6d0bhA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBwA3+2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=As4/PEOD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN3CD1657757
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=; b=MBwA3+2xGaMFQIK6
	toISElGCjPxK6UgWx32m1txDEwr4XmT9we+dUbKAYmJyc4GpEG8LyIFR1yXywR27
	C2Yb2pZM+tpB1r3uiQEmmdsdBincSlHAnNAveR3TLbZl6yfEHql9Lw4OuA9TlXkX
	qwx3Dmuv3SY58JJ0qCqN7yx2PadrQD6xrX5SmMbFs4kN/Qu5+oWpVLQQUOfpq3cU
	VfHofYaawGCqbNa151hNxLg5nz5xcrD63BUvHeS3hsH00LA/oAWTa+AhteAVHVOZ
	CZYbzgRRYuP3l6wQqe7J3Wk4Fn1mIOZq8GP1QKv0jWjd1N1LEbD/pEUQ8y0aaIIu
	sSwWog==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3sp2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:00:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so9922246d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783602031; x=1784206831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=;
        b=As4/PEOD/5cppePo0cS+y0ulj+obpSfEw0Fn9xHPdFm0GNvUxgYp3fKbF+Rgr/WLhs
         auQlMcJJjjOZzre8q8Va+S7rjhSVVxP52Xlb+A3V8UnLFR/Q6DuliLQyI07veAWIo0vs
         PRKp+sV+Nto4AQ9+Yx0ze3+UNmLID1hfV8W2IKcP/j786D3E+wvnZc7S0YZc8u2jHsMO
         mot7QUTceO6y/5yGrJ1vWgQH4QqpIiqKLEApRt+FquM8nbLunhX0a/gvCFje5tWYwNOp
         eu+3fupTvuPXTFXIv3vbO9H4a3rYsfH6m58B69kpCKP3Ba5NIhVMJuKEKC3hLc8pLEjr
         S0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783602031; x=1784206831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuiT3NejTXLTQXJObb98dbO7y/vb+auroGgUt5oDP2M=;
        b=MGSjAwdVQHwUXRUzrZ8ZTNr3WqC1kvbNdDfHwKrSzkCxXbhBzqFVFPfKyR+6l5nJaL
         pQG1IP2up19YZ/53uElNmf3qEYCmvTnjordh1ZFfnVYNTjwBhkcxJEPaJLji5AEvNWZm
         iY4L0u1ER7Xi0oNhjrc0aVGtW0yoqzUtIz68x5h1xW7Yp6B/2XRieABDsCxCx34/CHF5
         /gRiR2VkzKjm/3t6yLKXVARcNk9JPSeXQdtVIu2TAGtRKOAkp2F6gQIaKWgr5y3eLVkR
         TC2TzxD8bUXxDynZC9eRkKFXkeOsE+GsmmmUNYpLW4jsxTRyI1uh2X3isk8LQNkNOH17
         Y1/g==
X-Forwarded-Encrypted: i=1; AHgh+RqQjIASbKtZW4RtfWlhiFX5w+Pwa+oCkmaMQjOT2F9ORlsZQG/xTAg9Q0F7CHrpRtnPEnx6Jrz6+mhj4OSu@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwid2n7SW8ibHO9N4M8E4xccHoYm30kfTYmYi5qVSUz1UPd5N
	zgEr7K0yPm1aTTdM922/uih9vITYL+uU9T//iLwUAGxUDyl49L3imXwAlrKC8mjPH+VH2+e2HDg
	AaclOMPjoElJ7rt0W6dK0tm9op1rDhUc6FfGceVff+fe1lqSkkS4+Qjxtb3aUEZHCt03l
X-Gm-Gg: AfdE7cnBstTd1qYfD/Z4I8YMJL2+zogubxJCPj1GX7KRKHhYxe7VZ8V4v0/++Gx58Ge
	vBBjftX+Q/QPlQlQtxjeh96qFc3frdNpXhkJDTkpNNNNz+q9C4VUo3lZPYo66RqCQF+DjqINoRd
	vI77IC13FVgxBRPmif/Z9KAqdXL8HRt1sogj1V425HGkrZF74zQNAcY+jcm6ucWgkKhSCeF4Brd
	16VBg0GeQ9cNcleRr9+hQXiYt4z+ED+cG7fp7Cb59BKHKvXxmglbjIwGFKTTmeanvRotiymVGju
	fxu2CPXO2yWKlY1Cj0LhwlVx1wNvGQ04FKBKgRGBz8jaR1TJdIj5COnoCO8kpEUUQuiHrDcDO22
	ig1bz4oGMk1kgHNOcZQ87xU3HvKc834KWrNg996CLFzALXa2/PAIoeRyBO40TlBpYErpNOo5qGA
	==
X-Received: by 2002:ac8:5f0b:0:b0:51a:8c97:937b with SMTP id d75a77b69052e-51c8b3f56a9mr74711081cf.67.1783602029882;
        Thu, 09 Jul 2026 06:00:29 -0700 (PDT)
X-Received: by 2002:ac8:5f0b:0:b0:51a:8c97:937b with SMTP id d75a77b69052e-51c8b3f56a9mr74703841cf.67.1783602025383;
        Thu, 09 Jul 2026 06:00:25 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:8e86:6bca:4a7e:8b62? ([2a05:6e02:1041:c10:8e86:6bca:4a7e:8b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ea082sm62035225e9.11.2026.07.09.06.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:00:24 -0700 (PDT)
Message-ID: <6585df3f-2d4e-43b0-81cc-72195a5ceac7@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:00:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
 <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LXUFBMyU4FyJ3I7yA5yvFjnKkGxWHxnz
X-Proofpoint-GUID: LXUFBMyU4FyJ3I7yA5yvFjnKkGxWHxnz
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f9b6f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=OGcXQ3cJPyzbm-w1UIMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfXxYQcBauNy+UD
 9A3B5/6lLLw57P3nBA7JAPIi5s1JTyD4MYOWaMIE3sseoDrK+Y2hiPToVloQmOfl+SE2bC3haub
 VpIwqr+IRPF1iUcQhy8Fs+g1GUWy3iA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX5wjAb/jVsBUx
 4rN7p8JDygalQYr9H+HGoyreY+1/MyHbwWj5ZmPspHiDkTPNDf5OXLIprCZuRbQKxfONIO+zQg6
 eh+qOggwzXFmDBRy27lUEM3Waa940t5PsCZ573tNTmtXy61cqD3NHS8KIAkZijA2BdGhxYSVJ94
 cDetooMoa5+7pjPmFlIzpCfJeIUnTulExzDnffxWg4LbvEQi2RSbj7QVrGCmOBs44yx0rIeCkFh
 pHYejJivQsHkFAMZ5++TOcnnY89siZHufgqHzaP7aFWM6mrfYtZ4pzpXB0FoWJ+zMxUXozPQBZB
 80BQHKWbfo/F3ooZ4/KvRKT6qEWz+jAV195pQ1JJHg6LR6aynRwpdfETkSNl/ujJn+0iM7+tFfx
 8v+XD90VBAYv8hUqy8+Htl2rGc2YJp1RLx3u6k41vKY7aGQaqVmaNOFYhTEZus6daT4SJTQNUlz
 27GOb8EMcHGtQBs5OGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117985-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:catalin.marinas@arm.com,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:will@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD11E7315B8


[ Cc'ed Maulik ]


On 7/6/26 11:16, Sudeep Holla wrote:
> On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
>>
>> Hi Sudeep,
>>
>> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
>>> (It is always good to cc all PSCI maintainer for any ARM64 CPU
>>> hotpug/suspend related changes)
>>>
>>> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>>>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>>>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>>>> retained. The hardware design on these SoCs forces a constraint to suspend
>>>> and resume the system on boot CPU / CPU0.
>>>>
>>> And you fail to explain why they have that constraint.
>>>
> 
> I still need the above to understand the issue/constraint better.

Ok, I think Maulik can give some details here.

>>> Is it because some secure context is not allowed to migrate ?
>>>
>>> We already have a mechanism for that in place and this hack is not at all
>>> required.
>> Do you mean a mechanism for the secure context or for preventing CPU0 ?
>>
> 
> I meant constraint based on secure context.
> 



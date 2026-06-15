Return-Path: <linux-arm-msm+bounces-113171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E9yxDXvsL2p0JAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:13:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11D6860CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:13:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hRmPZ4ex;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ANAmGXPO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 451B2300827A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C753E639E;
	Mon, 15 Jun 2026 12:13:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23263E5ED5
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:13:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525622; cv=none; b=iVzYXK/XMzqve309guPeDvyMFbXHl+GFYFdPxFJRddUPDjC4EbMXmDMA/78BRqf6GivfdBAbVg3IxanEdRQTCyY06F11YfFK9NRtFkMwS5071zC33HPK5ePwKkBsGbn3xVq7EZAzGN2FQOYlVenjwmX8j6R7zJg6C8Y+fvxQbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525622; c=relaxed/simple;
	bh=HkSC54Hy2rTVz4KTKC8+QN8lXf2J9rcMYlJ5TLyivOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKcyrUJUviTUWC/ue3KRTZlllwrdbY4AcnDC7KJTf/kMEd+oKpNk8kNB8aAwygdMoO9kueDIheYbkBR/j8aEmmuLRiGnhPqaDd22frxI0paQ8rFuHQF05gLTYJ/WYuV79VLdqClohtODyi9totSvPc5KMYES+RFmFCE0kCcJsRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRmPZ4ex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANAmGXPO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoW0O3885801
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYxdeCGcyinNCr/XFcysniXGZfkyVzQu72/fypNWtGw=; b=hRmPZ4ex+NnOrMvL
	TO4BVTHcDDa2GEkZqYVsO8jgmlj4XBLN+KyRGDZtssYJ51xNuUbgs0gnw3V3sefH
	HVy4I0hlUrgdO+F6zg4N5GqsNiD4dGPstwaexwknWxlHnH4fwndLzD1OJgXTGRnx
	v5Vq4gWTSHgyIcDZcUGlCo4o+NO+vgGWv1k2ZbpuUTMQjksPspAfJIlbgueeOCEG
	EyC/PPKsCmWrzP7hQRAFXCmABNOtjGeCRa2Idqoy6zhfJoW0bMebEcuqxASys3d6
	HcjCOOeQXWNAK0aM9r2VBx02XfeYiq/+N3Hh8UfX0K4SOz/ZPc02G7FCJ8327RZg
	azmpqw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjrkb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:13:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-59f0ad4461eso4753953e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525620; x=1782130420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYxdeCGcyinNCr/XFcysniXGZfkyVzQu72/fypNWtGw=;
        b=ANAmGXPOhx2l8gcpETlv/wnOH5x+OkyL/G3RoTnyXEeTvUYZj7P1SGKOBL5/55W/22
         e3smen2yXE9LozAfzfyUVvMXC3i/k25F9dm9M+X5prLQIjA71Ov7xBC5b6w+1mWW1LZg
         IHGE2oQzuc67MR5RBNRbrkN4373Ttb0QKhN88nyW6A/vGLP4v0V/v/l/3gdCWBjRuCh3
         6jn8tH/aT827rQZzvKPH4jQtFelh4Q9+zok74wNA7y4x8y/n4TGiwcvArWb4Td1opsZV
         hRe21Cz9AXQmO9k7E9umeC5i1Imhc2TrQaiotcbQdZ6g/0QG65lFfNBnFH6kUulaINVW
         MuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525620; x=1782130420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYxdeCGcyinNCr/XFcysniXGZfkyVzQu72/fypNWtGw=;
        b=JuCl1BTrp1fF4dyBPZfHFmJ0yUkl1iplhm5r4MOQiQ3+UakeuT8Vi7WdTXQbzAIpWV
         Gzz7vYH8NKii3IrMniFAKDcJJxcGrlI4dSuutA3J3CgyDUr+01k0G4eRVcj5S9UtVXNy
         DDQYZAw4JVpab1PrbWicn4AGZ1Vp+eMRNmWHh0JKabJyH2AzEHifjsj6c78XPTAoBHw5
         54qA9CP8U+c/rgMosruiTXiREXULqRWrsW/Ex8Nk1dD06kJ37fk5whmFbyIvnMkW3O6T
         we8kextSeMFBP7WDrotzYIw74sH5pYbe3mlojckvBVLNmwhA/TR2ArOOpbXWikNpzXhM
         Kazw==
X-Forwarded-Encrypted: i=1; AFNElJ/DlvdUiaj7ntI11QEf4P7wA6LAMx2vdiDPRQkeTtO/LuIOkNtDbXNs72PhCswUFIWdk7vOZ4l0bhdlTbOi@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtuthmppJdtBona64z+gXPEMjR78wzZXOhBsL8XyI11GDjFb7
	2JLyjcfbvpq8NxRF5XwaHfmKZVh8s2YUwZHAtxY93y0VZPp1Oq2Mz4kp1dQWZ3dFZf3qU7C8PAX
	TQvPh/8hyKEF3px4Q8hatIpnaNwjGPFIy6y8ISNVIB5uOSPv8+JPu3a9rKvHDOLfDLQSI
X-Gm-Gg: Acq92OGLLfp5zV9/l+GyBsrlCf1pqiypL8cGwjbp6DJxOWxCdl8q5AQAnDdFy2Sbbol
	uMSkIledaG90Ofq/rl4Bz+Nb5r3CBIFEnBZb03KsiCZPnSwtoIf5GwiyzUgtwIOyeaXd5SzywUK
	gI67PcOsWHY7Zn78z0h2/qCyAFsqY2ZG4msI03aL9ZfpezZe0Ky0aQuKdunUinRr/gyAkzK1rA0
	HQqRmd/jDadRE3qcyIebjFKkLNGbrw0C1+bPU2m4+zHorDgMyCZ8qIsNDB7ncU+x0W9VjCXnMm6
	7ZC7N17oAwNQI9XEXSxvDn7+v+znqiklg6Jy1fVtoqXnfALxF9CQVLbsEwYHoXh8gyCn5zW/zU0
	ZIMj68HNu+yyKJTIWUBRZ9yUOv8/VOg7I/YqKR+J4u1n3JHYF94B34WTVy7IFF5qq62ekqkD43v
	UenKS4VY+gIbNLEg==
X-Received: by 2002:a05:6122:828c:b0:59d:8734:e801 with SMTP id 71dfb90a1353d-5bb79c3e37dmr5012540e0c.14.1781525620014;
        Mon, 15 Jun 2026 05:13:40 -0700 (PDT)
X-Received: by 2002:a05:6122:828c:b0:59d:8734:e801 with SMTP id 71dfb90a1353d-5bb79c3e37dmr5012522e0c.14.1781525619629;
        Mon, 15 Jun 2026 05:13:39 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30? ([2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d2449sm234107825e9.14.2026.06.15.05.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:13:38 -0700 (PDT)
Message-ID: <6a7db21f-a0d8-45e0-b71a-cad63fb043d0@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:13:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
To: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
 <20260605104330.GX3102624@noisy.programming.kicks-ass.net>
 <87ik7x5gba.ffs@fw13>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <87ik7x5gba.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX80KgwLRPvXJy
 ny7yhMz9m4g/pbC2XMvbtYRbtS2ZCpSfZbk3kAsnODWyyKTMgkoIrwamVqjB1k0ZVtvnr1dhYeg
 s/xvZ3pDvkVyABsoibywPbGlK/6t+B5I81sKmyhLMhlAKC6btV4vWRa4SF516aOrZuoPuzYfYHp
 i+nEzNLQGe97cJjS3glDkVG+raE+W6gLtzM+RO0Hllq0DccY2TuZ0QkH17ZA6WeJ4uAGV7DpiQS
 sJHVZ9R39Nn6X7wWPSFYrQht8kkAsEm5srSgUbls+4ruPeYApXGnCJz/ZGLssxwNBELfhXpRhuT
 MGzCzIoRb8iRgjhTzVErPvqvjvCpQI/ZIvLP/VhIsfBv7HSaFwmzklAxKLsIbUlvjHqWslk8oqr
 3UD2AGWt3oC3VGxMIyg/G3D2y6lQ8hgJK46g08HCrynQ+JhFYojsGik2J3z863XpDaI4o6XXldg
 ++PwwTPCW1HKrkRC/Cw==
X-Proofpoint-ORIG-GUID: D5TduiSfEusqEL6BEG5MSGgvFl76bj2Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyOSBTYWx0ZWRfX3z9Q1UFLhnfk
 Vh2DAvMWR9jEZeLU3cJVM8uZF5mT9VfffmCNFSTdkEvK40vLfegplWGwRspcWewW9Y3KZEBtDIG
 QIlt4qW4a0eSoIUIyNY8bZnD8sQIB0w=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a2fec75 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=58ofpu1a7HmJm70nKAsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: D5TduiSfEusqEL6BEG5MSGgvFl76bj2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:peterz@infradead.org,m:sneh.mankad@oss.qualcomm.com,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA11D6860CE


Hi Thomas,

Le 05/06/2026 à 14:20, Thomas Gleixner a écrit :
> On Fri, Jun 05 2026 at 12:43, Peter Zijlstra wrote:
> 
>> On Fri, Jun 05, 2026 at 04:00:46PM +0530, Sneh Mankad wrote:
>>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>>> retained.
>>> The hardware design on these SoCs forces a constraint to suspend and
>>> resume the system on boot CPU / CPU0.
>>>
>>> If CPU0 is already offline before starting suspend to ram the
>>> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
>>> proceed further to invoke PSCI SYSTEM_SUSPEND.
>>> This leads to a system crash.
>>>
>>> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
>>> config and when enabled prohibit the CPU0 to be offline.
>>
>> Why do this in generic code? Why can't this live in arch code.
>> Specifically, x86 can't typically unplug CPU0 at all either.
> 
> arch_cpu_is_hotpluggable(cpu) provides that info to the cpu device core.
> 
> No hackery in cpu.c required at all.

Ah, thanks for pointing this out !


Return-Path: <linux-arm-msm+bounces-111656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id flntBe9FJmrVUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBB65298F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:32:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pu4NH3fB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kKnpskRq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111656-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111656-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C538630015AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 04:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3108E1F91E3;
	Mon,  8 Jun 2026 04:32:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E64134CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 04:32:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893160; cv=none; b=d04u/mrJSLhiwTqQ0BRQUPa217zEMG58STvbtfliAtsnCIqKHOSRw4F1iTpaevbVXPHdIFH7RlajHlZTFB9kb2zlZmQY0EPhef8QwNIaRORQqmYKeMU1mvY4/sXXt5MqUee2LAREC16br/olcbAfpPZJMHzB8CuQQMnxxS10JwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893160; c=relaxed/simple;
	bh=JZpmG6C0+Pi7UOPLxctXabWtx7LNxwJc3AoSsxhRaqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=E+dPAx1DJUZSo8OK5CXatcwZwL8RnqmSWIiijLdjkZm6lFhXnVmjtei/K8DEZM8HrlZcXs01EsOEeAvax4f6syeZyfNDou5IGqq/794c2MmVPDvXi692R9QzjUDompDD0NN9rFI0bTmBl95HY1TEmbhfCyyH6tJSNIlt/Viku0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pu4NH3fB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kKnpskRq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EJCB1574748
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 04:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AhE1r+/Z7fVsTmMsF7iSZtgbqyLki//uNGgX9+Uqu0I=; b=Pu4NH3fB3QZanzjY
	ZtkPCTAEQirUnqtJgso+XYtQtN2XJf1T/KHHHnUIfeRu98HWczrsyfj+s+yVEEd/
	JI2pQoydqhsma+K+GMbM3rZFDFsjvT5yWUK4re0b2zR/lncxEsfSa5rR7y9Fwr1e
	AEE7RI6VtyUjuYNLhSNfGBbdTL9pwzcE0sGovqbuvvKXODnKL/S5S6wLsv26nhJO
	naQIBiwyQodqm7N6D/VXCDPcIizGQRPYg1XRBK3BQTvQLmoe9znx9WzoaBe3+DDi
	X9PDKEnyUwOrTjOHFaBOFsl3dxuXA+DvnILtVMa9ut0EFI9BNOPDb/o+LKj3Phfy
	aUv3Qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cx9mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:32:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f4b76so40530205ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780893158; x=1781497958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AhE1r+/Z7fVsTmMsF7iSZtgbqyLki//uNGgX9+Uqu0I=;
        b=kKnpskRq6wxgd+5eWxGZtcMdb72VNAsNfnheDBgPcRXXr+9eVMU/tVZOs8VAj1mvfo
         qetckg8+pjAE8ONU9RFQZDFxlSdq69xMaGly85/wZAhFY/ugizZmcM5WjSjM1TOoPELy
         u8nVEmBqLLvGgM8X9Lgc1DIVqgkdpA43hmP8Q4FWqUtvKXvn8Cls6mr/kSraCu1jpDgu
         jHmZGE6+WtNrCL3OZPcLsgaOVbTxAiolvm3DyHoXOOhADte6hn65+Di+O33uz2ehju6K
         fMWvEYewn8H8aSLVAnky1kNP0kBfuV7i9HxNQ7RaNE/LYMtmDh8dM4bLRkIvXk8vOayQ
         s/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780893158; x=1781497958;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhE1r+/Z7fVsTmMsF7iSZtgbqyLki//uNGgX9+Uqu0I=;
        b=OJ4SiEFVTJB3O09YIBV0INSL0luR1XckGza6dcEWP0wtSdDaf1XMkqK/xE/lwDXesK
         S4eEF+XPohbffNQ6Z9I+DPuw8BJLUkgX8DBv4QyIdPsu+XitCBVQSrJAcoZc4NvSL8Dh
         kvJZpVuxVvzgeMePGjJRls8cbtQAje7WwWm5gE0wRyegqf6QRMt4jGeBhbMa5bFQbly6
         2KmDUrEh5BjdkH82q4lwhJ3QiVO08c6zgbhhkz5y7lYeMJ31RXVbryKH7E0pMLN+Ln4/
         TtYH2MDT4IBaHro2/IaCuiawhCGJUryLd/1N6mgCxrOKRA52W3RltQZPJsthZ48ktT3u
         ThMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vqi+pPCYQIk0qLFNABUQ0nJ9xnMOlI1GloQDSC/tri2Xfx8kCyl+5TO2ycgsNQqKds3ZSj6PFTaQMvsdo@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbXPrATKJdWOgoi38qFe1sZoVGNLb3K7CWGkkYMxr1tpuKa7R
	UlzQnBzjOsnRi/e0x25QdVosWId066QFpHy6cHPCHufxWN13di9qWHqMu3Bd5uk5BeazGh3sJGa
	23/c3i1CtLRTP8zxJxp3zonyNgj8VoFiIrGrkBJjxx0Ffzrv5RPE0QJ0ien7Sus7YYR98RrA4Ks
	O8
X-Gm-Gg: Acq92OHCtbxOlQMAANESjRdMySjc3Ki6YDiwftsUaBbd5pQQR5id8xSfJOBL3CoGE3M
	2LXulgClKcKUUI31LvmuXD2zQh49dyyvPQ3MbjIi38FVc2RZSgiy04A/Ysq5SzdRPPRlhvlXJlj
	tj9vnvoNBGWHykBQDOq9lLF2BRgOdlfCeM32V41chnZD48TSNWvEYc3Wq3dnP+b3AVfDzQbI2Is
	rZvMIQ1wHnoVeZYKctTaRPdD3MgAGexOrikC+80NyOziyBKlPr6zzWH7MsI3U3bTk+P62HKBhCF
	1gvD/4P9mrf7isvzOntRjW1DvahN7KFq72GBdDUELcGDQ4FgCSP+2XWbapU591Vj4NuS+/dinK0
	h5oV3EFFkkgmJhGPKDFk0c+3wnA72cjbIVVoDa5JPJ9+T9ZZPTohgvLg7rGxyLFB/Al4Tp3ciLD
	bBdiRZJ1ajrxE3LDKQwde3JaxUfLo=
X-Received: by 2002:a17:903:1a10:b0:2bd:606d:b342 with SMTP id d9443c01a7336-2c1e881ff09mr158867615ad.26.1780893157570;
        Sun, 07 Jun 2026 21:32:37 -0700 (PDT)
X-Received: by 2002:a17:903:1a10:b0:2bd:606d:b342 with SMTP id d9443c01a7336-2c1e881ff09mr158867175ad.26.1780893157068;
        Sun, 07 Jun 2026 21:32:37 -0700 (PDT)
Received: from [10.133.33.209] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm166345345ad.26.2026.06.07.21.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:32:36 -0700 (PDT)
Message-ID: <ecd4007d-7e8e-46c3-b8fc-bafbac48f762@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 12:32:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] misc: fastrpc: Fail Audio PD init when reserved
 memory is missing
To: Jie Gan <jie.gan@oss.qualcomm.com>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-4-jianping.li@oss.qualcomm.com>
 <7e5299fd-85f9-4f74-9e69-5192aca81f05@oss.qualcomm.com>
Content-Language: en-US
From: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <7e5299fd-85f9-4f74-9e69-5192aca81f05@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzNyBTYWx0ZWRfX/Ba5QmQqIV03
 F2Oj6HhaR8Nmfp2EBKK/hTGzbU5jSwS7CROvJgMB7F5pS7YUoejxypX+y9P/J5fC/FLhiRqfCpG
 aXGEpe929gK24pBqq+4zo49xad6pK2DnX9IA9IYf+pviO4QQji5K+yXvv67+M+Pofa3IRD6TZ0G
 3vo3f1PWyJEpZRerX/1lOesBUJPjax/EHyU/aS4HYIcUcsYxGFdXVAIQkTjdZMzGrFHsgyRu7GV
 s+HBHvjLMrqJPCH+DnDF+UF+iG0ViYO+0fTpAdSJYv6Hwdh3C/t5yFJ1+21jbcphI2vNGqHbIKn
 IQtEwGgYMAJLsk3Qb5kVKrBZxA9uTHvryJQhJVB9Hpxm8LnaD78/8/TkYCX0Kqw0PeWEKL/z53e
 kF0SK9nPsPBTGGQVWvwY/zXWuTUPYl5Fcx+WWkcVXUhq2TjCg5hAmdAuNG1h/yCWSxTT59b7q2j
 d1UHLcFqbomf+YlEG/w==
X-Proofpoint-ORIG-GUID: uDBo-byh8UBsicDthDQTfSZMfXmoAN-z
X-Proofpoint-GUID: uDBo-byh8UBsicDthDQTfSZMfXmoAN-z
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a2645e6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LuRWb-Sg13DV_SJKcp8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111656-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianping.li@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04CBB65298F


On 6/2/2026 5:25 PM, Jie Gan wrote:
>
>
> On 6/2/2026 3:17 PM, Jianping Li wrote:
>> Audio PD static process creation assumes that a reserved-memory
>> region is defined in DT and exposed via cctx->remote_heap.
>>
>> If reserved-memory is missing or incomplete, the driver may pass
>> invalid address/size information to the DSP, leading to undefined
>> behavior or crashes.
>>
>> Add explicit validation for remote_heap presence and size before
>> sending the memory to DSP, and fail early if the configuration is
>> invalid.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index a8a58f889d07..f46a8f53970d 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1354,6 +1354,13 @@ static int 
>> fastrpc_init_create_static_process(struct fastrpc_user *fl,
>>       } inbuf;
>>       u32 sc;
>>   +    if (!fl->cctx->remote_heap ||
>> +        !fl->cctx->remote_heap->dma_addr ||
>> +        !fl->cctx->remote_heap->size) {
>> +        err = -ENOMEM;
>> +        dev_dbg(fl->sctx->dev, "remote heap memory region is not 
>> added\n");
>
> should be an error instead of dbg info.
>
> Thanks,
> Jie

I will use dev_err to print this log.

Thanks,

Jianping.

>
>> +        return err;
>> +    }
>>       args = kzalloc_objs(*args, FASTRPC_CREATE_STATIC_PROCESS_NARGS);
>>       if (!args)
>>           return -ENOMEM;
>


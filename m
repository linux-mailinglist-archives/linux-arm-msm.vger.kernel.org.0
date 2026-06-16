Return-Path: <linux-arm-msm+bounces-113474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vDpvG7a0MWpqpQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:40:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB5969544C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:40:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="o2Gu/dRg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GNakPavh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113474-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113474-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99851300B089
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BCC3939B4;
	Tue, 16 Jun 2026 20:40:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28513932DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:40:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642417; cv=none; b=rtFCrkjLJ9B7fDtZZoGX03YuzlmqvmFDJj24ZkbHiQcwZoYTR400I60WTnFK8rj0ayPzwAiJyKAQ7WqhPRlOlHRZ7XY1+OOathU/68Tb+WxzR3FdeGjSXBPSbXzvYeEhh6AiMamyKemSlGXfyoZcqtqZZToEx22qonUYy+8WQ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642417; c=relaxed/simple;
	bh=FvFj+5EIg6McKSYYqsWhWWHSLVdM5WfWCSdWK7+N3eU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UxErvUgBjCHPoTwmpFgk4P1jFUv9QqTCGEokvvTvj0iJZBX2AF8UJ7lEc9Aci3i+JNNnrZKaa5uabekSyciQYPGTKJBvBW0dEapNfWODi5sPBO7T2iyc3USeuPWgztzj+FK2id2pJQ5ggtBXFHd81SQbIUloySGdVoQTHyZFgSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2Gu/dRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNakPavh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOiYx3914081
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:40:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ic86l4o+detrY2yDzZpKBbhKW8tVKKZYxe8m+2daI8=; b=o2Gu/dRgEgs97XtD
	Y5L+AeW9nx95VpNIRq27vFi7sKB5dVtDpjVJyyUFcPZTiHFPsa1jwxzYknPmaAU0
	xNpvK3eUw6oKaQc4f3+BpBBYYtIv38ceNUCqxQoUSSiQrn6xEs7fSR+hKgVXaR0g
	7FD2YcabrYMsDygXQ44QwmLQCtD8qv9v2BlEtlvKpNAvI2cg74Dy48lEdQo99ihK
	jbJMgkVX8zzO7l3GSWuTNjULTbscrttCvRpjssIxwztIbVd5M/AiobuhWkBWkin4
	plyTuyr1jRfvTA4ZYHNB/4xqKX3zd+7giAfTkmJRgOOXoBsxSXsug01qCkvRYq7g
	79TlIw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7v5nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:40:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157de5360fso50712985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781642414; x=1782247214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ic86l4o+detrY2yDzZpKBbhKW8tVKKZYxe8m+2daI8=;
        b=GNakPavhpnfeKppumLmgq8uUMLOlEtP6AWWtxN640Wp8bhNqZfs1p39J4kK69LeNRg
         AXVrIXra2z+/FuabVLxnyxwrVxWidxyoctytaSpcMnxuuvV2qq+0RZm2QnJVUL+4PSHO
         h7jSqzXHZtXvkSe1Vp+jYA+Cd+M+nuaCIxoDqvbGje/HlEaCi36j/R8G7O0SqQjNZ3UI
         /UzL9aIPWtcvVc4jy6uNUNRD3XQ2ogfuvnoSqaqvPmF5AgRAoPQb0Xj9iD8bekE7gXa9
         lT8eu+rNFfGDGGCXTTw9gyxYCBPw6VqBVhTlMdRAESyBtOGuCDRQFCR6fsS8k8FIuVDH
         enng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781642414; x=1782247214;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ic86l4o+detrY2yDzZpKBbhKW8tVKKZYxe8m+2daI8=;
        b=SCnsheUknTw9Kl1ZU4nIZ9mmI4kLnPe37Q3/k7e2E8DAg10Hm02cpER4xtnzKyb1CV
         G9pMJjwajfdWY49kpppjX9K5uZY2d8JUJx7wzDFIpXAHe9hn5uJnV2ZopejiwLUON4fv
         GRlFpVCOIWxMy2dOmz6JnM5AJKoJYBlce6BecMkI9GdlQLzKhDX6GGNFL98kLDyoRPzA
         sZe2Xns94k/4gbWF06CQhllsoMnLETaa8ryId+EzuSlIR32padbRegctdn5t9QEWCS4S
         P1ZjTUXiiFd9m/KabVYuQ//CcVA+hdF7qHblycGh+EL5hCexSM1JSsSnWyXmJZvzKYrb
         Ssog==
X-Forwarded-Encrypted: i=1; AFNElJ99BbA+0Q1JsFvltrNolr6IcTuzh3oy87DBhG/udj9QyngEWf6EEWf/fK70xCkmdiGFeMjDCxpEl6Gfdab0@vger.kernel.org
X-Gm-Message-State: AOJu0YyYAuqCapKSF7QlYDklHnczrV9WzcMEaEIx/Tn559wvXwVJUKbI
	daaR87oq2kuldL1Tdtf+wT1MRv7siHXgTsENv+Mjcl6ZaGxRTxlpl9Q1x2j1O609v1mS9UNsLtc
	4xW25x9xDGOspNh8TjhtLsxJTX2pfo/aa9EaFvSxisoPcwwgCPV3klVKQLRarbVOGnQmv
X-Gm-Gg: Acq92OEKZGMAns3xy4Xy3oOBlUg+51gWJ/di/E31B7ZdKbVBipSeQt6UMI4JGjB/W/x
	xsWAz6jfKBxQ2rbWrZ0KCL6Sy7a0vvt+PN+qWC3O/FaZInZvRPqWYqbKE1kM9CRtvgqyuxWARnO
	6b/CkWm++NIBu+EGyRH9vPfNKu7RGFwiwiOmp1YkhC4FFtIRmDOlyXGKzuLdGfQqdDODe9ZWeqP
	UyWC7GzqAgvvo2xhiuBS+R8OJYf7Pn3A2926NFpPvI17Y0pHaQazZk+2dIGZJ2qM45Fj9xp4KHK
	X3pRZKylRg3VdeVFp1t692Qjw1kc80jtY1UvqVtl18CKqDZjwf6qqg/1bCd3lDKoxALITNzDS48
	4TdQ/7KrEg2Cp2PIHydR4D1nxqWr53Gdfk2XscAbsuLE2pl3cusjZ+aPs30Btn4PN/Pxe7MY2T2
	uGsW/6aVHqcWEASpsxBdcuNInQAHOIUsST0Wzg8TIQ7n4WhZeMxuDdCrGGYqsCti7xG3vhX9Muk
	jtIY5ZgJ14tgat8
X-Received: by 2002:a05:620a:4804:b0:915:aa65:6e95 with SMTP id af79cd13be357-91dcdc7b908mr33534385a.44.1781642413982;
        Tue, 16 Jun 2026 13:40:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4804:b0:915:aa65:6e95 with SMTP id af79cd13be357-91dcdc7b908mr33530985a.44.1781642413489;
        Tue, 16 Jun 2026 13:40:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:518e:e42f:e83f:43ae? (2001-1c00-0c32-7800-518e-e42f-e83f-43ae.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:518e:e42f:e83f:43ae])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420179sm712199366b.8.2026.06.16.13.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:40:11 -0700 (PDT)
Message-ID: <829fa641-dbd4-4319-90a2-99a24934e0df@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 22:40:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
 <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
 <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIxMCBTYWx0ZWRfXwgW2nHkIYRue
 G2oA8+lGlCjN06RTIZR/kkAZiOWJnRZlV4mOevhUXZgx4/O3BgE2zl0FVi9x+KCdCR7EwZviTGX
 FpqnPVywNwDoDLDOtzTVQsJTjPCrKEpR82oJoRp74ilTXguK/hPwXcKLTDx3QWy/k9fKxWUAOut
 irPuifuNCqxnzdDU87AhRfB78cGDHWSPuFCfXWrJ5cT07UPt9Y7SBd5BzOa+Syzgt5b33Nk8897
 NhWP3VdckhHxTCNbp6KgPRtvl1lVOzYjlaoLzCwLuZKIxXR1qUVVfIRrooZpDfCVhS6yH+Xp0K7
 Nc/EPvt4HJwI5b7LSnG+5IKXPTgE9zZwRBX5oRCxcKcmOfAuFboY7tOYbE3GGGmvie5xrMzU4kJ
 yyQGAc0HHOycB67b35oeyR9imkvLmb9j6KkTnE0+n+dF8iz8BXA1emSzt6oWBtmQsD4KQpD5ZBU
 j3fB9LR0Del3P7A/03w==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a31b4af cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Vsc-HiIW_TZ0MqiB9scA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: T7bjq8OuQztTz2lIyQL3JdOjmmBXh7gQ
X-Proofpoint-GUID: T7bjq8OuQztTz2lIyQL3JdOjmmBXh7gQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIxMCBTYWx0ZWRfX7gJj+rh9OIZU
 IEGU/TfS2fK027MQ8n10pdqWoW4K6My0JDhdtV1SSpxNAb5S5RlmBWfuEWD/HDv43Sfaw07lz/O
 F7nSqsv2cOK5mhGs3Qn7suMFqAYHMQg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160210
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113474-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DB5969544C

Hi konrad,

On 16-Jun-26 1:04 PM, Konrad Dybcio wrote:
> On 5/25/26 2:46 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 25-May-26 14:29, Konrad Dybcio wrote:
>>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>>
>>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>>
>>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>>> correctly show mem blocks matching the EFI memmap:
>>>>
>>>> 82800000-829bffff : reserved
>>>> 829c0000-83efffff : System RAM
>>>>
>>>> Instead of:
>>>>
>>>> 82800000-833fffff : reserved
>>>> 83400000-83efffff : System RAM
>>>>
>>>> before this change
>>>>
>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>> index de0f2346cb38..5a2e84365901 100644
>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>>  		};
>>>>  
>>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>>
>>> FWIW the reference memory map shows a contiguous block of:
>>>
>>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
>>
>> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
>> aligns with the EFI reservation and with the dts reservation
>> after my patch.
>>
>> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
>> both EFI + the dts (old and new with a different start)
>> having this as usable RAM.
>>
>> The 0x83f0_0000-0x8400_0000 area seems to be marked as
>> reserved by neither EFI nor the current dts...
>>
>> With the first part of the reference memory map aligning
>> with what EFI shows, I think this patch is correct.
>>
>> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
>> range though ?
> 
> The logs in your commit message suggest the UEFI ahd already taken care
> of reserving that bit
> 
> Could you post the full output of `memmap` in uefi shell on your device?

I find just booting with efi=debug easier. Here is the EFI memmap as
seen/printed by Linux when booting with efi=debug:

[    0.000000] efi: Processing EFI memory map:
[    0.000000] efi:   0x000080800000-0x000080dfffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000815a0000-0x0000819fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000081a00000-0x000081a3ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000081d00000-0x000081dfffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000081f20000-0x000081f2ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000081f38000-0x0000826fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000084000000-0x000084afffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000085380000-0x0000866bffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000091480000-0x0000a67fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a6800000-0x0000a7f00fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a7f01000-0x0000a7f01fff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a7f02000-0x0000a7f04fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a7f05000-0x0000a7f0cfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a7f0d000-0x0000a7f18fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a7f19000-0x0000a7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000a8000000-0x0000bbc0ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000bbc10000-0x0000c177ffff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c1780000-0x0000c178afff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c178b000-0x0000c3933fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c3934000-0x0000c4c76fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c4c77000-0x0000c50aafff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c50ab000-0x0000c54fcfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c54fd000-0x0000c5b12fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c5b13000-0x0000c5b21fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c5b22000-0x0000c5b23fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c5b24000-0x0000c5b34fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c5b35000-0x0000c62e3fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c62e4000-0x0000c62e4fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c62e5000-0x0000c62edfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c62ee000-0x0000c65f6fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c65f7000-0x0000c66d5fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000c66d6000-0x0000cf6ecfff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000cf6ed000-0x0000cfbb9fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000cfbba000-0x0000d0020fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d0021000-0x0000d5135fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d5136000-0x0000d5136fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d5137000-0x0000d5cedfff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d5cee000-0x0000d5e7dfff [Runtime Code|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d5e7e000-0x0000d6c8dfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d6c8e000-0x0000d6c9dfff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d6c9e000-0x0000d6d02fff [ACPI Mem NVS|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d6d03000-0x0000d6ddefff [ACPI Reclaim|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d6ddf000-0x0000d6ddffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d6de0000-0x0000d6e0ffff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000d6e10000-0x0000d7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000de5b0000-0x0000e46fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000e69c0000-0x0000f84fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000880000000-0x000cc236ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000cc2370000-0x000cc6bdffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000cc6be0000-0x000ffdffffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000ffe000000-0x000fffffffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x00000c264000-0x00000c264fff [MMIO        |RUN|  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
[    0.000000] efi:   0x000081a40000-0x000081cfffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
[    0.000000] efi:   0x000081e00000-0x000081efffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
[    0.000000] efi:   0x000081f00000-0x000081f1ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
[    0.000000] efi:   0x000081f30000-0x000081f37fff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
[    0.000000] efi:   0x000082700000-0x0000827fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
[    0.000000] efi:   0x000082800000-0x0000829bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000083f00000-0x000083ffffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x000084b00000-0x00008537ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
[    0.000000] efi:   0x0000866c0000-0x00009137ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
[    0.000000] efi:   0x0000e4700000-0x0000e47fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
[    0.000000] efi:   0x0000e4800000-0x0000e69bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
[    0.000000] efi:   0x0000ff800000-0x0000ffffffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]

Let me know if you want the efi shell output instead of this.

Regards,

Hans




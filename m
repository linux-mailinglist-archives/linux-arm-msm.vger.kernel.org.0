Return-Path: <linux-arm-msm+bounces-113648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cP6oN4SgMmrP2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:26:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5402969A152
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:26:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=leVczVH5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PNeB5ZvV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113648-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113648-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE1EB3028C5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12C23A382B;
	Wed, 17 Jun 2026 13:24:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287683F1AC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:24:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702663; cv=none; b=T9YOM0Qypzk7v4+uOc+eSUtNI1fj9bqL/y1DeESWENTX5CSnbypRP+Imvd4KUgT+ptyIQgUsLmFUX6OkTF/j0ssbZxcW/wWLjwU0+TeK4MXEtslc5Iuywml3z0JUB0Amv0PzGlAFqgnubI5kVzReztmpXplwHFAa238cyMz0uxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702663; c=relaxed/simple;
	bh=4Tn2ySMFZIIRwdvHiA0vnWyqQiCS21SDTZkkqZvC6AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gA/BRHAi66LYzX2q8ndvGxDT+BizQAznqm2lTtVsLnWJonZIkwjP8Y9tYpuRjEQPYjHVNxa4mXhanKpmkRrwiEmnvIDPIWmSHyNU3tDlJ7KrIfOdQ5iBtawipD8jOVD/DP02/BoB9NMQRUu8bSwtEs+u6woxLlj0BdvBQqVKQdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leVczVH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNeB5ZvV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HDHuKs2919597
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMBSdbpwBipKU1ms94J9YAyj0MUqDXodwBtSD+c987E=; b=leVczVH5TG07KI/2
	0Vgh9NulvK2LxqW/NP/GjvlduaZN1kqK7Q6X9JXKtHU2GUuVAnpCyULEL71vjSfs
	pgGRwxBXuzgXhiMmCK7qXOsoy1wGs1Z/r9hWpA6MWRq2IfQYRsNmHB+c2NIFv5/D
	2tEaggBcTSqMgueOCY4dXmgbvX2TaZWw5ar+EaUF6T5zFMzh4xFSuDpAvv5vcemf
	36VhT5Qvhmic4LmUW+JZbr8ODHJy0t6a8/08c1YaxD2TK0pOsaAc/fA77p4Cet5n
	ymnVujbnhBzwBiIzGiy87i1nD2BVDHYumphzXbLp5Td8M1/6yyzVPuMTcJ6ugTYg
	skZMEg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2bcef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:24:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37c5dfb67b7so1998847a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 06:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781702660; x=1782307460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMBSdbpwBipKU1ms94J9YAyj0MUqDXodwBtSD+c987E=;
        b=PNeB5ZvVe2o7ZYT/3AUVNdMtHeWMXQZnxfj93Ir8GTIIDDRmDTfAmd4lJ1StrrI9lK
         SWYjH2HiwvHDb7zfm+lQmGQWfAgB2VAUEwpD7bKwK6p0vA8BfjRFInHqvP1XX1SIDlww
         164vJJMoVC9RSRHcueayZkjlHRgxOy9m9nCTTnl3a6HAI1EeEq77PeEzThhZyalJfxZJ
         q2Tdz4/yZ5opYNFBHVrIjRZqsIVvnjLweA9gEWwscl6TEzK18ZM2U2CUN19JI6jnZZRe
         V+mc7fesPF5IvaqqHlAP6o9u6tiNaank19pPKoQz9ch7Hz+7o9ZLpTggJiFloq1uHa9W
         +AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702660; x=1782307460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMBSdbpwBipKU1ms94J9YAyj0MUqDXodwBtSD+c987E=;
        b=UbmFCScM7GS9jMfR4h9crwlHbVRto4H/Xalux9FvyGmvMOTGLrt+MkoEwJpj9x66Do
         2g6FbgZ3e68ZbB8WrkfLXSm31rxdBEZKT94jo3fPJ+VNJyydKLtTrbYwCvqmom8n1gJ8
         4vw2P0g91Z4RGJmp+yIuz4WbYGYEH4uH44cxH/j04YflCBjpZks1BCffSrkBdSFoG7Bx
         AhOmPExA3IjTXWiNy8hCB4UvLKidR3mNxp+3BtnaSVl+DUdqvwWCxJqiFZAogyZi7gV9
         z5h+0nZKDJ4ftiR746HD8q9I22ELSkHQ/Kx9soqHFpZBVghyOSFVhM9cj1bxqqmJBRi+
         8XeQ==
X-Gm-Message-State: AOJu0Yz3erS4LrII1ilDJPKdGUvCXHxwF+uPC2dxUuelZuLEyZG5z5h4
	8XgOCos1aWOpcfZtlb4tVljitboRy8fiu6Rv/i2WyYr2R0Oc8J7sNjV++cgUU9xOQy69+tybf6P
	E6JVD27eSi1uJP6BITT8jEpdRZSUBNtLQ8VIPHAAtEfKky7Y05jWhRY9SFvdD/XLmSPF5
X-Gm-Gg: AfdE7ckFhDzueN7sWj4yXtaq1Gke/tXO3H5kkRMPE8pYUrqqj3+KhjHyDCxHeqv8QIX
	2TWo7sH5lj1nLaxxuWOwPoCB8Jqvbbp3NL4SLwz0KSk46oFqDUogn/oGKVqsjDQFGIoBqe5Grvi
	ctG1Gku6iOuo6yfCiHgNI4YpNyG8fAG+ZIhNmFioKiTkckUiXzXXqj8kqSnWY1wPCjRXigvIAbU
	pg51I5Z8zlI4vK0A9ZEz93KV4uXqjc/+Pqt2/X2UNn3Al0w9ASnlDLpNz5MhTzGzOlxXXh2xsBN
	HA+Qtk2XMs5ylRLBEDYXPm2reU+Bq5y9DwfhIoTJoJ7f/2qSs6LlW2a5cQPkUL/i1mEt1QVDG6y
	r+bf2pEVwBtvPrL17aC9HKiEe76sg3wVMGYgr9cSdPRx+O6P9jMPS6mUkikzE5jCI08T78i9ep7
	5XUEI=
X-Received: by 2002:a17:90b:2e0b:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-37c9330947cmr3899158a91.4.1781702659898;
        Wed, 17 Jun 2026 06:24:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0b:b0:368:b724:6d53 with SMTP id 98e67ed59e1d1-37c9330947cmr3899131a91.4.1781702659329;
        Wed, 17 Jun 2026 06:24:19 -0700 (PDT)
Received: from [192.168.1.112] (ptr-48-167.coastalbroadband.in. [163.223.48.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c930d7f81sm3459961a91.6.2026.06.17.06.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:24:18 -0700 (PDT)
Message-ID: <c9687d6e-652f-4d82-aea8-c156a8b613eb@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 18:54:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610154517.134570-2-prasad.kumpatla@oss.qualcomm.com>
 <90202cfd-19ad-4ae9-9f0d-cde014d8a663@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <90202cfd-19ad-4ae9-9f0d-cde014d8a663@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a32a004 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=D3hM7nRbATf/MWm6WF+yZA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=aOzt0AmiSN3BHcephwwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX6Ht7a0qaGSdN
 8M8V03XBTHJ88H5IAj3pQc28rNjmLFEr6MHzffQ4/wPOoXCwLFxGMH+++oLogQ7MQuIhztDQ6Oa
 cFSXuI/vEQ3/ypFZe/ZfSs3PuKsLRvk=
X-Proofpoint-GUID: 16Stnay6Z60fDRP3JoSjEITmw2BHOdGZ
X-Proofpoint-ORIG-GUID: 16Stnay6Z60fDRP3JoSjEITmw2BHOdGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyOCBTYWx0ZWRfX4QCQ5nACo+Tm
 pTRk+pcpBiz1u3XIg6hcTQfqdfZw+4jtSWqFZA8hPiJqljuL/v3U49W1WmkyHeNcaUU7dmDiJR9
 W+w7zeugmFspjpRzEGuQui4p2dVWdqBWvHEBoXXlnOWtKwB7WvVZ5rsCQtenY4PT3Y8nrPd5rZu
 FTXxc8OX/FuJXoA1JUuMQeFcsJPXQw+pFjlmnNC1zBd0m1mDrp1nwCyREr4OTTvbgwK14bpZziH
 V0xlCyw2a3kHGWrCnlpg1CsBpMNSemQ09+8pKkII1ZyNOF4hp+1D20C9huNZWgjLFaMNzUDuzCL
 1068LM+rkK+zqy7cH63q6eXgXQ8mlk5FzMWcOXXO3i271FAKVESOWu37JRZWq6ltZsS30qs+xl7
 t61PCQdEvPgyU+qbFp5t8PpjKs0lLE2Ef4N/+PGa/8EaNgzHjhUpx1d6xx1T948mq3Y4/Iqul4E
 YQ8rajluZb0E4RHJGXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113648-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5402969A152


On 6/15/2026 2:58 PM, Srinivas Kandagatla wrote:
>
> On 6/10/26 4:45 PM, Prasad Kumpatla wrote:
>> Add topology parsing and media-format programming for Audio IF
>> source and sink modules.
>>
>> Add the Audio IF module IDs, the required topology tokens, and a
>> dedicated topology loader that stores the parsed interface
>> configuration in the AudioReach module state. Also add the Audio IF
>> media-format path that sends the interface configuration, hardware
>> endpoint media format, and frame-duration parameters for Audio IF
>> modules.
>>
>> This keeps the serial-interface configuration topology-driven while
>> still allowing the machine driver to provide runtime slot and media
>> format settings. The same Audio IF path can then be reused for TDM,
>> PCM, and I2S style backends.
>>
>> The new UAPI tokens (AR_TKN_U32_MODULE_SYNC_SRC=262 through
>> AR_TKN_U32_MODULE_INV_EXT_BIT_CLK=276) are added.
>>
>> MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
>> (0x0700117D) are introduced in this patch.
>>
> Which platform is this tested on, also please send a PR to
> github.com/linux-msm/audioreach-topology to add thse new tokens.

Hi Srini,

Thanks for reviewing and comments.

this module is validated on Hawi and Shikra. Sure will raise the PR with 
these tokens usage.

>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> ---
>>   include/uapi/sound/snd_ar_tokens.h |  58 ++++++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.c  |  97 ++++++++++++++++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.h  |  62 +++++++++++++++++
>>   sound/soc/qcom/qdsp6/topology.c    | 108 +++++++++++++++++++++++++++++
>>   4 files changed, 325 insertions(+)
>>
>> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
>> index 6b8102eaa..355a1e629 100644
>> --- a/include/uapi/sound/snd_ar_tokens.h
>> +++ b/include/uapi/sound/snd_ar_tokens.h
>> @@ -168,6 +168,48 @@ enum ar_event_types {
>>    *						LOG_WAIT = 0,
>>    *						LOG_IMMEDIATELY = 1
>>    *
>> + * %AR_TKN_U32_MODULE_SYNC_SRC:			Frame sync source
>> + *						0 = external, 1 = internal
>> + *
>> + * %AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
>> + *						0 = disable, 1 = enable
>> + *
>> + * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
>> + *
>> + * %AR_TKN_U32_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
>> + *
>> + * %AR_TKN_U32_MODULE_SLOT_WIDTH:			Slot width in bits (16 or 32)
>> + *
>> + * %AR_TKN_U32_MODULE_SYNC_MODE:			Frame sync mode
>> + *						0 = short pulse, 1 = long pulse
> We have 3 possible values, please correct this, also you could add
> defines for these values.
Ack, will update
>> + *
>> + * %AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
>> + *						0 = normal, 1 = inverted
>> + *
>> + * %AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
>> + *						0 = no delay, 1 = one cycle delay
> Exactly same here, we have 2 cyle delay too.
Ack, will update
>> + *
>> + * %AR_TKN_U32_MODULE_INTF_MODE:			Audio IF interface mode
>> + *						AUDIO_IF_INTF_MODE_TDM = 0,
>> + *						AUDIO_IF_INTF_MODE_PCM = 1,
>> + *						AUDIO_IF_INTF_MODE_I2S = 2
> Same here, defines for these.
Ack, will update
>
>> + *
>> + * %AR_TKN_U32_MODULE_QAIF_TYPE:			QAIF hardware port type index
>> + *
>> + * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
>> + *
>> + * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
>> + *
>> + * %AR_TKN_U32_MODULE_BIT_CLK_TYPE:			Bit clock type
>> + *						0 = internal, 1 = external,
>> + *						2 = skip (bypass bit clock enable)
>> + *
>> + * %AR_TKN_U32_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
>> + *						0 = normal, 1 = inverted
>> + *
>> + * %AR_TKN_U32_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
>> + *						0 = normal, 1 = inverted
>> + *
>>    * %AR_TKN_DAI_INDEX:				dai index
>>    *
>>    */
>> @@ -240,6 +282,22 @@ enum ar_event_types {
>>   #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
>>   #define AR_TKN_U32_MODULE_LOG_MODE		261
>>   
>> +#define AR_TKN_U32_MODULE_SYNC_SRC		262
>> +#define AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE	263
>> +#define AR_TKN_U32_MODULE_SLOT_MASK		264
>> +#define AR_TKN_U32_MODULE_NSLOTS_PER_FRAME	265
>> +#define AR_TKN_U32_MODULE_SLOT_WIDTH		266
>> +#define AR_TKN_U32_MODULE_SYNC_MODE		267
>> +#define AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE	268
>> +#define AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY	269
>> +#define AR_TKN_U32_MODULE_INTF_MODE		270
>> +#define AR_TKN_U32_MODULE_QAIF_TYPE		271
>> +#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
>> +#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
>> +#define AR_TKN_U32_MODULE_BIT_CLK_TYPE		274
>> +#define AR_TKN_U32_MODULE_INV_INT_BIT_CLK	275
>> +#define AR_TKN_U32_MODULE_INV_EXT_BIT_CLK	276
>> +
> Here you prefix the tokens with U32, however in dirver this values are
> validated against U8 and U16, So please fix the prefixes to reflect the
> range.
>
>
> ...
Yes that's correct, will update them properly.
>
>>   
>>   	default:
>>   		rc = 0;
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 62a2fd79b..1dc29ddfd 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -22,6 +22,8 @@ struct q6apm_graph;
>>   #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
>>   #define MODULE_ID_I2S_SINK		0x0700100A
>>   #define MODULE_ID_I2S_SOURCE		0x0700100B
>> +#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
>> +#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
> Please place it in the assending order.
Ack, will update.
>
>>   #define MODULE_ID_SAL			0x07001010
>>   #define MODULE_ID_MFC			0x07001015
>>   #define MODULE_ID_DATA_LOGGING		0x0700101A
>> @@ -544,6 +546,41 @@ struct param_id_i2s_intf_cfg {
>>   #define PORT_ID_I2S_OUPUT		1
>>   #define I2S_STACK_SIZE			2048
>>   
>> +#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
>> +
>> +#define AUDIO_IF_INTF_MODE_TDM		0x0
>> +#define AUDIO_IF_INTF_MODE_PCM		0x1
>> +#define AUDIO_IF_INTF_MODE_I2S		0x2
>> +
>> +struct param_id_audio_if_intf_cfg {
> I know that we have not added documentation for all the structures, but
> Am in process of adding them. Can you add kernel doc to these structs.
Ack, will update
>> +	uint16_t qaif_type;
>> +	uint16_t intf_idx;
>> +	uint16_t intf_mode;
>> +	uint16_t ctrl_data_out_enable;
>> +	uint32_t active_slot_mask;
>> +	uint16_t nslots_per_frame;
>> +	uint16_t slot_width;
>> +	uint32_t active_lane_mask;
>> +	uint32_t frame_sync_rate;
>> +	uint16_t frame_sync_src;
>> +	uint16_t frame_sync_mode;
>> +	uint16_t invert_frame_sync_pulse;
>> +	uint16_t frame_sync_data_delay;
>> +	uint16_t bit_clk_type;
>> +	uint8_t inv_int_bit_clk;
>> +	uint8_t inv_ext_bit_clk;
>> +} __packed;
>> +
>> +#define PARAM_ID_HW_EP_FRAME_DURATION		0x08001B2F
>> +#define AUDIO_IF_FRAME_DURATION_US		1000
> Why is this hardcoded?

As this module End point operate with a 1 ms processing interval.

>> +
>> +struct param_id_hw_ep_frame_duration {
>> +	uint32_t frame_duration_in_us;
>> +	uint32_t allow_frame_duration_normalization;
>> +	uint32_t min_normalized_frame_dur_us;
>> +	uint32_t max_normalized_frame_dur_us;
>> +} __packed;
>> +
>>   #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
>>   
>>   struct param_id_display_port_intf_cfg {
>> @@ -877,6 +914,28 @@ struct audioreach_module {
>>   	uint32_t data_format;
>>   	uint32_t hw_interface_type;
>>   
>> +	/* Audio IF module (TDM/PCM/I2S) */
>> +	/*
>> +	 * uint32_t fields first to minimise intra-block padding;
> Why do we need this comments does not add a real value here?
No much, will remove them.
>> +	 * 2 bytes of trailing padding remain after inv_ext_bit_clk
>> +	 * before the next uint32_t field (interleave_type).
>> +	 */
>> +	uint32_t slot_mask;
>> +	uint32_t active_lane_mask;
>> +	uint32_t frame_sync_rate;
>> +	uint16_t qaif_type;
>> +	uint16_t sync_src;
>> +	uint16_t ctrl_data_out_enable;
>> +	uint16_t nslots_per_frame;
>> +	uint16_t slot_width;
>> +	uint16_t intf_mode;
>> +	uint16_t sync_mode;
>> +	uint16_t ctrl_invert_sync_pulse;
>> +	uint16_t ctrl_sync_data_delay;
>> +	uint16_t bit_clk_type;
>> +	uint8_t inv_int_bit_clk;
>> +	uint8_t inv_ext_bit_clk;
>> +
>>   	/* PCM module specific */
>>   	uint32_t interleave_type;
>>   
>> @@ -907,6 +966,9 @@ struct audioreach_module_config {
>>   	u32	channel_allocation;
>>   	u32	sd_line_mask;
>>   	int	fmt;
>> +	u32	slot_mask;
>> +	u16	nslots_per_frame;
>> +	u16	slot_width;
>>   	struct snd_codec codec;
>>   	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
>>   };
>> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
>> index 1f69fba6d..2ae7ac3d2 100644
>> --- a/sound/soc/qcom/qdsp6/topology.c
>> +++ b/sound/soc/qcom/qdsp6/topology.c
>> @@ -753,6 +753,108 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
>>   	return 0;
>>   }
>>   
>> +static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
>> +						  const struct snd_soc_tplg_vendor_array *mod_array)
>> +{
>> +	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
>> +	int tkn_count = 0;
>> +	u32 val;
>> +
>> +	mod_elem = mod_array->value;
>> +
>> +	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
>> +		val = le32_to_cpu(mod_elem->value);
>> +		switch (le32_to_cpu(mod_elem->token)) {
>> +		case AR_TKN_U32_MODULE_HW_IF_IDX:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
> Plese fix such instances as suggested at the top.
Ack, will update
>
>> +			mod->hw_interface_idx = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_FMT_DATA:
>> +			mod->data_format = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_HW_IF_TYPE:
>> +			mod->hw_interface_type = val;
> where are we using this?

Its not being used any where, i will remove this.

Thanks,
Prasad

>
>> +			break;
>> +		case AR_TKN_U32_MODULE_SYNC_SRC:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->sync_src = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_data_out_enable = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_SLOT_MASK:
>> +			mod->slot_mask = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_NSLOTS_PER_FRAME:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->nslots_per_frame = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_SLOT_WIDTH:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->slot_width = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_INTF_MODE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->intf_mode = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_SYNC_MODE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->sync_mode = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_invert_sync_pulse = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->ctrl_sync_data_delay = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_QAIF_TYPE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->qaif_type = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
>> +			mod->active_lane_mask = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
>> +			mod->frame_sync_rate = val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_BIT_CLK_TYPE:
>> +			if (val > U16_MAX)
>> +				return -EINVAL;
>> +			mod->bit_clk_type = (u16)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_INV_INT_BIT_CLK:
>> +			if (val > U8_MAX)
>> +				return -EINVAL;
>> +			mod->inv_int_bit_clk = (u8)val;
>> +			break;
>> +		case AR_TKN_U32_MODULE_INV_EXT_BIT_CLK:
>> +			if (val > U8_MAX)
>> +				return -EINVAL;
>> +			mod->inv_ext_bit_clk = (u8)val;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +		tkn_count++;
>> +		mod_elem++;
>> +	}
>> +
>> +	return 0;
>> +}


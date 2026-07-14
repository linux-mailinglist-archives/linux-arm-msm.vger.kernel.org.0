Return-Path: <linux-arm-msm+bounces-119106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +JoCKODKVmr4BAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:48:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D72759824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 01:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lRLVL0wv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gkUCE2nc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119106-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119106-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5317E303F87A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 23:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB91433E63;
	Tue, 14 Jul 2026 23:48:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF042BE95
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 23:48:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072891; cv=none; b=kEJfd1CC0RNnTUMhSLB1EVhV8F1g1+8ArdA/Lc7m30e8Tmu/o9S5hxIdrILXtnsEI8bIL7Em6zPR/3myHNg26Y4IS0bV4Y8VLOxUjN7RiafhByLh0DuAXczDYTg4ljqLQ9fJHHO3hkPMa2LSCCsw54cv+Hreuq5KZlSLLRTJKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072891; c=relaxed/simple;
	bh=n9AjW65p0a7D6KQPmbrkol4qR1Xm8c7052xAtW+SOos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3xF4yaDuZxG8OC85Rn/386yuRk2Xdg+b6sk1Y2vQz/QFXGinbSu38cQxqrtZired8064moOB0oqYEecODFA3N8wTUcDgwbWOs6UTSZ7TMoNmX60G8hds8+Sj4oOluRZlcoX1UzIXWa+/EX73ko1i1lJ/S5LDAVkagsKhJ4QzNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lRLVL0wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkUCE2nc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EIwl8O1390281
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 23:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vn4MUzHPyhlagDYIvwca+AzfFmNytjBwvjVc71GBUkU=; b=lRLVL0wvMySyzkx2
	bm/jqLTqSS3Uj5xno85m35cdJWvZQEdt6WFdfcD6vx01lyPfb5hYagFpz/Rc4ogC
	NM7ivzc0wRoSWg6hgoc+veM8eSeFwsvGDQ1hFWNiB0oSTNaG7/WHUcGKhjytr0am
	eaV5BHEOqHbem4dT0lg64sdIoXJw0/xZZ36taoWAUinC5u/ZlI3eyqNWwI6uVmai
	X4KbXpITyZLnkWFr4AFpfeKtJcCkSsGPyctlwGs+SCCuhEXiEsh3tDBewEWA+Nws
	BvhdoWOHymprYISolLXQK7NYqyLyEGYGQSPPcY/3si82nPpdmrzUbFA07RGzMlf+
	0ydbSw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr289p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 23:48:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so6864106a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784072887; x=1784677687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vn4MUzHPyhlagDYIvwca+AzfFmNytjBwvjVc71GBUkU=;
        b=gkUCE2ncHQhryLBubB3gWiz7GxMA+xyIcHxbokynL/Yze+xjH69oGdFTJ/KLbl/+GV
         zvt4LE5BZVCU0ek2ZquHSWUh+0k/W+XPZlQgtrgwKzAlou2GTaCYwEa/V2OZsSy5uXW3
         P54uWwNhSuACrrA/N04LIJeaNvSgF6Ufra5V8oo3UYbUpWgt2PodN5A20nE3KvVI1V6w
         Gs6wnUMiz9aO9ObFysyce+FW5DfLxSN8k1+G4Haov/1ZrwOciLVxwpZioy0hBr7Ze/Y4
         gsbvfQG9RULgXDwsA4YkijAW4bewI8zYzQzVt/vXtviR1ir4UDworF/9PDx9tfxoWDuN
         SJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784072887; x=1784677687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vn4MUzHPyhlagDYIvwca+AzfFmNytjBwvjVc71GBUkU=;
        b=aW6tQtjJLXkjW0JC/8gHTqD6+4Nj5pfT+vkdw+l2FESVe0nmudP17lvgdRQGwwHsMA
         WN6mEyzW9dgH+Q4PWpGU8OLpY+41IIJpH3D6/Wihvxnli/4kO9w6oiQ8OLRiiPK0CR7L
         FaZd9TqD+Wf0uPoLz0WcAlibCwPB514Jh0AXc20ygdcU1d/veOBi4v5dLlwGXXqJ9qhX
         tUxculxVNGSBejK2spUEozdE47N6wOObba4smH/3eQzX2Kg4pHjUkg/j+0NeoyBcrYQZ
         rRH1mC3gna2gZTPkp5KPSt5jhRpLtn9uYCLaXboaUlD9/MXyP1JEA5wlWeCrE5jexoju
         yrqw==
X-Forwarded-Encrypted: i=1; AHgh+RrKThUysbfThzD+zQApXyd2BtZah23vG4ebLET0qxbMd4JUSevvUXeyY78jrmp1K0DJ3qpESWJo0j6uVwG7@vger.kernel.org
X-Gm-Message-State: AOJu0YzUWeb3zVPI5gPHAkA0nFF7zrflzRk7eWlaSK5lh/Is35MOCvvI
	JJ2nkeOLsPaFepjZtY9ROc00frHi8d5BLb4aoIYo8zjNwi9kPRYsEIgS1n5/zDETyBFtg+19TSP
	dE22XOQX/NiAHWdf+gCHmGTVnLNohS2f2+NRroMKFLJhbpo08rr+pwalB832967YcR4o=
X-Gm-Gg: AfdE7ck20GsGOt/hQPX0phXbDT7VK4yjx/cIlP/sO31ckiMaTASP5s5ncoBYcVYg3Fe
	1D+9ON1dUuRJRDlkh3ABSlNA15NrXsZy63s6OtUYDzK2ugfkPfVYV3s36duaRAL4zwekpEIwtrM
	3FT9kvrmdi3CtUbwqEpZ3NM1B/LYWd+V5N91zGjf7jNgxHW91NADnaqlR9APhfr233Jv3W8Smq4
	EnU7/pzBU/SoyrdfdfQUFbrwv4pherGx/zpXmDcUX8lOrXy3YRwnRipTenqxM133o7igNNivU32
	C7No83ntlQuKwhSZylzzDrg+UjiaqZiJ2hzAx/607EV7pX4Hoq8lMgAtvUK7L8XFusaJLdqSK/t
	jwUilNvbn9YkWuY5HKcZytUE/oLTXBGBO+bTuyTTH0vo=
X-Received: by 2002:a05:6a20:6f04:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3576c5a50mr5232427637.76.1784072887400;
        Tue, 14 Jul 2026 16:48:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f04:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3576c5a50mr5232398637.76.1784072886848;
        Tue, 14 Jul 2026 16:48:06 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.14.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm58087377eec.26.2026.07.14.16.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 16:48:06 -0700 (PDT)
Message-ID: <f917eb0f-9c9d-4f30-9c4f-ac3aeddac967@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 09:47:59 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] tee: qcomtee: Track the object invocation context
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>, jenswi@kernel.org
References: <20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com>
 <20260707-qcom_uefisecapp_migrate_qcomtee-v1-1-f659cbd5d04c@oss.qualcomm.com>
 <b7c8b25b-374f-40a4-9c6d-bb20ee0cb5c9@oss.qualcomm.com>
 <fb1d4954-7c0f-4609-be40-b032876169b8@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <fb1d4954-7c0f-4609-be40-b032876169b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDI0NiBTYWx0ZWRfX9mUQyE91+W0T
 4KsnTwQFc/L8fFyDSbABR9l77Lv6rSnHkZ+h0H2AeNQsae7sz5vhTWn/HpLBKIdwqszY782N6oM
 TKUuB2N38kmwy6XQOkwItpTEY8UXUjQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDI0NiBTYWx0ZWRfX23X6NH1jqrm1
 LZyNHFZjDewwUveSGAQpFNYJK3okhA5lIUQdkyBBQ5WWjSyqlOYdOlr32G6hwxs96Sxu+UPpUrJ
 s6XNUdaYVjftF0zGmuBfmWDwRW862xiDbvAJc1K2sLx8gbPqwjj/aSZasUzijejBQWLp/mZ3zfF
 xQU3xgIL8C9UyHDWEMK+aKYcPJ3pm9/XdYvjtAnhwql+DtOip2d3FK+96lr25qlztdxOrQxcU2K
 uZ4pP1h9x+NfyU6nio2jGhEXSwDAD2bbgEdY9uLZhavz2FOh3OiC1yi6UyLRNY07GRmmgoxDjfA
 84zovScqhRIOS+s0iXrhp8wzSSENc/kWWAXnw9jncnMeKV1yZFJWfbNVbJyhAWxmT4RAX10WmuR
 f2iXVLmdnEoAsl0bmjctFUWace2t6NDyICLh4xOVrdcsmDtquZhxJcQIoWLfkHa4FRPwKPTNN27
 qmAlt9FblgDBW/eCKxw==
X-Proofpoint-ORIG-GUID: 7BpY6Is6Fu7J6e3qj9S5v7AF2kNHlk5b
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a56cab8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=1ihhdXzpPjkKEZVMewh6kw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=j_0Qh49M8Pi7-mX27roA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7BpY6Is6Fu7J6e3qj9S5v7AF2kNHlk5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_05,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140246
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119106-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:harshal.dev@oss.qualcomm.com,m:basantk@qti.qualcomm.com,m:apurupa@qti.qualcomm.com,m:aneelaka@qti.qualcomm.com,m:op-tee@lists.trustedfirmware.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konradybcio@kernel.org,m:andersson@kernel.org,m:sumit.garg@kernel.org,m:jenswi@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arg.id:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amirreza.zarrabi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11D72759824

Hi Harshal,

On 7/10/2026 4:37 PM, Harshal Dev wrote:
> Hi Amir,
> 
> On 7/8/2026 11:31 AM, Amirreza Zarrabi wrote:
>> Hi Harshal,
>>
>> On 7/7/2026 4:11 PM, Harshal Dev wrote:
>>> QCOMTEE needs to distinguish between object invocations arriving from
>>> kernel clients and user-space clients in order to correctly marshal
>>> UBUF parameters and decide whether certain operations should be permitted.
>>>
>>> Add a kernel_ctx flag to struct qcomtee_object_invoke_context to track
>>> the context of object invocation. Objects invoked from the kernel-space
>>> are expected to have the MSB of their 64-bit object-id set to indicate a
>>> kernel context, whereas objects invoked from user-space should not set it.
>>> To ensure this, we restrict the object-id space of user-space invoked
>>> objects to 32-bits. This is in-line with QTEE expectation of 32-bit object
>>> ids.
>>>
>>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>>  drivers/tee/qcomtee/call.c           | 24 ++++++++++++++++++++++--
>>>  drivers/tee/qcomtee/qcomtee.h        |  6 ++++++
>>>  drivers/tee/qcomtee/qcomtee_object.h |  8 ++++++--
>>>  drivers/tee/tee_core.c               |  4 ++++
>>>  4 files changed, 38 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>>> index 0efc5646242a..a74a54d67b06 100644
>>> --- a/drivers/tee/qcomtee/call.c
>>> +++ b/drivers/tee/qcomtee/call.c
>>> @@ -397,11 +397,31 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>  {
>>>  	struct qcomtee_context_data *ctxdata = ctx->data;
>>>  	struct qcomtee_object *object;
>>> +	bool kernel_ctx = false;
>>>  	int i, ret, result;
>>>  
>>>  	if (qcomtee_params_check(params, arg->num_params))
>>>  		return -EINVAL;
>>>  
>>> +	/* Obtain the invocation context information from the MSB of the object
>>> +	 * `id` field.
>>> +	 */
>>> +	kernel_ctx = QCOMTEE_GET_CLIENT_CTX(arg->id);
>>> +	/* User-space identifies a NULL object via a 32-bit TEE_OBJREF_NULL id, whereas
>>> +	 * the kernel uses as 64-bit object-id. Hence, we check for a NULL object by
>>> +	 * sign-extending the object-id to 64 bits. If user-space is indeed invoking a
>>> +	 * NULL object we must extend the object-id to 64-bits from here on so that
>>> +	 * QCOMTEE can recognize it.
>>> +	 */
>>> +	if (!kernel_ctx && ((s64)(s32)arg->id) == TEE_OBJREF_NULL)
>>> +		arg->id = TEE_OBJREF_NULL;
>>
>> Does it need to be MSB -- why bit 63? the object ID supported by QTEE is 32-bit anyway.
>> Let's mask the upper 32-bit and do something like kernel_ctx = !!upper_32_bits(id).
>> What do you think?
> 
> I agree. Instead of checking for kernel-ctx by right shifting, I can use this approach.
> QTEE objects invoked from user-space (including NULL object) will always have their
> object-id constrained to lower 32 bits anyway as per PR: https://github.com/quic/quic-teec/pull/27
> 
> And for kernel-space invoked QTEE objects, upper 32-bits would be set for NULL object,
> and 63rd bit expected to be set as well.
> 

Re-thinking this, I'm a bit concerned about overloading id while keeping it as a u64,
and then filtering its upper 32 bits in tee_ioctl_object_invoke(). It feels unintuitive,
as it naturally raises the question: if only the lower 32 bits are meaningful,
why is id a `u64` in the first place?

What if we make the caller origin explicit instead, for example:

enum tee_object_invoke_origin {
	TEE_OBJECT_INVOKE_USERSPACE,
	TEE_OBJECT_INVOKE_KERNEL,
};

and then pass it through the backend op:

int (*object_invoke_func)(struct tee_context *ctx,
			  struct tee_ioctl_object_invoke_arg *arg,
			  struct tee_param *param,
			  enum tee_object_invoke_origin origin);

It seems more straightforward and avoids encoding caller-origin metadata into id.
If you are OK, let's do this.

- Amir

>>
>>> +
>>> +	/* If the object being invoked is not NULL, drop the MSB from the `id` field to
>>> +	 * obtain the actual object-id.
>>> +	 */
>>> +	if (arg->id != TEE_OBJREF_NULL)
>>> +		arg->id = QCOMTEE_SANITIZE_OBJ_ID(arg->id);
>>> +
>>>  	/* First, handle reserved operations: */
>>>  	if (arg->op == QCOMTEE_MSG_OBJECT_OP_RELEASE) {
>>>  		del_qtee_object(arg->id, ctxdata);
>>> @@ -411,7 +431,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>>>  
>>>  	/* Otherwise, invoke a QTEE object: */
>>>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>>> -		qcomtee_object_invoke_ctx_alloc(ctx);
>>> +		qcomtee_object_invoke_ctx_alloc(ctx, kernel_ctx);
>>>  	if (!oic)
>>>  		return -ENOMEM;
>>>  
>>> @@ -648,7 +668,7 @@ static void qcomtee_get_qtee_feature_list(struct tee_context *ctx, u32 id,
>>>  	int result;
>>>  
>>>  	struct qcomtee_object_invoke_ctx *oic __free(kfree) =
>>> -		qcomtee_object_invoke_ctx_alloc(ctx);
>>> +		qcomtee_object_invoke_ctx_alloc(ctx, true);
>>>  	if (!oic)
>>>  		return;
>>>  
>>> diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
>>> index f39bf63fd1c2..5d292a2ff83d 100644
>>> --- a/drivers/tee/qcomtee/qcomtee.h
>>> +++ b/drivers/tee/qcomtee/qcomtee.h
>>> @@ -17,6 +17,12 @@
>>>  #define QCOMTEE_OBJREF_FLAG_USER	BIT(1)
>>>  #define QCOMTEE_OBJREF_FLAG_MEM		BIT(2)
>>>  
>>> +/* The MSB of the object_id field indicates whether the client is invoking the
>>> + * object from user context or kernel context.
>>> + */
>>> +#define QCOMTEE_GET_CLIENT_CTX(x) (((x) >> 63) & 1U)
>>> +#define QCOMTEE_SANITIZE_OBJ_ID(x) ((x) & (BIT(63) - 1))
>>> +
>>>  /**
>>>   * struct qcomtee - Main service struct.
>>>   * @teedev: client device.
>>> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>>> index 8b4401ecad48..2528d07e4576 100644
>>> --- a/drivers/tee/qcomtee/qcomtee_object.h
>>> +++ b/drivers/tee/qcomtee/qcomtee_object.h
>>> @@ -146,6 +146,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>>>   * struct qcomtee_object_invoke_ctx - QTEE context for object invocation.
>>>   * @ctx: TEE context for this invocation.
>>>   * @flags: flags for the invocation context.
>>> + * @kernel_ctx: flag that indicates this context is owned by a kernel client.
>>>   * @errno: error code for the invocation.
>>>   * @object: current object invoked in this callback context.
>>>   * @u: array of arguments for the current invocation (+1 for ending arg).
>>> @@ -158,6 +159,7 @@ static inline int qcomtee_args_len(struct qcomtee_arg *args)
>>>  struct qcomtee_object_invoke_ctx {
>>>  	struct tee_context *ctx;
>>>  	unsigned long flags;
>>> +	bool kernel_ctx;
>>>  	int errno;
>>>  
>>>  	struct qcomtee_object *object;
>>> @@ -172,13 +174,15 @@ struct qcomtee_object_invoke_ctx {
>>>  };
>>>  
>>>  static inline struct qcomtee_object_invoke_ctx *
>>> -qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx)
>>> +qcomtee_object_invoke_ctx_alloc(struct tee_context *ctx, bool kernel_ctx)
>>>  {
>>>  	struct qcomtee_object_invoke_ctx *oic;
>>>  
>>>  	oic = kzalloc_obj(*oic);
>>> -	if (oic)
>>> +	if (oic) {
>>>  		oic->ctx = ctx;
>>> +		oic->kernel_ctx = kernel_ctx;
>>> +	}
>>>  	return oic;
>>>  }
>>>  
>>> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>>> index ef9642d72672..7f986d7fb47f 100644
>>> --- a/drivers/tee/tee_core.c
>>> +++ b/drivers/tee/tee_core.c
>>> @@ -706,6 +706,10 @@ static int tee_ioctl_object_invoke(struct tee_context *ctx,
>>>  			goto out;
>>>  	}
>>>  
>>> +	/* Userspace object-ids are restricted to 32-bits. */
>>> +	if (arg.id > U32_MAX)
>>> +		return -EINVAL;
>>> +
>>
>> This change belongs to tee SS, move it to a separate commit with appropriate message.
> 
> Ack.
> 
> Regards,
> Harshal
>>
>>>  	rc = ctx->teedev->desc->ops->object_invoke_func(ctx, &arg, params);
>>>  	if (rc)
>>>  		goto out;
>>>
>>
>> Regards,
>> Amir
>>
> 



Return-Path: <linux-arm-msm+bounces-94465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGd5GniqoWm1vQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:30:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDECD1B8F61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E02D1301F68B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC51927D782;
	Fri, 27 Feb 2026 14:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTokqWTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3IUyOqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6136F223322
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202130; cv=none; b=pnWwoZ6+Qb9cIuOuI9qco6NNoVe+f6Rv7Nqr/4R/GIbgAheNy7Zm84IRrvEU8ZB0dXKvgAa/FB6ddJEfq2qytbSJYOOedPfNry+qJQTRoGiCDEkaTqfuf9t1qHVf+hBRGNNDsceIGXIINLSybwOkXvORDZkgXwfkgoMDO7+ICHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202130; c=relaxed/simple;
	bh=KCzl/iNg/7AQm7jsHmdVAJRc7nrWZrAlxGXuz9v2tP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HobxtJIoKkcOPfOoZeJVVTS00Hc5NZgtl2i62+sRzM7SKICRkhih+iJvNAqzGQOe/nw8c3eZEY7p249d3ZAjjzo5mACRJSYSLMXQjKn6hS18MoztR0NJ6coBOGuJSbZafq3J6JGcF2M4k4sEEneR9vzg8ESDkPWyjkIdlVpdrTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTokqWTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3IUyOqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REM57E1010162
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ubhpkZa0hLqmSxZSdbrhlgK9Ltmq9zfNYUEta6sJsA=; b=NTokqWTmeMu1jIvQ
	kvsoQDduSEYU2Q+QtFPLGjde7uoNHUzOce7J6qOAXkH/PSEipfAfvxfrGWr4wYeM
	MLAPHj4MnbdgYillxNUoqHHNySplYIOSHHO2c0oq7BlaefePMKbwqSEOJCrmQvJ2
	7/guS7m5bvv6njMl32GIc0U9+lL0/cxf9DNp3ULbbdxns6qnlJGsq5RoEXmK3ljn
	BS6ugXfK2GQ7MRna5wbEwyczEr1My1NjLZAStNUSUhXK1G13E0rrCckHiugPREFh
	NPvFdm/Xtj8S0LtHrQTosnKywBHRfyWserOUz+zGxlCYUhokHBjVC0aQfvbiI3/5
	xToqpg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck9f00p2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:22:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso10922170a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772202127; x=1772806927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ubhpkZa0hLqmSxZSdbrhlgK9Ltmq9zfNYUEta6sJsA=;
        b=O3IUyOqPaAVfm9WFJ4SqHKt5ixcNCMKAIuAC32IqZDiy7D9nymxiVFEAOZIP4dxF4L
         8X2BhZcy8k4M9zjn8QvH89Yu6QZ07A1/Iw8yHn1oE3KcTWxuz3FjUaparXJ+rGAPBbTz
         O5v/JT7i1LrGlKdkYbwpTINAiAHNAlILVyj8e6B23Wi5UYsoLT0fu78g0LRWmd+DtU/E
         bfmzoisgnAE1wUvO8JDU6RrvHoskrPbdoUrHowKDjIal5ajfBPmsFjGj9pSjSAF7CcwD
         lLNDy86Yd7I15O7ybspxFm7Cpc1e0/KMfdGN/vo9kj8aECAXx/OQ6NflaxzAy6jak22i
         YSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772202127; x=1772806927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ubhpkZa0hLqmSxZSdbrhlgK9Ltmq9zfNYUEta6sJsA=;
        b=CBYqFmsFhtk7RvU6gsRj7KVzsiX9G7hksqt2+MwGZgDZjWj5+rJdS0n27frEfFuu/T
         WwqzC2l7VEKNtCYs9zcjgLIluO/hU4ET7JzLhdS8kRcPj5p9+2CRByrCSdhMKWPl441u
         etf/1ARHkCl9R1CAXMefohrWPLwGNaWOjVA0MXQoINghr3uS9BfZE2p468J4U8nwbe6P
         pENvr/4BwUstRkD8nVpTV8nPT2DequulDSQpAG07JNXqKYUAiJqKOYP/d2hH2XWLz4XF
         +9ihGYh7uJZL8oXX9KCi8SVrHU7AycHb0/G9h0ULTUh2YG1XqIkg14CR2wFQsam+0jTh
         rnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkqNgIpnxKGGzqJeu9OD8AaQNHnzpOnRFx/oMgQ7dH9v7XnYv0xBoZSk10zMxdu4lUuzrDfV6nj2izu6Lj@vger.kernel.org
X-Gm-Message-State: AOJu0YwD7DtAXScM3cEIrDOn6ENnJBcytTelNSqi57cDmL5ecE2lSjUx
	DjzQqS0IwhoMMZu+GpmjRtltkfGs4yJZZ9OeqkV6E6yT9HnrLG2AOU60EFGhuoMyQ0u9LPdZZxj
	UzdgryDi+9gMbqDXe1su3GmMszDMsa358NLOyUUqCbLXT8ija46R2ojWEvxmP954/coAp
X-Gm-Gg: ATEYQzwk1E07lgJsKEGqT3ZcZdLa1JC2ZsaIOMgx/sg5LrWAGJmIHuMteOqaE/yND2c
	7o5Y5DifFCA25NK/HZ5wRdSgdeyqklOcZWrzF9vUhEoFSrPz8gxyaW6+F71LK6Tb41hRBCyKJ+H
	9PqvV6W8KEBJU0n+8ejCEE1NkwvZWq5Vq18Yrnne7XcWbBSxrcXMNP0B8ttX3F5V2x52LrSNO/w
	bQ1CNfmdJfuBnULMqBpI+KF4RRDeoriIg3M8vdmNHp5xRUQhSBSeDj1HUBeH+GTeCSLjjPVvGL2
	EYAG68f9583p2IdLnFGO50NJhOsCIb8fC+YpbaX2cgW8KDzgGJLZMkEmnQfkrEEktAydGBEIMb6
	wuqJEgBqyQHMV8Qf1LLL2RnUz1u+1CpfAZcvyaBI7HGWV4m0=
X-Received: by 2002:a05:6a20:56a3:b0:387:5daf:b302 with SMTP id adf61e73a8af0-395c3b3e08emr3018166637.65.1772202127214;
        Fri, 27 Feb 2026 06:22:07 -0800 (PST)
X-Received: by 2002:a05:6a20:56a3:b0:387:5daf:b302 with SMTP id adf61e73a8af0-395c3b3e08emr3018128637.65.1772202126574;
        Fri, 27 Feb 2026 06:22:06 -0800 (PST)
Received: from [10.206.105.210] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm4642084a12.30.2026.02.27.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 06:22:06 -0800 (PST)
Message-ID: <07d585fe-dfd1-41c9-9c58-b2f9893e572e@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:52:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user
 structure
To: Bjorn Andersson <andersson@kernel.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        ekansh.gupta@oss.qualcomm.com, stable@kernel.org
References: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
 <r4b67y3zbhclkdskbyobtypkrz5pszykvt2hitntvdimanuwe5@34uqxkc34ub7>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <r4b67y3zbhclkdskbyobtypkrz5pszykvt2hitntvdimanuwe5@34uqxkc34ub7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNyBTYWx0ZWRfX/epF5A4DRAep
 3LQhOr+uu0F+NtIQl446jGi5Oz9yKHeve5QnO7GB+jzhPIyBzWzeyIRR4xdM6cUd8P4O/xkGpkF
 7omJCEyyzlntXxJoTudpTpVbfKX53uua1s23YGePmg3RJrvXm5GE+FZ2SnM4Evgu+ELiYZ0e3cs
 J9blEUL5ChtHN8OC4eSXtjBE06J8e5JJYW/7QT0Ro9ShyNMvsZpzraY77+WldmbCwU09MzZhViU
 tvOUPOiT1vWS1jyQWQGffGtRGXTHsezB/n40rTPx2yQ8nY92t75P31h8jy9yu+7MiuMMGnQO1xw
 4F+V3oNowwvMjFLXwEZlzdNNCLzxdhnl+kLmLJWYsBmtaaFRiZroRgyKJbK+mk8sEcQ7AprDoru
 bduASMH7fVFYLatVmOOOyBbATy3qyc64QYacX1XuYtvBuBc/HcV+pn4z4Drtjt+OUetJVy14MAl
 /SfN1ftX98Mh4FIt6LA==
X-Proofpoint-GUID: 9TBbDFT3PTzqGnpvudQCfcUqTnFHogLm
X-Authority-Analysis: v=2.4 cv=bIsb4f+Z c=1 sm=1 tr=0 ts=69a1a890 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qfcypaD7E2ZuPNguhDoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 9TBbDFT3PTzqGnpvudQCfcUqTnFHogLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270127
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94465-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[anandu.e@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EDECD1B8F61
X-Rspamd-Action: no action



On 2/26/2026 11:20 PM, Bjorn Andersson wrote:
> On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
>> Add reference counting using kref to the fastrpc_user structure to
>> prevent use-after-free issues when contexts are freed from workqueue
>> after device release.
> Please follow
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> and start your commit message by clearly establishing the problem, once
> that's done you can describe the technical solution.
sure,  will update the commit message and send as patch v2.
>
>> The issue occurs when fastrpc_device_release() frees the user structure
>> while invoke contexts are still pending in the workqueue. When the
>> workqueue later calls fastrpc_context_free(), it attempts to access
>> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
> But why does it do that?
>
> The reason why we need buf->fl->cctx in this context is because we need
> to mask out the DMA address from the buf->dma_addr (remove the SID bits).
>
> If we instead split "dma_addr" into two separate members of struct
> fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), then
> it would be clear throughout the driver which address space we're
> talking about (is it the SID-adjusted iova space or the dma_addr_t in
> the particular DMA context).
>
> In addition to making this aspect of the driver easier to follow, you no
> longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() (or
> anywhere else for that matter).
>
> You can just pass buf->dma_addr directly to dma_free_coherent().
>
> You're isolating the fact that the firmware needs to see "SID |
> dma_addr" to just two places in the driver.
I agree with the refactoring direction you’re suggesting, and
separating the address spaces does make the driver easier
to reason about.

That said, the UAF isn’t limited to the buffer
free path. fastrpc_context_free() also calls fastrpc_map_put(),
which reaches fastrpc_free_map() and still dereferences fl, so
addressing only the buffer side doesn’t fully resolve the lifetime issue.
So the reference counting is still needed. I will update the scenario in
commit message as well.

If you think it makes sense, I can take the address‑space refactoring
as a separate follow‑up patch and keep this change focused on fixing
the lifetime issue.
>
>>    pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
>>    lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>>    ...
>>    fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>>    fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
>>    process_one_work+0x180/0x450
>>    worker_thread+0x26c/0x388
>>
>> Implement proper reference counting to fix this:
>> - Initialize kref in fastrpc_device_open()
>> - Take a reference in fastrpc_context_alloc() for each context
>> - Release the reference in fastrpc_context_free() when context is freed
>> - Release the initial reference in fastrpc_device_release()
> There's no reason to include a checklist of pseudo-code in the commit
> message, describe why and the overall design if this isn't obvious.
sure, will remove.
>
>> This ensures the user structure remains valid as long as there are
>> contexts holding references to it, preventing the race condition.
>>
> The life cycles at play in this driver is already very hard to reason
> about.
>
>> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
>> Cc: stable@kernel.org
>> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
>>   1 file changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 47356a5d5804..3ababcf327d7 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -310,6 +310,8 @@ struct fastrpc_user {
>>   	spinlock_t lock;
>>   	/* lock for allocations */
>>   	struct mutex mutex;
>> +	/* Reference count */
>> +	struct kref refcount;
>>   };
>>   
>>   /* Extract SMMU PA from consolidated IOVA */
>> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>>   	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>>   }
>>   
>> +static void fastrpc_user_free(struct kref *ref)
>> +{
>> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
> Unrelated question, what does the "fl" abbreviation actually mean? I
> presume 'f' is for "fastrpc", but what is 'l'?
fl is short for fastrpc file.

Regards,
Anandu
>
> Regards,
> Bjorn
>> +
>> +	fastrpc_channel_ctx_put(fl->cctx);
>> +	mutex_destroy(&fl->mutex);
>> +	kfree(fl);
>> +}
>> +
>> +static void fastrpc_user_get(struct fastrpc_user *fl)
>> +{
>> +	kref_get(&fl->refcount);
>> +}
>> +
>> +static void fastrpc_user_put(struct fastrpc_user *fl)
>> +{
>> +	kref_put(&fl->refcount, fastrpc_user_free);
>> +}
>> +
>>   static void fastrpc_context_free(struct kref *ref)
>>   {
>>   	struct fastrpc_invoke_ctx *ctx;
>>   	struct fastrpc_channel_ctx *cctx;
>> +	struct fastrpc_user *fl;
>>   	unsigned long flags;
>>   	int i;
>>   
>>   	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>>   	cctx = ctx->cctx;
>> +	fl = ctx->fl;
>>   
>>   	for (i = 0; i < ctx->nbufs; i++)
>>   		fastrpc_map_put(ctx->maps[i]);
>> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>>   	kfree(ctx->olaps);
>>   	kfree(ctx);
>>   
>> +	/* Release the reference taken in fastrpc_context_alloc() */
>> +	fastrpc_user_put(fl);
>>   	fastrpc_channel_ctx_put(cctx);
>>   }
>>   
>> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>   
>>   	/* Released in fastrpc_context_put() */
>>   	fastrpc_channel_ctx_get(cctx);
>> +	/* Take a reference to user, released in fastrpc_context_free() */
>> +	fastrpc_user_get(user);
>>   
>>   	ctx->sc = sc;
>>   	ctx->retval = -1;
>> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>   	spin_lock(&user->lock);
>>   	list_del(&ctx->node);
>>   	spin_unlock(&user->lock);
>> +	fastrpc_user_put(user);
>>   	fastrpc_channel_ctx_put(cctx);
>>   	kfree(ctx->maps);
>>   	kfree(ctx->olaps);
>> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>>   	}
>>   
>>   	fastrpc_session_free(cctx, fl->sctx);
>> -	fastrpc_channel_ctx_put(cctx);
>> -
>> -	mutex_destroy(&fl->mutex);
>> -	kfree(fl);
>>   	file->private_data = NULL;
>> +	/* Release the reference taken in fastrpc_device_open */
>> +	fastrpc_user_put(fl);
>>   
>>   	return 0;
>>   }
>> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>   	spin_lock_irqsave(&cctx->lock, flags);
>>   	list_add_tail(&fl->user, &cctx->users);
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> +	kref_init(&fl->refcount);
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.34.1
>>
>>



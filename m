Return-Path: <linux-arm-msm+bounces-95351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPPcG9VGqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:51:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3065201EE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F40B31CC287
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2280C3ACF07;
	Wed,  4 Mar 2026 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vcq0XTgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrqelZiP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41B83A1A54
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634948; cv=none; b=dMFDzdXtq5KgudPLbCbHvbzbPT0BhPd/kHHUMJBOHREEECKxqyBbvXEHeOcstnYit86y3Nj/2nmdqV3dAjJUVW5QU7DJjj7YpS/mWFwIe1ihcZIMBEDrmKIohdazKtYEpTqqg1Pd8XUDSDivHZw4r3boYaxV8Vb+akaD36utOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634948; c=relaxed/simple;
	bh=DlVuAOzgEiAgO0TM9z9Ye9In2aDnn+6t/q7TmaChSvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqXlPjb0wpjZrtAVJX95d9qOGMKCdRlMAWBcd2zBEk+97DGFfDtX84xXq88xK4iR2M7OQOxFTyCWfx0SZx8sD83JQSKAl/vkDvnBzdJNC42qMq17NPoejVOhk7VRKK7K8OrgD+fNvnTqVRE71xNe6z+z7I7/bfJSkTK/HYj6THI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vcq0XTgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrqelZiP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249smbp1213363
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxKyQpAO52H/UKeLl72yH06DrNEkOADt/RkzWxe9EMo=; b=Vcq0XTgAihQCmCFd
	N5Tvc2S9+TrbaUhusiygGxg67r3mRI8yPoBgxXfSxFaEb2tglmaugwlxTlxDIMdo
	M/U9Zq5rrOeQfbZk2M2g+sU3xFu40Qebah9pjReVPwLEHizXQoaYYIPLPbeKtYow
	vDHIt2yPlOR8nCfPKM9VxjeyyHSyoHvIbq82xDRTJJ0rcXA4jS/1ebz569gFQOfO
	QTZD20lpAuAY/4FUkuN4KZYbdgoy94UnoSAnqPPE0IRr4SrpPncAVPh9TJtpTqy8
	lHZSTj22Ta0ROipmSICVigfpteGfPZdQyBAN9fCCUifooYit+CQQYKbuwPtz16Ib
	zSGFaQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rsn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:35:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c44bf176so6410404a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634944; x=1773239744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxKyQpAO52H/UKeLl72yH06DrNEkOADt/RkzWxe9EMo=;
        b=QrqelZiPOYuLSNWA42ejxCq2YBVCv1PhrrcX80hLtk04pxeF8S3CuEINjasljtZuth
         rI4mK28+WZCZz2K3oepENOMQ6BLqPU2VfRQreuPCxz4X2csuh21NHIBKqq2QjOfX55NK
         v9CnXRcw4cqXLyBqbuvFSiwMQNmM2Ro2EH3Vv+hOqNRXEg3Cfrz6wDZHlIhYVK5HXV4z
         UsjfdxMDllABqT3WevuiKULS4E44/wmpfYIoSz9ZurSbXXsC8UCjxTq0perbYzQtnl65
         dJxEC7YjADcjooRECTbTkbUM+8A1HC0KqXpeCs5UD/6G44pFizrnhzFyjW3G3H+xYc0m
         7rAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634944; x=1773239744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxKyQpAO52H/UKeLl72yH06DrNEkOADt/RkzWxe9EMo=;
        b=FV5w/ylKnQ+NWi5ucMwz2yDMKBefpUFrk75UEis1fPB+Z8P3RxTEu0H7P7J6I/guad
         dOebOsVbk4vXlNA1JPcHltVm70V9ENKJpuZ38EgqItwmWBE62/gUiDdYNjL6QAXcdZ/Z
         tHMbgvCp7cO36Is6OU6XVYjrNKntVvZGCYfn2Hqsoy+DS2tJN3ZS/pD4X0y+FiBhLJdL
         QOcsqZNDmI3Le+0a5FWZvHgaStVPmF6lfKitlai1gg8wtO7zOovWv9b5pI4KSAve9bxq
         23v6SXsZT4UuGmQZw8QL8t/niPxQgd3s34nz9XuMvVRW4HUI+uapRBLFttQBAZ7ZCWaX
         99zA==
X-Forwarded-Encrypted: i=1; AJvYcCXEeg1FZ7TAVrpTtG685CCiWLPchRPGbdh/pEO9sddV9/UtW6J2Q+zlxClOzQOHI3Diru2kzy+GnK5FKBya@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFFmHdwmndEaT3SElj8wAcB65hoU5XqlJcwOcuOzUO645sRHR
	NB/cOVcboHIYTkuiwYGlVdTYPsvNeYhu5Dr1qLp5gGmfE+dVNNTpX9JVAcsTO3FQMaXs5cyqx+C
	fnXOMbqnMTVmWO9el+YcAQS/Q4+DrGuxAk+nNJjQAn7bi9l1iUXCK9hC4NjVbiO9PdEfA62PRRH
	VN
X-Gm-Gg: ATEYQzx+C42oO02FwprzoSUw+X0wV13uszhlq4iGaWOR3WTQ9su+kv6so/7Gb3UL8M0
	5uz3u+f369MlPhnr7Y28/IpLSVZm4znQ/2xXJbcyRbe+UNoSADpw8IEjCV+Bpfz4aQrg9WWgFyS
	IqqHfwzZoXLJ0R2xsn94fSDbpgwVLZXGjQPcR44qVhAbZWh72n5sFWpNOh8XNehBaFmnQkO1dwn
	7xeCTeRQMiLRdZI2zqKlWB6/jgIFA/etM0F37qsvLgn4w3Qklq5mAxnxxX0ghXMiMOcrLKKgH+H
	Hrj55eYDM7IbQdYwEjAhkDplITZMkPM9XuEQTOSb4lsrpvGbGANZzB6Y049Geih2GWDwPgaRV9O
	GfQhDRJa/kT4XKNA1qMdxJuO/NPZ73nK1bhUFeUkOAjPUPJU=
X-Received: by 2002:a17:90a:d40d:b0:354:a065:ec3e with SMTP id 98e67ed59e1d1-359a6a66920mr1865461a91.26.1772634943397;
        Wed, 04 Mar 2026 06:35:43 -0800 (PST)
X-Received: by 2002:a17:90a:d40d:b0:354:a065:ec3e with SMTP id 98e67ed59e1d1-359a6a66920mr1865427a91.26.1772634942654;
        Wed, 04 Mar 2026 06:35:42 -0800 (PST)
Received: from [10.206.105.210] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82cf71sm16879002a12.26.2026.03.04.06.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 06:35:42 -0800 (PST)
Message-ID: <bb8a6e27-1b9b-4db6-b668-314a84b79b80@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 20:05:36 +0530
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
 <07d585fe-dfd1-41c9-9c58-b2f9893e572e@oss.qualcomm.com>
 <qoknqyxewirettcqlymmvnrrn5mft4ugf6zthvgmpeoapotct6@dundgjyvtjj2>
Content-Language: en-US
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
In-Reply-To: <qoknqyxewirettcqlymmvnrrn5mft4ugf6zthvgmpeoapotct6@dundgjyvtjj2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e7d4Qvcjlzm7QZEwuiyuuzGi34fB9ulV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExOCBTYWx0ZWRfXwITsIXn3P+ok
 kM24MDM/w+xZGuLrjEJhWuzeq6TrgXjQWFx9IkeLyQBub2t8/PPLpgkzZtV+z+brjRYV5b4tPl4
 3bEXLDzriwhuQnBnwgaoRQAkIhhzgdSX9iPtIfzIBu7p7uzzpScNfcfIgFOBDfsWBbaHqzHwtOP
 fcwuDYKh+/WOFmMzDb8v0puIXAmt0vvXUOldwlbxtvOFLHs79hf7oWdA8aTC38vJKjoZFPwai5v
 XBMphloUUdkZKS5R4J5sFX1S1SJVhPXwOpV0SJfG49VuB2vd1CeX8/cSMmuxGwe75zmuuXyI6gz
 0qNTB5Byd0CY6xKV4o6lgBB7dUJjSqiFkEgDvEzMCnlyN4f4hIYNS/2B/zgPI8nGMKM/SQzqim6
 4wdrM8saBeDsUpSm+BMwo0kzSkt+ThjY+8mqpDtYlJ7mckVNCbUrJV0nRtNwfRwtsZFEp4d8cf1
 hQXBe08htOalzF1EW/g==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a84340 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=lEOYtOyc511SuodwwMIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: e7d4Qvcjlzm7QZEwuiyuuzGi34fB9ulV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040118
X-Rspamd-Queue-Id: C3065201EE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95351-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action



On 2/28/2026 12:44 AM, Bjorn Andersson wrote:
> On Fri, Feb 27, 2026 at 07:52:00PM +0530, Anandu Krishnan E wrote:
>>
>> On 2/26/2026 11:20 PM, Bjorn Andersson wrote:
>>> On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
>>>> Add reference counting using kref to the fastrpc_user structure to
>>>> prevent use-after-free issues when contexts are freed from workqueue
>>>> after device release.
>>> Please follow
>>> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
>>> and start your commit message by clearly establishing the problem, once
>>> that's done you can describe the technical solution.
>> sure,  will update the commit message and send as patch v2.
>>>> The issue occurs when fastrpc_device_release() frees the user structure
>>>> while invoke contexts are still pending in the workqueue. When the
>>>> workqueue later calls fastrpc_context_free(), it attempts to access
>>>> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
>>> But why does it do that?
>>>
>>> The reason why we need buf->fl->cctx in this context is because we need
>>> to mask out the DMA address from the buf->dma_addr (remove the SID bits).
>>>
>>> If we instead split "dma_addr" into two separate members of struct
>>> fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), then
>>> it would be clear throughout the driver which address space we're
>>> talking about (is it the SID-adjusted iova space or the dma_addr_t in
>>> the particular DMA context).
>>>
>>> In addition to making this aspect of the driver easier to follow, you no
>>> longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() (or
>>> anywhere else for that matter).
>>>
>>> You can just pass buf->dma_addr directly to dma_free_coherent().
>>>
>>> You're isolating the fact that the firmware needs to see "SID |
>>> dma_addr" to just two places in the driver.
>> I agree with the refactoring direction you’re suggesting, and
>> separating the address spaces does make the driver easier
>> to reason about.
>>
>> That said, the UAF isn’t limited to the buffer
>> free path. fastrpc_context_free() also calls fastrpc_map_put(),
>> which reaches fastrpc_free_map() and still dereferences fl, so
>> addressing only the buffer side doesn’t fully resolve the lifetime issue.
>> So the reference counting is still needed. I will update the scenario in
>> commit message as well.
>>
> I presume you're referring to the "vmid" we need to rebuild the
> src_perms for use in fastrpc_free_map()?
>
> I think the relevant question to ask there is if it's really a property
> of the "fastrpc file context". It seems to me that we could solve that
> by storing the src_perms in the fastrpc_map once we've done the
> qcom_scm_assign_mem() call in fastrpc_map_attach() - so that we can free
> that object without having to reach out to objects of other lifetimes.
>
>> If you think it makes sense, I can take the address‑space refactoring
>> as a separate follow‑up patch and keep this change focused on fixing
>> the lifetime issue.
> The chance of you fixing one lifetime issue by introducing one or more
> worries me, I'm only familiar with the driver, so I wouldn't be able to
> say with confidence without investing more time fully understand the
> various lifetimes. So if we're going that path, I'd like someone else to
> step up and tell me that it's good.
>
> On the other hand, the two changes I presented above are logically
> simple to make, follow, and review - and they don't complicate the
> driver further. So that would still be _my_ preferred choice.
I understand your concerns about the ref count approach.
But with the two above changes also UAF issue will still persist.
In fastrpc_free_map() :

if (map->fl) {
     spin_lock(&map->fl->lock);
     list_del(&map->node);
     spin_unlock(&map->fl->lock);
     map->fl = NULL;
}

we are using above logic to remove map node from the list.
Here also we are using fl->lock to manage the map list and
this map is part of fl->maps list as well.


I suggested ref count change because it was handling all the
scenarios we discussed above. I am open to any alternative
suggestions as well.

Regards,
Anandu

>
> [..]
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index 47356a5d5804..3ababcf327d7 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -310,6 +310,8 @@ struct fastrpc_user {
>>>>    	spinlock_t lock;
>>>>    	/* lock for allocations */
>>>>    	struct mutex mutex;
>>>> +	/* Reference count */
>>>> +	struct kref refcount;
>>>>    };
>>>>    /* Extract SMMU PA from consolidated IOVA */
>>>> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>>>>    	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>>>>    }
>>>> +static void fastrpc_user_free(struct kref *ref)
>>>> +{
>>>> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
>>> Unrelated question, what does the "fl" abbreviation actually mean? I
>>> presume 'f' is for "fastrpc", but what is 'l'?
>> fl is short for fastrpc file.
>>
> Hmm, okay. Thank you for clarifying.
>
> Regards,
> Bjorn
>
>> Regards,
>> Anandu
>>> Regards,
>>> Bjorn
>>>> +
>>>> +	fastrpc_channel_ctx_put(fl->cctx);
>>>> +	mutex_destroy(&fl->mutex);
>>>> +	kfree(fl);
>>>> +}
>>>> +
>>>> +static void fastrpc_user_get(struct fastrpc_user *fl)
>>>> +{
>>>> +	kref_get(&fl->refcount);
>>>> +}
>>>> +
>>>> +static void fastrpc_user_put(struct fastrpc_user *fl)
>>>> +{
>>>> +	kref_put(&fl->refcount, fastrpc_user_free);
>>>> +}
>>>> +
>>>>    static void fastrpc_context_free(struct kref *ref)
>>>>    {
>>>>    	struct fastrpc_invoke_ctx *ctx;
>>>>    	struct fastrpc_channel_ctx *cctx;
>>>> +	struct fastrpc_user *fl;
>>>>    	unsigned long flags;
>>>>    	int i;
>>>>    	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>>>>    	cctx = ctx->cctx;
>>>> +	fl = ctx->fl;
>>>>    	for (i = 0; i < ctx->nbufs; i++)
>>>>    		fastrpc_map_put(ctx->maps[i]);
>>>> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>>>>    	kfree(ctx->olaps);
>>>>    	kfree(ctx);
>>>> +	/* Release the reference taken in fastrpc_context_alloc() */
>>>> +	fastrpc_user_put(fl);
>>>>    	fastrpc_channel_ctx_put(cctx);
>>>>    }
>>>> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>    	/* Released in fastrpc_context_put() */
>>>>    	fastrpc_channel_ctx_get(cctx);
>>>> +	/* Take a reference to user, released in fastrpc_context_free() */
>>>> +	fastrpc_user_get(user);
>>>>    	ctx->sc = sc;
>>>>    	ctx->retval = -1;
>>>> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>>>>    	spin_lock(&user->lock);
>>>>    	list_del(&ctx->node);
>>>>    	spin_unlock(&user->lock);
>>>> +	fastrpc_user_put(user);
>>>>    	fastrpc_channel_ctx_put(cctx);
>>>>    	kfree(ctx->maps);
>>>>    	kfree(ctx->olaps);
>>>> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>>>>    	}
>>>>    	fastrpc_session_free(cctx, fl->sctx);
>>>> -	fastrpc_channel_ctx_put(cctx);
>>>> -
>>>> -	mutex_destroy(&fl->mutex);
>>>> -	kfree(fl);
>>>>    	file->private_data = NULL;
>>>> +	/* Release the reference taken in fastrpc_device_open */
>>>> +	fastrpc_user_put(fl);
>>>>    	return 0;
>>>>    }
>>>> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>>>    	spin_lock_irqsave(&cctx->lock, flags);
>>>>    	list_add_tail(&fl->user, &cctx->users);
>>>>    	spin_unlock_irqrestore(&cctx->lock, flags);
>>>> +	kref_init(&fl->refcount);
>>>>    	return 0;
>>>>    }
>>>> -- 
>>>> 2.34.1
>>>>
>>>>



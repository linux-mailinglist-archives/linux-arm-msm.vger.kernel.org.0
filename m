Return-Path: <linux-arm-msm+bounces-100740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAM0JoBRymnQ7gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:33:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7C359601
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 873653092A72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4374C3BFE2F;
	Mon, 30 Mar 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCLMA0RL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VfvCX58x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67E3BD255
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865599; cv=none; b=W2gFIwJpZmwSEEdmX0JEck4pOxIVE97iGKs234sDBx3HcykyzDUJ5p4TTI5xIFdy2mI2ZaUgjvAANQIhDYdOrESlK+h131bHRprTbEW8TZVRv03+5k31b0vGLpP9z9lrwKeLh/gRZl+rIEr51iMtE9PqFbnn+R8MSfexQCO2juQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865599; c=relaxed/simple;
	bh=+J0dWum10vXpfXmJtN0PPmJj5pYXRpyEnivifCDuo7E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=adjrtvy453jQvreyHOBuQP3msVtpZHNLhEjWm+xXlPk/4PLTruLTetXFArErT0oZFTKovUDc9QaXZ8Ib2ve32ow9pBqdvVPLWI80xxUlucGVS0cYUbQBJ0SaYvHonpA31hszTZg5fS2BqXV9Iyb0uC0Uv9r+vcjeXIavMKzJaIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCLMA0RL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VfvCX58x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9Rw2K4087439
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLyumwZwV4Unes5NjG6rEnqvjaR0Ya3IUw6Dv70byeE=; b=YCLMA0RLZlVx7mKR
	X94PH9bIj8t1eptqra1e4Xa2os0Z9iCMnQp+e0CbZLI38CkHfpkU+wEXu2pGHBAT
	Pf5Zyq1g2gunxxk8oSXmhbBf20KXnwW+naU0L5+1mz3wsPLOhsXdV/fS85cFqBnO
	DnYlYSPC7D/06IBoBdsH4behyXhUQPPoMKGmjqiURiVr42ksqXkEtKZZqQb0kacU
	QOvjkJujG2n7C5YPfWmwxM/1t1NaH2j2HEi4SnXa/ueft8I6ZyEnZ1LXAIBqnGI0
	hqyD11SRgc6ZrmF+cnHMI8hyHqS6pS6yrz0JFMVLs5GBsg5dD2qaQl9t5oufY6cW
	SuSLog==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715n25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:13:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so2606301a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774865596; x=1775470396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vLyumwZwV4Unes5NjG6rEnqvjaR0Ya3IUw6Dv70byeE=;
        b=VfvCX58xsczI71JWNAZFjFXMFx8p53+J7jwBunDkUbdMiuSqvLAR5x18Q/JUKyN38i
         iMTWR1teJl7skUJKnRMkaZ8VvUBXBGT9aUi6u62wN0HpcyYe17u3MOnJ/hN0NgvMq4NS
         u2z/z+KDiB/mDJXDARziGtAlfTpaNbJUFDEg87zERsH78uWFdj/4D4hyUo+gaF/6bMsz
         W3O9w6nCERII4h1qZdWECv4B8dk75K+BKs7Byy4xxvn22jFG11e1MeJa2aULxy+RLnxr
         Xtf7bUDSytAcXp2URIGcZULbg9P679qw5uyncMaPpEke2EynuD/FvN5KlUfLywv+hgGL
         Ckog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865596; x=1775470396;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLyumwZwV4Unes5NjG6rEnqvjaR0Ya3IUw6Dv70byeE=;
        b=QAOWZ/UP9sio4NX9R0VtufOMV1+1y92RDfBdCD8n/42ZHg2XNbqLPZksixxOC5w6aa
         DTRjAg+OFcZx3+K5KEvsEeOu9GtpySoPAUSVcDrfgM1Ctulzj539vUqY3Uup3vEEj9Y+
         ani+gwNP2h05QzvSyPuyM/+pbNKOQqq0gxprav/gryCRQMpAUGAegJjUOZQdx6T8bDdP
         trIfDTkDzg15O25klo0Rp+deShJSPuf9NPthwoQP5DlKQokLaNPNrZL17VvxTXGoIgmW
         svnfoPBYKG/QLzh5CakYzNRqp/C3SbEr3IcDiIkAgMu57DeTNbouXgLF5BwhV7I4285z
         JZHA==
X-Forwarded-Encrypted: i=1; AJvYcCV/8ulbOhVG4paN+yk3aMwJgIHHEL76fxNf3iZpgcoyRqZFcAfNUo0HlXJ7bciNacilWmVaZbr8gK+HgD/0@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmo8QfPHjkfMQsaNeDpywa/Lcvzo6yoJZu0sqrZqIy7H0sVJh
	43cN0AORTVoRRlV/eZNva1Fxo8Tq5RgVl5xw68OG1D0iYpJ+tjV8kUemFZ6iutu17/huAY2eXpT
	fWjZR8pu5grdu/HetIYifKpkIOmiM3xR0kTC/9er99+8Jks4a5N8cQwGdQQP+rHAzBCv7CsOSxj
	RG
X-Gm-Gg: ATEYQzzop8y5wMGBvHLjsmuIiXEPELU+9lCi7g8Ljmd3Ely8NVYzS508CSlYLFc4har
	UEK8InJW65ZLur+2PeEI2q1C7R0toCjqzAZkGgXHEgsrxNHRsO7z8Rp8cj2pymZhG4lL0RCSS5r
	uP56jA8e0V/Rsk4djy9VnsuMA/76zvbEvY46oQlV9JTHuHolbMJXhfAvNTG9uZnzV7slVA43UKC
	agejORPJFlylhjfyisBJ4xvYblJIrv9pMaerJCPoj+ugbRfkFEPHCtEDUhp30TL80NmuMvsENjT
	JC0ZHju9ZIV0/1OxvgCX9Jz++fonZTaelYVrT2u4kUAeE3v/Hg9p85l7xwakyEJ5ow7ERIMkFF1
	voD5S+gU05M+q30UNb5iCVg3T1HhoQSFsS+NmWCaN64Jn9Jc=
X-Received: by 2002:a05:6a00:99c:b0:7e8:3fcb:9b06 with SMTP id d2e1a72fcca58-82c86a1d3ffmr12451211b3a.28.1774865596070;
        Mon, 30 Mar 2026 03:13:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:99c:b0:7e8:3fcb:9b06 with SMTP id d2e1a72fcca58-82c86a1d3ffmr12451184b3a.28.1774865595498;
        Mon, 30 Mar 2026 03:13:15 -0700 (PDT)
Received: from [10.206.105.210] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm6911855b3a.9.2026.03.30.03.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:13:14 -0700 (PDT)
Message-ID: <7cbc7fd2-3cd8-4a7d-8897-94de373e9f81@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:43:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for fastrpc_user
 structure
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
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
 <bb8a6e27-1b9b-4db6-b668-314a84b79b80@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bb8a6e27-1b9b-4db6-b668-314a84b79b80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -230Mxa6BLReFE5LsBhuAlg98b10gd2B
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca4cbd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=eNZlvu6GDwxFnSIoZcoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: -230Mxa6BLReFE5LsBhuAlg98b10gd2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MCBTYWx0ZWRfXwupU57+Ok+l6
 Q3AObnjKPJQmbxi3WZx5+N/EWnrI4EqMGWvlsPXj/G0Jiw3cG9EmeoTRS5i+iz41LkR/0Y6LPM3
 zGC1tbt+dgmsDNXqjosWBARtR9szFwaHvO43BCZ3qkPVVN6I+twVE0LnPOXapInZ4WjvxxhOkNv
 PQE/Wlzq1CRsbMRzOOHE4o2SvJ6jzEoyJ64Visn4ZEGbHZF6gY63pqvTP7jq7QYvNdCUmBFz9SD
 2R90BsEYBxW3R53fU7h0WUVZ2caR7SQSKH8IB9rnOamlRTyYkg42zwaijJGbHWKOy3KTnCB5fCH
 PN83pXjtPhrYfpYmgHlP/BtpgfndjRCTPZIc12kt2t3RSaDMWybNojzjTf5QyyLd6b2B5N4WHEG
 EPUUnML3UEVDjo+hKHo+q2o8MmTiLWgXZ82I1gMPAUuoCD7KXpIcWxj1fHpXrEiNo163AXf2pbR
 +BGLsst2JnEvOXeFbow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300080
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100740-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 9CF7C359601
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/4/2026 8:05 PM, Anandu Krishnan E wrote:
>
>
> On 2/28/2026 12:44 AM, Bjorn Andersson wrote:
>> On Fri, Feb 27, 2026 at 07:52:00PM +0530, Anandu Krishnan E wrote:
>>>
>>> On 2/26/2026 11:20 PM, Bjorn Andersson wrote:
>>>> On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
>>>>> Add reference counting using kref to the fastrpc_user structure to
>>>>> prevent use-after-free issues when contexts are freed from workqueue
>>>>> after device release.
>>>> Please follow
>>>> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes 
>>>>
>>>> and start your commit message by clearly establishing the problem, 
>>>> once
>>>> that's done you can describe the technical solution.
>>> sure,  will update the commit message and send as patch v2.
>>>>> The issue occurs when fastrpc_device_release() frees the user 
>>>>> structure
>>>>> while invoke contexts are still pending in the workqueue. When the
>>>>> workqueue later calls fastrpc_context_free(), it attempts to access
>>>>> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
>>>> But why does it do that?
>>>>
>>>> The reason why we need buf->fl->cctx in this context is because we 
>>>> need
>>>> to mask out the DMA address from the buf->dma_addr (remove the SID 
>>>> bits).
>>>>
>>>> If we instead split "dma_addr" into two separate members of struct
>>>> fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), 
>>>> then
>>>> it would be clear throughout the driver which address space we're
>>>> talking about (is it the SID-adjusted iova space or the dma_addr_t in
>>>> the particular DMA context).
>>>>
>>>> In addition to making this aspect of the driver easier to follow, 
>>>> you no
>>>> longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() 
>>>> (or
>>>> anywhere else for that matter).
>>>>
>>>> You can just pass buf->dma_addr directly to dma_free_coherent().
>>>>
>>>> You're isolating the fact that the firmware needs to see "SID |
>>>> dma_addr" to just two places in the driver.
>>> I agree with the refactoring direction you’re suggesting, and
>>> separating the address spaces does make the driver easier
>>> to reason about.
>>>
>>> That said, the UAF isn’t limited to the buffer
>>> free path. fastrpc_context_free() also calls fastrpc_map_put(),
>>> which reaches fastrpc_free_map() and still dereferences fl, so
>>> addressing only the buffer side doesn’t fully resolve the lifetime 
>>> issue.
>>> So the reference counting is still needed. I will update the 
>>> scenario in
>>> commit message as well.
>>>
>> I presume you're referring to the "vmid" we need to rebuild the
>> src_perms for use in fastrpc_free_map()?
>>
>> I think the relevant question to ask there is if it's really a property
>> of the "fastrpc file context". It seems to me that we could solve that
>> by storing the src_perms in the fastrpc_map once we've done the
>> qcom_scm_assign_mem() call in fastrpc_map_attach() - so that we can free
>> that object without having to reach out to objects of other lifetimes.
>>
>>> If you think it makes sense, I can take the address‑space refactoring
>>> as a separate follow‑up patch and keep this change focused on fixing
>>> the lifetime issue.
>> The chance of you fixing one lifetime issue by introducing one or more
>> worries me, I'm only familiar with the driver, so I wouldn't be able to
>> say with confidence without investing more time fully understand the
>> various lifetimes. So if we're going that path, I'd like someone else to
>> step up and tell me that it's good.
>>
>> On the other hand, the two changes I presented above are logically
>> simple to make, follow, and review - and they don't complicate the
>> driver further. So that would still be _my_ preferred choice.
> I understand your concerns about the ref count approach.
> But with the two above changes also UAF issue will still persist.
> In fastrpc_free_map() :
>
> if (map->fl) {
>     spin_lock(&map->fl->lock);
>     list_del(&map->node);
>     spin_unlock(&map->fl->lock);
>     map->fl = NULL;
> }
>
> we are using above logic to remove map node from the list.
> Here also we are using fl->lock to manage the map list and
> this map is part of fl->maps list as well.
>
>
> I suggested ref count change because it was handling all the
> scenarios we discussed above. I am open to any alternative
> suggestions as well.
>
> Regards,
> Anandu

Just a quick follow-up on my earlier reply.

My concern was that even with the two changes you suggested,
we still end up dereferencing fl->lock in fastrpc_free_map()
when removing the map from fl->maps, which could still
result in a UAF.

Since the reference-count approach addressed all the scenarios
we discussed, I wanted to check whether you’re okay with
proceeding in that direction. If you have an alternative
suggestion, I’d be happy to take that up. Alternatively,
if there are specific issues you see with the refcount
approach, I can review and address them from my side.

- Anandu

>
>>
>> [..]
>>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>>> index 47356a5d5804..3ababcf327d7 100644
>>>>> --- a/drivers/misc/fastrpc.c
>>>>> +++ b/drivers/misc/fastrpc.c
>>>>> @@ -310,6 +310,8 @@ struct fastrpc_user {
>>>>>        spinlock_t lock;
>>>>>        /* lock for allocations */
>>>>>        struct mutex mutex;
>>>>> +    /* Reference count */
>>>>> +    struct kref refcount;
>>>>>    };
>>>>>    /* Extract SMMU PA from consolidated IOVA */
>>>>> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct 
>>>>> fastrpc_channel_ctx *cctx)
>>>>>        kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>>>>>    }
>>>>> +static void fastrpc_user_free(struct kref *ref)
>>>>> +{
>>>>> +    struct fastrpc_user *fl = container_of(ref, struct 
>>>>> fastrpc_user, refcount);
>>>> Unrelated question, what does the "fl" abbreviation actually mean? I
>>>> presume 'f' is for "fastrpc", but what is 'l'?
>>> fl is short for fastrpc file.
>>>
>> Hmm, okay. Thank you for clarifying.
>>
>> Regards,
>> Bjorn
>>
>>> Regards,
>>> Anandu
>>>> Regards,
>>>> Bjorn
>>>>> +
>>>>> +    fastrpc_channel_ctx_put(fl->cctx);
>>>>> +    mutex_destroy(&fl->mutex);
>>>>> +    kfree(fl);
>>>>> +}
>>>>> +
>>>>> +static void fastrpc_user_get(struct fastrpc_user *fl)
>>>>> +{
>>>>> +    kref_get(&fl->refcount);
>>>>> +}
>>>>> +
>>>>> +static void fastrpc_user_put(struct fastrpc_user *fl)
>>>>> +{
>>>>> +    kref_put(&fl->refcount, fastrpc_user_free);
>>>>> +}
>>>>> +
>>>>>    static void fastrpc_context_free(struct kref *ref)
>>>>>    {
>>>>>        struct fastrpc_invoke_ctx *ctx;
>>>>>        struct fastrpc_channel_ctx *cctx;
>>>>> +    struct fastrpc_user *fl;
>>>>>        unsigned long flags;
>>>>>        int i;
>>>>>        ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>>>>>        cctx = ctx->cctx;
>>>>> +    fl = ctx->fl;
>>>>>        for (i = 0; i < ctx->nbufs; i++)
>>>>>            fastrpc_map_put(ctx->maps[i]);
>>>>> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref 
>>>>> *ref)
>>>>>        kfree(ctx->olaps);
>>>>>        kfree(ctx);
>>>>> +    /* Release the reference taken in fastrpc_context_alloc() */
>>>>> +    fastrpc_user_put(fl);
>>>>>        fastrpc_channel_ctx_put(cctx);
>>>>>    }
>>>>> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx 
>>>>> *fastrpc_context_alloc(
>>>>>        /* Released in fastrpc_context_put() */
>>>>>        fastrpc_channel_ctx_get(cctx);
>>>>> +    /* Take a reference to user, released in 
>>>>> fastrpc_context_free() */
>>>>> +    fastrpc_user_get(user);
>>>>>        ctx->sc = sc;
>>>>>        ctx->retval = -1;
>>>>> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx 
>>>>> *fastrpc_context_alloc(
>>>>>        spin_lock(&user->lock);
>>>>>        list_del(&ctx->node);
>>>>>        spin_unlock(&user->lock);
>>>>> +    fastrpc_user_put(user);
>>>>>        fastrpc_channel_ctx_put(cctx);
>>>>>        kfree(ctx->maps);
>>>>>        kfree(ctx->olaps);
>>>>> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct 
>>>>> inode *inode, struct file *file)
>>>>>        }
>>>>>        fastrpc_session_free(cctx, fl->sctx);
>>>>> -    fastrpc_channel_ctx_put(cctx);
>>>>> -
>>>>> -    mutex_destroy(&fl->mutex);
>>>>> -    kfree(fl);
>>>>>        file->private_data = NULL;
>>>>> +    /* Release the reference taken in fastrpc_device_open */
>>>>> +    fastrpc_user_put(fl);
>>>>>        return 0;
>>>>>    }
>>>>> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode 
>>>>> *inode, struct file *filp)
>>>>>        spin_lock_irqsave(&cctx->lock, flags);
>>>>>        list_add_tail(&fl->user, &cctx->users);
>>>>>        spin_unlock_irqrestore(&cctx->lock, flags);
>>>>> +    kref_init(&fl->refcount);
>>>>>        return 0;
>>>>>    }
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>>>
>



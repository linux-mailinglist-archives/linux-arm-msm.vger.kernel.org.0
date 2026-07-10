Return-Path: <linux-arm-msm+bounces-118255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i7ipAYnTUGpl5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:12:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD173A029
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VCTgJ131;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KU2uoi0I;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118255-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118255-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BD36303CC5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72CF416CEE;
	Fri, 10 Jul 2026 11:11:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46D411689
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:11:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681914; cv=none; b=V4GavqJurvaGpHmHsDFG7vAgHNaI2p4qShB0HwAXeeDub9u0r32FzApc7aQ552YrrKWo5oKH5A8g2/lGBhmzMnTuhCZD0dorqi6+Fwpdl/s0XhRFZEeJXIbvjY/mbfeh20wepGaonbq613BCUoWPoeSpV2YmFakIazp6/tV70p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681914; c=relaxed/simple;
	bh=MKPke5BUYCTUcfxDA8duezcYg48WdqfGwObsktUR5lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqO0/gVE9IqnYIX7hTSNlChgwk78tibckJLxHjHKgIs+V/I3A6BFoKnSW1BCoB8CHxVdJ0Z9Rer/C72UNytpvfJHzeUq7/xJMI8ACmjBZvTvSFQP2W1iF7Llj9UowCtxLlNR1Pz9EDq/v1RlCux47SV1cye4ENRkiqyz1OqFIbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VCTgJ131; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KU2uoi0I; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnJ2i617143
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JU6YRxZVspUNbu+VKz/3WI7sJx1qZ3NhZ7bU7qRiJXg=; b=VCTgJ131iEPM4MAE
	8AYlc6FUY8uYOy4BZ+QjxJUMPxwOJP1fAdceJXbGSle3LxdPLs/ci66EsO43j6Aa
	aCV35X4L1GQDnSm7oi2OXuH2GTtAB8jKnxUTqGN99GkNSqHGFM8BsOCG4XOOiG+R
	K6P28wi4JcS9YD5PpAJvsQNwH9pOd+mbfQXlUGRMwiZ+YRyKyDMRmw6q2tyBKrg5
	zcuhJAAZdqDAkWin8FUYJDLXkAYcL/t/TWBIIzqwQ9YloyN3IjqfdZdvcQWSUsJ7
	wUsiP0u0b/+jxA+UfqEZAI3Hst6y/HtalCKmlTL1+NFiI8dWKz6RLaOIlWWkSug4
	/z5aJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1jmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:11:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388b404eae6so1659165a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783681910; x=1784286710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU6YRxZVspUNbu+VKz/3WI7sJx1qZ3NhZ7bU7qRiJXg=;
        b=KU2uoi0IuETp1dL6Tf0Wt5O73+b6emnQZRmNod6hZ8nOWeNKhPGA4ZKw8Tt7KZd2Ho
         53vivZZYXn6UROqxW3RDhkDzur26XM7anpLZ8k0QE7t3VFugB1gYZKTEO64wQdzo6WZv
         aQHGqKYAaLvp1qgimb5b3EGsCbWnpxAraaRvMpk9Mk4KNrXpMUA2UxmkmGCoM7pYZXTr
         z5S2ZKzM/HTT+jSbr8ZPiXbDIyN2Xj6XNxbfCDKuwy7THPBA6yiEHo4WG+FGs6AAzjl0
         LOUt8esrlVB4gVcxNejzVUhM0gteJ/t1JWWw38t9g3GFYsoYvYRVSi2hO7RNkbzvGo1y
         QYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681910; x=1784286710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU6YRxZVspUNbu+VKz/3WI7sJx1qZ3NhZ7bU7qRiJXg=;
        b=jFhWhXh9a8XWcR9/dW3XdbRcUg2KHFqCe4LjI03nCdJMV73E0lG57eSCCrMtfjN4E3
         9FLvyFq6ll8gzlk+InSAfAvJIQo6a4jvDj3RA2rD0NlZYGS7tS2eL9NKrZBsg4yGzXYU
         q8dFR64knREhaZRmKZQDAH5NSW8YsnCg1fWGreMOtMPlm8eCjkNepltiWaCEqWs0n35U
         KmG9kLT6fvfJGc7OOLK6m4R51czFuMxbRUjEaCyIZycakl8RZnngOVfOVhx5dJDWA/VO
         yaP9TFeJldFtpNt+fcYE13mqkOaKsF7sfMfyr4T6v2XqATaR1Do/tv0K2Ayp2bGTezFt
         FGqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqneO0aGhHUw55F32GG0Ij3AndIeIu3gsoI4lBtQpzknlrvzUiCdFkk5jIxr8o/tkHSM0IFQykKOAbjd2pE@vger.kernel.org
X-Gm-Message-State: AOJu0YxoYG+a+hHKcaijjYqLhDQapeG9Wucqe1ppYA+ze6AM8+ETjKJ9
	V1t/l+e6oJ9/F66aLqR2nO6Zj3bI7CirCLD0Htqk1aafPlBP5u1oAChdhEnXAt76+sJupOrxQPs
	3LE9J/uf7TwFBhLqJXYlBoq6D7rnfxBNi4XZWT7tAitldS7q0HBl5ccWLPcN6Zkj0fiLgHKtZ6c
	a/
X-Gm-Gg: AfdE7clzhh4ES+v6367WiBBh+6nBB3vviW1XquylW3MXVgSxu135/auncQRZEOj52m4
	19eLtsLakgTGqDVRnk5YD7a214FTPA+9XV6H97aqd9kPi46Vkl+P3UIws3/CPrGc2vUWIk2+LIs
	BrVc4oTC8np3o25cyLDktvzMBFQq5ZVYh9U8ugnZvRprB4UZ6y0AWNRZtWCOMiO9t8WLNc6fwtv
	wF9GJOrj732Q0hQYfMzratIsK1kluzSu5spkDKn/0mgtEe0d9jqAj6VVfFnlIiqGQWs2ChL9nJP
	FiZw8fZGdFa+8J52W2i0G/UzfzIqzphoAD5B6zoc6Q3CAmJGPHEe4EC4H846S4FlHf3ATtHqhsk
	OjTzIPnEmB2AL9nsb1kgfQiRSfMyiqL71OoBSzRFwk32X1AjIZw==
X-Received: by 2002:a17:90b:3f8c:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-38942b786e0mr10762381a91.43.1783681910300;
        Fri, 10 Jul 2026 04:11:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:387:e0cb:7f7 with SMTP id 98e67ed59e1d1-38942b786e0mr10762344a91.43.1783681909714;
        Fri, 10 Jul 2026 04:11:49 -0700 (PDT)
Received: from [192.168.31.103] ([152.58.31.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad7asm2610062a91.3.2026.07.10.04.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:11:49 -0700 (PDT)
Message-ID: <e775ae90-86d2-4901-8057-264953d25c02@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:41:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Add dynamic transfer timeout based on
 transfer length and frequency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        andi.shyti@kernel.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        naresh.maramaina@oss.qualcomm.com
References: <20260705135739.4038826-1-aniket.randive@oss.qualcomm.com>
 <4f865aaf-a400-4dc6-acaa-80dc22a36af7@oss.qualcomm.com>
 <6b53fa97-0fae-4ba2-a774-ae8df2c2ad4e@oss.qualcomm.com>
 <82326bd4-59f0-45b6-8f06-38896cf9f9bb@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <82326bd4-59f0-45b6-8f06-38896cf9f9bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwOSBTYWx0ZWRfX9Xw6wrtKnhO2
 MSfEFOZeIVDJc1+Pcfcs3Atljtmh/qPgTbTqch8dlh90tAzNb0CKXXcWqwuVf2h4MuBSvLKT8A2
 LlTOUvIIvpXnVN01v2SthJGqsAPbBPQ=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50d377 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=9AXozQ6IwN0d4JI31gUtBA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=52HooUGS_mQjH2t11kEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: yTGKmkC33jKIRsZ_SpEXlZ8WdZCav4_d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwOSBTYWx0ZWRfX1o7aFDvJRW0H
 Ymrm9vSyepczpneCpzyH2o72F2JY5+zdXjiabJ0VsFFxLfS60BRPDh+DkHgQ2zjJUmOyaJm6ZK/
 hImmSha/8ZW17K2frkCH1Qs4Rin1SaMfwHeM5fqIgYlg3YuA6VJvQxQ4W9sXIG2QYk4evAshdlh
 FAc7DpxJuQEyPO755ox7ylaR3ghVL7CFAiL3Edy6YvTjCFnzHaYVY3EtJgj7maKYYNHmZrKafyo
 gWKz2aqvZSGj5Cujr/tZefHjST5whTrFAwzXciQD8E+5f2AoElUkmSK6xANl7BzmqPeSFK81dv2
 n7p7wGoKpI6h5cqf/uarb2Um77/X/gGfOzPNeozSvo1w9UFsoRKvY+SV2gmr2nak5lKKdKQXAjO
 xovCzI/SO50GGC+MV/ZlARPOoYXDZUt8IF5Ut5fUYv77fh0+t8413FILcOj/fBhP6zS79E3gdY4
 FiChR2JxG45RV+dNInA==
X-Proofpoint-GUID: yTGKmkC33jKIRsZ_SpEXlZ8WdZCav4_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118255-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62DD173A029



On 7/10/2026 2:57 PM, Konrad Dybcio wrote:
> On 7/9/26 8:28 AM, Aniket RANDIVE wrote:
>> Thanks Konrad for the review.
>>
>> Sorry, I missed your comments on the v2 patch and ended up posting v3. I'm happy to post a v4 incorporating your feedback once the discussion concludes.
>>
>> On 7/6/2026 5:11 PM, Konrad Dybcio wrote:
>>> On 7/5/26 3:57 PM, Aniket Randive wrote:
>>>> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
>>>> regardless of message length or bus frequency, causing unnecessary
>>>> delays on error paths.
>>>>
>>>> Compute the timeout dynamically from message length and bus frequency
>>>> with a 10x safety margin over the theoretical wire time and a 300ms
>>>> floor. For GPI multi-descriptor transfers, use the maximum message
>>>> length across all queued messages as the per-completion timeout.
>>>
>>> What's the reason for a 0.3 s floor?
>>
>> The floor accounts for I2C clock stretching. The spec allows slaves to hold SCL low indefinitely during internal processing. A dynamically computed xfer time alone gives no time for that.
>> 300ms value covers worst-case stretching while still detecting real hangs 3x faster than the old 1s static timeout.
> 
> Please put that in the commit message and possibly in the code as a comment

Sure. I will update the commit message accordingly and add a 
corresponding comment in the driver as well.
Thanks,
Aniket

> 
>>
>> Thanks,
>> Aniket
>>
>>>
>>> Why a 10x safety margin specifically?
>>>
>>> [...]
>>
>> The multiplier covers the gap between theoretical xfer time and actual completion time (DMA descriptor setup, interrupt latency, and scheduling jitter on a loaded system)
>> Without it, short transfers would have almost no extra time before a spurious timeout.
> 
> Likewise
> 
> (Should there be a constant safety margin added to account for all
> that? Keep in mind this driver will run on a turbofast Glymur and on
> a notsofast Agatti so any numbers that depend on the processor's
> speed must be reasonable for both)
> 
> Konrad

The 10x multiplier was chosen as a conservative guard band to account 
for the gap between theoretical transfer time and actual completion 
time, including DMA setup, interrupt handling, and scheduling delays. 
Although the value is not derived from a formal worst-case latency 
analysis, it provides sufficient tolerance to accommodate runtime 
variability and helps avoid spurious timeouts across a wide range of 
platforms and system load conditions.

Thanks,
Aniket


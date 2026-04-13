Return-Path: <linux-arm-msm+bounces-102910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPdhA26z3GkDVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D03E9A63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2D9A308BD3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665CC3AE1B8;
	Mon, 13 Apr 2026 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pZMspvhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CmW7OhFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D5A35957
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071059; cv=none; b=SQCpecJJUEsluQz6YNORr1+QV/Le3RJfZtyd1QXkgv5ocWIHoQzzvfKwKrZK+RJzkLbMxV0g92DOvH3p4AkF7sMBNWWBFaAnz+k3hYjvnX8CbEH3s8sgSi1xkK6xAr4x7RI28VAxoWV3zyzinhhvMBq+sUwdY4k7o5UBYPIrTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071059; c=relaxed/simple;
	bh=DheMOtEnz8CCLQRfzaHndZpq+VdNdR/xkOKuGmrv+M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NqrvqCx5Ci/5whIy/56TGjJrrd+appFqdxgHgf5IrU82x1PUV6XGbpPpE5rC9sPm7dWccCrlSo0A1lswRyeR+C0qJEPP3j74M6MOEMeFuFPhf5b7BEEuomqJjWRZVAn9wozvx/SQIaokSqGhpH5viSFZn/J2p3rK4jjTTc3fv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pZMspvhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CmW7OhFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5gYPM1120267
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=; b=pZMspvhN85wQE4e2
	qMTGU4v+MJdrmp2Rto/aNsP99siJM8Gz5/mhyyo2vLNoYFamgiKW4fZS+hJA21Cm
	zG6KrMoKNxYdlL1AjCSoT5d4CmTsNYqBWUAxyDyUsJwHjU9MjMAzUwgPjSXL06t0
	1QvP5xhVPZJbp8r3zYmu8t4JpH9GnOif1l90/b8SUbyuG75p+4mAx9ZAZgI8dTKy
	6Vf27Bb+ZJkwxbF9kLnJXgeXJkJj/9P0ED+BvNdZgSgZePLP0JUtnYLwcBkEw1KW
	IYRMsS+TEb9iwXj6Ns2uLd+YYhpx4fJKsBkF7gFWlsjE6VPHj8a1HEUYp0+3mxTb
	UngZQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvgxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:04:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8ff14e5so10259815ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071056; x=1776675856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=;
        b=CmW7OhFV7R7tL0pKEcRi5sos3Jk2PUjctn8bD+rAFqrOIDAZWvYh5zZBfzURawqlIA
         jqBUbG6kg+xPFF1MzzeB0JN5JxyYGv+I/i0blkmGeAx0K/oSA7wnq81Q1CfOGyEPOmwt
         9l1YwAPVzHh9HG4w/MWNPF1elZp/MifRnqA0NStPAhAIyVs/qs0AxQnTnQ2egLK0PGHf
         /tl5NZ63ekPfZ7wFGTITQ9UyBfPRsgGfwsGGpasC2NHZ1lgppI2J15Zp5VWh/4lp40kV
         kdDxaAZq1jCejm78a4JlV9zgGBgMdllZ+usOicXmGWjvpaneZgaJa+w8DjJuXw4U8Zy+
         uVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071056; x=1776675856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjIwuH9N8gy+uzkST9nRyvef7/HrlTethb8JNWRqYeY=;
        b=a9StBRemNbHVvfjvxB1ygM/r7oyPxSju8sC++YF8/CJlL03XxAF0PokE096BGfjLac
         A3qUVkWi+9bgY5lJZXfnkn7mj6XMyynx13yXziBXlOaN1SnB6XDIPerdtfKJQ3X6Gu+1
         yQJjrTWOQnnUL4rk5fAXkdNEn/AW8AXfB7n4q0P1R52Fg9ZD39l9mA8l96IJxfnomV75
         Ye3KYN+p6O0NAsRqzhTZ4l5ZR5CBZl3PiOMlcd6Z37hIxDXuyD9jpTqXEeZyigTo82Ro
         9K03v41LMQYOM1lM+46WX5tkV7GeOwEVjCgQcd6/BcidgxN3ONpOO5J/yBh2xSOs1ELG
         baJw==
X-Forwarded-Encrypted: i=1; AFNElJ+lhk5NyltLdQWp1OHWWuyZHB26HZGmDRVwJpTLDzrfDnizEp6fOkodDCAMp3KIBdkssXXymwmHOmNGaBBx@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRrQ1l/r1ylN3tGTsDYq40T5NSWxKoPA2eTTYzmx6bLlUnxYe
	UezlfNGrAHi0SbVk2tGxVuHmlL7L4UNWGoO9aYCqOqEg++uw0d1HzalY5HeZKzEwNzVbB9HM4Eg
	Z7AiLqYFZkdaBGwWXK6btceaATJTx+E/SRakpXyJGwjglAEMjlSbYxe49bz14RUQIKfTr
X-Gm-Gg: AeBDieuzgW4QAQyBZsb6etMjwx99mJUwAzVlKF6NKc+PsnpfdReTlOkk0WukaQhRDFf
	OH+e7uvSlNHzF0GU1/PtpRs43WlXjYD8/sbePDOdNdylcVKw+k+zMelpOXURfTiBOediT3HDsGK
	Yl/MNQ/BHSEyWsuSIyOVa/AeXBPbYjTX64wMV6Mq2/8Ess9l7wnKt8YhV4xz+tmBWToetCU/kj7
	1H++UNdS6FS68hnB7j8xCl6C3lkhM5Ws+o+zfNQ40ydkU70cF5pbTi+FAgQMkucsGR0dGKdgbh/
	e2IP0S9zjERhuqTLFB6KPi4dif61hlQaJ1m2mfSvi+V5vuj0h81ErfNZTy1lF21B/6daZDcnzUN
	0oWkRdU1Erw/sgj8a+pgZ+ymHwW2AqaahM6t2O7qHgT2nVDONpXp3ng4=
X-Received: by 2002:a17:903:4405:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b2d5a30ae9mr127536975ad.21.1776071055947;
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2b2d5a30ae9mr127536505ad.21.1776071055320;
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f0a39fsm106272495ad.48.2026.04.13.02.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:04:15 -0700 (PDT)
Message-ID: <a5fdde58-3ae0-466f-aea3-8367c6c94f5a@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:34:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] bus: mhi: Centralize firmware image table
 selection at probe time
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-4-47ad79308762@oss.qualcomm.com>
 <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <2eda7d10-e4a9-4ca7-ae73-bf9c0ca8fa33@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX5tzBTp9AN5jF
 wyIblgmkd0tn+tuOqmP0MO7/FIw2oVaHOKS1IfNb6j07/0mT+uJEQuiD5UJ4KcqxQ2sIoYia/VW
 uUTJO6F8Z/mPn9oprhoyBc94k1+entW53C+3psRIIYsZZwEIJeTjqfs+MDyurbGkRak8PtMt+kB
 MI21tGKdwDJM6riPg21bjf49C992htkl9Dhem7IoQiANwmQuGVdreI8W8qTpzdDDM4GecDkm7W+
 VR+OoA7DfBAWYc77g5WX01/qWOyIaVLoNNqsmubfcBMNNnFxDrrhCFkuzQgjTFmH+Vk1oUHvCz/
 EP9li9Y1zHbPqrmgtqBYQ6qFdSihStccl1MoGANyFKbsyXV3+GIY6nshmLyL437Uvzq8c93T4uB
 HbqlQSaq6JuPL0y56hJnPVb7qsFEbQlPHpzWiXQvHEfUesfyryL2/JTYxuZmkOZ896Kr33xgwBx
 92iTlXx+88bJWkGxk5g==
X-Proofpoint-ORIG-GUID: gTU27BHlnVmfKPeH-YtWdXB1kVKamz4i
X-Proofpoint-GUID: gTU27BHlnVmfKPeH-YtWdXB1kVKamz4i
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb191 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LJiLoplfShnj9_vHJaQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102910-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C4D03E9A63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 2:22 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> The Sahara driver currently selects firmware image tables using
>> scattered, device specific conditionals in the probe path, making the
>> logic harder to  follow and extend.
>
> "to follow" (remove extra space)


ACK.

>
>> Refactor firmware image table selection into a single, explicit 
>> probe-time
>> mechanism by introducing a variant table that captures device matching,
>> firmware image tables, firmware folder names, and streaming behavior in
>> one place.
>>
>> This centralizes device specific decisions, simplifies the probe logic,
>> and avoids ad-hoc conditionals while preserving the existing behavior 
>> for
>> all supported AIC devices.
>
> It would probably be useful to mention this is in preparation for 
> adding QDU100 support, otherwise this reads like it is just change for 
> the sake of change.


Sure. I will mention in next version.

>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 66 
>> ++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 58 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> e3499977e7c6b53bc624a8eb00d0636f2ea63307..8f1c0d72066c0cf80c09d78bfc51df2e482133b9 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -180,6 +180,16 @@ struct sahara_context {
>>       u32                read_data_length;
>>       bool                is_mem_dump_mode;
>>       bool                non_streaming;
>> +    const char            *fw_folder;
>> +};
>> +
>> +struct sahara_variant {
>> +    const char *match;
>> +    bool match_is_chan;
>
> This is dead code, add it later on when it gets used.


ACK.

>
>> +    const char * const *image_table;
>> +    size_t table_size;
>> +    const char *fw_folder;
>
> This is dead code, add it later on when it gets used.

ACK.
>
>> +    bool non_streaming;
>
> Please run pahole on this structure. With the interleaving of types 
> for every other member, I'm expecting there would be quite a bit of 
> compiler added padding.


Sure. I had ran pahole on this structure and 8 bytes can be saved. I 
will rearrange the members of the structure in the next version.

>
>


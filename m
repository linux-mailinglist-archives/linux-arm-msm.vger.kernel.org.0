Return-Path: <linux-arm-msm+bounces-95364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKZcL7BRqGnUtAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:37:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D45202E85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 16:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 496F130935F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F2133CEB5;
	Wed,  4 Mar 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q1inYt1P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amwtKKpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E5A330D34
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 15:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638176; cv=none; b=Fi/r/q5EIzdcQ3syjpPwuxDs9ocPwoSq/KG5GMj4BKfnsk3PtwDVHgsVRmhG/DAbejbSLad4ISkBos2Z05OlLJaJpMWjADo2zSq2a61BdjAGIRAJHNz5ucuTeoueQfTsOydA0W2X7gtvKo4a6AShX42mUeSRk70bXNWQkNY3nFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638176; c=relaxed/simple;
	bh=J2pHDqkcI5jgiqu24QsunAV3h4H2fOr3FdQWGJTAODc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AHl2LWTLX0j74asDbDlTxLTZGRO3430QlmFL+cPTurbfDxEZI0m2y3zgukYXE+S0mo4LyaiOOWTlmj7j8P9TnaiyulJ+tVVWhT21rTpxcLXTpJahVwBe5ehnBz+SwYXDo1x9Lz6B+6EwVlWvb8teDxpRX2IcNvJ5yIP6m6fnuAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q1inYt1P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amwtKKpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CbIH51072686
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 15:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7C3ZGxT6MAy3b00eY/LGUqY8Jlj5bg+7oTeA1mEoGE=; b=Q1inYt1P8vbSvquh
	RbvN1tXFxrQ7WBO3jZeuKtTjeAdNz4ed30cG+G58sHStPLRsDwStQPGQs1dKktMm
	oJLDvRMSjLmHEww6yy+apcHIz4RMoGWyCBlp5LE+GYdW6c3jGs6VkyZPZyypEeSw
	WngbUHpGtG1e2KHcRMRUs18ACkBa+1iML/MCIgto3Bgoa9RSbmmaDGcQst1S+ZFB
	45FSzvD9ZpzFF6UskSy+MK3gXph4vfIwm/md0q+Vz/2kO7KSp3NJ5AMGDsn/Jj0W
	1UKHCydobH6Js0BBYNHw5s10R0Zo6ro7QjZYup1+K2sB6cNbJUxZBK9qhpjPdBv2
	4ThEWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfj5wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 15:29:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c738662b963so221473a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 07:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772638173; x=1773242973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7C3ZGxT6MAy3b00eY/LGUqY8Jlj5bg+7oTeA1mEoGE=;
        b=amwtKKpcg5Am7DUBKeR4t3fJGJ6o0F0l0XLfTB3gHCI+3qMMBlWOfajgTO8eVo2H9k
         ZwvZDZRfytrDvNajiyiQj7627LNMSEpcUAAxUYRuXFWej87vD+j/ZnETw4/Yqj1d8xq2
         27eLK7tACgduTaZhBQtqvJlPfPNGVG27Pmcvt9Tp3ypqk0bmXwbjqcy41ruKF1KqsuQU
         61k7ZXFkHiPkc9lmj7DmieVCfyORtykzUAha5OvnFOeDN/NAcwRtz12d8TEVhRcCAm0Q
         9Z1XZHkvcGQhNK4VXLacQigtMiS1jYJf8KfOzE5MdBrwyClmiCyFAwFjMTNscDSjcbIG
         896w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638173; x=1773242973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7C3ZGxT6MAy3b00eY/LGUqY8Jlj5bg+7oTeA1mEoGE=;
        b=Q4q9WzWttq6thd9+Rj9B2kWEDgQKET24PZ07yU472uIGlr++qIxZHABxmPwG3O388V
         ZzVxnW2FWuDgeBZkfMa364SRJEkjubGKo8tajl4YExKnVSDl9eC8Y7CsIQdgklMN8mAW
         x87S1J8Utk/Jwu/LAfC/rEZKr1ILzzR5CqeB5+wr1nUvrtnp9r5XHtVQma4uvbANCbL8
         jPCbQ585U5WkVdpyh/hWDNfH5hwgWXxQyMneME5QH5AhWfPqJGJ7/+VLWYGKuDLJV4/E
         RRYJfxBdgoenapnSX/8cGpxqJ0vhnXGPtTENsqI8dAOvl68vjlVDQO8G9dI89kYq2vfy
         U7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCX6VBZpczlQR77hyW6OKWxEICkHgqgemIt3vBYHy8E4M5EQ/8AfbRBFmYMiD4Gdw1povBR8dLubiE9RibHi@vger.kernel.org
X-Gm-Message-State: AOJu0YwvC/zm7Ay9o3g+J+Ddw6Slz3K+/1GGoMmyrkQS0WmhguO5bQMi
	j34bKEGWraqv8sDKPTVZSJX3Ei4EWLX88gKczu6gEgCvT8tGui+1tJhiWCpxErBPUDn6vzN3855
	w+fV21OSSF1C4N6qmPpXOafj9HnA1UOdJIVVyQ3L16MXgthwN5Qf1ncqUoY32oBQ9iXuk
X-Gm-Gg: ATEYQzwZ0UJuENqPh/8pCPdqJZ0asKLazSfrXZp1rkjnqMAJNkODngqSLaPblCyL4RR
	f7jky9SY6sTtEqX/dqGH58+QwZXs5ISLHm+BkGg7Tduv/Zh/A9xG4HMBKh/dWRqj/miBF87nwe8
	MWyDgX3ORQekjJ810TTccuFsz5nU0+nZLcVaGBxlbEdrkBXTeffzZf+ZMPk1TdXNlcZPRC00tjv
	eeHZY2oyomjjtnDhe/lzwf/bbN4+V22QGLofkZV+Lzi5cqXH2Jho/nCeFw8PMcddvwCvhDH+/Pm
	uFURlqkc2JCsQPFGbe+sxV+Z/+MNWbV26NEnne0ZKO8I8kWORibLF6+JRsj6/2Qze3hn8fKdyKK
	spKNTUFwE9EkLtHCt4YTl2pIBzUnH6qKtqMoNP1tD364vr0VG8eikWw==
X-Received: by 2002:a05:6a21:1f89:b0:38b:d9b0:e943 with SMTP id adf61e73a8af0-3982e1fe150mr2227275637.38.1772638173491;
        Wed, 04 Mar 2026 07:29:33 -0800 (PST)
X-Received: by 2002:a05:6a21:1f89:b0:38b:d9b0:e943 with SMTP id adf61e73a8af0-3982e1fe150mr2227236637.38.1772638172953;
        Wed, 04 Mar 2026 07:29:32 -0800 (PST)
Received: from [10.204.101.56] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa61a19bsm17288234a12.9.2026.03.04.07.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:29:32 -0800 (PST)
Message-ID: <22b3e2e9-b855-487e-868f-e72fcbbb22cd@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 20:59:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] media: iris: add helper to select context bank
 device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
 <20260227-kaanapali-iris-v2-5-850043ac3933@oss.qualcomm.com>
 <bi3i37ho3ppzlgdx264ohxpcem3nwumjelzckf4x5uzdj5rt7a@2y2jrilmfimj>
 <1dc86b00-9a18-482c-94b1-96692c1dd530@oss.qualcomm.com>
 <jgygscmwovezkytizhh54cmmu5etgv23bgopfqrql3qj7zlhxh@adxo2b7izlrc>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <jgygscmwovezkytizhh54cmmu5etgv23bgopfqrql3qj7zlhxh@adxo2b7izlrc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hv_v0i9U58QIJQkRsCcfQpvuWIqU1rW3
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a84fde cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aBrO_zpjTiySyTrMC9oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEyNiBTYWx0ZWRfX5mqYJH9we0Ak
 1OSGAS7ei7EkiD3ae5BHl/Xu7kFV5vhrprOBDhYpzyJzKG845K9fJK0+gR2THXhMCn3+4mtSRWl
 XwdBxkKACLE745bPegKZP/Ai0LYTISemtG7BcGcw/2VSAoXV6Hdl7O8WE7SAwNyVqxLdqY7P+7m
 NtdsofR0KZ83XkVEmNXomWP37HnlQw23xIBu85leRru+j0z3wKNPrR6MCqAcyPpvR3lPczjNhuV
 kOSED32xsaW8NKUrGyhGvrXXGZWh1xKOjhI1pt7YAoWWFbFqyOPYq0jdxexF6e/kVZUI0UEPYoL
 5sQq8zgfqOfYsK0vzzW32Xlg5fG0heuuBtjLR2LbFjE0W3jqF9cax0ekl/iN2+k9oDNKxaRjMcY
 Wk3yYqYDKyNdHlhwMA6q28vH970UCfIvgI3JKWnxq3JDCvOFZJG3CbOFqp+kynXIaro3X6IKvHZ
 5E1ARRiLpRtjldKkVqg==
X-Proofpoint-GUID: hv_v0i9U58QIJQkRsCcfQpvuWIqU1rW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040126
X-Rspamd-Queue-Id: 14D45202E85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95364-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/4/2026 3:57 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 04, 2026 at 12:46:27AM +0530, Vikash Garodia wrote:
>>
>>
>> On 2/28/2026 1:57 AM, Dmitry Baryshkov wrote:
>>> On Fri, Feb 27, 2026 at 07:41:21PM +0530, Vikash Garodia wrote:
>>>> Depending on the buffer type (input, output, internal and interface
>>>> queues), associated context bank is selected, if available. Fallback to
>>>> parent device for backward compatibility.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    drivers/media/platform/qcom/iris/iris_buffer.c    |  7 +--
>>>>    drivers/media/platform/qcom/iris/iris_buffer.h    |  2 +
>>>>    drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++---
>>>>    drivers/media/platform/qcom/iris/iris_resources.c | 60 +++++++++++++++++++++++
>>>>    drivers/media/platform/qcom/iris/iris_resources.h |  2 +
>>>>    drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +-
>>>>    6 files changed, 79 insertions(+), 12 deletions(-)
>>>>
>>>> @@ -177,3 +178,62 @@ int iris_create_child_device_and_map(struct iris_core *core, struct iris_context
>>>>    	return 0;
>>>>    }
>>>> +
>>>> +static enum iris_buffer_region iris_get_region(struct iris_inst *inst,
>>>> +					       enum iris_buffer_type buffer_type)
>>>> +{
>>>> +	switch (buffer_type) {
>>>> +	case BUF_INPUT:
>>>> +		if (inst && inst->domain == ENCODER)
>>>
>>> Can inst be NULL here?
>>
>> during queues init/deinit, instances are not created.
> 
> Is this function being called during queues init?

yes, via iris_get_cb_dev()

> 
>>
>>>
>>>> +			return IRIS_PIXEL_REGION;
>>>> +		else if (inst && inst->domain == DECODER)
>>>> +			return IRIS_BITSTREAM_REGION;
>>>
>>> Are there any other possibilities than encoder and decoder?
>>
>> will simplify it as
>>
>> if (inst) {
>>      if (inst->domain == ENCODER)
>>          return IRIS_PIXEL_REGION;
>>      else
>>          return IRIS_BITSTREAM_REGION;
>> }
>>>
>>>> +		break;
>>>> +	case BUF_OUTPUT:
>>>> +		if (inst && inst->domain == ENCODER)
>>>> +			return IRIS_BITSTREAM_REGION;
>>>> +		else if (inst && inst->domain == DECODER)
>>>> +			return IRIS_PIXEL_REGION;
>>>> +		break;
>>>> +	case BUF_BIN:
>>>> +		return IRIS_BITSTREAM_REGION;
>>>> +	case BUF_DPB:
>>>> +	case BUF_PARTIAL:
>>>> +	case BUF_SCRATCH_2:
>>>> +	case BUF_VPSS:
>>>> +		return IRIS_PIXEL_REGION;
>>>> +	case BUF_ARP:
>>>> +	case BUF_COMV:
>>>> +	case BUF_HFI_QUEUE:
>>>> +	case BUF_LINE:
>>>> +	case BUF_NON_COMV:
>>>> +	case BUF_PERSIST:
>>>> +		return IRIS_NON_PIXEL_REGION;
>>>> +	default:
>>>> +		return 0;
>>>
>>> dev_err(dev, "unsupported buffer type %x\n", buffer_type)
>>> return -EINVAL;
>>
>> these are bit fields, returning -EINVAL would still match some bits and can
>> make the logic as true. 0 can be defined as IRIS_UNKNOWN_REGION
> 
> Yes, sounds good.
> 
>>
>>>
>>>> +	}
>>>> +
>>>> +	return 0;
>>>
>>> Drop
>>>
>>
>> Ack
>>
>>>> +}
>>>> +
>>>> +struct device *iris_get_cb_dev(struct iris_core *core, struct iris_inst *inst,
>>>> +			       enum iris_buffer_type buffer_type)
>>>> +{
>>>> +	enum iris_buffer_region region;
>>>> +	struct device *dev = NULL;
>>>> +	int i;
>>>> +
>>>> +	region = iris_get_region(inst, buffer_type);
>>>> +
>>>> +	for (i = 0; i < core->iris_platform_data->cb_data_size; i++) {
>>>> +		if (core->iris_platform_data->cb_data[i].region & region) {
>>>> +			dev = core->iris_platform_data->cb_data[i].dev;
>>>> +			break;
>>>> +		}
>>>
>>> You really seem to overcomplicate things. Replace array search with the
>>> indexed array access. Much easier and much better.
>>>
>>> enum iris_buffer_region {
>>> 	IRIS_PIXEL_REGION,
>>> 	IRIS_BITSTREAM_REGION,
>>> 	IRIS_NON_PIXEL_REGION,
>>> 	// add more when necessary
>>> 	IRIS_NUM_REGIONS,
>>> };
>>>
>>> struct iris_core {
>>> 	struct iris_cb_device cb_devices[IRIS_NUM_REGIONS];
>>> };
>>>
>>> region = iris_get_region(inst, buffer_type);
>>> dev = core->cb_devices[region];
>>
>> all the regions may/may not be present in all SOC
> 
> You can check for dev != NULL afterwards.

with one CB to multiple region mapping, this logic would not work.

Regards,
Vikash

> 
> 



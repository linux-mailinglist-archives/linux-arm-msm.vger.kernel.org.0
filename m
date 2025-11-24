Return-Path: <linux-arm-msm+bounces-83048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C77ACC802FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651363A179A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5435275861;
	Mon, 24 Nov 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWFwesto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiF4nIiC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F45231827
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983310; cv=none; b=VymD1JkQ77KVy4HJzwSQWRaQMHIMQKm00rnp7vFMphKJMbfVyfCBGGQ0a8zqFv42Z9jCejiliyeqMeYeVtFRM5HcgPoxwdULGC/m2RH1KmrBt6t/s5NGa/zzwVXAEBUNks9g4f00hpJOyjy0SvgZmTXyG6NfE3LqaFpi2jN6Cm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983310; c=relaxed/simple;
	bh=gQs+222eMVj9nYkaMRMWaIUTUfexp5t5WAolf3B5E5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffUe+gT3s7RnMhuxiwALqX5CNGFCOU7l4EOpCNy1tRK/l9vpru1DXSMDZvdEo7XdSMkhlDD4DBPEGOcXzG0zZEDm5/dhZJPH56yfg4a8mRM3ax5YkgtuW7SvMjEEWmBXqv9gOlc8Mt6wq+wn+BeLhfrBjjikxO8LdGAce28ZkAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWFwesto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiF4nIiC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8CWRH2471525
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6bin+0L7CF3HaoV3kbIK2uac7NeAV+pn+GH54MNEIYo=; b=PWFwestoL8SWAKT1
	rAFs9BYkwFp860gZDhbKAfI9euRnicAXIPwnIoL3TJOqMWwjJFsiiDKGB2PCejIp
	7KjeAjYTEOdvklRuQ0EHB1fchMMO+vIviL7ZPCn81ygM+Gy0gbpl282KgDKB8fHb
	IRHgqiAHHMNaL/V82+JNsJ95bfBfD06mBlNM0gbEf9AGYkD9bL95IlpVWViI7ICi
	EbXybcqqt2tanky/RSZIH5nH417P4z/snSk6c6ps2RnjMRImFLTKHIkF9Z898Ex1
	GIHSjzgBR+GriJADVI6hkFDorj0vxmsJo/3lvpYpCz/cGzavOwSUaEvXQRFhx/cN
	XYjiqQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdvrse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:21:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so8603137b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763983307; x=1764588107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bin+0L7CF3HaoV3kbIK2uac7NeAV+pn+GH54MNEIYo=;
        b=IiF4nIiCKj4DY+elAX9lNr+aGMfnBzAnzQRwHPjYZ0l4dzzsjw33ovvh+CXPMJSgUP
         YC4LB4eLzyopnuytgbQyS7fiPG9dmSwMyd4PxmBN8SQBR9NRD+KdS4NhuzLYa7nxUir+
         IyynsytpgmedG2YtAIL8I6ZcR1M6VpQUbn0kIHXxahQO/b0YX0dUaNXSpXIU52YND8m5
         ZVAKenYa/i6vjSHYSsmZv+5U+9QkBhz2XmtOgY67iZcm1otoD/93lL5UIuJhjbDzHs3D
         N3YLZdgiJvLkn4GOFkRAoh6TKnRFHxa3URL8FZpLuAdSv443DlLJw4aZzXmtGJyZd3b5
         H1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983307; x=1764588107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bin+0L7CF3HaoV3kbIK2uac7NeAV+pn+GH54MNEIYo=;
        b=GC9wWykMzGyg5BZPGOtzg+n10XKpUG1CFIDiUS/vl+kqLSlYQlwl6Q5GFEsJy1v5fI
         kkQDP39ALnanpKuWjgwKd83lu7mqWAhjnIPl6g7r8+6ZdF4fhaZierQbtfhYXKCz86vm
         7isQ6214sq4e7jJxQx1GiDVUohoZNo4hSTRShXsT4Q7FYyJZKyAQqtvATIEeJJOm/fhs
         XS7ffY/6WvDRDpOpLS2g+l5O8UfebFx4n/M82eofSk8MpKBlbL/ajJNYFBfQSVoc02I+
         DI8voEH2xlURy8q6emO8U+lohiiS/8nJJsuoUXDtJ6EYkJ8Z4A8WyzHn/lAX31SQWLkf
         thRA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Q1uRrpIjiXiwWlwU3BGjsiQEahBKUtbUAyc7UGre8Ud4kJu/E03IzS5fd3RbmHAuKYoO1IBuNyD98HUt@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyBM2kb9PkgCF7V4dDfxPSBXiTMgf2O5TaxKf9HvNulNUoWY6
	lQ5cF1SRtxQISm+ObS7o+gTr3hONhI5/cjqHlKwj2kPTSpv6UgKUpkfxYjumxte4/ElpdwQbvKE
	iJr7Yin+vzR/U7jRiFJmR6QS3fpayBnT2GM4qaVvzke9d0xMuthc/ObQeP6epo3lL2lLv
X-Gm-Gg: ASbGncspWQliCcrQP0B9FtvFn/glVdj9HsgJ2eLpoGzdawm23lQY7pxav1K9/saOooX
	sjD6Ki09ZPEpDrNMj8bzeKcaVwe4i7TG9aPvJ7Phmxuhvdz0pjepJ0ZxdhB7x96Q4d7IUS2z2NH
	au9s4juhiZUUvEudRk6yTkqWPVg8WzoYNJ+lOUGGNQQGDl4y/GuYTwSzhULM6h8UBv2/Vo+iqoG
	OyP2VrABG7O6ZK/UoKb+Y2PQ5+9UcGRzPUQbX1cHX3rz7ZKdwfXBS3LBftt4lNUqokqIA6SEUqm
	aefXD0ri6iNc2oGqz1IV8naPBYMU+uHF+gjmnevqajiljUWLDFEtlcgLCS92ucHJGc0VDrfpjyL
	b/ZZzSf1PG7/0s8wsBFBlr3oQXer91aaR+Un8oiGJOA==
X-Received: by 2002:a05:6a00:92a0:b0:77f:2f7c:b709 with SMTP id d2e1a72fcca58-7c58c2ac436mr9823440b3a.5.1763983306677;
        Mon, 24 Nov 2025 03:21:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI6FUzw8rJvZBGfiFMRkNdjCWWMjezt6fMoDb2nJqRnMg5JgkQGIvJ/5AFFb4vWoc6zexHRA==
X-Received: by 2002:a05:6a00:92a0:b0:77f:2f7c:b709 with SMTP id d2e1a72fcca58-7c58c2ac436mr9823419b3a.5.1763983306126;
        Mon, 24 Nov 2025 03:21:46 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed379558sm14207510b3a.25.2025.11.24.03.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:21:45 -0800 (PST)
Message-ID: <e0d039e8-8f65-4e2e-9b73-74036dc0bb8d@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 16:51:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Update dma_bits for CDSP support on
 Kaanapali SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-5-kumari.pallavi@oss.qualcomm.com>
 <3gld6djjzfwu6rj47tz6gdwdpmh3hjexce5y6crqjus7ourgxf@puxrcpvijitl>
 <2404a7a5-f4ac-4e62-b4b7-df0494d71150@oss.qualcomm.com>
 <3qgrwpi3vl3bumd2zxmjxvwgdewuwwsj3fymljkf2etjedleup@xsrnpuuv66ax>
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <3qgrwpi3vl3bumd2zxmjxvwgdewuwwsj3fymljkf2etjedleup@xsrnpuuv66ax>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=69243fcb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wEDb39IA6nWfzNvmODoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: e2uaeQDTJ9_gCjK-hZpn5c-PTMhbL4V-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMSBTYWx0ZWRfXxkbEABskaVaQ
 7mA0CEITlggRSWdv2/7He4bCJktPyaANIZa5AckYBAiX7OMzD0y1k1O4L1GRSEbmd2eSM6FJvxK
 0UFWOwKgDPaHiYhI1EnQZh/tPIiWbkyjONbvfe5jau4KW8U7WD5pHsrIUpvv2QLAYTPI2qE13g+
 dYo9b+9g7v3SxwZfkJAM7tY95XpIxUg39Ji6MdlhMcDZahPPSSL4UfiQb26IQnbDUIKfkZmZ/j5
 XLJBNFNIiJTsyk7FCEEo6+Yn3BbFnlE/HR48oyrLAqsyHn6Ps26ptuncO0kDL4M35tAcyZVKJ6O
 iAWeCPu7xfdE8NlWvOVZFjNFU0d879WI4vzMWzttYuBV6fGKO9Un8Va+qNxY3ZaEsFDVGhqByrr
 CPv+03YfOoE+sMUfPPpq6PP+SCQxkQ==
X-Proofpoint-GUID: e2uaeQDTJ9_gCjK-hZpn5c-PTMhbL4V-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240101



On 11/18/2025 10:27 PM, Bjorn Andersson wrote:
> On Mon, Nov 17, 2025 at 02:42:23PM +0530, Kumari Pallavi wrote:
>>
>>
>> On 11/14/2025 9:30 PM, Bjorn Andersson wrote:
>>> On Fri, Nov 14, 2025 at 02:11:42PM +0530, Kumari Pallavi wrote:
>>>> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
>>>> both Q6 and user DMA (uDMA) access. This is being upgraded to
>>>> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
>>>> Kaanapali SoC, which expands the DMA addressable range.
>>>> Update DMA bits configuration in the driver to support CDSP on
>>>> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
>>>> it to 34-bit based on CDSP and OF matching on the fastrpc node.
>>>>
>>>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>>>> ---
>>>>    drivers/misc/fastrpc.c | 15 +++++++++++++--
>>>>    1 file changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>>> index bcf3c7f8d3e9..2eb8d37cd9b4 100644
>>>> --- a/drivers/misc/fastrpc.c
>>>> +++ b/drivers/misc/fastrpc.c
>>>> @@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
>>>>    struct fastrpc_soc_data {
>>>>    	u32 sid_pos;
>>>> +	u32 cdsp_dma_bits;
>>>> +	u32 dsp_default_dma_bits;
>>>>    };
>>>>    struct fastrpc_channel_ctx {
>>>> @@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>>>    	int i, sessions = 0;
>>>>    	unsigned long flags;
>>>>    	int rc;
>>>> +	u32 dma_bits;
>>>>    	cctx = dev_get_drvdata(dev->parent);
>>>>    	if (!cctx)
>>>> @@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>>>    		spin_unlock_irqrestore(&cctx->lock, flags);
>>>>    		return -ENOSPC;
>>>>    	}
>>>> +	dma_bits = cctx->soc_data->dsp_default_dma_bits;
>>>>    	sess = &cctx->session[cctx->sesscount++];
>>>>    	sess->used = false;
>>>>    	sess->valid = true;
>>>>    	sess->dev = dev;
>>>>    	dev_set_drvdata(dev, sess);
>>>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>>>> +		dma_bits = cctx->soc_data->cdsp_dma_bits;
>>>> +
>>>>    	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>>>    		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>>> @@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>>>    		}
>>>>    	}
>>>>    	spin_unlock_irqrestore(&cctx->lock, flags);
>>>> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
>>>> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>>>    	if (rc) {
>>>> -		dev_err(dev, "32-bit DMA enable failed\n");
>>>> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>>>>    		return rc;
>>>>    	}
>>>> @@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>>>    static const struct fastrpc_soc_data kaanapali_soc_data = {
>>>>    	.sid_pos = 56,
>>>> +	.cdsp_dma_bits = 34,
>>>> +	.dsp_default_dma_bits = 32,
>>>>    };
>>>>    static const struct fastrpc_soc_data default_soc_data = {
>>>>    	.sid_pos = 32,
>>>> +	.cdsp_dma_bits = 32,
>>>> +	.dsp_default_dma_bits = 32,
>>>
>>> So, "dsp_default_dma_bits" specified "what is the dma_mask for the
>>> non-CDSP fastrpc instances"? I don't find "dsp_default" to naturally
>>> mean "not the cdsp".
>>>
>>>
>>> Wouldn't it be better to introduce two different compatibles, one being
>>> the "qcom,kaanapali-fastrpc" and one being the
>>> "qcom,kaanapali-cdsp-fastrpc" and then use that to select things here?
>>>
>>
>> Thank you for the suggestion. In this case, sid_pos is common across all
>> DSP domains on kaanapali Soc. Splitting into two compatibles would lead to
>> duplication of these shared property in the DT schema and driver logic.
>> The only difference here is the DMA address width for CDSP (34-bit) versus
>> other DSPs (32-bit).
>>
>> To address the concern about naming, I can provide:
>>
>> dma_bits_cdsp → clearly indicates this applies to the CDSP domain.
>> dma_bits_non_cdsp (or dma_bits_other_dsp) → for ADSP and other DSP domains.
>> Please let me know if this aligns with your suggestion ?
>>
> 
> This naming is much better.
> 
> I'm not entirely sure about the compatibility part though. The Kaanapali
> CSDP and Kaanapali ADSP doesn't have the same DMA address width, so are
> they then compatible/the same?
> 
> The fact that the two compatibles would refer to something with the same
> sid_pos isn't a concern to me. De-duplicating a single constant at the
> expense of more complicated logic, that is a concern however.
> 

It might be a good idea to replace the domain-based naming with 
functional naming. Currently, CDSP supports an extended DMA address 
width of 34 bits due to specific use cases, but this could change in the 
future for other DSPs as well.
Using names like "dma_addr_bits_extended" and "dma_addr_bits_default" 
would keep the design flexible and independent of domain.

>>>
>>> PS. You store "dma_bits" just for the sake of turning it into a
>>> dma_mask, just store the DMA_BIT_MASK() directly here instead.
>>>
>>
>> The current approach of assigning a value to cdsp_dma_mask allows for
>> adaptable logging behavior, making it easier to trace.
>>
> 
> I presume you mean it allows you to do "%u-bit DMA enable failed"?
> 

Yes, now I can directly use the dma_bits otherwise I have to extract the
dma_bits from DMA_BIT_MASK() just for logging.


> There are only two options here (32 and 34), and the only reason why
> it's not directly obvious which case you're looking at is because you're
> "dynamically" deriving that number from something else.
> 
> Regards,
> Bjorn
> 
>>
>>> Regards,
>>> Bjorn
>>>
>>>>    };
>>>>    static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>>> -- 
>>>> 2.34.1
>>>>
>>>>
>>
>> Thanks,
>> Pallavi

Thanks
Pallavi


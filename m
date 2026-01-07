Return-Path: <linux-arm-msm+bounces-87839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E37E0CFD288
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAB6C3012940
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5FE3019D6;
	Wed,  7 Jan 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3B06h3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2XZHh1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894363009DE
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781618; cv=none; b=bsHqrETwA3A794Zn2Hlvljl6WkPwyj19n4jWMbT2JePCW0dtBEnYt5lZGAHhEc70WywtJ7KKT9CBmLDw7j2EYNljpOd5DJeOC8fAe45zqakWycS6SekioD6Wiffu0xxU2UI0pBn/79aFD1YzzgRhVCAOwWEd++SUUREGDPNEu2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781618; c=relaxed/simple;
	bh=kCkyO7ZW9t+qcbk65u5Flb7txWs1td1WoAG30xCd4BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyGum+C2NDHhC+/7SuYHiJYJ5bCMUntqSQe4SC0R1Iw2RfEfyQwALrMWAYLHISSs26M/lpAdoPwY2LXIzYKxtdAobLs+vt57x47nI8pINuqCIndgXWI/QBxf2aJK/qEiFJbwOTp0fzHkNkoCE2o+61sP81iKEsziiv2at8jZrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3B06h3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2XZHh1p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q4cj218381
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUdwhvEuKw8923YOv3Z4Z8UpmCvZRzAuTlyICRNQGSU=; b=j3B06h3TV5GMMdRG
	xOEF1wtUAPnYU/5bSziir0tdEV8z1FPy6YpWx8eNDHoDi6vgelq8Z7T6DAXKuc8+
	lhrGCPbpsJaWchAS+AQ0TRTkhl9b3XxFIpgEkc0QLAE+NV3q25z4e7UyIp21yVeh
	rd1sSh9+M2VsFfEsEsL84icuL8oHYoJJxbEOGfuR+B5pbgehuhg+eQNvD8uwfLLw
	Qzb9PWbdJSg1XJzoaA+JfbrH8kWwwZpq2cMPE3FzeQUu9Hj8w1T/oVvwSyiyrChB
	9i0otZXQRz2PkXOhtfnhV+9m4TFBJ0oFnpOGm0thraoazKtlIQXb8Vr9aARm7D4O
	XSL2OQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn8083pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:26:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso4589836b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781615; x=1768386415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUdwhvEuKw8923YOv3Z4Z8UpmCvZRzAuTlyICRNQGSU=;
        b=W2XZHh1pHi28eq+6FglyOVxS3zvK2ojiKV77WkjXPAqL9WPzQ6dG3vT7EiF2Bm5JpX
         jqi15sOf0Dtfgq57dZhbWQ78yGG6CjQj09DHEH3yiHo6BJr6OsUbXlvDJASLhDWBoX5x
         twShroHb+7EHgsRwgh8CZMsk+l0zGo6QmrMG22a2GoXamZReLSSaId2Ki/52X2hUu/G5
         Je/KmF3co6CGDhXjt1lMmbvBsUtAaaotufB0JSEhTXQVmGR6Fyn2BUFKj0RW/NeBzcnf
         ciGjpdmkSMthd3uZw593T8k5+Zd5ZTRNrCAqcozxyywOcdTNA7sxWUbs52WQzCRCkex6
         IQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781615; x=1768386415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUdwhvEuKw8923YOv3Z4Z8UpmCvZRzAuTlyICRNQGSU=;
        b=AJtvHWXvZQZ2l5ZGGfjJcuIwQ681N9fGhe4A7Er79NYFvkt/U6BazNbtUMDZKAkWru
         EYtrm8b8puJgq5hYXDbG2S7dWasX7I4fqnJznB2jZwTTsuEYTpAX5oej32j8DMV04u6v
         B1fpRvCgIiD6+8bF7o0CjjtKwO7LhyzS0JqC9AaFGRoySULcCezsJodRgt80XP9iexTV
         A/3cz+urNqSXz5T3gNyeglMiMdBZr3pDxfjQAkRY+JVqJqRWXUFBZy1Y0mmBtRG/Mou6
         iycMZN5VI6y0o3YEHVusgaSiosFSJCu7tlQQNmYmJMuwpozHCUFT6kDA3a7r140AK/rm
         gobg==
X-Forwarded-Encrypted: i=1; AJvYcCWReesP12fcFHpWJfJ/4/J9eV4ipdfygbDqUCi6oeVC7C+lI3YXSGydbGzXMVqsmTp0IHhAMh70GcofQqOw@vger.kernel.org
X-Gm-Message-State: AOJu0YwPRBHAaY15OFeC5AjIHhz3lpldb8a++cgeQ5vUiaJ8q7y7UbKb
	maQpGIyaqIsj7I+rp4JXzHJLqCVyAvex3PnI97WMhLMe68MXFnbuBps14jCW/wJXDH6+rmmBO7c
	EE79GrvtoZoPvEesxX0A6zqgvF1e2jY3awmDbnrhM4PpRqvGgQQ/z20iEuxGK6wkDjGWw
X-Gm-Gg: AY/fxX4oLEKe05jCXlcea3Cx0JgU965T1p+vWjVRC1OWeWbXGaNxqfXL9M6jB3eyYXN
	AU/378fCYUICdiLJddH1sxF8PWnd6OgGXCgmGCYTV9wOGVAQS3OqVUrW0ZT8wOZq3nEiXuHZcrr
	Tr/3uOqrVJVv7mocpUAD49w557UQv+7FeESleurKmKcDMaN6zDch27aLx//wxyFUg8S1oAMHAVF
	wykoaclqZkSItNuUCV9Y+5i33nmhte06KEFBhq1M4SmpnG3GNMgWmBsqmmsoHYFOfHBVvT1Z85p
	3l4KtuyAncR+puLj93/nwwFkEwQWIz4MA6d2l/KOPlSqTqVK2IaEiHPKFteBNeOuwywQUeCBrPF
	BRGnPwXMhyz9Hz0ALnTBLe+UCcKPnbqp3JMAUvbr0pw==
X-Received: by 2002:a05:6a00:300a:b0:81b:23ac:6986 with SMTP id d2e1a72fcca58-81b7fcc7c8amr2112837b3a.49.1767781614963;
        Wed, 07 Jan 2026 02:26:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHpF4MeWQ9U4cwi7ICO6lAUI8vZB2PUCcqI1qsE1NPEMnksXVEJvE4gZcpvlriuftxL+9MPg==
X-Received: by 2002:a05:6a00:300a:b0:81b:23ac:6986 with SMTP id d2e1a72fcca58-81b7fcc7c8amr2112816b3a.49.1767781614472;
        Wed, 07 Jan 2026 02:26:54 -0800 (PST)
Received: from [10.206.101.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5edd921sm4583028b3a.69.2026.01.07.02.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:26:53 -0800 (PST)
Message-ID: <213aca21-a337-4a98-b634-b2e5f76bd9c2@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 15:56:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] media: iris: Add buffer to list only after
 successful allocation
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251229-iris-fixes-v2-0-6dce2063d782@oss.qualcomm.com>
 <20251229-iris-fixes-v2-1-6dce2063d782@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20251229-iris-fixes-v2-1-6dce2063d782@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e34ef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Ir1fGBQ6tmwodNh8ZXAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: Df2XbbTpVngIGvRCHbm3DusSH2hxbzvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfX5YavAC+HsqSz
 P7QRdR2wAClXZZGAUEY2wX6jJ4ISsRq9E0+khQc1rmxfUVFn128yFwzULHIS5ihrgNTLW/cdmQ0
 Pl5IpLCMHlYy6bcongb0ZTx6tyQA++MVoW2PAVzrPjvkYthg6L2+hxti0ReGvrOIFw0i9KhyIFb
 3Y1Ic5FvCFyq5E0VoTNGCXRF0vXqjx5yPDuiGJW5Yyw7leomaBtklfQvIvc8QM+qNrJf74tMgSj
 g/tA5z9iifKiMKbydCov0NG+iS97G89B2PPg79qd0z0UAdCOpMMAkIEaEGDwxtl8xLMD8tcDcu6
 dAAtjjcxAnR5FslbILRyuh3ocFwjmI/dp5GMTLPcyflm1zsf9WTURpFW7vq03Ge369inPkCe5Xj
 wbGQLj3DAKQqPuKM7s60WiU8w7Ka78y97R0IjTdHBsrvPzdwGl0MijxgqCJ85g1vkFpW8aSih9m
 /Ew/xKLk8mZ6yWrJ+Nw==
X-Proofpoint-ORIG-GUID: Df2XbbTpVngIGvRCHbm3DusSH2hxbzvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070085


On 12/29/2025 12:01 PM, Dikshita Agarwal wrote:
> Move `list_add_tail()` to after `dma_alloc_attrs()` succeeds when creating
> internal buffers. Previously, the buffer was enqueued in `buffers->list`
> before the DMA allocation. If the allocation failed, the function returned
> `-ENOMEM` while leaving a partially initialized buffer in the list, which
> could lead to inconsistent state and potential leaks.
> 
> By adding the buffer to the list only after `dma_alloc_attrs()` succeeds,
> we ensure the list contains only valid, fully initialized buffers.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index b89b1ee06cce151e7c04a80956380d154643c116..f1f003a787bf22db6f048c9e682ba8ed2f39bc21 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -351,12 +351,15 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
>   	buffer->index = index;
>   	buffer->buffer_size = buffers->size;
>   	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
> -	list_add_tail(&buffer->list, &buffers->list);
>   
>   	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
>   					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
> -	if (!buffer->kvaddr)
> +	if (!buffer->kvaddr) {
> +		kfree(buffer);
>   		return -ENOMEM;
> +	}
> +
> +	list_add_tail(&buffer->list, &buffers->list);
>   
>   	return 0;
>   }
> 

Reviewed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>


Return-Path: <linux-arm-msm+bounces-82065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC00C631F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 10:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52F9735DAC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2482327E060;
	Mon, 17 Nov 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsqwPPKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHRM7zDc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0B51F3FED
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370755; cv=none; b=GXtp07dtsPzTWFYyTdIQyrqvHMVG8VyujWm9AXS7MpPek0NlIkedN70vVLV90xm2lDCXbu9GuRFX41DQVx6x2UuxYvBgh1JPYkXl8z3ZbYpyAMuzuzR1TLmKZHEvnK4Id020WRdu+XV3K/bKOGTIDJLYZFJ2IDBRbyiOkQ2tr9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370755; c=relaxed/simple;
	bh=L7w39IN9tVWZwpXP/1ubhaMcx7zoDEWdSRkb2tusq0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1nQbZvN3RVbKyPXceH0d6VOsS3LhZp3W0TvUq4gMdv3RQzM/c0NF2jB+kPgkLbG196iZx++KGCNHHIL8LM4rYxdhrRas1A8yfLp9DbLuW4oZ6whZlrH9OetRyKgatzqrw9nIo5A3Y9ndYvrWRGSK0ATeIJziZXiQWVq5MC153Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsqwPPKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHRM7zDc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nt3f3318399
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TS1l4z4FCSnPq1fx1zTnWoNNXIfyztzlqt9YbRe5R/g=; b=HsqwPPKtmRF/VDbk
	eZiHDz8paG6eBM4SV8dOMNbMydwYt71sCGCC/jk9BVQpLx0mphHSyinmKV3VHSjL
	Fu89u9fM2YB4pE9l+NUPabD4f/y0A5iiuk9Qqohbus+D1Xm0RWeuoXGIem8Z0Q2l
	vR0MiOX5CO3JCeT8NybMYM0BLoMkmOCLmg0sQXPJ6I7XbBogh0DnB7egXOGu//Z5
	X9PGEa1tdcib4jKlJhDwOOoHYrS3vYLs1izwsAYEPLJEqYkFwaPZ7dOKQRHKncFo
	rY5KBCoAkzMXP2D+AuejGjAelVPHNjIhK8V23zXQeu3JLawLbOK5fzo34EMSV+Pe
	Yw7cnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejm5c2b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:12:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so5145678b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 01:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763370751; x=1763975551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TS1l4z4FCSnPq1fx1zTnWoNNXIfyztzlqt9YbRe5R/g=;
        b=QHRM7zDcY4cwXi6hj08WlWfs8MN5jCe6fWMIKo1QPnRbsvu3P7rIyPULhgx5BxjxT+
         9JXNeMadItRc0WrWRzdw8rOgH4wgcQkrE+q626z21huzyu0HpIYhxeBRR7NfLweBEi3D
         4xfuR/q92pEK7ttNMYtHgEofMubGg6NGvwoHdwiFQJu+YwF94XwHnmLlh+1Il3tIhN79
         In7+0Bgg/Kt6WUcUtVXmPVXM41WdfcQ2CnYLNVgNgtgZqe1dR1JgRgICu80oXc3rhoYi
         IUp0pVhX6f7sgZJeGVBNHicpe2MsV3U2FOAugcgS9cLZz+QEVPVm0hoG9i5AhQJzmOdE
         s/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370751; x=1763975551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS1l4z4FCSnPq1fx1zTnWoNNXIfyztzlqt9YbRe5R/g=;
        b=ONCJMRynweZl7gwhNfrUUEJ1q2MA4FKT0NcK1CChgWrb/CyLZIMUcLazBmDbrz9B5a
         3LdDnoAUGX2Wx10sc2pOkqWBU4kwaIVhLl2LYdS6ES3s2tslS4PHBpc/YLl+IC2rJ83w
         Qs3diiLT3HWD2u8h6u6+hg3HTD9F/mDy+jtGyuiY32Disw1+Sko9uqhpRgvR5oqr6uMh
         Pm5IuWtPbbnaDbX/arPl0PobJXMNgv0Wo+fehSPOfmNYf1OoZ2B4ODED6r9AwgiAzVmO
         BGtgC9SCz9qIaCSXj7JR3QV7ug4o/BaicPnLm0q6h0kC15Ebkz7f4CENNbL2IGMzs7Lk
         tKog==
X-Forwarded-Encrypted: i=1; AJvYcCX49VCVBDqsfxXST51IfLzaU8muIwFRzFXLgIyt7RHXoG1TUrZEia9nxe/E4KG+bgqv3BbgxTfP0Vygg3v3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr5jdg3YDFX0m35oT9MPmwOSYyCYDCWmSMsTyOfz3SNbF1YMpG
	6WYBc7uL8RSiGhCTNItidZXDA8g2F/k7+hBQO5gdTu3mnvLIEzsoC7tdfZ2SS5hS6/N7RaeyOxb
	OqLiB1QjypgJDJ9RafwCxHi3vkXfU6lUE46OAmv2u5T2t+vj+D0YYAuvQAa2OIAAl5Uw+fQUQfK
	H0
X-Gm-Gg: ASbGncsjDrhXfFihTiTPEnOHeXJeq4zUuD87SoB8ASW3TwM3o5UqoBa8vk7hbbw1NLU
	9C++0t8uG3inIuUQum9TiqjTdPc85I08bniZPi1rq+kYAPVVH4Jrd0D5PIse+v1/o3ycJAfu89w
	s0u7IzJSLHyOFbGFLyDzaUWuewFi5QvZ5wGkT/Zzh9sZEmrBfThzlpmHH0zajj3UCJXEW9jJ8oc
	n1rJOZX3w2dRSSMO0fbkvLn3CQH9vnY+0ZCjkbclFCGLlHqBwmqCATghzNNgDtDLy55q/J3llZo
	MP9TFgBNbZqpWDjcbkBxXWii2yPWzTnxXIwr3HjjZvqwF3lWtiT5UNZTbmVwyP2pWR7whp5SPtf
	CR9cz6WrFivYWtZA/GXW6qjSBxM9vCFY=
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ba3ca62f1cmr15229545b3a.31.1763370750994;
        Mon, 17 Nov 2025 01:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPhAbe67a4qq0g0SmTJWSl/SMH4NtB4XKNSGQjREqxyGkcUL/E/ZWvL7YwRbphuALEA6/cXw==
X-Received: by 2002:a05:6a00:cc9:b0:7aa:d7dd:b7dc with SMTP id d2e1a72fcca58-7ba3ca62f1cmr15229504b3a.31.1763370750432;
        Mon, 17 Nov 2025 01:12:30 -0800 (PST)
Received: from [10.204.86.112] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92782d39bsm12517242b3a.63.2025.11.17.01.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:12:29 -0800 (PST)
Message-ID: <2404a7a5-f4ac-4e62-b4b7-df0494d71150@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:42:23 +0530
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
Content-Language: en-US
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
In-Reply-To: <3gld6djjzfwu6rj47tz6gdwdpmh3hjexce5y6crqjus7ourgxf@puxrcpvijitl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA3NyBTYWx0ZWRfX1oEHjov8DepS
 /QLSF02KT2xaPOXGE+0pzrVorOJM2upTATWLwV/5Za0Dch6A8TMusVcXnShcoe8i3ffVETI+3Qr
 YCYyThv+iB2eDJLBz0WGAnCDmeiVaHa72DSCx3N0h1W8klnGgrqQsVhWt3TNx7J/QsgWSTFMXdw
 kBN5onbfB7Hhtulknpvft0OspK1nETsJUborIIh3wkuuJ7r2SBoQDL/bddnpfWNEEgUOVfJi3YW
 v6c6K5UqF1e8LtNTLgB+FhwZnxZToq7XTfMkXirevq4qiC3FII6++ido3j58FNyC3KI3aaHy1WF
 hsWrSDFNwPRwmcLocnXQ4j8RxJ9I7hOQDkUeF5MhdvWooScXhkfAJ7sjql2G+r7RBEC/qCPoKoX
 /JX4UrlyTsoqfP7pKtddXTXT4d02CA==
X-Proofpoint-GUID: xz2VjNoXRMmfN4zMqfInly12oden8Lu8
X-Proofpoint-ORIG-GUID: xz2VjNoXRMmfN4zMqfInly12oden8Lu8
X-Authority-Analysis: v=2.4 cv=Pb7yRyhd c=1 sm=1 tr=0 ts=691ae700 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IvGWEb95ivA0J32o5h0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170077



On 11/14/2025 9:30 PM, Bjorn Andersson wrote:
> On Fri, Nov 14, 2025 at 02:11:42PM +0530, Kumari Pallavi wrote:
>> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
>> both Q6 and user DMA (uDMA) access. This is being upgraded to
>> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
>> Kaanapali SoC, which expands the DMA addressable range.
>> Update DMA bits configuration in the driver to support CDSP on
>> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
>> it to 34-bit based on CDSP and OF matching on the fastrpc node.
>>
>> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index bcf3c7f8d3e9..2eb8d37cd9b4 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
>>   
>>   struct fastrpc_soc_data {
>>   	u32 sid_pos;
>> +	u32 cdsp_dma_bits;
>> +	u32 dsp_default_dma_bits;
>>   };
>>   
>>   struct fastrpc_channel_ctx {
>> @@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   	int i, sessions = 0;
>>   	unsigned long flags;
>>   	int rc;
>> +	u32 dma_bits;
>>   
>>   	cctx = dev_get_drvdata(dev->parent);
>>   	if (!cctx)
>> @@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		spin_unlock_irqrestore(&cctx->lock, flags);
>>   		return -ENOSPC;
>>   	}
>> +	dma_bits = cctx->soc_data->dsp_default_dma_bits;
>>   	sess = &cctx->session[cctx->sesscount++];
>>   	sess->used = false;
>>   	sess->valid = true;
>>   	sess->dev = dev;
>>   	dev_set_drvdata(dev, sess);
>>   
>> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
>> +		dma_bits = cctx->soc_data->cdsp_dma_bits;
>> +
>>   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>   
>> @@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   	spin_unlock_irqrestore(&cctx->lock, flags);
>> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
>> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>   	if (rc) {
>> -		dev_err(dev, "32-bit DMA enable failed\n");
>> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>>   		return rc;
>>   	}
>>   
>> @@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
>>   
>>   static const struct fastrpc_soc_data kaanapali_soc_data = {
>>   	.sid_pos = 56,
>> +	.cdsp_dma_bits = 34,
>> +	.dsp_default_dma_bits = 32,
>>   };
>>   
>>   static const struct fastrpc_soc_data default_soc_data = {
>>   	.sid_pos = 32,
>> +	.cdsp_dma_bits = 32,
>> +	.dsp_default_dma_bits = 32,
> 
> So, "dsp_default_dma_bits" specified "what is the dma_mask for the
> non-CDSP fastrpc instances"? I don't find "dsp_default" to naturally
> mean "not the cdsp".
> 
> 
> Wouldn't it be better to introduce two different compatibles, one being
> the "qcom,kaanapali-fastrpc" and one being the
> "qcom,kaanapali-cdsp-fastrpc" and then use that to select things here?
> 

Thank you for the suggestion. In this case, sid_pos is common across all
DSP domains on kaanapali Soc. Splitting into two compatibles would lead 
to duplication of these shared property in the DT schema and driver logic.
The only difference here is the DMA address width for CDSP (34-bit) 
versus other DSPs (32-bit).

To address the concern about naming, I can provide:

dma_bits_cdsp → clearly indicates this applies to the CDSP domain.
dma_bits_non_cdsp (or dma_bits_other_dsp) → for ADSP and other DSP domains.
Please let me know if this aligns with your suggestion ?

> 
> PS. You store "dma_bits" just for the sake of turning it into a
> dma_mask, just store the DMA_BIT_MASK() directly here instead.
> 

The current approach of assigning a value to cdsp_dma_mask allows for 
adaptable logging behavior, making it easier to trace.


> Regards,
> Bjorn
> 
>>   };
>>   
>>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>> -- 
>> 2.34.1
>>
>>

Thanks,
Pallavi


Return-Path: <linux-arm-msm+bounces-91193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QE4uOZSAe2mQFAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:45:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E517B199E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 16:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 741CF300E726
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 15:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FE0242D60;
	Thu, 29 Jan 2026 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PibzQ4CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a9SbKDPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85FF1A9F93
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701520; cv=none; b=OTwMhmNStTpdSRNwpvEC6aPnNisy9rlKMk0GfcqIpzb5rqpYgB7Shw/s2nbyGCjhE400qjdjy5Ldg9x7H1qiMxOK/D+gnHWfuATZ6MR2YzP2csmw2H+rj+wMRz5Lf7z8T3W+gNtNJNwWPVZX28eO1LZj2bLzV+/OiN2ljb5qK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701520; c=relaxed/simple;
	bh=0ygmEQM+uXYQUqBj7JsWwXJ7b7Kzre4X9O7SloOWm4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtt2K/4uL0NaiJcwwgPJveT/HMNNqDBkbe3PoFctRVcEWPELKVcFHYQfX+5bm9ShkLnnTKxMpQRFoUFIy7bhsEBuJ8TQ3i7mgmkwOoGj9sCzl1f+rRG4KOE5JQNKQ/4B3j3xrGulmzI4nntYjt+WVkKT43AF28JMoe9oTcbJwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PibzQ4CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9SbKDPp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9qVMn2150627
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvLiGYJjsQay7+umkOjbbZzrGr1HQQCSJ8GYCT4p4Yo=; b=PibzQ4CJCCEXO47n
	Mj3vgIX15EAe4ca2hCochgvknJja6DjMgTL9+UDwDXLOTFMNAA5BuoiimOHj1WCt
	niTHuISWVvDcfiB96eUnEpxBN6pDjRNecefdZhoMW43tXHlv78MKyi9hMedvQHfd
	285QCGgdIYFQ3RikjhibkKn4ao7y33sIn8vifddsm0lIquBX5v4LaUXW6NfOeVMt
	TdBcxtrHTUT+RwOsSEsmkn2nwusZXONHu6TVctffeZ30ecKA3stXVfwBSycvc97P
	Lt6MjUrT6s4dJmHYVXqbkEIpGM4JccQtwYcn154cg99DS/1jM3/RJyZ8vUhrqlGB
	n35HQA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byph3c250-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:45:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c337cde7e40so688794a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 07:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769701518; x=1770306318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvLiGYJjsQay7+umkOjbbZzrGr1HQQCSJ8GYCT4p4Yo=;
        b=a9SbKDPpyd0g3AZ7AJo/IbBUVxK3FXkGeLCCYHbS9sWsy3ZNaxiZaDc/wIcb/XxORP
         amhf8x8inOceLoDdt0PgqtadZINABkimk+bLzyNZCBUBcMpQImkgzLIbkRjqilSMXyJL
         NZBkSd8SICdt1NzWYlJZiHics8sCndBozUnxr1uvjl1QC7Vo1TSwvj6c3oYaskCubPl+
         0PqCFh/bq73dAHwvbS81rrBcpVfSCFLUH3t9aqlu338ISWflJlOIj6EAejFngvangFnY
         dqDdL4yAU+fZs432tU7sCXd8auFevxUSkCujUcr3TJEJ23WSIeF69QMdIAx5zkjIo2ds
         SJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769701518; x=1770306318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvLiGYJjsQay7+umkOjbbZzrGr1HQQCSJ8GYCT4p4Yo=;
        b=nAtcgLfCW8Bycdv7GFf5jHBJsJjrmdlEoGKMyoaSN8doDJqo7m8Hq9SeWPhQ5GtZfl
         Z7axDY3XWHOpw6dAIHnSZmrfJ4kIq/NaB23sVQ3QdGYHArTUATfv9nGhoqt1Nos6Mf5E
         gipAOGa6PJQU/f0PLuK0BDNF/aa4miBtUkz47q8Hx6yo7xG5PCUylhDG3KPNDEQS685q
         n8g7NfUM8x/P/4oBeL3uw2ZpTNoz6bi7DxiE44f5EZZDl1qwFD7SMMSuQioRn2xo+SbO
         9HqAeyFRa5ck//h0bhdSfBbJmH41BWl7+NWJ8Mv8VbvQjFdVJ5gEApvI7WHh3g4mRQD3
         AvRw==
X-Forwarded-Encrypted: i=1; AJvYcCUmQMzbsFs44+PFU8F6ERNrOSkl2qr+5p7IVGzfc4RVnhq9tp06lsOs/nNPD0Pqlao9YwEhR4dDnCvDkuis@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4f3YAlthli8yZYYW+bVY1o18iu6rnt9DPZzOwnGEdcK+1u5pG
	pAYo3voEVU68pMXHbRQclDS7qdjI/ZH+8NnbGZ91Mg3YHe7KFjJTWaXBIcesgt2wOkIlAGkr71a
	wrC4+Ugsaj6kF4mDd3D9CYeKnr0oi+MUk1nyfe9mjqPOt2DsbBDP5Vr5VdMeL6+hvkYYIcx4qYW
	kc
X-Gm-Gg: AZuq6aIuLoDAT3DciEgLAC1XS6hH7mfwOZFBGSy/+zIjKkiohPNUIEvF/fqkTfGCwqa
	Pc6uWcofzEenfiJAPnGs3b5OIwz36vA4U/UbvLLnzvf/qEt5vt3WO4lVkgtPbj6MjmlXWAMJGlU
	7ph2mgBCs+lQxT43SdvuVR9WKlRSViq5xex0aie3fTOIHmW7MWSGi/Ur6NUkShFEdQWQK4FqhMa
	Pn61N0uGgs7huTK0MR9QNpt3illyceBggrNLH/PzMHr+erpiYm0Hqad5qPA8oC2GKSaqzF8TO8J
	sEViCqJnGffIG9IKrfShcZz4//2vVX7f7YLhg5n+NCpP2wu/+oYbxtnghCEzOjyMwUBomQnvbWi
	Y1WwogWynKCjU6Ul6GTDOev81EuN2Sf5W33Tjlxx0SA==
X-Received: by 2002:a05:6a20:9151:b0:34f:241f:aa1e with SMTP id adf61e73a8af0-38ec62e4127mr8136275637.31.1769701517400;
        Thu, 29 Jan 2026 07:45:17 -0800 (PST)
X-Received: by 2002:a05:6a20:9151:b0:34f:241f:aa1e with SMTP id adf61e73a8af0-38ec62e4127mr8136248637.31.1769701516673;
        Thu, 29 Jan 2026 07:45:16 -0800 (PST)
Received: from [192.168.1.2] ([49.204.110.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642add55adsm5038069a12.32.2026.01.29.07.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 07:45:16 -0800 (PST)
Message-ID: <57cb30cf-2da6-4df9-954d-953955969b02@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 21:15:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] spi: geni-qcom: Improve target mode allocation by
 using proper allocation functions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260122151008.2149252-1-praveen.talari@oss.qualcomm.com>
 <20260122151008.2149252-2-praveen.talari@oss.qualcomm.com>
 <847290c3-d5aa-45cf-a75b-ff119b608433@oss.qualcomm.com>
 <bece7d32-5f62-4ed8-8dd1-0de9102648cb@oss.qualcomm.com>
 <d9fc3b0c-7fe7-4845-b55d-ce6d0053f48d@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <d9fc3b0c-7fe7-4845-b55d-ce6d0053f48d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z93h3XRA c=1 sm=1 tr=0 ts=697b808e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=hmzEZbfuJy6/QR5cQt8XuQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Wb7jJ4ESybac-VDgsCgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 7diUStgvhe4K9YghYthBO8-e9p4mWjQF
X-Proofpoint-GUID: 7diUStgvhe4K9YghYthBO8-e9p4mWjQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEwOSBTYWx0ZWRfX0ABOo5jT4CQ9
 Dt2se1s3sQO12xGY7ra+3ciHN083Pm0l0By6ohKdHdrVSiW678EeEKdyNuOabXte9N+w6+8cIzr
 S2amIXi3IwjYSqtSSPgTzmGLjHAtOaHkduih4zeZ1WRQtCCUSujP/PuvbfUS+pySDxp/LA9jP70
 tKS+4kjLDFxri9ymyeQ7ZBw5PUF41VaimhX1yfeMGPxVRQ/SSyHLsyV7s839+HNwtaYBhheApUM
 vizM+tFt3U8UltI7n15QyW4b4SZsyUg8O+SzxbrVIrzJf6Mzu7pZ3tl49PbEPKvKTSoexERzIFL
 GN1+4u/skjDa7fWD6w3x00/DLmL3zW86EKrb4WlpOsDC+2oLwot+H4gGrQVW4HqUWG+X/GUV2c4
 IlYUvZCiq4crAFMrKZOI/9Vyf2sBTPwBZeKtkUSSNwPwr7fP1Ka/Bq4e4f1Ft7JIKUb0hpoZkTy
 Q/nXYkLmivtHW+2q2EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91193-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E517B199E
X-Rspamd-Action: no action

Hi Konrad,

On 1/29/2026 5:12 PM, Konrad Dybcio wrote:
> On 1/28/26 5:32 PM, Praveen Talari wrote:
>> Hi Konrad
>>
>> On 1/27/2026 6:45 PM, Konrad Dybcio wrote:
>>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>>> The current implementation always allocates a host controller and sets the
>>>> target flag later when the "spi-slave" device tree property is present.
>>>> This approach is suboptimal as it doesn't utilize the dedicated allocation
>>>> functions designed for target mode.
>>>>
>>>> Use devm_spi_alloc_target() when "spi-slave" device tree property is
>>>> present, otherwise use devm_spi_alloc_host(). This replaces the previous
>>>> approach of always allocating a host controller and setting target flag
>>>> later.
>>>>
>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>> ---
>>>>    drivers/spi/spi-geni-qcom.c | 15 ++++++++-------
>>>>    1 file changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>>> index 0e5fd9df1a8f..f5d05025b196 100644
>>>> --- a/drivers/spi/spi-geni-qcom.c
>>>> +++ b/drivers/spi/spi-geni-qcom.c
>>>> @@ -1017,6 +1017,14 @@ static int spi_geni_probe(struct platform_device *pdev)
>>>>        struct clk *clk;
>>>>        struct device *dev = &pdev->dev;
>>>>    +    if (device_property_read_bool(dev, "spi-slave"))
>>>> +        spi = devm_spi_alloc_target(dev, sizeof(*mas));
>>>> +    else
>>>> +        spi = devm_spi_alloc_host(dev, sizeof(*mas));
>>>> +
>>>> +    if (!spi)
>>>> +        return -ENOMEM;
>>>> +
>>>>        irq = platform_get_irq(pdev, 0);
>>>>        if (irq < 0)
>>>>            return irq;
>>>> @@ -1033,10 +1041,6 @@ static int spi_geni_probe(struct platform_device *pdev)
>>>>        if (IS_ERR(clk))
>>>>            return PTR_ERR(clk);
>>>>    -    spi = devm_spi_alloc_host(dev, sizeof(*mas));
>>>> -    if (!spi)
>>>> -        return -ENOMEM;
>>>
>>> Is there a reason you're moving this code to the top of the function?
>>
>> When CONFIG_SPI_SLAVE is disabled, the call returns NULL; therefore, I placed this check at the start of the probe() function.
>>
>> ref:
>> static inline struct spi_controller *devm_spi_alloc_target(struct device *dev, unsigned int size)
>> {
>>      if (!IS_ENABLED(CONFIG_SPI_SLAVE))
>>          return NULL;
>>
>>      return __devm_spi_alloc_controller(dev, size, true);
>> }
> 
> That doesn't really matter since spi is not accessed beforehand
> and it'd return a NULL if it failed to allocate either way
I agree. I had also reviewed other SPI drivers as a reference for this 
implementation.

Do you want me to keep the change where earlier the host allocation was 
present, or is the current modification acceptable?

Please help on this.

Thanks,
Praveen
> 
> I'm not sure this is a concern nowadays with fw_devlink and
> friends, but today the allocation happens after we get a clock
> reference, which could throw an eprobe_defer, which I think would
> cause the memory to be de-allocated again, wasting cycles
> 
> Konrad



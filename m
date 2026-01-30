Return-Path: <linux-arm-msm+bounces-91287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGhQJ3qVfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:26:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06443BA0EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70332300CC1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A96242D6C;
	Fri, 30 Jan 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aG74lj8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idWDXjZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B552FB983
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772170; cv=none; b=ilrVavBtMbqfdkfy4ZLMf7qsIHOnYpytP853PZT6iiBahpWaYjsy8aDcv2jV5TJay6fXRSySBQxTVbmatsors/9N+Oq/j4eDwELu1QTnknlplWPiv6vntgRZfSpQURyrtwQHaJJA8UiGWzsja86O+mWYiDK4XT2M4UvsU1ZSJhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772170; c=relaxed/simple;
	bh=dVjadyquaKeik+5XqUpXlDz1A5y0JMoA9NMOSF7QWGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDnclE2I62ccYfuyJ3fWqxD+MH3lbEt2VmUQ2NIbgT+heRMSOBcMOzvoDtnP580A2l/ciSTi2Q68hcDg//BRELVEovA3H/Mtyg1HpsW03mHnXWFGmJmcmfJOIard8/GobwLQePiUjcTRY+r8E7F/vVAli+w6BucyZYar3D3s6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aG74lj8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idWDXjZv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAHatR1022754
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q2Pmi2PxduAkYx18ZQxB/YX4MWuCY7zbCFQhTQcTLeI=; b=aG74lj8tZWyRJQ6r
	NXobRax75yiwrtGA64xgv01k7CoP9CKBIG7x1wOWGC+Mea73DMGqDE7c/HgrX7A3
	fjsrAW0SenF/F/DbXVvls5xZMvg3DR3wQ/xRwC4+Cs4qwo6UvolYw1Oiu6Ze3F6z
	XFbK60uSskLJNq1q3qHBBna7A7Dao+y/dQiEuRzi/nQo37lEfSRq5F5QerFechqy
	Kaa3w8UvBMNCnbKGu0QURP7SJUC+bUgDFouPfzyt5mrobmTGEEGECyJKqy7LvcqC
	tiM9CJYobk2Ryni80qIJcyFtx1Bhxh8JQXxi35AF82d9r3HFg8UsC7JzrTsiK5vN
	OUKEgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3kac4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:22:48 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946586903dso1821296d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769772168; x=1770376968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q2Pmi2PxduAkYx18ZQxB/YX4MWuCY7zbCFQhTQcTLeI=;
        b=idWDXjZvE6KkJtYNytgCWEgVkDquZV9BwksT/muPjijcDtM1eAArh7UGNl8gtQHeuU
         mEAa1r/LvrYeLVOIE49FsBhMIXiaIUrtkpJglsribsZ+sPs5R900yBHq+sh9jOF344EN
         X6q+WJwAAr05t2dnHYm6PZOHzRpcXiEL3PZWkyKedoNec7QjRkNGxbpAnzfAoEIQQGkO
         sVtRVk08QWiA5SVMpyZgi1kHBX+6sqOfwl6ZNtt7MtjYcwbpIRYyqrUaWBnZEyPXwPiD
         eMQOkTfOSeQhC+i0TuLkbaqOcYZB3s2XggPuAUrvbFobL0OoZIS1I5dEVPF1wDDUOVLI
         FuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769772168; x=1770376968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2Pmi2PxduAkYx18ZQxB/YX4MWuCY7zbCFQhTQcTLeI=;
        b=VVVz1Kymo1MbIqR8NQbOlZoBX7fK9rFdQfgRj/MmnhAp0WuQ9xjAoagwxAX+kcjmuM
         XbZI+D+hHTjcmKxiARfO73oWDZzaHBHexsvhj0kFlAise3AwNlE8gPepEJ5/Yz1z1CyY
         I1GY1f4TKOfpfbu96u9gmlUw5B0ZvAeVlPh/CU5Nlcn6ugJC6Ek4Q2RMzgLWCTMOn9i4
         aQLuEtEwH9QatzFTW4LkoSz8aJp/q2OtaihQ0hDHDx9/mqAZrPty7mWJ5S7Ew4BqhCdF
         2c3X4AS36JLpwbwCBy8JTHCPXqKsyg8iHvgUwoxjk6uPGnSYLiBbP8qZxWEzWVm9Nvpp
         cOdg==
X-Forwarded-Encrypted: i=1; AJvYcCU2G/81FdMlzEXftD13hK7q/upf0oGpoEjLBWg58Fw/Z0qzptEVhJahGPh00FZLdmSTw8FTgMUjD2zYYo4W@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOQnbrusHMoUGn6y+qfzuhpPcEWidPFfkgLvCoyEDU0ZTVAV9
	Lla78Ft4VDyj+Cq7AN7/w0fk5m4HkSd5hZ5dny+DoJmY8noDLQL6p3uxZ6tJ2Dpx0mvP6CP+ICX
	GFF3Kr9RF/UfHIoWWP4RkXEGZCBf0oftDzS3gAImDmAlH0Jde5gpzdakBOGEJ07BhH8t7
X-Gm-Gg: AZuq6aKj4lE0XX2DL9VUQouvySF9EdisUzAmgrX2LGZnW5RFiNysDvMqU4mHus0lKux
	SeLeq23wefZWBi670HuSYKbjDkqS8z45dxTyB5JdoBXNELyg9AFV5kWlnfAJTWmirmcpGfIlDN5
	7zfDj3AQ0CVxdRGRIA8WTbm8FI7a3jOdMqgQr/e9E/kW+6x9Tay/WfL04PklI+bOThIDeXmoum1
	9yWMfDUZDC+rAM+8v4zpAvq1kthbw4FefKv+rF7/9c50FsgoWm6BJVm2I1brIUKCnpdnMZ9k1Uj
	M1CzuB+9K4kKej2gsnbTP5PyuFs2dxtE+ghhRmMXMg+G94HRoNf0XQlW+Bvh17LZrQMhBN9jITP
	uzyOZimFswMtNqC8ZglB/BXmt4ecNsaC9QTcjD05/WO5eskPI4Gh6CxXcTl/iQqWOrcY=
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr199456485a.4.1769772167767;
        Fri, 30 Jan 2026 03:22:47 -0800 (PST)
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr199454985a.4.1769772167343;
        Fri, 30 Jan 2026 03:22:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8de46abf6fsm226693366b.52.2026.01.30.03.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:22:46 -0800 (PST)
Message-ID: <32eb6d3c-835f-44cd-9852-96ddc8661113@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:22:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] spi: geni-qcom: Improve target mode allocation by
 using proper allocation functions
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
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
 <57cb30cf-2da6-4df9-954d-953955969b02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <57cb30cf-2da6-4df9-954d-953955969b02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697c9488 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DI4xcUXyGD7WBy4uMMEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: KHp2YjUA1Z_V9ktrrgImZ1j6gWNbbitJ
X-Proofpoint-ORIG-GUID: KHp2YjUA1Z_V9ktrrgImZ1j6gWNbbitJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5MiBTYWx0ZWRfXwPvd9rQxFQR+
 h24iFFMMncJSJGgSiHx/bnqzYtO9xKC7fw5lmA/lQUSuEh5ORCp65j7KC/vP6XnMcj2K8MbiTSZ
 eWEB37J9eojvv+l0SmHabpv02buxglvXjQIY1adQo0AHRZfT9RKpzIFGJDdS1EDxsY0WBt94XAY
 bXlG168J1skJPRRoXJIgE5a8QNTIvajqzOsK5Tkdtuxrhs+ixfRz5wnrT60Up8aM6nfAC3TUGMh
 HeHHcjg7YKnZBkfKOqIc8grc4MoemG2eT6kT6KL2xjwWLIF4/b5jFtKMmgkB+ipWOcJHNsEj2oP
 j/anAWMRUIpDYL7K7R9p9e/aMMYuHXPQx+6aOjeypEAeQ/8nlhqjhfRvOh5N5MgMbjRd7Tzoert
 g284S95BUiw2vxKd9B/YuZLMOoh648EQrViizxkiFaOj9zV98AtBJaxRdz0Jb0/qBmxUTrIGtZ/
 2T+EeTJecayWYe1dj0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91287-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06443BA0EB
X-Rspamd-Action: no action

On 1/29/26 4:45 PM, Praveen Talari wrote:
> Hi Konrad,
> 
> On 1/29/2026 5:12 PM, Konrad Dybcio wrote:
>> On 1/28/26 5:32 PM, Praveen Talari wrote:
>>> Hi Konrad
>>>
>>> On 1/27/2026 6:45 PM, Konrad Dybcio wrote:
>>>> On 1/22/26 4:10 PM, Praveen Talari wrote:
>>>>> The current implementation always allocates a host controller and sets the
>>>>> target flag later when the "spi-slave" device tree property is present.
>>>>> This approach is suboptimal as it doesn't utilize the dedicated allocation
>>>>> functions designed for target mode.
>>>>>
>>>>> Use devm_spi_alloc_target() when "spi-slave" device tree property is
>>>>> present, otherwise use devm_spi_alloc_host(). This replaces the previous
>>>>> approach of always allocating a host controller and setting target flag
>>>>> later.
>>>>>
>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/spi/spi-geni-qcom.c | 15 ++++++++-------
>>>>>    1 file changed, 8 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
>>>>> index 0e5fd9df1a8f..f5d05025b196 100644
>>>>> --- a/drivers/spi/spi-geni-qcom.c
>>>>> +++ b/drivers/spi/spi-geni-qcom.c
>>>>> @@ -1017,6 +1017,14 @@ static int spi_geni_probe(struct platform_device *pdev)
>>>>>        struct clk *clk;
>>>>>        struct device *dev = &pdev->dev;
>>>>>    +    if (device_property_read_bool(dev, "spi-slave"))
>>>>> +        spi = devm_spi_alloc_target(dev, sizeof(*mas));
>>>>> +    else
>>>>> +        spi = devm_spi_alloc_host(dev, sizeof(*mas));
>>>>> +
>>>>> +    if (!spi)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>>        irq = platform_get_irq(pdev, 0);
>>>>>        if (irq < 0)
>>>>>            return irq;
>>>>> @@ -1033,10 +1041,6 @@ static int spi_geni_probe(struct platform_device *pdev)
>>>>>        if (IS_ERR(clk))
>>>>>            return PTR_ERR(clk);
>>>>>    -    spi = devm_spi_alloc_host(dev, sizeof(*mas));
>>>>> -    if (!spi)
>>>>> -        return -ENOMEM;
>>>>
>>>> Is there a reason you're moving this code to the top of the function?
>>>
>>> When CONFIG_SPI_SLAVE is disabled, the call returns NULL; therefore, I placed this check at the start of the probe() function.
>>>
>>> ref:
>>> static inline struct spi_controller *devm_spi_alloc_target(struct device *dev, unsigned int size)
>>> {
>>>      if (!IS_ENABLED(CONFIG_SPI_SLAVE))
>>>          return NULL;
>>>
>>>      return __devm_spi_alloc_controller(dev, size, true);
>>> }
>>
>> That doesn't really matter since spi is not accessed beforehand
>> and it'd return a NULL if it failed to allocate either way
> I agree. I had also reviewed other SPI drivers as a reference for this implementation.
> 
> Do you want me to keep the change where earlier the host allocation was present, or is the current modification acceptable?

Please move it back

Konrad



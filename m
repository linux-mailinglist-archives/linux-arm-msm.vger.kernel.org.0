Return-Path: <linux-arm-msm+bounces-88994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C92D1DD95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1A8E305CA30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3532138A2B6;
	Wed, 14 Jan 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRlFufa3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwJliYWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C3389E03
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385079; cv=none; b=W+q3swHmLnuy0V6EaXuTdTnnTlJJ3maqnXMTiaCjJCzjZvSJfW0WxNoBQfY+rYFcwt5s7hiWSWAdCSGQwz+GhPQFijfrezV3F5G/uzRzzYqmI7UICY35Iw8vXWVyftXLa/U9YHdvW5jKGJGyl0NAdWrdRMItNXSWg34uybDJH4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385079; c=relaxed/simple;
	bh=bk5+NHu/P6gafqqhb4aOu+UXDpyWuvNVnGbIOZ2XFnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xhc1N2AYc5Xcgz4rTdlZ82MlAlrQADOaEsbbM0mPCIIlmPTluuXcp8IDKZ9ghgCtW5PGO7O3/YR/CCB5hLEL7/cJZxT58EjLUgUmJZ0jTprlQRCCPSk/HCCG7ec41hhNEOD4vaKN4H/aEeJBwSk7lDqU8w8t+xd5uOpv3P84FBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRlFufa3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwJliYWE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E9I8g32552697
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwJOhAcoLnubcI+OpTANBa1Q6k/a05uNgL+zKTmJFTM=; b=nRlFufa38/C8KQB+
	t7XdLj/CP9XUzHX6kWnl2Rlc1rwX9KIJjikY9wM/5Q9iySLu2B4fkeoDvqn516oK
	uyod7fBAZCc0pYL9Y8MLdxf+/T0cG1b9rZClV0BFouqc1pjgowpokTlVjo5zqXUw
	Y1fjQRDlfBDN/RxQtxSL6x+icmC6Hr8WfrKHDm3Ymz1mhqD4qQZWf2V4rtaZsXAB
	TIX8MX7TcSdmk3/LcXDPpKdGIK1crmazxy22Fha9ntRaQT1xPYvkwIquWSlXrOcJ
	CiIA48AHc1QvRap1tDjZv5yL7dZmMsIpi/02o7vhIhh2VvgP3ketv7mM5NDUpx8M
	XC4/+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8d306k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:04:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so23666785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768385076; x=1768989876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwJOhAcoLnubcI+OpTANBa1Q6k/a05uNgL+zKTmJFTM=;
        b=dwJliYWEM9qwTmFj8UPlToeRDAesNCO+ZXHdrCtUre5f4ru8Q4gKXHH+JSdavV4RTe
         DhQBEzWS5O1y/+yh+6HYgyYH1gQzAcZDbGyuwnAKCFdWpu5SITmB7d6ZXA/mRr/SlXTL
         BNb8OtWKUwK3NgpTrr8Q0ZXREknbXGqvK8nnzhMTeLSNje93Om40eS3vtHKAJC/1w8Bv
         BhgWEFMO8UdqDpEPYNg+QEyK4BO9fXkxvnpz8oI+cXZpRHpdYUaZygw5+SZVE+80P8uo
         Zq7TRDdB48gr2+dKJRJCxSdIQwY89/EwUqbsA31uEvk4zpA7V5vLQj0iLyXswjlLJ+aZ
         EzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385076; x=1768989876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwJOhAcoLnubcI+OpTANBa1Q6k/a05uNgL+zKTmJFTM=;
        b=ORBqvpXq0VxpdN86PICJGFppCa9tPKUT4klWXfBEzeRI3cgciPc+16dza+y59szODg
         7/IfXoCeWaezcPA3TQHFtn2hk6/YnUSUo0u4ibtYm3AG82FSNivxVHmcssxX31qAkJIU
         49UtcwuCSaPjhXVlWfmhksT7zFt8gSaSZckqngpMkUTQKm1M1eA4h1Zi+Ur1q+kSuPxu
         YKz7Khiy5qc4wPzZlND+99noiujc30DZsd243UY1V2DoIKd2brpHEzH687gdiPu12hux
         kVPEUbpqnVQ63AOBOQ+2t8CadvzISosnpyvCDWLJyEKwMvcZSBPopsrFzg/bg059grUC
         /bKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjcPd4aadjeviwNZ2hfWaUhDqALpiXj2ZZl9n2/w/NcxJYUONSyIWmSW3FbZFreW1quLegSb0OK4bub13R@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtnLbPzAH96HyVfxym8DA2QHwB7cwx1HFzPWLLV9APVeDKaRO
	sDv+2KZKXc1ccEcQe692tLgyk0OECcps7CeIUg0bAhECGR3qoSEQ1Pn0U8sacfwup5jUkpr9FP8
	JpMSFSx8brFvlCbEkWYBfdFF4oOBRE9+87MI4fRu3jRhocvn3f0W6q7O7N1D9nAgpljW4
X-Gm-Gg: AY/fxX4neiHeHfktGLlYMd5jdMWtwa/VrPxGnAllkH6hnqYyPoUqGDMb8N96z9XZ7NT
	aKM11Bh157hUjtu2jHvEwunqjUSk+b8loHt4FjD94bzJkt6Gubh0MYcOhht48O3v/JYJVkmu22W
	4UQAe3ewuqFEj0Xw++5n+S5Ss4ziYvVgm+54YDXs6/CZIL5bJ/0LPESnN4xm7QQgBpHMJKbBC2B
	kR1ywb10qiDPrrj2cyGD27iB4ytnbLGOvHhGK1seNPHZw0izVwNytlDtjMKhBtFTWQaizG1pDoG
	N52ovs7ATP6uPLrkg6nloAlUJfOpKyxceU59mVvgGJsFtcjrEQGT18YUCM0jSIR1y440Uo+O+4e
	lsyZsVxbGzS1vkdOosYR+9H5minTguX/dAyXOIyh0j0eVA39iM6JTm8oWMLZUhaSM4Zo=
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id af79cd13be357-8c52fb74bd4mr221986785a.5.1768385075599;
        Wed, 14 Jan 2026 02:04:35 -0800 (PST)
X-Received: by 2002:a05:620a:4411:b0:8b9:e0ea:af3b with SMTP id af79cd13be357-8c52fb74bd4mr221982985a.5.1768385075013;
        Wed, 14 Jan 2026 02:04:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b22c3absm22533208a12.0.2026.01.14.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 02:04:34 -0800 (PST)
Message-ID: <dd877ea8-b634-4cc9-8280-08663f82776d@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 11:04:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
        andy@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        srini@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        sre@kernel.org, sboyd@kernel.org, krzk@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_wcheng@quicinc.com,
        melody.olvera@oss.qualcomm.com, quic_nsekar@quicinc.com,
        ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
        luca.weiss@fairphone.com, mitltlatltl@gmail.com,
        krishna.kurapati@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
        kernel@collabora.com
References: <20260114083957.9945-1-angelogioacchino.delregno@collabora.com>
 <20260114083957.9945-6-angelogioacchino.delregno@collabora.com>
 <aWdaWY2tWUMllOHH@smile.fi.intel.com>
 <8bf79979-0946-4ed9-b8d4-c442a6e54833@collabora.com>
 <aWdbPze-f_2_5EbL@smile.fi.intel.com>
 <401c5e7b-ff33-44e8-98a5-8cc6af4f2a87@collabora.com>
 <aWdcy2ouQHtkPd6q@smile.fi.intel.com>
 <647b4acc-3310-4329-ac7a-77e86bab74a3@collabora.com>
 <aWdk-RP-59cJeCBo@smile.fi.intel.com>
 <ae46b504-58d3-4042-be05-f31e9e01091b@oss.qualcomm.com>
 <aWdn_j7SOKq97vpY@smile.fi.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aWdn_j7SOKq97vpY@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lG5WYhsptnqTV7hLl31u7wqeEihRA8Lq
X-Authority-Analysis: v=2.4 cv=fbWgCkQF c=1 sm=1 tr=0 ts=69676a34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=K6O-kMeRs0nb6JyVbzgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: lG5WYhsptnqTV7hLl31u7wqeEihRA8Lq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA4MiBTYWx0ZWRfXx/Ls/x4Y/W0G
 ah7GuhY6Rb5Eb5NHM6cHj+pbt3tVu8/ydQi3TO0tljaIeii1G5FRaSoWK9GHNc4Fd8G7947qk1h
 vujUivxpyZgoz1OloLXog5Hv+KgFxuUE+1lDRLqB85uD6Zn/Vo6rY/3M/7sijiTbP36fAKAE6tk
 tXdpHVVuSPndr0ogc79mQpf/Aj1g6b1H6nBXW03vB2mlZttso5RE1vEVMCh/UPCIwls7RfXsT5m
 Nh5XGxCmE2n0QkkIzOKpsN7cClGm+aP7xdv2Ld27yMYWmIy7SqcYofXYwfBcsDNFajiCnYtKbjS
 9sGa06pEJmYFKFQsT700oPzF1KD7UrAmoeAu0vEX+bKrKcahOKC9rEnkrmj+08Z2VmZ+M9L0lRI
 yoDAAP/II+lK0M1grdpvVUcdzqfQlQ4+Zxe0zGdMFMuddfLEC4fUqQCPqsrBpwALim3CI+LyRYl
 LFfa28/1lVFr16wLzcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140082

On 1/14/26 10:55 AM, Andy Shevchenko wrote:
> On Wed, Jan 14, 2026 at 10:47:20AM +0100, Konrad Dybcio wrote:
>> On 1/14/26 10:42 AM, Andy Shevchenko wrote:
>>> On Wed, Jan 14, 2026 at 10:09:45AM +0100, AngeloGioacchino Del Regno wrote:
>>>> Il 14/01/26 10:07, Andy Shevchenko ha scritto:
>>>>> On Wed, Jan 14, 2026 at 10:03:57AM +0100, AngeloGioacchino Del Regno wrote:
>>>>>> Il 14/01/26 10:00, Andy Shevchenko ha scritto:
>>>>>>> On Wed, Jan 14, 2026 at 09:59:40AM +0100, AngeloGioacchino Del Regno wrote:
>>>>>>>> Il 14/01/26 09:56, Andy Shevchenko ha scritto:
>>>>>>>>> On Wed, Jan 14, 2026 at 09:39:52AM +0100, AngeloGioacchino Del Regno wrote:
> 
> ...
> 
>>>>>>>>>> +	struct regmap_config sdam_regmap_config = {
>>>>>>>>>> +		.reg_bits = 16,
>>>>>>>>>> +		.val_bits = 8,
>>>>>>>>>
>>>>>>>>>> +		.max_register = 0x100,
>>>>>>>>>
>>>>>>>>> Are you sure? This might be a bad naming, but here max == the last accessible.
>>>>>>>>> I bet it has to be 0xff (but since the address is 16-bit it might be actually
>>>>>>>>> 257 registers, but sounds very weird).
>>>>>>>>
>>>>>>>> Yes, I'm sure.
>>>>>>>
>>>>>>> So, what is resided on address 0x100 ?
>>>>>>
>>>>>> I don't remember, this is research from around 5 months ago, when I've sent
>>>>>> the v1 of this.
>>>>>>
>>>>>> If you really want though, I can incorrectly set max_register to 0xff.
>>>>>
>>>>> Why incorrectly? Can you dig into the datasheet and check, please? We don't
>>>>> know what is the 0x100 address means.
>>>>
>>>> I don't have any datasheets for Qualcomm IPs.
>>>
>>> Hmm... Can we have somebody from QC to check on this?
>>> Perhaps Dmitry?
>>
>> 0xe6 is the last usable register today
> 
> Thanks for checking!
> 
>> But I wouldn't mind either 0xff or 0x100 because I don't want
>> anyone to pull their hair out if a regmap access is dropped some day..
> 
> There is actually about the exact window size where registers are belong to the
> same entity (subdevice). As in the HW world most of the things are stuck with
> power-of-two numbers, and taking into account the naming of the field, I do not
> believe one provides a 257 (256 + 1 = 2⁸ + 1) register _windows_ ("s" is also
> important here, as it points out to the pattern) for the subdevices. I bet the
> 0xff, i.e. 256, is the *correct* window from the HW perspective.

Right, [0x100n, 0x100n + 0xff] inclusive is the reserved register window
for all Qualcomm PMIC peripherals, so I guess 0xff is the correct choice
here

If a peripheral is more complex, it's split into a couple of these
same-sized blocks

Konrad


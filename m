Return-Path: <linux-arm-msm+bounces-87871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB2CFD858
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C62D3002FE8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B8C2FF66B;
	Wed,  7 Jan 2026 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si+0ImYK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6rRZVxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9D1DA23
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 11:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786926; cv=none; b=lCZclOCkIzzuE3KZWDrcwIllM6nZEIlbAKBX3IizIoD1g7PqtOiQKHZvdlSa7locfsza7Y/BH0tkc6OFP/g47VkrVIHA0Cfo+4vG91pQMSyaSJc/rshCdpJxxzjNcBaG22SZheweYvpV6Uuv1kg1jS6H6cYZtSK7AEyhnqrX3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786926; c=relaxed/simple;
	bh=Fopvwc7w9BB0jevnXrPpIL+CKkRGpI325s2ifEUzp6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UY5/M5ezrx26ch3J2Ycc70CzA2/wdlw1/GyXo8u/MJWmwzZadb9SGXSH4kaqbFEderDa4MihKUhnw2slRvW3JdKvewsd0UNrphS6EKcm8iWzWeJaXqkNxGvER8HkGdXdwtFX0xVZNBkmk9S9vQToHrcTjbYopw8tjNXQfr1Dovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si+0ImYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6rRZVxC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q9NM218515
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 11:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	susRMr79WHKVHnPXqdSUfc33ic31JftIkcqVqixFicE=; b=Si+0ImYKomU6yYoX
	e85/tagDTO+3d+gJOanbSFjmMQ9VQBLS18lvDbhmuFDSc9dE6XrTbsfiRiHwDGNI
	dNR9fb7WIL6D903fMBtJeZG8xEcNqO4cHwbfHK9YhMInwbJyFlSSCPrx3YBteZ5O
	8ML8lsKrkQ0EIshY6jtZxysVMGeARhTDGp9S8qbdqXz67QzGXdw6hvNEbvrV0SCz
	C7Up36cTSB0GOyYVo9Z7aSY9NL+W4NvHo4HW8w9spRvsyuJoy3z3+lJGCNrBxxqX
	QgHNPh5kijjs1tfgm6E3+DxXQruSukChJ47QUC2DACHOp93SARnPkGpS5PCI02jT
	ofhfRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn808bcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 11:55:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a26989018so3511606d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 03:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767786923; x=1768391723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=susRMr79WHKVHnPXqdSUfc33ic31JftIkcqVqixFicE=;
        b=C6rRZVxC01T9n3Ec7XNY9gKhMErrB74TlMZjGMR+xxoZC3fOSq76JS41SntDWF3mr6
         5Zq9YgxED4RCa8dpnG8eePjT8WWHWkLfB1e95zhkD2M159INxpcplJ8FsyAV9FuaBG7F
         LW8iRAQSAs6ebD4btBuDjCRuymgRBcOuZKA6k3yr0VKz4ZTYAhhh2hR/zIqvUQmqOCgW
         tyAJfXDVB0rvabsfMVTGOR8oIeaWLInucjdeidqzS8lLpCT/q211Y4+2K1mff9Uetio7
         JzMhCWZ9lsF6zJKkUhbQa/P812EilmjeYK8uFySfYpAM7Gv0sFkaw5gtDbOxYHSH2a0c
         dCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786923; x=1768391723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=susRMr79WHKVHnPXqdSUfc33ic31JftIkcqVqixFicE=;
        b=P9ia3D32Ld4qPN3cG/8nld96fcJb6ADOCToez5EN26HE/tzJI6zK3UDLLfqBLM2MNZ
         wbp5OI78r15NhNv5PAKwKQD42hrDSwWgrydgMiT2rye5A+lDN7FecGRPn51AEK+AZXqU
         +UlOuCRnPTX8B7/QemS1erVYcT9vdzZkBh4aicVHuKZ2wwz1ztDv/D377agafRIUUvGO
         ITNfOuR8pE6qgLuO23NOE4yxgcBMVAl9/p3AuuA+6M5tFUw/vEYYCIgW8X8mtlpCoWE9
         Z0EA9H03Mf2Ui41IMj9qe+Y8GlMtgoJywL8i4C53WStiPpPXEVc7UjzcDix3xZIHarld
         /Bvg==
X-Forwarded-Encrypted: i=1; AJvYcCX4VDTWQzjaQclY3p1faCkmY8OalOPLKArSE/5XjqX0PC8TOcS0HmHjxwVNcQolDPYAUuWFmpL1AmfF257Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzxN70+2K5VvSPIDRXGOh/3vpT2AvLVezhQnFuoSwccUTWSB7Re
	lP0sbWtjSPUtdSzC6LGFc3HfggIluP52e/haLxmQmpKvaRY0OgzGrT7efcjlp0/5XszuMGDXocq
	C/WnXS3drFU8qXGzA9rdXtdRVI1orA5aIhHZNJPcPveH5BvYvAXIxDYUPtq4g9OZN1wq6
X-Gm-Gg: AY/fxX7mPYH4a6pcWypnvduJuoQi+TUOZj+nRVN5TWF/DBceULn3jDom9VnImQYgoY3
	IOrQ3x+xItrmiY2YmFLlbYARQgz3tqfqCcBqlXHJ2ouB5AlZOvaG4LdxIaq7DENPZ0/cDPRmS2p
	jrdI4w66IKdW3ZplVPq+2RqGov2I5q4ukdhtpCetKnuKG2tM0MkN3xXmhtj9fy4VDGS7L+mUtqv
	mNfp8X5Xrl5CrV9xFEYzwhsXpbmP4+BIaZSgF5MNgIuK84hxmAInJqtPvtC8iq7adoE4oN3e6nG
	xOWFhsf2zOpjgTh04Q3oxVWo/vpmN08I0EMmR2Qbc0FdQAUvrptHEXIzVV0/UptDSAdiq/QJb87
	j4OODwjuoecxObOMNqLV3yKtsNYdSHRJHlB3XxSQMclBmYiYptpul9NzGc3TaXXwA3T4=
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr24507671cf.10.1767786922833;
        Wed, 07 Jan 2026 03:55:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoM/9C42EiYXPWbuGa8UgNRi6dYK1KbiP5jbsEf926zdaYdPxjX0zTqt5024dGz8tCTi7aOw==
X-Received: by 2002:ac8:5d4d:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4ffb4a3c298mr24507451cf.10.1767786922315;
        Wed, 07 Jan 2026 03:55:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe76sm478982766b.40.2026.01.07.03.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:55:21 -0800 (PST)
Message-ID: <0eaad490-13da-4378-bf5b-63611b681471@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 12:55:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: mr.nuke.me@gmail.com, andersson@kernel.org
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
 <5116928.iIbC2pHGDl@nukework.gtech>
 <4e21205e-0b09-496e-9d6f-9fe2c327c13a@oss.qualcomm.com>
 <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e49ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=SWP3IsI89bYa406iQT8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 0YsAQysUfLzm9oTRiXNh2wueH59hFTO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MyBTYWx0ZWRfX5wtrNrkHf4f1
 +qfAUrdeiBFMu25zJ5WXIC/Yi1RNVPXx/INAhKr2w7Xha9hgT0fu7RYRGk6E8b1qlzk7n5Bh21o
 Ms57IusGKvtizcGzSkKtNZBhu/1K2knWfnGGve/f7T8CNOkrnRKJCbspMRLbi5g/SV9PKzPD0vw
 Q72MCihiHTZ3Ss9Mj3+FGSKyi9jUlYKf1+wSPvK2Qjcwl4j16aLex7gZyAQ1MvOv0xWGmGE95U9
 xxLYafJ1sEVCXOL1Qyw0SRxa490tMIoA7wxFwlsSQQb7DtxwlEkYy6PcXS8c5BpVC02zczO576C
 QUHzfLi0YywlCR57r0I0S+DlpcyIpDQjAx6sZFS9nLW5pIew3WJAGsqHhAj09em+fULsffJ49lF
 gOxle1lavGIJqZ7jyuD1X1fAhndYxgNi2QwatV2V4RSSrlMJDNUxJNnjPNOuXiDMCIuUjj++qhU
 Zwdjg2Cj7gdM3e0Zplw==
X-Proofpoint-ORIG-GUID: 0YsAQysUfLzm9oTRiXNh2wueH59hFTO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070093

On 1/5/26 4:23 PM, mr.nuke.me@gmail.com wrote:
> 
> 
> On 12/29/25 6:37 AM, Konrad Dybcio wrote:
>> On 12/23/25 9:35 PM, Alex G. wrote:
>>> On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
>>>> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
>>>>> IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
>>>>> to the q6 firmware. The firmware releases from qcom provide both q6
>>>>> and m3 firmware for these SoCs. Support loading the m3 firmware image.
>>>>>
>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
>>>>> ---
>>
>> [...]
>>
>>>>> +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
>>>>> *fw_name)
>>>>> +{
>>>>> +    const struct firmware *extra_fw;
>>>>> +    int ret;
>>>>> +
>>>>> +    dev_info(wcss->dev, "loading additional firmware image %s\n",
>>> fw_name);
>>
>> Your email client is messing up the reply context - if it happens to
>> be Thunderbird, set:
>>
>> mailnews.wraplength = 0
>> mailnews.send_plaintext_flowed = false
>>
>> in the config
> 
> Oops.
>>>>
>>>> I don't think this log line is useful beyond development
>>>
>>> Remoteproc driver prints the main (q6) fimrware name, so I thought it would be
>>> prudent to print the names of any additional firmwares:
>>>
>>>      remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140
>>>
>>>>> +
>>>>> +    ret = request_firmware(&extra_fw, fw_name, wcss->dev);
>>>>> +    if (ret)
>>>>> +        return 0;
>>>>
>>>> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
>>>> is missing, particularly not to impose any new requirements on existing
>>>> setups". But you haven't spelt that out explicitly.
>>>
>>> I intended to not abort when aux firmware is missing. Maybe the better way to
>>> handle this is to check for "-ENOENT" in the caller instead of return 0 here.
>>>
>>>> You also haven't provided an explanation as to why the firmware should be
>>>> loaded. Is it necessary for some functionality? Is it that case on the
>>>> newly-supported IPQ9574?
>>>
>>> I don't have a good answer. I reasoned that since the qcom provides it [1],
>>> the M3 firmware would need to be loaded. I haven't done much testing without
>>> it.
>>
>> Well, could you please try?
>>
>> IIRC it was strictly necessary for ATH1xk-on-PCIe so I'm assuming it's going
>> to be a necessity here as well
> 
> I tried this without the M3 firmware, and I don't see a measurable difference in normal operation. I only tested AP mode briefly. How can I know for sure if the M3 firmware is needed or not?

Without knowing more, I would assume M3 means "a Cortex-M3-based [power]
management MCU" without which the thing wouldn't start up..

Konrad


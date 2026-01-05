Return-Path: <linux-arm-msm+bounces-87537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 468CECF520E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 19:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B58F0300A3D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 18:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E5F34404A;
	Mon,  5 Jan 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TN1IOeCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ro7Y1+4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B5341653
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 18:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636010; cv=none; b=tLDmntKtURoq4MGtNol7K84gaazPibAAbK6FrJeMbB/7o+Jk+tRYospzqhAXZzysC30dEvLbvIaVN6sGiF024GS+GTaLpoK3c2Z2N2j89uWJwRGR+vj8OS8LgCxoKDumsu7s8Gs5C605BAGs4m3AQyESMS5HEbKMkxvtzZOMGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636010; c=relaxed/simple;
	bh=5/19OY6eZY8CTI1TjSHvmJQ6WXrakW3nS1Hjc8j58LI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDcmWcdxSAojb4zaEaOpWcD1Yq7oKKsdqd4hpZWZIX7lnB3pOwmGZ+TowViXax7DA0rX7PBVF0ebcnlVNsAZHDiZN27REbRUZmHbD5K1Z79AxsimbtIpJlts0iR84Z0i2h7pRy6LYTUqEn3DWgy7ln7RPbsstPvNzCt3rUjZfCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TN1IOeCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ro7Y1+4j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605Fojch1617229
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 18:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZOJPN/yb0Ckwc+93wrH09JVZmpZlHivpeL60KoebF0=; b=TN1IOeCFX9A9463X
	tDJ5gw58saPQGS4s0wH/Ncwde2y4GhNdxoZDzfCVUm4XvhsA1QcPLG18AwKUV0WN
	tYCDdu7J7xQ7zaGgUBB801BZi8BRQUJhf+j2ISv0qItsWTEP/DnsghjjAngoir8d
	8jMWZ/l8vTdkDEOnI4uBqvA1MK/5DBoVRgMwkjdkW9I7LLaFAcM7a8h2vYcIiokt
	J0Pc2cID1nmzqJAphVofDou2UstvWOL4eFE28uP6rVqq+Cs1t8kwg+aLyi8EiR9L
	e7i1nBSylOpCuyefBsVJGH71QBzxtNdWatIrYCBZlJeKijpyrko1TZ6+L6ZpPzdi
	sAWmCA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgg9yrd72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 18:00:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab8aafd24so1341297a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 10:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767636006; x=1768240806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZOJPN/yb0Ckwc+93wrH09JVZmpZlHivpeL60KoebF0=;
        b=Ro7Y1+4jn8c3/c48v3SPdBr7+8jspK8Pu5fVe+C5Iox/kvDuBn5Pt92fXkE8ZKPxFV
         CJi6SKXpQ8qumSSXgqfVApr4Dc2Lpl99T5ebDrsY9hs+ZZP6DdcPRgqJPCkTmkxsDvHG
         9GPt0uTe8RWnsmTntGlFcYq9d2EgFtpEyBpE7/1WjmTF2v+21VGO93Lhav2hUDgbuaN2
         NeyM9vZxA5zo9sJy+ypgZF/XPxs8T5zjfRS/CSd633bzP4+arssn+GwyAjwPfB2aR7Hy
         oJncp48zat6KQ5Dgm/5PY4uMw3CmnhjtRQcMUB/lgARMPgo9udUN32tM62uXOB4ipk5v
         zGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636006; x=1768240806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZOJPN/yb0Ckwc+93wrH09JVZmpZlHivpeL60KoebF0=;
        b=LKmFQv6TNFPeOC10/skkii9YFeUkr/gPFD1osDnmzZmcySbJRmVvLkOq9z7n3QnO4Y
         FBpxEjVw4/hH8N01zK+wYA36iRS77RzxC6GjtWAb2DNWLM4PK/i8S139XBEx5GnB3j4o
         +3gDGLK0VGLPkjyH+8ske5YIRY4Do1PQwDCq3i8FSrS5jlFWxsBaLG//ku4Cglguxn7Q
         sHbwOyWC268pGOZu25+OYmV6eJapwJlP3QR72UfVYE3EOV7d79KFFmPgU0SeB4n8LR9M
         C9EyeuprnlhzNmd/hejbhw35/jQo1e02e5i1mv5CY042Wd7aegwyVU2DeL5bM7J9DDYG
         Dh8w==
X-Forwarded-Encrypted: i=1; AJvYcCV1FA/d/C27We9/LXO9c1VEkR1ZdHw4iNJbbDMyTY0K96mBfwWkV3QyrNZddGGBj+lxDCN02HPdMwl86OIb@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3dvZ/q+vXAyo7fp6U8BWnxyS/a5z8Fq9zatxA5+48U5vQIiF
	2OHO9TuTFe1+Sv/jw5YdCcrB5/SJu2oPNeIjLeVYCWLRLk66jlf7+QCXhYddWM2kRmCaa6Idf8N
	h1FrIEym88WCTj+qHCcDnh2T/fvQPnxd1lH+6kntr9TTjXUbo19fhGju9I+Nrjqgarn2d
X-Gm-Gg: AY/fxX6JNH601u29ftq69/mu218s/tlOlwDUsCuDqdpFDQeGxzpTxDof3x7gftV2DZ/
	14CpAp3ubD4hOSKbZDj2YgVSztkdeF2+1cI25sXqeznLp0Ag0tAsbeHv3q/ycNPwjYgU2Qdpcfb
	5NT6aVdpOo8w7UupJjAhmiEDQozVTlX1KSI0XPkQvJlvk7so0AvEoNzPVrEhMf2df2ZkEpT3vwQ
	hoIUMAkfekFyXa2pfqEtOd1hq9E0z1JVg8DgEbxwUrOWWZc+Pde9bDXQZur18jRpvEkTqy2XHzm
	unRw97rqUbt4bQWffzyrW8jyY3sd/S+4AKZ079cVlJFMIcsdVjxW6Bpcy+nJnYs50GitFCn92sZ
	UjZd8G0dNsKGHgbEbvsCAn+odQGldMdMibsMyi0XY8LvYrfuHEA==
X-Received: by 2002:a17:90b:3b4f:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-34f5f8b4f02mr7960a91.15.1767636005549;
        Mon, 05 Jan 2026 10:00:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXnFzNWl9jnWzXu1wXVFqUFevFHXlW2JypT3YQ0urh+Ea5xHWLmn/4yUAoYuZeO8boIXKu1Q==
X-Received: by 2002:a17:90b:3b4f:b0:32e:8ff9:d124 with SMTP id 98e67ed59e1d1-34f5f8b4f02mr7929a91.15.1767636004925;
        Mon, 05 Jan 2026 10:00:04 -0800 (PST)
Received: from [192.168.0.107] ([183.82.31.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b1922sm15402a91.4.2026.01.05.10.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 10:00:04 -0800 (PST)
Message-ID: <6d48473e-2c00-4d3a-ab9f-338761db33d2@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:30:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
To: mr.nuke.me@gmail.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        andersson@kernel.org, jeff.johnson@oss.qualcomm.com
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
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <7d5be110-c605-4a02-8121-1c4cb2571bb8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M89A6iws c=1 sm=1 tr=0 ts=695bfc26 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=V6Ol1F/91haf34TWKFX4Fg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=SWP3IsI89bYa406iQT8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NiBTYWx0ZWRfX6CT8NVjimltI
 +kW5a0B5k5N8BQRXaAcFKNqO/EXWO3KY3TjNFQ/HteA++nzin+ea8AQek0C8zTmhy2eGALZum8G
 cHIqwdileKXOsQZj7PkC2VKszUlQ+3+nFkX7JFUnHPu33xe/Ax+e+xHpDhxDN8fpq1LeWzPtFIc
 qQ4z1/x8snW1DUjOu3inR15A7Ee4TTnZsJ/I3VvIP5Xwczo50NMy+KA4J/eZyQ6Rf9GGRyRrUEp
 uOshdZy8Fub+vH+vTtzEJgTnxeqdsPfi1wCV3EWC2jD7jrlf7OHH/kwlqJ6uHATy1rSw9g4AuY6
 UlhGH5uUP9r5o/PmB6/hAYWD4eFiqDnltKU/1XYAKiIkZkFVu52ezsbq7MQMdPPmzuRoLIk/0sO
 x+5rDdqSNu214QB2osjTgzKmx+mCjN1GJL+eiaWJyWOp78+qNUtW3OlEdK0PpVtikeOcSgyCy4b
 HZsKW/r9bexSpIGRZzg==
X-Proofpoint-ORIG-GUID: LgfsJTF_S4kGU-G-HCAT9qz1v4vb7nSp
X-Proofpoint-GUID: LgfsJTF_S4kGU-G-HCAT9qz1v4vb7nSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050156



On 1/5/2026 8:53 PM, mr.nuke.me@gmail.com wrote:
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

AFAIK, M3 Firmware is required for an underlying sub-processor which is used
by the Wi-Fi subsystem.

Hi Jeff,

Is there any upstream facing documentation on the need for M3 Firmware ?

Thanks,
Vignesh


> 
> Alex
> 



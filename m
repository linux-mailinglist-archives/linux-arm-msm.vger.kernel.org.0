Return-Path: <linux-arm-msm+bounces-43654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED89FE756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60C2B162688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5021A7044;
	Mon, 30 Dec 2024 14:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGaBd6aN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E577DA88
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570495; cv=none; b=ufr5AEasM60X5Qu7Flr8fx037Ga4qVpkjO7SFQDrxPPZQboPyOU2pZStj/iwV84G6YLrUcYKjUn3NN01xjN6EfiDnqZ3Kc3TMa/aZQh5IO+GIrWzi00T+wR6HUEPlfGczwICC/IIX3cVG5UjkhCfMPiHzPI1mk34nZ8+9QgILSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570495; c=relaxed/simple;
	bh=piMWhPiVlAVjAiq+sZ+fIv6Xu5tl61re7xdN7AiPRoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0YUflFyPykAvt0uMGEaKNyrvyx1HRpTcAVu9ccFAzRmDI9Vczonvt6BOE4D3Bvf9UukMlkPuFzItp0yJHqjGRxes/yXxWW1navSF8QhqDrsxCNh/K5pV6TfMbbkhbU/Isc9WS337vwEHgAlrbpU3pAn9RhFk43QJCqv+tYTX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGaBd6aN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUE3dOX004994
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yQh3lm3ZPnFyqqh69QyrXtiw+/VFGVpbhOs9S/9Rbo=; b=KGaBd6aNftN+wT3b
	m+1FabNQnJZuISx1J5jKUgFWComgmTB65YGtutxi0NJqu+lyHkjN2kiFshzNEDxr
	3tp7lu5ezybHe+AaPKpCW92fv80coDuUjb7Uagtkup0T+CKC4KXWHsxx8VcKxovO
	PuEk3SS9ruVDD4DvEWfEYY9/FbD9e2jkmFs1j9aLSWq+1qlBIZfLhfjzgNbc9xH/
	cqrUN0kuALUoSa7XXyOwckxAlQ5E1oB9cTc7JxtfK0qx70z1PyhtIL5AOScPrUQy
	I2ThkDA1+Bv4v1U7asWt07q4G95CTPuzByV6oP/5nbE97pwy6hgauEN/+NlIbxON
	pUXXXw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uvxxg3yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:54:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6db1009a608so15102746d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570492; x=1736175292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yQh3lm3ZPnFyqqh69QyrXtiw+/VFGVpbhOs9S/9Rbo=;
        b=eK/qqrXWHSAnz/tjhCFqsyEC8skNWDl0TrIYMCHGxQI8HPqYtpM7prk0fYxaWllGsX
         7yhlI5YQXR6xYLB08exaXvO+SbtBFbFe7zvrwJzyz4n+SaHw2Gun7tmPJGI8j+zvcnLa
         O25MUBn89pQ1oDhukrqjdfE+yk78iVwIPkx/SACbWRf7kp3WekLzEJpfgR0ETw3kKRpi
         d+kZIibtMQ++lEA7NFuLHRtQ6gUj2sCteBOxfPSIYQC21tFv3ADSBozFa7NqmrAeU4B+
         e1zWjuUfiQi7jPYvAx7SftWVRJh4rV1Sbq+1942ol44SO13nyH+XgsVLH5gDHKCGjvD6
         jHhw==
X-Forwarded-Encrypted: i=1; AJvYcCXctI0NL8BYg7EhygHdUQNQ/j+a+QB33MlTTLJCTfg8SOdofNCSxRKbFc3HlFmzfeGIhUjI2c+XoLhmXZn5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh+vuZXByi3xRRxtJYXZabCWhxXn806XcDkk+29EIi9k2VCSDB
	lYrTFaAjrg61LUvXMmG81zk/BepMV79GVGg0rzIpgflROmgyaDckLlkyN11XBR2/SbI69SEn34W
	gj/Cm++FXBAFKywCPbR1fGH6H8y2AmN/NmpfC2XIPqc1ZiFpML/EVBF6HPi8HZ+WZ
X-Gm-Gg: ASbGnctNpTWlRoEcg05YZ3nP6qV8EnK3tpqwQqRFmerV6+HkUM2+rg02/9wWZN3OgvA
	gwqn8Fz+UxypJdOmMYmhmr73Ir0rhc0LWB8oQg6b4o2tWfE2gvlZVmQhw/Y1VsBexPBidnmHm7a
	NuRAZgnLSBmtZacd0/jLQjUzX5MnvyJfkLypt/eUJKvl/0aP+QPghI3xAg1wA3h++IvSyy/Ukjh
	BV0z/59Mwbe8TD4hkSrop7z1aNsVeRqqnG+AK7zhQHgxFy9YrzXhyYqYdY7mSWPmY6maj7Y2sGS
	e4toxFFmEc/mp6mS55+T978UD3nwKW6lFVM=
X-Received: by 2002:ac8:5f93:0:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46a4a9785cdmr202269091cf.10.1735570492144;
        Mon, 30 Dec 2024 06:54:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxp+M80FgkyfPDCvRlt9KPdHqZ28lMUsgBTSj2vWFRpVEwuMQNUiC6qz6BVUou2zWUnxFaVA==
X-Received: by 2002:ac8:5f93:0:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46a4a9785cdmr202268951cf.10.1735570491736;
        Mon, 30 Dec 2024 06:54:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedaebsm15279221a12.57.2024.12.30.06.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:54:51 -0800 (PST)
Message-ID: <480eddca-97f1-4bc0-ab1f-22b14407e0d9@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:54:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E
 Go (sc8280xp)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, chenxuecong2009@outlook.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, gty0622@gmail.com, johan+linaro@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <d9c9cb80-0331-4cf0-9988-15f571d4cf7c@oss.qualcomm.com>
 <20241223130732.76968-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241223130732.76968-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: saTOSDOQoPGYUokQeG-NnYR4ULXorCTN
X-Proofpoint-GUID: saTOSDOQoPGYUokQeG-NnYR4ULXorCTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=846
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300129

On 23.12.2024 2:07 PM, Pengyu Luo wrote:
> On Mon, Dec 23, 2024 at 8:25 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 21.12.2024 8:57 AM, Pengyu Luo wrote:
>>> Messing up, reply again to fix thread.
>>>
>>> On Sat, Dec 21, 2024 at 5:14 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 20.12.2024 5:05 PM, Pengyu Luo wrote:
>>>>
>>>
>>> [...]
>>>
>>>>> +     chosen {
>>>>> +             #address-cells = <2>;
>>>>> +             #size-cells = <2>;
>>>>> +             ranges;
>>>>> +
>>>>> +             framebuffer0: framebuffer@c6200000 {
>>>>> +                     compatible = "simple-framebuffer";
>>>>> +                     reg = <0x0 0xc6200000 0x0 0x02400000>;
>>>>> +                     width = <1600>;
>>>>> +                     height = <2560>;
>>>>> +                     stride = <(1600 * 4)>;
>>>>> +                     format = "a8r8g8b8";
>>>>> +             };
>>>>> +     };
>>>>
>>>> I still don't understand why efifb doesn't work for you.
>>>>
>>>
>>> In v1, you asked me
>>
>> Ahh sorry, I churn through a lot of emails and sometimes forget things.
>>
>>>
>>>> Very very weird. Are you booting with clk_ignore_unused pd_ignore_unused
>>>> in kernel cmdline?
>>>
>>> I said yes, as Johan suggested in here (see [1]). I am adding Johan.
>>>
>>>> Could you share your .config file?
>>>
>>> Here please, https://pastebin.com/UKew61ZC
>>
>> All the things one would expect for efifb to show up seem to be there.
>>
>> Maybe try earlycon=efifb video=efifb?
> 
> Not work, whether or not adding clk_ignore_unused pd_ignore_unused.

I am utterly confused then, maybe it's one of those devices where calling
exit boot services kills the display. 

Either way, let's not worry about it anymore

Konrad


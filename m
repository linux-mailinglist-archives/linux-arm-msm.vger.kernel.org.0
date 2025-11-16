Return-Path: <linux-arm-msm+bounces-81996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B59C61A1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 19:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 208E0356B1D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4456E30F92E;
	Sun, 16 Nov 2025 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byFohBZU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6MHOzv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA030C615
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763316609; cv=none; b=eAZ814vUfo6ie61Cr7htxWLOS2dagFPZqtyx9G+aVeN5wwnjLNoqTmUM/4oMZMir4pMaiKp6M0FCzasOJFs1QPLgf41xhXZPCToK7BqMzjYUFKKj6vh2JciAglgZlwJasr4NdoizRW6f0Nm/BfdpP7IY6LywAQbrPmbht2/14y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763316609; c=relaxed/simple;
	bh=gtQCaa+YL3Rb2sSsLYceCTUBmA0UzM8vScQKA3MoiNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcFVniJT/gokrZ5bdyf+w68+VvuJ1TQnt/KB1apjx03PXBhbOpEv9e3qqKXiN6AVIJZ5cnoXLIT5hKciMNa+AolZJPgphRlk4vkG1LeLpEEQzVt13++7uhr2QAOeWPMUI4XMs7jBrB4L6TShvQAiWmc+vi8mj759r2cfdgS+yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byFohBZU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6MHOzv9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGBIMwl1156382
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 18:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssdPD/pRCCYUvju2hSBh8g3CDRExeSqd56iLxlTVNu8=; b=byFohBZUKqPQA3hG
	D1DkU3kNULp+KsLPmf6GxtjSCEx+yfCAFAt0heV/Oddy0502NpQyDJUs5magM5A3
	aWB2HLNR87YffK9El5QelZCXMZMNobDDbAbjoX14qh8XIb1LpAG1fLxDgnYq3iih
	9iNehlapb23OyfLuMPU0aYMBb+QeESPHKUhwCdpesXwF3pfI8UZOhD3CbiQbWE75
	fqZ3SZ4Fq9vU/sGbP0Hbiq2/7dJT5GBwwqVop5owQnM4UpHUbpcTKnz5bEIYkFz9
	63NLShQeY5xohjmxWjXie30gj7RjgM68JVNzpxCrROP1ApTAkKKIlSFknt7+GMv2
	OIwZPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh32g2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 18:10:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso51680075ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763316606; x=1763921406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssdPD/pRCCYUvju2hSBh8g3CDRExeSqd56iLxlTVNu8=;
        b=P6MHOzv9C8oA1wIpSpdO/a35MtjLBxK2eRA3jhX/PqaWGHL1geAfay1BkwGurEPu9D
         o5dtY54MBVxpS5KWypKmEfWpiewSneVsGJEbvAMvJf6xJ1zgEDJcdilm+ZiMrkni+yIs
         8tFMBcJbEh6BZObQXMO/WDdVNjW2SHY0wpI3rhIXjsQ07WcOyxE3qoFo/Zc55v4SSt8M
         9MdtuE/rzNnqyA/0pfIpFOk2kbp9j6Y4pVRTwF/WY3PuLrXxVQugV06+NgIfqrVSMm2i
         kOixNYWUmw1OnXQjclH8Z2xX3n+5bsuVS3qs7FLkZbViijTY0yIzKzhgBYr4HvjHLz11
         QtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763316606; x=1763921406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssdPD/pRCCYUvju2hSBh8g3CDRExeSqd56iLxlTVNu8=;
        b=nF9BGmKEn0qGkP0GtYu3ba8kWCsM9yoHwa1WtryxUg30wClWkwenJSGQFCJPnbQ7Id
         G+oi4gtUkXAqcJptALWpHWmyYHqAAn0bVKoezX89u0+Hj/qWWAZVhR5pJe5Di0kvKaWm
         ppp1jXt8cEDGuIVIMAo6OIR85AXSRZSg7aaDxopu80FqIGP9rnBs0E3NowIj3EsYrffP
         brke1J1M/ApXAaDqBjpwkwNYwlpUIv+BMCjBqcqIGrviJ2QhK8jRDZvuCSRj5LwpeTEt
         ySOQR9FJH4XTiahVrazvcGRpzXqXyJWGhZqNZrS02RBYA8FXbDGwUj2iTt3TmhQliLAc
         +Tcw==
X-Gm-Message-State: AOJu0YzQTeP3HP5ov1hUi6CMeXL3nCt1vOeY+NxrfF5jiDI4gyh+MJoB
	6idMhn942WjPo6M1URbRMg2G+LGM/jM+GaimLEFOGRYUQaLtGNLpdDiR395MEoGPypHyQ+T1CWm
	6qcbXSHuSHqnLyzqoS3h3VGTRvKlRKNe/no0O2hF4b0th5q2VEeJk6DuWeRRUK71FgEa+
X-Gm-Gg: ASbGncvf9R9o7OPQr8Bz8UQnIg8fDe6a/Efr6dkYJ559rzuSyC6gXo7KIAQJvHvBOQf
	n+0px6zQehJeusMCOGGOGrL9eB9X0gr6ZZndM1mcat/vDu/HmVfRd/N6p1yvg2JgQ78nO/cyVYk
	C9d5XVqWExec9B17BjEYtUuroprwCsG2/zL1KpHoCsiUp0oGNE5K9yWXuiOoVM+r8w7hbqwQax+
	3xZSAW28BPlMTNkuW/atE2Kz/oFVIvFRLzIvKd44Ojb6vM2SqKVDwygKdSbDhaU4rppe6ORfrhN
	YnpD11Kpt1iU8bOM61KSEnbQbqPQcZJ6hHnvWNapOGwauKndqSK5GjX7FAU1APMM1o00a5ljiFR
	mUdqJ3QZGYwrfwANnCs74VjPlc94x2oX+dECF
X-Received: by 2002:a17:902:f689:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2986a6abddbmr115736345ad.6.1763316605726;
        Sun, 16 Nov 2025 10:10:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERElmHrN3tbuB7WCbhsflqXegHPN5MCWNH2hRx/+rsV5gFlToIcgnXNLQx+7FORvo8XQKzEA==
X-Received: by 2002:a17:902:f689:b0:27e:f018:d2fb with SMTP id d9443c01a7336-2986a6abddbmr115736015ad.6.1763316605258;
        Sun, 16 Nov 2025 10:10:05 -0800 (PST)
Received: from [192.168.1.5] ([223.230.65.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c24a5fdsm115475935ad.43.2025.11.16.10.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 10:10:04 -0800 (PST)
Message-ID: <ab5cec4e-a990-460e-a4cf-605028f9ea77@oss.qualcomm.com>
Date: Sun, 16 Nov 2025 23:39:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P LPASS pinctrl
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <5e48ad7f-6de3-438f-8623-8f8a9c8dedbc@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <5e48ad7f-6de3-438f-8623-8f8a9c8dedbc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MFHtHoGdnwBZK0jWSUmU_DWv7EPC8g3Z
X-Authority-Analysis: v=2.4 cv=EtnfbCcA c=1 sm=1 tr=0 ts=691a137e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=kzaXOApHt4F6fez/6+LNzg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ynku4ptAPTcfh0RwKpgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: MFHtHoGdnwBZK0jWSUmU_DWv7EPC8g3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE1MSBTYWx0ZWRfX9qEtnZ9b3T+o
 CmIuNGmoEbGxuq9dR2ga4vnPKfm2Grc+VUH+9hWDqfV6baOP0NEgisqBOt/Id55Q6Z7YNHPP2lc
 80IdLzW0q/ke6hbNSO0AsH+IeRPlfhqQBAf3Cx7DsUaly9m/0hC0GSqkuHlQvnHhXqRdasntEVY
 KRHVuyueBsfgqM7BsL72Yx9Sf7+S0Bb2V7r8/YQOSYbf0nQzfBTmTqESTALR8yUdjkcE59TH3uP
 3MEyZdZFe7o+YMS++/aKgiaIZ/vshXdPNhP8x1lFpdu10acxrtKEB6/xc1W3zeX5piEDNAE/ZRa
 SJkeSu1ylQrG1ITloLAR2+77u4rUdiePJUbkaSjSLVqCN1VfxiUDXbFDuofpb05Ykhd2Ogm4+1Y
 rrLkrBP74p1Xoo3IbZwLSOyg652EcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160151



On 11/16/2025 10:59 PM, Krzysztof Kozlowski wrote:
> On 16/11/2025 18:16, Mohammad Rafi Shaik wrote:
>> Add bindings for the pin controller in Low Power Audio SubSystem (LPASS)
>> of Qualcomm SA8775P SoC.
> 
> 
> ...
> 
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +
>> +    lpass_tlmm: pinctrl@3440000 {
>> +        compatible = "qcom,sa8775p-lpass-lpi-pinctrl";
>> +        reg = <0x0 0x03440000 0x0 0x20000>;
> 
> 
> Are you sure you tested this file? I think this should nicely fail.
> 

ACK,

You’re right — DT binding check is failing.

My DT binding check didn’t catch it because the schema wasn’t updated.

After updating the DT schema, I can see the error now.

I’ll fix this in the next version.

Thanks for pointing it out!

Regards,
Rafi.



> Best regards,
> Krzysztof



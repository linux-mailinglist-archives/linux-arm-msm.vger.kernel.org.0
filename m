Return-Path: <linux-arm-msm+bounces-75702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E7EBB0FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 17:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0DCE4A597A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 15:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4367530AD11;
	Wed,  1 Oct 2025 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwjp3r5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D130AAC7
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759331037; cv=none; b=VWgqzyM/QRJaQ0AccA+YcMP/tUKTYdzmH3gINdWVIElkb1OzJWvEOVgYpn+vAshy/d1u8d5OmtzoqY2EIiyeNg9HLE2FL0Oic1NI3MZjUgTLo4bZwHMrJES0kSus0FXhkiM5jhUkvmqu3TWI7J3mGqYSiYe0ltfBv82LGjh0k58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759331037; c=relaxed/simple;
	bh=Ne/1emli/qNR+CSGY/RT6fRMcITyKtKShhbED1YmozE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+k8uhfoGteDnGRgmOBUHdpQ9wzlixdL/ktR3xqxqxYHogcWIcaUDEsqSPhf/ygEO/WrwGfkOI9I1nH8Vo5VgNitB/Sz5tjuCkXDELsPP4PTr6uybAy+aZ0vyf1mnsDJ/r82T39QjDxti0vc1UXVQ65m0skW4wTZeo8yjHSmfhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwjp3r5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918tkcN027554
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 15:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZJfQa+8s08ZkdGhtiYIX3xBNflVlw/lYZrO+tw+/a4M=; b=Zwjp3r5PKA0yInJc
	AWwujlGWsfudP7B/ofYT7pw+8BkB3BxaPYp0PEp/7wMKJz0klyYxgwdab25SQjFU
	C+AXnLlbokpthItSIMSlKycWwx/EFFp4r0aS5SuW3SADMz/cO0c5NxOYUVf9XZWV
	XSEpVaVOvNeTYj0aUDdu4cABCjj9drtoFKHcsn9pLIFmZImB4HaHnY4AnhFClonw
	VvhMMQVom7g1eZZCDEI0xx+sCslXMePJlubtziMLGzcMgTxfarGXz7p5csCmB4Lm
	15dkXtuqDTnEwSE4AUJHH/7d/ZsEfY5VI3IRa1JS+P1IFulyZ7j989N1Hh/iZqls
	8iWyYQ==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851n01m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 15:03:53 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-4257567fb7cso78351465ab.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759331031; x=1759935831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJfQa+8s08ZkdGhtiYIX3xBNflVlw/lYZrO+tw+/a4M=;
        b=RQs+2lXtUjyNiiTjfEKFnvSW0efU1wMQfukQTwsoOtP2XhAuDB07nCO6RPxB5ZrCZb
         53QBzjcoJrkKYLeBmtJNiH0edla17w+HOcNC5z+65Iuos/OafT5QCMMfHQaj1wbGkmZg
         1MhCOulWZv1krWz0oR6ppyOJShXJlmOMLe+bDoK8k1VhxBD0zsUHN2gFFVH5khecYBeE
         qQ+JXQZwyx3hCWoi0oiYB/qHB+mhvDf+j6f58Eh6sgqPY/QI5LqpkdIon6zF29sT3N/j
         FsceZ5iSvyXISlCShzPfxI5Yl/ZVnZVDNZBcjedRIey0Fxo+etlxnRcvSuKWeaO0uzWK
         GeLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ySPdBiiqc6poBo5y4RGiQaFArKqalPTz5uzsv/4IDX953V1F2kEKS180/vs7MV7gB55TIn37xAwk4Vul@vger.kernel.org
X-Gm-Message-State: AOJu0YwI455mvNfzT0W1YcfG1l3lXfIFxLAGaIXxCITRG242+6h9z9CY
	jNEWyAVctDWVtlcuVJ9W/8YeUtNE2C4KZg4VjlE3XokXxpRJ471Bi9FiRCpuLa5zaqNZzQLrwL2
	QXAAwXU1vGUJXFKXIpzv+IsdG7vjwQa0pl2qbRHhtwgRSCmsSSZy0fubH7UmwQQpHRXAH0oMEQY
	4v
X-Gm-Gg: ASbGncsB0wZF3vsv+UmAxeVZUiI1NeIrojOF8w9TqB8QBqkHfRrR/igg6uW25nQ+U1H
	Q/M6JKMMosIM02gkTa6jHDY+oL8oDY8X6q+l/dlp2qOUYq3azi11HdrbXSmO0BeU+9WFVOv2jPH
	ijP1ngEn1S+ad58xgoEZgOwxNyhzGo2dx5ry9/fjAzTDieT23kIun40UKzqpBHXAR9atvXiW7V0
	wbpIJSQ85XNJebwdgGcOyEpAYWSyH2Voctfe0KvGIj0UrWxPO0Dsp5Y0jvkbYCzp7QEHnARKc3/
	s2/7rVhxC94A+Q9DVbMggmYmx0TtkkvdheoCP0Jb1swpo51onr7hdxLZM27ZbO5mDqR9/Trk
X-Received: by 2002:a05:6e02:1d8b:b0:42d:7dea:1e04 with SMTP id e9e14a558f8ab-42d81680306mr60426955ab.25.1759331031148;
        Wed, 01 Oct 2025 08:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAh/o38qCjV/z7AmcOIL1eFdOOFJR0dPaq1/cxvmmMMiAnwbipvHaISIPwZ6i6ggPYkIYvPQ==
X-Received: by 2002:a05:6e02:1d8b:b0:42d:7dea:1e04 with SMTP id e9e14a558f8ab-42d81680306mr60426075ab.25.1759331030487;
        Wed, 01 Oct 2025 08:03:50 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e611970easm25118405e9.2.2025.10.01.08.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 08:03:50 -0700 (PDT)
Message-ID: <b3147370-11da-4202-abac-36218487578f@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 16:03:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
 <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com>
 <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
 <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org>
 <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
 <CAL_JsqLcinpeJyib+JG7UFspUqXDTzCLguF3Nt4JJY9YncTb9A@mail.gmail.com>
 <b8c1365a-545d-40ae-a39c-e15a3e1f07e7@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <b8c1365a-545d-40ae-a39c-e15a3e1f07e7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dd42d9 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WCg39QfALH1NCTeANmoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX+IhNfafjLAvd
 6j+82MJ0oQmTdX6BFrkPFdDA39uleIEJ8oaIxlxnXulundHvfKOkR84iwC7lGYR2lL/LrAu0fb9
 7ZuEzmd4Sf2aNjmQTRdLBPjfgNl3/zgKWHg9prDx8rs9duDHVS/Vhd9MBzmvFkdp0LddLMIjylg
 r+ddsHv7bLz32awzV9Nw78zpiPqmrincNiDx+pImytnhgcQRpJC/WoS/d6C19/wikGX5QsZMCZH
 LA2npkR+7bfAqDLhIH0uiHUqyn4SBPLg/rtsw7mwn+F3eLfp9mK4X6SH628duFhtPiHr0KlfvBY
 NyZeRuy/E0GQgkBqMSxx3uvu4FF5QlhuzOEDL8VEPiwiNspOSpQsI8G5c4JcTI7VlTN1PPs+bf4
 NT7YVKiPuDYooNSXd8MXQkJXAk4stg==
X-Proofpoint-ORIG-GUID: oSAUx9KE4xnkVVhZdMUVZ2YiaQjOJPAQ
X-Proofpoint-GUID: oSAUx9KE4xnkVVhZdMUVZ2YiaQjOJPAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032

On 10/1/25 3:21 PM, Srinivas Kandagatla wrote:
> 
> 
> On 10/1/25 3:19 PM, Rob Herring wrote:
>> +Greg
>>
>> On Fri, Sep 19, 2025 at 12:25 PM Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Fri, Sep 5, 2025 at 12:30 AM Srinivas Kandagatla <srini@kernel.org> wrote:
>>>>
>>>>
>>>>
>>>> On 9/5/25 12:08 AM, Rob Herring wrote:
>>>>> On Tue, Aug 19, 2025 at 8:44 AM Srinivas Kandagatla
>>>>> <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> Thanks Rob for reporting this,
>>>>>>
>>>>>> On 8/19/25 2:35 PM, Rob Herring wrote:
>>>>>>> On Thu, Jul 24, 2025 at 8:28 AM <srinivas.kandagatla@oss.qualcomm.com> wrote:
>>>>>>>>
>>>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> Qcom Slimbus controller driver is totally unused and dead code, there is
>>>>>>>> no point in keeping this driver in the kernel without users.
>>>>>>>>
>>>>>>>> This patch removes the driver along with device tree bindings.
>>>>>>>>
>>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
>>>>>>>>  drivers/slimbus/Kconfig                       |   7 -
>>>>>>>>  drivers/slimbus/Makefile                      |   3 -
>>>>>>>>  drivers/slimbus/qcom-ctrl.c                   | 735 ------------------
>>>>>>>>  4 files changed, 831 deletions(-)
>>>>>>>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
>>>>>>>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
>>>>>>>
>>>>>>> This adds warnings to dt_binding_check:
>>>>>>>
>>>>>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>>>>>> /example-0/soc/slim@28080000: failed to match any schema with
>>>>>>> compatible: ['qcom,apq8064-slim', 'qcom,slim']
>>>>>>
>>>>>> Will replace this example with slim-ngd and fold it in the original patch.
>>>>>
>>>>> Still warning in linux-next...
>>>> Its done now!
>>>
>>> Now I get this:
>>>
>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match
>>> any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
>>>         from schema $id:
>>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>> slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
>>>         from schema $id:
>>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
>>>         from schema $id:
>>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
>>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
>>> property
>>>         from schema $id:
>>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>>
>> Still failing in linux-next.

I was running the check against the the yaml file which missed this
warnings, I should have run this against the folder instead which could
have caught this. May be this is something that could be improved in the
check by pulling in the dependency yamls too.


make -j`nproc` dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/slimbus/slimbus.yaml


--srini
> 
> Rob, sorry for delay..
> 
> will send a fix,
> 
> 
> --srini
> 
>>
>> Rob
> 



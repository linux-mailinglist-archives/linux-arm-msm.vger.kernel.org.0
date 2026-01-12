Return-Path: <linux-arm-msm+bounces-88457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D3BD10F28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBB353065164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78AF2334361;
	Mon, 12 Jan 2026 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBQ+ne23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ewhk+95V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370732ABFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768204014; cv=none; b=nXlv1+wKCusHiFjxQeodQWFjqBZgNJl1TBfdcx5gwi8utnRK+hfy3XI9AqaSjX4rOMudzjnRb5n+fwzV+eCxOqJeloUo0gwcTePSdgzJykPAN02bM+pNaU+tsWcskObvBZ2CXj+fcsFkQLaADVkxb9W93O0OgiRojeTe7H+JjE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768204014; c=relaxed/simple;
	bh=xB3p4jO6gpwMvB1bNsvPkMTXwiIeITc57QCzLK127rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnZQu1x/4eES8N1WjVajiXGQ5Gs9/rPX4Fly/st7TyaGGvDawm7+bZRcSH9J7KDxxx/fPQOtWkV7680UbTFGL7P2An2lh+1Tovq20/r2KN28pZzgiiwxN6rb+gnSDuaGj1y9jp6eNa68Dwmea/z7Wnxrw2Kb7hv3fFdGGmEfbPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBQ+ne23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ewhk+95V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMcOtV165707
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GccXshMNG6ZdESvyI7dZViESN17urT3Y9cvZCz6utdE=; b=lBQ+ne23qbztbPNY
	IzimUAqrsuf3C981AU2eGtzYpkGq1O9uHWiDQIEp0tF8w78UO9FATmUj7Sseysvh
	8aIVyXnMh8T0vsf3IEV5PmkSaz3k1LMF8UiFiToA2rFlc5ZZX869+frMmSpvnXLT
	0vYKJl83e80HFKvveImrRJnJWjF7wyn0+7JMuWopAEDWS55XQDCAgPGZqsfCseQI
	RwrSrqBuTw2dwIMkmhd5Qa/XkovoJ0anLkFPY9R56wxSfsWJXm2ny7fB+OPAnZJb
	ofEUBYBLzl7tsTv4zz5qUPEWjqG2rtN0IHgsJVwwSc3omeVmZDJwQ4lE6bYbx1As
	MBXe+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bm8kyt224-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 07:46:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0e952f153so160142125ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 23:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768204005; x=1768808805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GccXshMNG6ZdESvyI7dZViESN17urT3Y9cvZCz6utdE=;
        b=Ewhk+95VRMqZrAwS+p/MhBPdR63Fr5wfQ8v7oidBAMt4F/WRge1ktoFYXNHcSwE58J
         4gwQ1cJVzA0EiUvxdO8yaeZJHOEOSTcz5HgaqM11Z+d9I6EqWhUnfjSDA2Nyo/aD6Fof
         XNrHchhtSaJrBF1yzUaDA4auvi2TG38jAcpkRd0H0cxTlyL7irxNwEttwKcQKf85+WuO
         zlkhM9Ov/Xv3lVXy5GWSf6x+VChL6HIb0nZk5kSGKdYGXzxMKM+YUiMMQm6vmp7xjHiK
         PzPLpzCqZz3Km61xo+hX9x8MF8fCL8EVEcB6AuDFyykEa819JrwYAk+gV+TIDN455aQz
         uU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204005; x=1768808805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GccXshMNG6ZdESvyI7dZViESN17urT3Y9cvZCz6utdE=;
        b=HvtUv3tO+b5NUuEumbiW2HCjU4JyC1qpVInM2LFAxKB9BnCUyXIyNASUw++jt2RQE2
         dkDZGBIXFijhwMoSh/AqeJaAR4WZ7FLeP94nC7ka3K49cRx3FgQtn0e7xQ48onPk/nqR
         Kvx7Ohzai+JPrha2+kXQVt/2XuxqQtFPsZzgH6cgI4Kzyf6urqsnBD+sNxEbqspmJTaa
         Lpdquc5QTnxtLWqQT7Q+mcHCNiLlQHGq0U0BB9UYDZg0Wq7emakR8afGRw8EXViQjK89
         M2cavRsC/boqyFzTXMbsCuSddxuYYH8vvtZvIyu2uDhP7qx+rJnKjMKSwM0q/NoK0WSs
         vrfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5A0l0Kslj2soZWnCLEBxhmUnJRkTkabRECruzyTYQhUM8efoRjpGRiCj3oQnBlCPgOsjhU7Yu8QwU5FfI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2AjtfLUO7UYMGOKwvRxGqbswrqcP9wIFqbgHS9wIgKcHv56Nz
	DDZq7IixH8M4uSgkGCXjDem94aQed6w9odMb91N1q3aHZYky+JIhtCVPY8EqWKW7k+A/9/1eFn2
	AMb7NOFR8Z1OUGHVopWCv/jYY9lc3goIMDBIRGb43JmBpKC585ub1JwRdu/DtGNbwS0MG
X-Gm-Gg: AY/fxX57JZHzvRshn76vtk0Ab7moO997Lu63ikNcdh6QrijlWb5rFlrOwkKBMd6oawP
	4qPswB5dBBtR4DB9EN2sYLlzv7y7jifrAS+Ppb4TiSLMWb9X7PYZmoFbVgDPO9ZAgc4JAoCd/gT
	hIAYJ8q+qOm3K4CpkgNFh9y3je8qtzqdjjmOxtQFSbtR29Y4Gb11qoh/9moaGAO623l3w6u5U9B
	degb1pbp/Wuey93yQ3kMbK2z3A70gxkavLsf94QaOYQfJr3bEt/0SkF1aVorB4VN1fH1mIwZKVQ
	2YoS9NCmoPLB0fti3cGHTYlesx8RuI3FdGyUAm3dsW8MTp9xbQIcyOKG2iXjU3yuqek4MDTjbRz
	sRXKl2yqT8SxsnQlJG3tmxm02RRIYb/dPJgCkMTsiOWY1uEqCPrOTJ5r5
X-Received: by 2002:a05:6a20:a122:b0:384:fa66:c1a with SMTP id adf61e73a8af0-3898f997599mr15074053637.48.1768204005297;
        Sun, 11 Jan 2026 23:46:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELLXnP9v/fdZk0GswqtPQ85SS7c8VVDneJqnU9uTg8UfqdMHaSijBxeILOAxPAhxBCNf5q+w==
X-Received: by 2002:a05:6a20:a122:b0:384:fa66:c1a with SMTP id adf61e73a8af0-3898f997599mr15074038637.48.1768204004789;
        Sun, 11 Jan 2026 23:46:44 -0800 (PST)
Received: from [192.168.43.245] ([157.48.167.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29592sm16502732a12.22.2026.01.11.23.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 23:46:44 -0800 (PST)
Message-ID: <025a8ba9-3889-4a8d-84ab-4f3f839f6003@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 13:16:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
 <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
 <91d2e5f7-7d93-4909-9ed2-6b19abf0b448@oss.qualcomm.com>
 <dayj662qu7tb3l2fuq4sfdxunvkk2rt777vm7dfvdazbwiwpzn@mysrwdbdptqt>
 <adlhkus5gvum6fkd7bxjohwlsiumw7w6w4c36vzphjz7my2644@pmobztmgpdvx>
 <zaf4uoms75wc7yvmrmqs53couefqsv5oie2hbiwvhitqonbs4u@aq6bcvf4nq3o>
 <0d6f8f95-01be-4fa3-9fde-bc00cbb894f6@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <0d6f8f95-01be-4fa3-9fde-bc00cbb894f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZJarrdDU8oCfurU9Pox6S5fZ_P2GbH6H
X-Authority-Analysis: v=2.4 cv=ZuDg6t7G c=1 sm=1 tr=0 ts=6964a6e6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Rpb+4nhYU3MGDSpx93MvVA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mIxXIP1jWOx8OtetEwYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ZJarrdDU8oCfurU9Pox6S5fZ_P2GbH6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1OSBTYWx0ZWRfX45vKiIlIxxNp
 Eh+Ib7dU0vkokWS+L1n/iPrPJOdQPXlhEVeMLOSh+5IzCtlLR8App/U9KrD2UaxdqV8u6uQIZ6H
 EtA1IXON9Ap33L8JHPCLjDM7csAAV80a1K6IWNJRjsruUSQ6ycwmiczPIYuRlR9PReep9Suqzpi
 yWDmRFUMRO01Z5NIwvf11HJlootQYCergD6gX5CbtsuGEeRA69VTE3P1fxK4Lyu6b+dQd5ENQqU
 s4M/ddgeZB8dhFbkJwiH2FOiDFbfBgbGqGW38cqMh2V9SrCUUwM7YhU4DltKGIwZ/oQaXQu3j3a
 ksA6OUv8J458Z2op4Wn+hCBM66WvZm0B0gx6Z+cibDUPkHSBMcr6PVkpVS1vL23w7LDkU7nuhPu
 ReAxZt2vdW3P7WUuh6WFIfBi4TyWAWOiYLHFmtyJuDON9dg4mhT4GwJQ5T5WeDLr0v+VIHqw78g
 1MIEmKIohcoD2iSYnrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120059



On 1/7/2026 4:00 PM, Konrad Dybcio wrote:
> On 1/5/26 6:20 PM, Manivannan Sadhasivam wrote:
>> On Mon, Jan 05, 2026 at 09:31:03AM -0600, Bjorn Andersson wrote:
>>> On Mon, Jan 05, 2026 at 11:04:44AM +0530, Manivannan Sadhasivam wrote:
>>>> On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
>>>>> On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
>>>>>> Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
>>>>>> in the pinctrl-glymur driver. Mahua shares the same pin configuration
>>>>>> as Glymur but requires a different PDC wake IRQ mapping.
>>>>>>
>>>>>> Changes include:
>>>>>> - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
>>>>>> - Define mahua_tlmm msm_pinctrl_soc_data structure
>>>>>> - Update device match table to include "qcom,mahua-tlmm" compatible
>>>>>> - Modify probe function to use of_device_get_match_data() for dynamic
>>>>>>    SoC-specific data selection
>>>>>>
>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>> ---
>>>>>>   drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
>>>>>>   1 file changed, 40 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>> index 335005084b6b..bf56a064d09c 100644
>>>>>> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>>> @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
>>>>>>   	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>>   };
>>>>>>   
>>>>>> +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
>>>>>> +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
>>>>>> +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
>>>>>> +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
>>>>>> +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
>>>>>> +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
>>>>>> +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
>>>>>> +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
>>>>>> +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
>>>>>> +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
>>>>>> +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
>>>>>> +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
>>>>>> +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
>>>>>> +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
>>>>>> +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
>>>>>> +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
>>>>>> +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
>>>>>> +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>
>>>>> Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
>>>>> (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
>>>>> suffix for the missing 143, which makes sense given the bus isn't bifurcated
>>>>> there.
>>>>>
>>>>> The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
>>>>> have it as a wakeup source, unless someone decides to connect something that's
>>>>> not PCIe to it (+Mani)
>>>>>
>>>>
>>>> PERST# by definition is an optional reset line, but on most of the *recent*
>>>> designs, OEMs always connect it to PERST# line. So practically, I don't think it
>>>> make sense to mark this GPIO as a wakeup source.
>>>>
>>>
>>> This assumes that all the OEMs uses the particular PCI instance. If they
>>> choose to route this GPIO to some other use case, they would have to
>>> figure out that we omitted one entry in this table and patch it with
>>> the appropriate data in order to have their GPIO wakeup capable.
>>>
>>> Wouldn't it be better to put the correct information in this table at
>>> this time? If we have a concrete reason not to, I think we should
>>> include something useful in the commit message to help the poor engineer
>>> faced with this task...
>>>
>>
>> There is no concrete reason actually. I just mentioned that in practical
>> usecase, I never saw an OEM routing the PERST# signal to other wakeup capable
>> functionality. But the possibility still exists, so I'm not completely against
>> it.
> 
> I'm curious whether we can just describe the union of these sets as a
> common config, because as I've mentioned, IPCat says both of these platforms
> seem to have these interrupts wired up
> 
> Konrad

Hi Konrad Dybcio,
Thanks for the suggestion!

I tested using a single combined wake map (i.e., the union of both Mahua 
and Glymur sets) on actual Glymur and Mahua hardware, and both platforms 
work correctly without any errors.

Although both GPIOs are present in the wiring, only one of them is 
actually wake-capable on each platform.

Glymur:
- GPIO 143: Supports wakeup
- GPIO 155: Does not support wakeup
Mahua:
- GPIO 143: Does not support wakeup
- GPIO 155: Supports wakeup

The combined map works functionally, but includes entries that don't 
match hardware capabilities.

Could you please advise which approach I should follow for v3?
1. Use a single combined map (union of both sets) with comments about 
wakeup capability difference, or
2. Keep separate maps for each SoC

Happy to update v3 in whichever direction you prefer.

Best regards,
Gopikrishna Garmidi



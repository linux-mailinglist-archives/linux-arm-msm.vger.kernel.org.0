Return-Path: <linux-arm-msm+bounces-87844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8826CFD2C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 633543002169
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC3F325721;
	Wed,  7 Jan 2026 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBlOykeV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axkp+V/+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490E287511
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781813; cv=none; b=WeC6J+VrhLFbHrXOM5wiN5F+O2znohqFUrB01eGyBP7ul2Tu1XRK5xaT2o8dTX2yigbz+GR4/d69knY6hjMZ0JylMSwmHohaZ+4TEuu8w0j6fb9W4t9sSQQZa5Ameq2MlPnciruVZ7zaAS3ArCCc33WakxlRiJYS3pNgjPMxFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781813; c=relaxed/simple;
	bh=SM875Nr+BEqPsbt2JS1PV3BL+H7QTt3TmRz/kLFFaGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YznXN4Uo30owYNxvplLmrVSXZWnyJVnbKx2rdMf43NTuaJvUaZ3tugZECES9B9yR16dxUbalzjCF1tUT8HP1n2XPi3c/GKcFLj0AXne9+7/HMMYIxZ1ueqPNAiHUD5H+D2HyQQRQ3jbe/JYZwkHsTM5/+p7B3NAsk+iPY/xUMnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBlOykeV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axkp+V/+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q4CK218374
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eZoqXuEx+wpj+Jjesmzm9AHfwsCA1raBMhPGpTi0Y8=; b=gBlOykeVsnit6X0b
	URmPRJX+TgMih5guFtijtD4JvYgVRJa6FVmkzuvKqsCvJvGzzzbGqGl9cHHKvpic
	tNZ4phLhQqghxE/mqkCuHqhTP2L7RozW1BhUyfBxFtIlCH3ZlixE631hCKXBi6Uq
	FKtOJCRbPEje/nnkZ4gmhPxbjKt2sYxOde/dSWtNL1clg8BMACT9C1rtUuseg486
	tq8vh03XMq43cimcV3U3SZpfStiyTfrTIwVkOn/EAfc67577VpDbTTWHz+5oO/2o
	e2U/kSduHZZbsq+mMiB+L/TCz0ncyB/jsK+AJ8/Gbr5FUpkphHeowSeUJYYiLVr9
	zIdv1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn80841t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:30:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so7817921cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767781810; x=1768386610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eZoqXuEx+wpj+Jjesmzm9AHfwsCA1raBMhPGpTi0Y8=;
        b=axkp+V/+U7ZoPm1YU5I5beMlFluQxbe9ZsY6CYluJetT7XAS8Pwz+6NGmW6qrU+izk
         WmEpJsfdxBfq8R6ptpzR8R8YSjjVJuNwHOU8eanND7wpiYtZVyKtWq93kvsGj6mIdnTq
         D+MNodJ99g6HA0IhLnRANCTTMRXBsm+uPl6KKm3AKFSTdl5cX7wBkR2vguEFGq6mwrBp
         1lDoQo4sx5WeVWlEvJ/vTHjzf2DH0tlXoReBvWEbRZePGx1yPmcli1aS5VBq8dyxg2VD
         tm1gpmdOV1onfubXbJJyvIkeZH9WX75ausT/RTqZvxEvNyZlI+rj3iPe7luZxbJfSKG2
         oYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781810; x=1768386610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eZoqXuEx+wpj+Jjesmzm9AHfwsCA1raBMhPGpTi0Y8=;
        b=OT4zTr7zBcyhyIbuKPEERfe8u/zqefYZCgby2eTfGU55thPfFryU44G0kjf6zCHu9e
         zKkg/UXKqm2Ie1+NAd8d0ZpLhJGriWwcr4B5t1dVyRSQzFmwBj1xtga+mroVEfyd7BkD
         QBj3IT07t3nxrDbI5fHRWW/gV56KmI3mDK/FhwA2GpM37WA8DMeRZCCwRwAjYLPRHvTZ
         ewF3Ah9ibAyAb9TB7X9jOQVR6E3ulg9kF88oDMQZMIpiXQVH67XwM343Lt2hE2L0yfZK
         ndBwvy14v32U+EtG+gkiQpN6DLx1MJC02A8pLnQOPrEINkaxjgFKl00RHJvTSk0zcjMq
         NeBw==
X-Forwarded-Encrypted: i=1; AJvYcCURVlCJ+IzGPkT8Aj+p75LVafWlp33gTHeWdE/0o8a2zzowIPzOID3bS8BCxhKwS0+reYf0ioNeCXxpbRCc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5Yn/lUDlyZ88YhIhiVMM1HtC4lxuwEY4Ks4quWLpR9VzaGoq
	dvW8eNBwjfd7MGGeve6vV8EnF2Qox9Wbp9BEtV8KGSqGW6/oavDCuNab7DAzEjNpKNhCog1cDng
	bRhpgILUCLUh0MibZ7G0NOsWE8roGZN6io5tFPk2aKC0XtgR0u2J9OFdxfTokJhcNXdgQ
X-Gm-Gg: AY/fxX6paX75F0fDwaEZXYoVMEiqJUwUr/8IIInAtwoeaXh5f6ctPNixPyQuG/mzmgC
	chLXoNFXbuKbRAyx5Vb/0w/Y0wsGWMjrEBoiibe6/NHIJoFU7P+b8s1kcsZ6qQMlzUQetm5owZ3
	4EH+nZAFXnK7krXyvE1d6wTEnje1ZjaEJzlKlfle3zjYhp9zbWR2eNYy+4LagNJVlmWODMvZDFI
	RAgR4FPWBiY+7uKHgdzkWxOphM9KtXGtX56ANtTSEbUNvPUwQRl98MEzNgLWAe5jJyPK5z6RYra
	F7+6P1B9Aonif2yKEXiZ1wHevXr0IsjCDv/zr6kmOA6veAspcWst1lROg/JAswHUPs8gxfzTGI2
	xp7+i5NcE8uTbGrv+L1HJS5+ODS3mQtl5a9Bf0KIE08X/wsd9Wnl3DkmGBVjIA7Burw4=
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr23047531cf.5.1767781809992;
        Wed, 07 Jan 2026 02:30:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUrIPLiovyjV3wNkl0Gr0hSK7w31yFwiOQATXrQQSR9ZklE3a9droobikS8YaV/sBkBGm24A==
X-Received: by 2002:a05:622a:211:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ffb48b6d14mr23047121cf.5.1767781809223;
        Wed, 07 Jan 2026 02:30:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm4330978a12.17.2026.01.07.02.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:30:08 -0800 (PST)
Message-ID: <0d6f8f95-01be-4fa3-9fde-bc00cbb894f6@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:30:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <zaf4uoms75wc7yvmrmqs53couefqsv5oie2hbiwvhitqonbs4u@aq6bcvf4nq3o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e35b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GKTbh6UPsD-Qk4FR_nEA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: t5Ir1ztT5bCpqENT8tQLGXawjmkybtlf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NSBTYWx0ZWRfXxDJpH+4eXhej
 L6fE17sD89hvgQOe71cg0TQqGvOPSeCHlY6xP/jLixgfKOzd6j0sXkLF598LoFyjw82SigJ8Hph
 Agn9pGusE+WxrGykbBd2C8Zt5i/7bCrex0IoYUcUagbk3wcU66b0Vhi1qWTnCVhqi60JNKsjpHK
 N/kpj79SQjJVB+2Jac6suNbiVucfYEtP3DbPa7/1Ke/lvTfah972co9twnd6y9y11NDz/bkQDub
 C5CYq4MXJcyBO3PxdBikMB/1QWQ14IgFCotCRAyS0AJWeZAa5jshNaf3bJnxkELztX62weJYL9y
 a/ujfZt2BWbAUxvXEau6yPf43KXrKADHD3Y4l2EO9KEFQPjFmHVD6fzEU0cfs22+qP+dSzBkxLU
 Jg0HQElwZYoNnB4XXlQy9tWhCqy+4hQIIGL5J6y+rs9smCb913IzM3aaZVtaafFaa+5ooibmTOb
 xrXkw93kffxTNyRpimA==
X-Proofpoint-ORIG-GUID: t5Ir1ztT5bCpqENT8tQLGXawjmkybtlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070085

On 1/5/26 6:20 PM, Manivannan Sadhasivam wrote:
> On Mon, Jan 05, 2026 at 09:31:03AM -0600, Bjorn Andersson wrote:
>> On Mon, Jan 05, 2026 at 11:04:44AM +0530, Manivannan Sadhasivam wrote:
>>> On Fri, Jan 02, 2026 at 01:40:22PM +0100, Konrad Dybcio wrote:
>>>> On 1/2/26 12:07 PM, Gopikrishna Garmidi wrote:
>>>>> Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
>>>>> in the pinctrl-glymur driver. Mahua shares the same pin configuration
>>>>> as Glymur but requires a different PDC wake IRQ mapping.
>>>>>
>>>>> Changes include:
>>>>> - Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
>>>>> - Define mahua_tlmm msm_pinctrl_soc_data structure
>>>>> - Update device match table to include "qcom,mahua-tlmm" compatible
>>>>> - Modify probe function to use of_device_get_match_data() for dynamic
>>>>>   SoC-specific data selection
>>>>>
>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
>>>>>  1 file changed, 40 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>> index 335005084b6b..bf56a064d09c 100644
>>>>> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
>>>>> @@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
>>>>>  	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>>  };
>>>>>  
>>>>> +static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
>>>>> +	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
>>>>> +	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
>>>>> +	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
>>>>> +	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
>>>>> +	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
>>>>> +	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
>>>>> +	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
>>>>> +	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
>>>>> +	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
>>>>> +	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
>>>>> +	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
>>>>> +	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
>>>>> +	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
>>>>> +	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
>>>>> +	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
>>>>> +	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
>>>>> +	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
>>>>
>>>> Over the "common" base, Glymur has GPIO143 (PCIE3a_RST) and Mahua has GPIO155
>>>> (PCIE3b_RST). Both SoCs GPIO maps seem to contain both, but Mahua has a _unused
>>>> suffix for the missing 143, which makes sense given the bus isn't bifurcated
>>>> there.
>>>>
>>>> The _RST (PERST#) pin is driven by the SoC so I don't think it's useful to
>>>> have it as a wakeup source, unless someone decides to connect something that's
>>>> not PCIe to it (+Mani)
>>>>
>>>
>>> PERST# by definition is an optional reset line, but on most of the *recent*
>>> designs, OEMs always connect it to PERST# line. So practically, I don't think it
>>> make sense to mark this GPIO as a wakeup source.
>>>
>>
>> This assumes that all the OEMs uses the particular PCI instance. If they
>> choose to route this GPIO to some other use case, they would have to
>> figure out that we omitted one entry in this table and patch it with
>> the appropriate data in order to have their GPIO wakeup capable.
>>
>> Wouldn't it be better to put the correct information in this table at
>> this time? If we have a concrete reason not to, I think we should
>> include something useful in the commit message to help the poor engineer
>> faced with this task...
>>
> 
> There is no concrete reason actually. I just mentioned that in practical
> usecase, I never saw an OEM routing the PERST# signal to other wakeup capable
> functionality. But the possibility still exists, so I'm not completely against
> it.

I'm curious whether we can just describe the union of these sets as a
common config, because as I've mentioned, IPCat says both of these platforms
seem to have these interrupts wired up

Konrad


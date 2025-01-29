Return-Path: <linux-arm-msm+bounces-46511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF244A21E39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CED5D3A5234
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 13:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3571722EE5;
	Wed, 29 Jan 2025 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+sJ1EAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA302C9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158917; cv=none; b=fbf1brt4en1h0bBSOAM/E43xHV6I9Rp6DN6BY6yEyJ/bMTQolUysrgNZhdr/rBd5vqXeQlyTkYqR4mCVpAE5L+vfXm5XsZvwKc5UmC07l0WVTqCbrjh5QWTnEIadV1kZS3DFykZcMSuMSiqFvTCKnHRCeCivV4U3G4IsZhTjH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158917; c=relaxed/simple;
	bh=lETp02w6G4e9sQreIPAufbuAdsCCC0PcXcRshUPYulE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5z0GGeL8Ir/+I/8sd6zpP2jFYbUbjBFlew1huMYxwsJ8YQv7ut/GK5Y8QIF2ap+VFyAGeWR8Tu1r0xZ8P1zWW0ovh12rkbudLzVrI/nMJwpfYZlYzgyEvlOpHTPNQq/OBiK2011amBwzO9tg/Gr5hRNNusd6w2cko2y0LCMEPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+sJ1EAG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TB4ZRJ023881
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dDM4l4A01vgW4W3wH6ZzPPuXjzt5f4t6sjOFKNxf6g=; b=O+sJ1EAGjhX5R+Yr
	byhOuPosKM+vSTIKDegpXH/fpENV7HWbEM3BkFJDK6kpaMd6xTsiVUltzJHGa/EW
	Br32bdGffUqbBDNkZUNnTCUUcbVfC1fDbz8GCZVi3AZ6J8J1m5BzLjMzdRI0lm+y
	OObHitVvsdj1NissLjHXT1YhJAc9V0Zgf0kQvvZ/Y5HqMLWLyuJoduBNIJBAclA6
	LvQh16gYU42hIq6+nc6Q3aCilWmeSE/6YeyiyA0UmbQhor/VCA9w2V4+hR8S+k8L
	J4cFK83WuaO5mg4Rm8F7VJ54EjDuAHtaGzbwUoe8mrNJhlEh/m99HxOf26nrEaft
	x4oQUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fk5009kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 13:55:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e20cb2ce4bso6720266d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 05:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158913; x=1738763713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dDM4l4A01vgW4W3wH6ZzPPuXjzt5f4t6sjOFKNxf6g=;
        b=TXa6bl4g8bqzExZA9vud5bXybH9cR24b1PqIK35+k60g2V3r4OJ+xaE86ktrJajbfT
         U/i7acNuKxnvHn7IVR/h4vQOCxgmWm1LEJMBF5FkbA6e580kY41QKn2o6gtagoJOtxKr
         t5NL/pLekyC4oEsWoJ2aQMy4WmRP/ZeBo8Y9t8xltynNPFW4hC8dozdfcTf2llbjXl3y
         kWwNTkR52jj3H0R7yh9p16nOGBh8720KGowZam57ockXF6RbM0LHJAf+n8INWgzldpKm
         IFd+QXLFE8u7Ldg4eRwMgiKdKcbmdrpLcip0Jmn5J/fUCZbzutDa43TYa6sl+zXxhqBR
         2Avw==
X-Forwarded-Encrypted: i=1; AJvYcCWygyUztq2BQeLIpPnh33PaEbKXbgrtFbmM7E438vp2N+mLo+EDt9HiJ6YwqoPgZYQHe8ejphvkbNc8wuN2@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjsTll/4GJix8RAydWNytaWQlQ7Kt99qwVJPPHUvWhz3fFs1L
	OeSafdLKo7UGaYJEWeOJkX6+iXabWlbRYwnkCw5WzRLmZ2TbAtlGNgtww2UheHH5DnteMZSIrJ0
	z2EAoQft9oizR+m7U/uP5V9WY6+k7mEW2RciwIJZ7SsYG9D5tgJGd6x17Rf1H8/XQ
X-Gm-Gg: ASbGncs85PXfX59S6mXga1uqYD3ojMCWFL2lvgJj0zwDQX/472Qsrw2+SGrdlh3Ge/n
	I69FKIrWRqXWFknaOnyQOeLMOYnVyHbmKlyHyBtauP/DmQwdfQLO/fZ+xEjod1rHyQxW0PMXvZf
	/zNHEG19lg8501eud87LP5di12zlaEX5nsA0WgQI36ob3sD7voLijUnhCxQpCZsgUfpR2PLRjzJ
	wRnuInmALACnieTgbDLe6AMT0JaVmDDc5rM6hHPoTz66cYvvflCTLv2sjqQ/vIu6meyJuo5Hu3p
	1BBapxhaP0H4LcXQwVUQQ+7g2m23wE48CPVC+/fkyNPVuSb2oZcY4mstgzo=
X-Received: by 2002:ac8:59c6:0:b0:467:7472:7acd with SMTP id d75a77b69052e-46fd0a0e997mr20342061cf.3.1738158913240;
        Wed, 29 Jan 2025 05:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgDFN3FWGK0Cp32zWvVSb+bQjohrw9wNA3S+kT4GTMDSGpABs5NX1GA97QBkm8RY2DfXiaUw==
X-Received: by 2002:ac8:59c6:0:b0:467:7472:7acd with SMTP id d75a77b69052e-46fd0a0e997mr20341761cf.3.1738158912736;
        Wed, 29 Jan 2025 05:55:12 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e5ca68sm983067766b.38.2025.01.29.05.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:55:12 -0800 (PST)
Message-ID: <aaf02ae5-4ae8-4571-934f-2c95de9d7e4f@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 14:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: neil.armstrong@linaro.org, Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, p.zabel@pengutronix.de, abel.vesa@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250121094140.4006801-1-quic_wenbyao@quicinc.com>
 <20250121094140.4006801-3-quic_wenbyao@quicinc.com>
 <CAA8EJppXQpDrdXzJsTE7HWs=POt7yFAw0JVZFabN6Ks3fhZiWQ@mail.gmail.com>
 <a2cc5a5a-6cbd-7564-a8df-8af2a652de2f@quicinc.com>
 <ya27ma6iah7ts6sj35payj6ek4z7m6y5v4pnxd6wtqrp3cbyta@ypvrzwa4bnfv>
 <188a9efd-718e-4ac5-b89a-29f2713e1dba@quicinc.com>
 <20250124070829.oar3hlkshkpam57d@thinkpad>
 <88c29161-17a8-40c6-a94b-c894de15ca37@oss.qualcomm.com>
 <df1f825f-66a4-4bab-9ca4-90d594f2cb36@linaro.org>
 <d928e662-07ac-4255-8d6f-adeaefb3db46@oss.qualcomm.com>
 <9d489930-9d2d-4b71-9b21-9c7918257b7c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9d489930-9d2d-4b71-9b21-9c7918257b7c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uFnJPWoe1NJKAGhRhFFmsqEep9hgHrat
X-Proofpoint-ORIG-GUID: uFnJPWoe1NJKAGhRhFFmsqEep9hgHrat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290112

On 29.01.2025 2:41 PM, neil.armstrong@linaro.org wrote:
> On 29/01/2025 12:29, Konrad Dybcio wrote:
>> On 29.01.2025 9:29 AM, neil.armstrong@linaro.org wrote:
>>> On 25/01/2025 14:10, Konrad Dybcio wrote:
>>>> On 24.01.2025 8:08 AM, Manivannan Sadhasivam wrote:
>>>>> + Mayank (with whom I discussed this topic internally)
>>>>>
>>>>> On Fri, Jan 24, 2025 at 02:22:01PM +0800, Qiang Yu wrote:
>>>>>>
>>>>>> On 1/22/2025 5:43 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Jan 22, 2025 at 03:17:39PM +0800, Wenbin Yao (Consultant) wrote:
>>>>>>>> On 1/21/2025 6:36 PM, Dmitry Baryshkov wrote:
>>>>>>>>> On Tue, 21 Jan 2025 at 11:43, Wenbin Yao <quic_wenbyao@quicinc.com> wrote:
>>>>>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>>>>
>>>>>>>>>> Currently, BCR reset and PHY register setting are mandatory for every port
>>>>>>>>>> before link training. However, some QCOM PCIe PHYs support no_csr reset.
>>>>>>>>>> Different than BCR reset that is used to reset entire PHY including
>>>>>>>>>> hardware and register, once no_csr reset is toggled, only PHY hardware will
>>>>>>>>>> be reset but PHY registers will be retained,
>>>>>>>>> I'm sorry, I can't parse this.
>>>>>>>> The difference between no_csr reset and bcr reset is that no_csr reset
>>>>>>>> doesn't reset the phy registers. If a phy is enabled in UEFI, its registers
>>>>>>>> are programed. After Linux boot up, the registers will not be reset but
>>>>>>>> keep the value programmed by UEFI if we only do no_csr reset, so we can
>>>>>>>> skip phy setting.
>>>>>>> Please fix capitalization of the abbreviations (PHY, BCR) and add
>>>>>>> similar text to the commit message.
>>>>>>>
>>>>>>>>>> which means PHY setting can
>>>>>>>>>> be skipped during PHY init if PCIe link was enabled in booltloader and only
>>>>>>>>>> no_csr is toggled after that.
>>>>>>>>>>
>>>>>>>>>> Hence, determine whether the PHY has been enabled in bootloader by
>>>>>>>>>> verifying QPHY_START_CTRL register. If it is programmed and no_csr reset is
>>>>>>>>>> present, skip BCR reset and PHY register setting, so that PCIe link can be
>>>>>>>>>> established with no_csr reset only.
>>>>>>>>> This doesn't tell us why we want to do so. The general rule is not to
>>>>>>>>> depend on the bootloaders at all. The reason is pretty simple: it is
>>>>>>>>> hard to update bootloaders, while it is relatively easy to update the
>>>>>>>>> kernel. If the hardware team issues any kind of changes to the
>>>>>>>>> programming tables, the kernel will get them earlier than the
>>>>>>>>> bootloader.
>>>>
>>>> We're assuming that if a product has shipped, the sequences used to power up
>>>> the PHY in the bootloader (e.g. for NVMe) are already good.
>>>>
>>>> If some tragedy happens and an erratum is needed, we can always introduce a
>>>> small override with the existing driver infrastructure (i.e. adding a new
>>>> entry with a couple registers worth of programming sequence, leaving the other
>>>> values in tact)
>>>
>>> Assuming Linux will be always ran directly after the bootloader is a wild assumption.
>>
>> Situations like
>>
>> [normal boot chain] -> [... (resets the PHY and doesn't reprogram it)] -> Linux
>>
>> are both so unlikely and so intentional-by-the-user that it doesn't seem
>> worth considering really.
> 
> In embedded/mobile/edge world, definitely, in compute/PC-like market, not really.
> 
> You'll have people add some custom bootloaders, hypervisors, who knows what...

I see, however you actually have to intentionally assert the non-NO_CSR PHY
reset from said custom bootloaders, hypervisors and whoknowswhats for the
programmed sequence to be erased. So I have no idea what the issue is here.

Konrad

> 
>>
>> If whatever sits in the middle *must* hard-reset the phy, it can save the
>> register state beforehand and restore them after the reset
>>
>>> Yes, we should make use the noscr if the PHY is always programmed, but we should be
>>> always able to reprogram the PHY entirely to recover a faulty programmation.
>>
>> We aren't considering any possibility of faulty programming - it's either
>> programmed, or not. And if the values configured by the bootloader are wrong,
>> the device's firmware is considered faulty.
>>
>> Most devices probably follow the exact same magic values as our reference
>> boards (though these values relate to analog characteristics, so perhaps not
>> *all* of them, which is another argument for keeping the BL state) and these
>> are extensively tested internally before any production devices make it out
>> the door. Any updates deep into the product life are most likely just "nice
>> to have"s and not anything critical, and as I've mentioned, we can still have
>> overrides with the current logic inside this driver.
>>
>> Konrad
> 


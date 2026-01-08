Return-Path: <linux-arm-msm+bounces-88055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B23D03B44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47F6A32DEBE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8D63C1FDA;
	Thu,  8 Jan 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TnHFKNCV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQtrDOaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67215392C28
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865449; cv=none; b=pltpIKCnMfxwkgzHGzTsBoP5lJNt/vf2RIFiinFFU6zxMBXSwUxlw4IsUaYYJyiL0PF4h5OmUfWK18CXiAogklToX/DlJ18IIr5heP6Zp/fMCif++dHfhWIeilVEJyNwbe/v9BmYG5bUIS22fzdkSKxJnAgVHk9hlv3QvRldeTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865449; c=relaxed/simple;
	bh=EaOLDkGoTefEky/NuzjO//oMkSubroe0L7w93jOQv0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZ718jzr5aecQX+pZXUr3LZ+aXmgtRmiZeld7QH/CVWqpB9Psocpi4lGr/OpPmxNMx9tuFRNXQAUAB2dDoAomDHsOlnG5/K9YFTed0PdNWBUUsqv94uIcMd4rwFvaPinfjrUTm5vMrMVL3kH1UMrEWHq84eZemx6aaDTAuU0/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TnHFKNCV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQtrDOaf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088Osk22239380
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=; b=TnHFKNCVpjP7QQwP
	q/itYudfrtE9JK4odnA9oesUL9wCgxB7umvdi82dswmFdW4DBiEBKimPStLoGkr3
	bozxmndHF6KE1KZSNhHhb3fk2U/Z6unhDh0eZSksK6l3xLffJ3Sl1dN9OeNLENpT
	FGwaGsRquxE7WJ/kT0rKrLO0IDT2bYtIAcRu8uU8uRj9Zz2dl2l9J+HEdClN+ntE
	U8kalwfPdZRNqv3qybo1pA1PTkdz/C140AtvIw7g22DzJfRiIVRiK0KEtjnAYCxn
	ihk43mIJeeED1d2mQDx7M9XDa2gIdImJ5JNRNoCysDfA9THd5BknimTYXNR78TBK
	oKZZFA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg3g22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:44:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b99dc8f439bso3527151a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767865440; x=1768470240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=;
        b=eQtrDOafw7+VCd02oTnrVxiCDQYWhQ3l4OJqwHGSHjA9LAxiMWDs9Sr7euv+I1T0kJ
         exj3UvFWiJfzeBpugtnUaMmNKDa5TfDTEd1orlE1EdSGTd1ZzIf1ocpYnE+LmzbE3zlT
         S6acl+BsrGjtEJT3JzWO00TO0Q5zDyonT2aOuMEPEUamhlFoBPIOdRAXuNCY1/ICBSI8
         5dEEyp7NbBSFNwrvBFZU61oobKl1FiQSxvl5YIwWGvjaOW9FKJz2b7vswRGegi6QXANC
         woXw14IXjszIdrYBUalT2CAit7721Ehf0Lo9Vz7zauXULM9erTuBLPFtS65j9UwgE9eN
         tkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865440; x=1768470240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M8PsJS3mXfr6k2RfWjXcrwIasndUjM0VPVwIaU/S4M=;
        b=hjZ1DyE2xVs6laKtN+z1efZO62id3gUaTGwFDWlb79hVvpaaapmWQcHg0EyQJUv0S+
         GPNmXyGFgd/jdS3yfJN8v1MOMkujnY00Kiy9vJSgPS7q5wbACruubRiUU5a29ZZqShRO
         WormohlOwlFgAqP/3OYGxLV2ErLydgxh3dzm0dfG4DqWFY383iSz0gOYrJssoVv5DSKQ
         gIMBmPACGKswP855ybag5qv7+TUqsV5uDeM2952FhAZ4G8Pxeh6K3zE683Rz6LjCKHE7
         o9g5oRJtNXBsdyFMYWRHBKjF5p1oM5teigPtq78lDGO9mlcZJuHPvRSCXt0RwTVRgJi+
         2PLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfZmgtXCCwyExhAXtEtySAae9E2JOZuqNaWyrLD5yVB01Z8MwMjptPVzCrTzfG0TD6n6phl+57r7wcz0PH@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmf2pv6LH6jsBGrLOK8eVK1eZ1b1Z9RR331Bonnat6R+glyjt
	uuAm08Ty84HdV/+bzQ/PqYpQMjUoSvhJD+dJ8Ik76o1o9S2jZs5Rk5FKJc+y1LDE8qnxzVUcFKu
	zhXHRCiUQckjPQUOQliJqErEZV2QcCHzZttDN5rkUlsfTje2FYUSPfgca5PvKhAnTnDgi
X-Gm-Gg: AY/fxX7NHqrlfrs3tBYKJqZ7I0WNr+flaL5xqaYla86EydZsHxMkLGufZOM2eQzIYcS
	ogHxTaAc/5WEhRVJznrtsEfFfomOec62ZEILGz5WCqOKHXe0k2AJboDFOVtAo8tMkUiPbkK4uqX
	eOF0LbqJkGgu1r33gN03TBn9KSE2ZA7QIKQbX3/c35dRbpYYeCQNFZdEBNEEQauZpQgnudZMOTR
	TTIdXIYj4z5/BRYyfR92H5G6zHMfJOyaoFUQW26HrdJ7JX2kQ15pr1F+1z5/ypKQIzQeWh442/f
	s3O4kB0Nx386UTDeY2+sjj3+GaACQWrUKnwWb+X37yqewH+aK+JhTwRIYfFYua9PhBWxG5SChqc
	UdgyxXvDGQBAdiC4zSX9P37JHPveD+WLFv8fU6zOPs6BzY0wrKX9Ms84IkHYM6uKJx7w3/udBJr
	SbIx1QsvMiC3SwrwcUSpx9iKfGZvQ=
X-Received: by 2002:a05:6a20:1585:b0:366:14ac:e209 with SMTP id adf61e73a8af0-3898fa65f3amr5482057637.71.1767865440393;
        Thu, 08 Jan 2026 01:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4Co6md478Bni07LU4UJf1qlULZ9dhIAUPNNon9u4U6HztgO1NmE+JxLoEEQ4fc/5D13ilpA==
X-Received: by 2002:a05:6a20:1585:b0:366:14ac:e209 with SMTP id adf61e73a8af0-3898fa65f3amr5482035637.71.1767865439877;
        Thu, 08 Jan 2026 01:43:59 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm7461139a12.23.2026.01.08.01.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:43:59 -0800 (PST)
Message-ID: <5151bdfe-7e83-4aa0-b9fc-28209d535e1e@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 15:13:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
 <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
 <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAMRc=McmvaM9=K=0NLRcLLmo5ck=m8Fqekh7tBMz6quO9K4opQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: xVCmXh-ZJz9rwhD0Tpcl6aQuMD9XBJKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2NCBTYWx0ZWRfX3IALOAE1MDqK
 0pQyfF2crhdXJVbEzf4QNgBVy3CMeKPFTlOWmnBL5yhUiFRwKnt9ZDDWooAFNvJabFTeNy0B6o+
 uVPNgxhsCq93Dr4rK3h9ycnfY4bZTDRfdRzrN3vT3ETh+oNMe/hhmtAbjy1+pJLVojfxBHoxrAw
 hpIZGEXLK9TsCZ5na3XE7R2AyB1ZbMTKUt/lkUg6iMF72bwBzHxLQ6sHZG6STycZuAGtl2q/UXI
 9zJ2NGvMapiJ5gOY8pA7WodIpl9D1MEJlHlI9LkW9LyJMqnfOjiPT3FdwKpNc5yilzrG902WCSt
 +ZW+Qyd5hAlhhUFMLWVH7dwCJKLy0e9ILenGWSGn7N+C7PRspkkdLvCKUCiBjHAnrRmqGsTuIG5
 t8jdRHTVZLwZqD+owUtk9JDZJQ5rrkMJSCDGxkQRM2l2ater+YHbTZyc6E/FdUzJZFxdil3zI11
 EVgglJmjuXDQvmcojJg==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695f7c61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3ijyyCfgxb-kCMGLBNUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: xVCmXh-ZJz9rwhD0Tpcl6aQuMD9XBJKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080064

On 1/8/2026 2:15 PM, Bartosz Golaszewski wrote:
> On Thu, Jan 8, 2026 at 7:49=E2=80=AFAM Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>>
>> On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
>>> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
>>> <pankaj.patil@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> Some qualcomm platforms use shared GPIOs. Enable support for them b=
y
>>>>> selecting the Kconfig switch provided by GPIOLIB.
>>>>>
>>>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>=

>>>>> ---
>>>>>  arch/arm64/Kconfig.platforms | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.plat=
forms
>>>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d=
8cb3fd0f29e277af94f20 100644
>>>>> --- a/arch/arm64/Kconfig.platforms
>>>>> +++ b/arch/arm64/Kconfig.platforms
>>>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>>>       select GPIOLIB
>>>>>       select PINCTRL
>>>>>       select HAVE_PWRCTRL if PCI
>>>>> +     select HAVE_SHARED_GPIOS
>>>>>       help
>>>>>         This enables support for the ARMv8 based Qualcomm chipsets.=

>>>>>
>>>>>
>>>> Enabling shared gpios is breaking hamoa and glymur boot on next-2026=
0106
>>>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking=

>>>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/j=
ob/24722#L3514
>>>>
>>>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.9109=
82] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_l=
ookup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace:=
 <4>[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    =
2.911030]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwn=
ode_gpiod_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x=
70/0x150 <4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]=
  platform_probe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.=
spmi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulator <4>[ =
   2.911043]  really_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_d=
evice+0x78/0x12c <4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[  =
  2.911049]  __device_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for=
_each_drv+0x84/0xe0 <4>[    2.911052]  __device_attach_async_helper+0xac/=
0xd0 <4>[    2.911053]  async_run_entry_fn+0x34/0xe0
>>>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  w=
orker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2=
=2E911060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 =
not found, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x=
20 <4>[    2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.91106=
5] qcom-pcie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3=
>[    2.911069] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed=
 with error -2
>>>> Reverting this commit fixes the boot on both platforms
>>>>
>>>
>>> Hi!
>>>
>>> This is not really the offending commit, it's a recent one in the
>>> implementation. The issue should be fixed by the following series[1]
>>> that will be in the next next tag. Can you give it a try?
>>>
>>> Bart
>>>
>>> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091=
d2f7581@oss.qualcomm.com/
>>
>> With the linked patchset applied I still see the same issue
>>
>> Pankaj
>>
>=20
> Is the gpio-shared-proxy module available? If not, can you change the
> config to make it built-in like CONFIG_GPIO_SHARED_PROXY=3Dy?
>=20
> Bartosz

With CONFIG_GPIO_SHARED_PROXY=3Dy the issue remains the same


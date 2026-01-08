Return-Path: <linux-arm-msm+bounces-87996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C83DD014E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 07:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9DDC300305A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 06:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F1A2116E0;
	Thu,  8 Jan 2026 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUenZjAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWsZus89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A72FBE02
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854975; cv=none; b=OhuDwNGb+Nevf/8wSKTRgL4hKckYZxsGnaUhfpsUaicAdFPiBqX9tpYYl0GaXOXBnJ0EXE7rFo9pT2CeOgNwjJAROu9LsOVK/ak+e7s6UhpTZReA+AMpLQqAXsPMCB2kmteKL4/5+uYr5x+m7984zA3ec3XnL1RIhnRky2BE/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854975; c=relaxed/simple;
	bh=oGnBvdCUeJHZCq8sF3f7mVtn5T3/f7oioutUblXEixs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbxXD0Uh2gv3bjEEl512DwKrb54NFe5nqYZZ1FbcRbTJ4Qy0LmCabauq34mpOEk0jcCXa9vwLrayt3hwHVuXdx/7sYEXpCbxAidI4/tlhOZrFH6/xJJTBJ2Krpr3eHWkybBGZ6lYfsa9XXb10SuZn82HHszistyWi2plFPd2md8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUenZjAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWsZus89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084RTeE3672967
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 06:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=; b=ZUenZjAU0swzmpON
	v9hwK34UB72PTyx19jiQaAweV0EUY+7ETCaUH51uyaZwlCNOY3lvMhvrsvwRSuTO
	62Ws1kq0CjhtyqIb7kWun0PIMvgK7IZlNaoaQTubw4gJrZAu1xSxm8h346emU+Ds
	5XMJYjlNhUO7ooIkC9dGEfQVD3u5bb+5AXDFgli+8OwhHOH04TyhLnjYqNsHrvyu
	rVZXj7J8F05DZHKy8S+MqmCvQX+eOWpicjVCvoi1RaJki46sJN+n00ktvN1pPX7+
	OJvLY8a9FCbsHNqFVJongXbVURD0/ZsFFjzgpfqdcFkUcAMoVYmKI65aQharB5UE
	Up/qHw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum523k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:49:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bce224720d8so2893339a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 22:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767854966; x=1768459766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=;
        b=AWsZus89j+wFddCMz0SMTQPx4PQRvSSwkFt2CgeiHC+hm6Fkfe7hHrGZt9I+R/Frxn
         AsrrUjrqbWQUViBIbky0ihxoq1Kvpu4HJXreHZxHraws6NjkYsZ/e3FZTghQWH3fQntN
         oYP3XCq+SFyaLCPEZS0HdZyjSxy2vveKQLCyI4w6V/cOsrnW/hXjtLOiv/0e1atZ45TX
         MU17htLSMC2MbRPSQ1pHTUUEVhmYZ7HlfcqHtCJiflgjoLqOEOjTmSQjzFA9OBlHPdbS
         FSXMGSZWPLlRQP9S5Iw++4GJ5SCJSUrLtWdNeBmnoz81xtEWr0FP9h78sSIjupq2vSkJ
         tQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854966; x=1768459766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=;
        b=Gp/g0mamCO3WEsMlxa/xdW7tuGCGtT5OJJVn5Uo5Mrvd1tgWWHEIHs5x65HSzdXEBq
         orbI6sf47LARaR2baw4bEcIdNnt682K9Q8I2OIekFkEY1NkwyL5hss6UivyXUB4WaWnX
         Sbky/hNSpiBC+/Pjd2TkJUG0Xw1yZvYqUHtfAY9D4WHrs15ntccD/877K6xP7vJwDTM5
         mD6DWFl9/npfcACSM20rPRrVBSSXSlEGw6HIbJwXssd0aFbxEI8UbUpqUPoy4kGtOTTX
         yPEllJOIFxHLqSn/vjZmEhRLFiOfM85pBLEs0VyP34WQBj4gr8jc7G6pH5XRXbS7X+BS
         RDVA==
X-Forwarded-Encrypted: i=1; AJvYcCUwpj85cr89G+mqnD8Jxk/ESwFOaECfpNPmP2V4RxlqRx4x6phLzhnE1pyPLGRgi68PQL1g+xNXnMUwE1pV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAuBHP9qadTnzTEnCD7XdjCMhg5ERXx2aCXrc1UZYjHua6ikxX
	AqRzJY/nKLr72ASBT28rX8d6SG+i/2KpzojIBlKn7wVdRi3dSGHBIpEiD5eae3l02ycmkvFxhkq
	vLaZ8izyY0/81wA4fPZZXrXXWwVVnW5bTPVcd/d1eUiLYii91D8ifuAbi48BTL03BiC9y
X-Gm-Gg: AY/fxX6t5Ofr6m9pxLFTkzSADav+RxqMz5ClnDhdpEID9av+p/ZyyV85J6MWobeDYIE
	tdgrVOVufIBLyihgJU+LnuL72fafA/dw3omgdDm0G1aSXDnp+KtVwhFDGGv0taPfRKA0uoitFHE
	EQ4wQL96l32kR5pb2ViMDiIVVyjWkDndpSNb7Z4IPqrjsKbijzxDxf7JJwmZk5XTAzgiqOGK+X/
	ck/K81exWJS/Ks0WekGWMM7K+0mnpQwbQbk8yxLZfVA+u/Lnb3JfOcUnzDHPolnk0/jUnyNT7IJ
	0aCkwwg/l2QptIa2HCGDzOQOzqknh2DDeRVxg0TCpse6NgKRlO09+ElZgsMwDy+GuW7bn67nF0s
	IXvXD0AMqVgM7w2FScA7dgkUtaYJ0qrOIELQ5hJ07v+BzBtsC62jNBPQSMLYmuiWJhOAToNGqqZ
	kVM9prql+9PeTr8FsxIoHzn6M0/Ac=
X-Received: by 2002:a05:6a21:32a2:b0:366:14af:9bb7 with SMTP id adf61e73a8af0-3898fa087b6mr4665352637.65.1767854966473;
        Wed, 07 Jan 2026 22:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa2SdPaKLqYb+HLrRZM9A6ohxX3cBE+s5ZZnWlaUs2rO6QVISa1iEsyIT/QJ73LDsxfm5vzQ==
X-Received: by 2002:a05:6a21:32a2:b0:366:14af:9bb7 with SMTP id adf61e73a8af0-3898fa087b6mr4665331637.65.1767854965984;
        Wed, 07 Jan 2026 22:49:25 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm6894788a12.23.2026.01.07.22.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 22:49:25 -0800 (PST)
Message-ID: <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 12:19:20 +0530
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
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: rkrhmAKDD7eLdUaj7DmI3wFsng-LU9S7
X-Proofpoint-ORIG-GUID: rkrhmAKDD7eLdUaj7DmI3wFsng-LU9S7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MyBTYWx0ZWRfX2afeKP6peNJD
 bGfAhbvbhAutPLek4rDw5MTJxIWWmCytiBwJmyFSUcg/Q9MB/Rc40g1MWEo2CUfX8COX1zyMnKx
 2pIpp9MiUEEU6/ULuxpvFGeawIzQeNPPvJb4qQiS+OM8z94tiqvQq4D7XQfJd8bde3yhjICwq9B
 t7i+NlWvwWypYhxq+tTSmjoLH0jw17ywSoR587/npWNJNwb65BWdAgJ6OaJ4mYaUnK2P6+SWlQD
 /NC8BGflvXo92VAXzx0pTKNrPxXRHJLvY0y8WO/cW4yEVx6gNBT9LBUqCGkceTA00HpVqIRk6kp
 xzs3KKpTc2GCl6B+s+p5tU32CKG68JSe5h/bHZ15QbEmSS6xX6/jdHo30QxW2QBPwT/AvWJ+ahD
 pzlys/G+X+rSgeB6OLu6TR2VKWgNBG6WsALBslnLadU2SFIDou4pjM1GiwBl1FJfxuf8CpcI1lg
 zd6WU0BYTL7oqzhnddQ==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695f5377 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3ijyyCfgxb-kCMGLBNUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080043

On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>>
>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Some qualcomm platforms use shared GPIOs. Enable support for them by
>>> selecting the Kconfig switch provided by GPIOLIB.
>>>
>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>  arch/arm64/Kconfig.platforms | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8c=
b3fd0f29e277af94f20 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>       select GPIOLIB
>>>       select PINCTRL
>>>       select HAVE_PWRCTRL if PCI
>>> +     select HAVE_SHARED_GPIOS
>>>       help
>>>         This enables support for the ARMv8 based Qualcomm chipsets.
>>>
>>>
>> Enabling shared gpios is breaking hamoa and glymur boot on next-202601=
06
>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/job=
/24722#L3514
>>
>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.910982=
] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_loo=
kup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <=
4>[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.=
911030]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnod=
e_gpiod_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70=
/0x150 <4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  =
platform_probe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.sp=
mi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulator <4>[   =
 2.911043]  really_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_dev=
ice+0x78/0x12c <4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[    =
2.911049]  __device_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_e=
ach_drv+0x84/0xe0 <4>[    2.911052]  __device_attach_async_helper+0xac/0x=
d0 <4>[    2.911053]  async_run_entry_fn+0x34/0xe0
>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  wor=
ker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.9=
11060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not =
found, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <=
4>[    2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] q=
com-pcie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[  =
  2.911069] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed wit=
h error -2
>> Reverting this commit fixes the boot on both platforms
>>
>=20
> Hi!
>=20
> This is not really the offending commit, it's a recent one in the
> implementation. The issue should be fixed by the following series[1]
> that will be in the next next tag. Can you give it a try?
>=20
> Bart
>=20
> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2=
f7581@oss.qualcomm.com/

With the linked patchset applied I still see the same issue

Pankaj


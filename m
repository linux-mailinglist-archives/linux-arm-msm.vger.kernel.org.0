Return-Path: <linux-arm-msm+bounces-32901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B07198C519
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 20:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3A81F23D07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 18:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E631CC16D;
	Tue,  1 Oct 2024 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KckVN6oj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8549E1CB528
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 18:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727806176; cv=none; b=b2ypnDmYzbIZRGf92oQFpzfizXZJSSyesUkqMfkPA/6gkHCzEgWy08FzlwrND5G++XOPDhNgMW7HTK50HyTlcavWSooFuxTN2RyMbS9S0WWnX2hrwZ560MWEJ67J4Ie7daM4HTV0CPKm9UaoHm/891xK1/S/SAv3w7YSzCjW6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727806176; c=relaxed/simple;
	bh=9GSvMEl72LJuWwZy5OvJWatCHGl756fpkWNVAX2c+Iw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=p1f0MhMzbCRCRp76RF0j+OvUMdaiuLyarRdIQScXVDzzbYSo3NGMv7e+9r1EnM3EuXM7zV3o+qI0ZuizYPC5KHYZDWwQdn5yj1I4z59xigS2JTqswWVEQQkvvhPzF1l9//gClFYLyEnU0BjnliUyA6SjvCtKN4mLBKHQJXekbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KckVN6oj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53993c115cfso3139150e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 11:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727806172; x=1728410972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6EtF1/a9SA5SorCJxpOUjj0kuAp0K2SoCCYh6LWsvX8=;
        b=KckVN6oj4+tmFeEXJ//1akkrDRUBijOSA5Ovi34jEoLJr25vt8O59fnw0aYZJGxVYE
         rxk39otjh9cVAIhdcgnL611Qi0NsbvbDt1HpZIzPouKY3Lh7eJpQau78mjXV4aTVpZz2
         VK0xcBhs1of4lst9IOX169j4ekX1zlmqfakNQwWOCmb+HonW9jS6ENwOmNyVpLUz2ImQ
         nc1iRZlmXgbM/h93Xy81rdG8mZgmuZp+GeT172TXt/PLPVaYUcn4Dx1VSWEuEqbJAZ0C
         5CFMfmLGjr2jyS54oR+xaKt9fA6H7DZZPbNo5qYLH6OP5JFPK9vJXT9fgNF7MZb26Xiq
         qxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727806172; x=1728410972;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EtF1/a9SA5SorCJxpOUjj0kuAp0K2SoCCYh6LWsvX8=;
        b=RNTo/lXoQki7Q8Gv3CIAAv7Wt7I9i4IP7rgW5yRcxLWLhAJccrO/MlkW2G2mnydIMJ
         TZ+kdU3u9HTvYhjjAmVdfjdRRYZ32q02PgkCJSlSicKc6AtQg7yLO0iI9Yar8ixF5TIl
         zIxbA46ZXdUO+4TcCpRpKKmp2uWf9sirfaLk1ohQdn8CcoVMMvngaOnkqh14QcvRj6wU
         N53D3hW/yAGOvn9jZ4driNvUmPkNfO1zFAT2QYN83t5/jQ1e/dM28+dyIP7MUpaNSgSn
         A8S25l2J6L4c8sP8Zt2JAgQ4AByK7K/0GMUjidL2MgycV3/VTn9oaBcMriRYnlyB/5Gu
         mcoA==
X-Forwarded-Encrypted: i=1; AJvYcCUoXKHxe0xvfKoTtLpDHbfjyPFNhrIY5jWhjmPTWrukfmP4Csu06CqDRh2y3Iddho7MJ1zUJSC1WT0JN9gZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGHC1FdkMn4+ehva0GJAqvhsa+KDT2mOJif6GPhxWDKwjTe80
	n9fJcZBY1if1Z9Kf5dgkL4Gkj4ln9esnIYAqjA3FVw6+knvkPCePhKX1AOKwG54=
X-Google-Smtp-Source: AGHT+IFdtZS7tvPqYUGKeafYPgFHMGNprDe9eWEjhbEpFlvhKZxz/aiffoi3kDRJ4Ap6K/kIrlUuPg==
X-Received: by 2002:a05:6512:234f:b0:52c:adc4:137c with SMTP id 2adb3069b0e04-539a0664df3mr185879e87.20.1727806171318;
        Tue, 01 Oct 2024 11:09:31 -0700 (PDT)
Received: from [127.0.0.1] ([37.155.79.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88240517fsm6551213a12.4.2024.10.01.11.09.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 11:09:30 -0700 (PDT)
Date: Tue, 01 Oct 2024 21:09:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 "Kemp, Bryan" <Bryan.Kemp@dell.com>
CC: Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Peter de Kraker <peterdekraker@umito.nl>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/3=5D_arm64=3A_dts=3A_qcom=3A_Ad?=
 =?US-ASCII?Q?d_support_for_X1-based_Dell_XPS_13_9345?=
User-Agent: K-9 Mail for Android
In-Reply-To: <d54d98f2-f678-491b-8448-0dd2be32aa82@gmail.com>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com> <20240921163455.12577-4-alex.vinarskis@gmail.com> <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com> <CAMcHhXohz6kquH_JT9eAKMntxxyjDt+oZUB_kfAO840oJ5=LPQ@mail.gmail.com> <PH8PR19MB7071756BFAFA1BA3E92AF3C09E772@PH8PR19MB7071.namprd19.prod.outlook.com> <CAMcHhXo7PNxoOs3BEhbS7v-hDqEZQSyQJnzHbpTMoRbeaunp3g@mail.gmail.com> <d54d98f2-f678-491b-8448-0dd2be32aa82@gmail.com>
Message-ID: <1A53A2B8-8FCE-49AE-983D-A4F8E91CF4BB@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 1, 2024 7:23:21 PM GMT+03:00, Laurentiu Tudor <tudor=2Elaurentiu=
=2Eoss@gmail=2Ecom> wrote:
>Hi Alex,
>
>On 10/1/24 19:09, Aleksandrs Vinarskis wrote:
>> On Tue, 1 Oct 2024 at 02:47, Kemp, Bryan <Bryan=2EKemp@dell=2Ecom> wrot=
e:
>>>=20
>>> Fascinating topic=2E First of all, thank you Alex for the explanation =
of your logic, and thank you as well for the work on the device tree for th=
e XPS 13=2E I understand completely how the Dell naming/numbering scheme is=
 confusing=2E The shortened version down to just the model number could als=
o be confusing=2E For example, there is an XPS 9520 as well as a Latitude 9=
520=2E The 9 basically translates to "premium" not a specific line of busin=
ess=2E For what it is worth, I would prefer the dell-xps13-9345 naming and =
I think we can have to be mindful to avoid a naming collision in a decade=
=2E
>>>=20
>>=20
>> Hi,
>>=20
>> Thanks for the input, it's really nice to have Dell's perspective as we=
ll=2E
>> That's a good point with latitude, I was only aware of 5XXX/7XXX
>> naming for that one=2E=2E=2E which I guess further highlights the confu=
sing
>> naming scheme=2E
>
>Yeah, completely agree=2E We will raise this internally so that in the fu=
ture we'll do a better job at naming platforms=2E

BTW, as we are discussing the new XPS, any chance that Dell might release =
HLOS firmware into the linux-firmware repo? In the past Lenovo did this for=
 the X13s WoA laptop=2E It significantly improves Linux user experience on =
these laptops=2E=20

Feel free to ask if you need additional details=2E


>
>> I will re-spin with `dell-xps13-9345` and `dell,xps13-9345`
>> respectively as proposed then, unless there will be any other feedback
>> on the V3 series before tomorrow=2E
>
>Great, thanks!
>
>Couple of points:
> - i'm thinking that maybe at a later point, as more dell platforms are g=
etting added, we can re-organize the device trees, e=2Eg=2E have a common '=
dell-xps=2Edtsi' which gets inherited by specific platforms
> - just noticed that the firmware paths point to something like "=2E=2E=
=2E/dell/tributo/=2E=2E=2E"=2E Should we reconsider these too? Maybe someth=
ing like "=2E=2E=2E/dell/xps/=2E=2E=2E" would be better?
>
>---
>Thanks & Best Regards, Laurentiu
>
>> Thanks,
>> Alex
>>=20
>>>=20
>>> Thanks again for the support=2E
>>>=20
>>> Bryan Kemp
>>> Architect - Linux OS Engineering
>>>=20
>>>=20
>>> Internal Use - Confidential
>>> -----Original Message-----
>>> From: Aleksandrs Vinarskis <alex=2Evinarskis@gmail=2Ecom>
>>> Sent: Monday, September 30, 2024 2:24 PM
>>> To: Laurentiu Tudor <tudor=2Elaurentiu=2Eoss@gmail=2Ecom>
>>> Cc: Bjorn Andersson <andersson@kernel=2Eorg>; Krzysztof Kozlowski <krz=
ysztof=2Ekozlowski@linaro=2Eorg>; Dmitry Baryshkov <dmitry=2Ebaryshkov@lina=
ro=2Eorg>; linux-arm-msm@vger=2Ekernel=2Eorg; devicetree@vger=2Ekernel=2Eor=
g; linux-kernel@vger=2Ekernel=2Eorg; Tudor, Laurentiu <Laurentiu=2ETudor1@d=
ell=2Ecom>; Konrad Dybcio <konradybcio@kernel=2Eorg>; Rob Herring <robh@ker=
nel=2Eorg>; Krzysztof Kozlowski <krzk+dt@kernel=2Eorg>; Conor Dooley <conor=
+dt@kernel=2Eorg>; Rob Clark <robdclark@gmail=2Ecom>; Peter de Kraker <pete=
rdekraker@umito=2Enl>; Kemp, Bryan <Bryan_Kemp@Dell=2Ecom>
>>> Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based=
 Dell XPS 13 9345
>>>=20
>>>=20
>>> [EXTERNAL EMAIL]
>>>=20
>>> On Mon, 30 Sept 2024 at 20:26, Laurentiu Tudor <tudor=2Elaurentiu=2Eos=
s@gmail=2Ecom> wrote:
>>>>=20
>>>> Hi Alex,
>>>>=20
>>>> Thanks for this! Comment inline=2E
>>>>=20
>>>> On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
>>>>> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E801=
00=2E
>>>>>=20
>>>>> Working:
>>>>> * Touchpad
>>>>> * Keyboard (only post suspend&resume, i2c-hid patch WIP)
>>>>> * eDP, with brightness control
>>>>> * NVME
>>>>> * USB Type-C ports in USB2/USB3 (one orientation)
>>>>> * WiFi
>>>>> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
>>>>> * Lid switch
>>>>> * Sleep/suspend, nothing visibly broken on resume
>>>>>=20
>>>>> Not working:
>>>>> * Speakers (WIP, pin guessing, x4 WSA8845)
>>>>> * Microphones (WIP, pin guessing)
>>>>> * Fingerprint Reader (WIP, USB MP with ptn3222)
>>>>> * USB as DP/USB3 (WIP, PS8830 based)
>>>>> * Camera
>>>>> * Battery Info
>>>>>=20
>>>>> Should be working, but cannot be tested due to lack of hw:
>>>>> * Higher res OLED, higher res IPS panels
>>>>> * Touchscreen
>>>>>=20
>>>>> Signed-off-by: Aleksandrs Vinarskis <alex=2Evinarskis@gmail=2Ecom>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>>    =2E=2E=2E/dts/qcom/x1e80100-dell-tributo-13=2Edts     | 860 +++++=
+++++++++++++
>>>>=20
>>>>=20
>>>> Could you please use the marketing name for the device tree file name
>>>> & machine compatible, e=2Eg=2E "x1e80100-dell-xps13-9345=2Edts" for t=
he dts
>>>> file and "dell,xps13-9345" for the compat? I'm thinking that this wil=
l
>>>> help people to identify it more easily=2E
>>>=20
>>> Hi,
>>>=20
>>> Even though I agree that it may be easier to identify for a non-develo=
per, I am a bit skeptical as Dell has a pretty weird naming convention whic=
h sometimes results in the name being non-unique=2E
>>> In particular case - 9345 - 9 stands for XPS series, 3 stands for 13",=
 and 45 would typically be the last digit of year + 0 (so 40), but with the=
 introduction of last year's ''13 Plus"series they added a 5=2E At present,=
 this is unique, however in 10 years it may not be=2E
>>>=20
>>> I have recently hit this issue when working on Dell XPS 15" 2024 (9530=
), which has the same model number as Dell XPS 15" 2013 and led to huge con=
fusions=2E Only way to distinguish them is by codename ('fiorano' for the n=
ewer one), or using a complete name including the year=2E=2E=2E The codenam=
e on the other hand is easily searchable both in the source code and online=
=2E
>>>=20
>>> I tried to browse the source code for existing notation, but didn't fi=
nd anything strongly supporting one or another way, so decided to follow Mi=
crosoft Surface's example with codenames ('romulus')=2E
>>> Codenaming is also imperfect though, as in Dell's case it typically re=
fers to chassis, rather than _the_ particular device, which typically lasts=
 several years=2E Typically throughout chassis generation internals stay +/=
- the same, but we can't know if any of the changes would be breaking=2E Pe=
rhaps then, `x1e80100-dell-tributo-9345` and `dell,tributo-9345` respective=
ly, as this would be the shortest yet most complete description? 'Tributo' =
already implies its XPS 13" and chassis variation (touchar, hidden trackpad=
 etc etc), '9345' implies XPS 13" of 2024 (?) and in combination with chass=
is variant pinpoints the model=2E
>>> Otherwise, if it's strongly desired to use marketing names it can be r=
educed down to `x1e80100-dell-9345=2Edts` and `dell,9345` altogether as
>>> 9345 implies it being both 'XPS' series and 13", and we can hope that =
by 2034 Dell won't repeat the same mistake with naming=2E Curious to hear m=
aintainers' opinions as well=2E
>>>=20
>>> P=2ES=2E I've sent the V3 version of the series, it probably makes sen=
se to move this conversation there for visibility=2E
>>>=20
>>> Alex
>>>=20
>>>>=20
>>>> ---
>>>> Thanks & Best Regards, Laurentiu
>>>>=20
>>>>>    2 files changed, 861 insertions(+)
>>>>>    create mode 100644
>>>>> arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13=2Edts
>>>>=20
>>>>=20
>>>>=20
>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile
>>>>> b/arch/arm64/boot/dts/qcom/Makefile
>>>>> index ae002c7cf126=2E=2E111c589d6bae 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>> @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)   +=3D sm8650-qrd=2Edtb
>>>>>    dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e78100-lenovo-thinkpad-t14s=2E=
dtb
>>>>>    dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-asus-vivobook-s15=2Edtb
>>>>>    dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-crd=2Edtb
>>>>> +dtb-$(CONFIG_ARCH_QCOM)      +=3D x1e80100-dell-tributo-13=2Edtb
>>>>>    dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-lenovo-yoga-slim7x=2Edt=
b
>>>>>    dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-microsoft-romulus13=2Ed=
tb
>>>>>    dtb-$(CONFIG_ARCH_QCOM)     +=3D x1e80100-microsoft-romulus15=2Ed=
tb
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13=2Edts
>>>>> b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13=2Edts
>>>>> new file mode 100644
>>>>> index 000000000000=2E=2Eec04b64f9558
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13=2Edts
>>>>> @@ -0,0 +1,860 @@
>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>> +/*
>>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc=2E All rights=
 reserved=2E
>>>>> + * Copyright (c) 2024 Aleksandrs Vinarskis
>>>>> +<alex=2Evinarskis@gmail=2Ecom>  */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +
>>>>> +#include <dt-bindings/gpio/gpio=2Eh>
>>>>> +#include <dt-bindings/input/gpio-keys=2Eh> #include
>>>>> +<dt-bindings/input/input=2Eh> #include <dt-bindings/leds/common=2Eh=
>
>>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator=2Eh>
>>>>> +
>>>>> +#include "x1e80100=2Edtsi"
>>>>> +#include "x1e80100-pmics=2Edtsi"
>>>>> +
>>>>> +/ {
>>>>> +     model =3D "Dell XPS 13 9345";
>>>>> +     compatible =3D "dell,tributo-13", "qcom,x1e80100";
>>>>> +     chassis-type =3D "laptop";
>>>>> +
>>>>> +     gpio-keys {
>>>>> +             compatible =3D "gpio-keys";
>>>>> +
>>>>> +             pinctrl-0 =3D <&hall_int_n_default>;
>>>>> +             pinctrl-names =3D "default";
>>>>> +
>>>>> +             switch-lid {
>>>>> +                     gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
>>>>> +                     linux,input-type =3D <EV_SW>;
>>>>> +                     linux,code =3D <SW_LID>;
>>>>> +                     wakeup-source;
>>>>> +                     wakeup-event-action =3D <EV_ACT_DEASSERTED>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     leds {
>>>>> +             compatible =3D "gpio-leds";
>>>>> +
>>>>> +             pinctrl-names =3D "default";
>>>>> +             pinctrl-0 =3D <&cam_indicator_en>;
>>>>> +
>>>>> +             led-camera-indicator {
>>>>> +                     label =3D "white:camera-indicator";
>>>>> +                     function =3D LED_FUNCTION_INDICATOR;
>>>>> +                     color =3D <LED_COLOR_ID_WHITE>;
>>>>> +                     gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
>>>>> +                     linux,default-trigger =3D "none";
>>>>> +                     default-state =3D "off";
>>>>> +                     /* Reuse as a panic indicator until we get a "=
camera on" trigger */
>>>>> +                     panic-indicator;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     pmic-glink {
>>>>> +             compatible =3D "qcom,x1e80100-pmic-glink",
>>>>> +                          "qcom,sm8550-pmic-glink",
>>>>> +                          "qcom,pmic-glink";
>>>>> +             orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
>>>>> +                                 <&tlmm 123 GPIO_ACTIVE_HIGH>;
>>>>> +             #address-cells =3D <1>;
>>>>> +             #size-cells =3D <0>;
>>>>> +
>>>>> +             /* Right-side USB Type-C port */
>>>>> +             connector@0 {
>>>>> +                     compatible =3D "usb-c-connector";
>>>>> +                     reg =3D <0>;
>>>>> +                     power-role =3D "dual";
>>>>> +                     data-role =3D "dual";
>>>>> +
>>>>> +                     ports {
>>>>> +                             #address-cells =3D <1>;
>>>>> +                             #size-cells =3D <0>;
>>>>> +
>>>>> +                             port@0 {
>>>>> +                                     reg =3D <0>;
>>>>> +
>>>>> +                                     pmic_glink_ss0_hs_in: endpoint=
 {
>>>>> +                                             remote-endpoint =3D <&=
usb_1_ss0_dwc3_hs>;
>>>>> +                                     };
>>>>> +                             };
>>>>> +
>>>>> +                             port@1 {
>>>>> +                                     reg =3D <1>;
>>>>> +
>>>>> +                                     pmic_glink_ss0_ss_in: endpoint=
 {
>>>>> +                                             remote-endpoint =3D <&=
usb_1_ss0_qmpphy_out>;
>>>>> +                                     };
>>>>> +                             };
>>>>> +                     };
>>>>> +             };
>>>>> +
>>>>> +             /* Left-side USB Type-C port */
>>>>> +             connector@1 {
>>>>> +                     compatible =3D "usb-c-connector";
>>>>> +                     reg =3D <1>;
>>>>> +                     power-role =3D "dual";
>>>>> +                     data-role =3D "dual";
>>>>> +
>>>>> +                     ports {
>>>>> +                             #address-cells =3D <1>;
>>>>> +                             #size-cells =3D <0>;
>>>>> +
>>>>> +                             port@0 {
>>>>> +                                     reg =3D <0>;
>>>>> +
>>>>> +                                     pmic_glink_ss1_hs_in: endpoint=
 {
>>>>> +                                             remote-endpoint =3D <&=
usb_1_ss1_dwc3_hs>;
>>>>> +                                     };
>>>>> +                             };
>>>>> +
>>>>> +                             port@1 {
>>>>> +                                     reg =3D <1>;
>>>>> +
>>>>> +                                     pmic_glink_ss1_ss_in: endpoint=
 {
>>>>> +                                             remote-endpoint =3D <&=
usb_1_ss1_qmpphy_out>;
>>>>> +                                     };
>>>>> +                             };
>>>>> +                     };
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     reserved-memory {
>>>>> +             linux,cma {
>>>>> +                     compatible =3D "shared-dma-pool";
>>>>> +                     size =3D <0x0 0x8000000>;
>>>>> +                     reusable;
>>>>> +                     linux,cma-default;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     vreg_edp_3p3: regulator-edp-3p3 {
>>>>> +             compatible =3D "regulator-fixed";
>>>>> +
>>>>> +             regulator-name =3D "VREG_EDP_3P3";
>>>>> +             regulator-min-microvolt =3D <3300000>;
>>>>> +             regulator-max-microvolt =3D <3300000>;
>>>>> +
>>>>> +             gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
>>>>> +             enable-active-high;
>>>>> +
>>>>> +             pinctrl-0 =3D <&edp_reg_en>;
>>>>> +             pinctrl-names =3D "default";
>>>>> +
>>>>> +             regulator-boot-on;
>>>>> +     };
>>>>> +
>>>>> +     vreg_nvme: regulator-nvme {
>>>>> +             compatible =3D "regulator-fixed";
>>>>> +
>>>>> +             regulator-name =3D "VREG_NVME_3P3";
>>>>> +             regulator-min-microvolt =3D <3300000>;
>>>>> +             regulator-max-microvolt =3D <3300000>;
>>>>> +
>>>>> +             gpio =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
>>>>> +             enable-active-high;
>>>>> +
>>>>> +             pinctrl-0 =3D <&nvme_reg_en>;
>>>>> +             pinctrl-names =3D "default";
>>>>> +     };
>>>>> +
>>>>> +     vreg_vph_pwr: regulator-vph-pwr {
>>>>> +             compatible =3D "regulator-fixed";
>>>>> +
>>>>> +             regulator-name =3D "vph_pwr";
>>>>> +             regulator-min-microvolt =3D <3700000>;
>>>>> +             regulator-max-microvolt =3D <3700000>;
>>>>> +
>>>>> +             regulator-always-on;
>>>>> +             regulator-boot-on;
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&apps_rsc {
>>>>> +     regulators-0 {
>>>>> +             compatible =3D "qcom,pm8550-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "b";
>>>>> +             vdd-bob1-supply =3D <&vreg_vph_pwr>;
>>>>> +             vdd-bob2-supply =3D <&vreg_vph_pwr>;
>>>>> +             vdd-l1-l4-l10-supply =3D <&vreg_s4c_1p8>;
>>>>> +             vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
>>>>> +             vdd-l5-l16-supply =3D <&vreg_bob1>;
>>>>> +             vdd-l6-l7-supply =3D <&vreg_bob2>;
>>>>> +             vdd-l8-l9-supply =3D <&vreg_bob1>;
>>>>> +             vdd-l12-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-l15-supply =3D <&vreg_s4c_1p8>;
>>>>> +             vdd-l17-supply =3D <&vreg_bob2>;
>>>>> +
>>>>> +             vreg_bob1: bob1 {
>>>>> +                     regulator-name =3D "vreg_bob1";
>>>>> +                     regulator-min-microvolt =3D <3008000>;
>>>>> +                     regulator-max-microvolt =3D <3960000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_bob2: bob2 {
>>>>> +                     regulator-name =3D "vreg_bob2";
>>>>> +                     regulator-min-microvolt =3D <2504000>;
>>>>> +                     regulator-max-microvolt =3D <3008000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l2b_3p0: ldo2 {
>>>>> +                     regulator-name =3D "vreg_l2b_3p0";
>>>>> +                     regulator-min-microvolt =3D <3072000>;
>>>>> +                     regulator-max-microvolt =3D <3072000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l4b_1p8: ldo4 {
>>>>> +                     regulator-name =3D "vreg_l4b_1p8";
>>>>> +                     regulator-min-microvolt =3D <1800000>;
>>>>> +                     regulator-max-microvolt =3D <1800000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l6b_1p8: ldo6 {
>>>>> +                     regulator-name =3D "vreg_l6b_1p8";
>>>>> +                     regulator-min-microvolt =3D <1800000>;
>>>>> +                     regulator-max-microvolt =3D <2960000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l8b_3p0: ldo8 {
>>>>> +                     regulator-name =3D "vreg_l8b_3p0";
>>>>> +                     regulator-min-microvolt =3D <3072000>;
>>>>> +                     regulator-max-microvolt =3D <3072000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l9b_2p9: ldo9 {
>>>>> +                     regulator-name =3D "vreg_l9b_2p9";
>>>>> +                     regulator-min-microvolt =3D <2960000>;
>>>>> +                     regulator-max-microvolt =3D <2960000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l12b_1p2: ldo12 {
>>>>> +                     regulator-name =3D "vreg_l12b_1p2";
>>>>> +                     regulator-min-microvolt =3D <1200000>;
>>>>> +                     regulator-max-microvolt =3D <1200000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l13b_3p0: ldo13 {
>>>>> +                     regulator-name =3D "vreg_l13b_3p0";
>>>>> +                     regulator-min-microvolt =3D <3072000>;
>>>>> +                     regulator-max-microvolt =3D <3072000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l14b_3p0: ldo14 {
>>>>> +                     regulator-name =3D "vreg_l14b_3p0";
>>>>> +                     regulator-min-microvolt =3D <3072000>;
>>>>> +                     regulator-max-microvolt =3D <3072000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l15b_1p8: ldo15 {
>>>>> +                     regulator-name =3D "vreg_l15b_1p8";
>>>>> +                     regulator-min-microvolt =3D <1800000>;
>>>>> +                     regulator-max-microvolt =3D <1800000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l17b_2p5: ldo17 {
>>>>> +                     regulator-name =3D "vreg_l17b_2p5";
>>>>> +                     regulator-min-microvolt =3D <2504000>;
>>>>> +                     regulator-max-microvolt =3D <2504000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     regulators-1 {
>>>>> +             compatible =3D "qcom,pm8550ve-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "c";
>>>>> +             vdd-l1-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-l2-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-l3-supply =3D <&vreg_s1f_0p7>;
>>>>> +
>>>>> +             vreg_s4c_1p8: smps4 {
>>>>> +                     regulator-name =3D "vreg_s4c_1p8";
>>>>> +                     regulator-min-microvolt =3D <1856000>;
>>>>> +                     regulator-max-microvolt =3D <2000000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l1c_1p2: ldo1 {
>>>>> +                     regulator-name =3D "vreg_l1c_1p2";
>>>>> +                     regulator-min-microvolt =3D <1200000>;
>>>>> +                     regulator-max-microvolt =3D <1200000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l2c_0p8: ldo2 {
>>>>> +                     regulator-name =3D "vreg_l2c_0p8";
>>>>> +                     regulator-min-microvolt =3D <880000>;
>>>>> +                     regulator-max-microvolt =3D <880000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l3c_0p9: ldo3 {
>>>>> +                     regulator-name =3D "vreg_l3c_0p9";
>>>>> +                     regulator-min-microvolt =3D <920000>;
>>>>> +                     regulator-max-microvolt =3D <920000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     regulators-2 {
>>>>> +             compatible =3D "qcom,pmc8380-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "d";
>>>>> +             vdd-l1-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-l2-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-l3-supply =3D <&vreg_s4c_1p8>;
>>>>> +             vdd-s1-supply =3D <&vreg_vph_pwr>;
>>>>> +
>>>>> +             vreg_l1d_0p8: ldo1 {
>>>>> +                     regulator-name =3D "vreg_l1d_0p8";
>>>>> +                     regulator-min-microvolt =3D <880000>;
>>>>> +                     regulator-max-microvolt =3D <880000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l2d_0p9: ldo2 {
>>>>> +                     regulator-name =3D "vreg_l2d_0p9";
>>>>> +                     regulator-min-microvolt =3D <912000>;
>>>>> +                     regulator-max-microvolt =3D <912000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l3d_1p8: ldo3 {
>>>>> +                     regulator-name =3D "vreg_l3d_1p8";
>>>>> +                     regulator-min-microvolt =3D <1800000>;
>>>>> +                     regulator-max-microvolt =3D <1800000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     regulators-3 {
>>>>> +             compatible =3D "qcom,pmc8380-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "e";
>>>>> +             vdd-l2-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-l3-supply =3D <&vreg_s5j_1p2>;
>>>>> +
>>>>> +             vreg_l2e_0p8: ldo2 {
>>>>> +                     regulator-name =3D "vreg_l2e_0p8";
>>>>> +                     regulator-min-microvolt =3D <880000>;
>>>>> +                     regulator-max-microvolt =3D <880000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l3e_1p2: ldo3 {
>>>>> +                     regulator-name =3D "vreg_l3e_1p2";
>>>>> +                     regulator-min-microvolt =3D <1200000>;
>>>>> +                     regulator-max-microvolt =3D <1200000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     regulators-4 {
>>>>> +             compatible =3D "qcom,pmc8380-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "f";
>>>>> +             vdd-l1-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-l2-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-l3-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-s1-supply =3D <&vreg_vph_pwr>;
>>>>> +
>>>>> +             vreg_s1f_0p7: smps1 {
>>>>> +                     regulator-name =3D "vreg_s1f_0p7";
>>>>> +                     regulator-min-microvolt =3D <700000>;
>>>>> +                     regulator-max-microvolt =3D <1100000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     regulators-6 {
>>>>> +             compatible =3D "qcom,pm8550ve-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "i";
>>>>> +             vdd-l1-supply =3D <&vreg_s4c_1p8>;
>>>>> +             vdd-l2-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-l3-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-s1-supply =3D <&vreg_vph_pwr>;
>>>>> +             vdd-s2-supply =3D <&vreg_vph_pwr>;
>>>>> +
>>>>> +             vreg_s1i_0p9: smps1 {
>>>>> +                     regulator-name =3D "vreg_s1i_0p9";
>>>>> +                     regulator-min-microvolt =3D <900000>;
>>>>> +                     regulator-max-microvolt =3D <920000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_s2i_1p0: smps2 {
>>>>> +                     regulator-name =3D "vreg_s2i_1p0";
>>>>> +                     regulator-min-microvolt =3D <1000000>;
>>>>> +                     regulator-max-microvolt =3D <1100000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l1i_1p8: ldo1 {
>>>>> +                     regulator-name =3D "vreg_l1i_1p8";
>>>>> +                     regulator-min-microvolt =3D <1800000>;
>>>>> +                     regulator-max-microvolt =3D <1800000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l2i_1p2: ldo2 {
>>>>> +                     regulator-name =3D "vreg_l2i_1p2";
>>>>> +                     regulator-min-microvolt =3D <1200000>;
>>>>> +                     regulator-max-microvolt =3D <1200000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l3i_0p8: ldo3 {
>>>>> +                     regulator-name =3D "vreg_l3i_0p8";
>>>>> +                     regulator-min-microvolt =3D <880000>;
>>>>> +                     regulator-max-microvolt =3D <880000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     regulators-7 {
>>>>> +             compatible =3D "qcom,pm8550ve-rpmh-regulators";
>>>>> +             qcom,pmic-id =3D "j";
>>>>> +             vdd-l1-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-l2-supply =3D <&vreg_s5j_1p2>;
>>>>> +             vdd-l3-supply =3D <&vreg_s1f_0p7>;
>>>>> +             vdd-s5-supply =3D <&vreg_vph_pwr>;
>>>>> +
>>>>> +             vreg_s5j_1p2: smps5 {
>>>>> +                     regulator-name =3D "vreg_s5j_1p2";
>>>>> +                     regulator-min-microvolt =3D <1256000>;
>>>>> +                     regulator-max-microvolt =3D <1304000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l1j_0p9: ldo1 {
>>>>> +                     regulator-name =3D "vreg_l1j_0p9";
>>>>> +                     regulator-min-microvolt =3D <912000>;
>>>>> +                     regulator-max-microvolt =3D <912000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l2j_1p2: ldo2 {
>>>>> +                     regulator-name =3D "vreg_l2j_1p2";
>>>>> +                     regulator-min-microvolt =3D <1256000>;
>>>>> +                     regulator-max-microvolt =3D <1256000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +
>>>>> +             vreg_l3j_0p8: ldo3 {
>>>>> +                     regulator-name =3D "vreg_l3j_0p8";
>>>>> +                     regulator-min-microvolt =3D <880000>;
>>>>> +                     regulator-max-microvolt =3D <880000>;
>>>>> +                     regulator-initial-mode =3D <RPMH_REGULATOR_MOD=
E_HPM>;
>>>>> +             };
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&gpu {
>>>>> +     status =3D "okay";
>>>>> +
>>>>> +     zap-shader {
>>>>> +             firmware-name =3D "qcom/x1e80100/dell/tributo/qcdxkmsu=
c8380=2Embn";
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&i2c0 {
>>>>> +     clock-frequency =3D <400000>;
>>>>> +     status =3D "okay";
>>>>> +
>>>>> +     keyboard@5 {
>>>>> +             compatible =3D "hid-over-i2c";
>>>>> +             reg =3D <0x5>;
>>>>> +
>>>>> +             hid-descr-addr =3D <0x20>;
>>>>> +             interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>>>>> +
>>>>> +             pinctrl-0 =3D <&kybd_default>;
>>>>> +             pinctrl-names =3D "default";
>>>>> +
>>>>> +             wakeup-source;
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&i2c3 {
>>>>> +     clock-frequency =3D <400000>;
>>>>> +     status =3D "disabled";
>>>>> +     /* PS8830 Retimer @0x8 */
>>>>> +     /* Unknown device @0x9 */
>>>>> +};
>>>>> +
>>>>> +&i2c5 {
>>>>> +     clock-frequency =3D <100000>;
>>>>> +     status =3D "disabled";
>>>>> +     /* Unknown device @0x3b */
>>>>> +};
>>>>> +
>>>>> +&i2c7 {
>>>>> +     clock-frequency =3D <400000>;
>>>>> +     status =3D "disabled";
>>>>> +     /* PS8830 Retimer @0x8 */
>>>>> +     /* Unknown device @0x9 */
>>>>> +};
>>>>> +
>>>>> +&i2c8 {
>>>>> +     clock-frequency =3D <400000>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +
>>>>> +     touchscreen@0 {
>>>>> +             compatible =3D "hid-over-i2c";
>>>>> +             reg =3D <0x0>;
>>>>> +
>>>>> +             hid-descr-addr =3D <0x1>;
>>>>> +             interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
>>>>> +
>>>>> +             pinctrl-0 =3D <&ts0_default>;
>>>>> +             pinctrl-names =3D "default";
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&i2c9 {
>>>>> +     clock-frequency =3D <400000>;
>>>>> +     status =3D "disabled";
>>>>> +     /* USB3 retimer device @0x4f */ };
>>>>> +
>>>>> +&i2c17 {
>>>>> +     clock-frequency =3D <400000>;
>>>>> +     status =3D "okay";
>>>>> +
>>>>> +     touchpad@2c {
>>>>> +             compatible =3D "hid-over-i2c";
>>>>> +             reg =3D <0x2c>;
>>>>> +
>>>>> +             hid-descr-addr =3D <0x20>;
>>>>> +             interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>>>>> +
>>>>> +             pinctrl-0 =3D <&tpad_default>;
>>>>> +             pinctrl-names =3D "default";
>>>>> +
>>>>> +             wakeup-source;
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&mdss {
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&mdss_dp3 {
>>>>> +     compatible =3D "qcom,x1e80100-dp";
>>>>> +     /delete-property/ #sound-dai-cells;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +
>>>>> +     aux-bus {
>>>>> +             panel {
>>>>> +                     /* 1920x1200 IPS panel is SHP1593, PNP09FF com=
patible */
>>>>> +                     compatible =3D "edp-panel";
>>>>> +                     power-supply =3D <&vreg_edp_3p3>;
>>>>> +
>>>>> +                     port {
>>>>> +                             edp_panel_in: endpoint {
>>>>> +                                     remote-endpoint =3D <&mdss_dp3=
_out>;
>>>>> +                             };
>>>>> +                     };
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     ports {
>>>>> +             port@1 {
>>>>> +                     reg =3D <1>;
>>>>> +
>>>>> +                     mdss_dp3_out: endpoint {
>>>>> +                             data-lanes =3D <0 1 2 3>;
>>>>> +                             link-frequencies =3D /bits/ 64
>>>>> + <1620000000 2700000000 5400000000 8100000000>;
>>>>> +
>>>>> +                             remote-endpoint =3D <&edp_panel_in>;
>>>>> +                     };
>>>>> +             };
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&mdss_dp3_phy {
>>>>> +     vdda-phy-supply =3D <&vreg_l3j_0p8>;
>>>>> +     vdda-pll-supply =3D <&vreg_l2j_1p2>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&pcie4 {
>>>>> +     perst-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
>>>>> +     wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
>>>>> +
>>>>> +     pinctrl-0 =3D <&pcie4_default>;
>>>>> +     pinctrl-names =3D "default";
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&pcie4_phy {
>>>>> +     vdda-phy-supply =3D <&vreg_l3i_0p8>;
>>>>> +     vdda-pll-supply =3D <&vreg_l3e_1p2>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&pcie6a {
>>>>> +     perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
>>>>> +     wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
>>>>> +
>>>>> +     vddpe-3v3-supply =3D <&vreg_nvme>;
>>>>> +
>>>>> +     pinctrl-0 =3D <&pcie6a_default>;
>>>>> +     pinctrl-names =3D "default";
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&pcie6a_phy {
>>>>> +     vdda-phy-supply =3D <&vreg_l1d_0p8>;
>>>>> +     vdda-pll-supply =3D <&vreg_l2j_1p2>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&qupv3_0 {
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&qupv3_1 {
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&qupv3_2 {
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&remoteproc_adsp {
>>>>> +     firmware-name =3D "qcom/x1e80100/dell/tributo/qcadsp8380=2Embn=
",
>>>>> +                     "qcom/x1e80100/dell/tributo/adsp_dtbs=2Eelf";
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&remoteproc_cdsp {
>>>>> +     firmware-name =3D "qcom/x1e80100/dell/tributo/qccdsp8380=2Embn=
",
>>>>> +                     "qcom/x1e80100/dell/tributo/cdsp_dtbs=2Eelf";
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&smb2360_0_eusb2_repeater {
>>>>> +     vdd18-supply =3D <&vreg_l3d_1p8>;
>>>>> +     vdd3-supply =3D <&vreg_l2b_3p0>; };
>>>>> +
>>>>> +&smb2360_1_eusb2_repeater {
>>>>> +     vdd18-supply =3D <&vreg_l3d_1p8>;
>>>>> +     vdd3-supply =3D <&vreg_l14b_3p0>; };
>>>>> +
>>>>> +&tlmm {
>>>>> +     gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
>>>>> +                            <76 4>,  /* SPI19 (TZ Protected) */
>>>>> +                            <238 1>; /* UFS Reset */
>>>>> +
>>>>> +     cam_indicator_en: cam-indicator-en-state {
>>>>> +             pins =3D "gpio110";
>>>>> +             function =3D "gpio";
>>>>> +             drive-strength =3D <2>;
>>>>> +             bias-disable;
>>>>> +     };
>>>>> +
>>>>> +     edp_reg_en: edp-reg-en-state {
>>>>> +             pins =3D "gpio70";
>>>>> +             function =3D "gpio";
>>>>> +             drive-strength =3D <16>;
>>>>> +             bias-disable;
>>>>> +     };
>>>>> +
>>>>> +     hall_int_n_default: hall-int-n-state {
>>>>> +             pins =3D "gpio92";
>>>>> +             function =3D "gpio";
>>>>> +
>>>>> +             bias-disable;
>>>>> +     };
>>>>> +
>>>>> +     kybd_default: kybd-default-state {
>>>>> +             pins =3D "gpio67";
>>>>> +             function =3D "gpio";
>>>>> +             bias-pull-up;
>>>>> +     };
>>>>> +
>>>>> +     nvme_reg_en: nvme-reg-en-state {
>>>>> +             pins =3D "gpio18";
>>>>> +             function =3D "gpio";
>>>>> +             drive-strength =3D <2>;
>>>>> +             bias-disable;
>>>>> +     };
>>>>> +
>>>>> +     pcie4_default: pcie4-default-state {
>>>>> +             clkreq-n-pins {
>>>>> +                     pins =3D "gpio147";
>>>>> +                     function =3D "pcie4_clk";
>>>>> +                     drive-strength =3D <2>;
>>>>> +                     bias-pull-up;
>>>>> +             };
>>>>> +
>>>>> +             perst-n-pins {
>>>>> +                     pins =3D "gpio146";
>>>>> +                     function =3D "gpio";
>>>>> +                     drive-strength =3D <2>;
>>>>> +                     bias-disable;
>>>>> +             };
>>>>> +
>>>>> +             wake-n-pins {
>>>>> +                     pins =3D "gpio148";
>>>>> +                     function =3D "gpio";
>>>>> +                     drive-strength =3D <2>;
>>>>> +                     bias-pull-up;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     pcie6a_default: pcie6a-default-state {
>>>>> +             clkreq-n-pins {
>>>>> +                     pins =3D "gpio153";
>>>>> +                     function =3D "pcie6a_clk";
>>>>> +                     drive-strength =3D <2>;
>>>>> +                     bias-pull-up;
>>>>> +             };
>>>>> +
>>>>> +             perst-n-pins {
>>>>> +                     pins =3D "gpio152";
>>>>> +                     function =3D "gpio";
>>>>> +                     drive-strength =3D <2>;
>>>>> +                     bias-disable;
>>>>> +             };
>>>>> +
>>>>> +             wake-n-pins {
>>>>> +                     pins =3D "gpio154";
>>>>> +                     function =3D "gpio";
>>>>> +                     drive-strength =3D <2>;
>>>>> +                     bias-pull-up;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     tpad_default: tpad-default-state {
>>>>> +             disable-pins {
>>>>> +                     pins =3D "gpio38";
>>>>> +                     function =3D "gpio";
>>>>> +                     output-high;
>>>>> +             };
>>>>> +
>>>>> +             int-n-pins {
>>>>> +                     pins =3D "gpio3";
>>>>> +                     function =3D "gpio";
>>>>> +                     bias-pull-up;
>>>>> +             };
>>>>> +
>>>>> +             reset-n-pins {
>>>>> +                     pins =3D "gpio52";
>>>>> +                     function =3D "gpio";
>>>>> +                     bias-disable;
>>>>> +             };
>>>>> +     };
>>>>> +
>>>>> +     ts0_default: ts0-default-state {
>>>>> +             disable-pins {
>>>>> +                     pins =3D "gpio75";
>>>>> +                     function =3D "gpio";
>>>>> +                     output-high;
>>>>> +             };
>>>>> +
>>>>> +             int-n-pins {
>>>>> +                     pins =3D "gpio51";
>>>>> +                     function =3D "gpio";
>>>>> +                     bias-pull-up;
>>>>> +             };
>>>>> +
>>>>> +             reset-n-pins {
>>>>> +                     /* Technically should be High-Z input */
>>>>> +                     pins =3D "gpio48";
>>>>> +                     function =3D "gpio";
>>>>> +                     output-low;
>>>>> +                     drive-strength =3D <2>;
>>>>> +             };
>>>>> +     };
>>>>> +};
>>>>> +
>>>>> +&uart21 {
>>>>> +     compatible =3D "qcom,geni-debug-uart";
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss0_hsphy {
>>>>> +     vdd-supply =3D <&vreg_l3j_0p8>;
>>>>> +     vdda12-supply =3D <&vreg_l2j_1p2>;
>>>>> +
>>>>> +     phys =3D <&smb2360_0_eusb2_repeater>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss0_qmpphy {
>>>>> +     vdda-phy-supply =3D <&vreg_l3e_1p2>;
>>>>> +     vdda-pll-supply =3D <&vreg_l1j_0p9>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss0 {
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss0_dwc3 {
>>>>> +     dr_mode =3D "host";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss0_dwc3_hs {
>>>>> +     remote-endpoint =3D <&pmic_glink_ss0_hs_in>; };
>>>>> +
>>>>> +&usb_1_ss0_qmpphy_out {
>>>>> +     remote-endpoint =3D <&pmic_glink_ss0_ss_in>; };
>>>>> +
>>>>> +&usb_1_ss1_hsphy {
>>>>> +     vdd-supply =3D <&vreg_l3j_0p8>;
>>>>> +     vdda12-supply =3D <&vreg_l2j_1p2>;
>>>>> +
>>>>> +     phys =3D <&smb2360_1_eusb2_repeater>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss1_qmpphy {
>>>>> +     vdda-phy-supply =3D <&vreg_l3e_1p2>;
>>>>> +     vdda-pll-supply =3D <&vreg_l2d_0p9>;
>>>>> +
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss1 {
>>>>> +     status =3D "okay";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss1_dwc3 {
>>>>> +     dr_mode =3D "host";
>>>>> +};
>>>>> +
>>>>> +&usb_1_ss1_dwc3_hs {
>>>>> +     remote-endpoint =3D <&pmic_glink_ss1_hs_in>; };
>>>>> +
>>>>> +&usb_1_ss1_qmpphy_out {
>>>>> +     remote-endpoint =3D <&pmic_glink_ss1_ss_in>; };
>>>>=20
>


--=20
With best wishes
Dmitry


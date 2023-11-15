Return-Path: <linux-arm-msm+bounces-724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 021017EC870
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96113B20972
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A600839FCA;
	Wed, 15 Nov 2023 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBq9k02L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3CA381DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 16:22:17 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FBE1A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:22:15 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso84901761fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 08:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700065333; x=1700670133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrtVoA6DkvA27sYnHwPaQSdHgnqWH534a2nbNHAYwXo=;
        b=NBq9k02LuCSVCaWroURQ3mjqTaiXCXrIC1EwyDiDjmMIu6Jr1wWz1JpgRDh5qIRAV0
         NIXA5HIqJdoRWReurugzgHtZX48aVLM+z5b+Y7SAHaDTyklXdkbGedvsBJW5fzyNmfsG
         bKG7NsjaE1h2on7ZOsbg2TlTpBM+qLmZAW/sEGyw/ThiC/MbTsiBTsu5LDcepTdCEhvu
         SkhcXZnKKUFBpp6jVqVa54lM2xkYroyq6EB7lh8xX70EcvCqIgL/KPHPpxFeNr44Fmke
         jiXz+Fzxg5i9YU6Lpk+IFryrIpT08bWOxMjic0ANBZG0HOVF9GuQaDqS/FYOUeqU8Dyp
         KI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700065333; x=1700670133;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrtVoA6DkvA27sYnHwPaQSdHgnqWH534a2nbNHAYwXo=;
        b=gk2GR0MNKI7gcCPkxJbUxPWsG//7OPYTuq5tA6RZ9xjAGFDDLpo00f7ZClVTRBatuN
         w6yWR1jNbPd5Ex3lMQjK7o2AETns9lS/1YN7AnLA17/+z1h3mKCz1e/ydqyxYhZVAbJ4
         yn+lG/KDZwOG3/g8n2js9QoojQ6JGW6bHaS2orqAhmJb6rQuJGiFQ/9dzFLrYpC/hhJ0
         D9oizCqAwCpyQJI90plaB16oGXZv5V1eui+bc0b9iCDBb6+WckXWNSJh7ZqRLtrHAhWx
         Te2dRJ5CHmuVnPNVkmnhe9AD6XyQdfMoIWXs3ELUgoYUNExZB/TZzZVSVtTOvwFZj07/
         NweA==
X-Gm-Message-State: AOJu0Yz+6k4nxDYQsqr5iTAa1zUWxuX3QfLhjmLJSPSgcZiZ2l1Yvk1F
	eUH4zCk0y/cLnP/SXryVgsVPxw==
X-Google-Smtp-Source: AGHT+IErdUhu2ALD27j9oIpHh6neikv3JlLIkEU5HzRMLygejTlSrqgJVbjHthr2nfMBm1jDzgKlWw==
X-Received: by 2002:a05:651c:1251:b0:2c6:f173:7d90 with SMTP id h17-20020a05651c125100b002c6f1737d90mr4430353ljh.12.1700065333646;
        Wed, 15 Nov 2023 08:22:13 -0800 (PST)
Received: from [172.30.204.150] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651c0a0800b002bce77e4ddfsm1699622ljq.97.2023.11.15.08.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 08:22:13 -0800 (PST)
Message-ID: <1f7674ea-ed79-48b1-b577-1596e6fe57d2@linaro.org>
Date: Wed, 15 Nov 2023 17:22:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: ipq6018: add USB GDSCs
Content-Language: en-US
To: Robert Marko <robimarko@gmail.com>
Cc: agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
References: <20231025104457.628109-1-robimarko@gmail.com>
 <20231025104457.628109-2-robimarko@gmail.com>
 <CAOX2RU4MBvDZZ767RPS9XKj0U2L3gviVG5cyR8NKyO4LD+sfYQ@mail.gmail.com>
 <20c8cfde-3f55-45c5-bc23-21979ac9680d@linaro.org>
 <CAOX2RU5-XFZhGzjigNtu-qFnPWDd2XkpGpY=HXWigRa5SXw4TA@mail.gmail.com>
 <ef377506-4132-4805-a76e-18f241afe319@linaro.org>
 <CAOX2RU4K67evm10giQvF1rcfqTfR+e--KQT3ZePoHQoqASv_fg@mail.gmail.com>
 <bdf6be0b-c137-48ce-8a3f-ab74bced6f87@linaro.org>
 <CAOX2RU4z1Dcs7ct0BAaS7wicYVmQEiSe74=w_grFDKQv22uoFg@mail.gmail.com>
 <4243a841-5509-4d04-8ec7-191f2ba5677a@linaro.org>
 <CAOX2RU73n4JUTxGGgN7YOEqjj-1_=n=UZ99xsZ8Easp6O-D_yA@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAOX2RU73n4JUTxGGgN7YOEqjj-1_=n=UZ99xsZ8Easp6O-D_yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/13/23 13:50, Robert Marko wrote:
> On Mon, 13 Nov 2023 at 12:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 11.11.2023 12:28, Robert Marko wrote:
>>> On Tue, 7 Nov 2023 at 22:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 10/31/23 10:01, Robert Marko wrote:
>>>>> On Mon, 30 Oct 2023 at 22:12, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>>
>>>>>> On 30.10.2023 21:37, Robert Marko wrote:
>>>>>>> On Mon, 30 Oct 2023 at 20:37, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>>>>
>>>>>>>> On 29.10.2023 12:04, Robert Marko wrote:
>>>>>>>>> On Wed, 25 Oct 2023 at 12:45, Robert Marko <robimarko@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>> IPQ6018 has GDSC-s for each of the USB ports, so lets define them as such
>>>>>>>>>> and drop the curent code that is de-asserting the USB GDSC-s as part of
>>>>>>>>>> the GCC probe.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>>>>>>>>
>>>>>>>>> Unfortunately, after testing on multiple devices I hit the same GDSC
>>>>>>>>> issue I had a long time ago
>>>>>>>>> that was the reason I did not send this upstream.
>>>>>>>>> It seems that USB3 port GDSC (USB0 GDSC in code) works just fine,
>>>>>>>>> however the USB2 one
>>>>>>>>> (USB1 GDSC in code) it is stuck off and USB2 port will fail due to this:
>>>>>>>>>       1.607531] ------------[ cut here ]------------
>>>>>>>>> [    1.607559] usb1_gdsc status stuck at 'off'
>>>>>>>>> [    1.607592] WARNING: CPU: 0 PID: 35 at gdsc_toggle_logic+0x16c/0x174
>>>>>>>>> [    1.615120] Modules linked in:
>>>>>>>> Can you dump GDSCR (the entire 32-bit register) at boot and when toggling?
>>>>>>>
>>>>>>> Sure, here it is:
>>>>>>> [    0.023760] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3e078 val: 0x8222004 init
>>>>>>> [    0.023782] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val: 0x8222004 init
>>>>>>> [    0.988626] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val:
>>>>>>> 0x8282000 before toggle
>>>>>>> [    1.202506] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3f078 val:
>>>>>>> 0x8282000 after toggle
>>>>>>> [    1.207208] qcom,gcc-ipq6018 1800000.gcc: reg: 0x3e078 val:
>>>>>>> 0xa0282000 before toggle
>>>>>> Any chance
>>>>>>
>>>>>> .en_few_wait_val = 0x2
>>>>>>
>>>>>> (turning BIT(19) into BIT(17))
>>>>>>
>>>>>> will make a difference?
>>>>>
>>>>> Sadly, it makes no difference and GDSC status bit newer comes up which is
>>>>> rather weird as USB0 one seems to work just fine.
>>>> What if you add clk_ignore_unused?
>>>
>>> To the USB1 master clock or?
>> That's a command line parameter, effectively setting it on all clks.
> 
> Oh that, I understand now.
> 
>>
>>>
>>> There is definitively something broken regarding the GDSC as
>>> GDSC_STATE bits (30-27)
>>> change from 0 to something on the USB0 GDSC but on GDSC1 they are 0 even after
>>> SW_OVERRIDE BIT(2) is set to 1, and the POWER BIT(31) newer changes to 1.
>>>
>>> However, if you manually set BIT(2) to 1 then the USB1 master clock
>>> can come up so
>>> GDSC seems to work.
>>> USB1 (The USB2.0 HS) port is still broken after this if USB mass storage is used
>>> but that was present before the GDSC changes as well and I still need
>>> to figure out
>>> which quirk is missing for this.
>> Please try clk_ignore_unused and see if toggling the GDSC is still broken.
> 
> Sadly, passing clk_ignore_unused in the bootargs doesn't help, GDSC is
> still stuck off.
Hm, so it looks like there's no clock dependency for this GDSC..

Maybe some regulator needs to be turned on?

Can you try to add regulator-always-on to all vregs and retry?
(and keep clk_ignore_unused to be sure)

Konrad


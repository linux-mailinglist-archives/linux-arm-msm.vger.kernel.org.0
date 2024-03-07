Return-Path: <linux-arm-msm+bounces-13603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7CE874E40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 12:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 669131F266D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Mar 2024 11:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A521292CE;
	Thu,  7 Mar 2024 11:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJ/lk8uH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D35D129A90
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Mar 2024 11:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709812213; cv=none; b=flmKnDpW7CwUF0KW0yHTUQkwOUlW5ybjLsFZGjdFO747mDu15taJIi5dFr1zTPx1wextCplc9wy5mAc37tJaC5zDN8iEff0yQ+WEaunsWHrAjbGwJkg8HaYsLN0GK8hl9x/JFvPVW93bHIQdtEUdocYZ2BrgvJLqwkm+Bhw7yPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709812213; c=relaxed/simple;
	bh=c62K5oPh61vCveDvQf0OpOvXF4WeEmn4VK50d27H8EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9LLqw0Q8zYW/urZDfoeBga7El0obx+T00imx9Nj4tlKzwg34aMxTccBwbuX0RLNpqB1htWsuUj5mINYs6tqyMI7voLmOyzjayaSr3kCsOERJy9JBIrPY1jrRTObOmY4X4msh5ta1612bfcc5jv9PJay06R1QZYZab9KAdgs+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJ/lk8uH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513181719easo600836e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Mar 2024 03:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709812209; x=1710417009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6uts5XAuJGMgcS3q5Z9N3SGrS49osI0Xq6KbzVVrfg=;
        b=fJ/lk8uHB8PjTgDVNicH9xnL5Fy6XT4hrGjlqd3YIZKTy0U5zF1Js0cA7gSs7Ag6+O
         3OmlXTi2/2XQJJhk87DpzVXOj2hmnAfc0lzsDF7a2gW8Yj35wEMz71GtaXbi0ah+8Yjz
         UwMv+dVHN/FfpgJVnXkdXUzql1+VJU/Ldz6z9Ktj9hQpSzFZCC6Z/Qqbbq6bZL8yxtNl
         7Lo+/hjklFOUEa5JIkCvt41H2hrN9PyYbyHSoWqgp59lhzQbkn2TOGwQ367OSgPS/gRj
         e4OwBd3Fv4dA5JY4ToJm9CNYbgLeV/FKqwxHf82ExaYngUKMcH0narl5rAfGXKqWWxBA
         a6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709812209; x=1710417009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6uts5XAuJGMgcS3q5Z9N3SGrS49osI0Xq6KbzVVrfg=;
        b=nomnRtMCoQAV9l3vDAWLhHssFBIs/gytBH1KhSsKCL7OkQ6Mi9nlc7gosyUEvujz4Q
         xKCyczBjGR2dk3tFehlr8CBAmlO8cwFSYJ4m1XnTsJlIwVYL+EUxJaZY7cxzqdkh/B7D
         fQq5Zc4bexNMCmrDb8n1kwkzxtIu23qxP0HwVSu2bolO6hjlqmKywZmwzb+NWJHUuORZ
         x7QCoJDgydDq4OI6p8P7qDfpgf8jAw/Yy9HSz57YsNA7JtYveWmHF+MyreaK5K6VQy+z
         IrQ71NVZL47rZDUFQQwYNRR5Rp4oF2VymC6dm2DpsfXLYVUPHM1HA5ut67deZqdZPWtL
         vbuA==
X-Forwarded-Encrypted: i=1; AJvYcCVVC8dStPGIqtJ0MSUlxWNc/wrN7c+YNpx9DjR3sUxW5G2p/iP9WSvyaBXV9sMdelmRm7R75Or2J51MmnPQi30/9+tF1tk3sBINN9ahHw==
X-Gm-Message-State: AOJu0YxDr46u5ehf07qyk1DItlaYWoi5CAI2vONbgwgE3vEey/+CKTca
	M0f0/AmrPMNNWMi2Ii5nZT7f00zlDcOilNmOgu/Ug7NEsMcXMzqCI4gROta83V8=
X-Google-Smtp-Source: AGHT+IG4bzS87kZ3geSfi5mpqxwhIKXkroOdY/OO1oaxjjX8DMoKWY9bpC3ELNXCuGKGxX1lM0ohTA==
X-Received: by 2002:ac2:5b44:0:b0:513:5217:6201 with SMTP id i4-20020ac25b44000000b0051352176201mr1333056lfp.59.1709812208871;
        Thu, 07 Mar 2024 03:50:08 -0800 (PST)
Received: from [172.30.204.36] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q12-20020ac25a0c000000b00513360b4f1esm2435370lfn.305.2024.03.07.03.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 03:50:08 -0800 (PST)
Message-ID: <48fd9457-d092-4226-9a6c-13dea81694f5@linaro.org>
Date: Thu, 7 Mar 2024 12:50:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] arm64: dts: qcom: ipq6018: add sdhci node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Marko <robimarko@gmail.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240306123006.724934-1-amadeus@jmu.edu.cn>
 <20240306123006.724934-2-amadeus@jmu.edu.cn>
 <CAA8EJpqYjutM1Kh6QxysB6XNAmXywtOtRJ7KP0LbY5E36kCPvA@mail.gmail.com>
 <78b1a1a2-a9fa-4b28-9d96-d65bb5517199@gmail.com>
 <CAA8EJppJBOQh19r4A-igsh5znDE_R6mDNy+ao5ximx7vtsZZvA@mail.gmail.com>
 <CAOX2RU4W-zV3A8eW0A+1V838Fm=tUkXY=Bs3j4VJ8Jo9mxrOAw@mail.gmail.com>
 <CAA8EJpq=-r4XhnFJset0=X=YO5QNUpuw+e1r6DTsPvzNAZCyNw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpq=-r4XhnFJset0=X=YO5QNUpuw+e1r6DTsPvzNAZCyNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/7/24 08:50, Dmitry Baryshkov wrote:
> On Thu, 7 Mar 2024 at 09:38, Robert Marko <robimarko@gmail.com> wrote:
>>
>> On Thu, 7 Mar 2024 at 08:28, Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On Wed, 6 Mar 2024 at 22:35, Robert Marko <robimarko@gmail.com> wrote:
>>>>
>>>>
>>>> On 06. 03. 2024. 20:43, Dmitry Baryshkov wrote:
>>>>> On Wed, 6 Mar 2024 at 14:31, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>>>>>> Add node to support mmc controller inside of IPQ6018.
>>>>>> This controller supports both eMMC and SD cards.
>>>>>>
>>>>>> Tested with:
>>>>>>     eMMC (HS200)
>>>>>>     SD Card (SDR50/SDR104)
>>>>>>
>>>>>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/ipq6018.dtsi | 19 +++++++++++++++++++
>>>>>>    1 file changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>>>>> index 322eced0b876..420c192bccd9 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>>>>> @@ -441,6 +441,25 @@ dwc_1: usb@7000000 {
>>>>>>                           };
>>>>>>                   };
>>>>>>
>>>>>> +               sdhc: mmc@7804000 {
>>>>>> +                       compatible = "qcom,ipq6018-sdhci", "qcom,sdhci-msm-v5";
>>>>>> +                       reg = <0x0 0x07804000 0x0 0x1000>,
>>>>>> +                             <0x0 0x07805000 0x0 0x1000>;
>>>>>> +                       reg-names = "hc", "cqhci";
>>>>>> +
>>>>>> +                       interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
>>>>>> +                                    <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>>>>>> +                       interrupt-names = "hc_irq", "pwr_irq";
>>>>>> +
>>>>>> +                       clocks = <&gcc GCC_SDCC1_AHB_CLK>,
>>>>>> +                                <&gcc GCC_SDCC1_APPS_CLK>,
>>>>>> +                                <&xo>;
>>>>>> +                       clock-names = "iface", "core", "xo";
>>>>>> +                       resets = <&gcc GCC_SDCC1_BCR>;
>>>>>> +                       max-frequency = <192000000>;
>>>>> If I understand correctly, GCC_SDCC1_APPS_CLK support frequencies up
>>>>> to 384 MHz, but here you are limiting it to 192 MHz. Why is it so?
>>>>>
>>>>> I am not sure that 384MHz is actually supported as IPQ6018 datasheet
>>>>> clearly indicates that HS400 mode is not supported.
>>>
>>> I didn't check the datasheet, I opened the gcc-ipq6018.c
>>
>> I understand that, I just pointed it out, it wouldn't surprise me if
>> the frequency table
>> was just copy/pasted from IPQ8074.
> 
> Then it might be fixed instead, making the max-frequency property unnecessary.

The clock driver contains clock settings that were either autogenerated
or manually included, or copypasted. These settings, and particularly
downstream, only describe the known-working clock rates and the minimum
required voltage setting just to keep them ticking nicely (think running
a car with the clutch pressed, no real load), a subset (which may be an
improper subset) of which gets translated into the device OPPs (or frequency
levels downstream). We should have an OPP table here.

Konrad


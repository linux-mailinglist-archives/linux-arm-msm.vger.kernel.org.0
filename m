Return-Path: <linux-arm-msm+bounces-8006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC991839735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E131C25860
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AA481214;
	Tue, 23 Jan 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QM2uDo9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C51C8120B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706033105; cv=none; b=oulTpZ8fSPjtPJpAOvCXsjlObX3kiMWVJnOGNyZpSFPM1KLFvmRPhlkJCJjFBDeevfINIHt1pSVAcKF2mapQC2tIX4iMz5SgOpRj1N2S81xxYQFSmLwuKj99Vx6Som0u6XB2VrtGNuh7Hxt05n47pu5esTapQR1Ht7sKOjGWcnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706033105; c=relaxed/simple;
	bh=gsXUKdJc7wRra5pgHweHxeJz0Mz3gnHrJb85noNs6uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CL/EQcWTMw+i81gd+p2LI+qD/pJgf4J9+BPJB+E0Zj3iaYzF1nW4hTvbehANxD9j1VaetKKdlQ0/n6uczod203dN4sJvNcID5/fm0oZoFOM3sXEIb9zpNY/OZkaggE6WCuyHimzbvUJmkGJVkCEvJXuL1nCq1IwGPesqiBk29HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QM2uDo9t; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so5127815e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706033101; x=1706637901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jhUxqAeCnBFu1QAeXMQuhkGVHepSO7xrReBByIkm20w=;
        b=QM2uDo9t/xpX4oLnioITpfo6tG7CyRW+mnZDDyY9r7aTPR/rl8dXc8hIfst0GkCvd4
         5p78UZZ7xGQRfRsYy3i4xBAaELdicZMY5jlKNDH6Fl6YN/N5szvJzaCxfBWAEz284lur
         vNz9n8/A3SfwdPpU0OAGFVLcXqYwIz6AJl3Z16u2gyTzNon5tunJDzfmBrbswninorip
         6a8uOgD5BFyUPIWL3PYVWGB/Hdc4BME/1f1+Tuds/OyMYR8yCWEpICfEOhxBAjMoQJwd
         HP1FvCHLJSWBMOCiwMRoAbzsAvx1H25WowDS6PIZhgG4Jn2Td19WmS6X/Vv+dmjHv8Kz
         LB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706033101; x=1706637901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhUxqAeCnBFu1QAeXMQuhkGVHepSO7xrReBByIkm20w=;
        b=GX09b49OhNE37nvxit9cGbNQp7jA7Muy7sSL0UPXq9+sNWYtx8okyQwihDM5QNc8X0
         lp1dCLPjmXVfpcJFQCidIoO8eVY104VOwGGuJXQobzcVWZLDV9EDqkHxeRuyBpNHtTVD
         +Vka4x1DEH1SbEevIO1qvDInsuZOs+iWyoUVqqUw1gXBSVFyMAZ+9K0w3ctF89TgaJxd
         mJgRP2QAw3cbQs+LNbinJ+4L/SQna8HprA8bum+N5W1KWLHEZqlniEc5h++8lFS0yijC
         hkeB8wORtmSz7+gbNsViXYh2b1GTLccmyQzNWNx9eiEMS7pyrl59hXE+080B3Bui6v/+
         H6IQ==
X-Gm-Message-State: AOJu0YxGK18HHAxHm0B6vUi/et/wRnmj3ks0P/jEtHX/Qia/OR0ExqC3
	B4ybUPxwSHlrkqur5bf9ivS+XUuxsGtuPF0zWJDGimll1Zg96YZATfOruTMlKZE=
X-Google-Smtp-Source: AGHT+IGUagvilGdAPFParze+DvIy1PHzFc4+kDXXDtaPTzsMuztDgG4YMCi6Uj1xWvA6rOePhkbkhA==
X-Received: by 2002:a05:6512:3192:b0:50e:74e2:af58 with SMTP id i18-20020a056512319200b0050e74e2af58mr4121827lfe.52.1706033101479;
        Tue, 23 Jan 2024 10:05:01 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id s9-20020a197709000000b0050ffd0a3728sm645760lfc.63.2024.01.23.10.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:05:01 -0800 (PST)
Message-ID: <9d1c684f-51ac-4d9c-a189-940ff65e0cab@linaro.org>
Date: Tue, 23 Jan 2024 19:04:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-idp: add display and panel
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
 nfraprado@collabora.com, m.szyprowski@samsung.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20240116094935.9988-1-quic_riteshk@quicinc.com>
 <20240116094935.9988-3-quic_riteshk@quicinc.com>
 <20a8efd1-e243-434e-8f75-aa786ac8014f@linaro.org>
 <CAA8EJpqQVuS+yqXQ2y5sNQrRVg7tcQAJ3ywsEjg+O=7TkUZWLQ@mail.gmail.com>
 <99a9a562-9f6f-411c-be1c-0a28fc2524dd@quicinc.com>
 <CAA8EJppj+cDnw7p4yANvF0FmEhX3+L5xUq8w3TeevAGhcpo1Yg@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppj+cDnw7p4yANvF0FmEhX3+L5xUq8w3TeevAGhcpo1Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 16:12, Dmitry Baryshkov wrote:
> On Tue, 23 Jan 2024 at 15:43, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>>
>>
>> On 1/16/2024 6:27 PM, Dmitry Baryshkov wrote:
>>
>>> On Tue, 16 Jan 2024 at 14:06, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>
>>>>
>>>> On 1/16/24 10:49, Ritesh Kumar wrote:
>>>>> Enable Display Subsystem with Novatek NT36672E Panel
>>>>> on qcm6490 idp platform.
>>>>>
>>>>> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
>>>>> ---
>>>>>     arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 100 +++++++++++++++++++++++
>>>>>     1 file changed, 100 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>>>> index 2a6e4907c5ee..efa5252130a1 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
>>>>> @@ -9,6 +9,7 @@
>>>>>     #define PM7250B_SID 8
>>>>>     #define PM7250B_SID1 9
>>>>>
>>>>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>>>>>     #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>     #include "sc7280.dtsi"
>>>>>     #include "pm7250b.dtsi"
>>>>> @@ -38,6 +39,25 @@
>>>>>                 stdout-path = "serial0:115200n8";
>>>>>         };
>>>>>
>>>>> +     lcd_disp_bias: lcd-disp-bias-regulator {
>>>>> +             compatible = "regulator-fixed";
>>>>> +             regulator-name = "lcd_disp_bias";
>>>>> +             regulator-min-microvolt = <5500000>;
>>>>> +             regulator-max-microvolt = <5500000>;
>>>>> +             gpio = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
>>>>> +             enable-active-high;
>>>>> +             pinctrl-names = "default";
>>>>> +             pinctrl-0 = <&lcd_disp_bias_en>;
>>>> property-n
>>>> property-names
>>>>
>>>> all throughout the patch
>>
>> Thanks, I will update in the new version.
>>
>>>>> +&gpu {
>>>>> +     status = "disabled";
>>>>> +};
>>>> Hm.. generally we disable the GPU in the SoC DT, but that doesn't
>>>> seem to have happened here..
>>>>
>>>> Thinking about it more, is disabling it here necessary? Does it
>>>> not fail gracefully?
>>> Missed this.
>>>
>>> I'd say, I don't see a reason to disable it at all. The GPU should be
>>> working on sc7280 / qcm4290.
>>
>> With GPU device node enabled, adreno_bind failure is seen as the
>> "speed_bin" was not populated on QCM6490 target which leads to display
>> bind failure.
> 
> Excuse me please. The GPU node for sc7280 already has speed_bin, which
> points to qfprom + 0x1e9, bits 5 to 9.
> 
> Do you mean that qcm6490 uses different speed bin location? Or
> different values for the speed bins?
> 
>> Spoke with GPU team and on QCM6490 board, only CPU rendering is
>> supported for now and there is no plan to enable GPU rendering in near
>> future.
> 
> This sounds like having the feature disabled for no particular reason.
> Both the kernel and Mesa have supported the Adreno 635 for quite a
> while.

643 [1], [2]

> 
>> In this regard, what do you suggest
>>
>> 1) Disable GPU in QCM6490 DT (as per the current patch)
>> 2) Disable GPU in the SoC DT, but enable it in other platform DTs. (This
>> will prompt change in all the dt's and we don't have all the devices to
>> test)
> 
> The second option definitely follows what is present on other platforms.
> 
>> Please let me know your views on it.
> 
> Please enable the GPU instead.

+1

Konrad

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25408/diffs?commit_id=b1e851d66c3a3e53f1a464023f675f3f6cbd3503
[2] https://patches.linaro.org/project/linux-arm-msm/cover/20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org/


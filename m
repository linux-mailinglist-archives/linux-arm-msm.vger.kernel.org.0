Return-Path: <linux-arm-msm+bounces-4190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D880C53F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 10:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B65E3B20EA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 09:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490042137E;
	Mon, 11 Dec 2023 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nv0tcRVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C06B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:50:47 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ca2573d132so52616711fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 01:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702288246; x=1702893046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oPzKPB/JI4JD29Cnv2t+WcboH2VSMBFNuDqFFM+Zco=;
        b=nv0tcRVXdiBUAice+CwxbXiCNft8QM3iPL8It/ZJ5Nwq7SiRINTsqqLl+Esj2Fibdp
         pXmL8s0Np+yGEjegy5zv3kN3pTkysZvhViy0ayyl7K+CQJoA3cDFjCiPR1O9J+X/rXfW
         jEECKZTn2uNcB4k8Le4DyHzpvUYIdIrHer04iwCz+VBVWmU9dhU3GGO7OqW3Bqkhbebf
         XyMm0YzIAlTTXwP2R3x/3E2TwDR/EjoiSjWi1HT0JyxjiK61lf0AsxsXqPKVnHS/eY3C
         uRS78OTqErH1K8FMq3ysYeE5vdpCrxVfceZymQtwN8bY/QcMXMji/c6bIUh4XWE//s6K
         mfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288246; x=1702893046;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oPzKPB/JI4JD29Cnv2t+WcboH2VSMBFNuDqFFM+Zco=;
        b=nNZ6ehErf+4lGW/hO26t6fo9rc8R0fak42swN7JNY6+/AbFOLLOu+IzQ1fYw1bhw6g
         fhNw2NQq42NUsjs68IfY+Nun/cgWRWrOwei8qcqo/9VljGiFoesl1iQFBDqoGL5jdfZC
         VAlR86w9pZ2RYHbaBvXqqQhD4XgrTuFVltcXACFXXkSAzuKA2rzNXzAGgOK+LXn5GjmK
         rfNottucCmuocwz+BnS2/y3lTGDh5vRE8zkec/BplIoykuN/yrdS3XdGTdXXOKQsGKh1
         gzPrw8DHN2mpgt2H0Iy//9qtrQMIKmIJET4b5s1XO3qXe6xH0qKHEA8WHMYmjfcKMWil
         FldA==
X-Gm-Message-State: AOJu0Yx5AvNhzwxSqMNa26job2aGN0qa3lK3LHk4IQC3JL5vDJFnWAqV
	YIdM+GEkIqc138v18OAwUGH3HQ==
X-Google-Smtp-Source: AGHT+IHVXN2lZ0qMDVaBcf5J4hhfE66D7j825cTMnjVADkLX/SKiDjjoAWvn5rnMzGqeyhKJHeemCw==
X-Received: by 2002:a2e:be9c:0:b0:2cc:1fb5:2a0 with SMTP id a28-20020a2ebe9c000000b002cc1fb502a0mr778737ljr.57.1702288245862;
        Mon, 11 Dec 2023 01:50:45 -0800 (PST)
Received: from [192.168.36.128] (178235179179.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.179])
        by smtp.gmail.com with ESMTPSA id vg16-20020a170907d31000b00a1cdf29af64sm4536638ejc.45.2023.12.11.01.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:50:45 -0800 (PST)
Message-ID: <f0f40f33-ebcd-4d68-86b2-3839bb8e49a3@linaro.org>
Date: Mon, 11 Dec 2023 10:50:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: sm8150: add USB-C ports to the
 USB+DP QMP PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-8-dmitry.baryshkov@linaro.org>
 <5025892d-0cbc-462a-b7d8-95828680dd8b@linaro.org>
 <CAA8EJprp+Rf5BKEnaoCooWVKGfg6SRg-uc=NRywc10qy=Yj2Xw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAA8EJprp+Rf5BKEnaoCooWVKGfg6SRg-uc=NRywc10qy=Yj2Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 10:46, Dmitry Baryshkov wrote:
> On Mon, 11 Dec 2023 at 11:33, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
>>> Expand Combo USB+DP QMP PHY device node with the OF ports required to
>>> support USB-C / DisplayPort switching.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 23 +++++++++++++++++++++++
>>>  1 file changed, 23 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>> index ea7c92c0e405..38423a9f8408 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>> @@ -3447,6 +3447,29 @@ usb_1_qmpphy: phy@88e8000 {
>>>                       #phy-cells = <1>;
>>>
>>>                       status = "disabled";
>>> +
>>> +                     ports {
>>> +                             #address-cells = <1>;
>>> +                             #size-cells = <0>;
>>> +
>>> +                             port@0 {
>>> +                                     reg = <0>;
>>> +                                     usb_1_qmpphy_out: endpoint {};
>> style 1
>>> +                             };
>>> +
>>> +                             port@1 {
>>> +                                     reg = <1>;
>>> +
>>> +                                     usb_1_qmpphy_usb_ss_in: endpoint {
>>> +                                     };
>> style 2
>>> +                             };
>>> +
>>> +                             port@2 {
>>> +                                     reg = <2>;
>>> +
>>> +                                     usb_1_qmpphy_dp_in: endpoint {};
>> style 3
>>
>> :(
> 
> Which one should I stick to?
style 2 seems to be used in 8650

Konrad


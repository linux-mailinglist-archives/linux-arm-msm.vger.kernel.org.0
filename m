Return-Path: <linux-arm-msm+bounces-3953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49880A3C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A461C20987
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40445662;
	Fri,  8 Dec 2023 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPAoOWEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133AF11C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:47:01 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so274239166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702039619; x=1702644419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMCWPUav6uhhvWfe9UyLRspCCYQQnVNrnd88EcKumhs=;
        b=XPAoOWEoKyH+b2bQz5MW+Swx5JzzmXFZEFMtzHDbbvX20Wef3ATwNazf9koOp9p5/i
         rj17jaAhD567M96CNbGmXJ8qiZPZW5ZLiHL5kkIIQftEhEfXcIVC04Ckij5gG6GmRXYi
         s6clgaO905BasRMSwufN1/Hubd/ZhYy9UOPFsvpaXeCrsuAldK0ApOeaqeFZu6hm2M7A
         oJwK1Y9lW5daMSxsCxs3+M79/j4OMrmd6JH4uQNAMjJhxngSCwBruHYLcVSudGF2Jgof
         0WPYV02lMs0opKQTwO08ueIp5wwbAD3ZAiEJbdvEIsilsYKHLm1jSjUwjKssHG2lJ+wF
         DHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039619; x=1702644419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMCWPUav6uhhvWfe9UyLRspCCYQQnVNrnd88EcKumhs=;
        b=vPz2y1L7DpmacJGNvBm88sAxfzVUrzQkTRbeYEorPRf1MLWV3Td+pgddSbnzxHwbIE
         jvCHSW/oqU7NXNEVLJJeXxRecGgWKsKexiiT90FbKn6G5XW76E9KER3+ucKoCgy+TohU
         ZZILTHzRuvl3Jc5CFzhI09BdfgKq1M58M7BiNU3v8Jv09eu0lvqr3/MsgnN8OWQN/+Vj
         k1bTKRPaHaKYoJwqDOR2H/R2jOthVVF6pNIkamYZrxtrei7aj/qvVQcRQMQ1EsE4fLMv
         uqM5pUe4kQX0veOqTMVDBC1/fG/VklGHnzbylVp6BJok9G0AQ48Pc0xyhvFL/Y039H+k
         17Ww==
X-Gm-Message-State: AOJu0Yw6Cpn72KF9gHr2FKwCN0kJLY8Bsn6+sd4EpkRd4/thtS6WEhdn
	iwwDLpWlc6DV813XVqC7EJO9hw==
X-Google-Smtp-Source: AGHT+IFf/7hcKBe115rybS+BVwW7/Vtd1r005VlJ58gXNQexRruEjFHwY9KlJ4L3L6pP5KNn25tFxQ==
X-Received: by 2002:a17:906:b20b:b0:a19:a1ba:da4c with SMTP id p11-20020a170906b20b00b00a19a1bada4cmr2454750ejz.115.1702039619554;
        Fri, 08 Dec 2023 04:46:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a1c522990ccsm978114ejc.85.2023.12.08.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 04:46:59 -0800 (PST)
Message-ID: <29d7c97f-cc98-4f67-9bdc-3005796180c9@linaro.org>
Date: Fri, 8 Dec 2023 13:46:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Abel Vesa
 <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Johan Hovold <johan@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
 <20231122-phy-qualcomm-edp-x1e80100-v3-2-576fc4e9559d@linaro.org>
 <b6d3928c-75ba-47a3-93fc-a60729be2e35@linaro.org>
 <545d3ace-66e5-4470-b3a4-cbdac5ae473d@linaro.org>
 <ab7223a2-9f3f-4c9c-ab97-31512e7a0123@linaro.org>
 <CAA8EJpoboN85bLiayXJgn5iwh+Gn0OtK0aZ26ZJu9H3xkTT2Tw@mail.gmail.com>
 <d9d27fa4-6ede-4958-b717-db425be61068@linaro.org>
 <CAA8EJpq7dB+45fiq2WmkMmSO7KszY0Et_t1gZ9ZvfsSxftpm8g@mail.gmail.com>
 <d885928d-035b-4abd-890b-c9626b925d76@linaro.org>
 <CAA8EJpr+C23evpRWMHatF6ChNvr3G-sAuXOi4e-7Tix23JV=Fg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJpr+C23evpRWMHatF6ChNvr3G-sAuXOi4e-7Tix23JV=Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/12/2023 13:35, Dmitry Baryshkov wrote:
>>>>> Same applies to the displayport-controller. It can either drive the DP
>>>>> or eDP output, hardware-wise it is the same.
>>>>
>>>> Therefore what I proposed was correct - the block which uses the phy
>>>> configures its mode. Because this part:
>>>>   "this phy is of this type on this board".
>>>> is not true. The phy is both types.
>>>
>>> But hopefully you don't mean using #phy-cells here. There are no
>>> sub-PHYs or anything like that.
>>
>> I am exactly talking about phy-cells. Look at first example from Abel's
>> code.
> 
> I always had an impression that #foo-cells means that there are
> different units within the major handler. I.e. #clock-cells mean that
> there are several different clocks, #reset-cells mean that there are
> several resets, etc.
> Ok, maybe this is not a perfect description. We need cells to identify
> a particular instance within the major block. Maybe that sounds more
> correct.

No, the cells have also meaning of additional arguments. See usage of
phy-type (not the one here, but the correct one) and PWMs.

> 
> For the USB+DP PHY we use #phy-cells to select between USB3 and DP
> PHYs. But for these PHYs we do not have sub-devices, sub-blocks, etc.
> There is a single PHY which works in either of the modes.

Is it different than case here?

> 
> Last, but not least, using #phy-cells in this way would create
> asymmetry with all the other PHYs (and especially other QMP PHYs)
> present on these platforms.

OK. Is phy-type not something different?

> 
> If you feel that phy-type is not an appropriate solution, I'd vote for
> not having the type in DT at all, letting the DP controller determine
> the proper mode on its own.

Can we do it? That's BTW the best option.

Best regards,
Krzysztof



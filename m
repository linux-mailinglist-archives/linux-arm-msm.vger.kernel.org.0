Return-Path: <linux-arm-msm+bounces-974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC457EF2E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 13:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC15281346
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 12:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B6630349;
	Fri, 17 Nov 2023 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2SYsnYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D986D5B
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 04:43:15 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9d10972e63eso275659466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700224994; x=1700829794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wmy0vwHLNSalg0GyBNA6b2vQ5xOe/KV1rGIN3z1r2II=;
        b=o2SYsnYJAsLFkxkASrNueX3dInnjxjich1AD0VOn1KHf0EQodRf0DEUasLYoHEtxIC
         AEKfgLbz2l5AOFqNaSqOCLagByHk9Thpspl528Tz2nx9eNjuUFiRkN81+ysCqRtYZ92O
         di7b8GFYxrwcpfJDbCTahimdaFmfiQvMMdQ6cpuR+9s00jOaVnFNYubOGdcha6Imxx4P
         qvjzi99UoUczQvyRqMCoenkS4uWxlJq560225Yi88ly3x/NfMc3OEqPf1HazzeBHJ8GH
         f8AFMMzsxQhMB3nY/84FED7lrpME4cbefaO+vkYsCV1RTCqo+o3cQU09SgFpwDLXBMtq
         YOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700224994; x=1700829794;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wmy0vwHLNSalg0GyBNA6b2vQ5xOe/KV1rGIN3z1r2II=;
        b=BHQ3G8iowNJ0lKlIKvWOTiGW1z1zKSVhii5e+BRTNkCCH7BA0sh3a6Y7NH3OLoZM0B
         s7q7yXuI6ELsqznyrs1bVcOWoC6Y03cTWTssJeewfgtsfIlBXP1b5tYcstZE/KcmCO+r
         ASeQqgsLWiEd7C3BwjJDTZAObvsTzeI4HT4SwdNKHSOGNNMI8WY3lfcjsTyV/wdPMYPs
         wTEvMsU+iHOrLX9Jl2UqZNJPo0dL9IXUzwcG+GnG9SVq2cSARR94yV/YFNARqxQ4i10z
         H14VX0t9HNyozVr7Vcq8WgnLyWMPLaPtKOsg7j2XscTsIzSICJB6OthIg/WwfnThcdg6
         VYjg==
X-Gm-Message-State: AOJu0YyPpQngV2pScnlWFJ+BbyzXLYai02fiOPfBhlPcWi7g46GARhIu
	Di7wT4AuEn0T/FunOtCNWSa8cw==
X-Google-Smtp-Source: AGHT+IGK8RpBkwmAlFDIK9TkhCN4GNO8OFT48dloJfm4+dv1liqy0C2k2bVJqW4uR0lmAaGJzX/HMQ==
X-Received: by 2002:a17:906:1919:b0:9e7:494a:8ed with SMTP id a25-20020a170906191900b009e7494a08edmr14101320eje.72.1700224993723;
        Fri, 17 Nov 2023 04:43:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id i14-20020a170906090e00b009ae57888718sm744664ejd.207.2023.11.17.04.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 04:43:12 -0800 (PST)
Message-ID: <77a194cd-d6a4-4c9b-87f5-373ed335528f@linaro.org>
Date: Fri, 17 Nov 2023 13:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Content-Language: en-US
To: Jie Luo <quic_luoj@quicinc.com>, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, robert.marko@sartura.hr
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-10-quic_luoj@quicinc.com>
 <834cbb58-3a88-4ba6-8db6-10440a4d0893@linaro.org>
 <76e081ba-9d5a-41df-9c1b-d782e5656973@quicinc.com>
 <2a9bb683-da73-47af-8800-f14a833e8ee4@linaro.org>
 <386fcee0-1eab-4c0b-8866-a67821a487ee@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <386fcee0-1eab-4c0b-8866-a67821a487ee@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2023 12:20, Jie Luo wrote:
> 
> 
> On 11/17/2023 6:40 PM, Krzysztof Kozlowski wrote:
>> On 17/11/2023 11:36, Jie Luo wrote:
>>>>>      clocks:
>>>>> -    items:
>>>>> -      - description: MDIO clock source frequency fixed to 100MHZ
>>>>> +    minItems: 1
>>>>> +    maxItems: 5
>>>>> +    description:
>>>>
>>>> Doesn't this make all other variants with incorrect constraints?
>>>
>>> There are 5 clock items, the first one is the legacy MDIO clock, the
>>> other clocks are new added for ipq5332 platform, will describe it more
>>> clearly in the next patch set.
>>
>> OTHER variants. Not this one.
> 
> The change here is for the clock number added for the ipq5332 platform,
> the other platforms still use only legacy MDIO clock.

Then your patch is wrong as I said. You now affect other variants. I
don't quite get your responses. Style of them suggests that you
disagree, but you are not providing any relevant argument.

> 
> so i add minItems  and maxItems, i will check other .yaml files for the
> reference.
> 
>>
>>>
>>>>
>>>>> +      MDIO system clock frequency fixed to 100MHZ, and the GCC uniphy
>>>>> +      clocks enabled for resetting ethernet PHY.
>>>>>    
>>>>>      clock-names:
>>>>> -    items:
>>>>> -      - const: gcc_mdio_ahb_clk
>>>>> +    minItems: 1
>>>>> +    maxItems: 5
>>>>> +
>>>>> +  phy-reset-gpio:
>>>>
>>>> No, for multiple reasons. It's gpios first of all. Where do you see such
>>>> property? Where is the existing definition?
>>>
>>> will remove this property, and update to use the exited PHY GPIO reset.
>>>
>>>>
>>>> Then it is "reset-gpios" if this is MDIO. Why do you put phy properties
>>>> in MDIO?
>>>>
>>>>> +    minItems: 1
>>>>> +    maxItems: 3
>>>>> +    description:
>>>>> +      GPIO used to reset the PHY, each GPIO is for resetting the connected
>>>>> +      ethernet PHY device.
>>>>> +
>>>>> +  phyaddr-fixup:
>>>>> +    description: Register address for programing MDIO address of PHY devices
>>>>
>>>> You did not test code which you sent.
>>>
>>> Hi Krzysztof,
>>> This patch is passed with the following command in my workspace.
>>> i will upgrade and install yamllint to make sure there is no
>>> warning reported anymore.
>>>
>>> make dt_bg_check
>>
>> No clue what's this, but no, I do not believe you tested it at all. It's
>> not about yamllint. It's was not tested. Look at errors reported on
>> mailing list.
>>
>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
>>
> 
> Hi Krzysztof,
> Here is the output when i run the dt check with this patch applied in my 
> workspace, md64 is the alias for compiling the arm64 platform.

We still do not know your base and dtschema version.


Best regards,
Krzysztof



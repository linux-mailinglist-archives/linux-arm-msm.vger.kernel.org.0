Return-Path: <linux-arm-msm+bounces-1994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F23AB7F8D37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 19:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50A81B20E46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 18:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C3D2E40A;
	Sat, 25 Nov 2023 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ah8CH1+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD55182
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 10:44:48 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a06e59384b6so359945066b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 10:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700937887; x=1701542687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apOXTcWKWpkE4SfJHSscK7soaBBzpXCbTsflcfpPDQc=;
        b=Ah8CH1+npWY0Ylt1I5VQ2yIly8hC0g67wtCQhkQ4LVGQJ3fx4AWcDwAfSzGCSPVmiT
         IClxcOkrvpOpBohzkwyz5uQMtQ/8GHBRQ5GPg3CEAW4l2tt6x8I4pdHkl9x/m6iOHqIg
         u4FAILHwohTo3hEBczfc7sU4v4Hio+FqZRak7/tjHtcaSVSHrcJYc4L625OqUtZzU7HH
         VpWPH/imjG5/Qf7SAMbkJEJWZ+NlX5gO2ATLCXTKXdxVwt95ByFS1a6Jv+DSyhc/yzVv
         2HhlDIcdKbdhvAUuz8acAsU367krmJWv4zwWty9sWNetsu0ALnFcsgW75hM54AT0FpZY
         cHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700937887; x=1701542687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apOXTcWKWpkE4SfJHSscK7soaBBzpXCbTsflcfpPDQc=;
        b=r8CpsirEyYuOu4ZHt2KhKS1FvWYJOx15thgQR1MMpLxBJWUoj2LYpw3njanvbluyK9
         WFbcwQ9v6DFovO5nWpLOreJAcPv2ilqcyZ5vdNZbpzci21ow3YWVweU6VG7xqitgiI3R
         zdeJUM5zZn2y4eedo0plASJ+5/cRihVw6Q3BqjCQ+ko2Yf4REZs2nie89PfAKnYoIni8
         i+Jd6pb9ex7VozrL0KCrXfX8ipgjuis8ovzVLSoDAKsFXUVWv8QpYAtmEqRaCPgwmqow
         EDhT2iORJqyGLHz2AmULo/iPV5M0/8Sl01NrBVyyFCBgtCYBuXmFkFuXLT+lMFedTRjA
         DxwA==
X-Gm-Message-State: AOJu0YzCwIuKSjt/WMzn5JjwCKg1IlGHVdOPt+Ag2ltA5BKrA47/8j07
	bM+2v8lt+HA9KaVgUAPLcLH2HQ==
X-Google-Smtp-Source: AGHT+IHlwz8VvgWwvQxrUeBquBYNI5NZjQ1wPyt1NNYIPVrmX83BxuZvWqFF+sXZatesnrPlEjYAYw==
X-Received: by 2002:a17:906:d28b:b0:a00:47fa:2251 with SMTP id ay11-20020a170906d28b00b00a0047fa2251mr5041743ejb.32.1700937886891;
        Sat, 25 Nov 2023 10:44:46 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id mf12-20020a170906cb8c00b009a13fdc139fsm3797155ejb.183.2023.11.25.10.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 10:44:46 -0800 (PST)
Message-ID: <89b2f3ae-52df-4304-9e51-5af73d52ea4c@linaro.org>
Date: Sat, 25 Nov 2023 19:44:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
 <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAL_JsqL_caP2Adh5ntrHb24sXOY9x=TxvCSnnSCq--rm3B0FoA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAL_JsqL_caP2Adh5ntrHb24sXOY9x=TxvCSnnSCq--rm3B0FoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 15:55, Rob Herring wrote:
> On Wed, Nov 22, 2023 at 1:05 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 21/11/2023 14:50, Rafał Miłecki wrote:
>>>> +Order of Nodes
>>>> +--------------
>>>> +
>>>> +1. Nodes within any bus, thus using unit addresses for children, shall be
>>>> +   ordered incrementally by unit address.
>>>> +   Alternatively for some sub-architectures, nodes of the same type can be
>>>> +   grouped together (e.g. all I2C controllers one after another even if this
>>>> +   breaks unit address ordering).
>>>> +
>>>> +2. Nodes without unit addresses should be ordered alpha-numerically by the node
>>>> +   name.  For a few types of nodes, they can be ordered by the main property
>>>> +   (e.g. pin configuration states ordered by value of "pins" property).
>>>> +
>>>> +3. When extending nodes in the board DTS via &label, the entries should be
>>>> +   ordered alpha-numerically.
>>>
>>> Just an idea. Would that make (more) sense to make &label-like entries
>>> match order of nodes in included .dts(i)?
>>>
>>> Adventages:
>>> 1. We keep unit address incremental order that is unlikely to change
>>>
>>> Disadventages:
>>> 1. More difficult to verify
>>
>> Rob also proposed this and I believe above disadvantage here is crucial.
>> If you add new SoC with board DTS you are fine. But if you add only new
>> board, the order of entries look random in the diff hunk. Reviewer must
>> open SoC DTSI to be able to review the patch with board DTS.
>>
>> If review is tricky and we do not have tool to perform it automatically,
>> I am sure submissions will have disordered board DTS.
> 
> I'm certainly in favor of only (or mostly?) specifying things we can
> check with tools. I don't need more to check manually...
> 
> It wouldn't be too hard to get path from labels. dtc generates that
> with -@ already. So I don't buy "we don't have a tool" if a tool to
> check seems feasible.

OK, then tool is not an argument. In Qualcomm and Samsung we already use
alphabetical order in board DTS, so keeping that existing style could be
an argument. I don't have strong preference, except the need to
re-shuffle all DTS files which would be a quite disastrous for future
stable-backports. I can mention both styles.

Best regards,
Krzysztof



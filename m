Return-Path: <linux-arm-msm+bounces-1328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C96DF7F2A5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 11:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E01991C209CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 10:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0AA1EB46;
	Tue, 21 Nov 2023 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FgialH4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03C1123
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 02:28:35 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50930f126b1so7018512e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700562514; x=1701167314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVRDDBzCiN0yGxEcaavJVtsWWKQ26OPLgFyvV4vi+f4=;
        b=FgialH4YVIvW0GAAp2t1Ku5/mgp7Bo89k3Hv4r6di9UqBcKFf+diolBx7qqg1I1YXq
         vxAXDWeqV6hwmycH7w7C9JEIpr/cuSffOBe4ezB8Oi9HMYp2EJSlrXLOl1TSTGjxWp9C
         tMsziwQCg422J3Z17LbRRoPBJeOomp5sOlhpDAt63v2yiy0Rsq39SwN+pjFQXNXWDiYe
         XmPFRQSrkwRzubH6yYiA4BTsLHQ3DkY2PhOccgZ3DgNODpf/8VTdoDV431HMHjUqaK3R
         CWB/OQt3U5dECPiJfolfLndsMPuHvLpBl18Kt32fRSgzpkKkWk5IeMRxn9gEsILKosO+
         eqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700562514; x=1701167314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVRDDBzCiN0yGxEcaavJVtsWWKQ26OPLgFyvV4vi+f4=;
        b=qbuumHJK60fO7Pse9SaYQvqJeafeW2V+4oGdd51tenvq22YzPrVkVa5i0a/j+8wWsZ
         l/1IDKwZWH/apIRouBjvJ9mJCpWC/fzQNvTil2+ePhTEiQSibuvfOyObueO/L2QZ7psT
         lQ5T998D5pHBORazjf4Tc7CNTTbgI5UIWVx4kr+HEoszrNDEqa5MS1J8pRB795XQZugb
         4+H6AYsLbtSPXjkdkh7Lc2/glG+kw5eKFjiaWyABwJxK2BS+L0fdDAUpK2gho/fC5O/9
         IMGTbmndiFq7kIwz27n2NrSs8UHhQwDROXAhaO+mQz9Z6bDdyO8BcBFSNGFtcOEyhlVq
         M7qg==
X-Gm-Message-State: AOJu0YyiAd76zZKHanTjjZoIaThEYxsWnHILz66jYr2OkIADGHfIdxhl
	eeRFu1HZ7T+RmPB4y1xI3RqsOg==
X-Google-Smtp-Source: AGHT+IGZaa1oBQkynmiTPevxZGR7T6fEl8l2wzgn95wwSGErbTaWSpzMf7eZdzAfeYCOnmxlnDyWLQ==
X-Received: by 2002:a19:384c:0:b0:509:8e9e:a416 with SMTP id d12-20020a19384c000000b005098e9ea416mr5987611lfj.47.1700562513839;
        Tue, 21 Nov 2023 02:28:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id w11-20020a056402070b00b005489d3b0a58sm2752349edx.55.2023.11.21.02.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 02:28:33 -0800 (PST)
Message-ID: <6513aefa-b0be-4a29-8c9c-483822217ebf@linaro.org>
Date: Tue, 21 Nov 2023 11:28:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
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
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com>
 <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
 <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org>
 <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
 <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
 <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
 <CAA8EJpo6w9N_opJkfDaF-20zwZmn6JHrYYhakqzLFqVtgXaV=Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJpo6w9N_opJkfDaF-20zwZmn6JHrYYhakqzLFqVtgXaV=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 11:13, Dmitry Baryshkov wrote:
> On Tue, 21 Nov 2023 at 10:09, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Krzysztof,
>>
>> On Tue, Nov 21, 2023 at 8:47 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> On 21/11/2023 08:33, Michal Simek wrote:
>>>> On 11/20/23 20:31, Krzysztof Kozlowski wrote:
>>>>> On 20/11/2023 20:18, Geert Uytterhoeven wrote:
>>>>>> On Mon, Nov 20, 2023 at 3:53 PM Krzysztof Kozlowski
>>>>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>>>> On 20/11/2023 15:01, Michal Simek wrote:> >
>>>>>>>> On 11/20/23 09:40, Krzysztof Kozlowski wrote:
>>>>>>>>> Document preferred coding style for Devicetree sources (DTS and DTSI),
>>>>>>>>> to bring consistency among all (sub)architectures and ease in reviews.
>>>>>>
>>>>>>>>> +Organizing DTSI and DTS
>>>>>>>>> +-----------------------
>>>>>>>>> +
>>>>>>>>> +The DTSI and DTS files should be organized in a way representing the common
>>>>>>>>> +(and re-usable) parts of the hardware.  Typically this means organizing DTSI
>>>>>>>>> +and DTS files into several files:
>>>>>>>>> +
>>>>>>>>> +1. DTSI with contents of the entire SoC (without nodes for hardware not present
>>>>>>>>> +   on the SoC).
>>>>>>>>> +2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
>>>>>>>>> +   entire System-on-Module).
>>>>>>>>
>>>>>>>> DTS/DTSI - SOMs can actually run as they are that's why it is fair to say that
>>>>>>>> there doesn't need to be DTS representing the board.
>>>>>>>
>>>>>>> I have never seen a SoM which can run without elaborate hardware-hacking
>>>>>>> (e.g. connecting multiple wires to the SoM pins). The definition of the
>>>>>>> SoM is that it is a module. Module can be re-used, just like SoC.
>>>>>>
>>>>>> /me looks at his board farm...
>>
>>>>>> I guess there are (many) other examples...
>>>>>
>>>>> OK, I never had such in my hands. Anyway, the SoM which can run
>>>>> standalone  has a meaning of a board, so how exactly you want to
>>>>> rephrase the paragraph?
>>>>
>>>> What about?
>>>>
>>>> 2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
>>>> entire System-on-Module). DTS if runs standalone.
>>>
>>> OK, but then it's duplicating the option 3. It also suggests that SoM
>>> should be a DTS, which is not what we want for such case. Such SoMs must
>>> have DTSI+DTS.
>>
>> So you want us to have a one-line <SoM>.dts, which just includes <SoM>.dtsi?
> 
> Well, I think it is impossible to run SoM directly. There is a carrier
> board anyway, which includes at least regulators. So, I guess, the
> SoM.dts will not be a oneline file.

Geert claims he has SoM with an USB connector which can run when power
is supplied by that USB connector. I can imagine a CPU board (so a SoM
in format of a board, not small DIMM-card) which has connectors e.g. for
power and a slot for external motherboard for additional, optional
interfaces.

Look at picture on 14th page:
https://www.renesas.com/us/en/document/mat/rza2m-cpu-board-users-manual

This looks like some case of SoM, although maybe not that popular
outside of Renesas :)

Best regards,
Krzysztof



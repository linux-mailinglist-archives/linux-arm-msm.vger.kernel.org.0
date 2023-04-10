Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93D86DC86A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 17:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjDJPYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 11:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjDJPYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 11:24:34 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E4D5260
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 08:24:25 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id sg7so24685256ejc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681140264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jj5+3ZBXZlAI89ruKQzbvuNr2OLoK3zQC3mxyhHDlXY=;
        b=sACzFZmix2ExkW3aGoI4YImeHplLF968Y0NFC03Af5ZIZxJCuZvSYnq3ua9uh17i2J
         +K6YBNgkXYjnVRVJf2BudYOjxzD3HdBJdKR3fux3CLludVyPoGlkQHRTmxph88LAkcD1
         skNgJd7PCeYz40rflkiXp2MYP4dYzSn0cl4rLxS9FdjkDjPuTG2HFjfn698u0CaUjFv8
         rb9EuWbktPfq6H6is0zUHXvFObbQ06QtoTE8XNUy5ciOjKV78hviZbDDt6T4PUioryeB
         X+X6ibVjMbZaN6I37/PatPdvAQL4Av+G5Op5XqunfWI/sYj+ZexeGWkdJlDRsFPi7b38
         HClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj5+3ZBXZlAI89ruKQzbvuNr2OLoK3zQC3mxyhHDlXY=;
        b=BLlo3PCgUQwN6RNYK9r8kpp4yaZzjccYOrctSwB6RKldvKkC4xsjR2sSs7Id0IjpzN
         yftPe6hg6aR7MwdCfsjmhDfvszG9Xm9eP4ZrZPyP8NxFAKwfYyCc8QTVpApu8pLBaxn5
         Z5ZQslasnhFJbuHJIc4GX0R+2erHyKA9IEtUJZPR0QK419Xulyfaj2h01Pp2bcZQzT9G
         AHGCGq4qBnjUW8EG0Et3Cbc6HQ6t5G6YmiMolQQZcTwezQVWWsLjiKAjYVaP7Fx/22b4
         YJCm3QfulWlK690PiUTfAyGIu89qAu4Qa9dFqCl7L8ZxH9BHE5kePPvM7yj14PBCQaFh
         xaRA==
X-Gm-Message-State: AAQBX9dBLkVgcgr7yAKcW30SimqD/4ZBTEZQYG/tbbxx/o+FkAlb2l4a
        Y0HoMA4/8JYjBTjjW6UUI1zhJw==
X-Google-Smtp-Source: AKy350aYATRkzhtIB8/RV4T6cU+DWN8vNaHakdLW8PQEjTEys7IG9UNpdyTPEtAV6D8gWGnYnwkrCA==
X-Received: by 2002:a17:907:2097:b0:94a:7196:ab7c with SMTP id pv23-20020a170907209700b0094a7196ab7cmr4188488ejb.46.1681140264362;
        Mon, 10 Apr 2023 08:24:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eacd:ffa4:1df7:3870? ([2a02:810d:15c0:828:eacd:ffa4:1df7:3870])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906c08d00b0092f289b6fdbsm5193104ejz.181.2023.04.10.08.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 08:24:23 -0700 (PDT)
Message-ID: <4558c8c0-34a3-aa78-31ac-1de5059be190@linaro.org>
Date:   Mon, 10 Apr 2023 17:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 0/8] Add multiport support for DWC3 controllers
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>,
        "quic_ppratap@quicinc.com" <quic_ppratap@quicinc.com>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "quic_jackp@quicinc.com" <quic_jackp@quicinc.com>,
        "quic_harshq@quicinc.com" <quic_harshq@quicinc.com>,
        "ahalaney@redhat.com" <ahalaney@redhat.com>,
        "quic_shazhuss@quicinc.com" <quic_shazhuss@quicinc.com>
References: <20230405125759.4201-1-quic_kriskura@quicinc.com>
 <20230408014251.6cyjwuvsgu7dmz53@synopsys.com>
 <70dd6449-06d2-7182-9922-ddc3476ba472@linaro.org>
 <20230408230901.es3b2hetqs53gvqd@synopsys.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230408230901.es3b2hetqs53gvqd@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/04/2023 01:09, Thinh Nguyen wrote:
> On Sat, Apr 08, 2023, Krzysztof Kozlowski wrote:
>> On 08/04/2023 03:42, Thinh Nguyen wrote:
>>>> Krishna Kurapati (8):
>>>>   dt-bindings: usb: Add bindings for multiport properties on DWC3
>>>>     controller
>>>>   usb: dwc3: core: Access XHCI address space temporarily to read port
>>>>     info
>>>>   usb: dwc3: core: Skip setting event buffers for host only controllers
>>>>   usb: dwc3: core: Refactor PHY logic to support Multiport Controller
>>>>   usb: dwc3: qcom: Add multiport controller support for qcom wrapper
>>>>   arm64: dts: qcom: sc8280xp: Add multiport controller node for SC8280
>>>>   arm64: dts: qcom: sa8295p: Enable tertiary controller and its 4 USB
>>>>     ports
>>>>   arm64: dts: qcom: sa8540-ride: Enable first port of tertiary usb
>>>>     controller
>>>>
>>>>  .../devicetree/bindings/usb/snps,dwc3.yaml    |  13 +-
>>>>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts      |  47 +++
>>>>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts     |  22 ++
>>>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  58 +++
>>>>  drivers/usb/dwc3/core.c                       | 373 ++++++++++++++----
>>>>  drivers/usb/dwc3/core.h                       |  71 +++-
>>>>  drivers/usb/dwc3/drd.c                        |  13 +-
>>>>  drivers/usb/dwc3/dwc3-qcom.c                  |  28 +-
>>>>  8 files changed, 523 insertions(+), 102 deletions(-)
>>>>
>>>> -- 
>>>> 2.40.0
>>>>
>>>
>>> Please check if your patches and mailing client. Looks like they are
>>> corrupted.
>>
>> All patches look from patch-syntax and apply fine. What is exactly
>> corrupted?
>>
> 
> Hm... perhaps it's an encoding issue from my mail client then. I get
> this from my automated checks:
> 
> <snip>
> 
> ERROR: spaces required around that '=' (ctx:WxV)
> #429: FILE: drivers/usb/dwc3/core.h:1697:
> +		if (offset !=3D start && (id =3D=3D 0 || XHCI_EXT_CAPS_ID(val) =3D=3D id=
>  		                                                               ^
> 
> ERROR: spaces required around that '=' (ctx:VxV)
> #429: FILE: drivers/usb/dwc3/core.h:1697:
> +		if (offset !=3D start && (id =3D=3D 0 || XHCI_EXT_CAPS_ID(val) =3D=3D id=
>  		                                                                  ^
> 
> ERROR: spaces required around that '=' (ctx:VxE)
> #429: FILE: drivers/usb/dwc3/core.h:1697:
> +		if (offset !=3D start && (id =3D=3D 0 || XHCI_EXT_CAPS_ID(val) =3D=3D id=
>  		                                                                        ^
> 
> ERROR: do not use assignment in if condition
> #429: FILE: drivers/usb/dwc3/core.h:1697:
> +		if (offset !=3D start && (id =3D=3D 0 || XHCI_EXT_CAPS_ID(val) =3D=3D id=
> 
> ERROR: spaces required around that '=' (ctx:WxV)
> #433: FILE: drivers/usb/dwc3/core.h:1700:
> +		next =3D XHCI_EXT_CAPS_NEXT(val);
>  		     ^
> 
> ERROR: spaces required around that '+=' (ctx:WxV)
> #434: FILE: drivers/usb/dwc3/core.h:1701:
> +		offset +=3D next << 2;
> 
> </snip>
> 
> 
> The "=" gets encoded to =3D, which is strange. It never happened before.
> I need to check my mail client. Sorry for the noise.

I don't see it, but I did not check each patch thoroughly. I also do not
know to which patch do you refer to. It is the easiest to reply inline
under the block which is corrupted. If you suspect you email client is
the cause, just check on lore.

Best regards,
Krzysztof


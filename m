Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964D6762258
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 21:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjGYTgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 15:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjGYTf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 15:35:59 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD611FF7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 12:35:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51e619bcbf9so7819913a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690313754; x=1690918554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gclOxOI7R55sgWeaMlz/Z0n4pJQKGgWmP/XSgabn5CQ=;
        b=d4QLpyD3un3dapKm8HJW4wcTeMoP9vd5EQ+cG7vzlfCbHWgToVF5CWS67zGoWKtKHJ
         qHx5QaJW0dPKK7BH7Cn9VZAo83DkRuMDBW8nyIUls5EWqwi8MZQmqEalSS1iTVlLnc/P
         CPGDShTPMcYfjCWofWuc2iEXLIZ07cwS8gD/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690313754; x=1690918554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gclOxOI7R55sgWeaMlz/Z0n4pJQKGgWmP/XSgabn5CQ=;
        b=ct+RR8cZC96VeUtWDa6+dfgWKXfRuN+doOCK5VlAFStJ3CBL6yo6phSVgOKYVJ6Fbg
         J4G5ujdlfYjbvjMQl4HuWVO4BRxIsL5i4xCoTlR2YIy6bjMnrbHWqnNINyRAWea93aPV
         gTmsVFlNZ6bxNMPfJ+43HAOYJahysJqUZP0dpyJ9NJblN//hAIgVgX5yz669TZQPP/Ac
         YZfQ5SY3FU1IQkZaffyfRGkteZvN6bqqkvzXKz7ji9yYpI5qV+f99OwqfD1KwrDc4LTl
         gqJIEuwFonBsKL6XVQlfZQy1V+32qZiTbTIaMfGOuKuqiNBhJn3lGLGQojTpBxONHLmK
         2AdQ==
X-Gm-Message-State: ABy/qLZzMk551zDOyEGXhfecM59ia4vWREarkJrFkns/22Jf3odh7OkT
        EdSX4R5dB7gIBb0aW++82a6oonSRmwQ0xBQcxL3bYDnt
X-Google-Smtp-Source: APBJJlF3De/+8paWmD6HIUgxIhg01/vDUhwaW7+cTYWFT3FvEvZgM5bdl9fBGn0NkMvKimXtLFe3Lg==
X-Received: by 2002:a17:906:259:b0:965:6075:d0e1 with SMTP id 25-20020a170906025900b009656075d0e1mr13478333ejl.72.1690313753603;
        Tue, 25 Jul 2023 12:35:53 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id lv19-20020a170906bc9300b00989257be620sm8465145ejb.200.2023.07.25.12.35.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 12:35:52 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5223910acf2so3135a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 12:35:52 -0700 (PDT)
X-Received: by 2002:a50:9514:0:b0:519:7d2:e256 with SMTP id
 u20-20020a509514000000b0051907d2e256mr170514eda.0.1690313752109; Tue, 25 Jul
 2023 12:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230725084633.67179-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725084633.67179-1-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 25 Jul 2023 12:35:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xt26=rBf99mzkAuwwtb2f-jnKtnHaEhXnthz0a5zke4Q@mail.gmail.com>
Message-ID: <CAD=FV=Xt26=rBf99mzkAuwwtb2f-jnKtnHaEhXnthz0a5zke4Q@mail.gmail.com>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sc7280: drop incorrect EUD port on
 SoC side
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 25, 2023 at 1:46=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Qualcomm Embedded USB Debugger (EUD) second port should point to Type-C
> USB connector.  Such connector was defined directly in root node of
> sc7280.dtsi which is clearly wrong.  SC7280 is a chip, so physically it
> does not have USB Type-C port.  The connector is usually accessible
> through some USB switch or controller.
>
> Correct the EUD/USB connector topology by removing the top-level fake
> USB connector and adding appropriate ports in boards having actual USB
> Type-C connector defined (Herobrine, IDP).  All other boards will have
> this EUD port missing.
>
> This fixes also dtbs_check warnings:
>
>   sc7280-herobrine-crd.dtb: connector: ports:port@0: 'reg' is a required =
property
>
> Fixes: 9ee402ccfeb1 ("arm64: dts: qcom: sc7280: Fix EUD dt node syntax")
> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Not tested on hardware.
> ---
>  .../arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 +++++++++++++
>  .../arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi | 15 +++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          | 21 +------------------
>  3 files changed, 31 insertions(+), 20 deletions(-)

FWIW, I've always been very intrigued about the embedded USB port but
never managed to find any way to get it actually enabled. :( ...so I'm
probably not the best person to actually review this. That being said:

1. I'm nearly certain that this is completely unusable on herobrine
boards. Specifically on herobrine there's a USB hub between the SoC
and all the physical ports on the device and (I think?) that prevents
EUD from working. It is possible that hoglin/zoglin is an exception
here and Qualcomm might have some backdoor way to access EUD on these
devices since this is hardware that they built.

2. I've always been pretty baffled about the sc7280 EUD stuff since
the device tree shows the EUD on "usb_2". For some background: there
are two USB controllers on sc7280. There's "usb_1" which is USB
2.0/3.0 capable and, at an SoC level, is the "Type C" port.
Specifically the pins on the SoC for the USB 3.0 signals are the same
pins on the SoC as two of the DisplayPort lanes. Then there's "usb_2"
which is USB 2.0 only. If you'll notice, "usb_2" is not set to status
"okay" on any boards except "sc7280-idp.dts".

I asked Qualcomm at least a few times in the past if the EUD is truly
on the USB 2.0 port (which means it isn't connected to anything on
herobrine boards) or if it's actually on the "type C" port (which
means there's a hub in between) and never got a ton of clarify...

Given how baffling everything is, I wouldn't be opposed to just
deleting the EUD from the device tree until there is more clarity
here. If you don't want to just delete it, at least I'd say that it
shouldn't be hooked up for herobrine.

-Doug

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2E4668F66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 08:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235371AbjAMHng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 02:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238902AbjAMHnF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 02:43:05 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF02E1DF16
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 23:43:03 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id cf18so43974685ejb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 23:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9fmIJc68vb/dpe2aUgc9GwKKtWf/YipuVliNTzq4hAE=;
        b=Jg+ThatndKiwgz9RECLXAFxz1B0/L46pWmp/CErwVAAzUS+FUbCBQWzXqekxS7kT5Y
         sZV9e4dBjMaFUQakfhSnbXE6PUVZ9gtdVRjSgFuRZ7UVIx/B1kuVIG/mTLlRxW439/X1
         Fj+pluC9o3bz5iYIZgCPxF2dgw5H0/gbC7m2sdwS2iwF0wwwA2hhBCuE2o0fUk8M9MCN
         jQDW0OXem87Qzyd3/IrB+JExIxBA+sOx2tkITyUkbJVk41L+fjOFRR5hxsosN4eVUjpJ
         gKZHDPe7R2+SDUfMDR1nCGFCnXW6k4TNMaqdv/yxCbBR2Dt5YYyE3VMnwTT5jzZ6ICHy
         HkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9fmIJc68vb/dpe2aUgc9GwKKtWf/YipuVliNTzq4hAE=;
        b=l9OzJzeracZ+bJfsJZ/G1Fr0bqp/TnY114f4FWELSEQBixGK040vAYTVN5bWmpQP2H
         RCR3i8TuR+9KtFd0P+ekm32fhqMUJXaULwjtejQIhE1nB8bJvRBIKvDj0tY/TviqCUph
         N31ZVF4g9Kmg91YXfujcQX3MTvKAD1xHW4krzagSf9cth6VsL65G4QZoq39friqrpEyt
         NVwEI6pcoie8nAIEtundc5UKwFb3sAyx5Wqhw2jN0mnbLnixf+fLo8gKrK9et7Q75e2k
         XjyZvhCAPdpXdBY9CcFkGUkQonMKbOPbbpPHmc7v4s5NYDgEjA+vBYDXTRekNePtId0e
         pkmw==
X-Gm-Message-State: AFqh2kqmquC5YBmwlnF5Mzf37gnDXhGBAKLg/GZP22/rDN+oV+AJTuj4
        dwrKmKHKJxyGFNw1c4y08VFpww==
X-Google-Smtp-Source: AMrXdXtsKwRdrzZmYjZPVOJhVqAxfq7Od77kmMoSQ/3P2/S/WxytDSSYO8UY2hBmYbdv2d+ya3bo+w==
X-Received: by 2002:a17:907:d311:b0:86a:2c18:e422 with SMTP id vg17-20020a170907d31100b0086a2c18e422mr1931559ejc.77.1673595782407;
        Thu, 12 Jan 2023 23:43:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id sb25-20020a1709076d9900b007a4e02e32ffsm8290030ejc.60.2023.01.12.23.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:43:01 -0800 (PST)
Message-ID: <8109445e-a21c-3159-1182-5be45fa0ce8e@linaro.org>
Date:   Fri, 13 Jan 2023 08:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: add display port audio
Content-Language: en-US
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221221071734.2887901-1-judyhsiao@chromium.org>
 <afd7851b-0846-c21f-a769-10fb920c7c80@linaro.org>
 <CAJXt+b8eez8KTocoAi0WP8qC3YdA9bfOTPbY8ZGfXNb-MNaT-Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJXt+b8eez8KTocoAi0WP8qC3YdA9bfOTPbY8ZGfXNb-MNaT-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 02:24, Judy Hsiao wrote:
>> Why do you change link@1 from DP to ALC?
> Because I want make the order to be consistent with the 3 mic version. Thanks!
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi

You cut entire context. I don't know what is this about.

Best regards,
Krzysztof


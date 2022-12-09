Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40136487FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 18:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiLIRxn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 12:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiLIRxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 12:53:42 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31CDA252B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 09:53:40 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id n20so13325701ejh.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/wRgTT7mfPEDjEBC1SBU9VxUa8TZcUsiPK96xgeDuoY=;
        b=HVOMQPYvrmBDtrv9eaX/4gK3RTAZPgUUTGWINcWrpBhKNJBnLTkF7AD9upQcm7SAbr
         nygR+llDuVa+oA61p3UcXKk0TB+w8BpBX2jPNROk+vSeKEp0xsaABv1wdiqxX7U3Xr9n
         hxkogHROR1+ExrxA2jPopXyWwMvQuocZPfUlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wRgTT7mfPEDjEBC1SBU9VxUa8TZcUsiPK96xgeDuoY=;
        b=xvPGjBnK6li9Okity5qAgaUnOpfZrlXOztnepfoYMR/r+O6QBTlUOZ3AULyL5mgZba
         1dkIfBe35Qp0Bd4R9VihrfWP2+zb6kKZGM0kkbu8BvZLTuK72h4mWdx3K3vNqwcHhgZX
         T3Bj7d6iDJdX/VihLCfJPpx8/y/KoWErZi5cHSR2DDxI7556biNFeqzRnHNu1wnIw9r2
         eZGH79Y0+u50fxHdxhGvTZWyteHXAxx30HyZfjbgDtwce2Aq1Mjs81AqQ0CPMO26T21w
         QA/f52tgMxe4yVWVyF/yeQoVgmO2Tn7GeCudXybc49rXMc0W+ZvCOFKwhvIgHpNOa3Ok
         v5xw==
X-Gm-Message-State: ANoB5plupxuQokODUbVmH0klwG2Q3hk9rLPfk0gpLDb3QfwvzyYTc6aU
        nRStr/yUvWUJ6nsx76OSrBq+AKzjp14hoN2r/gg=
X-Google-Smtp-Source: AA0mqf477kmLiVJ1+Kl1KRSLBl8SpCPyb6Vx0Lvr4I7Zc8nHizIgFtznQXMET5Pg0Gmbl5WKca++5g==
X-Received: by 2002:a17:906:844:b0:7ad:fd3e:8fd4 with SMTP id f4-20020a170906084400b007adfd3e8fd4mr5115167ejd.69.1670608418684;
        Fri, 09 Dec 2022 09:53:38 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709067c0f00b007aec1b39478sm158922ejo.188.2022.12.09.09.53.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 09:53:37 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so374643wms.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 09:53:37 -0800 (PST)
X-Received: by 2002:a7b:cd18:0:b0:3d1:e45f:34f with SMTP id
 f24-20020a7bcd18000000b003d1e45f034fmr8849715wmj.188.1670608417210; Fri, 09
 Dec 2022 09:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20221202155738.383301-1-krzysztof.kozlowski@linaro.org>
 <20221202155738.383301-2-krzysztof.kozlowski@linaro.org> <CAD=FV=UPLssDromnt89RYbSEU9qq_t+CSyd5VhmD7b-9JkcMFA@mail.gmail.com>
 <c0b660bf-93c2-89b6-e704-17489efe6840@linaro.org>
In-Reply-To: <c0b660bf-93c2-89b6-e704-17489efe6840@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Dec 2022 09:53:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UjwDkgXXmVcV-XNsPKOGh=TVsQexC0YQoU-_fz==y+UQ@mail.gmail.com>
Message-ID: <CAD=FV=UjwDkgXXmVcV-XNsPKOGh=TVsQexC0YQoU-_fz==y+UQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sdm845: align TLMM pin
 configuration with DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Dec 9, 2022 at 2:25 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/12/2022 17:53, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Dec 2, 2022 at 7:57 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> DT schema expects TLMM pin configuration nodes to be named with
> >> '-state' suffix and their optional children with '-pins' suffix.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Cc: Doug Anderson <dianders@chromium.org>
> >>
> >> Tested on Qualcomm RB3. Please kndly test a bit more on other devices.
> >> This should not have an functional impact.
> >>
> >> Changes since v2:
> >> 1. Bring back UART6 4-pin bias/drive strength to DTSI.
> >
> > Just to be clear, it doesn't actually belong in the DTSI, but it was
> > there before your patch and it's fine if your patch series doesn't fix
> > the whole world. I'm OK with this one staying in the DTSI for now just
> > to keep things simpler.
> >
> > One change missing in v3 that I would have expected based on our
> > discussion in the previous version would be to "Add UART3 4-pin mux
> > settings for use in db845c." I think you said you would do this, but I
> > don't see it done.
>
> Hm, I don't recall that. Changing db845c to usage of RTS/CTS is
> independent problem, not related to fixes or aligning with DT schema.

It was in the message:

https://lore.kerne.org/r/68bcdf25-e8e3-f817-f213-efb0bce3f43a@linaro.org

I said:

> FWIW, I would have expected that the SoC dtsi file would get a "4-pin"
> definition (similar to what you did with qup_uart6_4pin) and then we'd
> use that here.

You said:

> Sure.

-Doug

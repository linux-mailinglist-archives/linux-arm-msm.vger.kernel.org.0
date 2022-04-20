Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA837508CCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 18:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380318AbiDTQKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 12:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243127AbiDTQKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 12:10:40 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762242ED42
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 09:07:51 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i27so4499953ejd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jEywSrKCCYf3AdiMmwszKP9OJnHu5SnOk6eOCBxwoFs=;
        b=W3J7SQB58aXRT9h7c+Rr6FjXrUo62P5icwoM+xL/qJB1dGQFIpNefHaU1Z+LBOUvpc
         c7ule+8L7O7mai2QWpeLXGPwJo+UOOBOCNg6dAGHMtGbL8u5hSP5+XSdrV25uZ/wkbsg
         I6fL98Km9v14i/wniOcwb1LGyEGr1lr0NKY2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jEywSrKCCYf3AdiMmwszKP9OJnHu5SnOk6eOCBxwoFs=;
        b=a86tzmE4q26z27knJqsG4W1axwpJj3tXh751ccYRmyAD0VlDEdoJSXrotHQwwxiV5L
         d6anF+AoE69CngX6Yq4xMAEGBvyK9Vt3eqIMQVc+/LwjHJN9LVfFCB+gGw22LUwvwCWg
         mBxJaWCZ3l6Gpp5NdfnP2x+3wmBIjPh/IwtoHZu1N8b0GeHgADal4OTfXrZ2wlIzmGmr
         BNfETKzI/U42qY4dhOOYYt/1sp9U+De3x8eG+Kn9JveyVlzxilHocUtyaNxAxFk8pgsb
         TwqrVROIE6nXwk2/CEIEfuWfLv4PG9HE5fOaQHoPMMctmaX3s27V1XOnl9rWymFmKNBV
         mFvQ==
X-Gm-Message-State: AOAM531tg8U0i5h/Gud87eA0JpUBMrONh8E1nKpHXIyhmtt4MwdO0e+g
        Kqqf+SgXvGQ3UaAD76ge4wOopdYB41yLhJYY
X-Google-Smtp-Source: ABdhPJyeq3e81R3aseTHsimgQziXl5RX6L5aLgMgUOjL1hqAZHEFF2ObXfBf42a15LhV5hgkbopRGA==
X-Received: by 2002:a17:907:7d93:b0:6da:8f57:68fa with SMTP id oz19-20020a1709077d9300b006da8f5768famr19536011ejc.42.1650470869630;
        Wed, 20 Apr 2022 09:07:49 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id r29-20020a50c01d000000b00415fb0dc793sm10469226edb.47.2022.04.20.09.07.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 09:07:48 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id r187-20020a1c44c4000000b0038ccb70e239so4025287wma.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 09:07:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3d0e:b0:38f:f83b:e7dc with SMTP id
 bh14-20020a05600c3d0e00b0038ff83be7dcmr4373011wmb.29.1650470867671; Wed, 20
 Apr 2022 09:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <1650439639-28428-1-git-send-email-quic_vnivarth@quicinc.com> <1650439639-28428-2-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1650439639-28428-2-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Apr 2022 09:07:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBNizxCh7Jr11fmbBpthwPRj8MWj2VQqOWt94RrcGWxQ@mail.gmail.com>
Message-ID: <CAD=FV=XBNizxCh7Jr11fmbBpthwPRj8MWj2VQqOWt94RrcGWxQ@mail.gmail.com>
Subject: Re: [V5 1/2] arm64: dts: qcom: sc7280-idp: Configure CTS pin to
 bias-bus-hold for bluetooth
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 20, 2022 at 12:27 AM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> Change active and sleep pinctrl configurations to handle same.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v5: modify subject to include bluetooth
> v4: modify subject of patch to indicate file it is applying to
> v3: apply same change to active state and other sc7280*.dts* as well
> v2: used bias-bus-hold as per review comments
> v1: intial patch used bias-disable for sleep pinctrl in sc7280-idp only
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 015a347..85e7467 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -400,10 +400,10 @@
>
>  &qup_uart7_cts {
>         /*
> -        * Configure a pull-down on CTS to match the pull of
> -        * the Bluetooth module.
> +        * Configure a bias-bus-hold on CTS to lower power usage
> +        * when BT is turned off.

So you skipped half of Bjorn's feedback here. He said:

--

This comment would just leave a future reader with the question about
_why_ does this lower the power usage...

This problem you're seeing is likely to come back in the next platform
and your successor (or even yourself) will have no use of this comment
to figure out what bias to configure on these pins.

--

I personally am not convinced the comment is super valuable now that
we're using bias-bus-hold. The reason we want bias-bus-hold is
basically the exact reason that bias-bus-hold exists in the first
place and I personally wouldn't expect a big comment every place we
use bias-bus-hold. That being said, Bjorn is the maintainer and not
me, so he's the one you need to make happy.

What about:

Configure a bias-bus-hold on CTS to lower power usage when BT is
turned off. Bus hold will maintain a low power state regardless of
whether the Bluetooth module drives the pin in either direction or
leaves the pin fully unpowered.

-Doug

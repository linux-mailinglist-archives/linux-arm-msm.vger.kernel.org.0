Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4C263FD49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 01:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiLBAul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 19:50:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiLBAuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 19:50:40 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94AD8BDCE5
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 16:50:38 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s5so4505082edc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 16:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F7pFB+ZvlcrA8R79s7DUy7BFXLwcQol/AYjTA4sACPo=;
        b=L9GHDfR84Id1CY6HR4mg5KxP96kN0GT3UaBgmyWCgrj+17Kj66luUSBTwgx+QJANfU
         ZNWC4ILSyeqj48kxKnBUQ+aN1bUUmji4fvyf/IljruXwv4pDdYOmZCB7zzmNMtXgueIX
         6vd19tOOrS+jBOQKfR1Pa3GlU7MXJlliRINiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7pFB+ZvlcrA8R79s7DUy7BFXLwcQol/AYjTA4sACPo=;
        b=DeWElbeQyH5QURwzIrFl8yAQaumwsVcsWaUxUBRs7ZovdM34NZe8XG041+GujxU3ai
         4WWyK5KCE14ToH795Qh/RvS6manKhQzJdRYVAj+f1d7LN07fYQbHmKrPaqrD17YtQqcw
         rDy5FGzSNLuZyEz1nqRf1CctPPmtajbzSQiyv+0AIqzFOD6+kmwljr+bFUwJUWk3hYHL
         v2+sIS7ZzEH+zl1nNZ79LN+hoZoyofTvwFW8mPjVI5IxJf3C2HJSyp6G4Sf0fy7KgnJK
         8pSUttJ//VUr1R/4QjmLodbGvsLR8n6O+TqHcYHkNXqOGD8NZBNmM/fF4GN5g0kwZI5X
         nElA==
X-Gm-Message-State: ANoB5pl8CzLKb8q9FoizuxmjZepCjfbStfDRH9t2J4jFFUqS8F0BdqWF
        ev6WG6xQ/Chvha1zv4MjCeeCHlDHaCkQRbVT
X-Google-Smtp-Source: AA0mqf7+oJZmM/TPE+81ozSk+bxD9vs/04439BE25Ae4kQdWXVwiwril/KRPIBU93ijq9cRGRqhaBw==
X-Received: by 2002:aa7:cb0d:0:b0:45a:2d7c:f3a0 with SMTP id s13-20020aa7cb0d000000b0045a2d7cf3a0mr52835804edt.98.1669942236863;
        Thu, 01 Dec 2022 16:50:36 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id h4-20020aa7cdc4000000b00458a03203b1sm2283395edw.31.2022.12.01.16.50.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 16:50:36 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso3086702wms.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 16:50:36 -0800 (PST)
X-Received: by 2002:a7b:c4d8:0:b0:3cf:b0ed:de9d with SMTP id
 g24-20020a7bc4d8000000b003cfb0edde9dmr36726708wmk.188.1669942236049; Thu, 01
 Dec 2022 16:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20221118164201.321147-1-krzysztof.kozlowski@linaro.org> <20221118164201.321147-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118164201.321147-2-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Dec 2022 16:50:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XeaskcBRVRQDoha7Xiv9j57fuvtcSJUeN7HCZSGVJ8uQ@mail.gmail.com>
Message-ID: <CAD=FV=XeaskcBRVRQDoha7Xiv9j57fuvtcSJUeN7HCZSGVJ8uQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 2/2] arm64: dts: qcom: sdm845: align TLMM pin
 configuration with DT schema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Fritz Koenig <frkoenig@google.com>
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

On Fri, Nov 18, 2022 at 8:42 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Doug Anderson <dianders@chromium.org>
>
> Tested on Qualcomm RB3. Please kndly test a bit more on other devices.
> This should not have an functional impact.

Added Rob Clark and Fritz who are the only people I know that still do
anything with cheza.


> -       wcd_intr_default: wcd_intr_default {
> +       wcd_intr_default: wcd-intr-default-state {
>                 pins = <54>;

Not new to your patch, but I'm surprised it truly works to use an
integer for a pin? How does it know that 54 is an integer and not a
string???


>  &qup_uart3_default {
> -       pinmux {
> -               pins = "gpio41", "gpio42", "gpio43", "gpio44";
> +       cts-rts-pins {
> +               pins = "gpio41", "gpio42";
>                 function = "qup3";
>         };
>  };

FWIW, I would have expected that the SoC dtsi file would get a "4-pin"
definition (similar to what you did with qup_uart6_4pin) and then we'd
use that here.


>                         qup_uart6_4pin: qup-uart6-4pin-state {
> -
> -                               cts-pins {
> +                               qup_uart6_4pin_cts: cts-pins {
>                                         pins = "gpio45";
>                                         function = "qup6";
> -                                       bias-pull-down;

After your patch, where is the above bias set for cheza, db845c,
oneplus, shift-axolotl, ...?


>                                 };
>
> -                               rts-tx-pins {
> +                               qup_uart6_4pin_rts_tx: rts-tx-pins {
>                                         pins = "gpio46", "gpio47";
>                                         function = "qup6";
> -                                       drive-strength = <2>;
> -                                       bias-disable;

After your patch, where is the above bias / drive-strength set?


>                                 };
>
> -                               rx-pins {
> +                               qup_uart6_4pin_rx: rx-pins {
>                                         pins = "gpio48";
>                                         function = "qup6";
> -                                       bias-pull-up;

After your patch, where is the above bias set?

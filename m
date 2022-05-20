Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE26952F4B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 22:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236234AbiETUzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 16:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbiETUzY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 16:55:24 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91595193217
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:55:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f4so16243158lfu.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=waJb9YRlR/dVVHiz9FXpjWhUHca9QxD4Ut989/pMyqc=;
        b=Z5NWGsXuwDWGDkysB5pxuzCkviPdIlqUWpd8FicJ9ML8hvWY5AI1rXenD1t5ctMa43
         OjMhGDwsk/f/EkI0kopeEttr37fwC8cpOCRcIstmjW31St81Ccjy0J5VXYurN17MAm/2
         u0movrLLB0W4IIVrM69FBgpT1qPElBKoePMq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=waJb9YRlR/dVVHiz9FXpjWhUHca9QxD4Ut989/pMyqc=;
        b=IBQX3fndrrdkm5WOY0YLT1s6emDDSC2Ip31pcRveEjHqVtf0FIHcYzTXxOoWZ51k71
         s87dQBVFKu9Vv1O/S8LqAaZBp0InGMK6DkiyKkZQDfwX80gRkI8Twlf6ERQYYFeZn810
         34deIDXteEChUuI6/l3Aa04lNzBPsZuN02N75wX/UkErkivwukkStUBr1pBlzeGpzjbz
         HAEiriVzfZGKQqHGH0KsZ4lbN/L9TSWzRZt4urFHdZxMC0bRa9SBHGHH8ZG5Sub1Mr94
         IYp8/d8dq0rIV4c3vtX19+LyKUyc9i7NxBspB9goablA817/qaJ/7pCdxA7HCaKDO5S/
         zxRg==
X-Gm-Message-State: AOAM5325leJGHTpGWW4EL/wPRaqekyW03kvVZI7TzDtFsaFegSNVLgzj
        9WA+5kEN0v37s34ZT8J98yYTh1yPF4E1QES5QHE=
X-Google-Smtp-Source: ABdhPJygs6UcSFzRi1txreGVI0DGX3711OxQ2c3YxqOBmO4yY7gcGqBKUSWFP/b7aIdURzrNoJQ4lw==
X-Received: by 2002:a05:6512:33d5:b0:476:7896:7e7f with SMTP id d21-20020a05651233d500b0047678967e7fmr8333087lfg.145.1653080119672;
        Fri, 20 May 2022 13:55:19 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id w10-20020a05651204ca00b0047255d210d8sm790774lfq.7.2022.05.20.13.55.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 13:55:19 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id bu29so16377915lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 13:55:18 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr9695141wry.342.1653079801669; Fri, 20
 May 2022 13:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220520161004.1141554-1-judyhsiao@chromium.org> <20220520161004.1141554-3-judyhsiao@chromium.org>
In-Reply-To: <20220520161004.1141554-3-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 13:49:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X9TqwUKY54RTCkQ_55BNHqWbGuc4sGQtwgKxWrLwX5QQ@mail.gmail.com>
Message-ID: <CAD=FV=X9TqwUKY54RTCkQ_55BNHqWbGuc4sGQtwgKxWrLwX5QQ@mail.gmail.com>
Subject: Re: [v2 2/3] arm64: dts: qcom: sc7280: Add sc7280-herobrine-audio-rt5682.dtsi
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 9:10 AM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Audio dtsi for sc7280 boards that using rt5682 headset codec:
> 1. Add dt nodes for sound card which use I2S playback and record
>    through rt5682s and I2S playback through max98357a.
> 2. Enable lpass cpu node and add pin control and dai-links.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  .../qcom/sc7280-herobrine-audio-rt5682.dtsi   | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> new file mode 100644
> index 000000000000..d83e99f1d417
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *
> + * This file defines the common audio settings for the child boards using rt5682 codec.
> + *
> + * Copyright 2022 Google LLC.
> + */
> +
> +/ {
> +       /* BOARD-SPECIFIC TOP LEVEL NODES */
> +       sound: sound {
> +               compatible = "google,sc7280-herobrine";
> +               model = "sc7280-rt5682-max98360a-1mic";
> +
> +               status = "okay";
> +               audio-routing =
> +                       "Headphone Jack", "HPOL",
> +                       "Headphone Jack", "HPOR";
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               dai-link@0 {
> +                       link-name = "MAX98360";
> +                       reg = <0>;
> +
> +                       cpu {
> +                               sound-dai = <&lpass_cpu MI2S_SECONDARY>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&max98360a>;
> +                       };
> +               };
> +
> +               dai-link@1 {
> +                       link-name = "ALC5682";
> +                       reg = <1>;
> +
> +                       cpu {
> +                               sound-dai = <&lpass_cpu MI2S_PRIMARY>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&alc5682 0 /* aif1 */>;
> +                       };
> +               };
> +       };
> +};
> +
> +hp_i2c: &i2c2 {
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       alc5682: codec@1a {
> +               compatible = "realtek,rt5682s";
> +               reg = <0x1a>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&hp_irq>;
> +
> +               #sound-dai-cells = <1>;
> +
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <101 IRQ_TYPE_EDGE_BOTH>;
> +
> +               AVDD-supply = <&pp1800_alc5682>;
> +               MICVDD-supply = <&pp3300_codec>;
> +
> +               realtek,dmic1-data-pin = <1>;
> +               realtek,dmic1-clk-pin = <2>;
> +               realtek,jd-src = <1>;
> +               realtek,dmic-clk-rate-hz = <2048000>;
> +       };
> +};
> +
> +&lpass_cpu {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&mi2s0_data0 &mi2s0_data1 &mi2s0_mclk &mi2s0_sclk &mi2s0_ws
> +                    &mi2s1_data0 &mi2s1_sclk &mi2s1_ws>;
> +
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       dai-link@0 {
> +               reg = <MI2S_PRIMARY>;
> +               qcom,playback-sd-lines = <1>;
> +               qcom,capture-sd-lines = <0>;
> +       };
> +
> +       dai-link@1 {
> +               reg = <MI2S_SECONDARY>;
> +               qcom,playback-sd-lines = <0>;
> +       };
> +};
> +
> +&mi2s0_data0 {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&mi2s0_data1 {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&mi2s0_mclk {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&mi2s0_sclk {
> +       drive-strength = <6>;
> +       bias-disable;
> +};
> +
> +&mi2s0_ws {
> +       drive-strength = <6>;

Just like for patch #1, I think you want "bias-disable" here, too.

-Doug

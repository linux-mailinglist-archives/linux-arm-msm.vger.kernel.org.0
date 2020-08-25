Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5456251538
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 11:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgHYJVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 05:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgHYJVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 05:21:13 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4A4C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 02:21:13 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y206so6831683pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2020 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=CabenADhkeDmn9ATtQd7NLLVZBNFWUdF1srj48ypUAI=;
        b=kSjlVWgouzQuBvJvV62xPzMHc4Vj3H4P2jq5sEj88IFUueTeSlgbZJQQNE3NPTOaIv
         AUFfCzVN60vZgbqISgmmC4fDhSRw0k+/pe+jV/GUy7I2Czq2iQctt613YQmZPS5WbSj/
         7Z92ZI2S3kDbhgkMw9zM0X/7FiWzayW+Uocbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=CabenADhkeDmn9ATtQd7NLLVZBNFWUdF1srj48ypUAI=;
        b=poJTxRMMDG0JANGJ870iAXxHTCZq8qEFLnGi37/Wqif7FxsIc2NKsQwzG45RrIon72
         l0pMaiBnCAvvUS7v9Nh0Cel0LwvlrUc3ncnpMyzTd0HJ3fq4/M9Yp4VVbvHYIRqsvhdn
         uSVoLNJjtOEFPoBWQeCNBNqMqy63B4hK20vJAERnlqFf3HLsxC+zssIoDxpJA5XJukkK
         XgzeslEfnPDLMeE8iTeHlBVBuOgiugWmMNh6/ohJDPn8dox4Us9BJDRPcycbpOp9z4Sy
         XssAQOVYwhYz9jh9ZVpR5mqk4BTpMf/PR7oS0gog16UooulZWYoKUQqvJkV7UaZnSkyR
         G0Jw==
X-Gm-Message-State: AOAM532nLtKI2karZ4YrFQ1T1KHzVN5imlySE3BX8AXNv2EoQ1acxQTr
        AYRt7lEA5BMC0mmIJHGuaWuORQ==
X-Google-Smtp-Source: ABdhPJxdwZWXCwKiihvkw3GaI/1XdPFEcf/CzYv8zUyN/gMdBfFcd2+g74fujhZp9Fj7e9zwfmwJng==
X-Received: by 2002:a17:902:b681:: with SMTP id c1mr7154572pls.10.1598347272513;
        Tue, 25 Aug 2020 02:21:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id s125sm14294117pfb.125.2020.08.25.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 02:21:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200825003341.1797322-1-robdclark@gmail.com>
References: <20200825003341.1797322-1-robdclark@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Atul Dhudase <adhudase@codeaurora.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Cheng-Yi Chiang <cychiang@chromium.org>,
        Ajit Pandey <ajitp@codeaurora.org>,
        Alexandru Stan <amstan@chromium.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Date:   Tue, 25 Aug 2020 02:21:10 -0700
Message-ID: <159834727050.334488.84544239322533805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2020-08-24 17:33:39)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> new file mode 100644
> index 000000000000..b04987ab6c22
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -0,0 +1,1364 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
[...]
> +
> +       gpio_keys: gpio-keys {
> +               compatible =3D "gpio-keys";
> +               status =3D "disabled";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pen_pdct_l>;
> +
> +               pen-insert {
> +                       label =3D "Pen Insert";
> +
> +                       /* Insert =3D low, eject =3D high */
> +                       gpios =3D <&tlmm 52 GPIO_ACTIVE_LOW>;
> +                       linux,code =3D <SW_PEN_INSERTED>;
> +                       linux,input-type =3D <EV_SW>;
> +                       wakeup-source;
> +               };
> +       };
> +
> +       max98357a: max98357a {

Maybe node name should be 'audio-codec' or 'dac' or 'amp' or 'speaker'
or 'codec'?

> +               compatible =3D "maxim,max98357a";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&amp_en>;
> +               sdmode-gpios =3D <&tlmm 23 GPIO_ACTIVE_HIGH>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +
> +       pwmleds {
> +               compatible =3D "pwm-leds";
> +               keyboard_backlight: keyboard-backlight {
> +                       status =3D "disabled";
> +                       label =3D "cros_ec::kbd_backlight";
> +                       pwms =3D <&cros_ec_pwm 0>;
> +                       max-brightness =3D <1023>;
> +               };
> +       };
> +};
> +
> +&qfprom {
> +       vcc-supply =3D <&pp1800_l11a>;
> +};
> +
> +

Drop double newline?

> +&qspi {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +
> +               /* TODO: Increase frequency after testing */

Maybe drop this TODO? I don't see it being too meaningful.

> +               spi-max-frequency =3D <25000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> +
> +

Drop double newline?

> +&apps_rsc {
> +       pm6150-rpmh-regulators {
> +               compatible =3D "qcom,pm6150-rpmh-regulators";
> +
> +&wifi {
> +       status =3D "okay";
> +       vdd-0.8-cx-mx-supply =3D <&vdd_cx_wlan>;
> +       vdd-1.8-xo-supply =3D <&pp1800_l1c>;
> +       vdd-1.3-rfa-supply =3D <&pp1300_l2c>;
> +
> +       /*
> +        * TODO: Put ch1 supply in its rightful place, rather than in ch0=
's
> +        * spot. Channel 0 is held open by bluetooth for now.
> +        */
> +       vdd-3.3-ch0-supply =3D <&pp3300_l11c>;
> +       wifi-firmware {
> +               iommus =3D <&apps_smmu 0xc2 0x1>;
> +       };
> +};
> +
> +/* PINCTRL - additions to nodes defined in sdm845.dtsi */

Oops, that should be sc7180.dtsi

> +
> +&qspi_cs0 {
> +       pinconf {
> +               pins =3D "gpio68";
> +               bias-disable;
> +       };
[...]
> +/* PINCTRL - board-specific pinctrl */
> +
> +&pm6150_gpio {
> +       status =3D "disabled"; /* No GPIOs are connected */
> +};
> +
> +&pm6150l_gpio {
> +       gpio-line-names =3D "AP_SUSPEND",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "",
> +                         "";
> +};
> +
> +&tlmm {
[...]
> +
> +&venus {
> +       video-firmware {
> +               iommus =3D <&apps_smmu 0x0c42 0x0>;
> +       };
> +};

I believe this node should come before the PINCTRL comment above and be
sorted alphabetically by node name.

 +/* PINCTRL - additions to nodes defined in sdm845.dtsi */

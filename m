Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9464652230D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 May 2022 19:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348378AbiEJRtP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 May 2022 13:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343577AbiEJRtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 May 2022 13:49:14 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B757429ED0B
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:45:16 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-e5e433d66dso19153281fac.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 May 2022 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=8K1zkhTCYeR9WcVMzPAvt0Uq64CTD5BQFWDSVQ6PKj0=;
        b=a1yGwtdIAQwDX4lYDbGgLXBT/rSwyOK44saKPh2C4pHNvAzvA4vsxiVA/fztJliTTw
         ZcDD7oDWPo/GPQ48ugUfDSKWkDJK/J0aMDY/168wDKgVBel9S+p+rc9Mlun/kAiI6FRz
         LUBcvjnVNajpFpk0PYTjD/ZFgFRWS8eTClIrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=8K1zkhTCYeR9WcVMzPAvt0Uq64CTD5BQFWDSVQ6PKj0=;
        b=qTHSLqI83lRJ9/3vs4K3KNdJF56a6v8lR1cVlzQ73e2L/NJTqcfFWaeXlgPozmbluu
         UXjXEYEeiEOonTKggOXP4sqx1nyLCf5kkszFJgQariouZ7W069TLGkmEv/IMOcuXndQn
         a+Ofzzr5K45SvtTEIdZz/Oq5x7XAj5nFqyds65wCi6PZbK7yuNoY+jZiJ/IRPS/bneRM
         ae+q9Ai2hIfgIS/4DNtZUQ9jPPSAXvXOga4yw6WrePnRTPNS2+gfHa/euUbpHsFRLtOw
         W20r9z26I3dqJ7l9xMRxl476Mb2OoH89Ehz4zu+xXEORRAwU6vmJuJDPjvgXjKNgnVu7
         1qDw==
X-Gm-Message-State: AOAM530yapvbrXd6NcWgxnL9pRtf8HDddKpzF0crotQx7l/Qs1qLKUB+
        0b+bYMflixtVkotMwcbXbEYnCcYTooxq7KCgsKM7BA==
X-Google-Smtp-Source: ABdhPJy80Xq7GF6UWv/g20SQkjrDeaebSEqjwH+sR/FQ/xgRHKGaXoYZV6goWF42ZNdxqDsVe76SnL/yqAh7k4QNyRY=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr699120oao.63.1652204716102; Tue, 10 May
 2022 10:45:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 May 2022 10:45:15 -0700
MIME-Version: 1.0
In-Reply-To: <20220505104024.v4.2.I71176ebf7e5aebddb211f00e805b32c08376d1be@changeid>
References: <20220505104024.v4.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
 <20220505104024.v4.2.I71176ebf7e5aebddb211f00e805b32c08376d1be@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 10 May 2022 10:45:15 -0700
Message-ID: <CAE-0n51VpM-sw+1MLqtx+-YSa9ayQX+=tgZ7zLfnMEa5+742oQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7180: Add mrbland dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Joseph S. Barrera III (2022-05-05 10:41:13)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
> new file mode 100644
> index 000000000000..e1c1ea09b690
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi
> @@ -0,0 +1,352 @@
[...]
> +
> +&ap_tp_i2c {
> +       status = "disabled";
> +};
> +
> +&backlight {
> +       pwms = <&cros_ec_pwm 0>;
> +};
> +
> +&camcc {
> +       status = "okay";
> +};
> +
> +&dsi0 {
> +
> +       panel: panel@0 {

Can we have a note here like in the bridge chip dtsi files that says the
compatible is filled in per board?

		/* Compatible will be filled in per-board */

> +               reg = <0>;
> +               enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&vdd_reset_1800>;
> +               avdd-supply = <&avdd_lcd>;
> +               avee-supply = <&avee_lcd>;
> +               pp1800-supply = <&v1p8_mipi>;
> +               pp3300-supply = <&pp3300_dx_edp>;
> +               backlight = <&backlight>;
> +               rotation = <270>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       port@0 {
> +                               reg = <0>;
> +                               panel_in: endpoint {
> +                                       remote-endpoint = <&dsi0_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
[...]
> +
> +/* PINCTRL - board-specific pinctrl */
> +
> +&tlmm {
> +       gpio-line-names = "HUB_RST_L",
> +                         "AP_RAM_ID0",
[..]
> +       avee_lcd_en: avee-lcd_en {

Same underscore comment as patch #1

> +               pinmux {
> +                       pins = "gpio21";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio21";
> +                       drive-strength = <2>;
> +                       bias-disable;
> +               };
> +       };
> +

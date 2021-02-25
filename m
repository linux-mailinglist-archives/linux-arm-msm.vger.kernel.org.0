Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BD53259C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 23:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbhBYWm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 17:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbhBYWmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 17:42:55 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1DAC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:42:15 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id o6so4472252pjf.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 14:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=tstq3ZEyFA6o5XAzGatOdrYcukD0RQ27xs0uogdL8EU=;
        b=NcxG44AIHls1ygwbjqAkAEBnbjkQj5Z89PZTe4WPAY2bBzuPUTtXvQs0kIPTHqrd7X
         16eVpresHTY+q8R5r5uVqZHJBxtb+vuUYNyhHmmu60feo0HnAgdGZvmVFASV3Aw5aaft
         g8YYM+6JBB7aso98sYZ15T6KA2k4I7CCDblvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=tstq3ZEyFA6o5XAzGatOdrYcukD0RQ27xs0uogdL8EU=;
        b=EJpcotm6uPbbl/tGbtDzRR8FL6vzn3oH7qIUH8/7TQaMfx92dsqwQJ3kJY+bIVO9I8
         0+7Ej8GUOE6+331FR55kpYr0LaEp0AXlEBpvNk9e+ie6HFFp15PMrltQXxMcWMbUQoF9
         cdeJY+ZF4t10numD1hT035SmNeMXnRakptk/u/gozsdjQApThe7c5Xk8qx1EDJofT5Cn
         dQJG47zMLkNoX+XPveBgODfjFLhYHgkvRhyY/rzxkRJB5Kl8KXojDMbsQKs8m8kuq5I5
         j47gO7LMDfVmAUFOtC4LLe/l8u9R6iMDjD2GPgmbE9OzP2zcycipAkhhDRM3c7v0rngc
         4siw==
X-Gm-Message-State: AOAM533WjlHx0ca/syfZhx32VorjHBvUFMe9PCQC3jyTkSM34s4HvU9/
        vUZK0mIWtaYtx5n3aKkipMjmd/9ojzoDUg==
X-Google-Smtp-Source: ABdhPJz4XPfgdF0Zdi38fMJeQ1lfxFPywN33YQx/K6YrJPnLgiWDEto9nsljHlSpcJ4mQH2Js3WZAQ==
X-Received: by 2002:a17:902:e541:b029:df:df4f:2921 with SMTP id n1-20020a170902e541b02900dfdf4f2921mr300199plf.52.1614292935300;
        Thu, 25 Feb 2021 14:42:15 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:b942:93a8:e68d:5a90])
        by smtp.gmail.com with ESMTPSA id i10sm7908751pgo.75.2021.02.25.14.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 14:42:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210225103330.v2.4.I67e29f2854bad22e3581d6a6e1879b9fc8abbdea@changeid>
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid> <20210225103330.v2.4.I67e29f2854bad22e3581d6a6e1879b9fc8abbdea@changeid>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7180: trogdor: Use ADC TM channel 0 instead of 1 for charger temperature
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 25 Feb 2021 14:42:13 -0800
Message-ID: <161429293348.1254594.17006777195039771186@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Matthias Kaehlcke (2021-02-25 10:33:37)
> On trogdor the ADC thermal monitor is used for monitoring certain
> device temperatures. All trogdor boards have at least a thermistor
> for the charger temperature, optionally they may have others.
>=20
> Currently the ADC thermal monitor is configured to use channel 1
> for the charger temperature. Given that all trogdor boards have
> the charger thermistor it makes more sense to use channel 0,
> and then let boards with other thermistors use channels 1, 2, 3,
> rather than 0, 2, 3.
>=20
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>=20
> Changes in v2:
> - patch added to the series
>=20
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index ab4efaece5cb..58e127b6ba1e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -19,7 +19,7 @@ charger_thermal: charger-thermal {
>                         polling-delay-passive =3D <0>;
>                         polling-delay =3D <0>;
> =20
> -                       thermal-sensors =3D <&pm6150_adc_tm 1>;
> +                       thermal-sensors =3D <&pm6150_adc_tm 0>;

Too bad this can't point at the sensor "config" node itself. Looks error pr=
one!

> =20
>                         trips {
>                                 charger-crit {
> @@ -718,8 +718,8 @@ charger-thermistor@4f {
>  &pm6150_adc_tm {
>         status =3D "okay";
> =20
> -       charger-thermistor@1 {
> -               reg =3D <1>;
> +       charger-thermistor@0 {
> +               reg =3D <0>;
>                 io-channels =3D <&pm6150_adc ADC5_AMUX_THM3_100K_PU>;
>                 qcom,ratiometric;
>                 qcom,hw-settle-time-us =3D <200>;

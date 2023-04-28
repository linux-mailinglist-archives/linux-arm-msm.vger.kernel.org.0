Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD7D6F1EDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 21:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjD1Ttu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 15:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346407AbjD1Ttt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 15:49:49 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF3F1BCD
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 12:49:46 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-54fc1824f0bso4067387b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 12:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682711386; x=1685303386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/ndJlRpl2jIqqzoCVeqrKVlFCiLWS3lHrlVMMffJAU=;
        b=y4ls9Mo3jpN/beT51E7z1jkXP4P+qfI3oczrkApcuzXMQTFL0evI6GAbBqSxmVbttK
         laipb0M9fNYjxjpA0wDNe1MZHjOdOc+Ll8ovOyM8xrJZ+fZZNBNif7fWW0FvlYgIFGOq
         CgV+KvGUvf2MErXutLc/EQdEBRzkRjRzE0EUUBID0CF+hoYPB3b/iqtvUXTkBCE6U91d
         ChzHxWf7UNxW1AxyaLO5XNSr7dFnq+9D3RluN2QlrB84Jr3pf2bvJLudUHvPuReNGHB+
         kRpavEImX3L+YuH1SlQfsnm4lP1rUNuwbZU3hCYasvV2loM8I8/k7kwfb97FCWB42ylS
         txBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682711386; x=1685303386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/ndJlRpl2jIqqzoCVeqrKVlFCiLWS3lHrlVMMffJAU=;
        b=Vd3undWdFvfmJtqGljdO+XT+Syk1CNAA5LIjtO3XaX7uVQZ+rYOnefuM7kKnOQT/Vh
         c+9XtB5WgqT9qvhDH0CDZmd02kK1H7zi2D47dycgOoaXEJ7NF4nEaIlw6z8MW8v8n7zH
         HFZ0MrOKMJLRdJXin4yBnMUQ1tFYEp0Jyr9Iwjp+CxanyII69KTKC1w5jaP12acSuP+0
         E34kl5GjclIYs1ExybWs4hphwkOLclPXba1I1mMBOD7jq2NNSNgG87gyptRUc9B5PFn7
         IrWajIinMOS9kKNUxgXNip2eGNq8A7Y1AMONnFhhNw1g82QFBJsraTLcLgvjoW9ya9bb
         H96g==
X-Gm-Message-State: AC+VfDyet7yxgQR0uRee8J+Tl1D5G7KckX5beTviRDZBVdAhT5+/ym3F
        m/qMfmkembaqsdu7BKW96YibADvW0Yuexz9sFj2uug==
X-Google-Smtp-Source: ACHHUZ5+zZDhZmQBpQaKcJ+OXWrStnmqq1Ba0mGKcp6Kr+4tTfPfuN7/HvBD5YRWrAfhl6GiSIvreP36ZUwSVFKRksc=
X-Received: by 2002:a81:4e47:0:b0:559:cbff:4aa2 with SMTP id
 c68-20020a814e47000000b00559cbff4aa2mr670782ywb.45.1682711385615; Fri, 28 Apr
 2023 12:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682682753.git.quic_varada@quicinc.com> <1bda63e18f7257f60cc1082b423aca129abfa3b0.1682682753.git.quic_varada@quicinc.com>
In-Reply-To: <1bda63e18f7257f60cc1082b423aca129abfa3b0.1682682753.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 28 Apr 2023 22:49:34 +0300
Message-ID: <CAA8EJpq0RXGf8_oBa_XF0+nOg31ouMUVJ3LhNRh_HtmgJvCJHQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: ipq9574: add thermal zone nodes
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Praveenkumar I <quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 Apr 2023 at 17:53, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> This patch adds thermal zone nodes for the various
> sensors present in IPQ9574
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 208 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 208 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/=
qcom/ipq9574.dtsi
> index 7cd5bdb..a7cb2b4c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -947,6 +947,214 @@
>                 };
>         };
>
> +       thermal_zones: thermal-zones {
> +               tsens_tz_sensor3 {

Please provide sensible names for all thermal zones. Please follow the
examples in other DT files.

> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 3>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;

Can it really go up to 125 =C2=B0C?

> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };

Please provide also a passive trip point, so that the passive cooling
can be engaged.

> +                       };
> +               };
> +
> +               tsens_tz_sensor4 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 4>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor5 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 5>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor6 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 6>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor7 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 7>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor8 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 8>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor9 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 9>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor10 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 10>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <120000>;
> +                                       hysteresis =3D <10000>;
> +                                       type =3D "critical";
> +                               };
> +
> +                               cpu-passive {
> +                                       temperature =3D <110000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "passive";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor11 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 11>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <120000>;
> +                                       hysteresis =3D <10000>;
> +                                       type =3D "critical";
> +                               };
> +
> +                               cpu-passive {
> +                                       temperature =3D <110000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "passive";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor12 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 12>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <120000>;
> +                                       hysteresis =3D <10000>;
> +                                       type =3D "critical";
> +                               };
> +
> +                               cpu-passive {
> +                                       temperature =3D <110000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "passive";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor13 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 13>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <120000>;
> +                                       hysteresis =3D <10000>;
> +                                       type =3D "critical";
> +                               };
> +
> +                               cpu-passive {
> +                                       temperature =3D <110000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "passive";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor14 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 14>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               tsens_tz_sensor15 {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&tsens 15>;
> +
> +                       trips {
> +                               cpu-critical {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +       };
> +
>         timer {
>                 compatible =3D "arm,armv8-timer";
>                 interrupts =3D <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_T=
YPE_LEVEL_LOW)>,
> --
> 2.7.4
>


--=20
With best wishes
Dmitry

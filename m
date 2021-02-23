Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F58B322686
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 08:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhBWHmH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 02:42:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbhBWHlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 02:41:49 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF73C061786
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:41:09 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d16so456671plg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Feb 2021 23:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=QBmv3AC5xTk/Bz1QRlZ402i8IDq9hUClvPJlVeV/Z3o=;
        b=j5c9cDPkQo7tLyWIAJOCWEsRws5QRDg0evVfT633jK6sWgwSyfaa4z9xwmuJ63I7R7
         0igf/1HNjkQcG9McUM32oH53y32YZPOQ5M9/ruV6sTCiGYaATKJwwCDoCdXcDarl16p9
         NHxeJivnrI/ABx3oJ47lOy5IUBqalsEPsTKgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=QBmv3AC5xTk/Bz1QRlZ402i8IDq9hUClvPJlVeV/Z3o=;
        b=IquvoCGQIwT8Yy/C8w7kSRhiWlegy/oU7zK7hawEbuOCygOpihLPb5y/b4347agXPE
         qXyU1xAYS/oWFVXAlHHbW9d4G7iuwlsEqwX7EN/DCFt2t68so92gZqfM3JMRawhA6YXx
         qBCfMlCxA8fxPHPdCvRqYSyx2/j6O808XWcXDO7AJQDCBvH8fcT0ZSvNGMKf1YXx/AnO
         HxuuNEnDO0u597BsYHhNNB/tUMTkRjPlCOx7DXnN5l9ujwDa18cHctQbAPb5+F171dkM
         wgzSqTqFk3pZrfDCskBvqf483C0QaRfpTpd/EZsGHnNk+dZ/YLaSGWE2NjA0fPx4evUv
         Qt5g==
X-Gm-Message-State: AOAM530tUwoh9apL/AM4E1Zo3jLccxJwO6A5lp+bd+rwYY/22P6Va6/f
        YpJvkJ/EvyqnHwQwC1ikT+DSjMV8tpqAgQ==
X-Google-Smtp-Source: ABdhPJwFfg10EQ3syQ4vnhG4VwRgEemmfIEeZGu2JLF+B2GptDtsFUCxZCGGjHOTqM6n1nkFZMPvlQ==
X-Received: by 2002:a17:90a:eb02:: with SMTP id j2mr28249436pjz.226.1614066069009;
        Mon, 22 Feb 2021 23:41:09 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id 14sm21777186pfy.55.2021.02.22.23.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 23:41:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1613114930-1661-6-git-send-email-rnayak@codeaurora.org>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org> <1613114930-1661-6-git-send-email-rnayak@codeaurora.org>
Subject: Re: [PATCH 05/13] arm64: dts: qcom: sc7280: Add RSC and PDC devices
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Mon, 22 Feb 2021 23:41:07 -0800
Message-ID: <161406606714.1254594.8318028410661523068@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2021-02-11 23:28:42)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 1fe2eba..7848e88 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> =20
>  / {
>         interrupt-parent =3D <&intc>;
> @@ -30,6 +31,18 @@
>                 };
>         };
> =20
> +       reserved_memory: reserved-memory {
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               aop_cmd_db_mem: memory@80860000 {
> +                       reg =3D <0x0 0x80860000 0x0 0x20000>;
> +                       compatible =3D "qcom,cmd-db";
> +                       no-map;
> +               };
> +       };
> +
>         cpus {
>                 #address-cells =3D <2>;
>                 #size-cells =3D <0>;
> @@ -189,6 +202,19 @@
>                         };
>                 };
> =20
> +               pdc: interrupt-controller@b220000 {
> +                       compatible =3D "qcom,sc7280-pdc", "qcom,pdc";
> +                       reg =3D <0 0xb220000 0 0x30000>;

Can you pad out reg to 8 digits? 0x0b220000

> +                       qcom,pdc-ranges =3D <0 480 40>, <40 140 14>, <54 =
263 1>,
> +                                         <55 306 4>, <59 312 3>, <62 374=
 2>,
> +                                         <64 434 2>, <66 438 3>, <69 86 =
1>,
> +                                         <70 520 54>, <124 609 31>, <155=
 63 1>,
> +                                         <156 716 12>;
> +                       #interrupt-cells =3D <2>;
> +                       interrupt-parent =3D <&intc>;
> +                       interrupt-controller;
> +               };
> +
>                 tlmm: pinctrl@f100000 {
>                         compatible =3D "qcom,sc7280-pinctrl";
>                         reg =3D <0 0xf100000 0 0x1000000>;

The same applies to the previous patch. Sorry for missing that.

> @@ -198,6 +224,7 @@
>                         interrupt-controller;
>                         #interrupt-cells =3D <2>;
>                         gpio-ranges =3D <&tlmm 0 0 175>;
> +                       wakeup-parent =3D <&pdc>;
> =20
>                         qup_uart5_default: qup-uart5-default {
>                                 pins =3D "gpio46", "gpio47";
> @@ -282,6 +309,23 @@
>                                 status =3D "disabled";
>                         };
>                 };
> +
> +               apps_rsc: rsc@18200000 {
> +                       compatible =3D "qcom,rpmh-rsc";
> +                       reg =3D <0 0x18200000 0 0x10000>,
> +                             <0 0x18210000 0 0x10000>,
> +                             <0 0x18220000 0 0x10000>;
> +                       reg-names =3D "drv-0", "drv-1", "drv-2";
> +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                       qcom,tcs-offset =3D <0xd00>;
> +                       qcom,drv-id =3D <2>;
> +                       qcom,tcs-config =3D <ACTIVE_TCS  2>,
> +                                         <SLEEP_TCS   3>,
> +                                         <WAKE_TCS    3>,
> +                                         <CONTROL_TCS 1>;
> +               };
>         };

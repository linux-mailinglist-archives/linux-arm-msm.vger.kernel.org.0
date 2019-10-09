Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA82D057C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 04:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbfJICZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 22:25:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:46506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729734AbfJICZf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 22:25:35 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD6C62070B;
        Wed,  9 Oct 2019 02:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570587934;
        bh=/QrBYB469HZKoP2i/Ui/nDSLpglSMZz/YjFahCD1rJ8=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=i2KzweRXVvxB7h86Tlqn50OZGHqsVOrbbZwc36eE86FnOw8DMeoKQcaMRO0hOv2VO
         uQDjjQWyoKv9boVcqw6DR4nCX6k/FhqApJk2KWhw0FYDFxeONL0xXEoa3ULHmNbx0c
         kk4xAGf4rGLx76mitQjqpjP8IrWrEJI7uA0YjrCo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191007014509.25180-6-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org> <20191007014509.25180-6-masneyb@onstation.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Brian Masney <masneyb@onstation.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 5/5] ARM: dts: qcom: msm8974-hammerhead: add support for external display
User-Agent: alot/0.8.1
Date:   Tue, 08 Oct 2019 19:25:33 -0700
Message-Id: <20191009022534.BD6C62070B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-10-06 18:45:09)
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/a=
rch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index b607c9ff9e12..380a805cd1f0 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -371,6 +401,40 @@
>                                 function =3D "gpio";
>                         };
>                 };
> +
> +               hdmi_pin: hdmi {
> +                       cec {
> +                               pins =3D "gpio31";
> +                               function =3D "hdmi_cec";
> +                       };
> +
> +                       ddc {
> +                               pins =3D "gpio32", "gpio33";
> +                               function =3D "hdmi_ddc";
> +                       };
> +
> +                       hpd {
> +                               pins =3D "gpio34";
> +                               function =3D "hdmi_hpd";
> +                       };
> +               };
> +
> +               anx_msm_pin: anx {
> +                       irq {
> +                               pins =3D "gpio28";
> +                               function =3D "gpio";

Is function =3D "gpio" necessary anymore? I thought we would turn gpios
into gpio function when it's requested as a gpio by some consumer.

> +                               drive-strength =3D <8>;
> +                               bias-pull-up;
> +                               input-enable;
> +                       };
> +
> +                       reset {
> +                               pins =3D "gpio68";
> +                               function =3D "gpio";
> +                               drive-strength =3D <8>;
> +                               bias-pull-up;
> +                       };
> +               };
>         };
> =20
>         vibrator@fd8c3450 {

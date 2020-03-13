Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9B0185069
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 21:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgCMUgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 16:36:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgCMUgj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 16:36:39 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 925742074B;
        Fri, 13 Mar 2020 20:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584131798;
        bh=YGjsqFx/56tPlZc6Xud+QYhtZNOqdz27BP2OPxM/VMs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YViRRY43mziJONtuFz5Bp3a+BpVgGSdn3ONn730D2vjKAAhCsAGt1+OJ8JVbzZt74
         mWrY3sTHWW0iI1G7o6+V6a605f6Tdi1Y0Bl7Zz0P2LhA7nQhFmljkAwizDqFzjYSIg
         4xae7eKiexz7GheW+/2l8Ce65igJtXBwzYsFJyN8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200313195816.12435-1-ansuelsmth@gmail.com>
References: <20200313195816.12435-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ARM: qcom: Disable i2c device on gsbi4 for ipq806x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Mathieu Olivari <mathieu@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To:     Ansuel Smith <ansuelsmth@gmail.com>, agross@kernel.org
Date:   Fri, 13 Mar 2020 13:36:37 -0700
Message-ID: <158413179776.164562.8295974225127853050@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Ansuel Smith (2020-03-13 12:58:16)
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts=
/qcom-ipq8064-ap148.dts
> index 554c65e7aa0e..580aec63030d 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
> @@ -21,14 +21,5 @@ mux {
>                                 };
>                         };
>                 };
> -
> -               gsbi@16300000 {
> -                       i2c@16380000 {
> -                               status =3D "ok";
> -                               clock-frequency =3D <200000>;
> -                               pinctrl-0 =3D <&i2c4_pins>;
> -                               pinctrl-names =3D "default";
> -                       };
> -               };
>         };
>  };
> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806=
x.c
> index b0eee0903807..75706807e6cf 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -782,7 +782,7 @@ static struct clk_rcg gsbi4_qup_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_PARENT_GATE,
> +                       .flags =3D CLK_SET_PARENT_GATE | CLK_IGNORE_UNUSE=
D,

A better solution is to use the protected-clocks property so we don't
try to touch these clks at all on this device. So this whole patch can
be routed through arm-soc and remove the i2c node and add some dt
property to the gcc node.

>                 },
>         },
>  };

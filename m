Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7DB8DA7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730414AbfHNRSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:18:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:36510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730764AbfHNRMg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:12:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BE1721721;
        Wed, 14 Aug 2019 17:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802755;
        bh=FAAciiWxMv2HbnmTuQi2r+sFmhndjmM10hnTqGnrU6s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IZW4vquRvp6nTj8xECSl2DsQWLZ9UlVhL77SlELIL1od7nOKA4H1KK2IJ3DhqvmQA
         pWFJi505fBwDJQKH4P1EgHfemTDtb6CLSkLWLJ7IFrp3ho57pMsC/kv7b2r1NNbqgQ
         4gNEeH53a9ZmaPLH/dF/81wJdJXYiNBuCFP+4r9c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-18-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-18-vkoul@kernel.org>
Subject: Re: [PATCH 17/22] arm64: dts: qcom: sm8150: Add apss_shared and apps_rsc nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:12:34 -0700
Message-Id: <20190814171235.6BE1721721@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:07)
> Add apss_shared and apps_rsc node including the rpmhcc child node
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Can't this be squashed with the original dtsi file?

>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 30 ++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index 5c6b103b042b..5258b79676f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -4,6 +4,7 @@
> =20
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>

But not the rpmh clk bindings?

> @@ -272,6 +279,29 @@
>                         };
>                 };
> =20
> +               apps_rsc: rsc@18200000 {
> +                       label =3D "apps_rsc";
> +                       compatible =3D "qcom,rpmh-rsc";
> +                       reg =3D <0x18200000 0x10000>,
> +                             <0x18210000 0x10000>,
> +                             <0x18220000 0x10000>;
> +                       reg-names =3D "drv-0", "drv-1", "drv-2";
> +                       interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +                       qcom,tcs-offset =3D <0xd00>;
> +                       qcom,drv-id =3D <2>;
> +                       qcom,tcs-config =3D <ACTIVE_TCS  2>,
> +                                         <SLEEP_TCS   1>,
> +                                         <WAKE_TCS    1>,
> +                                         <CONTROL_TCS 0>;
> +
> +                       rpmhcc: clock-controller {
> +                               compatible =3D "qcom,sm8150-rpmh-clk";
> +                               #clock-cells =3D <1>;

Should take some sort of clocks property to get the board clock for XO?

> +                       };
> +               };
> +
=20

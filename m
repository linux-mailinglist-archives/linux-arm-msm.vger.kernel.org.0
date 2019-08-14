Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917EB8DB2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729507AbfHNRIF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:08:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:57900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730049AbfHNRIF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:08:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DEFCC214DA;
        Wed, 14 Aug 2019 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802484;
        bh=1PjyB53SE5ISTW3kYQPPKdvQAcURDsEDX3z1n5W5Ncs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RCCzAshXp3+krsNHFGqQiq5XI5PlLhffpj2vyugoA1i9+VSgSe1Ab6xaCzPLzrRRq
         jgwPdVi/ErGjUXC4wM0jK/zzTYfsgsCAB6tt8aqNcZlA1bGaJg8EtieSfirhKXAbcs
         xXHddlF/sHlSVloSOI09+Gg8f63YnINcVE/9i+GI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-11-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-11-vkoul@kernel.org>
Subject: Re: [PATCH 10/22] arm64: dts: qcom: pm8150b: Add pon and adc nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:08:02 -0700
Message-Id: <20190814170803.DEFCC214DA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:00)
> Add the pon and adc nodes found in pm8150b PMIC.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)

Squash?

>=20
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/=
qcom/pm8150b.dtsi
> index c0a678b0f159..846197bd65cd 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
>  // Copyright (c) 2019, Linaro Limited
> =20
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/spmi/spmi.h>
> =20
> @@ -11,6 +12,59 @@
>                 reg =3D <0x2 SPMI_USID>;
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> +
> +               pon@800 {

Maybe pon node name should be 'key' or 'power-on'?

> +                       compatible =3D "qcom,pm8916-pon";
> +                       reg =3D <0x0800>;
> +               };
> +
> +               adc@3100 {
> +                       compatible =3D "qcom,spmi-adc5";
> +                       reg =3D <0x3100>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       #io-channel-cells =3D <1>;
> +                       interrupts =3D <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING=
>;
> +
> +                       ref-gnd@0 {
> +                               reg =3D <ADC5_REF_GND>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "ref_gnd";
> +                       };
> +
> +                       vref-1p25@1 {
> +                               reg =3D <ADC5_1P25VREF>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "vref_1p25";
> +                       };
> +
> +                       die-temp@6 {
> +                               reg =3D <ADC5_DIE_TEMP>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "die_temp";
> +                       };
> +
> +                       chg-temp@9 {
> +                               reg =3D <ADC5_CHG_TEMP>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "chg_temp";
> +                       };
> +
> +                       smb1390-therm@14 {
> +                               reg =3D <ADC5_AMUX_THM2>;
> +                               qcom,hw-settle-time =3D <200>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "smb1390_therm";
> +                       };
> +
> +                       smb1355-therm@78 {
> +                               reg =3D <ADC5_AMUX_THM2_100K_PU>;
> +                               qcom,ratiometric;
> +                               qcom,hw-settle-time =3D <200>;
> +                               qcom,pre-scaling =3D <1 1>;
> +                               label =3D "smb1355_therm";
> +                       };

Again, are these board level details? Maybe should be provided here with
status =3D "disabled" and then added by the boards that use these ADCs.

> +               };
>         };

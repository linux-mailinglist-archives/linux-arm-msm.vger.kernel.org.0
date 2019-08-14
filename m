Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40CBB8DBB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbfHNR1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:27:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:52548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729041AbfHNRDu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:03:50 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E4462173E;
        Wed, 14 Aug 2019 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802229;
        bh=9q+dnxmp7wlV9CyGTOF8w+3RUc997Kz+VeFrAqoo1tk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=QgoMpwiOu8Em+B3wWDGgiVe0zWh6Nq+QgA1d5Y+2JLobHvV5ksMTQ894+QDuoF/ps
         rYKLazrbDKqvQ5AYc350+yPlZMmJel+Skb52/iI3T1rb8KkHbUxNzKay9LSZVQUMGP
         4h+Og4goilMJCZWPCbwIepZnpDsyI/Ha+pxCCDvk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-8-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-8-vkoul@kernel.org>
Subject: Re: [PATCH 07/22] arm64: dts: qcom: pm8150: Add pon and rtc nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:03:48 -0700
Message-Id: <20190814170349.7E4462173E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:57)
> PM8150 PMIC contains pon and rtc devices so add nodes for these.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Squash this with the other patch?

> @@ -12,6 +13,25 @@
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> =20
> +               pon: pon@800 {
> +                       compatible =3D "qcom,pm8916-pon";
> +                       reg =3D <0x0800>;
> +                       pwrkey {
> +                               compatible =3D "qcom,pm8941-pwrkey";
> +                               interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_B=
OTH>;
> +                               debounce =3D <15625>;
> +                               bias-pull-up;
> +                               linux,code =3D <KEY_POWER>;

status =3D "disabled"?

> +                       };
> +               };
> +
> +               rtc@6000 {
> +                       compatible =3D "qcom,pm8941-rtc";
> +                       reg =3D <0x6000>;
> +                       reg-names =3D "rtc", "alarm";
> +                       interrupts =3D <0x0 0x61 0x1 IRQ_TYPE_NONE>;

status =3D "disabled"?

> +               };
> +
>                 pm8150_gpios: gpio@c000 {
>                         compatible =3D "qcom,pm8150-gpio";
>                         reg =3D <0xc000>;
> --=20
> 2.20.1
>=20

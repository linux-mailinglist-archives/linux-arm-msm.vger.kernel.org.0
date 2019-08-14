Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1BFB8D8AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbfHNRBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:01:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728329AbfHNRBF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:01:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 027C42063F;
        Wed, 14 Aug 2019 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802065;
        bh=Vh+lga1zBJdv/7/3pj4v8unidtWcvcdce5+7GazS3nI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Pn7XS1QqYeCxlgbOHi0Q2V295J2Yw83V6M52HLgvD/biAQ3DLRmelp6urX9rHWdEO
         5o3Vl2vKK7TWeCpC4Um/i4GXA8dkMLnGGTNMlKmq86wrfd5grVeDFRWbPnmixISTpF
         5kUVGZizZp/IyKfvKQyKp3dJPi7v1NF5FPkwKU94=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-4-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-4-vkoul@kernel.org>
Subject: Re: [PATCH 03/22] arm64: dts: qcom: sm8150: add tlmm node
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:01:04 -0700
Message-Id: <20190814170105.027C42063F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:49:53)
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Add some commit text? Or just squash with the first patch? Not sure why
it's a different commit.

>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/q=
com/sm8150.dtsi
> index cd9fcadaeacb..5f2f21270e2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -189,6 +189,21 @@
>                         };
>                 };
> =20
> +               tlmm: pinctrl@3100000 {
> +                       compatible =3D "qcom,sm8150-pinctrl";
> +                       reg =3D <0x03100000 0x300000>,
> +                             <0x03500000 0x300000>,
> +                             <0x03900000 0x300000>,
> +                             <0x03D00000 0x300000>;

Please don't use capitalized hex characters.

> +                       reg-names =3D "west", "east", "north", "south";
> +                       interrupts =3D <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +                       gpio-ranges =3D <&tlmm 0 0 175>;
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +

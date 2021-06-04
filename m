Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C4239C2D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 23:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhFDVrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 17:47:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229930AbhFDVro (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 17:47:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D325B61403;
        Fri,  4 Jun 2021 21:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622843157;
        bh=/SeCtTg7XVH3TrVFpbsNU4uw/aknBvRf/HKh5NI2bA0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pCXGlYnNTnEBGa0tw0/6tK+OYJdENvh+QIqW4BzNnTsovjXENYOa4AWd8zF04nezW
         ntS4jXTs3KUalCawi/ZTxXXVt9hgxGqPY60/RxHHY8b/bBt8LCdqOo81vfOZRTtpcc
         uu0d4B4EW8aRpQFB4c4cslNMFC0lvYOmrCU4MYRss/fo2JWYrtzzmH/qBKsQElZxub
         plIFs1SGGgJcqADYHUm92Ny5BnOq2xWQWPE1xJPp4r+WB3dsj3YasEhFJumIRYPBU4
         NF3EOmEqxbz4aGGRzwJ2pC80f66QCY0Kzu4nfihEdyP5GltJUIO4Sv5Rf731NofQ4w
         4qVQLTRWdbFpA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210604135439.19119-2-rojay@codeaurora.org>
References: <20210604135439.19119-1-rojay@codeaurora.org> <20210604135439.19119-2-rojay@codeaurora.org>
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Date:   Fri, 04 Jun 2021 14:45:56 -0700
Message-ID: <162284315655.1835121.6817703229350764867@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Roja Rani Yarubandi (2021-06-04 06:54:37)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7280-idp.dts
> index 3900cfc09562..d0edffc15736 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -268,6 +268,22 @@ pmr735b_die_temp {
>                 };
>  };
> =20
> +&qspi {
> +       status =3D "okay";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
> +
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               reg =3D <0>;
> +
> +               /* TODO: Increase frequency after testing */

Is this going to change? Please set it to 37.5MHz if that's the max
supported.

> +               spi-max-frequency =3D <25000000>;
> +               spi-tx-bus-width =3D <2>;
> +               spi-rx-bus-width =3D <2>;
> +       };
> +};
> +
>  &qupv3_id_0 {
>         status =3D "okay";
>  };

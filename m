Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A871E537B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 03:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgE1B4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 21:56:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:52942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgE1B4x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 21:56:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1E2B0207CB;
        Thu, 28 May 2020 01:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590631013;
        bh=JPh9VqWlO6/GEoqC3u2uYd8L4jEnjtFsdsbXczjP7Bg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N23kTYfh52xFeon1etjkNSjhcqiIQGJS5S7hkM/TEUVQlE6jTdhUBuoK4o+FePJqy
         jO0kUfDvkWytrKDtzowKTt2cetZ/VzY5suJrFV9XfxYgWLf8sYeVpk8Mgb0tl2WDmy
         o8GPys9KmPYJsPIY4FC1adLbIz3nGTGUKEKhe1/4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1590582292-13314-6-git-send-email-sivaprak@codeaurora.org>
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org> <1590582292-13314-6-git-send-email-sivaprak@codeaurora.org>
Subject: Re: [PATCH V6 5/5] arm64: dts: ipq6018: Add support for apss pll
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     Sivaprakash Murugesan <sivaprak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Wed, 27 May 2020 18:56:52 -0700
Message-ID: <159063101240.69627.8166973936029543160@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sivaprakash Murugesan (2020-05-27 05:24:52)
> Enable apss pll support.
>=20
> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
> ---
> [V6]
>  * split the mailbox driver from this patch
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/=
qcom/ipq6018.dtsi
> index 1aa8d85..3956e44 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -300,6 +300,14 @@
>                         #mbox-cells =3D <1>;
>                 };
> =20
> +               apsspll: clock@b116000 {
> +                       compatible =3D "qcom,ipq6018-a53pll";
> +                       reg =3D <0x0b116000 0x40>;
> +                       #clock-cells =3D <0>;
> +                       clocks =3D <&xo>;
> +                       clock-names =3D "xo";
> +               };
> +

I'd expect to see this inside an soc node. Also this doesn't go via clk
tree so don't send it with the clk patches.

>                 timer {
>                         compatible =3D "arm,armv8-timer";
>                         interrupts =3D <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4)=
 | IRQ_TYPE_LEVEL_LOW)>,

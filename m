Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E204D43E090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 14:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhJ1MOS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 08:14:18 -0400
Received: from mail-4317.proton.ch ([185.70.43.17]:53711 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhJ1MOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 08:14:17 -0400
Date:   Thu, 28 Oct 2021 12:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1635423109;
        bh=PlW2MEvZvaJsdKC/4jucamYl9ccqJy0+z3t4+X+zwqA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=pski+bxVYJ7tX0UwCqLsZ2/vtCRU9WFXuh8Haeu+k48EsX6/xjF09relxyuSKd+Cb
         c9HA3H//FvdY0FB5v5QW35QskEP10CovBCI9rLaHiM/dD1tzBbHQUw37p54Nri0Y4R
         +yFSemLmm2jR1GKlgo/bHpu/jtGhUl5/DiKmegEw=
To:     Kate Doeen <jld3103yt@gmail.com>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-common: set venus firmware path
Message-ID: <76047768-1646-a784-4a0c-eb82bc72c1d9@connolly.tech>
In-Reply-To: <20211028101957.106034-1-jld3103yt@gmail.com>
References: <20211028101957.106034-1-jld3103yt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Kate,


On 28/10/2021 11:19, Kate Doeen wrote:
> Enable loading the Qualcomm Venus video accelerator firmware on OnePlus s=
dm845 devices.
>
> Signed-off-by: Kate Doeen <jld3103yt@gmail.com>
>
> ---
>   arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index d4355522374a..b405271bbf37 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -641,6 +641,10 @@ mux {
>   =09};
>   };
>
> +&venus {
> +=09firmware-name =3D "qcom/sdm845/oneplus6/venus.mbn";
> +};
> +
>   &wifi {
>   =09status =3D "okay";
>   =09vdd-0.8-cx-mx-supply =3D <&vreg_l5a_0p8>;
> --
> 2.33.1
>
Thanks for adding this!

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

--
Kind Regards,
Caleb


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845D34580BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbhKTV7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:59:44 -0500
Received: from mail-4022.proton.ch ([185.70.40.22]:22140 "EHLO
        mail-4022.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbhKTV7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:59:44 -0500
Date:   Sat, 20 Nov 2021 21:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637445398;
        bh=NE69VuQ2AFtUVf1PAPgUv1e/DDEsYZGhxd6gfXS2xA0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qNRF84xg4A7HQgG5h6IBlJGpAzCaiQi71+vcHdOOKcqWuT5nlYaaBN6/jhwYx4vzL
         lB4iIHEaNoJZDwuGFX/dqqJJy7HbWsdVwtNr9eWI0A8fG4+S+ygAhrvZlVKCCBOWof
         FviOseVygl4aWXT01vQw1PpDLjVWsMRDV3PgKW2g=
To:     Dang Huynh <danct12@riseup.net>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB
Message-ID: <7431c057-7e56-e38b-eb3a-66971c5c5dbb@connolly.tech>
In-Reply-To: <20211120214227.779742-9-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-9-danct12@riseup.net>
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



On 20/11/2021 21:42, Dang Huynh wrote:
> From: Alexey Min <alexey.min@gmail.com>
>
> Enable and configure DWC3 and QUSB2 PHY to enable USB
> functionality on the Redmi Note 7.
>
> Signed-off-by: Alexey Min <alexey.min@gmail.com>
> Co-developed-by: Dang Huynh <danct12@riseup.net>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/a=
rm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 45e58714af71..6cdd9f7c864b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -79,6 +79,15 @@ framebuffer_mem: memory@9d400000 {
>   =09=09=09no-map;
>   =09=09};
>   =09};
> +
> +=09/*
> +=09 * Until we hook up type-c detection, we
> +=09 * have to stick with this. But it works.
> +=09 */
> +=09extcon_usb: extcon-usb {
> +=09=09compatible =3D "linux,extcon-usb-gpio";
> +=09=09id-gpio =3D <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +=09};
>   };
>
>   &blsp1_uart2 {
> @@ -95,6 +104,13 @@ &pon_resin {
>   =09linux,code =3D <KEY_VOLUMEDOWN>;
>   };
>
> +&qusb2phy {
> +=09status =3D "okay";
> +
> +=09vdd-supply =3D <&vreg_l1b_0p925>;
> +=09vdda-phy-dpdm-supply =3D <&vreg_l7b_3p125>;
> +};
> +
>   &rpm_requests {
>   =09pm660l-regulators {
>   =09=09compatible =3D "qcom,rpm-pm660l-regulators";
> @@ -370,3 +386,12 @@ &sdhc_2 {
>   &tlmm {
>   =09gpio-reserved-ranges =3D <8 4>;
>   };
> +
> +&usb3 {
> +=09status =3D "okay";
> +};
> +
> +&usb3_dwc3 {
> +=09dr_mode =3D "peripheral";
> +=09extcon =3D <&extcon_usb>;
> +};
> --
> 2.33.1
>

Reviewed-by: Caleb Connolly <caleb@connolly>

--
Kind Regards,
Caleb


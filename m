Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C7245809E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhKTVvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:51:04 -0500
Received: from mail-4022.proton.ch ([185.70.40.22]:34278 "EHLO
        mail-4022.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhKTVvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:51:04 -0500
Date:   Sat, 20 Nov 2021 21:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637444878;
        bh=2Y2y86H9TPwE4dS4X+Ec6pt6QcS7T+DsQvhWBMghZZA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=J0PDK79KCFeJ5PNlHnAoyoMuvkDdhNw+liexWI751OEDX7AAeWw6BVtbbj8KRh731
         09TesZ9dtGyU9Dn9EAiLoYbqfQwVfR1/V1iDm7nh5VhgGFZNRZp8JGAH9ctGSr+Ldi
         csCy1Rl2dNBsVSccqsLxvDQOXdrduGtyM/sA4I7g=
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
Subject: Re: [PATCH v4 2/8] arm64: dts: qcom: sdm630-pm660: Move RESIN to pm660 dtsi
Message-ID: <a14e57f6-cfb8-8b94-e605-dfe52c6466fb@connolly.tech>
In-Reply-To: <20211120214227.779742-3-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-3-danct12@riseup.net>
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
> It's not worth duplicating the same node over and over again,
> so let's keep the common bits in the pm660 DTSI, making only
> changing the status and keycode necessary.
>
> Also, disable RESIN/PWR by default just in case if there are
> devices that doesn't use them.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   arch/arm64/boot/dts/qcom/pm660.dtsi              | 12 +++++++++++-
>   .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi   | 16 ++++++++--------
>   2 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qc=
om/pm660.dtsi
> index d0ef8a1675e2..c482663aad56 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -54,14 +54,24 @@ pon: pon@800 {
>   =09=09=09mode-bootloader =3D <0x2>;
>   =09=09=09mode-recovery =3D <0x1>;
>
> -=09=09=09pwrkey {
> +=09=09=09pon_pwrkey: pwrkey {
>   =09=09=09=09compatible =3D "qcom,pm8941-pwrkey";
>   =09=09=09=09interrupts =3D <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
>   =09=09=09=09debounce =3D <15625>;
>   =09=09=09=09bias-pull-up;
>   =09=09=09=09linux,code =3D <KEY_POWER>;
> +
> +=09=09=09=09status =3D "disabled";
>   =09=09=09};
>
> +=09=09=09pon_resin: resin {
> +=09=09=09=09compatible =3D "qcom,pm8941-resin";
> +=09=09=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +=09=09=09=09debounce =3D <15625>;
> +=09=09=09=09bias-pull-up;
> +
> +=09=09=09=09status =3D "disabled";
> +=09=09=09};
>   =09=09};
>
>   =09=09pm660_temp: temp-alarm@2400 {
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch=
/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 11d0a8c1cf35..e90c9ec84675 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -215,14 +215,14 @@ &blsp2_uart1 {
>   =09/* HCI Bluetooth */
>   };
>
> -&pon {
> -=09volup {
> -=09=09compatible =3D "qcom,pm8941-resin";
> -=09=09interrupts =3D <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> -=09=09debounce =3D <15625>;
> -=09=09bias-pull-up;
> -=09=09linux,code =3D <KEY_VOLUMEUP>;
> -=09};
> +&pon_pwrkey {
> +=09status =3D "okay";
> +};
> +
> +&pon_resin {
> +=09status =3D "okay";
> +
> +=09linux,code =3D <KEY_VOLUMEUP>;
>   };
>
>   &qusb2phy {
> --
> 2.33.1
>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

--
Kind Regards,
Caleb


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC2C4580A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhKTVyQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:54:16 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:60880 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbhKTVyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:54:16 -0500
Date:   Sat, 20 Nov 2021 21:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637445070;
        bh=YrdUs9a9Pkb/YPdOak/pS/H8ZRR0hMElATwxRnAmpcY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=MKdWm7h5Lj2xA108qaTCYY/V2U8C3ps84Ufclbf17EXC2SofvV0ktiFgqtqDnJgV/
         VYTqXMw5hV9ZYs9WQZzs0+fut/I+pjE24lBgPCFpB3XYj3I5o/mgMpxqucTTEZSYoK
         ufeMKDx0brMzDHq4POemGFVMyWj3jbIbJOQVqvcw=
To:     Dang Huynh <danct12@riseup.net>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Konrad Dybcio <konradybcio@gmail.com>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v4 5/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add volume up button
Message-ID: <5ecda386-0ae3-cf46-9f91-1f54c3b4f89d@connolly.tech>
In-Reply-To: <20211120214227.779742-6-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-6-danct12@riseup.net>
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
> This enables the volume up key.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/a=
rm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 9a6684922804..c7bdf4c28be4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -9,6 +9,8 @@
>   #include "sdm660.dtsi"
>   #include "pm660.dtsi"
>   #include "pm660l.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>
>
>   / {
>   =09model =3D "Xiaomi Redmi Note 7";
> @@ -33,6 +35,18 @@ vph_pwr: vph-pwr-regulator {
>   =09=09regulator-boot-on;
>   =09};
>
> +=09gpio-keys {
> +=09=09compatible =3D "gpio-keys";
> +=09=09input-name =3D "gpio-keys";
I don't think input-name is used anymore.
> +
> +=09=09volup {
> +=09=09=09label =3D "Volume Up";
> +=09=09=09gpios =3D <&pm660l_gpios 7 GPIO_ACTIVE_LOW>;
> +=09=09=09linux,code =3D <KEY_VOLUMEUP>;
> +=09=09=09debounce-interval =3D <15>;
> +=09=09};
> +=09};
> +
>   =09reserved-memory {
>   =09=09#address-cells =3D <2>;
>   =09=09#size-cells =3D <2>;
> --
> 2.33.1
>

--
Kind Regards,
Caleb


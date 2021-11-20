Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F054580AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhKTVyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:54:55 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:55947 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhKTVyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:54:55 -0500
Date:   Sat, 20 Nov 2021 21:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637445108;
        bh=JFHH1UueL7vKFVIDUpqqk8gvpvagyJtjaQOnjoF0n+o=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Yr12p34ExGgvX4tiS5MnG69/oSRnwJIqtxZrFItNARfLGbAoDs0HLOzJLoa9NW4LC
         prbFdJuaH18cYNlDSzzS7sTrgeBQZqh7mk5YCJABhWiNf3VfziCVL9/2HIvgOhhOCn
         8efsg9oOyFIUyoLbkcCk8jtmrjyX1Tc6DepTH8fA=
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
Subject: Re: [PATCH v4 7/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable Simple Framebuffer
Message-ID: <0863db0f-c3ed-1b68-2478-982302dc7942@connolly.tech>
In-Reply-To: <20211120214227.779742-8-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-8-danct12@riseup.net>
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
> This lets the user sees the framebuffer console.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/a=
rm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index d30cdc6c160a..45e58714af71 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -22,7 +22,20 @@ aliases {
>   =09};
>
>   =09chosen {
> +=09=09#address-cells =3D <2>;
> +=09=09#size-cells =3D <2>;
> +=09=09ranges;
> +
>   =09=09stdout-path =3D "serial0:115200n8";
> +
> +=09=09framebuffer0: framebuffer@9d400000 {
> +=09=09=09compatible =3D "simple-framebuffer";
> +=09=09=09reg =3D <0 0x9d400000 0 (1080 * 2340 * 4)>;
> +=09=09=09width =3D <1080>;
> +=09=09=09height =3D <2340>;
> +=09=09=09stride =3D <(1080 * 4)>;
> +=09=09=09format =3D "a8r8g8b8";
> +=09=09};
>   =09};
>
>   =09vph_pwr: vph-pwr-regulator {
> @@ -60,6 +73,11 @@ ramoops@a0000000 {
>   =09=09=09ftrace-size =3D <0x0>;
>   =09=09=09pmsg-size =3D <0x20000>;
>   =09=09};
> +
> +=09=09framebuffer_mem: memory@9d400000 {
> +=09=09=09reg =3D <0x0 0x9d400000 0x0 0x23ff000>;
> +=09=09=09no-map;
> +=09=09};
>   =09};
>   };
>
> --
> 2.33.1
>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

--
Kind Regards,
Caleb


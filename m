Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B554580A5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhKTVwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:52:19 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:60140 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhKTVwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:52:19 -0500
Date:   Sat, 20 Nov 2021 21:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637444951;
        bh=Q+KDMs3zl8g7uXOaAWgHJJj0q1KOY7hdAJB5lE1i8a0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=IUtNHJBL8wwzWDQWtFn3Go2X0baFjYRGSCyGDseLA+y/VCEk7JyHlT8kiRG5AezpQ
         0uc3YqFssY1BAp7VIwXBxZ6EdO34E3DXnGkibO+GVrTgV03Gpma2xdjzD+cjeM0fPL
         kDYaQnSvZ8Ja0SaJZp/5MzXnEzJspbUYqeFD8ZM4=
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
Subject: Re: [PATCH v4 4/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add PWRKEY and RESIN
Message-ID: <6324b393-4c32-376e-8346-61afeb5a8814@connolly.tech>
In-Reply-To: <20211120214227.779742-5-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-5-danct12@riseup.net>
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
> This enables the volume down key as well as the power button.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/a=
rm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index eccbeecef192..9a6684922804 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -53,6 +53,16 @@ &blsp1_uart2 {
>   =09status =3D "okay";
>   };
>
> +&pon_pwrkey {
> +=09status =3D "okay";
> +};
> +
> +&pon_resin {
> +=09status =3D "okay";
> +
> +=09linux,code =3D <KEY_VOLUMEDOWN>;
> +};
> +
>   &rpm_requests {
>   =09pm660l-regulators {
>   =09=09compatible =3D "qcom,rpm-pm660l-regulators";
> --
> 2.33.1
>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

--
Kind Regards,
Caleb


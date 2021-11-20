Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 177424580AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 22:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhKTVyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 16:54:35 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:56278 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhKTVyf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 16:54:35 -0500
Date:   Sat, 20 Nov 2021 21:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1637445088;
        bh=SPe6OtIz0ecyROsOPGQ9CPUUkcrEwVx42ibPqQRCE1Q=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QR+cnMZ7Lr2S2CBM+G+5IaElHNoQLZ3ENRFItuhzsti/U6x36aQt9+ILvnZQN9neR
         Qr9ly4dN4G2pQ+LuGoCZ8lxDYSaH3/IQQ+wcfAlFn1oJsfrqs26xbd1BegFK+olM9g
         DaZfeehTYnEmr250VxJyUGs0O/14G/LDw7Ywg26o=
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
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD
Message-ID: <668450a6-35c9-b60c-a8f2-b7e86f701182@connolly.tech>
In-Reply-To: <20211120214227.779742-7-danct12@riseup.net>
References: <20211120214227.779742-1-danct12@riseup.net> <20211120214227.779742-7-danct12@riseup.net>
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
> This commit enable the SD card slot and internal MMC.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/a=
rm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index c7bdf4c28be4..d30cdc6c160a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -330,6 +330,25 @@ vreg_l19a_3p3: l19 {
>   =09};
>   };
>
> +&sdhc_1 {
> +=09status =3D "okay";
> +=09supports-cqe;
> +
> +=09mmc-hs200-1_8v;
> +=09mmc-hs400-1_8v;
> +=09mmc-hs400-enhanced-strobe;
> +
> +=09vmmc-supply =3D <&vreg_l4b_2p95>;
> +=09vqmmc-supply =3D <&vreg_l8a_1p8>;
> +};
> +
> +&sdhc_2 {
> +=09status =3D "okay";
> +
> +=09vmmc-supply =3D <&vreg_l5b_2p95>;
> +=09vqmmc-supply =3D <&vreg_l2b_2p95>;
> +};
> +
>   &tlmm {
>   =09gpio-reserved-ranges =3D <8 4>;
>   };
> --
> 2.33.1
>

Reviewed-by: Caleb Connolly <caleb@connolly.tech>

--
Kind Regards,
Caleb


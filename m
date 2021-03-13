Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91C5033A12E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Mar 2021 21:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234409AbhCMU4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Mar 2021 15:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbhCMU4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Mar 2021 15:56:38 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401CFC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 12:56:38 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id j6so13498956plx.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Mar 2021 12:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=omQQ7Zsxd9ScrTPA5EKinVOg0Ak40N0oMvDticu25WY=;
        b=WN7KC5Qc8Zj06QbnI7kSACGe5QT/Ay6O65xbbfdYX6IMiTEiMclbFdqQ3JePPbP/wd
         EiHc/xZYgFCqY5NScqddwW6R9AjSwZMzhrAjxn/FzTJ22gBJCgacej/C5SuibuM6AosX
         GxAW+KMdPQ0nZ8dOmQAHTosOS6OmloE9PJKUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=omQQ7Zsxd9ScrTPA5EKinVOg0Ak40N0oMvDticu25WY=;
        b=ifJXSHdfVbrh3+Z3eK+edORCkJZ0SgKzTR3rGYQ0SKwQSFp8kwXLqCn+OhfVsmd/+I
         XBR+WFrnzj8dP/eaRPSR7YA9tonfaZj3N3YRgVQ+be+qJEEkko8uwm8oUnlLpY/pfR6G
         V74B6Q9h8VXRk4V4iV3Ek20uRwEpiz5sV+fpNkiKKwUwz6LDTN2NTsU7UTtNgTo76VMR
         e2expnx9e6iENWiM12FkqX8qAEQARllbbkXAbOgxCZVCsD1vkrn+3pmtdnyh0zCj1AJw
         Cbgqf+xtg9bNZ36dFz7kgK2s43cqF4tKRwH/lrZ/ORxAp171A/PsQ95Wt06xLB0EM+OX
         ED7w==
X-Gm-Message-State: AOAM5308DyV2Mdt++ih1XccIQttvwYLD7hxcBjWQ/SXPb87MG30p3tYK
        YU7eSJTpWHE85qbBFy7DhWnmHA==
X-Google-Smtp-Source: ABdhPJyWdQ4nHaIYeyZLW7GvxDk0qMI8ncr8PKf3F1+5QGKxuKfaj/sXOVRGk0sgJy5BeeRWcJ8sGg==
X-Received: by 2002:a17:90a:be0e:: with SMTP id a14mr4964683pjs.131.1615668997641;
        Sat, 13 Mar 2021 12:56:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:e859:c7d5:7d7b:5ed8])
        by smtp.gmail.com with ESMTPSA id u20sm9149305pfm.146.2021.03.13.12.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 12:56:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313054654.11693-2-srivasam@codeaurora.org>
References: <20210313054654.11693-1-srivasam@codeaurora.org> <20210313054654.11693-2-srivasam@codeaurora.org>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, dianders@chromium.org,
        judyhsiao@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org
Date:   Sat, 13 Mar 2021 12:56:35 -0800
Message-ID: <161566899554.1478170.1265435102634351195@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-03-12 21:46:53)
> From: Ajit Pandey <ajitp@codeaurora.org>
>=20
> Add dai link for supporting lpass I2S driver, which is used
> for audio capture and playback.
> Add lpass-cpu node with  pin controls and i2s primary

Why two spaces before 'pin'?

> and secondary dai-links

Please end sentence with a period.

>=20
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 58 ++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/bo=
ot/dts/qcom/sc7180-trogdor.dtsi
> index 436582279dad..3a24383247db 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -283,6 +284,42 @@ keyboard_backlight: keyboard-backlight {
>                         max-brightness =3D <1023>;
>                 };
>         };
> +
> +       sound: sound {
> +               compatible =3D "google,sc7180-trogdor";
> +               model =3D "sc7180-rt5682-max98357a-1mic";
> +
> +               audio-routing =3D
> +                       "Headphone Jack", "HPOL",
> +                       "Headphone Jack", "HPOR";
> +
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               dai-link@0 {
> +                       link-name =3D "MultiMedia0";
> +                       reg =3D <MI2S_PRIMARY>;
> +                       cpu {
> +                               sound-dai =3D <&lpass_cpu MI2S_PRIMARY>;
> +                       };
> +
> +                       sound_multimedia0_codec: codec {
> +                               sound-dai =3D <&alc5682 0 /*aif1*/>;

Nitpick, add a space for comment

                               sound-dai =3D <&alc5682 0 /* aif1 */>;

> +                       };
> +               };
> +
> +               dai-link@1 {
> +                       link-name =3D "MultiMedia1";
> +                       reg =3D <MI2S_SECONDARY>;
> +                       cpu {
> +                               sound-dai =3D <&lpass_cpu MI2S_SECONDARY>;
> +                       };
> +
> +                       sound_multimedia1_codec: codec {
> +                               sound-dai =3D <&max98357a>;
> +                       };
> +               };
> +       };
>  };
> =20
>  &qfprom {
> @@ -720,6 +757,27 @@ &ipa {
>         modem-init;
>  };
> =20
> +&lpass_cpu {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&sec_mi2s_active &pri_mi2s_active &pri_mi2s_mclk_a=
ctive>;

Super nitpick: I prefer this style

	pinctrl-0 =3D <&sec_mi2s_active>, <&pri_mi2s_active>, <&pri_mi2s_mclk_acti=
ve>;

It's effectively the same but the brackets help us see that these are
the end of the phandle specifier instead of having to figure out that
the first phandle isn't specifying the second phandle as an argument.

> +
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       mi2s-primary@0 {

Should the node name just be mi2s instead of mi2s-primary? We have reg
property so I think 'mi2s' should be sufficient to differentiate.

> +               reg =3D <MI2S_PRIMARY>;
> +               qcom,playback-sd-lines =3D <1>;
> +               qcom,capture-sd-lines =3D <0>;
> +       };
> +
> +       mi2s-secondary@1 {
> +               reg =3D <MI2S_SECONDARY>;
> +               qcom,playback-sd-lines =3D <0>;
> +       };
> +};
> +
>  &mdp {
>         status =3D "okay";
>  };

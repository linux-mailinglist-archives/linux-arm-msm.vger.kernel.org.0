Return-Path: <linux-arm-msm+bounces-50217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FBA4E7A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9971F425C44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 17:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB0C27C845;
	Tue,  4 Mar 2025 16:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl/RLT8+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A36266561;
	Tue,  4 Mar 2025 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106299; cv=none; b=HBMFi+wezY321xpVcqz2zmug6pKDUJr0dqLroQ7GEKs8jcNlkjMmSUFyUhXkArMmTmiQNSucx25gv4uxmg4RALVXEIAXPRW9JSPAyxMF8GOnKouKbrd6hR0xnb+Ahz947ntaAvs9n4EB8FtojpHWlezMukZuMzoJvGwOEuNWlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106299; c=relaxed/simple;
	bh=xOBqQU1/wBdBKF+hOUQI10NBZHd2K9ykweBVZqgwYKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=advCMsHOdlC0W699E2NthW+EKE6f8z2KFSLRZanHp4opl5TN7+l1u6LrYaTZvjNIbjEz04YQogLzK9vIgXEpAh6O8MLdj/H3DNhqoZ24jomzMKm8X7TwpJmxqCGP0Qwq30iXTtdCeiDyWjPPa3I/tKZaTGnCUa6vnoWp0XZeT9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl/RLT8+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE116C4CEEB;
	Tue,  4 Mar 2025 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741106298;
	bh=xOBqQU1/wBdBKF+hOUQI10NBZHd2K9ykweBVZqgwYKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fl/RLT8+SH6U5FcsYMizhYNwOFPKh2pnMtRJ8LqLRYztUAP6Ah3LWeOK0yb7lQYFd
	 8ZLQCbGzyTu4SxwZ6f8Ftf/S+uaQ0ifI2OfH4voAFPTo3F196LHfTv6wcAEuK6uIbN
	 NYW5ljY3Ql5FDAiPrJtFjQeYbcMn4IdkWfLU9IrV3HNNFB/BnCgOBwPspY54Nr59tC
	 SP7jVp8VvgI2js4Icd/gb2kWNi6u0krw0PFq1WmaZO8P9gyavUfEPQb9rpfYjwCDGw
	 ZMceWjyq84T+6YshAGGRM2hjSqGCvMihvX7UTsWZMl2nvTv6CioAFkgh2pgSFfKIXf
	 S0B40y08ZAlQg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf615d5f31so569740766b.2;
        Tue, 04 Mar 2025 08:38:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6to/WPUMLO+vkDXk+RyKBqlRb0Oj/7xJTpOOxfpUOBe/p31ANpCW8urMLOv5G/DEG+shJwLlbhdpI@vger.kernel.org, AJvYcCVAI0Mbw8pXsSCsnMf3YRimprdCerMeJjvIIYzRvzQF5NgmbIVKJKFOzaDhJFL/sCxO+k6hSOH8mrRWyRM4@vger.kernel.org, AJvYcCX8cRQxPdC3G3BmJNewFIFeXLlpArH+gonybhHw3kZRo55hS+kCDj0Xso3rufKr1+E6krXQe/2d59hk7Ittew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8uFso5J3rZpZkf9gfBS6UAYmUsRPcP6QOooQDTIjJl4LJ6dS
	PmBVrYA1Hw80+0qx2znnbFp445ZKupz/ti9gE2wAJNATjXKgypT1cxFMZrTo7bUdsfVIaDNOTgX
	9Pbtg8cXAYqQgyoq/b8iCcrvOGA==
X-Google-Smtp-Source: AGHT+IEw+X5joqLWCPWv0VGQNAmhXwfbVOK9kqhQQdx1rRlbl9aTYNRL5ii4DIWF7RvyE9RZ769TVeWAWpvYjsaHw8g=
X-Received: by 2002:a17:906:dc8f:b0:abf:777e:79e5 with SMTP id
 a640c23a62f3a-abf777e7cfbmr954338266b.9.1741106297250; Tue, 04 Mar 2025
 08:38:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com> <20241129-topic-sl7_feat2-v2-3-fb6cf5660cfc@oss.qualcomm.com>
In-Reply-To: <20241129-topic-sl7_feat2-v2-3-fb6cf5660cfc@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 4 Mar 2025 10:38:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJVVJD91Q=xG_gkuFXg5mq-EQReUGVbyy7HZ+YQm1EAiw@mail.gmail.com>
X-Gm-Features: AQ5f1JpY0Y8giIR5-SdVrOf21k37EMiWJTHMP4VfoTckpgm1PsiQyNH9qk-Zj7Y
Message-ID: <CAL_JsqJVVJD91Q=xG_gkuFXg5mq-EQReUGVbyy7HZ+YQm1EAiw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-romulus: Set up PS8830s
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 11:20=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.=
org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The Laptop 7 features two USB-C ports, each one sporting a PS8830 USB-C
> retimer/mux. Wire them up.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 282 +++++++++++++++=
+++++-
>  1 file changed, 276 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/a=
rch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> index 80fbcaea5d83e1147a74dd3320ae8fe8c953db57..2236095023a135d8fb1baaede=
111a34be54d160c 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
> @@ -124,7 +124,15 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         pmic_glink_ss0_ss_in: endpoint {
> -                                               remote-endpoint =3D <&usb=
_1_ss0_qmpphy_out>;
> +                                               remote-endpoint =3D <&ret=
imer_ss0_ss_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       pmic_glink_ss0_con_sbu_in: endpoi=
nt {
> +                                               remote-endpoint =3D <&ret=
imer_ss0_con_sbu_out>;
>                                         };
>                                 };
>                         };
> @@ -153,7 +161,15 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         pmic_glink_ss1_ss_in: endpoint {
> -                                               remote-endpoint =3D <&usb=
_1_ss1_qmpphy_out>;
> +                                               remote-endpoint =3D <&ret=
imer_ss1_ss_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       pmic_glink_ss1_con_sbu_in: endpoi=
nt {
> +                                               remote-endpoint =3D <&ret=
imer_ss1_con_sbu_out>;
>                                         };
>                                 };
>                         };
> @@ -185,6 +201,109 @@ vreg_edp_3p3: regulator-edp-3p3 {
>                 regulator-boot-on;
>         };
>
> +       vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_1P15";
> +
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr0_1p15_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_1P8";
> +
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr0_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_3P3";
> +
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr0_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_1P15";
> +
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&tlmm 188 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr1_1p15_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_1P8";
> +
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&tlmm 175 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr1_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_3P3";
> +
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 186 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr1_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +
>         vreg_nvme: regulator-nvme {
>                 compatible =3D "regulator-fixed";
>
> @@ -665,7 +784,59 @@ &i2c3 {
>
>         status =3D "okay";
>
> -       /* PS8830 USB retimer @8 */
> +       /* Left-side rear port */
> +       typec-mux@8 {
> +               compatible =3D "parade,ps8830";
> +               reg =3D <0x8>;
> +
> +               reset-gpios =3D <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
> +
> +               clocks =3D <&rpmhcc RPMH_RF_CLK3>;
> +               clock-names =3D "xo";

clock-names is not part of the binding.

Rob


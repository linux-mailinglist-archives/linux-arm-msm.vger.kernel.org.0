Return-Path: <linux-arm-msm+bounces-50216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36729A4EA0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 18:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A26453A39F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 16:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0312980BD;
	Tue,  4 Mar 2025 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh5fwzpc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2544259C97;
	Tue,  4 Mar 2025 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106225; cv=none; b=hxI6tE0pU+UGDOPKv70VPfHwWm9W+UI0DYhZUIMfhw64kVrZwTNb65avjjzrhmbzhOHlx1W8ivQpD7P1y3aTQtsHiBlBF0jbBI9768lmMJIaGVyrwdVuI0zauMzUl3Cwi01S+sxFfTjRaPxzaAJg02AuL1IUfYJVEecfpuV0Q8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106225; c=relaxed/simple;
	bh=AGrLOKSnlTsmkbcllVLZaU8Of6y6Q1llDLw2a3rkPkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/9NAiPlFshRgAtIET7zrxx+rTy/hKYVQOBQDiAfjHQoe7GsH/fJfqcsqqYOHhp86QUh/BUW1zOCmHAdKyxhxIOP74wfdrHppPAfPMU2y5USFDv5UBMatAg5ezYKmw0i3AILMYFxZ01xhAQvLsOc/t6k8GZ8ars2bRY0dWK/RnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh5fwzpc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F22EC4AF09;
	Tue,  4 Mar 2025 16:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741106224;
	bh=AGrLOKSnlTsmkbcllVLZaU8Of6y6Q1llDLw2a3rkPkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gh5fwzpcgQ4WycUz8DDbUmugthHbVdASqnZZ+hRbmKccEK6Do/AkAVkxaHvra2HZa
	 2u9anmYX17GogplvQcWCIUAGXYPqyd+DmSptfLjUzK9OGLPukd/fopHHoI/RjEA4h8
	 l01g+yKa/bqv+CJzLZalt2AfkrNf2K9jUQJQS050LMmYiGdeBxZihH1tk4KeZPFF0y
	 tWV+rwu/rs09oGssAAziO5J5bl8ORU2o4ooDqNV5IEG4t87aTrPiETsvQCFu8O6joy
	 lr1DsOyCKuuWfFpEEimcoKIhgsZa0kweBdtZEY4X547wbppILw6q6aV4rpckohz5VQ
	 8iZYlvzWVGzQg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so7938790a12.1;
        Tue, 04 Mar 2025 08:37:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURZocEtgtjBIJ9qXigF6gL5gQWZF6qvAeBI6exAz9A/NBpFbJMRz3LbCjdvDiERZ1G8LC7pmWoCNIdPYGsNw==@vger.kernel.org, AJvYcCUb7kk6DxDHlHVT2aoaOkJppfx28jf4gJfmakTGbYpiji8C+bmquOt63EaK5hnQuhMfDwghc8vZ4era@vger.kernel.org, AJvYcCVXzlJ2K0Zs4CX+kqv11t+Jx1l0uq+VXZyQgnPw17V9De/sz4xO+GvNoOnT0Z5DBkQwjIp9TBE2kJVlk/59@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7WnUUsoSgSGWdbKS/t1z9ymTMylq2s4uZvwUWBIaCrlt3NJt
	yEgumG6xiJtj+oxa1Y+i+cl3fw8Cqoc2xsmEIGVDTVxjufK/nQkUXEP8xSynXuKeFxuhBu+zh74
	wJTWj725qNI4vN19j81p9Yx8siw==
X-Google-Smtp-Source: AGHT+IFnZUUkuzztJVmNm0EIvnT5yYMUMy8czgykJcs7fOhf7ibcG+kt/eHyHe+5+RJxH7a19UB86I+dlcvxW98dDTs=
X-Received: by 2002:a05:6402:2788:b0:5e4:c25d:77cd with SMTP id
 4fb4d7f45d1cf-5e4d6af1417mr20467320a12.13.1741106222853; Tue, 04 Mar 2025
 08:37:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025123551.3528206-1-quic_sibis@quicinc.com> <20241025123551.3528206-4-quic_sibis@quicinc.com>
In-Reply-To: <20241025123551.3528206-4-quic_sibis@quicinc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 4 Mar 2025 10:36:51 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+xZyP9Tx34F310ccsjHjvZPowgc39V-aihvtEm6G5K_g@mail.gmail.com>
X-Gm-Features: AQ5f1JpU0LB6yMpKPRbDilLG44xwhXL7vgOstzbRn1fbTa1az4PRiEHyDTg4Yw4
Message-ID: <CAL_Jsq+xZyP9Tx34F310ccsjHjvZPowgc39V-aihvtEm6G5K_g@mail.gmail.com>
Subject: Re: [PATCH V1 3/3] arm64: dts: qcom: x1e001de-devkit: Enable external
 DP support
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, abel.vesa@linaro.org, srinivas.kandagatla@linaro.org, 
	quic_jjohnson@quicinc.com, maz@kernel.org, jens.glathe@oldschoolsolutions.biz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 7:36=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.com=
> wrote:
>
> The Qualcomm Snapdragon X Elite Devkit for Windows has the same
> configuration as the CRD variant i.e. all 3 of the type C ports
> support external DP altmode. Add all the nodes needed to enable
> them.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>
> PS: The ext display patch 3 needs pin-conf and updates from comments on
>     the list. Just included it in the series so that people can get
>     display up. Type c to DP was tested on all ports with [1] as the
>     base branch.
>
> [1] https://git.codelinaro.org/abel.vesa/linux/-/commits/x1e-next-2024093=
0
>
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 444 ++++++++++++++++++-
>  1 file changed, 438 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/bo=
ot/dts/qcom/x1e001de-devkit.dts
> index f169714abcd3..a1dc29a3a05e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> @@ -82,7 +82,15 @@ port@1 {
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
> @@ -111,7 +119,15 @@ port@1 {
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
> @@ -140,7 +156,15 @@ port@1 {
>                                         reg =3D <1>;
>
>                                         pmic_glink_ss2_ss_in: endpoint {
> -                                               remote-endpoint =3D <&usb=
_1_ss2_qmpphy_out>;
> +                                               remote-endpoint =3D <&ret=
imer_ss2_ss_out>;
> +                                       };
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +
> +                                       pmic_glink_ss2_con_sbu_in: endpoi=
nt {
> +                                               remote-endpoint =3D <&ret=
imer_ss2_con_sbu_out>;
>                                         };
>                                 };
>                         };
> @@ -213,6 +237,150 @@ vreg_nvme: regulator-nvme {
>                 regulator-boot-on;
>         };
>
> +       vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_1P15";
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb0_pwr_1p15_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_1P8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb0_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR0_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&usb0_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR1_1P15";
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
> +       vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR2_1P15";
> +               regulator-min-microvolt =3D <1150000>;
> +               regulator-max-microvolt =3D <1150000>;
> +
> +               gpio =3D <&tlmm 189 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr2_1p15_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR2_1P8";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +
> +               gpio =3D <&tlmm 126 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr2_1p8_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_RTMR2_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 187 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&rtmr2_3p3_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
>         vph_pwr: regulator-vph-pwr {
>                 compatible =3D "regulator-fixed";
>
> @@ -591,6 +759,207 @@ vreg_l3j_0p8: ldo3 {
>         };
>  };
>
> +&gpu {
> +       status =3D "okay";
> +
> +       zap-shader {
> +               firmware-name =3D "qcom/x1e80100/Thundercomm/DEVKIT/qcdxk=
msuc8380.mbn";
> +       };
> +};
> +
> +&i2c1 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +
> +       typec-mux@8 {
> +               compatible =3D "parade,ps8830";
> +               reg =3D <0x08>;
> +
> +               clocks =3D <&rpmhcc RPMH_RF_CLK5>;
> +               clock-names =3D "xo";

clock-names is not part of the binding and dtbs_checks now complains.

Rob


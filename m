Return-Path: <linux-arm-msm+bounces-32110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9B97D8FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 19:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01B31284D37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 17:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F39033997;
	Fri, 20 Sep 2024 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kVn1mOwB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E601F1EF1D;
	Fri, 20 Sep 2024 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726853134; cv=none; b=gkLdK4YOXXzr/4sPiNyFJBp/kx61K25VXB+733Vom9cOcyYmOGE2JZniy7glBpXz5HPdUtAvWefTwKAl8Z5EGGb6VTOw9t8eoFRA/TWW0m0ws9pDS3o8F9qdMZfEMVPakmpU1mZndh0uE1LtzlqXgZy3g+wHS3/WNGSQX0DeetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726853134; c=relaxed/simple;
	bh=KtOcXmvTLa0i6ysCCmPSejx5crL9Y35rfFsOLjwsyLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDza/y9ALsKM0fTOuMWewb6QdZfHwNkhGBhHy51fcf3LHzxKn2DYHx9gfa+Il0pQUaIL6J8tyH15psaNVYL8EDkJC6r13EeiTPrjG7twhLqB61I1PUl0VghHq2JiBmWfIvMA4SMD57KoR/R6l7jB6C03Sifo6CE37Hyq2KwE6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kVn1mOwB; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a09af86744so8337865ab.1;
        Fri, 20 Sep 2024 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726853130; x=1727457930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kskcTayy03CXQMBhKB92o2TggzKa7iVX5vYnX4GtKp0=;
        b=kVn1mOwBgPD8wkU7ZBZ/b6eI9m6Rb32+OaOS9uoYJTQrMAVFbAKLLFtnrgny2axpk2
         b/5Xelzz88GF2QuExVDgOyUm8jJfRcf7aSiz4ajYKJKGEl/HNJDDUYpGl7aiYVKaoMTY
         h6SpVJt+KO8+uaGXSrJaDUjDWlAYT7RDocjX0hcJ+DaoS1Az9fiLy32A2zC4tsX5SQry
         l1N5/H6hlDzylenchIJQIhtufSq3mYxeO5LYFBbbgjEUKHlJMlYWY8DfcIzRi4xl/AGT
         I/znn7r7FHaID7pSNpVCeEqY9XWuUU5QmJKz2kwKkxvfddgauTr+eLNUD8mYoGnrZKA5
         HToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726853130; x=1727457930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kskcTayy03CXQMBhKB92o2TggzKa7iVX5vYnX4GtKp0=;
        b=bY3bxYUz3PiZAiTXVjrQF8OWTe0iUqU/YInC7vtynIzL00gDihY72Gc04VD4xQnUkX
         1WHjkRUjo7zj3xPEocBEyQKXD54opDb0PeZDgd8IoFPIthSvddem+6ftHXYRXKSgVK0G
         A0oodQ3jUqxVv7jWGeQ5BbQp9OraoTXyvNWE1iMyec28zKTVbR/wuHtZOUiN36RfXjRf
         7Cog2c1OowpNcnVwugwArYZV37dOanY17x/8IOpcus29HKbSkc/t4kpLSRaBKNkTfQ2d
         0KE+jd6RuyHuEJsez752LbL8YG+9IZ9uuzaHkKw+eVEcBWlxK+b3IO2PCOrqboy/0T8p
         THig==
X-Forwarded-Encrypted: i=1; AJvYcCUT3J1gs/2rOBJet4KvbY9ykJwubluhz4cERGstc5iXNldNOoyifVk7NLFjm/JnDBFK1ZGFO0Lol5wGn4SQkg==@vger.kernel.org, AJvYcCWXccOczKD4TBdgL1GV7bHx2YthxCDikV1QueBxFpwCkZ/gixRK8LXxfDWhC9pgWMMXZaFpCOltF2f9@vger.kernel.org, AJvYcCWaDwIs6nquXd3365hkxIrITsZ786JuB1+/SM1r5z4o0izveqJsscjEYBOO8EvQGF0Ewx3FozK6Z9aEXBKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xFnLkOoI7esCjRA/+vo6jIifCYWOM5xHHE79+GKikmrwYt2V
	57x3lfXK9OBnvgxMDWxYCjTKhoD+NQs+DOnJXmrSEiUP0ohKz1NxC/HTKeXSAKrCsMhZczLMTQs
	N5OkO8+40flp+bwIve/0nvzWN98E=
X-Google-Smtp-Source: AGHT+IF1rRZ9T/uyfJ6PNVtqq/NxbRn52IRbqX4iD0MlZt1/17BspNxPel0GbiPMOEQVMU+qnCb6nOcmvgEHXToKBp8=
X-Received: by 2002:a05:6e02:1c2f:b0:3a0:5642:c78 with SMTP id
 e9e14a558f8ab-3a0c8cdad80mr40827195ab.15.1726853129969; Fri, 20 Sep 2024
 10:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919170018.13672-1-alex.vinarskis@gmail.com> <20240919170018.13672-4-alex.vinarskis@gmail.com>
In-Reply-To: <20240919170018.13672-4-alex.vinarskis@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 20 Sep 2024 10:25:18 -0700
Message-ID: <CAF6AEGsqWLvQy9FP48as4u_70xkXpd2G8tRm9H1Cc850fcMQGg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2024 at 10:01=E2=80=AFAM Aleksandrs Vinarskis
<alex.vinarskis@gmail.com> wrote:
>
> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
>
> Working:
> * Touchpad
> * Keyboard (only post suspend&resume, i2c-hid patch WIP)
> * eDP, with brightness control
> * NVME
> * USB Type-C ports in USB2/USB3 (one orientation)
> * WiFi
> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> * Lid switch
> * Sleep/suspend, nothing visibly broken on resume
>
> Not working:
> * Speakers (WIP, pin guessing, x4 WSA8845)
> * Microphones (WIP, pin guessing)
> * Fingerprint Reader (WIP, USB MP with ptn3222)
> * USB as DP/USB3 (WIP, PS8830 based)
> * Camera
> * Battery Info
>
> Should be working, but cannot be tested due to lack of hw:
> * Higher res OLED, higher res IPS panels

My suspicion is that OLED vs IPS will require different dtb.  I'm
expecting the OLED to use samsung,atna33xc20 panel driver (see "arm64:
dts: qcom: x1e80100-yoga: Update panel bindings"), but IPS can
probably use edp-panel.  I'm not sure if anyone has gotten both panels
working on any other device that has both IPS and OLED variants, so
this remains a theory.  The t14s, which also has both IPS and OLED,
has different DMI/CHID values for the different SKUs, so DtbLoader
should be able to pick the correct dtb, once it exists.

BR,
-R

> * Touchscreen
>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
>  2 files changed, 861 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index ae002c7cf126..111c589d6bae 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e78100-lenovo-thinkpad-t14s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-dell-tributo-13.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-microsoft-romulus13.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-microsoft-romulus15.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> new file mode 100644
> index 000000000000..d387f133c398
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> @@ -0,0 +1,860 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + * Copyright (c) 2024 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +       model =3D "Dell XPS 13 9345";
> +       compatible =3D "dell,tributo-13", "qcom,x1e80100";
> +       chassis-type =3D "laptop";
> +
> +       gpio-keys {
> +               compatible =3D "gpio-keys";
> +
> +               pinctrl-0 =3D <&hall_int_n_default>;
> +               pinctrl-names =3D "default";
> +
> +               switch-lid {
> +                       gpios =3D <&tlmm 92 GPIO_ACTIVE_LOW>;
> +                       linux,input-type =3D <EV_SW>;
> +                       linux,code =3D <SW_LID>;
> +                       wakeup-source;
> +                       wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> +               };
> +       };
> +
> +       leds {
> +               compatible =3D "gpio-leds";
> +
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&cam_indicator_en>;
> +
> +               led-camera-indicator {
> +                       label =3D "white:camera-indicator";
> +                       function =3D LED_FUNCTION_INDICATOR;
> +                       color =3D <LED_COLOR_ID_WHITE>;
> +                       gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "none";
> +                       default-state =3D "off";
> +                       /* Reuse as a panic indicator until we get a "cam=
era on" trigger */
> +                       panic-indicator;
> +               };
> +       };
> +
> +       pmic-glink {
> +               compatible =3D "qcom,x1e80100-pmic-glink",
> +                                        "qcom,sm8550-pmic-glink",
> +                                        "qcom,pmic-glink";
> +               orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +                                                       <&tlmm 123 GPIO_A=
CTIVE_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               /* Right-side USB Type-C port */
> +               connector@0 {
> +                       compatible =3D "usb-c-connector";
> +                       reg =3D <0>;
> +                       power-role =3D "dual";
> +                       data-role =3D "dual";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +
> +                                       pmic_glink_ss0_hs_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss0_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       pmic_glink_ss0_ss_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss0_qmpphy_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               /* Left-side USB Type-C port */
> +               connector@1 {
> +                       compatible =3D "usb-c-connector";
> +                       reg =3D <1>;
> +                       power-role =3D "dual";
> +                       data-role =3D "dual";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +
> +                                       pmic_glink_ss1_hs_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss1_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       pmic_glink_ss1_ss_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss1_qmpphy_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> +
> +       reserved-memory {
> +               linux,cma {
> +                       compatible =3D "shared-dma-pool";
> +                       size =3D <0x0 0x8000000>;
> +                       reusable;
> +                       linux,cma-default;
> +               };
> +       };
> +
> +       vph_pwr: vph-pwr-regulator {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "vph_pwr";
> +               regulator-min-microvolt =3D <3700000>;
> +               regulator-max-microvolt =3D <3700000>;
> +
> +               regulator-always-on;
> +               regulator-boot-on;
> +       };
> +
> +       vreg_edp_3p3: regulator-edp-3p3 {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_EDP_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&edp_reg_en>;
> +               pinctrl-names =3D "default";
> +
> +               regulator-boot-on;
> +       };
> +
> +       vreg_nvme: regulator-nvme {
> +               compatible =3D "regulator-fixed";
> +
> +               regulator-name =3D "VREG_NVME_3P3";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +
> +               gpio =3D <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +
> +               pinctrl-0 =3D <&nvme_reg_en>;
> +               pinctrl-names =3D "default";
> +       };
> +};
> +
> +&apps_rsc {
> +       regulators-0 {
> +               compatible =3D "qcom,pm8550-rpmh-regulators";
> +               qcom,pmic-id =3D "b";
> +               vdd-bob1-supply =3D <&vph_pwr>;
> +               vdd-bob2-supply =3D <&vph_pwr>;
> +               vdd-l1-l4-l10-supply =3D <&vreg_s4c_1p8>;
> +               vdd-l2-l13-l14-supply =3D <&vreg_bob1>;
> +               vdd-l5-l16-supply =3D <&vreg_bob1>;
> +               vdd-l6-l7-supply =3D <&vreg_bob2>;
> +               vdd-l8-l9-supply =3D <&vreg_bob1>;
> +               vdd-l12-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l15-supply =3D <&vreg_s4c_1p8>;
> +               vdd-l17-supply =3D <&vreg_bob2>;
> +
> +               vreg_bob1: bob1 {
> +                       regulator-name =3D "vreg_bob1";
> +                       regulator-min-microvolt =3D <3008000>;
> +                       regulator-max-microvolt =3D <3960000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_bob2: bob2 {
> +                       regulator-name =3D "vreg_bob2";
> +                       regulator-min-microvolt =3D <2504000>;
> +                       regulator-max-microvolt =3D <3008000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2b_3p0: ldo2 {
> +                       regulator-name =3D "vreg_l2b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l4b_1p8: ldo4 {
> +                       regulator-name =3D "vreg_l4b_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l6b_1p8: ldo6 {
> +                       regulator-name =3D "vreg_l6b_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <2960000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l8b_3p0: ldo8 {
> +                       regulator-name =3D "vreg_l8b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l9b_2p9: ldo9 {
> +                       regulator-name =3D "vreg_l9b_2p9";
> +                       regulator-min-microvolt =3D <2960000>;
> +                       regulator-max-microvolt =3D <2960000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l12b_1p2: ldo12 {
> +                       regulator-name =3D "vreg_l12b_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l13b_3p0: ldo13 {
> +                       regulator-name =3D "vreg_l13b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l14b_3p0: ldo14 {
> +                       regulator-name =3D "vreg_l14b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3072000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l15b_1p8: ldo15 {
> +                       regulator-name =3D "vreg_l15b_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l17b_2p5: ldo17 {
> +                       regulator-name =3D "vreg_l17b_2p5";
> +                       regulator-min-microvolt =3D <2504000>;
> +                       regulator-max-microvolt =3D <2504000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-1 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "c";
> +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +
> +               vreg_s4c_1p8: smps4 {
> +                       regulator-name =3D "vreg_s4c_1p8";
> +                       regulator-min-microvolt =3D <1856000>;
> +                       regulator-max-microvolt =3D <2000000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l1c_1p2: ldo1 {
> +                       regulator-name =3D "vreg_l1c_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2c_0p8: ldo2 {
> +                       regulator-name =3D "vreg_l2c_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <880000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3c_0p9: ldo3 {
> +                       regulator-name =3D "vreg_l3c_0p9";
> +                       regulator-min-microvolt =3D <920000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-2 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "d";
> +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s4c_1p8>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +
> +               vreg_l1d_0p8: ldo1 {
> +                       regulator-name =3D "vreg_l1d_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <880000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2d_0p9: ldo2 {
> +                       regulator-name =3D "vreg_l2d_0p9";
> +                       regulator-min-microvolt =3D <912000>;
> +                       regulator-max-microvolt =3D <912000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3d_1p8: ldo3 {
> +                       regulator-name =3D "vreg_l3d_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-3 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "e";
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> +
> +               vreg_l2e_0p8: ldo2 {
> +                       regulator-name =3D "vreg_l2e_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <880000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3e_1p2: ldo3 {
> +                       regulator-name =3D "vreg_l3e_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-4 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "f";
> +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +
> +               vreg_s1f_0p7: smps1 {
> +                       regulator-name =3D "vreg_s1f_0p7";
> +                       regulator-min-microvolt =3D <700000>;
> +                       regulator-max-microvolt =3D <1100000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-6 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "i";
> +               vdd-l1-supply =3D <&vreg_s4c_1p8>;
> +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +               vdd-s2-supply =3D <&vph_pwr>;
> +
> +               vreg_s1i_0p9: smps1 {
> +                       regulator-name =3D "vreg_s1i_0p9";
> +                       regulator-min-microvolt =3D <900000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_s2i_1p0: smps2 {
> +                       regulator-name =3D "vreg_s2i_1p0";
> +                       regulator-min-microvolt =3D <1000000>;
> +                       regulator-max-microvolt =3D <1100000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l1i_1p8: ldo1 {
> +                       regulator-name =3D "vreg_l1i_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2i_1p2: ldo2 {
> +                       regulator-name =3D "vreg_l2i_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3i_0p8: ldo3 {
> +                       regulator-name =3D "vreg_l3i_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <880000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-7 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "j";
> +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l2-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +               vdd-s5-supply =3D <&vph_pwr>;
> +
> +               vreg_s5j_1p2: smps5 {
> +                       regulator-name =3D "vreg_s5j_1p2";
> +                       regulator-min-microvolt =3D <1256000>;
> +                       regulator-max-microvolt =3D <1304000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l1j_0p9: ldo1 {
> +                       regulator-name =3D "vreg_l1j_0p9";
> +                       regulator-min-microvolt =3D <912000>;
> +                       regulator-max-microvolt =3D <912000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2j_1p2: ldo2 {
> +                       regulator-name =3D "vreg_l2j_1p2";
> +                       regulator-min-microvolt =3D <1256000>;
> +                       regulator-max-microvolt =3D <1256000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3j_0p8: ldo3 {
> +                       regulator-name =3D "vreg_l3j_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <880000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +};
> +
> +&pcie4 {
> +       perst-gpios =3D <&tlmm 146 GPIO_ACTIVE_LOW>;
> +       wake-gpios =3D <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +       pinctrl-0 =3D <&pcie4_default>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +};
> +
> +&pcie4_phy {
> +       vdda-phy-supply =3D <&vreg_l3i_0p8>;
> +       vdda-pll-supply =3D <&vreg_l3e_1p2>;
> +
> +       status =3D "okay";
> +};
> +
> +&pcie6a {
> +       perst-gpios =3D <&tlmm 152 GPIO_ACTIVE_LOW>;
> +       wake-gpios =3D <&tlmm 154 GPIO_ACTIVE_LOW>;
> +
> +       vddpe-3v3-supply =3D <&vreg_nvme>;
> +
> +       pinctrl-0 =3D <&pcie6a_default>;
> +       pinctrl-names =3D "default";
> +
> +       status =3D "okay";
> +};
> +
> +&pcie6a_phy {
> +       vdda-phy-supply =3D <&vreg_l1d_0p8>;
> +       vdda-pll-supply =3D <&vreg_l2j_1p2>;
> +
> +       status =3D "okay";
> +};
> +
> +&qupv3_0 {
> +       status =3D "okay";
> +};
> +
> +&qupv3_1 {
> +       status =3D "okay";
> +};
> +
> +&qupv3_2 {
> +       status =3D "okay";
> +};
> +
> +&remoteproc_adsp {
> +       firmware-name =3D "qcom/x1e80100/dell/tributo/qcadsp8380.mbn",
> +                                       "qcom/x1e80100/dell/tributo/adsp_=
dtbs.elf";
> +
> +       status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +       firmware-name =3D "qcom/x1e80100/dell/tributo/qccdsp8380.mbn",
> +                                       "qcom/x1e80100/dell/tributo/cdsp_=
dtbs.elf";
> +
> +       status =3D "okay";
> +};
> +
> +&gpu {
> +       status =3D "okay";
> +
> +       zap-shader {
> +               firmware-name =3D "qcom/x1e80100/dell/tributo/qcdxkmsuc83=
80.mbn";
> +       };
> +};
> +
> +&mdss {
> +       status =3D "okay";
> +};
> +
> +&mdss_dp3 {
> +       compatible =3D "qcom,x1e80100-dp";
> +       /delete-property/ #sound-dai-cells;
> +
> +       status =3D "okay";
> +
> +       aux-bus {
> +               panel {
> +                       /* 1920x1200 IPS panel is SHP1593, PNP09FF compat=
ible */
> +                       compatible =3D "edp-panel";
> +                       power-supply =3D <&vreg_edp_3p3>;
> +
> +                       port {
> +                               edp_panel_in: endpoint {
> +                                       remote-endpoint =3D <&mdss_dp3_ou=
t>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port@1 {
> +                       reg =3D <1>;
> +
> +                       mdss_dp3_out: endpoint {
> +                               data-lanes =3D <0 1 2 3>;
> +                               link-frequencies =3D /bits/ 64 <162000000=
0 2700000000 5400000000 8100000000>;
> +
> +                               remote-endpoint =3D <&edp_panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_dp3_phy {
> +       vdda-phy-supply =3D <&vreg_l3j_0p8>;
> +       vdda-pll-supply =3D <&vreg_l2j_1p2>;
> +
> +       status =3D "okay";
> +};
> +
> +&i2c0 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +       keyboard@5 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x5>;
> +
> +               hid-descr-addr =3D <0x20>;
> +               interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&kybd_default>;
> +               pinctrl-names =3D "default";
> +
> +               wakeup-source;
> +       };
> +};
> +
> +&i2c3 {
> +       clock-frequency =3D <400000>;
> +       status =3D "disabled";
> +       /* PS8830 Retimer @0x8 */
> +       /* Unknown device @0x9 */
> +};
> +
> +&i2c5 {
> +       clock-frequency =3D <100000>;
> +       status =3D "disabled";
> +       /* Unknown device @0x3b */
> +};
> +
> +&i2c7 {
> +       clock-frequency =3D <400000>;
> +       status =3D "disabled";
> +       /* PS8830 Retimer @0x8 */
> +       /* Unknown device @0x9 */
> +};
> +
> +&i2c8 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +
> +       touchscreen@0 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x0>;
> +
> +               hid-descr-addr =3D <0x1>;
> +               interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&ts0_default>;
> +               pinctrl-names =3D "default";
> +       };
> +};
> +
> +&i2c9 {
> +       clock-frequency =3D <400000>;
> +       status =3D "disabled";
> +       /* USB3 retimer device @0x4f */
> +};
> +
> +&i2c17 {
> +       clock-frequency =3D <400000>;
> +       status =3D "okay";
> +
> +       touchpad@2c {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x2c>;
> +
> +               hid-descr-addr =3D <0x20>;
> +               interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&tpad_default>;
> +               pinctrl-names =3D "default";
> +
> +               wakeup-source;
> +       };
> +};
> +
> +&smb2360_0_eusb2_repeater {
> +       vdd18-supply =3D <&vreg_l3d_1p8>;
> +       vdd3-supply =3D <&vreg_l2b_3p0>;
> +};
> +
> +&smb2360_1_eusb2_repeater {
> +       vdd18-supply =3D <&vreg_l3d_1p8>;
> +       vdd3-supply =3D <&vreg_l14b_3p0>;
> +};
> +
> +&tlmm {
> +       gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
> +                                                       <76 4>,  /* SPI19=
 (TZ Protected) */
> +                                                       <238 1>; /* UFS R=
eset */
> +
> +       edp_reg_en: edp-reg-en-state {
> +               pins =3D "gpio70";
> +               function =3D "gpio";
> +               drive-strength =3D <16>;
> +               bias-disable;
> +       };
> +
> +       kybd_default: kybd-default-state {
> +               pins =3D "gpio67";
> +               function =3D "gpio";
> +               bias-pull-up;
> +       };
> +
> +       nvme_reg_en: nvme-reg-en-state {
> +               pins =3D "gpio18";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       tpad_default: tpad-default-state {
> +               disable-pins {
> +                       pins =3D "gpio38";
> +                       function =3D "gpio";
> +                       output-high;
> +               };
> +
> +               int-n-pins {
> +                       pins =3D "gpio3";
> +                       function =3D "gpio";
> +                       bias-pull-up;
> +               };
> +
> +               reset-n-pins {
> +                       pins =3D "gpio52";
> +                       function =3D "gpio";
> +                       bias-disable;
> +               };
> +       };
> +
> +       ts0_default: ts0-default-state {
> +               disable-pins {
> +                       pins =3D "gpio75";
> +                       function =3D "gpio";
> +                       output-high;
> +               };
> +
> +               int-n-pins {
> +                       pins =3D "gpio51";
> +                       function =3D "gpio";
> +                       bias-pull-up;
> +               };
> +
> +               reset-n-pins {
> +                       /* Technically should be High-Z input */
> +                       pins =3D "gpio48";
> +                       function =3D "gpio";
> +                       output-low;
> +                       drive-strength =3D <2>;
> +               };
> +       };
> +
> +       hall_int_n_default: hall-int-n-state {
> +               pins =3D "gpio92";
> +               function =3D "gpio";
> +
> +               bias-disable;
> +       };
> +
> +       pcie4_default: pcie4-default-state {
> +               clkreq-n-pins {
> +                       pins =3D "gpio147";
> +                       function =3D "pcie4_clk";
> +                       drive-strength =3D <2>;
> +                       bias-pull-up;
> +               };
> +
> +               perst-n-pins {
> +                       pins =3D "gpio146";
> +                       function =3D "gpio";
> +                       drive-strength =3D <2>;
> +                       bias-disable;
> +               };
> +
> +               wake-n-pins {
> +                       pins =3D "gpio148";
> +                       function =3D "gpio";
> +                       drive-strength =3D <2>;
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       pcie6a_default: pcie6a-default-state {
> +               clkreq-n-pins {
> +                       pins =3D "gpio153";
> +                       function =3D "pcie6a_clk";
> +                       drive-strength =3D <2>;
> +                       bias-pull-up;
> +               };
> +
> +               perst-n-pins {
> +                       pins =3D "gpio152";
> +                       function =3D "gpio";
> +                       drive-strength =3D <2>;
> +                       bias-disable;
> +               };
> +
> +               wake-n-pins {
> +                       pins =3D "gpio154";
> +                       function =3D "gpio";
> +                       drive-strength =3D <2>;
> +                       bias-pull-up;
> +               };
> +       };
> +
> +       cam_indicator_en: cam-indicator-en-state {
> +               pins =3D "gpio110";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +};
> +
> +&uart21 {
> +       compatible =3D "qcom,geni-debug-uart";
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0_hsphy {
> +       vdd-supply =3D <&vreg_l3j_0p8>;
> +       vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +       phys =3D <&smb2360_0_eusb2_repeater>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +       vdda-pll-supply =3D <&vreg_l1j_0p9>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0 {
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +       dr_mode =3D "host";
> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +       remote-endpoint =3D <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +       remote-endpoint =3D <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1_hsphy {
> +       vdd-supply =3D <&vreg_l3j_0p8>;
> +       vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +       phys =3D <&smb2360_1_eusb2_repeater>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +       vdda-pll-supply =3D <&vreg_l2d_0p9>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss1 {
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +       dr_mode =3D "host";
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +       remote-endpoint =3D <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +       remote-endpoint =3D <&pmic_glink_ss1_ss_in>;
> +};
> --
> 2.43.0
>
>


Return-Path: <linux-arm-msm+bounces-25200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500092684E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 20:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A0BC28AB28
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 18:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96249188CDB;
	Wed,  3 Jul 2024 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeEqiD0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB8181D0A;
	Wed,  3 Jul 2024 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720031611; cv=none; b=Pdk8MPsDa+EVh2oCyMUKiwMsDhXm4jFPJvdSh+yBzD/pldXjndwZnZV/dNiITRC8zgwYjFiLPqYxEEyrl12Wa2pMhGZCDO9tdiyQShBN1Kp01yQyAfjn3OZ6tpnsMdW5WPpXnRubOtNrs+aDe+wcIyRS+f/AqMzATuqkOeEaIpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720031611; c=relaxed/simple;
	bh=7V2JYzdOgXCXWFvoec8QR0Dd52ycphBn8B/DQ8YlItU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4DCMhhOm96GghJvqRIDLKUZaHty/WeehGqfkY7Q6ZwKjzXFM6Jf0OH+0ntT7tdtMaodc2BwnoyjrJCFwRzb+UNEo10KpG+rrBUpL1luCJlfNpixU7uPT1A0yB1OVMZRQAxeUhYFZ0+ZlT2vjEo/rTZkT+lpKL2iRtuAMUNrdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeEqiD0S; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so3259127a12.3;
        Wed, 03 Jul 2024 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720031607; x=1720636407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74i/qs7HRg9Ac07FIGM0Yw+2dhzQz8v4gQYVdVsl0WU=;
        b=NeEqiD0SvTiB6LUaLlKojdWOHvLHKRL5AHX87p2KX7OeAZFbxZtei8/zqYKhzsW6kA
         GFtUb2VPD7itzm1Yw7pMcOaAPOpvxBNPZMU4zEqVHsZKUh7m3vz2nwf5/meuen3upnOd
         eNWBDf9htbwvXeSnHaNjsbaT0sjarr/K/BB/xnykMjVbkPeKCBWeNyii6gjWpbHB8Nks
         JDos+CyCutLcIKuoe4bT1tQpWRynvTrYmSgKhO9V8XQbp1hOF2iPt7KRaoLksXzxrzry
         qMfv+NpP3swso9lg8NTjk+T46m5aP2f5BDoNFRVSh/ZfabKD4KJ7ByKaMuYIhQEAbFWH
         oNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720031607; x=1720636407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74i/qs7HRg9Ac07FIGM0Yw+2dhzQz8v4gQYVdVsl0WU=;
        b=Cq3ngruRTZ/dNX2uY39KlfEkg68i5mCP9h+zHI/88AVI6qaRj3GQOBbCrCWf019YZw
         lACe1h/OioCB3gYQ3OvPdeh3P+Iox5EnuLWYxdRofQBRs39vTcskMZ38J2fjIls9Mjpt
         NzFGYNY0r5X99UKQsBbVmNQMIuqIoE3m8eymyMAGjVQcHnJu7S9o9HBdlSNthPSja/Fe
         vlmZzJlDGY3Rl2Dmx8jx8l1t8BcXrwmZczNpP9NB/PNs0rFA9ChC+p6MwevyrfQ/hZDy
         Yv7Qd95kVauzUINJAsminH1n6OeCa/6D78q/JPYut7PidNKVYs3qC+YFGC9E66+2w26V
         2uJg==
X-Forwarded-Encrypted: i=1; AJvYcCX8F94bHbVtveWT3p6Mv/61Rp5uD4JzZVCrif3t/TkCu3rHx1eGZitFQ8VJrCMzpu63PflpeVjAsnQEQGcfkrR9aBgYlxv53eAdxGBmicPIaAOvTbMutT4xQz9lJk9u4seXPNQMBxTQtW98QPQgyhQKIGaqMZw/KDhVOXizOaAXMktUObv+1Y0=
X-Gm-Message-State: AOJu0Yzw9hxvfxTJ93APRkhnsw49Tr2gCgnV0U7x9juJZhzo2tXj0Tgr
	B8rgFC7PaNZz3X/y2fkxnHZTXO5juLcJXLtPNxwFDnVTyo9tNtPOy5YEFUjTK+xtmuQTnjPmPT8
	UW1YEjpARAmY3uLiT1DMV0u6jNjcI0RdE
X-Google-Smtp-Source: AGHT+IHT55zfRgWtk7mvtJmH4z1Zjwhpg0NjoO+gMZR8BWd/uCYfJBULnKS0wY4iLJBk5p9/CmLuDZ6QZTLN1IeJYzk=
X-Received: by 2002:a05:6402:5cd:b0:583:a39e:f469 with SMTP id
 4fb4d7f45d1cf-5879f1c2589mr8245048a12.17.1720031606917; Wed, 03 Jul 2024
 11:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703-yoga-slim7x-v1-0-7aa4fd5fdece@linaro.org> <20240703-yoga-slim7x-v1-2-7aa4fd5fdece@linaro.org>
In-Reply-To: <20240703-yoga-slim7x-v1-2-7aa4fd5fdece@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jul 2024 11:33:14 -0700
Message-ID: <CAF6AEGt+3LFP+GCcSwiSEymixVVkYD98iJX5RJ75NQDzZbPpcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga
 slim 7x devicetree
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 10:17=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Add an initial devicetree for the Lenovo Yoga slim 7x with support for
> Display, usb, keyboard, touchscreen, PMICs, speaker audio, gpu, NVMe,
> and remoteprocs.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 910 +++++++++++++++=
++++++
>  2 files changed, 911 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index e0babd642fa8..d7de2aea4748 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -261,4 +261,5 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-crd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-lenovo-yoga-slim7x.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D x1e80100-qcp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> new file mode 100644
> index 000000000000..1d00119691bc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -0,0 +1,910 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserv=
ed.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +
> +/ {
> +       model =3D "Lenovo Yoga Slim 7x";
> +       compatible =3D "lenovo,yoga-slim7x", "qcom,x1e80100";
> +
> +       pmic-glink {
> +               compatible =3D "qcom,x1e80100-pmic-glink",
> +                            "qcom,sm8550-pmic-glink",
> +                            "qcom,pmic-glink";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               orientation-gpios =3D <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +                                   <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +                                   <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +               /* Left-side rear port */
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
> +               /* Left-side front port */
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
> +
> +               /* Right-side port */
> +               connector@2 {
> +                       compatible =3D "usb-c-connector";
> +                       reg =3D <2>;
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
> +                                       pmic_glink_ss2_hs_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss2_dwc3_hs>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +
> +                                       pmic_glink_ss2_ss_in: endpoint {
> +                                               remote-endpoint =3D <&usb=
_1_ss2_qmpphy_out>;
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
> +       sound {
> +               compatible =3D "qcom,x1e80100-sndcard";
> +               model =3D "X1E80100-LENOVO-Yoga-Slim7x";
> +               audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +                               "TwitterLeft IN", "WSA WSA_SPK2 OUT",
> +                               "WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +                               "TwitterRight IN", "WSA2 WSA_SPK2 OUT";
> +
> +               wsa-dai-link {
> +                       link-name =3D "WSA Playback";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6apmbedai WSA_CODEC_DMA_=
RX_0>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&left_woofer>, <&left_twee=
ter>,
> +                                           <&swr0 0>, <&lpass_wsamacro 0=
>,
> +                                           <&right_woofer>, <&right_twee=
ter>,
> +                                           <&swr3 0>, <&lpass_wsa2macro =
0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6apm>;
> +                       };
> +               };
> +
> +               va-dai-link {
> +                       link-name =3D "VA Capture";
> +
> +                       cpu {
> +                               sound-dai =3D <&q6apmbedai VA_CODEC_DMA_T=
X_0>;
> +                       };
> +
> +                       codec {
> +                               sound-dai =3D <&lpass_vamacro 0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai =3D <&q6apm>;
> +                       };
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
> +               regulator-always-on;
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
> +
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
> +               vreg_l1b_1p8: ldo1 {
> +                       regulator-name =3D "vreg_l1b_1p8";
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2b_3p0: ldo2 {
> +                       regulator-name =3D "vreg_l2b_3p0";
> +                       regulator-min-microvolt =3D <3072000>;
> +                       regulator-max-microvolt =3D <3100000>;
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
> +               vreg_l12b_1p2: ldo12 {
> +                       regulator-name =3D "vreg_l12b_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
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
> +       };
> +
> +       regulators-1 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "c";
> +
> +               vdd-l1-supply =3D <&vreg_s5j_1p2>;
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s1f_0p7>;
> +               vdd-s4-supply =3D <&vph_pwr>;
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
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3c_0p8: ldo3 {
> +                       regulator-name =3D "vreg_l3c_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-2 {
> +               compatible =3D "qcom,pmc8380-rpmh-regulators";
> +               qcom,pmic-id =3D "d";
> +
> +               vdd-l1-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s4c_1p8>;
> +               vdd-s1-supply =3D <&vph_pwr>;
> +
> +               vreg_l1d_0p8: ldo1 {
> +                       regulator-name =3D "vreg_l1d_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2d_0p9: ldo2 {
> +                       regulator-name =3D "vreg_l2d_0p9";
> +                       regulator-min-microvolt =3D <912000>;
> +                       regulator-max-microvolt =3D <920000>;
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
> +
> +               vdd-l2-supply =3D <&vreg_s1f_0p7>;
> +               vdd-l3-supply =3D <&vreg_s5j_1p2>;
> +
> +               vreg_l2e_0p8: ldo2 {
> +                       regulator-name =3D "vreg_l2e_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
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
> +
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
> +
> +               vreg_l1f_1p0: ldo1 {
> +                       regulator-name =3D "vreg_l1f_1p0";
> +                       regulator-min-microvolt =3D <1024000>;
> +                       regulator-max-microvolt =3D <1024000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2f_1p0: ldo2 {
> +                       regulator-name =3D "vreg_l2f_1p0";
> +                       regulator-min-microvolt =3D <1024000>;
> +                       regulator-max-microvolt =3D <1024000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3f_1p0: ldo3 {
> +                       regulator-name =3D "vreg_l3f_1p0";
> +                       regulator-min-microvolt =3D <1024000>;
> +                       regulator-max-microvolt =3D <1024000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-6 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "i";
> +
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
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +
> +       regulators-7 {
> +               compatible =3D "qcom,pm8550ve-rpmh-regulators";
> +               qcom,pmic-id =3D "j";
> +
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
> +               vreg_l1j_0p8: ldo1 {
> +                       regulator-name =3D "vreg_l1j_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l2j_1p2: ldo2 {
> +                       regulator-name =3D "vreg_l2j_1p2";
> +                       regulator-min-microvolt =3D <1200000>;
> +                       regulator-max-microvolt =3D <1200000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +
> +               vreg_l3j_0p8: ldo3 {
> +                       regulator-name =3D "vreg_l3j_0p8";
> +                       regulator-min-microvolt =3D <880000>;
> +                       regulator-max-microvolt =3D <920000>;
> +                       regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
> +               };
> +       };
> +};
> +
> +&gpu {
> +       status =3D "okay";
> +
> +       zap-shader {
> +               firmware-name =3D "qcom/x1e80100/LENOVO/14Q8X9/qcdxkmsuc8=
380.mbn";

I ended up with:

  firmware-name =3D "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";

my DMI string is:

  DMI: LENOVO 83ED/LNVNB161216, BIOS NHCN36WW 05/23/2024

idk if that is different for you?

> +       };
> +};
> +
> +&i2c0 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +

I also have this, which is working for me (sry about gmail butchering
the formating):


touchpad@2c {
compatible =3D "hid-over-i2c";
reg =3D <0x2c>;

hid-descr-addr =3D <0x20>;
interrupts-extended =3D <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;

pinctrl-0 =3D <&tpad_default>;
pinctrl-names =3D "default";

wakeup-source;
};

basically just uncommented the node from Xilin's tree, but seems to work fi=
ne.

BR,
-R

> +       keyboard@3a {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x3a>;
> +
> +               hid-descr-addr =3D <0x1>;
> +               interrupts-extended =3D <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&kybd_default>;
> +               pinctrl-names =3D "default";
> +
> +               wakeup-source;
> +       };
> +};
> +
> +&i2c8 {
> +       clock-frequency =3D <400000>;
> +
> +       status =3D "okay";
> +
> +       touchscreen@14 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x14>;
> +
> +               hid-descr-addr =3D <0x1>;
> +               interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +               pinctrl-0 =3D <&ts0_default>;
> +               pinctrl-names =3D "default";
> +       };
> +};
> +
> +&lpass_tlmm {
> +       spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +               pins =3D "gpio12";
> +               function =3D "gpio";
> +               drive-strength =3D <16>;
> +               bias-disable;
> +               output-low;
> +       };
> +
> +       spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +               pins =3D "gpio13";
> +               function =3D "gpio";
> +               drive-strength =3D <16>;
> +               bias-disable;
> +               output-low;
> +       };
> +};
> +
> +&lpass_vamacro {
> +       pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +       pinctrl-names =3D "default";
> +
> +       vdd-micb-supply =3D <&vreg_l1b_1p8>;
> +       qcom,dmic-sample-rate =3D <4800000>;
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
> +&pcie4 {
> +       status =3D "okay";
> +};
> +
> +&pcie4_phy {
> +       vdda-phy-supply =3D <&vreg_l3j_0p8>;
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
> +       firmware-name =3D "qcom/x1e80100/LENOVO/14Q8X9/qcadsp8380.mbn",
> +                       "qcom/x1e80100/LENOVO/14Q8X9/adsp_dtbs.elf";
> +       status =3D "okay";
> +};
> +
> +&remoteproc_cdsp {
> +       firmware-name =3D "qcom/x1e80100/LENOVO/14Q8X9/qccdsp8380.mbn",
> +                       "qcom/x1e80100/LENOVO/14Q8X9/cdsp_dtbs.elf";
> +
> +       status =3D "okay";
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
> +&smb2360_2_eusb2_repeater {
> +       vdd18-supply =3D <&vreg_l3d_1p8>;
> +       vdd3-supply =3D <&vreg_l8b_3p0>;
> +};
> +
> +&swr0 {
> +       status =3D "okay";
> +
> +       pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +       pinctrl-names =3D "default";
> +
> +       /* WSA8845, Left Woofer */
> +       left_woofer: speaker@0,0 {
> +               compatible =3D "sdw20217020400";
> +               reg =3D <0 0>;
> +               reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells =3D <0>;
> +               sound-name-prefix =3D "WooferLeft";
> +               vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +               vdd-io-supply =3D <&vreg_l12b_1p2>;
> +               qcom,port-mapping =3D <1 2 3 7 10 13>;
> +       };
> +
> +       /* WSA8845, Left Tweeter */
> +       left_tweeter: speaker@0,1 {
> +               compatible =3D "sdw20217020400";
> +               reg =3D <0 1>;
> +               reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells =3D <0>;
> +               sound-name-prefix =3D "TwitterLeft";
> +               vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +               vdd-io-supply =3D <&vreg_l12b_1p2>;
> +               qcom,port-mapping =3D <4 5 6 7 11 13>;
> +       };
> +};
> +
> +
> +&swr3 {
> +       status =3D "okay";
> +
> +       pinctrl-0 =3D <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
> +       pinctrl-names =3D "default";
> +
> +       /* WSA8845, Right Woofer */
> +       right_woofer: speaker@0,0 {
> +               compatible =3D "sdw20217020400";
> +               reg =3D <0 0>;
> +               reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells =3D <0>;
> +               sound-name-prefix =3D "WooferRight";
> +               vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +               vdd-io-supply =3D <&vreg_l12b_1p2>;
> +               qcom,port-mapping =3D <1 2 3 7 10 13>;
> +       };
> +
> +       /* WSA8845, Right Tweeter */
> +       right_tweeter: speaker@0,1 {
> +               compatible =3D "sdw20217020400";
> +               reg =3D <0 1>;
> +               reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells =3D <0>;
> +               sound-name-prefix =3D "TwitterRight";
> +               vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +               vdd-io-supply =3D <&vreg_l12b_1p2>;
> +               qcom,port-mapping =3D <4 5 6 7 11 13>;
> +       };
> +};
> +
> +&tlmm {
> +       gpio-reserved-ranges =3D <34 2>, /* Unused */
> +                              <44 4>, /* SPI (TPM) */
> +                              <238 1>; /* UFS Reset */
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
> +               bias-disable;
> +       };
> +
> +       nvme_reg_en: nvme-reg-en-state {
> +               pins =3D "gpio18";
> +               function =3D "gpio";
> +               drive-strength =3D <2>;
> +               bias-disable;
> +       };
> +
> +       pcie6a_default: pcie2a-default-state {
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
> +                       bias-pull-down;
> +               };
> +
> +               wake-n-pins {
> +                      pins =3D "gpio154";
> +                      function =3D "gpio";
> +                      drive-strength =3D <2>;
> +                      bias-pull-up;
> +              };
> +       };
> +
> +       ts0_default: ts0-default-state {
> +               int-n-pins {
> +                       pins =3D "gpio51";
> +                       function =3D "gpio";
> +                       bias-disable;
> +               };
> +
> +               reset-n-pins {
> +                       pins =3D "gpio48";
> +                       function =3D "gpio";
> +                       output-high;
> +                       drive-strength =3D <16>;
> +               };
> +       };
> +
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
> +       vdda-pll-supply =3D <&vreg_l1j_0p8>;
> +
> +       orientation-switch;
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
> +       orientation-switch;
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
> +
> +&usb_1_ss2_hsphy {
> +       vdd-supply =3D <&vreg_l3j_0p8>;
> +       vdda12-supply =3D <&vreg_l2j_1p2>;
> +
> +       phys =3D <&smb2360_2_eusb2_repeater>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss2_qmpphy {
> +       vdda-phy-supply =3D <&vreg_l3e_1p2>;
> +       vdda-pll-supply =3D <&vreg_l2d_0p9>;
> +
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss2 {
> +       status =3D "okay";
> +};
> +
> +&usb_1_ss2_dwc3 {
> +       dr_mode =3D "host";
> +};
> +
> +&usb_1_ss2_dwc3_hs {
> +       remote-endpoint =3D <&pmic_glink_ss2_hs_in>;
> +};
> +
> +&usb_1_ss2_qmpphy_out {
> +       remote-endpoint =3D <&pmic_glink_ss2_ss_in>;
> +};
>
> --
> 2.25.1
>
>


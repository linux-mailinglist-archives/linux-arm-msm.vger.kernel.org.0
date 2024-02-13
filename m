Return-Path: <linux-arm-msm+bounces-10851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597F852E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 11:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356401C22A21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 10:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7BC2BD1F;
	Tue, 13 Feb 2024 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wwVM7OX1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB62BD00
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821649; cv=none; b=YqLB8Eavuleqk3Ulu5BBey6ewFkcQLRXPkU4N/FjEH+JySKWzO9pYWAJ87HM6qO+IrQllW1olIEP5vWfKcFWhYQkLz6M81EA3kcBToMQJ30X8pNIuSsNEueF1KZj6H/XTwjatU5sRz+evHsoplit/d4APJwGfTuaEpCqoqLQthY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821649; c=relaxed/simple;
	bh=zIILUVITRYsRVIoakXIdWqn4esADPrLTftPfvi8YhQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eT5+D+0t2RwY3GnApzS1dcz7S9tZssaAkN+qvCbVSDY8LFY8Q4/R9uNNo+cceUjpBtkLyaRk4fuQ8sNuCsRA+8xsyiLieiRqP5NJUmYq+8Io2oY3pdAdPkOoehRV6lGzi061wzZOX4B4cRRN+CmL+ybGsoNoQfassYKdnOdX59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wwVM7OX1; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so1106932276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 02:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707821647; x=1708426447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=62wygMyBdeSVpMuQ3wI8n4MfTzhln2PY4S7FohPAHFs=;
        b=wwVM7OX1662vOFflvsrw3L4B+DkQNAK5H9GBP75piM9/sXk1mNG2AGKjikG6KWlWyR
         daFXPXVPJrsb0MjCiFSfGBQ+TM+0LhctMxzjbjCPuBt2yCoSMDFfB7lFXHgmJOJWQEMZ
         0MQq4quYJIVjc3MPdmx0tjufLfXQtSRtOtTclgyMpXaqAwVXpo5k9/zDgfG2yg4Y9mE7
         RIL0WrrIh/PleJEmRRWKXWvCtBN0JmSHmeGnMud5mrinTGHJ8FSNWBEkUBl1BJbvQTj7
         5ILypmOecVL7bByks26QOIaJ3uWWVDX6RiG8fCGCChsycutOAZDkUXKLPyuYviQO+u7k
         GvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707821647; x=1708426447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62wygMyBdeSVpMuQ3wI8n4MfTzhln2PY4S7FohPAHFs=;
        b=MEbSi0o2e+oMtOUlk+XkuYp4NN0s7gysKmGEeMF6nXacxwbcM8FFO/saf9p3/jSMX8
         +L5A5W+fcU4G5WsmkK+eBrRjmFJrsqZyYtJIOkP1/LF/5zA8DakPhZZo7X1GultDWeKs
         7WhJa5FE/SfC9eJ+dyaDZdVUz8YoB3hVzr2KoGGG54c4SE0fAJrkTXZjhzgN/T0v3OJW
         Zzy2MYT0okHqJhGoGfj5TWQGg4zeX5yaMSf/+IucVpHg/8ZJvpwpZVtTRM7G9aR/3Dxo
         NfKgISdja1b1F+ZwQCXm7a3hylxKZuG0WWDQ85PxdW8W8jp4zOuRgHLC3SrLQ1jMxf97
         Wihw==
X-Forwarded-Encrypted: i=1; AJvYcCW88b6LAjf9+3Zb/oraWcal8UfodV2j4FezpYcUF2ZTooW6DNunGxETDwULMV4dBx7RjqVmED0jbvWnGEYSZFpsCFRk3q2qKXdS1Yg4uQ==
X-Gm-Message-State: AOJu0YyFRKnGYTayGhcYcsW6L9L+dnZumHk4MEgFxiv8+fCjym2WeAP6
	oLAvIYY7gSO4+LuBQ0EJJVRrnyTrgeElVv9aVf4Fqihdp1yxlwqUEC9KmyCKAHNVZeV3FwPO2Nx
	qV/EUqM3INoPYLwpoZBGKsLOldNu8J1AlGDiThw==
X-Google-Smtp-Source: AGHT+IGLUVGIHY81Tcp0bv2vTSWijZVfrPPjlMaVyZ75RYgEoRCw78YWDpdzbiB2KYKdDN525kZxCQzSFmKzTrLQJyw=
X-Received: by 2002:a05:6902:542:b0:dc6:6307:d188 with SMTP id
 z2-20020a056902054200b00dc66307d188mr7487929ybs.25.1707821646726; Tue, 13 Feb
 2024 02:54:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213104754.8195-1-quic_riteshk@quicinc.com> <20240213104754.8195-3-quic_riteshk@quicinc.com>
In-Reply-To: <20240213104754.8195-3-quic_riteshk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 13 Feb 2024 12:53:55 +0200
Message-ID: <CAA8EJprztE0Cwc=+vxxXk=wKmyMU_TCtLPcY29RHO4-+nWFQEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcm6490-idp: add display and panel
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com, 
	geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org, 
	nfraprado@collabora.com, m.szyprowski@samsung.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, 
	quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Feb 2024 at 12:48, Ritesh Kumar <quic_riteshk@quicinc.com> wrote:
>
> Enable Display Subsystem with Novatek NT36672E Panel
> on qcm6490 idp platform.
>
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
>
> ---
> v2: Fixed review comments from Dmitry and Konrad
>       - moved pinctrl-names after pinctrl-0 property.
>       - removed gpu disablement change after validating gpu.
>     Rebased the patch
>       - rebased the patch to resolve conflicts.
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 92 ++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 502a5a383bde..0054b2a8d6c7 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -10,6 +10,7 @@
>  #define PM7250B_SID1 9
>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7280.dtsi"
>  #include "pm7250b.dtsi"
> @@ -39,6 +40,25 @@
>                 stdout-path = "serial0:115200n8";
>         };
>
> +       lcd_disp_bias: lcd-disp-bias-regulator {

regualtor-lcd-disp-bias, please. This will allow grouping regulators together.

> +               compatible = "regulator-fixed";
> +               regulator-name = "lcd_disp_bias";
> +               regulator-min-microvolt = <5500000>;
> +               regulator-max-microvolt = <5500000>;
> +               gpio = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +               pinctrl-0 = <&lcd_disp_bias_en>;
> +               pinctrl-names = "default";
> +       };
> +
> +       pm8350c_pwm_backlight: backlight {

This node isn't in the sort order.

> +               compatible = "pwm-backlight";
> +               pwms = <&pm8350c_pwm 3 65535>;
> +               enable-gpios = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +               pinctrl-0 = <&pmic_lcd_bl_en>;
> +               pinctrl-names = "default";
> +       };
> +
>         reserved-memory {
>                 xbl_mem: xbl@80700000 {
>                         reg = <0x0 0x80700000 0x0 0x100000>;
> @@ -421,7 +441,79 @@
>         };
>  };
>
> +&mdss {
> +       status = "okay";
> +};
> +
> +&mdss_dsi {
> +       vdda-supply = <&vreg_l6b_1p2>;
> +       status = "okay";
> +
> +       panel@0 {
> +               compatible = "novatek,nt36672e";
> +               reg = <0>;
> +
> +               reset-gpios = <&tlmm 44 GPIO_ACTIVE_HIGH>;
> +
> +               vddi-supply = <&vreg_l8c_1p62>;
> +               avdd-supply = <&lcd_disp_bias>;
> +               avee-supply = <&lcd_disp_bias>;
> +
> +               backlight = <&pm8350c_pwm_backlight>;
> +
> +               port {
> +                       panel0_in: endpoint {
> +                               remote-endpoint = <&mdss_dsi0_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mdss_dsi0_out {
> +       remote-endpoint = <&panel0_in>;
> +       data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi_phy {
> +       vdds-supply = <&vreg_l10c_0p88>;
> +       status = "okay";
> +};
> +
> +&pm7250b_gpios {
> +       lcd_disp_bias_en: lcd-disp-bias-en-state {
> +               pins = "gpio2";
> +               function = "func1";
> +               bias-disable;
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +               input-disable;
> +               output-enable;
> +               power-source = <0>;
> +       };
> +};
> +
> +&pm8350c_gpios {
> +       pmic_lcd_bl_en: pmic-lcd-bl-en-state {
> +               pins = "gpio7";
> +               function = "normal";
> +               bias-disable;
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +               output-low;
> +               power-source = <0>;
> +       };
> +
> +       pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
> +               pins = "gpio8";
> +               function = "func1";
> +               bias-disable;
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +               output-low;
> +               power-source = <0>;
> +       };
> +};
> +
>  &pm8350c_pwm {
> +       pinctrl-0 = <&pmic_lcd_bl_pwm>;
> +       pinctrl-names = "default";
>         status = "okay";
>
>         multi-led {
> --
> 2.17.1
>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-51972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 681A0A6927D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F15D1B864DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9424715ECD7;
	Wed, 19 Mar 2025 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtUkGX/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF411D90DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395581; cv=none; b=N5JhxbCoXTXeus7q4f9sVZCzBeW5f8/fHNdspI+6VCjssQcS1gOSg112V8HEuV36kDyF6RD7BppU7YEF8NGspnoq8KVvBceJ4chg1wU2dne1ZB6aoc2wDr0yjWkhcd9PLHLv/G3DUcQ9wmwComo19WSJtHywP+EIup8MUU3KBo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395581; c=relaxed/simple;
	bh=hBrOklqwgjHinnnfZuEdnIsi5aMBvh5YuwuDFUV6gtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEY2uKxSWwuhQgoJN7/Z0VhxplzNKcP5wfUM8rVn2rwGlfrCNef895PG+E/6l5CY0wzQWGnb0Qrw2aeHTibQRYc1qeN3aOOutQPMYtRnqzR3E/5pfeGgUQMYNcoJGogqPBiIiFxB1m0dAcouFB/BBw4wI3XpwnWlg8/jqzBlDsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YtUkGX/T; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so4521401f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 07:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742395578; x=1743000378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uY75c27hvYxi7T7rPerH8pZpgrDSKhbOeIOLlJdu6ao=;
        b=YtUkGX/TNoOVyZ+kX/yjkYiGTadATC8SMc8ZEJb3LX8kTfJRmxFUwoPPENWO+6XErW
         INWZ0CBUbTEHc/hM4KFT1iyDb/g0LxR+vJUmcjEDhkQrci+Ty6uVmMWdO7rPSv/OFAEh
         gUiNPWSifGU91nmNH6TNJw4hJsS/X+HyrK+JzrWL2jw+mHIzQYmEWN0ELAutXJmLIzf3
         qVxVS9f1eAiW8L/kNYH6GGQf4Hrvdb49cEdXDX5uGEi8RSH+IyuYU2vDnLbnvNPxVF+U
         QEeNyyL0k1xHe9kQqQ1SfgtOUuFA0H/e1MueKqwrIBFY5f9MIjE2jseevmb8HsethGEx
         rFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742395578; x=1743000378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uY75c27hvYxi7T7rPerH8pZpgrDSKhbOeIOLlJdu6ao=;
        b=TJHfW2wG3pGpOGXYkftghpdGNyQ/Js/K89KpGBeXh/hcGUmJ+zg8pLdHWHNX9jHuO7
         LdqsnopjSGYrqft2lPGE6caj16bI4H2M894SU8vgAJXhK2dC71LlGt8WO3Xl6pckviyT
         uEEhIiZxfu30DO89FINsMe/oA6+oAO86TmcGIMdMci1p+9pb413AwzFwQsIVIlQPckZ0
         XQ0tGHck/AOTq6baUH4iN+8syyZiM8dDQK2VMm8gDXqw11XdDoKPthbAkg06ZWRhAeNR
         s+lEh+ETCRM23QEd1m3RaGuah0g9sLgtISd+QM3RFEH/3sGGQR3BN8d1rcNCPs6evxxr
         ccTg==
X-Forwarded-Encrypted: i=1; AJvYcCWSwh9l6SzKIDlS2tBBFeZu1Ql2EnLxXht0UvWBAW311CmG+J1LoeEoYnsitQewAcwKogX4NBq96iv8Dra6@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkd+F87WUUystzB7/OM5GMIzvgWi9sMTqJ41qTFXlpoWpTqhf
	Lffo/t6kT7YIBAGvLbxypq8F7AtYacEDYrZqa95SL1HLYwrVILxETXXA6YReaxpzCQwxf4ttQmP
	fKiPYnyyPKWQpJut3hLnBH5U9Z57Ag8e5J0dz+YnJXmqV/D0Jwok=
X-Gm-Gg: ASbGncscZjQuoyo26ysmQ7cqhCbo4ptjTcIzllOfcyW3EJl2BC+rXS4cRwbutQ5Np45
	B1wnu2AjIUuXFU0w0HP/Bn6B73VprpHkHdbaQPo/OectzOapzTqXgGxI4mUU/qmh6XT8vtPm+VJ
	aoIfS0yITeaNZLAJk+Rj8bz9j6YfYyo5WVZ2PkzctxgjJCTIbHgSwjPVg5Vp8=
X-Google-Smtp-Source: AGHT+IH178JoZDnD1r/uZZTNtV44AHbXZSumbbPNh9ifglxv/RA9z44nfkfPlRV0a7wOqBb2k/i+fxeD0JSTTZ2gt7U=
X-Received: by 2002:a05:6000:1fa4:b0:38d:dd52:1b5d with SMTP id
 ffacd0b85a97d-399739b672cmr2622102f8f.4.1742395577593; Wed, 19 Mar 2025
 07:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319143613.11177-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20250319143613.11177-1-srinivas.kandagatla@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 19 Mar 2025 14:46:06 +0000
X-Gm-Features: AQ5f1Jo5Hyz1aVgEcpD9y-ij-3B4c4dSQqYaAguffMS6ILu1gyAfkCK2nZF0K4Y
Message-ID: <CACr-zFArEKi89Lj9iDR_Y3BKKLa=5FEnLMO36Z0MMAUSRAW7NA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-tuxedo-14: add sound support
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ggo@tuxedocomputers.com, ettore.chimenti@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Srini,

On Wed, 19 Mar 2025 at 14:43, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> This patch adds sound support for this platform,
> support includes
>         - 2x Speakers.
>         - 2x dmic
>         - Headset
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>
> This patch depends on
> "arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1" patch
>  https://lkml.org/lkml/2025/3/6/867
>
> ucm changes:
> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/x1e80100-tuxedo
>
> tplg changes:
> https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/tuxedo-elite-14

I think it'd be nice to create merge requests for these and include
those links in the cover letter, what do you think?

>
>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> index 86bdec4a2dd8..465221b8a3fa 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> @@ -20,6 +20,34 @@ aliases {
>                 serial0 = &uart21;
>         };
>
> +

There's an additional new line here ?

> +       wcd938x: audio-codec {
> +               compatible = "qcom,wcd9385-codec";
> +
> +               pinctrl-0 = <&wcd_default>;
> +               pinctrl-names = "default";
> +
> +               qcom,micbias1-microvolt = <1800000>;
> +               qcom,micbias2-microvolt = <1800000>;
> +               qcom,micbias3-microvolt = <1800000>;
> +               qcom,micbias4-microvolt = <1800000>;
> +               qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +               qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +               qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +               qcom,rx-device = <&wcd_rx>;
> +               qcom,tx-device = <&wcd_tx>;
> +
> +               reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
> +
> +               vdd-buck-supply = <&vreg_l15b_1p8>;
> +               vdd-rxtx-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l15b_1p8>;
> +               vdd-mic-bias-supply = <&vreg_bob1>;
> +
> +
> +               #sound-dai-cells = <1>;
> +       };
> +
>         chosen {
>                 stdout-path = "serial0:115200n8";
>         };
> @@ -129,6 +157,85 @@ vph_pwr: regulator-vph-pwr {
>                 regulator-always-on;
>                 regulator-boot-on;
>         };
> +
> +       sound {
> +               compatible = "qcom,x1e80100-sndcard";
> +               model = "X1E80100-TUXEDO-Elite-14";
> +               audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +                               "SpkrRight IN", "WSA WSA_SPK2 OUT",
> +                               "IN1_HPHL", "HPHL_OUT",
> +                               "IN2_HPHR", "HPHR_OUT",
> +                               "AMIC2", "MIC BIAS2",
> +                               "VA DMIC0", "MIC BIAS1",
> +                               "VA DMIC1", "MIC BIAS1",
> +                               "VA DMIC0", "VA MIC BIAS1",
> +                               "VA DMIC1", "VA MIC BIAS1",
> +                               "TX SWR_INPUT1", "ADC2_OUTPUT";
> +
> +               wcd-playback-dai-link {
> +                       link-name = "WCD Playback";
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +
> +               wcd-capture-dai-link {
> +                       link-name = "WCD Capture";
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +
> +               wsa-dai-link {
> +                       link-name = "WSA Playback";
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +
> +               va-dai-link {
> +                       link-name = "VA Capture";
> +
> +                       cpu {
> +                               sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +                       };
> +
> +                       codec {
> +                               sound-dai = <&lpass_vamacro 0>;
> +                       };
> +
> +                       platform {
> +                               sound-dai = <&q6apm>;
> +                       };
> +               };
> +       };
>  };
>
>  &apps_rsc {
> @@ -160,6 +267,13 @@ vreg_bob2: bob2 {
>                         regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>                 };
>
> +               vreg_l1b_1p8: ldo1 {
> +                       regulator-name = "vreg_l1b_1p8";
> +                       regulator-min-microvolt = <1800000>;
> +                       regulator-max-microvolt = <1800000>;
> +                       regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +               };
> +
>                 vreg_l2b_3p0: ldo2 {
>                         regulator-name = "vreg_l2b_3p0";
>                         regulator-min-microvolt = <3072000>;
> @@ -534,6 +648,24 @@ eusb6_repeater: redriver@4f {
>
>  };
>
> +&lpass_tlmm {
> +       spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +               pins = "gpio12";
> +               function = "gpio";
> +               drive-strength = <16>;
> +               bias-disable;
> +               output-low;
> +       };
> +};
> +
> +&lpass_vamacro {
> +       pinctrl-0 = <&dmic01_default>;
> +       pinctrl-names = "default";
> +
> +       vdd-micb-supply = <&vreg_l1b_1p8>;
> +       qcom,dmic-sample-rate = <4800000>;
> +};
> +
>  &mdss {
>         status = "okay";
>  };
> @@ -648,6 +780,64 @@ &smb2360_1 {
>         status = "okay";
>  };
>
> +&smb2360_1_eusb2_repeater {
> +       vdd18-supply = <&vreg_l3d_1p8>;
> +       vdd3-supply = <&vreg_l14b_3p0>;
> +};
> +
> +&swr0 {
> +       status = "okay";
> +
> +       pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +       pinctrl-names = "default";
> +
> +       /* WSA8845, Left Speaker */
> +       left_spkr: speaker@0,0 {
> +               compatible = "sdw20217020400";
> +               reg = <0 0>;
> +               reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells = <0>;
> +               sound-name-prefix = "SpkrLeft";
> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l12b_1p2>;
> +               qcom,port-mapping = <1 2 3 7 10 13>;
> +       };
> +
> +       /* WSA8845, Right Speaker */
> +       right_spkr: speaker@0,1 {
> +               compatible = "sdw20217020400";
> +               reg = <0 1>;
> +               reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +               #sound-dai-cells = <0>;
> +               sound-name-prefix = "SpkrRight";
> +               vdd-1p8-supply = <&vreg_l15b_1p8>;
> +               vdd-io-supply = <&vreg_l12b_1p2>;
> +               qcom,port-mapping = <4 5 6 7 11 13>;
> +       };
> +};
> +
> +&swr1 {
> +       status = "okay";
> +
> +       /* WCD9385 RX */
> +       wcd_rx: codec@0,4 {
> +               compatible = "sdw20217010d00";
> +               reg = <0 4>;
> +               qcom,rx-port-mapping = <1 2 3 4 5>;
> +       };
> +};
> +
> +&swr2 {
> +       status = "okay";
> +
> +       /* WCD9385 TX */
> +       wcd_tx: codec@0,3 {
> +               compatible = "sdw20217010d00";
> +               reg = <0 3>;
> +               qcom,tx-port-mapping = <2 2 3 4>;
> +       };
> +};
> +
>  &tlmm {
>         gpio-reserved-ranges = <28 4>, /* Unused */
>                                <44 4>, /* SPI (TPM) */
> --
> 2.39.5
>
>


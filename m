Return-Path: <linux-arm-msm+bounces-11443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3C8589CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 00:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A291C22441
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 23:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C038938DFE;
	Fri, 16 Feb 2024 23:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOXSXFWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC47B1487D7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 23:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708125013; cv=none; b=JmZLQ+OPXzkYmn0Ti4CQY6L/e/dsRPlI8y5IsEgP8nMeBvKMwAUmdlD1fbnCnon5bDQOFzbnNwBja+bLXl+64AtGb8dYUGPLfpiExmdtBQ0mE/79+eeLpw/FJgeDoVCzYnmFhAknCtHnxfY8nSiM/5Qhh1ukm07tySoOlj6liA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708125013; c=relaxed/simple;
	bh=mfmEA6zSa+OORWqKlFgSku5kK5nwRZdQXnKi8D/SPd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/Fwk23B/7cnwhSCXtErtOroFRgFtYc4Dy0XiuylCmYgRLylktLvL3EeVtHMSSO8ALWxdqkh4VojpiVsizT5LlLsvRb3ID4/taM/hNr8U1w4Fa4i0ki1KJ/tlZ1Pz0wV0aPVAI8pGLmcwkWXZmBZi4kLuOJikYLXcDulr+kpkHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOXSXFWr; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607f8482b88so11697677b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 15:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708125010; x=1708729810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EpftqacOdWcIxz3VUpc3zI1U/E0RwbiBZdYsX7Kb7J4=;
        b=AOXSXFWrpecqGsj3FvbdDQIjHjP887SkBI4Bl4qgqmEyp6wk619/ClmzdoNIeOtz1j
         tDFBRTTZ4BXijtr5HVAG7cqu0BwWijfc2LxgvgRliDfPlGHPIGKzJIhHQjwHJelHjVyQ
         rp/dpDg/lvX62bGEdspeYlpgcqI7rCHt98CpiYsWMLSCTyHysVsLgsH/Mi9PXkv8IZPW
         RnrDP9WUVm04kHfQ67x4VehA87dgAMMC2vEyqSy2YCDH6nUvxKMvEaFL93I/+w8AsTPZ
         1hRoKNSn/OHxCPYYv+J9IC1EJfc+1aBHZQcbLbRU6Wlr1XeozRteflUVXWLLrhaypy2B
         //xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708125010; x=1708729810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EpftqacOdWcIxz3VUpc3zI1U/E0RwbiBZdYsX7Kb7J4=;
        b=nknHxHXqMHE7Cy7l6T2243U9FCW3B6M4279Z5NJi8eAhT9Dz4mC7UXI2CIjwzQmFUc
         Q77iPfnqEvKkHCMpdgpMhcf1F6QOhOCukfe3RgN9AMtFt6bbUMSQWUrzEWy4GNjuzoHz
         crb8eZvptmxbjUp/ohaJnrSGRWENz4XJXt/ofr1JtnNbyvIqS5RZI/2oCXxJ9Nm6Zgdk
         HH1AL6Yb5MBQJjN9TSGZ0jsme1fsPmMM82lhfXreY8TSopw3/SS89GbR3CVghFP+m8Ju
         6uxVWyf5yUz8XNyzsZZIJTSF7JDRu9QSAyxByHSdSkHI3iuYIPAbrLvZ/9oIQcBh5G18
         fH5w==
X-Forwarded-Encrypted: i=1; AJvYcCVfQXBw4HhyjOdnqDXV/mC/23lG7ET/oQ/ynbuNTOIeVJYoHYao/H3H2VNc2pCC5O8VBru5Ui9UeQtJh0/AVu+DsCtlxZZ6uDi3fthZ1g==
X-Gm-Message-State: AOJu0YxiAHkp8HznlhNgWKofA/hWiBh4OEdUXyeGB+n+axZjQkd44PVN
	928EamFtCFMkZmpFRJhNO4cYH5IXJFvU0l7wgBVvvXk94FAJIUDIDizL43GV2VZWiZbvJN/oBZG
	y23vQKa63hqs3imnepiwqCg1uO2k75ZWVzQaaZA==
X-Google-Smtp-Source: AGHT+IH7vS67BhaJmZ0qKWVe6no0q/4H1vlJ1cE1CsXNcFt1Pp6VcJPBg/0mptzu0uQFXbGKADhe7nfa9TyYWhC6deg=
X-Received: by 2002:a0d:ebc6:0:b0:607:ec66:36b3 with SMTP id
 u189-20020a0debc6000000b00607ec6636b3mr5019006ywe.19.1708125010589; Fri, 16
 Feb 2024 15:10:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216203215.40870-1-brgl@bgdev.pl> <20240216203215.40870-9-brgl@bgdev.pl>
In-Reply-To: <20240216203215.40870-9-brgl@bgdev.pl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 01:09:59 +0200
Message-ID: <CAA8EJpry2yiGXrtPqZ6RXnoTqQZr_hxA_gCPsUbmyFtEBuD4VA@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] arm64: dts: qcom: sm8650-qrd: add the Wifi node
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Feb 2024 at 22:33, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Neil Armstrong <neil.armstrong@linaro.org>
>
> Describe the ath12k WLAN on-board the WCN7850 module present on the
> board.

WCN7850 is the same combo WiFi + BT chip. Is there any reason for
describing its parts separately rather than using the same PMU
approach?

>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> [Bartosz:
>   - move the pcieport0 node into the .dtsi
>   - make regulator naming consistent with existing DT code
>   - add commit message]
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 29 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    | 10 +++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> index b07cac2e5bc8..4623c358f634 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> @@ -845,6 +845,28 @@ &pcie0 {
>         status = "okay";
>  };
>
> +&pcieport0 {
> +       wifi@0 {
> +               compatible = "pci17cb,1107";
> +               reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&wlan_en>;
> +
> +               enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> +
> +               vdd-supply = <&vreg_s4i_0p85>;
> +               vddio-supply = <&vreg_l15b_1p8>;
> +               vddio1p2-supply = <&vreg_l3c_1p2>;
> +               vddaon-supply = <&vreg_s2c_0p8>;
> +               vdddig-supply = <&vreg_s3c_0p9>;
> +               vddrfa1p2-supply = <&vreg_s1c_1p2>;
> +               vddrfa1p8-supply = <&vreg_s6c_1p8>;
> +
> +               clocks = <&rpmhcc RPMH_RF_CLK1>;
> +       };
> +};
> +
>  &pcie0_phy {
>         vdda-phy-supply = <&vreg_l1i_0p88>;
>         vdda-pll-supply = <&vreg_l3i_1p2>;
> @@ -1139,6 +1161,13 @@ wcd_default: wcd-reset-n-active-state {
>                 bias-disable;
>                 output-low;
>         };
> +
> +       wlan_en: wlan-en-state {
> +               pins = "gpio16";
> +               function = "gpio";
> +               drive-strength = <8>;
> +               bias-pull-down;
> +       };
>  };
>
>  &uart14 {
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index d488b3b3265e..baf4932e460c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2293,6 +2293,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>                         dma-coherent;
>
>                         status = "disabled";
> +
> +                       pcieport0: pcie@0 {
> +                               device_type = "pci";
> +                               reg = <0x0 0x0 0x0 0x0 0x0>;
> +                               #address-cells = <3>;
> +                               #size-cells = <2>;
> +                               ranges;
> +
> +                               bus-range = <0x01 0xff>;
> +                       };
>                 };
>
>                 pcie0_phy: phy@1c06000 {
> --
> 2.40.1
>


-- 
With best wishes
Dmitry


Return-Path: <linux-arm-msm+bounces-7882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C33883870A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 06:54:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEE42B2272E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 05:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB8D442A;
	Tue, 23 Jan 2024 05:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W2/50smJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE28D5384
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705989287; cv=none; b=XzMTnN7gwrApvQLd5By+kkEvVVSf+0y8oL4Dv7/2AwW/Scuao/GpDNqGrVUv14MWrUqVX01DeS5qQIZOlawlmRWCI58cXtxbrqBkbNUnsoCEYAYBAVHlMHmloILIhy54to4w0lowWwBd9DkYZ4Hs+6IhkA3sUVG2oAY7dwk8yHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705989287; c=relaxed/simple;
	bh=IedhDM4GAuyddYPNOKsFk25CuXoaKMq8SB+p+rm05Ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCDS4cEkd9P11AkPnHiZpKfoNDvkR7UpDpbYIpml1L1vnVw4SFqUsCzHIxvC4v4YfNQT5PvqwD0LIyhPAoZogH1KzNLHWbY4/2u1WvYCsBrj+ME/A6SHOpWpuKoe0fwZJAA8mP+Urkn4xVsvpRmcASRnYzih+iBAWDoMj/q6LOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W2/50smJ; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dae7cc31151so2811443276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jan 2024 21:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705989284; x=1706594084; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u8hawjzB2k/6IB+JEpXxKhO9XrlUEkw5XU7npCHNlns=;
        b=W2/50smJ7g0a9s11jBUA/jpTzQg+jHuPNuFwHuUML8/9mFqQGKzm1O4V0F6ugZn/zT
         Vrw5AOXF1T/0bL6ZtYbNsRYAuSe0XeP4rqPao3M7pKjPQ7j7wf+F78jiF1/+EO8hMUv4
         ZvtANuzuJ5ZzRK9qP3DIznNxh8+VhHoTb8UCf17UbYprLUCYpsaBYC8xleF/EsEcM3ft
         8or0LedG1ncP3k4+ztl+gcYilAVUVp/wceQh/FVuWDOqu1OOoRnfl1DS6ff0cEKuywzF
         MPtYkaIamzCgfZN1YV/2yjA68GuIY+1kDnJUDZypm1VJzAWocPEqZaKypSHMz1dy+fdp
         vvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705989284; x=1706594084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8hawjzB2k/6IB+JEpXxKhO9XrlUEkw5XU7npCHNlns=;
        b=k5yvjKqfgYaaa+AS0EOnP70CzWvLt4kDALaGiPWBO9OWHIXwVMNLS5wgNE9XsDalA7
         e8LodhQskndy0Wn/ATWJcjhaH0R4i80PqRHkIgff4PB+Oe9h3PV+YOOwlRa4LCQ4rRdL
         ClTbEg6AiqVezUDOB6c++wRRJADeDxYcFLkIN2hTnlEu0lfDxiuT/+x5ynbj17HIGUr5
         Q6NNQuR1jn+tNruXTK8VAtQYg0SOtcEIpkEarcVHN1AZtZydBPzEglwEU9hBgvne5qVh
         SMPZZj25yZRPLJZXU401py+F61IQJkXiNDRwyw4vqP35Mc+uuDGBKhoHT6oFbsoXlb1o
         pm3Q==
X-Gm-Message-State: AOJu0YzW71gP6GwBNc5syUF/efrFQKayjmrt4vociRTnOHYx3/GTsz/F
	MA76MAw1LujFho/nSsb4XhD/Hj/QQIR7FBv1BxePp4+94kVqU9u/bHHUN2lTcettI3PucEFLMn1
	ofDO85ZyABTffnWhtwru2UeF77HUhkb3lZyINbA==
X-Google-Smtp-Source: AGHT+IEkxjJVSmq8MCL28lHXYMwlDP3mgapIAK5Xu0TtkhiywDgxtPNfu93BAvUfYkW7Q68B6qXYcAIV7ZDcCeSW0js=
X-Received: by 2002:a25:ab30:0:b0:dc2:2acf:ce48 with SMTP id
 u45-20020a25ab30000000b00dc22acfce48mr2888085ybi.126.1705989283779; Mon, 22
 Jan 2024 21:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl>
In-Reply-To: <20240122182158.69183-1-brgl@bgdev.pl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 07:54:32 +0200
Message-ID: <CAA8EJprWddrEH+Wmh4SExPygSVz6+WpSX-MDQ+hev1gov74rng@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jan 2024 at 20:22, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> I'm limiting the audience of this compared to the PCI power sequencing
> series as I wanted to run the DT part by the maintainers before I commit
> to a doomed effort.
>
> Here is the DT representation of the QCA6390's PMU with its inputs and
> outputs. If I were to implement the pwrseq framework that would be able
> to assign the relevant pwrseq data to the consumer based on the actual
> regulators and not abstract bt-pwrseq or wlan-pwrseq properties - would
> that fly with you?
>
> We'd need to deprecate the existing BT bindings but unfortunately they
> are already described as consuming the host PMIC regulators in bindings.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

My main concern is whether this is going to pass the regulator
subsystem locking. Basically you have a driver for regulators, which
will itself call into the regulator subsytem. It might be reentrant.
Or it might not.

> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 129 +++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
>  2 files changed, 128 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index cd0db4f31d4a..c9b1600c57ef 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -108,6 +108,88 @@ lt9611_3v3: lt9611-3v3 {
>                 regulator-always-on;
>         };
>
> +       qca6390_pmu: pmu@0 {
> +               compatible = "qcom,qca6390-pmu";
> +
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +
> +               vddaon-supply = <&vreg_s6a_0p95>;
> +               vddpmu-supply = <&vreg_s2f_0p95>;
> +               vddrfa1-supply = <&vreg_s2f_0p95>;
> +               vddrfa2-supply = <&vreg_s8c_1p3>;
> +               vddrfa3-supply = <&vreg_s5a_1p9>;
> +               vddpcie1-supply = <&vreg_s8c_1p3>;
> +               vddpcie2-supply = <&vreg_s5a_1p9>;
> +               vddio-supply = <&vreg_s4a_1p8>;
> +
> +               bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +               wifi-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> +               swctrl-gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
> +
> +               regulators {
> +                       vreg_pmu_rfa_cmn: ldo0 {
> +                               regulator-name = "vreg_pmu_rfa_cmn";
> +                               regulator-min-microvolt = <760000>;
> +                               regulator-max-microvolt = <840000>;
> +                       };
> +
> +                       vreg_pmu_aon_0p59: ldo1 {
> +                               regulator-name = "vreg_pmu_aon_0p59";
> +                               regulator-min-microvolt = <540000>;
> +                               regulator-max-microvolt = <840000>;
> +                       };
> +
> +                       vreg_pmu_wlcx_0p8: ldo2 {
> +                               regulator_name = "vreg_pmu_wlcx_0p8";
> +                               regulator-min-microvolt = <760000>;
> +                               regulator-max-microvolt = <840000>;
> +                       };
> +
> +                       vreg_pmu_wlmx_0p85: ldo3 {
> +                               regulator-name = "vreg_pmu_wlmx_0p85";
> +                               regulator-min-microvolt = <810000>;
> +                               regulator-max-microvolt = <890000>;
> +                       };
> +
> +                       vreg_pmu_btcmx_0p85: ldo4 {
> +                               regulator-name = "vreg_pmu_btcmx_0p85";
> +                               regulator-min-microvolt = <810000>;
> +                               regulator-max-microvolt = <890000>;
> +                       };
> +
> +                       vreg_pmu_rfa_0p8: ldo5 {
> +                               regulator-name = "vreg_pmu_rfa_0p8";
> +                               regulator-min-microvolt = <760000>;
> +                               regulator-max-microvolt = <840000>;
> +                       };
> +
> +                       vreg_pmu_rfa_1p2: ldo6 {
> +                               regulator-name = "vreg_pmu_rfa_1p2";
> +                               regulator-min-microvolt = <1187000>;
> +                               regulator-max-microvolt = <1313000>;
> +                       };
> +
> +                       vreg_pmu_rfa_1p7: ldo7 {
> +                               regulator_name = "vreg_pmu_rfa_1p7";
> +                               regulator-min-microvolt = <1710000>;
> +                               regulator-max-microvolt = <1890000>;
> +                       };
> +
> +                       vreg_pmu_pcie_0p9: ldo8 {
> +                               regulator_name = "vreg_pmu_pcie_0p9";
> +                               regulator-min-microvolt = <870000>;
> +                               regulator-max-microvolt = <970000>;
> +                       };
> +
> +                       vreg_pmu_pcie_1p8: ldo9 {
> +                               regulator_name = "vreg_pmu_pcie_1p8";
> +                               regulator-min-microvolt = <1710000>;
> +                               regulator-max-microvolt = <1890000>;
> +                       };
> +               };
> +       };
> +
>         thermal-zones {
>                 conn-thermal {
>                         polling-delay-passive = <0>;
> @@ -734,6 +816,24 @@ &pcie0_phy {
>         vdda-pll-supply = <&vreg_l9a_1p2>;
>  };
>
> +&pcieport0 {
> +       wifi@0 {
> +               compatible = "pci17cb,1101";
> +               reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +               vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +               vddaon-supply = <&vreg_pmu_aon_0p59>;
> +               vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +               vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +               vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +               vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
> +               vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
> +               vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
> +               vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
> +               vddpcie1-supply = <&vreg_pmu_pcie_1p8>;

This really feels like an overkill, All those voltages are handled by
the PMU itself, rather than being requested by the WiFi or BT drivers.

> +       };
> +};
> +
>  &pcie1 {
>         status = "okay";
>  };

-- 
With best wishes
Dmitry


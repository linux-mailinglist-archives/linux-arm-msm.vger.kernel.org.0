Return-Path: <linux-arm-msm+bounces-14481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FD87FB20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 10:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0253DB21841
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 09:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E3C7D400;
	Tue, 19 Mar 2024 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkJym5mj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E97D3F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841950; cv=none; b=YRIKyGEebVriOg7kPKZiNyqm8+e2+aPVk9BDIsV+UXD5FksWFkcd8++kgvmLCpaz5oTFn7RsxSoosSCkMQyFsrWE5rnt4L6BSgvCAfu85/s0CIkcPuXq+IiUrbtEl0AlJ1EDu2oAhna187qoPfYP3iInJOmBk35a82dcBlHl0AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841950; c=relaxed/simple;
	bh=GBn2DTXzIExCHBi5QRFqEjOBO93zlSboxWgc4rPCncY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1CGjC56LvsgaGBNmV/ZAVYPl/TXYkm3TYNUGVleoxhRZ/J6aJ86FrRHQRFdeQxdK06Dm6VyaBpnypwn147bBDxcgFKHhY5j0XbMimMqJmtka0Lu7T4gp9hcemBkQucu6wtjjr/QLFEtsbygi2Qvm5MmDH3yaHnE/0QRfdqPrLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkJym5mj; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-610e272028aso3380997b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 02:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710841947; x=1711446747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A6LcXKMDysqMRqbalBzfZO3pv8QVanE6pMSkVm/ZUmU=;
        b=FkJym5mj45ia5WYaUoejisQWBJcjOG01oDb84UZ0dr06rhdQL5Xf+v28nPjWMtph3u
         gVKl91Qr9vVxjliiYzl19DnGrCxAcfd1hhJcDbSGi3Dfhp0jqxrKMshvi0hWyjGaNIfk
         T4PycqH9uaDKxqdvy9xt4LyBzVmXmoO5OAYzWcboYA20Bll2RDkYuRwlO0tai7PKMszD
         9S7LSQ/heiW9j++oJxDXwcs1bNbv2OtDML9vnQ3Sku0jnXC+LhZBWBOKUOtXtiHGKfsN
         L8ySfnsTNbmDDRzAMA1weymtsIHSUXsxDmNCsJ2zIsSPKwYSunP80SKNHRm1/XjmW2W9
         yH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841947; x=1711446747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6LcXKMDysqMRqbalBzfZO3pv8QVanE6pMSkVm/ZUmU=;
        b=k2KPg7Ab/IsEkBWDNH2bCf3E2SpIuTnx0LApfdXf9T3fYZuH9SvzePWGEo40ns2IK8
         7zQcgHlp8J1HCmq+RJnHch/MSXL/3OKMTc/YLNKi9ji8z7ORvwrgY/0L7KwXqMFapN9q
         vxE8reH7q50tRW1y4/23Xm9e7LDeV6Fr2Eee/AswLs28yYXg8emIPl8V7JmLqElY9m9B
         GVHsloiiMKMojf92YlVnt+snZADnsD4M53G1ZT3jgjz5oxtyonVw/XXL+DVD+NmKfUIB
         lnNkZ5nVUM36adzQcOzWnWXZbRJzsZKxlxjp0g0sAn2Xnqe0irReHm01otgoIvqQLWK0
         7P8A==
X-Forwarded-Encrypted: i=1; AJvYcCVduW+C9cEKh8L7acxdDZkXIF3dRvI9r9/VK1w6Sd/XqzrH/vm4aUK9H/DOPyuCP+swq4Csmy65TyRci9x2MnByrzeqf0WnjmLyC2VvUw==
X-Gm-Message-State: AOJu0YyaaC+BYj22zjGZoiLNCTp1ACcJ2In7xHTggW1CvmIFugDcht6c
	72jUlb6OiAGR8INAnmxExDwl7YaDGa2Dg0qRogbTYCQfRsJwG5e9y1JXVKUWSyf4TLIGSUreOci
	44Qxjpp6KbFOpaGHqdirQZs9fxAIV4IE0Mo1W9g==
X-Google-Smtp-Source: AGHT+IFTqEoL7jp7hhkfRsn7rpaBt243clxqWrclDc1Z7lnJmPK+XyJkd/EUhpiMA9iu8JUpLTB8zbYI2fio+utI0IA=
X-Received: by 2002:a0d:e7c2:0:b0:610:e891:838c with SMTP id
 q185-20020a0de7c2000000b00610e891838cmr279556ywe.7.1710841947304; Tue, 19 Mar
 2024 02:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319091020.15137-1-quic_kbajaj@quicinc.com> <20240319091020.15137-3-quic_kbajaj@quicinc.com>
In-Reply-To: <20240319091020.15137-3-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 11:52:15 +0200
Message-ID: <CAA8EJprXPvji8TgZu1idH7y4GtHtD4VmQABFBcRt-9BQaCberg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qdu1000-idp: enable USB nodes
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Amrit Anand <quic_amrianan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 11:11, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Enable both USB controllers and associated hsphy and qmp phy
> nodes on QDU1000 IDP. Add the usb type B port linked with the
> DWC3 USB controller switched to OTG mode and tagged with
> usb-role-switch.
>
> Co-developed-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 65 ++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 89b84fb0f70a..26442e707b5e 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -46,6 +46,33 @@ ppvar_sys: ppvar-sys-regulator {
>                 regulator-boot-on;
>         };
>
> +       usb_conn_gpio: usb-conn-gpio {
> +               compatible = "gpio-usb-b-connector";

If this board has only a USB-B connector, can it really handle USB 3.0?

> +               vbus-gpio =  <&pm8150_gpios 7 GPIO_ACTIVE_HIGH>;
> +               id-gpio = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +               vbus-supply = <&vbus_supply_regulator>;
> +
> +               pinctrl-0 = <&usb_vbus_det_default
> +                            &usb_id_det_default>;
> +               pinctrl-names = "default";
> +
> +               port {
> +                       usb_port0_connector: endpoint {
> +                               remote-endpoint = <&usb_1_dwc3_hs>;
> +                       };
> +               };
> +       };
> +
> +       vbus_supply_regulator: vbus-supply-regulator {
> +               compatible = "regulator-fixed";
> +               regulator-name = "vbus_supply";
> +
> +               gpio = <&tlmm 43 GPIO_ACTIVE_HIGH>;
> +               pinctrl-0 = <&usb_vbus_boost_default>;
> +               pinctrl-names = "default";
> +               enable-active-high;
> +       };
> +
>         vph_pwr: vph-pwr-regulator {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vph_pwr";
> @@ -239,6 +266,16 @@ vreg_l18a_1p2: ldo18 {
>         };
>  };
>
> +&pm8150_gpios {
> +       usb_vbus_det_default: usb-vbus-det-default {
> +               pins = "gpio7";
> +               function = "normal";
> +               input-enable;
> +               bias-pull-up;
> +               power-source = <0>;
> +       };
> +};
> +
>  &qup_i2c1_data_clk {
>         drive-strength = <2>;
>         bias-pull-up;
> @@ -500,3 +537,31 @@ &tlmm {
>  &uart7 {
>         status = "okay";
>  };
> +
> +&usb_1 {
> +       status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +       dr_mode = "otg";

Nit: this is the default setting.

> +       usb-role-switch;
> +};
> +
> +&usb_1_dwc3_hs {
> +       remote-endpoint = <&usb_port0_connector>;
> +};
> +
> +&usb_1_hsphy {
> +       vdda-pll-supply = <&vreg_l8a_0p91>;
> +       vdda18-supply = <&vreg_l14a_1p8>;
> +       vdda33-supply = <&vreg_l2a_2p3>;
> +
> +       status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +       vdda-phy-supply = <&vreg_l8a_0p91>;
> +       vdda-pll-supply = <&vreg_l3a_1p2>;
> +
> +       status = "okay";
> +};
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry


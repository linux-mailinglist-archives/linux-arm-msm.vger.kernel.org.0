Return-Path: <linux-arm-msm+bounces-37913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E899C8BF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 14:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A470B27975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761891FAEF3;
	Thu, 14 Nov 2024 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UmtJLVSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17261FAC5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731590930; cv=none; b=LlOybbrQx2sr0/9UP7m6gu7UOOvORJ7G1OOVqsDw9i94nyjOH7czEh5zB5ehEh76x5Qf6DRJSvMYIGwVsM4/vAc0jOoLBLgo+9j1dBHxlE8iYvk2yJHI7YZlX5XLF9a9axyDvpiPA3fb6Wkjd8BXGA6god0+eLsnWmWCOaKRPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731590930; c=relaxed/simple;
	bh=Sxx/Lai0zK42h/U29LKjUmar6IFE1Dx8OHn26s0hyjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqGW4locfwUKYdT331V8A2r/Pym7ZFK3iWKvEw2ZHU2KVtso9Aj9BpEFoVd62GqeEbJSaaj0vi95Fos1QCRqex9tAwUklRXlRjfXcXysNaY0Ww8dsjx4pCr7CSsTorI1dyihop2ssVDGE59dFdeOfHQYGpJmZ5Ec+j8ItSEcED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UmtJLVSq; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3814f9e43fso564721276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 05:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731590927; x=1732195727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcQ5UiOW6mD+0cy+sSW1sUJ7XuSBho0hmBvy+z6MjTw=;
        b=UmtJLVSq6uIZ8AO9ntnUrJXFoa+SW0xXRZBYfGcMTBHz9+UIhl0/w8rEy1js0sgkid
         s6eddXSJZG1qS7R4or73xTyi9uFPtHmfsBkwfLkNlV1GBMsUVr7yKMKpygC6CtrhuZ8T
         Tgoms0tAuhBuOK/0XxgmXiA6AK610j19wdJXE9lbXf7w23QFy20RG0Lkf9CVKEI1elau
         B7aa3R980UbX+cEkPOHfXxmtD0DEEPVkJVnQYaekJ8GZ1xQp8qyPOOaz2+3Uw4QVdG3k
         Ucc1ZQ/O7fbGzbcZAQgEbh9C2YF9Y2zLJO/rnmdnbwPnh5nxR9xWEQGhDfxeb+D7c1eI
         72Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731590927; x=1732195727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcQ5UiOW6mD+0cy+sSW1sUJ7XuSBho0hmBvy+z6MjTw=;
        b=dKoT6bcSn5AMrvKyDS77fOWDTDd5ZMO0svN8mYHZSW7p2/EiB6z+mHsEX7CEoOgq0D
         fpvUk4tQzX6+O4CbJd8TYmbfVWZMOx1Bgs3w98OGaLrnUERfm3z1C4pXbeDuZ9bFUUYA
         EnDYNQN+3pKOe7t7j8x4PuhMJE6aYugdI6zQSZLfhkCXxXI4EDZLBcHlEuxsNLJB8cdb
         uwL37J9iIkZCc+6RbWyLfNivdn2qRs/XryFuasGIHFv4bv3+9kusvGYBA4bNio8Bp10A
         K4q2Fu+6Nq5awyUO/kYhV5pd7wQjEkqci2vWza8brCWdbTptDB8pvb9CePsOlyHEr2Kk
         b0dg==
X-Forwarded-Encrypted: i=1; AJvYcCWaAr7IBgmE+qDTAj4aw+lu1idZVtxQeFeJJ3xtKG0kJASKlMs4G9olwHVq9FSPMpvXBIQjaN/adrq6Himv@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSMbeWZ6l4DsAQWWBoOHfBuSxmdo88ZSSQOD0IYnXQDrX3L0a
	6KfcBRCKXQyy8JRVDgd+oxTB9kBICKUcVDgVvpnsHxgRKv+swc9zkLYRu6kIqi3OfRleVQ7gdrI
	TvLLy9UzFkt+mFgMwG9Rxx6gyvN1euGNo8lx5OA==
X-Google-Smtp-Source: AGHT+IEugYhO3qu2pI5GTy+5MNobr83Oj1LIe7KV1mNroQS/7Hdfjqfs3RZ2KahktWJFX5bf8Yw2oc7xssKAL6x6h1s=
X-Received: by 2002:a05:690c:2501:b0:6dd:cdd7:ce49 with SMTP id
 00721157ae682-6eca4640ff7mr126602127b3.6.1731590927516; Thu, 14 Nov 2024
 05:28:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114074722.4085319-1-quic_varada@quicinc.com> <20241114074722.4085319-7-quic_varada@quicinc.com>
In-Reply-To: <20241114074722.4085319-7-quic_varada@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Nov 2024 15:28:36 +0200
Message-ID: <CAA8EJpr6xb=TPPgk7ERhKVp7OnYdPGCK6+1_2TBRLBt_eWM43A@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: Add USB controller and phy nodes
 for IPQ5424
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, andersson@kernel.org, 
	konradybcio@kernel.org, mantas@8devices.com, quic_kbajaj@quicinc.com, 
	quic_kriskura@quicinc.com, quic_rohiagar@quicinc.com, abel.vesa@linaro.org, 
	quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2024 at 09:48, Varadarajan Narayanan
<quic_varada@quicinc.com> wrote:
>
> The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
> can connect to either of USB2.0 or USB3.0 phy and operate in the
> respective mode.
>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v3: Regulator node names, labels and 'regulator-name' changed per review suggestions
>     Stray newline removed
>
> v2: Add dm/dp_hs_phy_irq to usb3@8a00000 node
>     Add u1/u2-entry quirks to usb@8a00000 node
> ---
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  66 ++++++++
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 159 ++++++++++++++++++++
>  2 files changed, 225 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index d4d31026a026..859e15befb3f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -16,12 +16,70 @@ / {
>         aliases {
>                 serial0 = &uart1;
>         };
> +
> +       vreg_misc_3p3: regulator-3300000 {

Technically these names are correct. However they don't match the
approach that Qualcomm DT files have been using up to now.
You can compare your data with the output of `git grep :.regulator-
arch/arm64/boot/dts/qcom/`

> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "usb_hs_vdda_3p3";
> +       };
> +
> +       vreg_misc_1p8: regulator-1800000 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <1800000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "vdda_1p8_usb";
> +       };
> +
> +       vreg_misc_0p925: regulator-0925000 {
> +               compatible = "regulator-fixed";
> +               regulator-min-microvolt = <925000>;
> +               regulator-max-microvolt = <925000>;
> +               regulator-boot-on;
> +               regulator-always-on;
> +               regulator-name = "vdd_core_usb";
> +       };
> +};
> +
> +&dwc_0 {
> +       dr_mode = "host";
> +};
> +
> +&dwc_1 {
> +       dr_mode = "host";
> +};
> +
> +&qusb_phy_0 {
> +       vdd-supply = <&vreg_misc_0p925>;
> +       vdda-pll-supply = <&vreg_misc_1p8>;
> +       vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
> +
> +       status = "okay";
> +};
> +
> +&qusb_phy_1 {
> +       vdd-supply = <&vreg_misc_0p925>;
> +       vdda-pll-supply = <&vreg_misc_1p8>;
> +       vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
> +
> +       status = "okay";
>  };
>
>  &sleep_clk {
>         clock-frequency = <32000>;
>  };
>
> +&ssphy_0 {
> +       vdda-pll-supply = <&vreg_misc_1p8>;
> +       vdda-phy-supply = <&vreg_misc_0p925>;
> +
> +       status = "okay";
> +};
> +
>  &tlmm {
>         sdc_default_state: sdc-default-state {
>                 clk-pins {
> @@ -53,6 +111,14 @@ &uart1 {
>         status = "okay";
>  };
>
> +&usb2 {
> +       status = "okay";
> +};
> +
> +&usb3 {
> +       status = "okay";
> +};
> +
>  &xo_board {
>         clock-frequency = <24000000>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5e219f900412..f8afd6f0412d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -233,6 +233,165 @@ intc: interrupt-controller@f200000 {
>                         msi-controller;
>                 };
>
> +               qusb_phy_1: phy@71000 {
> +                       compatible = "qcom,ipq5424-qusb2-phy";
> +                       reg = <0 0x00071000 0 0x180>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
> +                               <&xo_board>;
> +                       clock-names = "cfg_ahb", "ref";
> +
> +                       resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
> +                       status = "disabled";
> +               };
> +
> +               usb2: usb2@1e00000 {
> +                       compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
> +                       reg = <0 0x01ef8800 0 0x400>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       clocks = <&gcc GCC_USB1_MASTER_CLK>,
> +                                <&gcc GCC_USB1_SLEEP_CLK>,
> +                                <&gcc GCC_USB1_MOCK_UTMI_CLK>,
> +                                <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
> +                                <&gcc GCC_CNOC_USB_CLK>;
> +
> +                       clock-names = "core",
> +                                     "sleep",
> +                                     "mock_utmi",
> +                                     "iface",
> +                                     "cfg_noc";
> +
> +                       assigned-clocks = <&gcc GCC_USB1_MASTER_CLK>,
> +                                         <&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +                       assigned-clock-rates = <200000000>,
> +                                              <24000000>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pwr_event",
> +                                         "qusb2_phy",
> +                                         "dm_hs_phy_irq",
> +                                         "dp_hs_phy_irq";
> +
> +                       resets = <&gcc GCC_USB1_BCR>;
> +                       qcom,select-utmi-as-pipe-clk;
> +                       status = "disabled";
> +
> +                       dwc_1: usb@1e00000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0 0x01e00000 0 0xe000>;
> +                               clocks = <&gcc GCC_USB1_MOCK_UTMI_CLK>;
> +                               clock-names = "ref";
> +                               interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&qusb_phy_1>;
> +                               phy-names = "usb2-phy";
> +                               tx-fifo-resize;
> +                               snps,is-utmi-l1-suspend;
> +                               snps,hird-threshold = /bits/ 8 <0x0>;
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_u3_susphy_quirk;
> +                       };
> +               };
> +
> +               qusb_phy_0: phy@7b000 {
> +                       compatible = "qcom,ipq5424-qusb2-phy";
> +                       reg = <0 0x0007b000 0 0x180>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                               <&xo_board>;
> +                       clock-names = "cfg_ahb", "ref";
> +
> +                       resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +                       status = "disabled";
> +               };
> +
> +               ssphy_0: phy@7d000 {
> +                       compatible = "qcom,ipq5424-qmp-usb3-phy";
> +                       reg = <0 0x0007d000 0 0xa00>;
> +                       #phy-cells = <0>;
> +
> +                       clocks = <&gcc GCC_USB0_AUX_CLK>,
> +                                <&xo_board>,
> +                                <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                                <&gcc GCC_USB0_PIPE_CLK>;
> +                       clock-names = "aux",
> +                                     "ref",
> +                                     "cfg_ahb",
> +                                     "pipe";
> +
> +                       resets = <&gcc GCC_USB0_PHY_BCR>,
> +                                <&gcc GCC_USB3PHY_0_PHY_BCR>;
> +                       reset-names = "phy",
> +                                     "phy_phy";
> +
> +                       #clock-cells = <0>;
> +                       clock-output-names = "usb0_pipe_clk";
> +
> +                       status = "disabled";
> +               };
> +
> +               usb3: usb3@8a00000 {
> +                       compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
> +                       reg = <0 0x08af8800 0 0x400>;
> +
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +
> +                       clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +                                <&gcc GCC_USB0_SLEEP_CLK>,
> +                                <&gcc GCC_USB0_MOCK_UTMI_CLK>,
> +                                <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +                                <&gcc GCC_CNOC_USB_CLK>;
> +
> +                       clock-names = "core",
> +                                     "sleep",
> +                                     "mock_utmi",
> +                                     "iface",
> +                                     "cfg_noc";
> +
> +                       assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
> +                                         <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                       assigned-clock-rates = <200000000>,
> +                                              <24000000>;
> +
> +                       interrupts-extended = <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +                                             <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "pwr_event",
> +                                         "qusb2_phy",
> +                                         "dm_hs_phy_irq",
> +                                         "dp_hs_phy_irq";
> +
> +                       resets = <&gcc GCC_USB_BCR>;
> +                       status = "disabled";
> +
> +                       dwc_0: usb@8a00000 {
> +                               compatible = "snps,dwc3";
> +                               reg = <0 0x08a00000 0 0xcd00>;
> +                               clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +                               clock-names = "ref";
> +                               interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
> +                               phys = <&qusb_phy_0>, <&ssphy_0>;
> +                               phy-names = "usb2-phy", "usb3-phy";
> +                               tx-fifo-resize;
> +                               snps,is-utmi-l1-suspend;
> +                               snps,hird-threshold = /bits/ 8 <0x0>;
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_u3_susphy_quirk;
> +                               snps,dis-u1-entry-quirk;
> +                               snps,dis-u2-entry-quirk;
> +                       };
> +               };
> +
>                 timer@f420000 {
>                         compatible = "arm,armv7-timer-mem";
>                         reg = <0 0xf420000 0 0x1000>;
> --
> 2.34.1
>


-- 
With best wishes
Dmitry


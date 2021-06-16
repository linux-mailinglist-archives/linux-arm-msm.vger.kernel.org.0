Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 645A13A8D78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhFPAb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbhFPAb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:31:58 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64171C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:29:52 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id r16so593557oiw.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EA4PTF58a5WW5Zwb9g/rsTBq/ZeU4jikbc1MhO+pikk=;
        b=D7S9HfghGhsbR0shzfNj0tKkCrOII9s4Ej4+eujaW44E2L7yB4e5+Mb/WxQWflYIel
         ov3QJDZobt8rnUCtCp1IbFhUHZB8FMzzSCx6LI879XgOF2WnST9/Bbxy9bO85Hw+mtbg
         KXCBq3dB/+H/U7IjAXE8kanDpzntqUS2baLp6JFb9BM9SeISfcgNfRsUbyjSbkU0EOZC
         tMH2bXiMHJuxdz6zNN/5yutYDkp81vga2mFDB9He8kmbZ+v2gE0QuM/gtGJPnX9unK3V
         JDPaQ0H2YRgt6pZX5GQpDQNK4X4VyaPwiHbR5zZRw2auaIXCLmCuRi2gfRegn8YhxVC8
         DsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EA4PTF58a5WW5Zwb9g/rsTBq/ZeU4jikbc1MhO+pikk=;
        b=tMWKqWEaGUG8MkyZsGazgIAb8txPaxJZJpVCij2yieK/Nr/kCbebjrfiJ14FrSpKJa
         8UyF7SnNhVSyeoZSbENDzOZ4o/oyw8EzyR0V0Laz3MWJSFmBjvWAMG59HTXMuvvkDmhE
         8GnJVRiKNRef8xjm18fsKfMruH46iqmp2P1zkPIdNk4BKhYc3mrF96b7o9iY66l9Hc9s
         GEFiKiX79pf3P2acfuGpPwRTizGJYL3G6N40Vdyu6eq+pjTu9fT0+vsvIZW0CAkFb8Uf
         zs+P3pcI3M+QtON9kZhj5Y3Kc85JSnfeDlDzXr1DIDCHfgPvAeR/+WT6CHaF8TgF1YP5
         M3eA==
X-Gm-Message-State: AOAM530jZ6E8LOw4EsIpFN9crj8xKPniJAA+H7av8U1c2V5JT2qXYAhq
        pSqYq/n42lifPMeHBHzmf9BafA==
X-Google-Smtp-Source: ABdhPJwNlXvrgI+F5cUFbufFHElN+s9m/lJj4u8oOeqDQXGgDjWxspHqX9jcfMnOKHxJgnngjov/SA==
X-Received: by 2002:aca:c441:: with SMTP id u62mr4988696oif.31.1623803391689;
        Tue, 15 Jun 2021 17:29:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 26sm124078ooy.46.2021.06.15.17.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 17:29:51 -0700 (PDT)
Date:   Tue, 15 Jun 2021 19:29:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arch: arm64: dts: qcom: Add support for SM6125
Message-ID: <YMlF/aPn+253UIHn@builder.lan>
References: <20210613080522.25230-1-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613080522.25230-1-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 13 Jun 03:05 CDT 2021, Martin Botka wrote:

> This commits adds the Device tree file for SM6125 SoC.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>

Thanks for your work on this Martin, just spotted a few minor finishing
touches below.

> ---
> Changes in V2:
> Update compatibles for mailbox & pinctrl
> Changes in V3:
> Fix reg for sdhci1
> Replace hc_mem with hc and core_mem with core
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 603 +++++++++++++++++++++++++++
>  1 file changed, 603 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6125.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
[..]
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x00 0x00 0x00 0xffffffff>;
> +		compatible = "simple-bus";
> +
> +		tcsr_mutex_regs: syscon@340000 {

It's no longer valid to have a stray syscon like this, so please update
this in accordance with the tcsr mutex binding.

If this platform needs to poke at the registers at the end of the memory
region, you can do compatible = "qcom,tcsr-mutex", "syscon"; to make it
represent both things.

> +			compatible = "syscon";
> +			reg = <0x00340000 0x20000>;
> +		};
> +
> +		tlmm: pinctrl@500000 {
> +			compatible = "qcom,sm6125-tlmm";
> +			reg = <0x00500000 0x400000>,
> +				<0x00900000 0x400000>,
> +				<0x00d00000 0x400000>;
> +			reg-names = "west", "south", "east";
> +			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			gpio-ranges = <&tlmm 0 0 134>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			sdc2_state_on: sdc2-on {

As I just forced Konrad to move the on-state definition to the board
file, can you please do the same?

> +				clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				sd-cd {
> +					pins = "gpio98";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +			};
> +
> +			sdc2_state_off: sdc2-off {

This should be common between all boards (except possibly the cd line),
so this is okay to share here.

> +				clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +
> +				cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				sd-cd {
> +					pins = "gpio98";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +			};
> +		};
> +
[..]
> +
> +		usb3: usb@4ef8800 {
> +			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
> +			reg = <0x04ef8800 0x400>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +
> +			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
> +				<&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
> +				<&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
> +				<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +				<&gcc GCC_USB30_PRIM_SLEEP_CLK>,
> +				<&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
> +
> +			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <66666667>;
> +
> +			power-domains = <&gcc USB30_PRIM_GDSC>;
> +			qcom,select-utmi-as-pipe-clk; 

Stray space at the end of this line.

> +			status = "disabled";
> +
> +			usb3_dwc3: dwc3@4e00000 {

These should be usb@ now.

> +				compatible = "snps,dwc3";
> +				reg = <0x04e00000 0xcd00>;
> +				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&hsusb_phy1>;
> +				phy-names = "usb2-phy";
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;
> +				maximum-speed = "high-speed";
> +				dr_mode = "peripheral";
> +			};
> +		};

Thanks,
Bjorn

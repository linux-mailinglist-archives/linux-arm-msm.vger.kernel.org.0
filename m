Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 219C6456CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 10:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhKSJ7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 04:59:47 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:28696 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhKSJ7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 04:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637315801;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+ZbK7aHRev3BXeBFj0UD0Yz7+yqaSMYEHhl6wwftxps=;
    b=qokiRNVg6ZQLyOdGsW8PuiJZY9eyVHRu2MBYMwegCEYB1iAYyRMDyziUfGtbVsAeSc
    hiMV+WGbCX2lvqdrMe0WPXowNlox566NrxNIDBuDjGn5AIrWBFti0ldP+donPInQu8tN
    SBLYV6V1lyBfQK/Effy519Zs42NN0lgXZOAiZ1TBt5MUdo6gNBPKyXVGBgwo/pmXAfUh
    UM0SMNium6bpx24aI7MpF7AIkJC5ehyoBLXzAtGoY1VetG9byz4BvUqj8o42YCuafj1d
    2itohBUFuCXki2uIyhrrIIZDw5Cv3oB1vU1hwltpWNvQofJVbN1vTqrtSRZ6J1xOFlsS
    BT3w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK09lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.5 AUTH)
    with ESMTPSA id j05669xAJ9ucxzp
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 10:56:38 +0100 (CET)
Date:   Fri, 19 Nov 2021 10:56:31 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Julian Ribbeck <julian.ribbeck@gmx.de>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for Samsung J5 2015
 (samsung-j5)
Message-ID: <YZd0zzzuxgk2+x2b@gerhold.net>
References: <20211116200734.73920-1-julian.ribbeck@gmx.de>
 <YZcam/pnh0CBjMIx@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZcam/pnh0CBjMIx@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

Thanks a lot for your review!

On Thu, Nov 18, 2021 at 09:31:39PM -0600, Bjorn Andersson wrote:
> On Tue 16 Nov 14:07 CST 2021, Julian Ribbeck wrote:
> 
> > Samsung J5 2015 is a MSM8916 based Smartphone. It is similar to some of the
> > other MSM8916 devices, especially the Samsung ones.
> > 
> > With this patch initial support for the following is added:
> >   - eMMC/SD card
> >   - Buttons
> >   - USB (although no suiting MUIC driver currently)
> >   - UART (untested for lack of equipment)
> >   - WiFi/Bluetooth (WCNSS)
> > 
> > It is worth noting that Samsung J5 with MSM8916 exists in different
> > generations (e.g Samsung J5 2015 and Samsung J5 2016) which each have
> > different models (e.g. samsung-j5nlte, samsung-j5xnlte, etc). This patch
> > is only regarding the 2015 generation, but should work with all of it's
> > models, as far as we could test.
> > 
> > Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../boot/dts/qcom/msm8916-samsung-j5.dts      | 209 ++++++++++++++++++
> >  2 files changed, 210 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6b816eb33309..08bfccb0daeb 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> > new file mode 100644
> > index 000000000000..687bea438a57
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts
> > @@ -0,0 +1,209 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> 
> If you authored this, could we please get it under BSD license?
> 

I'm afraid the same problem applies to all MSM8916-related device trees:
https://lore.kernel.org/linux-arm-msm/YMIznk4scPv1qOzP@gerhold.net/

Given the similarities between the devices it's easiest to take portions
from existing device trees and just change some properties. But this
means that many people were involved and I'm not sure if it is
appropriate to apply a different license without asking all of them.

It's an unfortunate situation that will likely also apply to more
MSM8916 device trees submitted in the future. I hope it's still
acceptable even with the GPL-2.0-only license. :)

> > +
> > +/dts-v1/;
> > +
> > +#include "msm8916-pm8916.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model = "Samsung Galaxy J5 (2015)";
> > +	compatible = "samsung,j5", "qcom,msm8916";
> > +	chassis-type = "handset";
> > +
> > +	aliases {
> > +		serial0 = &blsp1_uart2;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0";
> > +	};
> > +
> > +	reserved-memory {
> > +		/* Additional memory used by Samsung firmware modifications */
> > +		tz-apps@85500000 {
> > +			reg = <0x0 0x85500000 0x0 0xb00000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&gpio_keys_default>;
> > +
> > +		label = "GPIO Buttons";
> > +
> > +		volume-up {
> > +			label = "Volume Up";
> > +			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_VOLUMEUP>;
> > +		};
> > +
> > +		home-key {
> > +			lable = "Home Key";
> > +			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_HOMEPAGE>;
> > +		};
> > +	};
> > +};
> > +
> > +&blsp1_uart2 {
> 
> Can you please sort these nodes alphabetically?
> 

It looks mostly alphabetically ordered to me, could you clarify which
nodes you are referring to exactly?

The exceptions are &smd_rpm_regulators and &msmgpio, which are explicitly
at the end of the file (consistent with all other MSM8916 device trees).
I think it's easier to focus on the main interesting part of the device
tree that way (the device definitions). If you prefer to have strict
alphebtical order I can prepare a bulk patch that changes the order in
all the existing MSM8916 device trees. The most important thing for me
is that they are consistent.

Thanks,
Stephan

> 
> > +	status = "okay";
> > +};
> > +
> > +&pm8916_resin {
> > +	status = "okay";
> > +	linux,code = <KEY_VOLUMEDOWN>;
> > +};
> > +
> > +/* FIXME: Replace with SM5703 MUIC when driver is available */
> > +&pm8916_usbin {
> > +	status = "okay";
> > +};
> > +
> > +&pronto {
> > +	status = "okay";
> > +};
> > +
> > +&sdhc_1 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
> > +	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
> > +};
> > +
> > +&sdhc_2 {
> > +	status = "okay";
> > +
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
> > +	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> > +
> > +	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
> > +};
> > +
> > +&usb {
> > +	status = "okay";
> > +	dr_mode = "peripheral";
> > +	extcon = <&pm8916_usbin>;
> > +};
> > +
> > +&usb_hs_phy {
> > +	extcon = <&pm8916_usbin>;
> > +	qcom,init-seq = /bits/ 8 <0x1 0x19 0x2 0x0b>;
> > +};
> > +
> > +&smd_rpm_regulators {
> > +	vdd_l1_l2_l3-supply = <&pm8916_s3>;
> > +	vdd_l4_l5_l6-supply = <&pm8916_s4>;
> > +	vdd_l7-supply = <&pm8916_s4>;
> > +
> > +	s3 {
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1300000>;
> > +	};
> > +
> > +	s4 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <2100000>;
> > +	};
> > +
> > +	l1 {
> > +		regulator-min-microvolt = <1225000>;
> > +		regulator-max-microvolt = <1225000>;
> > +	};
> > +
> > +	l2 {
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +	};
> > +
> > +	l4 {
> > +		regulator-min-microvolt = <2050000>;
> > +		regulator-max-microvolt = <2050000>;
> > +	};
> > +
> > +	l5 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +	};
> > +
> > +	l6 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +	};
> > +
> > +	l7 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +	};
> > +
> > +	l8 {
> > +		regulator-min-microvolt = <2850000>;
> > +		regulator-max-microvolt = <2900000>;
> > +	};
> > +
> > +	l9 {
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +	};
> > +
> > +	l10 {
> > +		regulator-min-microvolt = <2700000>;
> > +		regulator-max-microvolt = <2800000>;
> > +	};
> > +
> > +	l11 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <2950000>;
> > +		regulator-allow-set-load;
> > +		regulator-system-load = <200000>;
> > +	};
> > +
> > +	l12 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <2950000>;
> > +	};
> > +
> > +	l13 {
> > +		regulator-min-microvolt = <3075000>;
> > +		regulator-max-microvolt = <3075000>;
> > +	};
> > +
> > +	l14 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <3300000>;
> > +	};
> > +
> > +	l15 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <3300000>;
> > +	};
> > +
> > +	l16 {
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <3300000>;
> > +	};
> > +
> > +	l17 {
> > +		regulator-min-microvolt = <3000000>;
> > +		regulator-max-microvolt = <3000000>;
> > +	};
> > +
> > +	l18 {
> > +		regulator-min-microvolt = <2700000>;
> > +		regulator-max-microvolt = <2700000>;
> > +	};
> > +};
> > +
> > +&msmgpio {
> > +	gpio_keys_default: gpio-keys-default {
> > +		pins = "gpio107", "gpio109";
> > +		function = "gpio";
> > +
> > +		drive-strength = <2>;
> > +		bias-pull-up;
> > +	};
> > +};
> > --
> > 2.33.1
> > 

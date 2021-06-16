Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7612C3A9B6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 15:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhFPNFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 09:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbhFPNFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 09:05:05 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7E75C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 06:02:59 -0700 (PDT)
Received: from [192.168.1.79] (bband-dyn73.178-41-129.t-com.sk [178.41.129.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A5A8B3F31F;
        Wed, 16 Jun 2021 15:02:56 +0200 (CEST)
Date:   Wed, 16 Jun 2021 15:02:50 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V3 2/2] arch: arm64: dts: qcom: Add support for Sony
 Xperia 10II
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Message-Id: <QKPSUQ.XAU6NR7VVNJG3@somainline.org>
In-Reply-To: <YMlGb4W1c3VyKeCj@builder.lan>
References: <20210613080522.25230-1-martin.botka@somainline.org>
        <20210613080522.25230-2-martin.botka@somainline.org>
        <YMlGb4W1c3VyKeCj@builder.lan>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Tue, Jun 15 2021 at 07:31:43 PM -0500, Bjorn Andersson 
<bjorn.andersson@linaro.org> wrote:
> On Sun 13 Jun 03:05 CDT 2021, Martin Botka wrote:
> 
>>  This commits add support for Sony Xperia 10II based on the SM6125 
>> SoC.
>> 
>>  Currently working features:
>>  - dmesg output to bootloader preconfigured display
>>  - USB
>>  - eMMC
>>  - Volume down button
>> 
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
>>  Changes in v2, v3:
>>  None
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 105 
>> ++++++++++++++++++
>>   2 files changed, 106 insertions(+)
>>   create mode 100644 
>> arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
>> 
>>  diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>>  index 456502aeee49..5a70dd9593c2 100644
>>  --- a/arch/arm64/boot/dts/qcom/Makefile
>>  +++ b/arch/arm64/boot/dts/qcom/Makefile
>>  @@ -69,6 +69,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= 
>> sdm845-oneplus-enchilada.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>>  +dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>>  diff --git 
>> a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts 
>> b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
>>  new file mode 100644
>>  index 000000000000..b1d6de430273
>>  --- /dev/null
>>  +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
>>  @@ -0,0 +1,105 @@
>>  +// SPDX-License-Identifier: BSD-3-Clause
>>  +/*
>>  + * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>>  + */
>>  +
>>  +/dts-v1/;
>>  +
>>  +#include "sm6125.dtsi"
>>  +#include <dt-bindings/gpio/gpio.h>
>>  +#include <dt-bindings/input/input.h>
>>  +#include <dt-bindings/input/gpio-keys.h>
>>  +
>>  +/ {
>>  +	/* required for bootloader to select correct board */
>>  +	qcom,msm-id = <394 0x10000>; /* sm6125 v1 */
>>  +	qcom,board-id = <34 0>;
>>  +
>>  +	model = "Sony Xperia 10 II";
>>  +	compatible = "sony,pdx201", "qcom,sm6125";
>>  +
>>  +	chosen {
>>  +		#address-cells = <2>;
>>  +		#size-cells = <2>;
>>  +		ranges;
>>  +
>>  +		framebuffer0: framebuffer@5c000000 {
>>  +			compatible = "simple-framebuffer";
>>  +			reg = <0 0x5c000000 0 (2520 * 1080 * 4)>;
>>  +			width = <1080>;
>>  +			height = <2520>;
>>  +			stride = <(1080 * 4)>;
>>  +			format = "a8r8g8b8";
>>  +		};
>>  +	};
>>  +
>>  +	extcon_usb: extcon-usb {
>>  +		compatible = "linux,extcon-usb-gpio";
>>  +		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
>>  +	};
>>  +
>>  +	gpio_keys {
> 
> No '_' in node names, please go '-'.

ack

> 
>>  +		status = "okay";
>>  +		compatible = "gpio-keys";
>>  +		input-name = "gpio-keys";
>>  +		#address-cells = <1>;
>>  +		#size-cells = <0>;
>>  +		autorepeat;
>>  +
>>  +		vol_dn {
> 
> Ditto.

ack

> 
>>  +			label = "Volume Down";
>>  +			gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
>>  +			linux,input-type = <1>;
>>  +			linux,code = <KEY_VOLUMEDOWN>;
>>  +			gpio-key,wakeup;
>>  +			debounce-interval = <15>;
>>  +		};
>>  +	};
>>  +
> 
> Stray indentation on this line.

My bad. Will remove.

> 
> Thanks,
> Bjorn
> 
>>  +	reserved_memory {
>>  +		#address-cells = <2>;
>>  +		#size-cells = <2>;
>>  +		debug_mem: memory@ffb00000 {
>>  +			reg = <0x0 0xffb00000 0x0 0xc0000>;
>>  +			no-map;
>>  +		};
>>  +
>>  +		last_log_mem: memory@ffbc0000 {
>>  +			reg = <0x0 0xffbc0000 0x0 0x80000>;
>>  +			no-map;
>>  +		};
>>  +
>>  +		pstore_mem: ramoops@ffc00000 {
>>  +			compatible = "ramoops";
>>  +			reg = <0x0 0xffc40000 0x0 0xc0000>;
>>  +			record-size = <0x1000>;
>>  +			console-size = <0x40000>;
>>  +			msg-size = <0x20000 0x20000>;
>>  +		};
>>  +
>>  +		cmdline_mem: memory@ffd00000 {
>>  +			reg = <0x0 0xffd40000 0x0 0x1000>;
>>  +			no-map;
>>  +		};
>>  +	};
>>  +};
>>  +
>>  +&hsusb_phy1 {
>>  +	status = "okay";
>>  +};
>>  +
>>  +&sdhc_1 {
>>  +	status = "okay";
>>  +};
>>  +
>>  +&tlmm {
>>  +	gpio-reserved-ranges = <22 2>, <28 6>;
>>  +};
>>  +
>>  +&usb3 {
>>  +	status = "okay";
>>  +};
>>  +
>>  +&usb3_dwc3 {
>>  +	extcon = <&extcon_usb>;
>>  +};
>>  --
>>  2.31.1
>> 



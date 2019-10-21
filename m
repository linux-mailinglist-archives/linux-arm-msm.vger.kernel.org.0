Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B98C5DE44D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfJUGEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:04:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40142 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfJUGEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:04:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so7712756pfb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 23:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VUM8EdX1ZDvK2MjT4PPm05Eny0orr8ox80cAhgwjycY=;
        b=Ayp/mwhD5mnZbfZWGsRyh7968uDtldk4J6TnJqU1mg9puDAVhizQ+al2gxZQsRgq+w
         3X5KGFxrLb+ptyhLMKIVF4697/PzNDzf6mKv+PDM1CLypOyI992x06MakqKrhO+LbXci
         mgZth4Tw/yeUeG6/V3BZlapk9tZPM+BDGT9WRwgSKOdvThSHwM4AdJDxlBc7qH+7zi8l
         JglGcYAlJbDQxdO6KIS/9hOFMAfYTWPaS2YbFu9jwbYyxZr953QYtwoF39cJNqIYEWdN
         ZqWbPiJ2cLPU4KgTsq9Yls79CKFXQPKV0SWT34txuQ09ipUc0zmMf1YsTEhppSXLxsjb
         RRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VUM8EdX1ZDvK2MjT4PPm05Eny0orr8ox80cAhgwjycY=;
        b=db7x07CKEcz0gZeYDPMS+7aOQAQ5mYpH+gDCG89MzyK1S2Z73oHVqbhS9xfW9y9LY4
         X0x7xiFd8T+K8JkxNLEITJhs7JCqyT/D/caXbditvBmrbHceu/A7MvCP4e4Pxz++Vdm1
         suq1C7ECkx/5WmCvoH/QZA31oVv50C2S2zqwDvbYbepk+2AtWVMhg7YYUJqQG4PnoL+0
         voPx6YSWcWzFc9V0BQV6+cXZUS5rwZH+UwPDAZSAudsQzuQRW7gjT/j7Q/uFmZBaQBG0
         HQkx6/0k2KQTR2PsTeKTrdILuebEyB7QSaRxAkXNGln+r0L3FU/8xtIIxU1x3dcQ5EZp
         Jkvg==
X-Gm-Message-State: APjAAAX2Ze9m9HYN/jslLGDTswnEy8B+e4pu6TimKp4zpKUYJRuJ3I6u
        ziToS0fZZHN9AVKKhnruaQ0E9g==
X-Google-Smtp-Source: APXvYqyjkw2/TGDt7dlDu5ptN2fzkkTmRIuKXQZ9/L876fbVIMDbZzFgqgVOBZxJvkEf+lGG9Mox6A==
X-Received: by 2002:aa7:8287:: with SMTP id s7mr21069461pfm.82.1571637871898;
        Sun, 20 Oct 2019 23:04:31 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 22sm12528779pfj.139.2019.10.20.23.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 23:04:30 -0700 (PDT)
Date:   Sun, 20 Oct 2019 23:04:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ccross@android.com, mark.rutland@arm.com, robh+dt@kernel.org,
        agross@kernel.org, marijns95@gmail.com
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Sony Xperia (Loire) X and X
 Compact support
Message-ID: <20191021060428.GA601@tuxbook-pro>
References: <20191020150746.64114-1-kholk11@gmail.com>
 <20191020150746.64114-6-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020150746.64114-6-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 20 Oct 08:07 PDT 2019, kholk11@gmail.com wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire-kugo.dts
[..]
> +&pm8950_l1 {
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1300000>;
> +	qcom,init-voltage = <1200000>;

There's no qcom,init-voltage in the upstream binding.

> +};
> +
> +/* Machine specific pins override */
> +&tlmm {
> +	usb_cable_det_n_gpio: usb_cable_det_n {
> +		mux {

As stated on previous patch, feel free to squash/drop the inner
subnodes.

> +			pins = "gpio107";
> +			function = "gpio";
> +		};
> +		config {
> +			pins = "gpio107";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +			input-enable;
> +		};
> +	};
> +
[..]
> diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
[..]
> +&soc {
> +	blsp2_uart2: serial@7af0000 {

Specify this, disabled, in msm8976.dtsi and just enable it here.

> +		compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
> +		reg = <0x7af0000 0x200>;
> +		interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
> +			 <&gcc GCC_BLSP2_AHB_CLK>;
> +		clock-names = "core", "iface";
> +		dmas = <&blsp2_dma 1>, <&blsp2_dma 0>;
> +		dma-names = "rx", "tx";
> +		status = "okay";
> +	};
> +
> +	gpio_keys {

gpio_keys is not a mmio device, so please move it to /

> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		autorepeat;
> +
[..]
> +&blsp1_uart1 {
> +	status = "disabled";

If you need to disable these nodes in your first board dtsi, then they
should have been disabled in msm8976.dtsi.

> +};
> +
> +&blsp1_uart2 {
> +	status = "disabled";
> +};
> +
> +/* eMMC */
> +&sdhc_1 {
> +	vmmc-supply = <&pm8950_l8>;
> +	vqmmc-supply = <&pm8950_l5>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;

I suggest that you specify a single sdc1_on state with subnodes clk, cmd
and data.

> +
> +	status = "ok";
> +};
> +
[..]
> +&smd_rpm_regulators {
> +	vdd_s1-supply = <&vph_pwr>;
> +	vdd_s2-supply = <&vph_pwr>;
> +	vdd_s3-supply = <&vph_pwr>;
> +	vdd_s4-supply = <&vph_pwr>;
> +	vdd_s5-supply = <&vph_pwr>;
> +	vdd_s6-supply = <&vph_pwr>;
> +	vdd_l1_l19-supply = <&pm8950_s3>;
> +	vdd_l2_l23-supply = <&pm8950_s3>;
> +	vdd_l3-supply = <&pm8950_s3>;
> +	vdd_l4_l5_l6_l7_l16-supply = <&pm8950_s4>;
> +	vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
> +	vdd_l20-supply = <&pm8950_s4>;
> +	vdd_l21-supply = <&pm8950_s4>;
> +
> +	s1 {
> +		regulator-min-microvolt = <1000000>;
> +		regulator-max-microvolt = <1162500>;
> +		qcom,init-voltage = <1000000>;

Again, no qcom,init-voltage...

> +		status = "okay";

You shouldn't need to say "okay" here, it's enabled unless you disable
it.

> +	};
[..]
> +&pm8950_gpios {
> +	cdc_pm_mclk_pin: cdc_pm_mclk {
> +		cdc_pm {

Please drop this inner subnode, it's no longer needed (same goes for the
remainder of nodes in this patch).

> +			pins = "gpio1";
> +			function = "func1"; /* SF1 */
> +			output-low;
> +			bias-disable;
> +			qcom,drive-strength = <2>;
> +			power-source = <2>; /* VIN 2 */
> +		};
> +	};
> +

Keep up the good work!

Regards,
Bjorn

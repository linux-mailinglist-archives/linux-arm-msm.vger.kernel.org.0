Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E2E447FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 13:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238432AbhKHMwJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 07:52:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238465AbhKHMwF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 07:52:05 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EE5C061208;
        Mon,  8 Nov 2021 04:49:03 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id y26so35848656lfa.11;
        Mon, 08 Nov 2021 04:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=ZjzcyKLUrWaAzgml4p3vsZZycwBdsP9HG4bHstAiJSU=;
        b=nC6fsaZcUZct2cm5ewyU4ZkBrKLcqPOeEFjLMv8Ibm3IssHXWz92UwebP/Wx5kxy8O
         CnVcOBM/e9ITEyRp3ZXJpknsXTMVOahL2rG+i/aZzZ03EBkSKt7gxOOSnuqJyQPLfIIZ
         AXTHpi0B2bhGW+QtqhfPnxXG9aa2MaDNOHLqJpE0awcQ6ZM7ZW2VQzcC23Mo+V+YOmYs
         JNMIsD0RAS1wZXWdXQLERD3/zc9WJ1W+mkKmKgeJb1XIvEQQEQM4u7pnggBf5KCk3/WZ
         jmH4hhuAn1bAu09CzwyUUhebnTCtK3Jb4xDbEHOicZeusIhVDzlJsV0/pfonZcslZ5rv
         zreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZjzcyKLUrWaAzgml4p3vsZZycwBdsP9HG4bHstAiJSU=;
        b=A285/tN9lZLFf/mGDvO8LsO76bOkNm2YN/Qnk70WtmB6GBtElArKEZT89x6etx5Uc3
         WK1LBTgCvJ3A/qIVQvSl2PW+i8OxS91DY46YK/Oc4LQqVS4ms/ywebnBbNXJXCcaPAb5
         rBoWpxkG36jUq6UA6nrHsNMcJKm73/7mreQRlkRTKzLk2JF+w/B704IGnhkWbNTFDkqt
         skvTVxOYWH6OO1AbJyjkjMWO4uooOjuxeHqrsKZYOvxbHBdoU4Q2cOxff/NrG3Hr1ztc
         zYP3AhlGZquWv+XBQio0yVohgC80+qPdP8tVI9W7Fw8xVPfUjaOfzZ/g0vC7AQFWr2G4
         WSGw==
X-Gm-Message-State: AOAM531fAvsGHJMfJdP2SwlaEh4n+m1zrp7EfjgGmTdF/f9mUsMcYu43
        QF6YrMfdtZrfBDzaIn2D2jouaSazcyQ=
X-Google-Smtp-Source: ABdhPJxcGyI1k9uTyYdtyqZqelHPgwOMWS5Sqx6v8E4hR2ztU0tCWSfve6uEpopWJTlIfzhdIHU1PQ==
X-Received: by 2002:a05:6512:401b:: with SMTP id br27mr5734991lfb.274.1636375741299;
        Mon, 08 Nov 2021 04:49:01 -0800 (PST)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl. [194.29.137.1])
        by smtp.gmail.com with ESMTPSA id b27sm184275ljf.52.2021.11.08.04.49.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 04:49:01 -0800 (PST)
Message-ID: <87d026dd-f7a1-36ac-2a6f-e9c7c65be77e@gmail.com>
Date:   Mon, 8 Nov 2021 13:48:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add RPM
 and fixed regulators
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org,
        Caleb Connolly <caleb@connolly.tech>
References: <20211108050336.3404559-1-danct12@riseup.net>
 <20211108050336.3404559-3-danct12@riseup.net>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20211108050336.3404559-3-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 08/11/2021 06:03, Dang Huynh wrote:
> Add most of the RPM PM660/PM660L regulators and the fixed ones,
> defining the common electrical part of this platform.
>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 294 ++++++++++++++++++
>   1 file changed, 294 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 1edc53fd6941..365a03b56cde 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -1,11 +1,14 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2020, Alexey Minnekhanov <alexey.min@gmail.com>
> + * Copyright (c) 2021, Dang Huynh <danct12@riseup.net>
>    */
>   
>   /dts-v1/;
>   
>   #include "sdm660.dtsi"
> +#include "pm660.dtsi"
> +#include "pm660l.dtsi"
>   
>   / {
>   	model = "Xiaomi Redmi Note 7";
> @@ -20,6 +23,14 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

You need to specify a voltage range for this regulator.



> +
>   	reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> @@ -40,6 +51,289 @@ &blsp1_uart2 {
>   	status = "okay";
>   };
>   
> +&rpm_requests {
> +	pm660l-regulators {
> +		compatible = "qcom,rpm-pm660l-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +
> +		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
> +		vdd_l2-supply = <&vreg_bob>;
> +		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
> +		vdd_l4_l6-supply = <&vreg_bob>;
> +		vdd_bob-supply = <&vph_pwr>;
> +
> +		vreg_s1b_1p125: s1 {
> +			regulator-min-microvolt = <1125000>;
> +			regulator-max-microvolt = <1125000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_s2b_1p05: s2 {
> +			regulator-min-microvolt = <1050000>;
> +			regulator-max-microvolt = <1050000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		/* LDOs */
> +		vreg_l1b_0p925: l1 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <925000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		// SDHCI 3.3V signal doesn't seem to be supported.

C-style comments, please.



> +		vreg_l2b_2p95: l2 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <2696000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l3b_3p3: l3 {
> +			regulator-min-microvolt = <1700000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l4b_2p95: l4 {
> +			regulator-min-microvolt = <2944000>;
> +			regulator-max-microvolt = <2952000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +
> +			regulator-min-microamp = <200>;
> +			regulator-max-microamp = <600000>;
> +			regulator-system-load = <570000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		/*
> +		 * Downstream specifies a range of 1721-3600mV,
> +		 * but the only assigned consumers are SDHCI2 VMMC
> +		 * and Coresight QPDI that both request pinned 2.95V.
> +		 * Tighten the range to 1.8-3.328 (closest to 3.3) to
> +		 * make the mmc driver happy.
> +		 */
> +		vreg_l5b_2p95: l5 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3328000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +			regulator-system-load = <800000>;
> +		};
> +
> +		vreg_l7b_3p125: l7 {
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3125000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l8b_3p3: l8 {
> +			regulator-min-microvolt = <3200000>;
> +			regulator-max-microvolt = <3400000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-enable-ramp-delay = <500>;
> +			regulator-ramp-delay = <0>;
> +		};
> +	};
> +
> +	pm660-regulators {
> +		compatible = "qcom,rpm-pm660-regulators";
> +
> +		vdd_s1-supply = <&vph_pwr>;
> +		vdd_s2-supply = <&vph_pwr>;
> +		vdd_s3-supply = <&vph_pwr>;
> +		vdd_s4-supply = <&vph_pwr>;
> +		vdd_s5-supply = <&vph_pwr>;
> +		vdd_s6-supply = <&vph_pwr>;
> +
> +		vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
> +		vdd_l2_l3-supply = <&vreg_s2b_1p05>;
> +		vdd_l5-supply = <&vreg_s2b_1p05>;
> +		vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
> +		vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
> +
> +		/*
> +		 * S1A (FTAPC0), S2A (FTAPC1), S3A (HFAPC1) are managed
> +		 * by the Core Power Reduction hardened (CPRh) and the
> +		 * Operating State Manager (OSM) HW automatically.
> +		 */
> +
> +		vreg_s4a_2p04: s4 {
> +			regulator-min-microvolt = <1805000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +		};
> +
> +		vreg_s5a_1p35: s5 {
> +			regulator-min-microvolt = <1224000>;
> +			regulator-max-microvolt = <1350000>;
> +			regulator-enable-ramp-delay = <200>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_s6a_0p87: s6 {
> +			regulator-min-microvolt = <504000>;
> +			regulator-max-microvolt = <992000>;
> +			regulator-enable-ramp-delay = <150>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		/* LDOs */
> +		vreg_l1a_1p225: l1 {
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1250000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l2a_1p0: l2 {
> +			regulator-min-microvolt = <950000>;
> +			regulator-max-microvolt = <1010000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l3a_1p0: l3 {
> +			regulator-min-microvolt = <950000>;
> +			regulator-max-microvolt = <1010000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l5a_0p848: l5 {
> +			regulator-min-microvolt = <525000>;
> +			regulator-max-microvolt = <950000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l6a_1p3: l6 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1370000>;
> +			regulator-allow-set-load;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l7a_1p2: l7 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l8a_1p8: l8 {
> +			regulator-min-microvolt = <1750000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-system-load = <325000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l9a_1p8: l9 {
> +			regulator-min-microvolt = <1750000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l10a_1p8: l10 {
> +			regulator-min-microvolt = <1780000>;
> +			regulator-max-microvolt = <1950000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +
> +		vreg_l11a_1p8: l11 {
> +			regulator-min-microvolt = <1780000>;
> +			regulator-max-microvolt = <1950000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l12a_1p8: l12 {
> +			regulator-min-microvolt = <1780000>;
> +			regulator-max-microvolt = <1950000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		/* This gives power to the LPDDR4: never turn it off! */
> +		vreg_l13a_1p8: l13 {
> +			regulator-min-microvolt = <1780000>;
> +			regulator-max-microvolt = <1950000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-boot-on;
> +			regulator-always-on;
> +		};
> +
> +		vreg_l14a_1p8: l14 {
> +			regulator-min-microvolt = <1710000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l15a_1p8: l15 {
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <2950000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l16a_2p7: l16 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +		};
> +
> +		vreg_l17a_1p8: l17 {
> +			regulator-min-microvolt = <1648000>;
> +			regulator-max-microvolt = <2952000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +		};
> +
> +		vreg_l19a_3p3: l19 {
> +			regulator-min-microvolt = <3312000>;
> +			regulator-max-microvolt = <3400000>;
> +			regulator-enable-ramp-delay = <250>;
> +			regulator-ramp-delay = <0>;
> +			regulator-allow-set-load;
> +		};
> +	};
> +};
> +
>   &tlmm {
>   	gpio-reserved-ranges = <8 4>;
>   };


Konrad


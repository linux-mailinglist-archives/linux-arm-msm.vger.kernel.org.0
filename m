Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E115B579577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 10:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbiGSIpc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 04:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237095AbiGSIpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 04:45:25 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801963719D
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 01:45:23 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u14so8569619lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LHAH2NUYMzb+gHfcEBuvD4gwfDzYc08nLpdMrmdwOds=;
        b=Hf9qT2AJbfpICrSD29yZqmB+mj74t94EVQm/cDU27MwXePgAv60Zqe/IGKC6QfaHqX
         oPGp6p7bAzCk4E/G1lVcQd6453VNPIKBNsqjEZZq/bo3SzpoiX1fxUOzeFZ/PH8otp0u
         fpt/WgEL4QCLjfcYItFky4eNh6+nv35duK4nHl1hTqxWtKJxZWM9GEpKtMXELx9z78FM
         C1GQ3bcMHwmSv8UOdrEq99obVrhfqtYf61BU+tNzMGRsH6g+xYebpdsrZa1YVpwTBKoW
         KHoYvup0QCKtBKXnfOQoNRrm3mmDAzoYNuC6SURvQYbeLhxCDLGd8Y6bXICw+jHnL727
         aljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LHAH2NUYMzb+gHfcEBuvD4gwfDzYc08nLpdMrmdwOds=;
        b=3sTw/v+4p8J0S2zI+oRfpBkFmjx9/sOmy9QDHtVkYkqsJ5ucycAGyEmeT+awGLsWOo
         WaQzwdSesiSzVPxTanyFr4yXralqhjiuHXIFVkpKkavBJbxgbJWJMZdHbrjFhSJc7jD3
         7pmlCzJcpCrFAk3U0THOHs3r0vT7S4OzOP0rtkIYoqTvX032L4thhHN33ZD+Ww2OWNwQ
         EhmRo6bIqY3aXwA3vI6z0fjemD3wUMjBVQ+xM0d7divfbRYT0dCb4JBHEhOrFNA/hclK
         PkJprYzIIVj5stYpS8wToDB8CBoVIeuKUzi1YWPUynaXZnVtU0BGAaHFYo75U0EVXgcZ
         TbHQ==
X-Gm-Message-State: AJIora9e2aCkmC8LpD4t04F4p//zmgAEDlYb4dEmDBMorlBw7zYrnGnn
        o41KJfjDA7mvDPGZ+9KP503xUg==
X-Google-Smtp-Source: AGRyM1vKeOohI6tFEuXQpGxF2ieOs2+QyZ+WNG0CgTqglEypV3aVfrKO6JATeAaSINVOUSbnRvz2qA==
X-Received: by 2002:a2e:bc19:0:b0:25d:9c9e:d13a with SMTP id b25-20020a2ebc19000000b0025d9c9ed13amr10597512ljf.91.1658220321753;
        Tue, 19 Jul 2022 01:45:21 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id d42-20020a0565123d2a00b004795d64f37dsm3081322lfv.105.2022.07.19.01.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 01:45:21 -0700 (PDT)
Message-ID: <f988df59-d56f-51ae-dc64-a09db305ce1c@linaro.org>
Date:   Tue, 19 Jul 2022 10:45:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel
 3)
Content-Language: en-US
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Amit Pundir <amit.pundir@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220718213051.1475108-3-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/07/2022 23:30, Caleb Connolly wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> This adds an initial dts for the Blueline (Pixel 3). Supported
> functionality includes display, Debug UART, UFS, USB-C (peripheral), WiFi,
> Bluetooth and modem.
> 

Thank you for your patch. There is something to discuss/improve.

(...)

> +	volume-keys {
> +		compatible = "gpio-keys";
> +		label = "Volume keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&volume_up_gpio>;
> +
> +		vol-up {

key-vol-up
(DT schema requires it now)

> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <15>;
> +		};
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		mpss_region: memory@8e000000 {
> +			reg = <0 0x8e000000 0 0x9800000>;
> +			no-map;
> +		};
> +
> +		venus_mem: venus@97800000 {
> +			reg = <0 0x97800000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: cdsp-mem@97D00000 {
> +			reg = <0 0x97D00000 0 0x800000>;
> +			no-map;
> +		};
> +
> +		mba_region: mba@98500000 {
> +			reg = <0 0x98500000 0 0x200000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: slpi@98700000 {
> +			reg = <0 0x98700000 0 0x1400000>;
> +			no-map;
> +		};
> +
> +		spss_mem: spss@99B00000 {
> +			reg = <0 0x99B00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		/* rmtfs lower guard */
> +		memory@f2700000 {
> +			reg = <0 0xf2700000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@f2701000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0xf2701000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		/* rmtfs upper guard */
> +		memory@f2901000 {
> +			reg = <0 0xf2901000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	vreg_s4a_1p8: vreg-s4a-1p8 {

Please use consistent naming, so if previous was "xxx-regulator", keep
similar pattern here.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&adsp_pas {

(...)

> +
> +&pm8998_gpio {
> +	volume_up_gpio: vol-up-active {

The bindings require node name to finish with "-state"

> +		pins = "gpio6";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		qcom,drive-strength = <0>;
> +	};
> +
> +	panel_pmgpio_pins: panel-pmgpio-active {

Ditto.

> +		pins = "gpio2", "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-disable;
> +		power-source = <0>;
> +	};
> +};
> +
> +&pm8998_pon {
> +	resin {
> +		compatible = "qcom,pm8941-resin";
> +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +		debounce = <15625>;
> +		bias-pull-up;
> +		linux,code = <KEY_VOLUMEDOWN>;
> +	};
> +};
> +
Best regards,
Krzysztof

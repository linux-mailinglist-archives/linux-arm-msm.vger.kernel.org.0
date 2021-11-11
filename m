Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C123044DD35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 22:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbhKKVnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 16:43:24 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:37589 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbhKKVnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 16:43:23 -0500
Received: from [192.168.1.101] (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C43691FECE;
        Thu, 11 Nov 2021 22:40:31 +0100 (CET)
Message-ID: <80190e08-0303-be47-9df1-b4367843623f@somainline.org>
Date:   Thu, 11 Nov 2021 22:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB
Content-Language: en-US
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexey Min <alexey.min@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Martin Botka <martin.botka@somainline.org>
References: <20211111031635.3839947-1-danct12@riseup.net>
 <20211111031635.3839947-9-danct12@riseup.net>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20211111031635.3839947-9-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.11.2021 04:16, Dang Huynh wrote:
> From: Alexey Min <alexey.min@gmail.com>
> 
> Enable and configure DWC3 and QUSB2 PHY to enable USB
> functionality on the Redmi Note 7.
> 
> Signed-off-by: Alexey Min <alexey.min@gmail.com>
> Co-developed-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>  .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 712392545c2e..bf7f334b0b5c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -80,6 +80,15 @@ framebuffer_mem: memory@9d400000 {
>  			no-map;
>  		};
>  	};
> +
> +	/*
> +	 * Until we hook up type-c detection, we
> +	 * have to stick with this. But it works.
> +	 */
> +	extcon_usb: extcon-usb {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +	};
>  };
>  
>  &blsp1_uart2 {
> @@ -96,6 +105,13 @@ &pon_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  };
>  
> +&qusb2phy {
> +	status = "okay";
> +
> +	vdd-supply = <&vreg_l1b_0p925>;
> +	vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
> +};
> +
>  &rpm_requests {
>  	pm660l-regulators {
>  		compatible = "qcom,rpm-pm660l-regulators";
> @@ -401,3 +417,12 @@ &sdhc_2 {
>  &tlmm {
>  	gpio-reserved-ranges = <8 4>;
>  };
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "peripheral";
> +	extcon = <&extcon_usb>;
> +};

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

On a side note, I wonder if any of the more interesting USB-C lanes (say DP out or USB3 [at least for host mode])
are connected on this device..

Konrad

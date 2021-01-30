Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526E03096A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 17:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhA3QUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 11:20:37 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:49247 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbhA3Pot (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 10:44:49 -0500
Received: from [192.168.1.101] (abaf219.neoplus.adsl.tpnet.pl [83.6.169.219])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 542643EBA4;
        Sat, 30 Jan 2021 16:42:38 +0100 (CET)
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: msm8916-alcatel-idol347: Add
 framebuffer support
To:     Vincent Knecht <vincent.knecht@mailoo.org>,
        phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        allen <allen.chen@ite.com.tw>,
        Max Merchel <Max.Merchel@tq-group.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210130105717.2628781-1-vincent.knecht@mailoo.org>
 <20210130105717.2628781-5-vincent.knecht@mailoo.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <8edef364-e60e-2bc1-ffef-1f30dd2fffaf@somainline.org>
Date:   Sat, 30 Jan 2021 16:42:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210130105717.2628781-5-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 30.01.2021 11:57, Vincent Knecht wrote:
> Add simple-framebuffer support and related reserved-memory block.
>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  .../boot/dts/qcom/msm8916-alcatel-idol347.dts | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> index 540b1fa4b260..e4d22cec8ff0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
> @@ -3,6 +3,7 @@
>  /dts-v1/;
>  
>  #include "msm8916-pm8916.dtsi"
> +#include <dt-bindings/clock/qcom,gcc-msm8916.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  
> @@ -16,6 +17,36 @@ aliases {
>  
>  	chosen {
>  		stdout-path = "serial0";
> +
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@83200000 {
> +			status = "okay";
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0x83200000 0x0 (720 * 1280 * 3)>;
> +			width = <720>;
> +			height = <1280>;
> +			stride = <(720 * 3)>;
> +			format = "r8g8b8";
> +			power-domains = <&gcc MDSS_GDSC>;
> +			clocks = <&gcc GCC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_MDSS_VSYNC_CLK>,
> +				 <&gcc GCC_MDSS_AXI_CLK>,
> +				 <&gcc GCC_MDSS_MDP_CLK>,
> +				 <&gcc GCC_MDSS_BYTE0_CLK>,
> +				 <&gcc GCC_MDSS_PCLK0_CLK>,

I'm not sure about BYTE/PCLK, it used to cause issues at least on my boards, but if it works for you, I guess it's only good.


> +				 <&gcc GCC_MDSS_ESC0_CLK>,
> +				 <&xo_board>;

Fake XO seems redundant here.


> +		};
> +	};
> +
> +	reserved-memory {
> +		continuous_splash: framebuffer@83000000 {
> +			reg = <0x0 0x83000000 0x0 0x1400000>;
> +			no-map;
> +		};
>  	};
>  
>  	gpio-keys {
>

Konrad


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D90B5ABEEE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Sep 2022 14:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiICMZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Sep 2022 08:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiICMZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Sep 2022 08:25:22 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B2D356D8
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Sep 2022 05:25:21 -0700 (PDT)
Received: from [192.168.1.101] (afbd23.neoplus.adsl.tpnet.pl [95.49.29.23])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B82551F5FA;
        Sat,  3 Sep 2022 14:25:19 +0200 (CEST)
Message-ID: <66cf4000-34fc-46b4-1a43-50f4c8db9b78@somainline.org>
Date:   Sat, 3 Sep 2022 14:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add pm7250b
 PMIC
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220902111055.106814-1-luca.weiss@fairphone.com>
 <20220902111055.106814-3-luca.weiss@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220902111055.106814-3-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2.09.2022 13:10, Luca Weiss wrote:
> The PM7250B is primarily used for charger and fuel gauge on Fairphone 4
> but also has some thermal zones that we can configure already.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index c76abe7587b4..30c94fd4fe61 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -12,6 +12,7 @@
>  #include "sm7225.dtsi"
>  #include "pm6150l.dtsi"
>  #include "pm6350.dtsi"
> +#include "pm7250b.dtsi"
>  
>  / {
>  	model = "Fairphone 4";
> @@ -70,6 +71,36 @@ memory@efe01000 {
>  			qcom,vmid = <15>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		chg-skin-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		conn-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&pm7250b_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &adsp {
> @@ -353,6 +384,42 @@ &pm6350_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  };
>  
> +&pm7250b_adc {
> +	adc-chan@4d {
> +		reg = <ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "charger_skin_therm";
> +	};
> +
> +	adc-chan@4f {
> +		reg = <ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		label = "conn_therm";
> +	};
> +};
> +
> +&pm7250b_adc_tm {
> +	status = "okay";
> +
> +	charger-skin-therm@0 {
> +		reg = <0>;
> +		io-channels = <&pm7250b_adc ADC5_AMUX_THM1_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
Reverse-Christmas-tree would have been nicer here and above, in pm7250b_adc,
but for the code itself:

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
> +	};
> +
> +	conn-therm@1 {
> +		reg = <1>;
> +		io-channels = <&pm7250b_adc ADC5_AMUX_THM3_100K_PU>;
> +		qcom,ratiometric;
> +		qcom,hw-settle-time-us = <200>;
> +	};
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };

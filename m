Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C3F619948
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbiKDOTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbiKDOTH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:19:07 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B68C2FFC2
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:19:05 -0700 (PDT)
Received: from [192.168.31.208] (unknown [194.29.137.22])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2FCD63F336;
        Fri,  4 Nov 2022 15:19:03 +0100 (CET)
Message-ID: <4ef7cab8-9f37-2720-2cc8-9e64052563ef@somainline.org>
Date:   Fri, 4 Nov 2022 15:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04/11/2022 14:13, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
>
> Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
> nodes
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 45 +++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 9522dd29a38a..f37f226e9b11 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -20,6 +20,17 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	hdmi-out {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&lt9611_out>;
> +			};
> +		};
> +	};
> +
>   	lt9611_1v2: lt9611-vdd12-regulator {
>   		compatible = "regulator-fixed";
>   		regulator-name = "LT9611_1V2";
> @@ -389,6 +400,26 @@ lt9611_codec: hdmi-bridge@2b {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
>   
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				lt9611_a: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				lt9611_out: endpoint {
> +					remote-endpoint = <&hdmi_con>;
> +				};
> +			};
> +		};
>   	};
>   };
>   
> @@ -512,9 +543,23 @@ &mdss_mdp {
>   	status = "okay";
>   };
>   
> +&dispcc {
> +	status = "okay";
> +};

Please sort this alphabetically (though I think it's gonna be ok after 
you fix it in 3/5).


With that:


Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>


Konrad

> +
>   &dsi0 {
>   	status = "okay";
>   	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +
>   };
>   
>   &dsi0_phy {

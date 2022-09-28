Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5F155EE2CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbiI1ROC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234655AbiI1RNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:13:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A26BF089C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:13:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d42so21449278lfv.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=M7Ue80YEuoCIOWAQgLo+SUfvh7l5ryKbVSWPKQvrAK8=;
        b=enrbMhtk9diLQuM0JIaOskWc0RZbLWujXPbpp8llfK1JzNHr/Ao5mHKJgX5cRyxJl+
         UxcaKHCLtKXdNJ8ffRnyk9bu3nDO8RQ9N7+YFcb7rnhcpDvyklU8oFqZRLjLrPtEmGAX
         DXBCiEv75cKbVwm7HDq6WrbELs3yzDvbNWicuv0DWPd0ppLi7MjfcPetH+Xx/oqo+7eE
         MooRxoHtCJSsmsJr5EBzfb/lmehuQjTOe9pjgzGp/tw9oS50oxJ7nD7mVigH8We5a1oU
         zcdzxm1J864V3A2ltTHosFPf51vgisyNWJvRDVUqINWAsHbwP5C+wlfzrc6RLeAu9JSk
         Jfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=M7Ue80YEuoCIOWAQgLo+SUfvh7l5ryKbVSWPKQvrAK8=;
        b=ryZFieJwJn78GM9VxtfoHgozEeUk8pYFSm897BsXbEWfVDJSu974rkIKPXCuyKEqGi
         0S8jTpL+QGcY2WnTj8nsfdwby/7JbZodwjaaapYmMKk9roA43cZ2uM5QqEftuR8ehYkO
         xALmQ3ZGMeFUtPGEc9M0lO+lkYmXmaAnmLLNjYJeuL80PunHaltZxrYuA2NhuMguNlV/
         dU1yzvnk0mNYbFpUOd4Mv3v95Sm+t/rZQme6cLiuS3Tn+vggMP2RH6w4jIdFi0h4wcUQ
         yZqH+M4ExlnzAbeEYkKEx2fk4SJHbPvkTBOD7UqKPLc7N05bT1crMOe6JgV3zBOx4uY1
         AIUg==
X-Gm-Message-State: ACrzQf2iMVauZDtTZtpCtQdaXWTioTvcqoQvM1/R9heuV3ijsWxT1lZi
        5BV3piqiOXTBD+T9ALVNuUf17e5SOgOStg==
X-Google-Smtp-Source: AMsMyM40BhxbF90DTbMrHArQq6jsjUGS9GskBzU5zFLkvrYuTSg8rAT4p0UOIgA/KNm/I1giiYdt7w==
X-Received: by 2002:ac2:4c48:0:b0:4a0:606f:3e85 with SMTP id o8-20020ac24c48000000b004a0606f3e85mr10878909lfk.675.1664385180613;
        Wed, 28 Sep 2022 10:13:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q5-20020a2eb4a5000000b0026c2d2a9b92sm476056ljm.101.2022.09.28.10.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:13:00 -0700 (PDT)
Message-ID: <06c01215-1423-9834-10fa-234394d13381@linaro.org>
Date:   Wed, 28 Sep 2022 19:12:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 09/11] ARM: dts: qcom: msm8974: add second DSI host and
 PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-10-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145958.376288-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Add second DSI host and PHY available on the msm8974 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 78 +++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 7a9be0acf3f5..810a163ca14f 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1541,6 +1541,13 @@ mdp5_intf1_out: endpoint {
>  							remote-endpoint = <&dsi0_in>;
>  						};
>  					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdp5_intf2_out: endpoint {
> +							remote-endpoint = <&dsi1_in>;
> +						};
> +					};
>  				};
>  			};
>  
> @@ -1614,6 +1621,77 @@ dsi0_phy: dsi-phy@fd922a00 {
>  
>  				status = "disabled";
>  			};
> +
> +			dsi1: dsi@fd922e00 {
> +				compatible = "qcom,mdss-dsi-ctrl";
> +				reg = <0xfd922e00 0x1f8>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +
> +				clocks = <&mmcc MDSS_MDP_CLK>,
> +					 <&mmcc MDSS_AHB_CLK>,
> +					 <&mmcc MDSS_AXI_CLK>,
> +					 <&mmcc MDSS_BYTE1_CLK>,
> +					 <&mmcc MDSS_PCLK1_CLK>,
> +					 <&mmcc MDSS_ESC1_CLK>,
> +					 <&mmcc MMSS_MISC_AHB_CLK>;
> +				clock-names = "mdp_core",
> +					      "iface",
> +					      "bus",
> +					      "byte",
> +					      "pixel",
> +					      "core",
> +					      "core_mmss";
> +
> +				phys = <&dsi1_phy>;
> +				phy-names = "dsi-phy";

I think this is being removed, isn't it?

> +
> +				status = "disabled";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi1_in: endpoint {
> +							remote-endpoint = <&mdp5_intf2_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi1_phy: dsi-phy@fd923000 {

And this you change into "phy"?


Best regards,
Krzysztof


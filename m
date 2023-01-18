Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBC7C6718FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 11:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjARKcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 05:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjARKcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 05:32:02 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2386BBF5C6
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:38:43 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id k16so3557404wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZxTnp3Npz1Tte/ZE8Vd7P7S6MdljdFRxG8kEcYbuJQ=;
        b=SCP3+jgvBgyq/FMosCs2Ti4db7bO2NWOMYzjIq1L8tSshlI1+Ih9SyzcE6ewY8rPDC
         c6+qtWctQlY9heHHdOuWDVVebJr8htYBNyqPsZ76RwLzHtt85zjMDXIXJxTEvAUd+SjP
         BIGK4Eh3Rp8uEjEyVImPSpC8AMmlhgIDimEJuJJdsil8CB8ep95xobWlWydIb2p2HZrg
         kWLhVGP0tVlQ123V0qHo54kITg9VKBbZKYsZZSIzezrDPmIO0EaYOPKKeipr56OIBl2+
         mvoKVyunYDPDeLg8gIGOzGnf/l+sTohjzHYngq3T4d3E4ytrn41BqJOvSjcJbFGR6Ff5
         LO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZxTnp3Npz1Tte/ZE8Vd7P7S6MdljdFRxG8kEcYbuJQ=;
        b=Y+a1kASGY/0aHkmVT9vZ45Sl8wM1Wz6P05BozifVYyTx8hukxWFXzAFBfwTcvLsMgw
         yM+PS3xHHSmkt2wLR5u+o1Swz09TB0BhUIxM0jEMx9JQj2w25hLtXWi6e4Ncg50Grrog
         lrJrTovQdHKDsX9fmuTYTXu4zA0Ri3dCftlf4yN+/eYm7EfSrAh1coV6MdcPWKpGaNev
         Y0Q0XMgReZg1hgjHTShnskf4Xrp2LRPqHM5x/OHQyDyeJqHFQjfk+paluPZHaxCLnK/E
         xrY/qxi0QKYLgMafxoJeTf+ZL2qrkA7tFjf42AeoxCiqp6QY9nAU8qrI8BAPq+VYXeO/
         F9Gg==
X-Gm-Message-State: AFqh2krqvbdTusrf/KKS4D+E4OZsilnCNiINhs7KxBP3y6erwxh9kaKN
        y0u4vGIaAR0OwiwsIww3azyKKA==
X-Google-Smtp-Source: AMrXdXsYoE/X+tur8D8Y4HUsrTDZ5kPechbWqBqgYkUk4dJ6zb+zP4K4F7vhQPSm3683B90FQPZxMA==
X-Received: by 2002:a05:600c:4928:b0:3d3:4aa6:4fe6 with SMTP id f40-20020a05600c492800b003d34aa64fe6mr6052812wmp.3.1674034713891;
        Wed, 18 Jan 2023 01:38:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e12-20020a05600c218c00b003d9ddc82450sm1314497wme.45.2023.01.18.01.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 01:38:33 -0800 (PST)
Message-ID: <0bea53cb-4577-2eab-527d-a74824812bf6@linaro.org>
Date:   Wed, 18 Jan 2023 10:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8550-mtp: add DSI panel
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230104-topic-sm8550-upstream-dts-display-v3-0-46f0d4e57752@linaro.org>
 <20230104-topic-sm8550-upstream-dts-display-v3-3-46f0d4e57752@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230104-topic-sm8550-upstream-dts-display-v3-3-46f0d4e57752@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 09:55, Neil Armstrong wrote:
> Add nodes for the Visionox VTDR6130 found on the SM8550-MTP
> device.
> 
> TLMM states are also added for the Panel reset GPIO and
> Tearing Effect signal for when the panel is running in
> DSI Command mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 56 +++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 0dfd1d3db86c..2de387aa2c2d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -370,6 +370,34 @@ &mdss {
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l3e_1p2>;
>  	status = "okay";
> +
> +	panel@0 {
> +		compatible = "visionox,vtdr6130";
> +		reg = <0>;
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
> +
> +		vddio-supply = <&vreg_l12b_1p8>;
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p2>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		status = "okay";

No need unless you override existing device node.

> +
> +		port {
> +			panel0_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
Best regards,
Krzysztof


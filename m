Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E827B6C5377
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 19:16:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbjCVSQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 14:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjCVSQx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 14:16:53 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DEC64228
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:16:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so24527268lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679509010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Jvs1xrLwrNQQ4RSyjH1t+/FTl15pE2eQYewVtTpktU=;
        b=SYtHlAy116u32i5WTaiPvBLFHjuG+UC/JIXcyNIA5v3x5L8U+7BfXyA52lsU0jyvkX
         bXpaQMeDgLLEWn6zz5v7OZqy3cj5QR/xsSSeSR16v5NFIFvt55c/64v/MJD0R+OIZWyn
         KDcO7M3zB2hDgGfQsvqNjoSMQJ+kkLi1MhCsJAGusz/IejVRu7qEkI0MFVIWwzTeBh9/
         JCxSfUHYEjjjKjg/6dZIe5LzeDeyCBT7n5gOiXeQnMiACSK1kyy6EZ6+pqJKpeJfWj/X
         Jzad58Skp3ldyTpUhdvNw1VAo/4ZY/J2zZmxfOBkWJjyRKmWfbEzlgfT5TlMyZNoi11E
         E1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jvs1xrLwrNQQ4RSyjH1t+/FTl15pE2eQYewVtTpktU=;
        b=0oczWo4bssQaX8sZ4um2slzp7BoN9hB5TQSeXrqprBGezp+xpGS83TCVnD4nUwI8Yw
         6kJtwUy0Weex2jTSmcSGvMFuyDb3/xzlUO4Sz0xUagGiaPPm8npDJEkMD1x2wHFVvmJ6
         eCZpvJw8xHs+uB9nic3+v7qYgmw+HI7tvswulPapVDTw7lHxlWPg6556AugfR5pBaK8e
         J/9wFq+JiTmhIjKTrqhtNO5sLOVxCA6LirtQnlzT2kJHkzASNA9FpyZcDFL2cI24cQ60
         LVKQvEqupRbRi35moxAaH2Yb7wMx7WLjm6xBB822XakegvIAyqnN+76BYz7y1XMQBKgg
         3Erg==
X-Gm-Message-State: AO0yUKXzt1BRkC1JxleLKUZvjIA6WjXUCu8l8spCVPL8sOqi+Ertjks8
        k93rUvUHVUr/JLwEHm1fp0RWpA==
X-Google-Smtp-Source: AK7set+fLoVTA6hr132qva8LSEj0pfzjQ3CRhGCxuMohwD7zHa35QrFFPQu9QKQddw8F89iiNrfcxw==
X-Received: by 2002:ac2:4310:0:b0:4dd:af76:d3c with SMTP id l16-20020ac24310000000b004ddaf760d3cmr2012118lfh.48.1679509009739;
        Wed, 22 Mar 2023 11:16:49 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id y2-20020ac24202000000b004b53eb60e3csm2651938lfh.256.2023.03.22.11.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 11:16:49 -0700 (PDT)
Message-ID: <fcd5d524-a35f-b91b-be35-bd68643a4bdc@linaro.org>
Date:   Wed, 22 Mar 2023 19:16:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8250-xiaomi-elish: Add mdss
 and dsi node
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230322171555.2154-1-lujianhua000@gmail.com>
 <20230322171555.2154-2-lujianhua000@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230322171555.2154-2-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.03.2023 18:15, Jianhua Lu wrote:
> xiaomi-elish uses dual dsi mode panel and dsi phy type is cphy.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> Changes in v2:
>   - Include missing <dt-bindings/phy/phy.h> for phy-type property.
> 
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index a43d4b73ffca..4ff8454d4abe 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/phy/phy.h>
'p' < 'r'


>  #include "sm8250.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -469,6 +470,74 @@ &cdsp {
>  	status = "okay";
>  };
>  
> +&dsi0 {
> +	vdda-supply = <&vreg_l9a_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,master-dsi;
Keep the master property after qcom,sync-dual-dsi so that we
get a nice reverse-Christmas-tree.

> +	qcom,sync-dual-dsi;
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		vddio-supply = <&vreg_l14a_1p88>;
> +		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +		backlight = <&backlight>;
> +
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
Please add newlines before subnodes.

Konrad
> +				panel_in_0: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1{
> +				reg = <1>;
> +				panel_in_1: endpoint {
> +					remote-endpoint = <&dsi1_out>;
> +				};
> +			};
> +
> +		};
> +	};
> +};
> +
> +&dsi0_out {
> +	data-lanes = <0 1 2>;
> +	remote-endpoint = <&panel_in_0>;
> +};
> +
> +&dsi0_phy {
> +	vdds-supply = <&vreg_l5a_0p88>;
> +	phy-type = <PHY_TYPE_CPHY>;
> +	status = "okay";
> +};
> +
> +&dsi1 {
> +	vdda-supply = <&vreg_l9a_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +	status = "okay";
> +};
> +
> +&dsi1_out {
> +	data-lanes = <0 1 2>;
> +	remote-endpoint = <&panel_in_1>;
> +};
> +
> +&dsi1_phy {
> +	vdds-supply = <&vreg_l5a_0p88>;
> +	phy-type = <PHY_TYPE_CPHY>;
> +	status = "okay";
> +};
> +
>  &gmu {
>  	status = "okay";
>  };
> @@ -533,6 +602,10 @@ fuel-gauge@55 {
>  	};
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };

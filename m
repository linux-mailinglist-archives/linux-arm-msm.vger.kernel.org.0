Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A41406F1511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Apr 2023 12:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345563AbjD1KLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 06:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346018AbjD1KLr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 06:11:47 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588AA558B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 03:11:42 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f182d745deso95929745e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682676701; x=1685268701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5PNyl7Qa+2k8WRnY9dW4fNFMkgSoteNciaMZ6zfFDw=;
        b=VTdQO/1C4u+JFiRMxgn6PkFFCQ79t9jaDpVhC+ovcyG2Gk43P+tlD6UkXtqf6HtEd0
         MDnv9aXGWYEyoAXWpyTtBZk5+CdGZDmMnGMSbAYrhEZXs8a9Hm3PASSBpxpLAkxnDxSC
         B4tAPeeDb+sVeupa9FY7X/LcYmbbNfzUK1Z9n9Lt9wcN8+Edepx5Qh6oSj5oHUYjUYc2
         r/bB6RtarF5RbeZT9rwaQKnR9BiO+J1f7lt3kbPtCyRcoS93pYWXpSC85DNitpACdI06
         e8+Am4rTx2M76vOanRkSuYbGBDQCoVQC7jTZIf1pOO8u5XfTtd16DOA4TlPLa2XXTF8k
         GzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682676701; x=1685268701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5PNyl7Qa+2k8WRnY9dW4fNFMkgSoteNciaMZ6zfFDw=;
        b=JGBC0MRFcDmguEX1LnPkIYtVYS613S4tYLRyPxQIZmqNMaQcXDsKDz1ucHNp2xDpha
         IN7LVrVps7+9UPjcEZ/TeTVEXl0fm4W0RV4mttqgTVHI+KPvSeOMNrR/lwcOP7287WXI
         /tNOFtD1HEOdRCsMTpu7GeuPXD80iHZZQDqSu7S76PEpyInl9XR63ZCpxp3fdn8oF39c
         e0ildK5sjWTVHwtJ6aOUxBavDDEB4O8VQN+5sVCjyY2cqHpEVNyIMEg0IfII5zeCUgKv
         iF4FZUEFrZEJ+A7qmtBxCaIw9hHEGfVoxzNZuoldaadaR9dZFngj0bSpsj9H9wUCNlBG
         TkAw==
X-Gm-Message-State: AC+VfDwZT//zolE9JXy2+Xzgn5j061wyG+f6rQMngTQwtalQwSIHOPuP
        HezDHAVXDsL32xLkkNl07MVHzw==
X-Google-Smtp-Source: ACHHUZ5jI/jsEazqgT7ovCnGPnDOi5yzq8Fj3ZnTQaBIv2CxZvT3M0ZTVgGRc0kycsGz3HJGzZCH5A==
X-Received: by 2002:a1c:f217:0:b0:3f2:5be3:cd6a with SMTP id s23-20020a1cf217000000b003f25be3cd6amr3470908wmc.4.1682676700769;
        Fri, 28 Apr 2023 03:11:40 -0700 (PDT)
Received: from [172.23.3.169] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id c10-20020a7bc2aa000000b003f080b2f9f4sm27035202wmk.27.2023.04.28.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 03:11:40 -0700 (PDT)
Message-ID: <918e1b13-c274-a318-9049-a1c72bf12af0@linaro.org>
Date:   Fri, 28 Apr 2023 11:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Add vibrator
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27/04/2023 21:34, Luca Weiss wrote:
> The Nexus 5 has a vibrator connected to the clock output of GP1_CLK
> which we can use with the clk-pwm driver, then we can use that pwm with
> pwm-vibrator to get haptics functionality.
> 
> This patch is based on Brian Masney's previous patch with clk-vibrator.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 35 ++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index ab35f2d644c0..fea8a6be9021 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -41,6 +41,25 @@ key-volume-down {
>   		};
>   	};
>   
> +	clk_pwm: pwm {
> +		compatible = "clk-pwm";
> +		clocks = <&mmcc CAMSS_GP1_CLK>;
> +
> +		pinctrl-0 = <&vibrator_pin>;
> +		pinctrl-names = "default";
> +
> +		#pwm-cells = <2>;
> +	};
> +
> +	vibrator {
> +		compatible = "pwm-vibrator";
> +		pwms = <&clk_pwm 0 100000>;
> +		pwm-names = "enable";
> +
> +		vcc-supply = <&pm8941_l19>;
> +		enable-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
> +	};
> +
>   	vreg_wlan: wlan-regulator {
>   		compatible = "regulator-fixed";
>   
> @@ -637,6 +656,22 @@ shutdown-pins {
>   			function = "gpio";
>   		};
>   	};
> +
> +	vibrator_pin: vibrator-state {
> +		core-pins {
> +			pins = "gpio27";
> +			function = "gp1_clk";
> +			drive-strength = <6>;
> +			bias-disable;
> +		};
> +
> +		enable-pins {
> +			pins = "gpio60";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
>   };
>   
>   &usb {
> 

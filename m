Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941FF62457D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbiKJPTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231408AbiKJPTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:19:16 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41072CCB2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:18:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id x2so3594566edd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VwCgF4hFF5U/01CMcYx8VspG2pIsl2trPvqOv5dL9I=;
        b=WNeRqSfluqeqzoleeeZHGwTdul0BoO3yfmaQ5TlEvwM9KtN/3x8eKBzpimvMkv+56H
         BX/vgj4L0svnGZ6MZYxL8qa3mB+FF+YlBXhDWEWa2GKyNRsGJUEVcmFZABpAkMonU3gf
         OTXGh4ss+WhSIXNI4sVu/hFmfT7dPHIGQaUoX717l++CPdXD/JhDZU4WCW65X5gLa0fn
         36RTA+Wmw5AgtdssnebjQSGu0tQaYS44y/mX4GZfWc9bfHK7JR/8YteCVHwxBLyIPGFv
         NE6i35Lqb0woHU6tmMLO0vjt3Aq/lOP09cFckrT/S97jgMY7KhzdjgggUase3PIzO+5j
         UGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6VwCgF4hFF5U/01CMcYx8VspG2pIsl2trPvqOv5dL9I=;
        b=eRNLA+FCDcRZWaupY5F9MtePn/VCxYbCWvj3FZJTjqfhOYhnwjiQ+KhD79s94JJx4e
         kPeNeIxQxs23jalsJ2TyEwr6JhHXLhoV+Dq5fdSLuvpugQvPkw1mZ7rNLdUbnP4WfZjJ
         STpO4Hho21LUvzGU9Kvqi5vOlAPK1lJDiWuUFr3IVwItHVl/Bs+hPhW+X4AO9ZbUDSpG
         IqJI9ncCF+epWNkJp+tx68tM5V/Yksv9kebV5sgLrnXb3ABYQtHh4c05fW/oS6tUJ7DW
         oTvbl2V4gSzjDkrYfYlBblYmlWA8LMu5hqhuFx5aVsbJPiPLyexHc7RFVVto2PLAqCec
         XyoQ==
X-Gm-Message-State: ACrzQf32ThX0vr06Y+akhX6q9/niM3KC/iScSO9XGDKxNzYgu4OI1sKw
        6Zb+/UqIqeghcoC52+Ev+uOl7w==
X-Google-Smtp-Source: AMsMyM6JVAg4toZj+0Ru5Vwcj0hROuP+eRUw9hdyComNcQ/IgB6GpZKskhywvOW/q+KzrQ1T90Qelw==
X-Received: by 2002:a05:6402:b64:b0:461:60e8:7ac3 with SMTP id cb4-20020a0564020b6400b0046160e87ac3mr2377641edb.80.1668093525658;
        Thu, 10 Nov 2022 07:18:45 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id mf16-20020a170906cb9000b0073c80d008d5sm7212255ejb.122.2022.11.10.07.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 07:18:45 -0800 (PST)
Message-ID: <a5caff28-6dc8-aee8-2c25-1d3810ec8434@linaro.org>
Date:   Thu, 10 Nov 2022 16:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Enable SD card
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221110151507.53650-1-luca.weiss@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221110151507.53650-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/2022 16:15, Luca Weiss wrote:
> Fairphone 4 uses sdhc_2 for the SD card, configure the pins for it and
> enable it.
> 
> The regulators which are exclusively used for SDHCI have their maximum
> voltage decreased to what downstream sets on the consumer side, like on
> many other platforms and allowed to set the load.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 39 ++++++++++++++++++-
>   1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 30c94fd4fe61..1cb14051ab1b 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -279,8 +279,12 @@ vreg_l5e: ldo5 {
>   
>   		vreg_l6e: ldo6 {
>   			regulator-min-microvolt = <1700000>;
> -			regulator-max-microvolt = <3544000>;
> +			regulator-max-microvolt = <2950000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +				<RPMH_REGULATOR_MODE_LPM
> +				 RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l7e: ldo7 {
> @@ -297,8 +301,12 @@ vreg_l8e: ldo8 {
>   
>   		vreg_l9e: ldo9 {
>   			regulator-min-microvolt = <2700000>;
> -			regulator-max-microvolt = <3544000>;
> +			regulator-max-microvolt = <2960000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes =
> +				<RPMH_REGULATOR_MODE_LPM
> +				 RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l10e: ldo10 {
> @@ -424,6 +432,33 @@ &qupv3_id_1 {
>   	status = "okay";
>   };
>   
> +&sdc2_off_state {
> +	sd-cd-pins {
> +		pins = "gpio94";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> +
> +&sdc2_on_state {
> +	sd-cd-pins {
> +		pins = "gpio94";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply = <&vreg_l9e>;
> +	vqmmc-supply = <&vreg_l6e>;
> +
> +	cd-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
>   &tlmm {
>   	gpio-reserved-ranges = <13 4>, <56 2>;
>   };

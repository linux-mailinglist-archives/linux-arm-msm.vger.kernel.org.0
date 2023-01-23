Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D79D678214
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbjAWQpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbjAWQpN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:45:13 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB082CC60
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:44:52 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id u19so32084193ejm.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+MQluqn9nt7RD71EHDttjyHlEpDdbP4AXW0/Pi9N4o=;
        b=AsFqEHjp2PSwAXOyGhhhUK4qFRmPxRek5DXJD+ka9zxyw39v6E0qGm93e1fTloHbzg
         m+AbQbcQ8L/dWEGUoybVvPKvCmYdSzDSCJw3/uYpgu8lnee8rOTCYMiVOTGzR+tVxpvT
         BkN3iBJCy5H1GBDA5CsRmqq6YeuUeeyQmvrCfhSSc//6SX2hnAtpcM2teUE2kolvkCVL
         ox9G2lBiPAZurPL+ecT6KAY+8/oKT1lg0YH27sH4rkUcMeUydiGsq+BBtpzIL/OsGAyB
         bgtfB6v6fw/bl9figdWuulaxYRFFxY/xzUX5etLjEKg0KkF7+gGGOxfWJFJ9RC/AblfQ
         g2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+MQluqn9nt7RD71EHDttjyHlEpDdbP4AXW0/Pi9N4o=;
        b=a7GL7Sq51VuWm5uzwfYJbfbsNDzooqgpcPXIg4W+ePvaciaH10evMvaaeEBrjm0d46
         lvejfGAGoLrkMwz4OE4CSkUPdrHaisTPcwGiXW9JCyuNEAULEkBMuLJPvzdftv89+eva
         W6HcK7z1g4W/GKxvMbj/CmgYyAplK+rxvXRm6j6rZhRKVOeUe+bynwTyQTyyDo3oedpZ
         jcCMkDH+dzozDp7NiDeT543YOm45fHRA/hsfIywJyRoWI+lX1WsRGzoJZANISdzYC3yU
         5kOTuvZBZIx58UVzZsmZdAMbyE0HCPalmkTQIegadAsr1VoEQdKFAfLsEBVmJy07UpYH
         KiSw==
X-Gm-Message-State: AFqh2koi9XI9OMYfqSlAplVf5/3bDaBnctQzoqfzpH7BVU/tcEJybs79
        JarvROHiZU5QtvkIC0fTfjHgzQ==
X-Google-Smtp-Source: AMrXdXvQtB0ZWiGkDZiL9MK9IWIwnHOO3JLmXSKr2tzZrBLjkFBjqCvTjHBnHf1KxzAW+Y+scytgGg==
X-Received: by 2002:a17:907:340f:b0:872:db7f:80b4 with SMTP id ab15-20020a170907340f00b00872db7f80b4mr22527807ejc.38.1674492288754;
        Mon, 23 Jan 2023 08:44:48 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id vo16-20020a170907a81000b0086dc174caf2sm13108255ejc.220.2023.01.23.08.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:44:48 -0800 (PST)
Message-ID: <0c63f37d-a6a9-4cb0-39c8-ebf302945ad2@linaro.org>
Date:   Mon, 23 Jan 2023 17:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974-oneplus-bacon: Add
 notification LED
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230122-msm8974-bacon-features-v1-0-4049f565c24c@z3ntu.xyz>
 <20230122-msm8974-bacon-features-v1-5-4049f565c24c@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230122-msm8974-bacon-features-v1-5-4049f565c24c@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.01.2023 17:48, Luca Weiss wrote:
> Add the node describing the sn3193 that's used to provide notification
> LED.
> 
> Unfortunately the driver currently supports neither multicolor API nor
> using the properties function & color, so we use label instead.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> index ffb486ceb6a6..a672c45d7070 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> @@ -114,6 +114,34 @@ led@0 {
>  			default-brightness = <80>;
>  		};
>  	};
> +
> +	led-controller@68 {
> +		compatible = "si-en,sn3193";
> +		reg = <0x68>;
> +
> +		shutdown-gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		led@1 {
> +			reg = <1>;
> +			label = "red:status";
> +			led-max-microamp = <17500>;
> +		};
> +
> +		led@2 {
> +			reg = <2>;
> +			label = "green:status";
> +			led-max-microamp = <17500>;
> +		};
> +
> +		led@3 {
> +			reg = <3>;
> +			label = "blue:status";
> +			led-max-microamp = <17500>;
> +		};
> +	};
>  };
>  
>  &blsp1_i2c6 {
> 

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECA05EE3A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 19:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbiI1R41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 13:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbiI1R40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 13:56:26 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F66EE7430
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:56:24 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b6so15163692ljr.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=w83Blt+pExhC8qZthpUl7jNIgc+X4UN3qwS7CA2xKd8=;
        b=OA8cR4fuLSmLVqXw4yuxudEtu64bhR6D/teEAZulXsqz5uvcFOV7J0J2B7b6zsWh+M
         TaWkjemDHxgV/6GNkQ99IDAT87cj38dDmP1QnZz7LYJr1F6WBP1KDd+xwQRzv3ICIktm
         nr4RvF0u/yw+kzRs0aT2WcZ+KdEA9sKFIsLzgYuaro8ykACkJG4IWiDqoPpyqfkgym3k
         yYrkrx3g4pIiO0xHcFyPW74WmOJ8UwRLH+dDxeHKwcShOi8NAsqWYnNBxPVhSZyIZaIh
         jv+xcTZPqt1EvmYSICkLIbvaU3tQgn8bH+crPiyv0oCdZ89HOajQuZ5lFj8JFLmuuDFX
         xmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=w83Blt+pExhC8qZthpUl7jNIgc+X4UN3qwS7CA2xKd8=;
        b=3pcAteILphISY+e7HbISVpdBhb0VZSKAVgmeUqJOaSqY3BzM42IS+9TqR2yMFvVbnO
         osJkVaQ7f+p3ZOQ5/CPS/X6B7PgRO4LWZDWmOktEVK9Durndt4wTvv6TFzWY2MYYjTKm
         scWkMnLZT1qtgNT9GAGFkl/Tk5MzI9QMB+Co60/HlhJJpWEXqi3Ipek1XEDXPbjxMg9M
         zxYeG0ndgdwnRrzUnCGE5AQ6fd6VedFurRfvxzJ93rFLEMemJ4kBI6qAcoeBakFsRs72
         RZGXmPfrfFl/pAJtnPDvWCrNHB1cmrDrBtsdOE9l/C1L3Nc0wFLdQ3zb6GOUDbU0iXh8
         HSqw==
X-Gm-Message-State: ACrzQf3NDcMTjkEVqwLK5hR81Bb0OYJ2aeagHjwb34w0loawrUgBXn3Y
        YO6EF1y1o0RgN3svS5ApmWGKlw==
X-Google-Smtp-Source: AMsMyM4uP9jwz9LpdsQflbKPi7oZsDUV0AQNFIskhtG5xzIY3AALaGgDlFylVStMCZyXtkzJaLVA1g==
X-Received: by 2002:a2e:9791:0:b0:26c:5956:30dc with SMTP id y17-20020a2e9791000000b0026c595630dcmr12363478lji.373.1664387782922;
        Wed, 28 Sep 2022 10:56:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h15-20020ac250cf000000b00498f871f33fsm535867lfm.86.2022.09.28.10.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:56:22 -0700 (PDT)
Message-ID: <fa8f515b-cfae-0edb-e02b-b0de2352bd7c@linaro.org>
Date:   Wed, 28 Sep 2022 19:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 3/7] arm: dts: qcom: mdm9615: add missing reg in cpu@0
 node
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v1-3-b6e63a7df1e8@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v1-3-b6e63a7df1e8@linaro.org>
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

On 28/09/2022 11:14, Neil Armstrong wrote:
> Fixes cpu@0: 'reg' is a required property from dtbs check.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index b06bbe25fdd4..e547becc9f75 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -28,6 +28,7 @@ cpus {
>  		cpu0: cpu@0 {
>  			compatible = "arm,cortex-a5";
>  			device_type = "cpu";
> +			reg = <0>;

Put reg after compatible.

>  			next-level-cache = <&L2>;
>  		};
>  	};
> 

Best regards,
Krzysztof


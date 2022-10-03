Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71C125F332F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiJCQQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJCQQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:16:36 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987B83206E
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:16:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id k3-20020a05600c1c8300b003b4fa1a85f8so6119581wms.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=GErSrme4StBRIDEXB77W/G7kzLtNPfM9FyyVqQMB360=;
        b=eBuwaasNyUmAZ/M2QsJu78Y1WvD5tN0UIJVZ3ML2CmUajH4uskTH8bfxx8k4jkDV/x
         kd5wr/X9G0g+q8U5X79SNuPCf2iOMY/VVngYabn602PCG3TGyQHNJIRkowjqSuHXWgwu
         CQVmkguD+6B/5gNBxput4mIam2VVsPdpNLr3sgO5KOFAZR3d8ra3XmhXyADzx+O6BvlE
         QWWEjABqOJoMaLAK5Or1W0NPC80HBw5Sr5y7EsmYqG6KfbFgaYtjILvlug4lfupZbL3j
         CCNuTOIZZ7zvwtugiIFAKR7xJtHLMnsFuru7z29IAbSTw46BiWnOr0UmT+wlYlIunab0
         A3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=GErSrme4StBRIDEXB77W/G7kzLtNPfM9FyyVqQMB360=;
        b=O6umxZ0KCCK8j44FNYnylVHbKKUyZHxcZlDCWlkdOnDBmIGBMllXgtU7SOettNn0Xf
         cqtTxpKQ9YVHgFzBX18vutQWVF/jQ6iwLm9PHo5LwQMsS/RIMYVPv/QGHxqSrc6DrUFW
         DxIN1X10LccahkgRtBD4OxIqb3B/cxEyPQHlbe/KMs9ybw0i8HqCcr69ULikFc9TdFol
         FdnjQws5Smdv6ID4yx18G47SLofdvapAHwcbpARxK3TSIanTzozFv5BJEH2sCn7b1ut5
         YH4D3oa85IlvgbSb6SVMQYYNPvtZvSqrPRz96ZG3+yrQtt6zEw++Qg9JMiSTIkDbPnmh
         lSqw==
X-Gm-Message-State: ACrzQf2pJJ/xuO1Fv2FU7BR3MpvxVefPUbuojgcQKKjw8Bi2XVxgLA+y
        +IO7grfGOmpSiNZAfloNsVz8Wg==
X-Google-Smtp-Source: AMsMyM7qihP9p5Qiy5sjvYTQzPls1+eHyMtLkW456e5TIG57vG+byZDv5mQlHTywsBkmKTcGyjJncQ==
X-Received: by 2002:a05:600c:3c92:b0:3b5:62e4:e423 with SMTP id bg18-20020a05600c3c9200b003b562e4e423mr7478005wmb.162.1664813792207;
        Mon, 03 Oct 2022 09:16:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id bx10-20020a5d5b0a000000b00228fa832b7asm10541992wrb.52.2022.10.03.09.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:16:31 -0700 (PDT)
Message-ID: <8d1e1836-3773-ff47-1aed-d58578e9560d@linaro.org>
Date:   Mon, 3 Oct 2022 18:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/23] ARM: dts: qcom: apq8064-cm-qs600: pull 3p3v
 regulator from soc node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-10-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-10-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> The 3.3V regulator is not part of the SoC, so pull it from the SoC
> node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index 65684da52e2e..5ff0d9a275cc 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -29,16 +29,13 @@ sdcc4_pwrseq: sdcc4_pwrseq {
>   		};
>   	};
>   
> -	soc {
> -		/* on board fixed 3.3v supply */
> -		v3p3_fixed: v3p3 {
> -			compatible = "regulator-fixed";
> -			regulator-name = "PCIE V3P3";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			regulator-always-on;
> -		};
> -
> +	/* on board fixed 3.3v supply */
> +	v3p3_fixed: regulator-v3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE V3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
>   	};
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

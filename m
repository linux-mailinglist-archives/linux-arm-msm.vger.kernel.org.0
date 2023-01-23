Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4A5678172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 17:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbjAWQaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 11:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbjAWQaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 11:30:17 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1D02B632
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:29:54 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id tz11so32084172ejc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 08:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TASDLyKH+0DjNc1kNKn1XmKSEz18xnkdI15P2UbcAWA=;
        b=SEoC8mIsBQpVsNL2SVpaX/Me7/JqveYsN/AJ66jJyFj5rhL9xBCbptenc9ciLNnrVc
         KHsDrFGXh7FIUYQcybbIIPplTH49U46Sh5Tw8e9Vj5pAISupKU5vjsuAtI++WQyZdu4L
         +t9/9uqk4bM9YExaatLWO2fDozZmJoGl09pb+PLFMTCnxx0FDkYKLeqggM4T0LJOi7r9
         PJF2UqpmcCJza2j+2Zcf58z5n564C4rStg0qJ8SbYoihP62Do07fFKdstIneYafQXhPO
         k0+o2+ude7SzDVYOXI7KUSUE2JEiaMxuEmvs/VbU29SrWzh0/5NkyjJQov+njEInrFjx
         0qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TASDLyKH+0DjNc1kNKn1XmKSEz18xnkdI15P2UbcAWA=;
        b=WxJHdkGNlO0gHCikoNHmpISvZVVfIDfYMrueyhLgKXDCMs0Hucy2ef3NlnPafPvgQr
         3vZhJdrPJIc6XGxlE8smf+V7Acjeq2HutMjYdU9wWYgCkM4Fg2iEUDIBUHGXw3cnEOym
         Jn671lidsVLWMl9oQI0PkLrHRW4Wcttg++MNkQ/kkusLRGcq07XdPRaXbCrtEpJXViyt
         SmAAMxqF1NR4OoxTUTLq5WTPd4IXmfSR+oregKncQRfpIR296JmjnU6BwXK9VzgvJHNu
         bEe75VnsjLazBmF4k+jPBa/ZLRDrpNh5vo/hyS2Ue6+/0rU9oj8c186PhdxDV8cq1p+3
         rMsg==
X-Gm-Message-State: AFqh2kofp3+NJOW6/fNyemrQz5PFZQr96bvvNwE4D6CwLGzXqxfWjvYw
        JWij1liZAQ+ed85rWDdhJ63wQQ==
X-Google-Smtp-Source: AMrXdXv6uGougMYEDD5lLrYNdz6BR2Jr2z2VhkIydC8OzXmpkcu1kg8rLsEa1mULz9hSljpmUUWDXA==
X-Received: by 2002:a17:906:95d2:b0:7c0:a6a9:64e9 with SMTP id n18-20020a17090695d200b007c0a6a964e9mr27120793ejy.36.1674491393106;
        Mon, 23 Jan 2023 08:29:53 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id hr35-20020a1709073fa300b00877557ae644sm8748272ejc.71.2023.01.23.08.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 08:29:52 -0800 (PST)
Message-ID: <a7d10bdf-f605-7cef-3ccb-68592febb67b@linaro.org>
Date:   Mon, 23 Jan 2023 17:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8550: drop incorrect cells
 from serial
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123125612.154840-1-krzysztof.kozlowski@linaro.org>
 <20230123125612.154840-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123125612.154840-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 13:56, Krzysztof Kozlowski wrote:
> The serial/UART device node does not have children with unit addresses,
> so adderss/size cells are not correct.
> 
> Fixes: 377972ac743f ("arm64: dts: qcom: sm8550: add I2C Master Hub nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 6ff135191ee0..0307b853ec4f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1582,8 +1582,6 @@ uart7: serial@a9c000 {
>  				interconnect-names = "qup-core", "qup-config";
>  				interconnects =	<&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
>  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  				status = "disabled";
>  			};
>  		};

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 972DC735859
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbjFSNTN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjFSNTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:19:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B8DE64
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:18:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f866a3d8e4so2421842e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687180708; x=1689772708;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fT620nxcybg/D2DY8ZSDWUhANkXuBn86NN02DgIKkvQ=;
        b=icHjr1791Dbit1rX1FfMJQpQ8Q+ZH9ZuiwD+b7ZfbiNfvCFB/ARDWZQnvDBF/FzasB
         qT1Y8FVPF1bPEQyC8YFUwzfw0fIp+QyhJFo52DL6EWiPjiXOtK9mJFgnGHkqcWvyNkWy
         6J42S5nUBMmfQq3OoMCJG9Mm/PhDWy42HAGmiv1d/7WGxHALm4tJsbRV+gB/1snSZ0Dg
         P3XFbIIGiM74JSBX9Y22aht4JAHlF5fAsES4bRg4rFS6+z/H7fcoEACQbTxz5ZLCrQQf
         QdWoPJC3BSED5tROL4XhtXIESoOGeAr+yelTlpDYQth8MFivYQnU83qneMam59rifTPM
         iLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180708; x=1689772708;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT620nxcybg/D2DY8ZSDWUhANkXuBn86NN02DgIKkvQ=;
        b=bwivQshNjS/Ay1tc6Cn9RZAGYax+eZMjnFgd7pEey0k5MfZjrU9vIyZYrHyZ+5jmLS
         3A/vJ7lbkt8rZm+sI5eAbs7pT3EDZlQkP71djg8zm0LPealT6i+Fw20sWP+B76nbINJF
         npa3deAFA+dCRS6o911UVDAjSwid1A5eA92L8ELd1HauqVxbgR/IXYtfnDTprjFa0Npo
         AhYTC5hi9u3q6RPBVZ+D7YRJhi79Yp3cIH9/LbP3/4wHO7dqUgZQfME2UcSwBgfdOQ70
         lZGCYLhXx3aOU6uPVbO6IrPY+2sYXlI5Oi3RldzfxyuZNq0wY+fEy/y90wb1gP8Zlx74
         Qmiw==
X-Gm-Message-State: AC+VfDyKzBmWvBTiYmHqekCYKN4f5WKAJkzLFSbIp/ZLu65qjJZRbvsy
        /Gh00f18JBg3PgotYslj8Ci5vw==
X-Google-Smtp-Source: ACHHUZ5xfP1FcCkd/yiql4ahEvM4xwJ9ACCQnpkLhOHClCRNOeEI38LLRvyFwSv+vWo8cYssi7Khyg==
X-Received: by 2002:a05:6512:555:b0:4f8:75d5:8af8 with SMTP id h21-20020a056512055500b004f875d58af8mr695714lfl.4.1687180707632;
        Mon, 19 Jun 2023 06:18:27 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id w17-20020a056512099100b004f864434c00sm1049981lft.171.2023.06.19.06.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:18:27 -0700 (PDT)
Message-ID: <54a989e2-b8cb-43c4-f4d5-86e129d1949a@linaro.org>
Date:   Mon, 19 Jun 2023 15:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: apq8039-t2: remove superfluous
 "input-enable"
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230617112115.130024-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230617112115.130024-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17.06.2023 13:21, Krzysztof Kozlowski wrote:
> Pin configuration property "input-enable" was used with the intention to
> disable the output, but this is done by default by Linux drivers.  Since
> commit c4a48b0df8bf ("dt-bindings: pinctrl: qcom: tlmm should use
> output-disable, not input-enable") the property is not accepted anymore.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/apq8039-t2.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/apq8039-t2.dts b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> index 40644c242fb7..43686bbd87f4 100644
> --- a/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8039-t2.dts
> @@ -366,7 +366,6 @@ typec_irq: typec-irq-state {
>  		function = "gpio";
>  		pins = "gpio107";
>  		bias-pull-up;
> -		input-enable;
>  	};
>  };
>  

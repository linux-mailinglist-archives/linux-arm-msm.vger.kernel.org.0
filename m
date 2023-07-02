Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2808745228
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 22:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbjGBULO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 16:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233172AbjGBULE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 16:11:04 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3196910EF
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 13:10:03 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so4167451a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688328592; x=1690920592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XEbinDKQmA0sOkZ9j4oK2eVO7lkopAowopk2a9saj8=;
        b=UIXqveSMX+oujydoxpDfsn6bSse4eMBBiZz50mTtAiQkPx1/x9DVAZa3SBO2xUYLf1
         7OTpN9L+07q93d8jxInlx1vzfueoLXVyTLi5jnOPHuPVWF2kgSAp81DQzf7dtA2hApmM
         yA+EJCYdHCoxwUFHPqUdgsVCdI1F8ihJcwvuIADu/yvkv9OWCX1U+fSBZFGz3aXUn2PQ
         TnI4nPcHhgbMOlvzMJnRNHvb9OdIMhcSS107H+fNZo9PlVhK14Th+D/0dKaukGaOrKYk
         hvnCNzv6ko5iFkZBXBixixhIK0NOX2UBYCGwRb/tO6T5NsZOaB9jbIX8Oj8wy0iEebb8
         XxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688328592; x=1690920592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XEbinDKQmA0sOkZ9j4oK2eVO7lkopAowopk2a9saj8=;
        b=TUcMs+4CT86+jjOVTgJvpWGf7ZfYVTxPOoO7uQxDP2a4URgR8XNh6LB0bSHAtDezsX
         G2rQCtMt4wsyjnTlEGYGYme0y6U9duCmKRxd302wPBLZNYV20GJN4rQj9C2NuqUmZK1g
         ckYJecN2VYlufGXmEa59eZzoX7Ht+VxJVUM9cHVwjq8HxDhk6EwEbxXofG3kMzb6ikhq
         a6tsFJFf0EZD6Q2Hk0kZMTUubTTjlyQJkgDdk2e8t1WPQ1XT5CNhmlPg2yyI1UvDlRWs
         5LeDy27b42d55bYBAsmoa279AWD55bTRWQGfvaNG+DSv2/ZB4CWI7LQNHsXtRJW17/us
         iOiA==
X-Gm-Message-State: ABy/qLaERFWpeJfQIJrCJH3Nl6XFzpKHnEZJQumYcrXdW8d8tWvE6Naf
        N7ZtafW5nGo/9B2ivHKE6pxZnQ==
X-Google-Smtp-Source: APBJJlG0HOHJON9xOHZ/yU82pUxWEV1BWHwlPLfoIk/EW35/54QSwfzuQdlgV1vXC9abgHES3eep6A==
X-Received: by 2002:aa7:d8d9:0:b0:51d:e498:201 with SMTP id k25-20020aa7d8d9000000b0051de4980201mr5548697eds.27.1688328592128;
        Sun, 02 Jul 2023 13:09:52 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id u21-20020a056402065500b0051de3c6c5e5sm4033677edx.94.2023.07.02.13.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 13:09:51 -0700 (PDT)
Message-ID: <64543b2f-854f-4342-ee6d-d32f616eb55e@linaro.org>
Date:   Sun, 2 Jul 2023 22:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 21/28] ARM: dts: qcom: apq8064: add L2 cache scaling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
 <20230702174246.121656-22-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702174246.121656-22-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/07/2023 19:42, Dmitry Baryshkov wrote:
> Populate L2 cache node with clock, supplies and OPP information to
> facilitate scaling L2 frequency.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


...

>  	qcom,mode = <GSBI_PROT_I2C_UART>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index c212215800d0..860f8981e8db 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -2,6 +2,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
> +#include <dt-bindings/clock/qcom,krait-cc.h>
>  #include <dt-bindings/clock/qcom,lcc-msm8960.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
> @@ -81,9 +82,106 @@ CPU3: cpu@3 {
>  		};
>  
>  		L2: l2-cache {
> -			compatible = "cache";
> +			compatible = "qcom,krait-l2-cache", "cache";
>  			cache-level = <2>;
>  			cache-unified;
> +			clocks = <&kraitcc KRAIT_L2>;
> +			#interconnect-cells = <1>;
> +			operating-points-v2 = <&l2_opp_table>;
> +
> +			l2_opp_table: opp-table-l2 {

opp-table

Best regards,
Krzysztof


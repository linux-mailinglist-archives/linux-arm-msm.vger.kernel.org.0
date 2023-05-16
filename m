Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51707704F96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 15:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjEPNma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 09:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233728AbjEPNm0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 09:42:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FA05B9E
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:42:21 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3090408e09bso2966033f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684244540; x=1686836540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIvTcNlwAmPNpObBbfvPw1SrNayKQmgyhgtXRTbsW0o=;
        b=x9+y61j4a/rAqAPb1vGX/7FNSeS8qKNMAkz5A+EfN2PlplrNAb/IRWBIMaEIZ3cPJI
         QV75FLyklyjKqWPSxT8eq7Jh00z3BEhRFKWlLjnoXgH43+L/NhvEgUdROmkwTPN/isql
         TBIALmXNNjepZplPEpN9J4QaiP88m12Yb81TkDLmdSLCHI7Le8roh5vofYHC8Z1lAJVn
         3e/b0VHr/3BhisQZXuYE2xHzasHy8RHY0UOtKa9lVNvj3xD77VDo/qtEjGdUsd1qThGj
         e4a9cQOpdrOn7epnbZpSY4/nD3KOzTH2hcRKr0pi04OvJ3UAaYVRx4yrZdA+8BxMxv1Y
         kyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684244540; x=1686836540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIvTcNlwAmPNpObBbfvPw1SrNayKQmgyhgtXRTbsW0o=;
        b=LbSUFFLLTtNFuN6zjyaZnAupV6CYE0KguVxU7Ua6F5znc3qTgdFruCVnHNajjcbS6u
         U6pWbhVu0V86OwIQjNCqM6XSyfC430MVz222tfRfL0hQJpjs//5SfV4E2swjNi33Hp3w
         s8bXwO6ded3+oG4SCp3cE79wGnck2Bfoim4hNLCuFNVTTF6zyQjXoFsKAYP1s2WxnQe8
         S6TJ2YAYQrO5XHe6kCpPsCff0xVf/TI9iih1Lk71jvcdxUQ7/vQJNkWl84hmF/p+M7ql
         rF6oQn+fgLNMYxMP/n/JGX1YBP9Z/r44nJYoesGDYpuPupUHfTfJWMIDKgypo5DaqtOe
         yYbQ==
X-Gm-Message-State: AC+VfDymv6g0QqkPPjCokTU4rbECmeJYyWxNHf9pKwv/sr2UHgFY/tZY
        UbhIxSE1I2l3wumImVe9w2YcQQ==
X-Google-Smtp-Source: ACHHUZ6Qej44yGCIdrpInYjzHIJscOEjjkfM4eL+VuKHu1Ub2WB/gSILNqOM8VjDJvJ/EH6SR69hPg==
X-Received: by 2002:a5d:43c4:0:b0:2f0:2dfe:e903 with SMTP id v4-20020a5d43c4000000b002f02dfee903mr29013651wrr.69.1684244540172;
        Tue, 16 May 2023 06:42:20 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v17-20020adff691000000b00307c0afc030sm2761242wrp.4.2023.05.16.06.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 06:42:19 -0700 (PDT)
Message-ID: <d244f5f3-a4a0-c9ac-2f78-49baeb8ef3d3@linaro.org>
Date:   Tue, 16 May 2023 14:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom,gcc-sm8250: add missing
 bi_tcxo_ao clock
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230516105241.30091-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 11:52, Krzysztof Kozlowski wrote:
> The initial SM8250 GCC driver added in commit 3e5770921a88 ("clk: qcom:
> gcc: Add global clock controller driver for SM8250") already consumed it
> on the clock.  This fixes warnings like:
> 
>    sm8250-xiaomi-elish-csot.dtb: clock-controller@100000: clock-names: ['bi_tcxo', 'bi_tcxo_ao', 'sleep_clk'] is too long
> 
> Fixes: 98394efb48f5 ("dt-bindings: clock: Add SM8250 GCC clock bindings")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Re-word commit msg and fixes tag (Konrad)
> 2. Add tags
> ---
>   Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> index b752542ee20c..ead6665b9a45 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> @@ -23,11 +23,13 @@ properties:
>     clocks:
>       items:
>         - description: Board XO source
> +      - description: Board active XO source
>         - description: Sleep clock source
>   
>     clock-names:
>       items:
>         - const: bi_tcxo
> +      - const: bi_tcxo_ao
>         - const: sleep_clk
>   
>   required:
> @@ -47,8 +49,9 @@ examples:
>         compatible = "qcom,gcc-sm8250";
>         reg = <0x00100000 0x1f0000>;
>         clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
>                  <&sleep_clk>;
> -      clock-names = "bi_tcxo", "sleep_clk";
> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
>         #clock-cells = <1>;
>         #reset-cells = <1>;
>         #power-domain-cells = <1>;

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

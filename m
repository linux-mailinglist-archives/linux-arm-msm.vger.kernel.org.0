Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916A66F3E06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 08:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjEBG74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 02:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjEBG7x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 02:59:53 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E784498
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 23:59:52 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f6c285d92so671869066b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683010790; x=1685602790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DW2PDnB/a4GBq3xwg2xVlm3Rx3gcG7ZL6JpL2EdisVk=;
        b=xjstnW1MhSH9xeyYTH8/rwRvI0E2oy4J378rdrNaZN4KaXOKgWIZiEjYB39J/NPG3l
         viuRQl3QSmjJSKqeDtavFzAFMiU1x3IQtQJfpyNwbJNm/PCEb0poY6VsbQlfAfdNz7OY
         nTc2a86IQ4oGvsDTzNNBM+nrIyf2o84PR8Es01kR3j9hKCkMMT+R7RPNj1SEx+/88BC4
         djhM4eSMEsG9/GVKwVmUKXAY2hVa1TUN04eSOz2aJhokCNomn7DZEF4wON2Au/5zDsVX
         nhraKmgFHVLyDrGeWLGLiywGEQF7T5LCWK91t5Ewk8amLhNXkQqq+agMldMYoeGn0zfd
         1heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010790; x=1685602790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DW2PDnB/a4GBq3xwg2xVlm3Rx3gcG7ZL6JpL2EdisVk=;
        b=JJp2Tj0eSovFg5NBbBZb8mWVAULgf1mErd2tCmcs+2TDJS1BoJYs5Y1FOSvZRc4B9K
         EDX7orvpss7ZUmReyoLke07exXKq5H+9R9uBzE6fhsr/8c+oExrtsEDSSexToVSvLgQn
         +i1HY5M1CTgQ4TN1LbQehfhbqjQlMO2R1DvZi1l9DriB/oMO6/pAdtDrP0DCNfpj3mry
         f5Hk/LDe3LOKImQ8yvfHFLl+gP+sTmOSVO2qz8EdNL+iAgEo8ErQLWBtAStcRXFZajto
         R3fq47BcbRD9OuHpN5XNRpmFewCCK8bwM9IkRcny9bVgQZNXCzNg8Kh/G4qXpHYbFOAR
         SkQA==
X-Gm-Message-State: AC+VfDyA4rB11OK6f9czzIE03yVemJOWJaBET/49o+oQXqr6SUKo3ftF
        GGVpBh6HkxNGzzygUAehEAFd7w==
X-Google-Smtp-Source: ACHHUZ5gJWuRuYwXpuStHz2MNXThfg91bKu7gXAVukYjt0mTT70RrG0+fDw01YPxlIk827PQzA1NQg==
X-Received: by 2002:a17:906:fe05:b0:955:34a5:ae46 with SMTP id wy5-20020a170906fe0500b0095534a5ae46mr14123624ejb.77.1683010790500;
        Mon, 01 May 2023 23:59:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id x3-20020aa7cd83000000b004fbf6b35a56sm13020285edv.76.2023.05.01.23.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 23:59:49 -0700 (PDT)
Message-ID: <9d6c70bc-3807-edb3-560b-21f9ced7895a@linaro.org>
Date:   Tue, 2 May 2023 08:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 03/10] dt-bindings: clock: provide separate bindings for
 qcom,gcc-mdm9615
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
 <20230501203401.41393-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501203401.41393-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2023 22:33, Dmitry Baryshkov wrote:
> The global clock controller on MDM9615 uses external CXO and PLL7
> clocks. Split the qcom,gcc-mdm9615 to the separate schema file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-mdm9615.yaml      | 53 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  3 --
>  2 files changed, 53 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> new file mode 100644
> index 000000000000..ca26d69ccb07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller on MDM9615
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>

Please update the email/entry. Maybe to Taniya Quic's email or to Bjorn?


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


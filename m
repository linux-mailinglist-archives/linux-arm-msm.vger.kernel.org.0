Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B70B66DC92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 12:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236792AbjAQLft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 06:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236144AbjAQLer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 06:34:47 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC44360AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:34:43 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d2so10131888wrp.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 03:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fREWHN2UQ1kl2XZ6OMZzGJJemz/P4M0H3yz7UyzV+A=;
        b=QSscyCpFZNbbM6kyMW199uVthsV7aRgY+daSbfaJH7SmHUieDbJ3JqHGYU+FXCi55W
         f1U84Y+nlWQhZvyaWVEDrbezdyNVKuByZpMdnvVDLCxc8hk6kvUnkAOekj8wFP94eZ6V
         Fzzo3XG/40/WB0u4Rpu52uH0sb9kzmIJ7YWstAO9Q4/3YSeDi9jalDiGoLDOsB2OL9TF
         s/Ar12W1+M2VcLYvQJrQT5CjtCtCMB7i9asQ4BKnWhBEWJA02RntWvh7DCbi2DnRxzsV
         9U8YcPyUduEmxx3IRfq/xnrsfXhC/ppPJ7CNfcU8ZJk9CU8jBE1L08xZjjf4GKiGfj0u
         ppnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fREWHN2UQ1kl2XZ6OMZzGJJemz/P4M0H3yz7UyzV+A=;
        b=OjYtdrH/0x+TttreW+5fF0FU3R6UxQFCNo+K6G1H7tTdjPl/69zgTJ9+YDTeEWV4DM
         quZADPYAZYXBLQa21J6LfmaKlGRkaREuTb8bNUC+G0joksJwnLd+WU/duEq5405vQQ0k
         8JkjpXkvmtkZxpbzj7T0VZPxSQcstF8uks9EG/ldF2/3DZQ7fCzFIvKwKK8KlPa6wEqj
         4F2N1lPwDfyCYdtJARW2uF0INhZMvG7fFiNveoUBob2CxZPxcaOcANRKRREH3nfROfGN
         AgbphKSZJuR5VkO3TOu6rWWOTYDz/LpPaaevzjV9i56sYrICS843I2VtcVwTtz02hrY3
         iogA==
X-Gm-Message-State: AFqh2kolbWKCzUf2V/z29kRVcDzBdkeu7D74WcqqWM3ZC+2vAgnicAp0
        Gm7ht3P1XQSEygi5sGt8jEOGr0Kal5St7v+n
X-Google-Smtp-Source: AMrXdXtVLG+lFxj/ILADCcRFl8jlKdWjcXBh4tuBystBmpfSjE2Lu+/jzWctDw6Y3TXUc20op7SLNw==
X-Received: by 2002:a05:6000:248:b0:2bd:d4bd:581d with SMTP id m8-20020a056000024800b002bdd4bd581dmr10476975wrz.53.1673955282527;
        Tue, 17 Jan 2023 03:34:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020adfe786000000b002bdbde1d3absm18444072wrm.78.2023.01.17.03.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:34:42 -0800 (PST)
Message-ID: <aa5598ee-0dd1-caa7-c60d-5a409f039713@linaro.org>
Date:   Tue, 17 Jan 2023 12:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] dt-bindings: mailbox: qcom: correct the list of
 platforms using clocks
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
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
 <20230113090739.45805-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113090739.45805-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 10:07, Dmitry Baryshkov wrote:
> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
> and qcs404. Correct the list of platforms in the corresponding clause.
> 
> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/mailbox/qcom,apcs-kpss-global.yaml          | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 943f9472ae10..b8a44ef0540f 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -71,15 +71,8 @@ allOf:
>          compatible:
>            enum:
>              - qcom,msm8916-apcs-kpss-global
> -            - qcom,msm8994-apcs-kpss-global
> -            - qcom,msm8996-apcs-hmss-global
> -            - qcom,msm8998-apcs-hmss-global
> +            - qcom,msm8939-apcs-kpss-global
>              - qcom,qcs404-apcs-apps-global
> -            - qcom,sc7180-apss-shared
> -            - qcom,sdm660-apcs-hmss-global
> -            - qcom,sdm845-apss-shared
> -            - qcom,sm6125-apcs-hmss-global
> -            - qcom,sm8150-apss-shared

And what in other case? Any clocks? They should be moved to their own if
forbidding the clocks and clock-names.

Best regards,
Krzysztof


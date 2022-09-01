Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C19C55A9B97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 17:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbiIAP0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 11:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234217AbiIAP0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 11:26:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6126DADE
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 08:26:03 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id p18so14934456ljc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=uPrRBH+Jv2f8LkD1iC1unBDVUPhUrBZ4GLh1QznK7ko=;
        b=bHFj7fh1Ln7mzIsawBUr7TggUod/drEWW+s/svH5nWu6XexvVN3IynW0Cdnu1ARv+z
         pWagWD+W5UxRYkb29MZ4HLAp2QOX9McwC72YBF4Kz53xUUEiYLRCZdbPbv73hBdOiz2K
         e5W2WtEeE0dwy3O1XhXyMLJ9WGexMRo+BN7E7CQQX3Pbx1ZfwZyhldgqg4QN2j7lwmc1
         Mc3+pIcB5z9lNtyQ1W3WJ0XcOsnMUmMl7QMUN/rX4iSSM3aI08uzLn3HjTU0NBrgo/gx
         eFj5WBZiuAHb66If8TpXEeKJdAf5e0n+NZL39RAmky5Rg7H8TwIelhTpjkTyJCCz+hXy
         ASvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=uPrRBH+Jv2f8LkD1iC1unBDVUPhUrBZ4GLh1QznK7ko=;
        b=LKye6zpDgt+OmEvisRYkjl7ZCmWDBNorsw1xUxeAVMJtQUycMMcg0jy18DxkUyh5Cc
         icuOwgt5i4StwGbLzBKM8rhlzKcYA0Xi+H7z0wKKyu6zTgukSmPW/H9YC3pILKFBx+Ub
         mr9piED+itnx9LBoDkFcxupFxUgYczqTxw4XzaLYZC3xxyUvK2RC0/6es1IJPyskgZkB
         lpy6UW2mblosqmPLeit7TZkMteHTWNPT0cX7AIXJCxTn2ySJZo1oXk83szE9rYDqAL4i
         9BeYiXYVJkrY04AhcDahdteXbzdQmp+jGNX+CwB3LsqcESoKqRF/s2iHoiDWpShDkd73
         dIYQ==
X-Gm-Message-State: ACgBeo3sg1HAplugcjZNIhByFBE2zOnj12gh3SWKLtbnDbvVY31VHyOC
        WQiEW2PZO2R6RuPxz9q1Y04DnA==
X-Google-Smtp-Source: AA6agR6JA6GBnBGknYQQv1bEljRj1wwgVKxesuxvpYL4LbpUp40krC6FUxmQJ8UzEq5aQKzSeHa+pw==
X-Received: by 2002:a2e:8544:0:b0:267:7e5:a623 with SMTP id u4-20020a2e8544000000b0026707e5a623mr3972553ljj.5.1662045962069;
        Thu, 01 Sep 2022 08:26:02 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id p27-20020a056512139b00b00492dbf809e8sm1891758lfa.118.2022.09.01.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:26:00 -0700 (PDT)
Message-ID: <7d28d450-c90a-398a-3074-5d8237fcd051@linaro.org>
Date:   Thu, 1 Sep 2022 18:25:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: interconnect: qcom,msm8998-bwmon: Add
 support for sc7280 BWMONs
Content-Language: en-US
To:     Rajendra Nayak <quic_rjendra@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Abel Vesa <abel.vesa@nxp.com>,
        srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20220901124730.19460-1-quic_rjendra@quicinc.com>
 <20220901124730.19460-2-quic_rjendra@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901124730.19460-2-quic_rjendra@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 15:47, Rajendra Nayak wrote:
> Add a compatible for the cpu BWMON (version 4) instance and one
> for the llcc BWMON (version 5) found in sc7280 SoC.

+Cc of few Linaro folks.

Awesome! I see bwmon is being used! Rajendra, do you have any particular
needs/todos for bwmon or other related pieces?


> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index 32e2892d736b..cac915c5c2aa 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -25,8 +25,10 @@ properties:
>        - items:
>            - enum:
>                - qcom,sdm845-bwmon
> +              - qcom,sc7280-bwmon

Could you put it in alphabetical order, so before sdm845?

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

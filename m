Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B52FE56222F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 20:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbiF3SiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 14:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235176AbiF3SiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 14:38:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B9417584
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:38:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z41so56588ede.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2DwEM0qN8ptN2i11wSwIxwERJqz2l48AZXNzyEzFpDc=;
        b=cNYBI273VbE+YS8dSUNXib07/1hOFtWSnlwLabTH/pH5jbi6ghQvicYI9bqFppVBQ5
         bRjecihaozaIBQTwXBUMur6ONNFxXJ3jSi0PDl4pHw2Wc941rLKQpaTlBaI6K8FK4P/D
         KrF4YdIABvpqW9Ew2N+zH3okrNI+mUwWf3IGNX0V/iIkRdIlBtQJD+e65rpDI/Tty6UM
         SMqIfPXgXjUcZOqkh/j4SNiosPUD2qoOee6GkSkQYSEs38OUssBaUNAuFALSORPzXSGC
         GqXwoppoKYVsqWvJT/P4SLs4Ule0iYEX5YS4sZkzS1QDELV6l4BZNtx7LpafzxSIXCtn
         nT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2DwEM0qN8ptN2i11wSwIxwERJqz2l48AZXNzyEzFpDc=;
        b=Wdaq9ufAfsoLwfiAtVsBNvCzzcTjuLkzP9hjDaMdNxyq2kJgw3NzpyHIXj+W5aoMI6
         Vb41iIVGZsGXMxSBhOhtpEvoHdLlYUzMORynN3etTw7qxKrwSn7mZTJ9EuBZfbLUT9Tu
         +I+7SxveMAh9GzVN7aGznaWY6JfnDb0v5v/dmTPKEy88NdXQBLhgIi2y6fydQ6VvIGV4
         TKJCOPwBPM1l2cl6a4arcSSflZuuyH0mADsJlnZt4vgRAX/YpZN+EByky1JaO5/pt91N
         j9IL5bQedgFXyWx8cbFkbbDxe3mEtnhB2AZVMawNqlcRAQvIfxxQN1BfYtU6TTzVvn+j
         E0cQ==
X-Gm-Message-State: AJIora9gdUhPCPG+5jaJWMwgR21nfdCvxZSmBVXwtF20uxYPT8bcs7gR
        ADX3+wBgOFleucM2gjh+uUHpLw==
X-Google-Smtp-Source: AGRyM1vuyOxW82jIW7r9UF2V1ofcD2quQQ/dTTrpq1GH9PYUiDLvQx1LBnxuFB68D5Kq4WY2sPeDcA==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id ew8-20020a056402538800b00435071b5d44mr13163885edb.364.1656614297494;
        Thu, 30 Jun 2022 11:38:17 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e34-20020a056402332200b00437d2b6cae5sm3617447eda.83.2022.06.30.11.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 11:38:16 -0700 (PDT)
Message-ID: <f86cf3e0-d678-f134-32cc-92143dc42ce1@linaro.org>
Date:   Thu, 30 Jun 2022 20:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] dt-bindings: mailbox: qcom: Add clock-output-names
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220630043536.3308546-1-bryan.odonoghue@linaro.org>
 <20220630043536.3308546-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630043536.3308546-3-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 06:35, Bryan O'Donoghue wrote:
> Add clock-output-names as optional so that SoCs such as the msm8939 which
> have multiple a53 PLLs can latch the appropriate output name in
> drivers/clk/qcom/apcs-msm8916.c.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index f342494fd6108..7f3816cbc0353 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -63,6 +63,11 @@ properties:
>        - const: aux
>        - const: ref
>  
> +  clock-output-names:
> +    Usage: optional
> +    Value type: <string>
> +    Definition: Name of the output clock.
> +

Not a proper DT schema syntax.

Best regards,
Krzysztof

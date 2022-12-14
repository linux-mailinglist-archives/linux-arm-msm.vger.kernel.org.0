Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 014EB64C65B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 10:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237979AbiLNJvm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 04:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237986AbiLNJvD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 04:51:03 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCA021E29
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 01:50:49 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x28so9514590lfn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 01:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rcWSN//JeQmgBND6AUI/VMRHM2NmUklHc+x2zZ4EJT8=;
        b=f6Hgr9Kk6otW+ghrw1Q9z5cx3WleBccvOr/+gCWHxz3RNHREWN0ois+5aHmbUWzTaZ
         NXK/+q2XW4Tp6TssRggurTYw5qm5g8L4a5SI7fXaYxQ6NbNbnN7u0aqNjfB5BmrzLcIE
         ecQVnrlQcAGpa2ObzYFsnItuBuzJp4As+dnF+57CPuq0tSLeCxpiJpuu4PGlHQzQRx0K
         AHtguup6mmL+FePuZwXa0ubkfovXTfe1Zb37lxYN/GpkWNj07f1qf6Jk7tX9LTLfwPuG
         8xnyTZoM+OdgWhVVZuyH6YKroCBgWCxnvqtKD4UDxVrUXlEIbshZApTOwzdzhsIJsdcm
         ia7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcWSN//JeQmgBND6AUI/VMRHM2NmUklHc+x2zZ4EJT8=;
        b=wOSwBjUViaFShd0CISI0GpOrHLHcx7lYvnwHY1KpbrARc5QmA6Z+CciJZlgfClPcdO
         2WXw+ojIgUPg4MEtMeZ8iopzu+so0UDUp3KFeMUNX5Sm6CQY+bYEEZgfd7CuiqRWo/w5
         iAPzxx7ESzLa+dNsZgHQ1mQTaTGyjbV7CZZxj2fb70XW25SeYk5PuFJgIViXLjVYWusJ
         n3zer5+ViIKf1neLGXoWKXEEoeMoY4wQnnZ2NfvE1hRo7/bUmZUcBEFiXTpt21UpIb/l
         KZzN08XulkEhkPVy3I8wfO3HkzVnTiab0YuVQZmsOBZ3qe3B/SrRzcsmocFCx1+juLnG
         w9xw==
X-Gm-Message-State: ANoB5pnFZ8ntVKg6ejNWbni01hAPZHlwDNan8nA54NaWdOQMdt8wz5wB
        AoNxpb4O3fZW3ZKR4f5TOHWiGFKWYVsQZuEY
X-Google-Smtp-Source: AA0mqf5StJ7nFxoBNOXexnamJw08OKfURdTtDU4kjwbpt6W2AVPUIwrbDi2hIBCG90qP6jyRnQ3GQw==
X-Received: by 2002:ac2:560b:0:b0:4b5:9b8f:cc89 with SMTP id v11-20020ac2560b000000b004b59b8fcc89mr5760847lfd.55.1671011448038;
        Wed, 14 Dec 2022 01:50:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y12-20020a19914c000000b004b55a1c4649sm744022lfj.38.2022.12.14.01.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 01:50:47 -0800 (PST)
Message-ID: <c4bf26a4-16bb-6ed8-ae70-1947998e32cc@linaro.org>
Date:   Wed, 14 Dec 2022 10:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: Document xiaomi,laurel_sprout
 board
Content-Language: en-US
To:     Lux Aliaga <they@mint.lgbt>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214093248.153245-1-they@mint.lgbt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221214093248.153245-1-they@mint.lgbt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 10:32, Lux Aliaga wrote:
> Document the Xiaomi Mi A3 (xiaomi-laurel_sprout) smartphone which is
> based on the Snapdragon 665 SoC.
> 
> Signed-off-by: Lux Aliaga <they@mint.lgbt>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 1b5ac6b02bc5..a72fbb6b4b2c 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -693,6 +693,7 @@ properties:
>        - items:
>            - enum:
>                - sony,pdx201
> +              - xiaomi,laurel_sprout

Invalid character - underscore. Use hyphen.

Best regards,
Krzysztof


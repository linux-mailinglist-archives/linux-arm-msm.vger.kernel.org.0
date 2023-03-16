Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5EF56BC7F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 08:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjCPH6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 03:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjCPH6e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 03:58:34 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FD52CC7C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 00:58:14 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id eg48so3962010edb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678953492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulFb/DYLA52m+dsDozOaz91f1oeP6qPYcrJj3qnGhBY=;
        b=fUEGIxxtRkWzFEhAT/+kr6Kn04ygSL1OuFvhmYCy4YBNSSiJ2qWP0q/NkyiPu3UuQs
         b6mNdHaNdCR/FnO/aet54cHqh9Vd6eV6oc7podiVui3Us7Zrluqn+tHzDFkMMoQkMqKs
         aDq80FtSi1Fq1kvAQodHUmHuf9FUmZjkoo8q4K0b0SVo1jRBJ6/Rz7udiQN/QSMxtCIz
         rPin4y9vUC2gE5efCZRLbfNMYMN7VUWnXwyI2IbRjbnU0hZgWRYAByLvkbnypGyod/Nx
         tYEuii6Ts2YA1TTZWMTx1feqgImlAfhG2MJFcWAYtis2Nqx0IIKsvNnu90rclVebtqNT
         s35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678953492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulFb/DYLA52m+dsDozOaz91f1oeP6qPYcrJj3qnGhBY=;
        b=36HMGhN8jtMwKt5Na3ddw1p6bAdeuSFzFymTcyIYEqUwydT7fVaIhtgH/q+casXsn0
         GJ9uWUb9ruhAE8FzCddYwY8tPrzZFMPT05qSzOxz87dkYgUlRyQj+D5mcnvznTcieMwR
         G/zjLRqBsOo2sbBHM+a+OZgrJTJixkATcxjw9fB2wLIN3iFsRVp2AG42XwJCgSjZCTTb
         +nFZdTYFc8mpeqlCIpflhrJDhWKubS3VzcAzNiY8SPg6BuiEhtaBadfuGNIcUyuBsCLN
         xBcBatpBQ5FG/Y2FG3/hm2ZQfLTCXbGygWNIhMLeFhv3i3rK70GcAuG0pbQ5wen+OSuG
         ek9g==
X-Gm-Message-State: AO0yUKV96ci2fij3aT5qPqIB79pfBGFdRqX1eNvdLhfiBLeefjlZPI2B
        fkp+VbPsdY1FlzZduSbEUwtQgA==
X-Google-Smtp-Source: AK7set/smxfxpR9RQmrpknDR72xvmSPWaoLuoz1rzftWFJy6oCRtwnAAhkFuf6aLXLHwGS57XXXF8A==
X-Received: by 2002:a17:906:5f90:b0:92b:f019:a9ef with SMTP id a16-20020a1709065f9000b0092bf019a9efmr9542124eju.31.1678953491903;
        Thu, 16 Mar 2023 00:58:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id le20-20020a170906ae1400b00921c608b737sm3478981ejb.126.2023.03.16.00.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:58:11 -0700 (PDT)
Message-ID: <988ca4d1-d421-84e5-f9e5-80b77a992467@linaro.org>
Date:   Thu, 16 Mar 2023 08:58:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net-next] dt-bindings: net: qcom,ipa: add SDX65 compatible
Content-Language: en-US
To:     Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        devicetree@vger.kernel.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230314210628.1579816-1-elder@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314210628.1579816-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 22:06, Alex Elder wrote:
> Add support for SDX65, which uses IPA v5.0.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


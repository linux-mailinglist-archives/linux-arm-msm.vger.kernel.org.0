Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC85D629970
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237921AbiKOM52 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbiKOM51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:57:27 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABCC3BE
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:57:26 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id d6so24245607lfs.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fvNsAkkpsycpw3EP4lZA+TzyoR4ZZcWV3h9+Nv7rTWo=;
        b=WKQMpE5EizyxVlmnFPdxP5KT+UKlsn71GeFgMjIV39MXDEk11l1CBOjoC1RghIOGLg
         5CJDT5sl0cgHUctIzCU92PN/rZ/YmUoOYfM6riiq+gGWb6dvLJ7yYiyRAOkxnZSYZqcX
         APhXi49+YFAJsrWqZvZ5zpC978BuiEy3GnCpudwqZK7A956QX9suXE2+r+MRLiTkc8Ol
         toN17jJQUAw0gyFQVjW91tpVoLJbjxYCdbUkIz2abJRITClJlJvC2Nxe/tbOahHXSDms
         LIFSTPRO3zlB0ywBGCxKs/8BtJs6sV9U5P5Y3J98aZp6Z4ISX0oE+7ZTTQDjOhvvH94f
         3jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvNsAkkpsycpw3EP4lZA+TzyoR4ZZcWV3h9+Nv7rTWo=;
        b=xwOc81DqwsPgHa9aNZN852uF5gE5jcLGI4txKypc4L3WHgBY9aHl/WqEsuQjlbY8Cw
         G26PFB1XdWkV+1ma+ICD3DyqPXxQMx6cHvnusPE8oh3aE57u8PP7tbzPsSDUWy4vDJ1U
         2qIGePv6qgLtluxubY/91ugnHb8E4+9aeDl8KM2Bht3mnvINJfygO5qZWSynDiZT1TH7
         NDpUx8C4qIS7jTow9bLYVxeX9yO+tXgoi+ZbDgWwM/+pTvXt/UxGffAJnzMufGbzUyTw
         BdPyO9vpLcCh2wDqNbbKfJGBQfvNLGqHpK3wNOXREUY2U+hk5AbIoQIpRSc+j+hta/wJ
         wS+g==
X-Gm-Message-State: ANoB5pns2GWeFxBhMYX1arCOO+W9+cAZiWqmElPh+DQkVArZrQJ8s6+v
        MZxYYe0NVYrbLzdT+CqLJPhK/g==
X-Google-Smtp-Source: AA0mqf7zLk56mnSDx9GWt+sbf1WJwSIQwMZwIJNCiz3YfseahePjxFiMGlizO/j4lCw3S3pjzsQYPg==
X-Received: by 2002:a05:6512:2587:b0:4a2:645b:15cd with SMTP id bf7-20020a056512258700b004a2645b15cdmr5307692lfb.308.1668517044948;
        Tue, 15 Nov 2022 04:57:24 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z5-20020a2eb525000000b0026c42f67eb8sm2501859ljm.7.2022.11.15.04.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:57:24 -0800 (PST)
Message-ID: <b00e57e9-62b8-7f80-0929-85d1c2131408@linaro.org>
Date:   Tue, 15 Nov 2022 13:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next v2 1/5] dt-bindings: net: qcom,ipa: deprecate
 modem-init
Content-Language: en-US
To:     Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221115113119.249893-1-elder@linaro.org>
 <20221115113119.249893-2-elder@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115113119.249893-2-elder@linaro.org>
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

On 15/11/2022 12:31, Alex Elder wrote:
> GSI firmware for IPA must be loaded during initialization, either by
> the AP or by the modem.  The loader is currently specified based on
> whether the Boolean modem-init property is present.
> 
> Instead, use a new property with an enumerated value to indicate
> explicitly how GSI firmware gets loaded.  With this in place, a
> third approach can be added in an upcoming patch.
> 
> The new qcom,gsi-loader property has two defined values:
>   - self:   The AP loads GSI firmware
>   - modem:  The modem loads GSI firmware
> The modem-init property must still be supported, but is now marked
> deprecated.
> 
> Update the example so it represents the SC7180 SoC, and provide
> examples for the qcom,gsi-loader, memory-region, and firmware-name
> properties.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


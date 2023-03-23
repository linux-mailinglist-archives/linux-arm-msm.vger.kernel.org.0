Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2816C60D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 08:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjCWHcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 03:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbjCWHcd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 03:32:33 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657501E9C5
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 00:32:29 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id cn12so36980083edb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
        b=w3awquQKTHeWDx/yCfCfHfdrLUAb+7cmTUbCxlDsTXtHqnC/KTdLvanL3T8U7h9Hn+
         T2KyJY5oy1yPQyU6mzgUZh1CzH88VAPkqy8k2SW2SwKq45G6DggQbSFKp7id0BSjS8Rp
         VoHzkI+PUoz4dQKhOTIWOYjtIUHmYVlbCNMKTKatuW6HXvZvM2uiVdheYJwhuBaoVv6r
         XUFm0HfHybe27otwo9wNuL61H0cKrxmMAqzuTsillUtZ3oANbuyNtcnMhqKcUnzq/u1/
         nw9/mhXmeh0zZJ/KOLNvHLyQee+sIyAd8AbaOqnSeke6JK3XQ1qUndFUTGYQb65Q7Z6P
         x2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556748;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5krubHHgKYJDCf8X0UvJA7y8q2NbVKxEV7FY/oHuAps=;
        b=Z1eNJvS9JbzqXQCm+ou1+iPXFfY6rZ5FjClhk1t3jLhGdi+rQowApJZYlKqQdQflkj
         kMEg/A40w3VxLaw9MICpKQlXacXXv9wlgWlRUl3HLrChbm52SGmN4ePa/HNLE34+RH9O
         vN7Q73y7iVUpWElZV9E1OgVtbG9McYPlfLjKzkW4Ef5vnHUHGS4ho0rCnpfmJG3fmMAL
         nS8J9NM8Y0NxiVYxGb70EuZW1uSoE0bolZqHUsZvIsbQBro/8MjWAg2h64uYsfBC+67x
         7axDFflcekBn0g9D9fI+cnk2SHHpsX8eea14AYQxrrrxdp61nEPYjBDLseNUrPXteN0n
         8G+g==
X-Gm-Message-State: AO0yUKXQu+D99tMoIFaSImSBqE9hMzUmjfeyZT1i/M59HhdArdleFBnS
        S538m9tuHYZhWRjpkyHaqYYjtA==
X-Google-Smtp-Source: AK7set/JB2xOMNVpHVZoowg3tmnBogfsihGn8UMB3eRY9FKEh8TiRmePaafNm/r4PfEQeqBy+Y5BPA==
X-Received: by 2002:a17:906:1152:b0:930:c417:1ad2 with SMTP id i18-20020a170906115200b00930c4171ad2mr9679120eja.65.1679556747895;
        Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id v19-20020a1709067d9300b008cff300cf47sm8240016ejo.72.2023.03.23.00.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:32:27 -0700 (PDT)
Message-ID: <8fe6ee60-b8e8-e2d1-881d-544e12a7325b@linaro.org>
Date:   Thu, 23 Mar 2023 08:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/apple,i2c.yaml          | 4 ++--
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml  | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 4 ++--
>  Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml       | 4 ++--
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++--
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 2 +-
>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml          | 4 ++--
>  8 files changed, 14 insertions(+), 14 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


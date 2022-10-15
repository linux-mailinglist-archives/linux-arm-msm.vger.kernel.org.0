Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4885C5FFA47
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Oct 2022 15:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiJONeo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Oct 2022 09:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJONen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Oct 2022 09:34:43 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D9A1A207
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:34:39 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id g9so4905957qvo.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Oct 2022 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jbC/dTgT9zwc4R7yvMOOqEeEKsSGXBD2PJzao5ApGA=;
        b=tyaPqt5f0ie3qyNAMa9G0VHvX8adDYBbLR250C1W1+aiR03eMIPP8M5POeMPLgbmNa
         AvnSDW+tqCFxhw4zQGEbEkb3xs23d8Irxomrgm9h7v4IbxTsoOBtzhUL+40BT1SQAVL8
         fwa4NLHsv/Q+HPAqyWmmGF4hWYuEcNHqT0NyyFfRv1L77xiU2AhYrMMY7my5YLU9XWll
         MRaIw25u7bIiDQTH3Fxx9cLMbVFn5MF3LyG6l3QGNyHUvb4gxjO9u+i24sgDPd43LXjY
         IJnZBU/tJ368wk6AXZwKHewZiwx/i1r37XtZSJLHgf7abx5V9oG1Vktt4Kbd9vKQs6Gf
         CTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jbC/dTgT9zwc4R7yvMOOqEeEKsSGXBD2PJzao5ApGA=;
        b=qFWymTX6I/zOUtvRjDNub5nq0yZ4XW/K7imKBgei6ukU500eDFG6oK1jhSKls0KGL9
         JXUy0T7vk0Vg9uwczGPudZkTRbb2sM6ILpDHvMPMSePKo1SpEuHOKQzYztYFEqBlWqKf
         pc/M3yIS2zQP4NcBD98zrek9dTZR1xUCFhRmXpuaK/abpoxC26EaNG5I+SHE8xYdMtUN
         69iKdPYJMyXlhredfzQMmlCSFQSoZ1JUGrui1aDCtcx6zXf7FT+69lG1meRxExAKvLCG
         lMkNRkXoEhZYFhVc/868KJRnFJrsUAWqydFvIaYbBb2TvO9zORlP0dfiACfwQ4qBMcm7
         HNhA==
X-Gm-Message-State: ACrzQf2Wb1nkpnOpoclsFOL/V5KYqvJkvKfVk3a6FtcS/G+Dqo2w5sBg
        PNbZpPooLWl4YW8BrlzNkIgkAA==
X-Google-Smtp-Source: AMsMyM7eSzYYXuFh8rXP+SNAVdND4Jdbr0FGlfuGsLZ/CRHHbmrKIVAFYohc2QGFSP3eHvxfWSO/ZA==
X-Received: by 2002:a0c:8086:0:b0:4b1:cfa1:3c35 with SMTP id 6-20020a0c8086000000b004b1cfa13c35mr1950948qvb.47.1665840879112;
        Sat, 15 Oct 2022 06:34:39 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:161:5720:79e9:9739? ([2601:42:0:3450:161:5720:79e9:9739])
        by smtp.gmail.com with ESMTPSA id d11-20020ac8544b000000b0039a3df76a26sm3920750qtq.18.2022.10.15.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 06:34:38 -0700 (PDT)
Message-ID: <55d026c0-9c54-f5d6-bf5e-da71856f0698@linaro.org>
Date:   Sat, 15 Oct 2022 09:34:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: scm: Add QDU1000/QRU1000
 compatibles
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221014221121.7497-1-quic_molvera@quicinc.com>
 <20221014221121.7497-2-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014221121.7497-2-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2022 18:11, Melody Olvera wrote:
> Add compatibles for scm driver for QDU1000 and QRU1000 platforms.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index c5b76c9f7ad0..47083f47f109 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -38,6 +38,8 @@ properties:
>            - qcom,scm-msm8994
>            - qcom,scm-msm8996
>            - qcom,scm-msm8998
> +          - qcom,scm-qdu1000
> +          - qcom,scm-qru1000

Why exactly we are no using qdu1000 as fallback? That was the
recommendation in previous discussion.

Patch is still incomplete - you still do no have proper changes in allOf
for the clocks. If you want to say that this SoC does not take any
clocks as input, then they should not be allowed.

Best regards,
Krzysztof


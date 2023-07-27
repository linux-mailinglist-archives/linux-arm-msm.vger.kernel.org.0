Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A50E576472A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 08:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbjG0GrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 02:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjG0GrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 02:47:16 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F97B2129
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:47:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992e22c09edso70372066b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 23:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690440434; x=1691045234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8AfkdTx8aDEG/J6ohJF19yNL93fMDwOc4t4zIdlBZ2E=;
        b=jWp7VWS5gIbTB2zl0kt4Rvezmk2BgNEEjiiodpr1HtfXj8S6OKr9zkCKAz1+Pl5LiI
         FxrRIe5yy3NKYfyZX7Y5yMyqzi+6eFyxyCHeFgbqgfqDHV3GARewdjhtS8qwn1ZjuEn/
         PIRgL9h+f/xrgISC8j+ykE6NTjajgqQRBZFjoAvsJjQ27TsU4nHCLH7R97fguHWfQfE0
         uyh2gmDI3olvw8h7n6cz5rJBDKyoXPFQ//cnzWCnu5YkqddHh6WVIKMSy7QjE1D6JOtc
         DnjXFJ5cUazgkIdfVxd/QCN27mdhL8ByeS8rOoMwGHYckdmeLyD+TNBwi4fZHQttNPth
         emNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690440434; x=1691045234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AfkdTx8aDEG/J6ohJF19yNL93fMDwOc4t4zIdlBZ2E=;
        b=GMo5nfKho7E270nRxU+qtZW3mo0JYXdlUxndi5OpiHrLXEpa1XnFngbQlNv39dMFU7
         WKmQrUeiZ4D7Fb0C+0g4WSqvLVYZ075X1icw8KTvuHDdlghk+qSRvo73Hxj9xatNeM1g
         5G0oWiRi9iyGMGa/FVBbGUXVhckAlBHAj68JnmhNZjGbrHjbwVuMSIhHhcnEo//rRQ6g
         03dmvmt16XULeVKBX+6BpjsN49iXFgfYG8Q7YcCk1oniYdzXnwlsG8Aeu8hNrGyGVk2K
         /tGJdtlCcr4k43NPSftbERxkTr+cAFJillNrQL8IuGE9iukAkusKSquMEY0WINNyQzkY
         AyxA==
X-Gm-Message-State: ABy/qLahLwx/D4/Qj1/dJJJTMu54XG2WR1tFRzE67Wa4zREUzJiM6+7m
        Edmd3Y0wmKo6hE/D6HJn1K7QCw==
X-Google-Smtp-Source: APBJJlHaOtaQXLEUMwD7ynqgJvlhwXcmtHFmtE3VQA+fsZRixVtmPQJwQX+Ask+KjivM6u5LV3s4Vg==
X-Received: by 2002:a17:907:761b:b0:99b:4aa3:6480 with SMTP id jx27-20020a170907761b00b0099b4aa36480mr1310855ejc.40.1690440430456;
        Wed, 26 Jul 2023 23:47:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906408700b009786ae9ed50sm380391ejj.194.2023.07.26.23.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 23:47:09 -0700 (PDT)
Message-ID: <5288c817-3cf8-2b8c-6187-30283353060f@linaro.org>
Date:   Thu, 27 Jul 2023 08:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 1/5] dt-bindings: phy: qcom,m31: Document qcom,m31 USB
 phy
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl, john.garry@huawei.com,
        peng.fan@nxp.com, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1690439352.git.quic_varada@quicinc.com>
 <f88d5add717e90e136a701f39fe80d00f1052692.1690439352.git.quic_varada@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f88d5add717e90e136a701f39fe80d00f1052692.1690439352.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 08:33, Varadarajan Narayanan wrote:
> Document the M31 USB2 phy present in IPQ5332.
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---


> +properties:
> +  "#phy-cells":
> +    const: 0
> +
> +  compatible:
> +    items:
> +      - const: qcom,ipq5332-usb-hsphy

Please keep compatible as first property.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: cfg_ahb
> +
> +  resets:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      Phandle to 5V regulator supply to PHY digital circuit.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    usb2-phy@7b000 {

This was actually better before as usb-phy, I don't know why did you
changed. Especially that you already changed once to usb-phy and this
got review tag. It's fine. If there is going to be resubmit then fix
these two issues.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


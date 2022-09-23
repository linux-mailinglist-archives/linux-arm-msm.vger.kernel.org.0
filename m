Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061655E77B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Sep 2022 11:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231570AbiIWJy1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Sep 2022 05:54:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbiIWJyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Sep 2022 05:54:25 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD7BB6D78
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 02:54:24 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id b24so14031054ljk.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Sep 2022 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=d+dhTVJjoRfXkweI2ODgjN4brtTS+mqkr11acUYRy+o=;
        b=AqfqLkalasjPXlJMliDnpawDs0/V5gehiT9mJ/k+PTkAD7yPIU6j8tWhTtYnD66SLW
         6cgoXml4LHuyDp1DAgkIEUAgcDe2Iz3UgZOKykM+xDF4EB9FVeQHZIhcmgfLhCKWLRL/
         f75d9lacQG6qW2KBgW9ln5jdBj53ia6ZmdlXHy2aQlD2ipkZM/gvs9WpIqV8s7jimDPu
         kGiDwwPA+K/SVKf0qxl6vuti7eOHkgtUH1KSlquZsIhZKH+o5kBjo42tDH0OKPgbIqSU
         gAIqvO2GFBwtGRwAXyRI1v1ck8225jgKGUQrlyk4qLX3zpYsoGSYSFHxQ03MLTaqkATc
         F/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d+dhTVJjoRfXkweI2ODgjN4brtTS+mqkr11acUYRy+o=;
        b=4lkc1kJgdZlwoVxESLOC9TolmfOP1uD+ki9SFteGkS0TRgRf02XYKPLmLp29qEajEa
         Bopxvk/2/lJmSzbZGf/pqfKlw7hsk/PI2Vams6WA3ixwqOcRTzk9CkihGcRG4QLJoiQg
         3yMIjQYkDiT9TSN7JY9WoaG3Aoliq1MBmll4ra3czlg+Du59iO8G2bQhbxaevadW21YQ
         gj588EeFaRfRySnNYHzHqwKKEpBblUIRPEoD2lINLo79oBQZus3r4h0eNnF4FT9V91BZ
         cUfgpFvZeHwL+SlNkv5LQDWKAJmS33e5JnVEt69Mxl/Z9Ex/UD4hOHhL0UbNrnYxBhG+
         nJKg==
X-Gm-Message-State: ACrzQf3yc762pLQSYjb9TmURupfaGcLRTwI/n+ZyeXhfwXSVI91N0Zrc
        0uVWcQ6o2t2DNXVnrpHZVYl58g==
X-Google-Smtp-Source: AMsMyM6DjYfSdWJUKKd7cwNauVT/Wzxte0XwqIGfp4RMIt0KBUIgQ51H/crXBHaf4Wt34ZHhKS12tA==
X-Received: by 2002:a2e:9bcf:0:b0:26c:5a9d:531f with SMTP id w15-20020a2e9bcf000000b0026c5a9d531fmr2410116ljj.144.1663926862673;
        Fri, 23 Sep 2022 02:54:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o10-20020a2e9b4a000000b002637c04b472sm1302188ljj.83.2022.09.23.02.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:54:22 -0700 (PDT)
Message-ID: <e3bfa28a-ecbc-7a57-a996-042650043514@linaro.org>
Date:   Fri, 23 Sep 2022 11:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] dt-bindings: dma: qcom: gpi: add compatible for
 sdm670
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20220923015426.38119-1-mailingradian@gmail.com>
 <20220923015426.38119-2-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923015426.38119-2-mailingradian@gmail.com>
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

On 23/09/2022 03:54, Richard Acayan wrote:
> The Snapdragon 670 uses GPI DMA for its GENI interface. Add a compatible
> string for it in the documentation.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index eabf8a76d3a0..cabe6a51db07 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -20,6 +20,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7280-gpi-dma
> +      - qcom,sdm670-gpi-dma
>        - qcom,sdm845-gpi-dma

SDM670, SDM854, SM8150 have all the same xPU3 block. They are
compatible. Are we sure we want to keep growing the list in the driver?

Best regards,
Krzysztof


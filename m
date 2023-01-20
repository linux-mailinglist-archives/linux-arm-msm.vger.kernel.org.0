Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A470E674F51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 09:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjATIVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 03:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjATIVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 03:21:47 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECC878ABD
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 00:21:46 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3082703wmq.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5r0poLW+R6ysfXs1bTpPOypYMd2oCyat7Jcwz7j6MA=;
        b=aj6DvKlUhAaa1DbJ1Q3iJV2ekNbqygluluyVl9ZYZinksDMCsoCjDj61eHBIy1ytb2
         H1Xrr3aGdxvzq83AhDLDmHe5Ad0sJ7zdIs0gj9FXnr1iNUMLHFup+gHUw2lU8iGjWJYH
         D2iSbG5jo0xXhGZDWyl6hMsqE4Td0q/Og2CY7rEggbouiIpZv0nlerCeBFLIoeVQM/A1
         S5urpCEO+lrUtdEWBZ8VbVX0vzcBozZ/0J0Y37rNqB30daYratypXCsVqccjDpI4w4DN
         6TPVcgC1UO/afwoNmua+HtIXmNRHy3aEJmjOZHNwo1iasyvFoyi763Y3C6o8bXK9bQ6P
         Oyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5r0poLW+R6ysfXs1bTpPOypYMd2oCyat7Jcwz7j6MA=;
        b=esAx/o30z4QZbPt8/3TUCsZUw1fUCJ4WCYCKDXljeX4yJMHFzCxiPSnQyuM6zpGE3q
         O91CPuh+oqGO4ZqPNikLKAVqlOgAhlhecLGOd9jJFAWePfV39LGM8vy1JiaNV4mv3Jmp
         qcgnZj9lcXmUXA07D0Li2CGLGUDy3dFhQ1Hf48yHD+Uf4hTYBRr4wS6Qe982clU/JNMY
         S63i+N1bhBxUfmtNtFYDnKkmMIZl4yFYknnXvfXcyDmXXRKrZB149Mjj8npfEtlG2/Fk
         B4wBn8XjmxUi01ghOuGWpXygxuaTiwefo/oBbDrRrJl5bJPGR/26hkO6hrr0vuTMQmdK
         3Fnw==
X-Gm-Message-State: AFqh2kor5YwVMztgUmDVAJOr0QntxT85IJt5TnAv8jUHNhXDmIl5eT2k
        zxslFzgG6aylJ2OYZFQHkpAOXQ==
X-Google-Smtp-Source: AMrXdXsHLIbJAk8rnkuvHDSru1QlsqtaxkLfw4R5rwjS66oQ5LXgZU7WXNcWFlfDOJPG741dAQUayQ==
X-Received: by 2002:a05:600c:3ca0:b0:3d3:5c35:8919 with SMTP id bg32-20020a05600c3ca000b003d35c358919mr12640406wmb.30.1674202904819;
        Fri, 20 Jan 2023 00:21:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y11-20020a1c4b0b000000b003daffc2ecdesm1524972wma.13.2023.01.20.00.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:21:44 -0800 (PST)
Message-ID: <862603f6-a69d-f039-4039-70320da39962@linaro.org>
Date:   Fri, 20 Jan 2023 09:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Describe Maxim MAX20411
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230119214749.4048933-1-quic_bjorande@quicinc.com>
 <20230119214749.4048933-2-quic_bjorande@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119214749.4048933-2-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 22:47, Bjorn Andersson wrote:
> Add binding for the Maxim MAX20411 step-down DC-DC converter.
> 

Subject prefix should probably be "regulator: dt-bindings: ", as per
Mark's requests.

> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../bindings/regulator/maxim,max20411.yaml    | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max20411.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max20411.yaml b/Documentation/devicetree/bindings/regulator/maxim,max20411.yaml
> new file mode 100644
> index 000000000000..3d1ba6139370
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max20411.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/maxim,max20411.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX20411 Step-Down DC-DC Converter
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +description:
> +  The MAX20411 is a high-efficiency, DC-DC step-down converter. It provides
> +  configurable output voltage in the range of 0.5V to 1.275V, configurable over
> +  I2C.
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +properties:
> +  compatible:
> +    const: maxim,max20411
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1

Drop maxItems, provided by gpio-consumer-common.

> +    description: GPIO connected to the EN pin, active high
> +

With two above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


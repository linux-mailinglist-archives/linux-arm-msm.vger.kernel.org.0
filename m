Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C95B746200
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 20:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjGCSRa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 14:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbjGCSR3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 14:17:29 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CE0E73
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 11:17:16 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso8799641fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688408234; x=1691000234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSlFXmAt5oolMbr6tP679qhhXZff6RY3Gb+h/82siT8=;
        b=O8V6FIJb6QCwNE55YsoL15LZOs6JdRyMypATmvkcOrDD/Uo37iALfo1ZRFKc+BO+aR
         6UJD3MuH0mNYJ96fF8hrGxVag6vLz0f4ixxHLSkz5JgROUKhIZYSzNeoO/cMxq1ABOy4
         PHPT0uLnS7cT+TWGf05GJa0HDB3bLOON/484PM7gzWePK/zRKNji7Q++nIiLh6lEe7kL
         Iaci0NY//qtWcM7VcXGqC/G1EqEeaSgGXPqCtV+zPuO4Z4XiAAq0rw2vW+rlyr5VUsX0
         UYRlMmC7cA++U7hbFV2xjKJnvWYCGaw9cHq9OanJNRvVaDd8zK4Ez2vTXELhhQufw4hF
         aApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408234; x=1691000234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSlFXmAt5oolMbr6tP679qhhXZff6RY3Gb+h/82siT8=;
        b=L8JyrE5Z7cinJdj8FPVY1m+LTS9ocspM4PcbY1Y3NcV7+0keBbfqrAwL2glw5CUaQm
         cm3q3C01e8jS5rq+ixGziFYQv2ogO2uxq/SJfmQ1bNRl1/BHfKflsz8r37Zu9DQkZ59V
         RIDVATj+iba/7T2Jihm7tz2fl5qiMySmJy+SIXih1WfXe+SQ+l/7i5jsz3uHLUYrBy1s
         BEXm/rE4ExloT6lqCCNbNad4lxykRLfidNN0/SSW4w3kvNiNsyQDNthmJuR/XOB3UWwE
         7d2mMzpKXW0TYG9GqrqWv37RMW0tHPD1GDzVDhbOQGSGoE7Of+qBpItIKhRNkQvPKhAf
         alDA==
X-Gm-Message-State: ABy/qLbH29qyRhKuDe9T0yHD8goo0jgVdo/qD8+lv8wRoWVSnzxVjOS0
        eU5prrqFoLlnMpyTcF3MdBr05g==
X-Google-Smtp-Source: APBJJlFYqk8AsjWf9PKxWzhoTDvI2m8S6a20htiKRvrfbyX/L++Ie8ZIJC0YvUXf8qcTvAeLsojqVA==
X-Received: by 2002:a05:6512:3086:b0:4f9:547c:a3cc with SMTP id z6-20020a056512308600b004f9547ca3ccmr8293048lfd.14.1688408234251;
        Mon, 03 Jul 2023 11:17:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id q8-20020ac25108000000b004f85628ec34sm2617439lfb.33.2023.07.03.11.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 11:17:13 -0700 (PDT)
Message-ID: <847366eb-1a0d-ad58-324c-aa816cc348aa@linaro.org>
Date:   Mon, 3 Jul 2023 20:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/4] dt-bindings: regulator: Describe Qualcomm REFGEN
 regulator
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230628-topic-refgen-v3-0-9fbf0e605d23@linaro.org>
 <20230628-topic-refgen-v3-1-9fbf0e605d23@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230628-topic-refgen-v3-1-9fbf0e605d23@linaro.org>
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

On 3.07.2023 20:15, Konrad Dybcio wrote:
> Modern Qualcomm SoCs have a REFGEN (reference voltage generator)
> regulator, providing reference voltage to on-chip IP, like PHYs.
> It's controlled through MMIO and we can toggle it or read its state back.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
I have a chronic issue where I realize I didn't run b4 trailers -u the
milisecond I hit enter on b4 send.

This was:

Reviewed-by: Rob Herring <robh@kernel.org>

at

https://lore.kernel.org/linux-arm-msm/168814320140.1876966.17866889850041692910.robh@kernel.org/

Sorry for the inconvenience.

Konrad
>  .../regulator/qcom,sdm845-refgen-regulator.yaml    | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
> new file mode 100644
> index 000000000000..f02f97d4fdd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/qcom,sdm845-refgen-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. REFGEN Regulator
> +
> +maintainers:
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +
> +description:
> +  The REFGEN (reference voltage generator) regulator provides reference
> +  voltage for on-chip IPs (like PHYs) on some Qualcomm SoCs.
> +
> +allOf:
> +  - $ref: regulator.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,sc7180-refgen-regulator
> +              - qcom,sc8180x-refgen-regulator
> +              - qcom,sm8150-refgen-regulator
> +          - const: qcom,sdm845-refgen-regulator
> +
> +      - items:
> +          - enum:
> +              - qcom,sc7280-refgen-regulator
> +              - qcom,sc8280xp-refgen-regulator
> +              - qcom,sm6350-refgen-regulator
> +              - qcom,sm6375-refgen-regulator
> +              - qcom,sm8350-refgen-regulator
> +          - const: qcom,sm8250-refgen-regulator
> +
> +      - enum:
> +          - qcom,sdm845-refgen-regulator
> +          - qcom,sm8250-refgen-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    regulator@162f000 {
> +      compatible = "qcom,sm8250-refgen-regulator";
> +      reg = <0x0162f000 0x84>;
> +    };
> +...
> 

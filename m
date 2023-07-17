Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F21E755CCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 09:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjGQHZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 03:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjGQHZW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 03:25:22 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D0D4E48
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 00:25:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99313a34b2dso504372966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578718; x=1692170718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qs4HLlO4LlybLe7Ah8QKFBkS3q2XJN402rj3Q8OPMEk=;
        b=xfIJggQILuXOIT+qRFvFEx7EeufNsrNzYjtck6y8JtPZ33lKP1JAe6KxnjHPBNRMhR
         XQmYcAQgQaXXavpmqLlpWcgklGnAntEqbxpScnQwFMzlOyfXZLbOWa3qN8GfUAaTtx4O
         bgsWVNRulYggbDsTqq/i3tbpPZroumqSEi8nZmiPPqK9XX0HRX0S6m8puHbJqhF7XkVQ
         n6mA3T/rOamv1a1KNShWgJ5jEuRZJ4BxVd9wQ2Fs2goDUIyN1l8gRv3wFRD7ItBFUjrI
         q0dJD+PvBT9YaeKX/8mU1tyolE70/LypiQRuG/mEas86+T1OApPOybLu0e4drrMYZdpz
         vRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578718; x=1692170718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs4HLlO4LlybLe7Ah8QKFBkS3q2XJN402rj3Q8OPMEk=;
        b=hbTFHFHP9ng4Cw8FVF7hcwlazPCmKQ9TjUYW9Jkp9jkRQcrlGwdXqrmGKKk3J9NGO7
         yAwKTSxK044bOSBbiTVAEKeEV7MOCau1cjHZQnMmxhs8HKqlhZEO9pFoCnyFIaJ1aEzR
         8ft99OiPliyxtD2OkhfigA+0LYijat+1z128qy5YHbL32+Tlb5AuRnLb8i4ckvC6ClZP
         LWDdRpePZls83wlCV5qFLkv75xMVL6m6fuOLuyH6GAhEP4AxdVcoATcZLGcVJIh8nxBV
         ql6kc0UZWsXudYRtWiT87YQ4PSVQySr3ms1Hzh4pTZDdp775JJrcUzZ82PBNSJdjO1AM
         uncg==
X-Gm-Message-State: ABy/qLZxR9yaWhStYaCLFopHM38VQZ+95k03tUcRCS5f01DxNZiP5kjd
        wMn8rbR9KDXzq9kIdMINzZIQAA==
X-Google-Smtp-Source: APBJJlFtMxvLm/eKNB8QByqh/kv+BMVjGXQbcUFa9xlTwZ0reAw5LaF5nWU9p8oXGxISfw4wO7C8Ng==
X-Received: by 2002:a17:907:8f17:b0:98d:d26c:e142 with SMTP id wg23-20020a1709078f1700b0098dd26ce142mr9536118ejc.46.1689578717832;
        Mon, 17 Jul 2023 00:25:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f21-20020a1709064dd500b0098951bb4dc3sm8770472ejw.184.2023.07.17.00.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:25:17 -0700 (PDT)
Message-ID: <132e9514-7eb9-8915-6130-5bf656c1aaac@linaro.org>
Date:   Mon, 17 Jul 2023 09:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/6] dt-bindings: phy: qcom,qmp: Add sa8775p QMP PCIe
 PHY
Content-Language: en-US
To:     Mrinmay Sarkar <quic_msarkar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, konrad.dybcio@linaro.org, mani@kernel.org
Cc:     quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
        quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
        dmitry.baryshkov@linaro.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <1689311319-22054-1-git-send-email-quic_msarkar@quicinc.com>
 <1689311319-22054-3-git-send-email-quic_msarkar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1689311319-22054-3-git-send-email-quic_msarkar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2023 07:08, Mrinmay Sarkar wrote:
> Add devicetree YAML binding for Qualcomm QMP PCIe PHY
> for SA8775p platform.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml      | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index a0407fc..ca55ed9 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -16,6 +16,8 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,sa8775p-qmp-gen4x2-pcie-phy
> +      - qcom,sa8775p-qmp-gen4x4-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x1-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x2-pcie-phy
>        - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> @@ -30,7 +32,7 @@ properties:
>  
>    clocks:
>      minItems: 5
> -    maxItems: 6
> +    maxItems: 7
>  
>    clock-names:
>      minItems: 5
> @@ -41,6 +43,7 @@ properties:
>        - const: rchng
>        - const: pipe
>        - const: pipediv2
> +      - const: phy_aux
>  
>    power-domains:
>      maxItems: 1
> @@ -141,6 +144,20 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sa8775p-qmp-gen4x2-pcie-phy
> +              - qcom,sa8775p-qmp-gen4x4-pcie-phy
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 7
> +        clock-names:
> +          minItems: 7
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:

This probably works but is not obvious and easy to read. You have here
if:then:else: block, so else applies to your variant. Change all these
if clauses for clocks into separate clauses per matching variant
(if:then: ... if:then:... if:then:...)

Best regards,
Krzysztof


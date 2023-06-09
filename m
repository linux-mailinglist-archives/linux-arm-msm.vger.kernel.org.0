Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00A9729B87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 15:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239998AbjFINX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 09:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240527AbjFINXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 09:23:23 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9936C30C5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 06:23:20 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9745c5fed21so267369666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686316999; x=1688908999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zm37aEn/D5tCYQONbUQ1DyMcyptw+lvB4x1L6xAD/Bk=;
        b=xJM4FWFub+qeNozk4LCdPBjjEpadogf6aBwUUOZXjA0dEPn+3NzzNgRRR6eVQhY+OW
         NAja9q+aIVTnDAYn2SgnAn8yhWfM6ofwq/PS82MFnYXXYFAidplPuPq+PZ7N2uX+XdSk
         jsBRCZaVU28eseLsyBroqUMfAdHhL9y+vFPUOvh74J7hC0+3oDXMlJyPW6m9w3Nhv2Hq
         JO5FsGJYh4qGcb0UcdFV++pdEoxqVGHSZGz3VZR2YOfNHH/pSyNZTzZSHDUtPepMiVzg
         qQfCNZh/ctalMy0WAnb9qJQI+Asr4RUaiPiadWzMCYAZwX8P9T66JsRdwZuOw40fK2Rr
         fomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316999; x=1688908999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm37aEn/D5tCYQONbUQ1DyMcyptw+lvB4x1L6xAD/Bk=;
        b=PnnhMGL10lM6gtWP4cj2RAcnPf2jrUtxMsHCEEnee0sXXTROI+h9kJ9O+nvAMAg/Qq
         HQVPdqRWvUE4yUE/daKXmi3v3e/k9ojng5Yat2YZauNZT2GLqRAI8J9Bca/uTE8ZKQVa
         S2ujllstTojKOzAchrAEfd2fJgFam2vGnFTiK7OaJphj+HPJPeGy4FXbxYtte87ZAjxR
         cV/p83aNojd1WfUC4wjXGsGf2wgkR5pNvBrIhZeHEDaJA/DvgeQLPT57Qz2NuVT8r7yE
         x06dnKhdMKgb4CHS4juumoxaTNFFg+qKq0o+OUGToSA/b9wJjpLhvNY2Wu30Ehc8SXGT
         a8cw==
X-Gm-Message-State: AC+VfDynB226/vjGGK5afn/zH7c74vBKz6LGW9DEXZYbcyoHzUlE5ZQj
        2oZDhIKUjfckj67yO1thYoyTOAWvqa6rifxJRHM=
X-Google-Smtp-Source: ACHHUZ68Qpifya3MNQ+GQlofWDZH6GawkAV1YNmeCAlCPoTRMHfvnTsv/zvtVeNA5dR8PdegBWJwtA==
X-Received: by 2002:a17:907:72c5:b0:974:5f97:616c with SMTP id du5-20020a17090772c500b009745f97616cmr1653690ejc.1.1686316998990;
        Fri, 09 Jun 2023 06:23:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a17-20020a170906685100b00965ac1510f8sm1288859ejs.185.2023.06.09.06.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 06:23:18 -0700 (PDT)
Message-ID: <0b32442b-e931-ccd7-6bac-b5e251a4527d@linaro.org>
Date:   Fri, 9 Jun 2023 15:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/3] dt-bindings: arm-smmu: Add interconnect for qcom
 SMMUs
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
 <20230609054141.18938-2-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609054141.18938-2-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/06/2023 07:41, Parikshit Pareek wrote:
> There are certain SMMUs on qcom SoCs, which need to set interconnect-
> bandwidth, before accessing any MIMO mapped HW registers, and accessing
> RAM during page table walk. Hence introduce the due bindings for
> interconnects.
> 
> Reported-by: Eric Chanudet <echanude@redhat.com>

What is reported here exactly? What is the bug?

> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ba677d401e24..75e00789d8c2 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -327,6 +327,28 @@ allOf:
>              - description: interface clock required to access smmu's registers
>                  through the TCU's programming interface.
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              qcom,sa8775p-smmu-500
> +    then:
> +      properties:
> +        interconnects:
> +          minItems: 1

Drop minItems

> +          maxItems: 1
> +
> +        interconnect-names:
> +          minItems: 1

??? Drop

> +          items:
> +            - const: tbu_mc

Anyway, properties must be defined in top-level. In if block you only
customize them.

> +
> +        icc_bw:
> +          $ref: /schemas/types.yaml#/definitions/int32

No, for multiple reasons. First - do not define properties in if: block.
Second, does not look like description of hardware. I actually don't
understand what is this for. :(

Best regards,
Krzysztof


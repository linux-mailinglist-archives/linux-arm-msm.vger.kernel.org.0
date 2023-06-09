Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3497293EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 10:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238690AbjFIIzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 04:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241129AbjFIIyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 04:54:25 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455A2359E
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 01:53:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f642a24568so1855198e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 01:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686300827; x=1688892827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqc7b6Q+g/CohWxFaiQNgMOrW73y4+LWnJE4cKqKUVQ=;
        b=FVMYQZZ+1ggHUXFPybxhrwf6kWVwQQmoPV9TIm7dKxDQ1J5bYSGl8mCBYCduQC9tci
         oKQgkveQY6aiRKExaeSONPstmLY0FI/jDVcVovc50HNowcviUKAP6d75AttmGbb+5uRl
         LESds+hDmRKenoErLUuS4lZXDHAx5lB84S3s2w0UlETrpz2ESc79NEXBFxpzjO9k8DTJ
         LMC4ZHF/VwPAQEQ7mDZwYEsziK4x+WGZLUMyILKLGy2TYevjGB4OV7G2Cp6z+ycxhmXr
         +wLUXEd6RZKK1o8g4AtoIIhOwXfmfVls27+0lrISBDQG6WtArCKAMyzcyGgdlpHcZVAX
         buZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686300827; x=1688892827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqc7b6Q+g/CohWxFaiQNgMOrW73y4+LWnJE4cKqKUVQ=;
        b=VhZSzsZJU1j8RRC0YTcT2Hv/glIf/i0cx0bDmBS7Czf86ONnHVTQOJmhDtZGGUnIuv
         76gUdncQ/w396umj34MvY8RRkjbecMpOF95KXX9HXbrHqTA6ajT4871Emj+OuhZ53wG3
         vlIDzWkOZC0g0uqyS2wS6wDnl2J5OdOzEDMdiEQul0NLGDc7/BoOxvQvANFhGq2Bg9qw
         6qoSblXrmnzUVu3q/7uNAtj+pSwiYbdtXeXJ8Vu2LMCQZZXs2eG5VL8wJoqIAUwOWubW
         1lfFb1ildhnmkULIBkMrVtkXXLZNpc6soGejiglWbL8+Wgm0gvVH7rwK4NWoKnAX16Xj
         lJhQ==
X-Gm-Message-State: AC+VfDyU9h4rA7eok/Dir/2otO03zFW8XgGVZ6+4GKSMRvfRYvvxcKgB
        0Kn/bsqC7xoiq4+aRhFbohKSiA==
X-Google-Smtp-Source: ACHHUZ7qZqosiJP9Jkt7v4+WhBbhhZbxgDN9UMFeOJ5MeM8qzrGOivaF1ZgOUnhmsjiTBTGmjg5Hmg==
X-Received: by 2002:a2e:9cc9:0:b0:2b0:2bf6:1448 with SMTP id g9-20020a2e9cc9000000b002b02bf61448mr585354ljj.47.1686300827402;
        Fri, 09 Jun 2023 01:53:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id b10-20020a2e988a000000b002ac7a25c001sm306894ljj.24.2023.06.09.01.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 01:53:47 -0700 (PDT)
Message-ID: <316fd262-eeec-a2a4-cbc1-2c39935be87c@linaro.org>
Date:   Fri, 9 Jun 2023 10:53:45 +0200
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
        Bjorn Andersson <andersson@kernel.org>
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230609054141.18938-2-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.06.2023 07:41, Parikshit Pareek wrote:
> There are certain SMMUs on qcom SoCs, which need to set interconnect-
> bandwidth, before accessing any MIMO mapped HW registers, and accessing
> RAM during page table walk. Hence introduce the due bindings for
> interconnects.
> 
> Reported-by: Eric Chanudet <echanude@redhat.com>
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
This isn't specific to SA8775P.. I believe we could make it SMMU-generic..

> +          minItems: 1
> +          maxItems: 1
> +
> +        interconnect-names:
> +          minItems: 1
> +          items:
> +            - const: tbu_mc
> +
> +        icc_bw:
No underscores in property names.
> +          $ref: /schemas/types.yaml#/definitions/int32
Can't we use OPP tables? They'd also allow for specifying required-opps.

Konrad
> +          description:
> +            An integer expressing the interconnect bandwidth(MBps) to be set.
> +
>    - if:
>        properties:
>          compatible:

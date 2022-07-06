Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43DCC568B85
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 16:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiGFOlP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 10:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233315AbiGFOlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 10:41:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C936F237E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 07:41:11 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q8so6277292ljj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4ZAzCdhKYQqo7ESaR4JmvDnaWURtuqjk4b36eg17tyU=;
        b=QtpY64gBiKv87zn3WH2V1jHnVALzZR4GkLl4QHXzPB598mym+g/h+MDZP43GXpQU4T
         CpJ5jhoWrUkeBz61LdkRfl5hqVdEcL/tMmIiS1jU/5qF6qJLm8TUz7eprhsEaTffAyvS
         IVMmNMlc68RsNh27R/W2EAR6qRh8qON/B77jFGV949tv0wyeiuerQhisDI4e6v6xwsB9
         oqJtQUYDleBIdCZHs151WysbiavrxY29iZF6O62v5WODUGhEvOgIdKr9nLBXk8dG4V1E
         saCII/MZNMTL0jj/AXexSQPYgDMuFeTQcGK44uggOyD3qKU6Hg+DgJ/gTwusmBTOl/ci
         i05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4ZAzCdhKYQqo7ESaR4JmvDnaWURtuqjk4b36eg17tyU=;
        b=Z4Gn02UMhRF69YmfzAghA2tdEt1+oXhmWTA8MccagX+giTm2SqNfeDuU+xadOpwBJp
         2dFrQ29pd3s0kvPnC9PF8sm/DgqMtqNIXciz6j1l6zCvOwX6sXAgetDs66ofZBYuV26U
         x8y1IFXRoToh4brW8UBNGaQOMx6pqvnCGFGdwoNd3LBDae1WBI5CxxbAl2jsMhJxxRvV
         uWpIL5IiDiWkEDpmIaeY4oaNprgrJddbU+3t8ZeL8WlCrhG3gyyBBZIVobosrEk9G8eB
         VzDHnhsFPInUEueQKjAcU7aeYh42+zTH2gtRefY3n1h8851URiQ6cf04dePY39Zd+9Yx
         mwkg==
X-Gm-Message-State: AJIora/N7wjbg9DULtcSw7soPVdnPn6RpB9iY+MagxvoHWa69lHmAb5o
        yH2OeuVNw8yl0JY0Hd55LA588Q==
X-Google-Smtp-Source: AGRyM1vaIRti7iIX0vInI1Gwqn/+FjD2lj6KOCRUq8xBiaDzLL3qGwDU+An6dSqATeWRY7w0ckPAzg==
X-Received: by 2002:a05:651c:b0f:b0:25d:38e0:a5a5 with SMTP id b15-20020a05651c0b0f00b0025d38e0a5a5mr4706056ljr.278.1657118470135;
        Wed, 06 Jul 2022 07:41:10 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id l15-20020a19c20f000000b0047f68e0ca8fsm6320712lfc.49.2022.07.06.07.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:41:09 -0700 (PDT)
Message-ID: <4adc6b89-bab9-ae20-662f-dd66b2049d7f@linaro.org>
Date:   Wed, 6 Jul 2022 16:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] dt-bindings: qcom: document preferred compatible
 naming
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
References: <20220705092846.66731-1-krzysztof.kozlowski@linaro.org>
 <ebcfa5b0-a416-64c0-3aa4-3ae9487c61ab@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ebcfa5b0-a416-64c0-3aa4-3ae9487c61ab@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/07/2022 14:35, Konrad Dybcio wrote:
> 
> 
> On 5.07.2022 11:28, Krzysztof Kozlowski wrote:
>> Compatibles can come in two formats.  Either "vendor,ip-soc" or
>> "vendor,soc-ip".  Qualcomm bindings were mixing both of usages, so add a
>> DT schema file documenting preferred policy and enforcing it for all new
>> compatibles, except few existing patterns.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes since v2:
>> 1. Narrow the expected pattern to be followed by dash '-' after model
>>    number (msm8996-) or by two letters and a dash (sc8280xp-).
>> 2. Add qcom,apss-wdt-xxx to list of exceptions.
>> 3. Use comment instead of description in the oneOf list.
>>
>> Changes since v1:
>> 1. Add schema instead of readme (Rob).
>>
>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: Alex Elder <elder@linaro.org>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>  .../devicetree/bindings/arm/qcom-soc.yaml     | 57 +++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> new file mode 100644
>> index 000000000000..6307c925335d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SoC compatibles naming convention
>> +
>> +maintainers:
>> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
>> +
>> +description: |
>> +  Guidelines for new compatibles for SoC blocks/components.
>> +  When adding new compatibles in new bindings, use the format::
>> +    qcom,SoC-IP
>> +
>> +  For example::
>> +   qcom,sdm845-llcc-bwmon
>> +
>> +  When adding new compatibles to existing bindings, use the format in the
>> +  existing binding, even if it contradicts the above.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      # Preferred naming style for compatibles of SoC components:
>> +      - pattern: "^qcom,(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$"
>> +      - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
>> +
>> +      # Legacy namings - variations of existing patterns/compatibles are OK,
>> +      # but do not add completely new entries to these:
>> +      - pattern: "^qcom,apss-wdt-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +      - pattern: "^qcom,gcc-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +      - pattern: "^qcom,mmcc-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +      - pattern: "^qcom,pcie-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +      - pattern: "^qcom,rpm-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +      - pattern: "^qcom,scm-(apq|ipq|mdm|msm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$"
>> +      - enum:
>> +          - qcom,gpucc-sdm630
>> +          - qcom,gpucc-sdm660
>> +          - qcom,lcc-apq8064
>> +          - qcom,lcc-ipq8064
>> +          - qcom,lcc-mdm9615
>> +          - qcom,lcc-msm8960
>> +          - qcom,lpass-cpu-apq8016
>> +          - qcom,usb-ss-ipq4019-phy
>> +          - qcom,usb-hs-ipq4019-phy
>> +          - qcom,vqmmc-ipq4019-regulator
> Maybe we could add new compatibles for these drivers and replace them
> in upstream DTs, but keep the old ones in the drivers with a clear
> indication that they are there only for legacy reasons?

You cannot replace them in DTS, it would be an ABI break of DTS against
other systems or older kernels. You can deprecate them in bindings, add
new, and after few years (e.g. 1-3) change them in DTS... and still
someone will complain that you broke the ABI.

> In the specific case of gpucc-sdm630/660 I think we could even "break" backwards
> compatibility, as the only users of that driver (Adreno GPU & its SMMU) depend
> on an iommu series to function properly, which has been stuck in the freezer...
Best regards,
Krzysztof

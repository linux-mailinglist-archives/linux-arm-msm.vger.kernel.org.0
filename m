Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3CE66B1E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 09:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjCIIgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 03:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCIIgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 03:36:21 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFFDE191D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 00:34:32 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id da10so3920326edb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 00:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350871;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bf5h9B4GjXB46KIfBV4Jul3CUEr4UPwk87maz3zdFaU=;
        b=KYtpme7mZtwMcP/RYUD2GRhVzrQ79etsVr3hsmX/w3XpWtZTQ0Og7rqFqZ5FqcN1m7
         6V13ODVLWHU/YzoZAe9aDmdScCZclp1d7DdPvgEkM5UzZoQnFHL0MpaAbUkrzdCuuJW1
         83sCF1nebd4RTPpEjTtPlGRoDGVkqMoEbj0gWAPA4TJX7i6MnyLVyUfzrOGMgFMFMVkI
         QfrqlErzZ+s9Q/gG8qJ+XGP0yNZKp5+XbolfzSKvlS31Hb0zfj+3S60u1JQeRCIdn2Ez
         IYFwJxbVWte3S0rY2nOOITy8Rj43L9QwOt2g8sX1X1HLaYHzY+Fcr++/TSaHMRy51OYT
         y56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350871;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bf5h9B4GjXB46KIfBV4Jul3CUEr4UPwk87maz3zdFaU=;
        b=5PMr4r6GOAZqV4CJygCN5O/LN8oz5uy+EK7CFmqrr/UGRCBckEIn7fKZtx0aEu9f39
         jF0eU+eDpZ67KYulDabCHPIuO3ozG4dGFtWNveBzjkkyhaoEbpW0gRi84PI6Jl7C+x1Z
         Wi1toNGtxTJP2PfYQHroOcO1Qf7WqGo9iNWs1fvmGpGvv8126/tf6Q1s7rvtMTF54DQn
         sD59JYJMPufILbdNUHVN5IWvhjX5saZ+LGXTvzAbh5S66XO0j5V6yteGgXl5uhsTlikc
         SoxLyTxQcezvtragB6RLjVUAlsrMK21yVe3beD+qhjTghgv+2AUc7hA65NXQK385dlSU
         SH/Q==
X-Gm-Message-State: AO0yUKUASUVrNM69NTNthNyyVD9n4HSAfTUAkrQhOTo4N3SQNk3aYVbd
        1WlaS3vXOb7cWVa8Ih9yNmMLPQ==
X-Google-Smtp-Source: AK7set8CoMNWnVZzsifH057MaEVwmYB5sNqItMfusNWAvB1Iskv+7NVWFMrkezq1IqQcuXrPSGzXZA==
X-Received: by 2002:a05:6402:150b:b0:4c1:bfa5:adfa with SMTP id f11-20020a056402150b00b004c1bfa5adfamr17173963edw.33.1678350870940;
        Thu, 09 Mar 2023 00:34:30 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:7ee2:e73e:802e:45c1? ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id p24-20020a50cd98000000b004af6163f845sm9169133edi.28.2023.03.09.00.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:34:30 -0800 (PST)
Message-ID: <67b84336-4632-0b71-1c93-8fc975cea69b@linaro.org>
Date:   Thu, 9 Mar 2023 09:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: mpss: Document
 QDU1000/QRU1000 mpss devices
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230306231202.12223-1-quic_molvera@quicinc.com>
 <20230306231202.12223-4-quic_molvera@quicinc.com>
 <ea1c0579-1b37-77de-3c47-e5b9772cff70@linaro.org>
In-Reply-To: <ea1c0579-1b37-77de-3c47-e5b9772cff70@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/03/2023 09:33, Krzysztof Kozlowski wrote:
> On 07/03/2023 00:11, Melody Olvera wrote:
>> This documents the compatible for the component used to boot the
> 
> Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>> MPSS on the QDU1000 and QRU1000 SoCs.
>>
>> The QDU1000 and QRU1000 mpss boot process now requires the specification
>> of an RMB register space to complete the handshake needed to start or
>> attach the mpss.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  .../remoteproc/qcom,qdu1000-mpss-pas.yaml     | 130 ++++++++++++++++++
>>  1 file changed, 130 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml
>> new file mode 100644
>> index 000000000000..9cb4296c1fa6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml
>> @@ -0,0 +1,130 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,qdu1000-mpss-pas.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QDU1000 Modem Peripheral Authentication Service
>> +
>> +maintainers:
>> +  - Melody Olvera <quic_molvera@quicinc.com>
>> +
>> +description:
>> +  Qualcomm QDU1000 SoC Peripheral Authentication Service loads and boots firmware
>> +  on the Qualcomm DSP Hexagon core.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qdu1000-mpss-pas
>> +
>> +  reg:
>> +    maxItems: 2
> 
> You need to list the items instead (just like for clocks).
> 
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +
>> +  qcom,qmp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Reference to the AOSS side-channel message RAM.
>> +
>> +  smd-edge: false
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
> 
> You can now drop the $ref.
> 
>> +    items:
>> +      - description: Firmware name of the Hexagon core
>> +      - description: Firmware name of the Hexagon Devicetree
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Memory region for main Firmware authentication
>> +      - description: Memory region for Devicetree Firmware authentication
>> +      - description: DSM Memory region
>> +
>> +  interrupts:
>> +    minItems: 6
>> +
>> +  interrupt-names:
>> +    minItems: 6
>> +
>> +  interconnects:
>> +    minItems: 1
> 
> maxItems instead

Wait, I already commented on this... Some other comments also ignored.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof


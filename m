Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AAB722D2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 19:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235037AbjFERB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 13:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234821AbjFERB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 13:01:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BFDEA
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 10:01:25 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso6315429e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685984484; x=1688576484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRDMBVk4vz1Ythlxetf7Gr54/89mc98k3y6FPQIUZHg=;
        b=LLPUjN7ht3lheGOgE29J26cFxSTOEEskEKkrW/KvuK18WSoArlVLQlMPeQkKlxArFC
         am/kJz3hndT2PEsVFERJQr2CUl1g3mAXUhho7+Yt3WmQbWtErunZaeKFvUUE4ohHifn1
         Xz4w7SzBTPY/FG0UOd/vLmMsZ/nU/ftO8Ajop6k7aS2TtLMydhCYV+7AmxNdjx9INH2g
         qkWYOe+PEyHylGVPhKT/agDeqsVrLW4sV4M+gYnLCm/BOdLvuM8rB40q8UM5cSzQoeo1
         5T+Pc3D1lHn7Twb18+mXZxWZ/C1QdN9DZtqfIiix+JwQDxxlORwgzEGAkJsChgplviIK
         Z5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685984484; x=1688576484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRDMBVk4vz1Ythlxetf7Gr54/89mc98k3y6FPQIUZHg=;
        b=Iei7sgvkSIUGxg4b5XTk/4iJLvl1LSJvgqKFPxn9CxuPNc8rpJksMptc0/r+oT79u6
         mARh39TUWwHhldw0EQqJJi5dDRSQfv4+BR/BCBQM/jys7ukCVJ4OrFPa3DjTmddVctRt
         J2h2doVBqavE9ZkNFLiZfh59lBUOLUZdvj0+GUKAWdhl+imDG7TsB2j81TUHsU9vE64r
         9/IiaP9fHJxqu9mDRMZXsyX/L5bPLQHRGVUvG89fO8rGuCS+qMGeudQJO3UI4tjp3cMT
         Fd4dfSH52tpgVbeSJyviZV/t3aU/h8KXd/LGtYDtO2CzZx2fOEULMXH/qak9solKqfAh
         ezag==
X-Gm-Message-State: AC+VfDyrw7cTAkRdG/6h0RYjjwzkpnopYwaXqSenweLg0ESEdI8RWznj
        wHp2sK4IELGfJI/FCoNuvPCYcw==
X-Google-Smtp-Source: ACHHUZ4BWd4RPSnyw8163lZCr4pIJB0FfrOTLxiCGnSFr7EaUQX8/0srT7bEgU+FJp5yBMlxzY96uw==
X-Received: by 2002:ac2:54a9:0:b0:4f4:dd51:aecd with SMTP id w9-20020ac254a9000000b004f4dd51aecdmr5265334lfk.54.1685984484053;
        Mon, 05 Jun 2023 10:01:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
        by smtp.gmail.com with ESMTPSA id m8-20020a056512014800b004eff32d6a21sm1189005lfo.121.2023.06.05.10.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 10:01:23 -0700 (PDT)
Message-ID: <ea8d1808-b04c-332f-834a-c3f237e0b931@linaro.org>
Date:   Mon, 5 Jun 2023 19:01:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 05/12] dt-bindings: display/msm: Add SM6375 MDSS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-5-998b4d2f7dd1@linaro.org>
 <e9da7236-5915-b9df-59dc-c2baa960f52b@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e9da7236-5915-b9df-59dc-c2baa960f52b@linaro.org>
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



On 4.06.2023 20:04, Krzysztof Kozlowski wrote:
> On 23/05/2023 09:46, Konrad Dybcio wrote:
>> Document the SM6375 MDSS.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
>>  1 file changed, 216 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
>> new file mode 100644
>> index 000000000000..3aa4f0470c95
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6375-mdss.yaml
>> @@ -0,0 +1,216 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/qcom,sm6375-mdss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SM6375 Display MDSS
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
>> +
>> +description:
>> +  SM6375 MSM Mobile Display Subsystem (MDSS), which encapsulates sub-blocks
>> +  like DPU display controller, DSI and DP interfaces etc.
>> +
>> +$ref: /schemas/display/msm/mdss-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,sm6375-mdss
>> +
> 
> Same as 6350 - drop items.
Ack

> 
> Similar concern about interconnects, although we don't have header file
> for them, so I assume we will fill it up later.
Yep, they'll come later and other SoCs may need a bump up for a third icc
path soon..

Konrad
> 
> Best regards,
> Krzysztof
> 

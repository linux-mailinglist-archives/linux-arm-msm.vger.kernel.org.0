Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC91D70FEC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 21:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236117AbjEXTxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 15:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbjEXTxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 15:53:32 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E0BBB
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 12:53:31 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so11224145e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684958009; x=1687550009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKLOePL4OAg+r6dzbxYL4zr/grlcbs4JHq6CfesRtKs=;
        b=HtyvFiuXmlulj52UN8WIibnuu+FrhAeSp5F31Y7UJ1Tf4FZvQh2gkfMpcLvQeMkfH3
         uhgkzkjO20sQe8gp54PaVJC5LnOHKU883099+t1dllJXJhsS/NZmtD97wjaF4PCyu/JR
         IxELgR7otGPzMu29SAfuJwV2anzgUwEjKijZmZYfNp23VeBDjmYYktlOPY+YvAKnY0fs
         GVSEztu9is9+XP8uDkN0rv110AdvW854KGp2f1/VhgYXrsKt/FX33uxRzqUU3VxYmPVp
         2hngPYDcFSahFXYDhsGf8FbIlfjm/zAGDQPC7HrLkkcCmqJUSn9K90qmtfrmeC93k4iz
         Pbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684958009; x=1687550009;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKLOePL4OAg+r6dzbxYL4zr/grlcbs4JHq6CfesRtKs=;
        b=IAuF1F/ok0PsweLn91nU6V9qdNIjquKVgOe2/OHv3khmYBcbnuWU7Wap6AyEzEq77O
         Uo/Z/ksT1PgI0u+tcpR1nCObfP6T65HYpuJdS88i9rp6Yy1t33qwRpKj1angjuy2e8m7
         +ditvjU3g+IPtFQSRegrN/gZPess9eMjJuU0eXwmkNoKvQaLC3l4byZhdlIa663wL4Yp
         Mp2BlUARCaMIhGaT8/+08AY8i1qBfFq+Aaxd6US4CvPK1nA2hdCn93/0psUhFGOeSlCa
         cViT1FD/Y5e1kx8uKATxgWknDWd8KRZPOHDYIl8sYE7pd46syQsXYxNzBuA8H7CgCEpX
         NqjQ==
X-Gm-Message-State: AC+VfDyA4Z160jFepP/4rl9fDauwvKLxJAlyOO2jeYnExTPmRYeEvGoY
        zNg4tP8fZqt2RWkUvGeRRFujzQ==
X-Google-Smtp-Source: ACHHUZ513A1o+GABKQdBT4cMLxgaoiizyUUbRxyVFc1B1mscQGNfU1woLTJxy3gSqifY/56qoHw/aA==
X-Received: by 2002:a7b:c302:0:b0:3f6:8af:414 with SMTP id k2-20020a7bc302000000b003f608af0414mr540499wmj.30.1684958009550;
        Wed, 24 May 2023 12:53:29 -0700 (PDT)
Received: from [192.168.0.79] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b003f60514bdd7sm3481249wmi.4.2023.05.24.12.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 12:53:29 -0700 (PDT)
Message-ID: <221cbac5-c882-0f5f-0b5b-d1fc9cadc2d7@linaro.org>
Date:   Wed, 24 May 2023 20:53:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: qcom,spmi-pmic: Document pmi8998
 charger
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-1-f9334afc4505@linaro.org>
 <20230524-cache-gonad-fde614bbea50@spud>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230524-cache-gonad-fde614bbea50@spud>
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



On 24/05/2023 20:02, Conor Dooley wrote:
> Hey Caleb,
> 
> On Wed, May 24, 2023 at 06:38:52PM +0100, Caleb Connolly wrote:
>> Document the new pmi8998 charger bindings
> 
> This commit message looks a bit odd compared to the contents of the
> diff. Did you forget to git add something?

Well, it's not my finest commit message... The binding is in the series
linked in the cover letter (or [1]), I missed this addition when sending
that.

Would it be better to just squash this patch into the bindings and
respin the other series?

[1]:
https://lore.kernel.org/linux-arm-msm/20230524-pmi8998-charger-v8-0-b87ffcd9864d@linaro.org/
> 
> Cheers,
> Conor.
> 
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index 36de335a33aa..44590dc112be 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -133,6 +133,7 @@ patternProperties:
>>      oneOf:
>>        - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
>>        - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
>> +      - $ref: /schemas/power/supply/qcom,pmi8998-charger.yaml#
>>  
>>    "gpio@[0-9a-f]+$":
>>      type: object
>>
>> -- 
>> 2.40.1
>>

-- 
// Caleb (they/them)

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571D96F7DB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 09:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjEEHXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 03:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjEEHXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 03:23:23 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B059712085
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 00:23:22 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-517c840f181so694391a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 00:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683271402; x=1685863402;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2yKNPJcgXuBTQDFXv4jaSslsM07zOnVYJZxig2x9i4=;
        b=dtQzQov+0p/RzYncCKQaVUMWU4t0WRUjybRHMJNDo1UG/1cPQe3Y8DxjAEjSl3fd57
         q74DqkaAW1ScT6BEoKbWfoebFZz2nOIX9fcHj9Ro+igFh82W5lwL97XV7LrqqoIchuwp
         d3Ijwz4zwgFkHpk6SIX8fQksa00DUyL2dUKAyhEYroI3jtJgMF8jOFQ8dpw6NR1Fx7q3
         76WWls16JOCb9I5L2qvkCxW8T7wlfBLsgPsa3Vhz/l3Ndxd+RrveS92skLlZEWnlS4xC
         IbOyilaUksuYX8xbjDxIGgOvSxnYYES4ip3NjuldvcinXYo3+nMcs8X+AuZN6ctnaqQ9
         pi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271402; x=1685863402;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2yKNPJcgXuBTQDFXv4jaSslsM07zOnVYJZxig2x9i4=;
        b=A8FyW7gZghhdMAjPJzriHnQFdz/ta4LwiMrAg0LkQkydoduXzn7h3Vp1WEa/uJad7G
         FjVnO0fGN1v59gg5pqh3bgkCKaYHydI6iuLzh+TdKfyJuljCTe7g4tty2fbnS+2g6pl2
         s7zIrIW89qSSsRazfUXvgjpmfkHeMbkLjVVHR5kkCvjnIVM4lHUrCM0aEb6rPcBEafd+
         u9NBF3AltWCrj48oAd9W7l6z+24NhqtPtGhUO/KRW91KNtTJ0KRstdOgmZvSuIyi2L4M
         vpGkayq2YLjomrVwRoD26c8S6oEE+NHGsVxnb/+ciRbA+CJEc7UmqgCJrFfNKwvOxgly
         7j1g==
X-Gm-Message-State: AC+VfDzJw9KRUJiItJTeFB9mhRRSW9b1kH939xLSQ3Ygt+Tps3KCp56r
        heOMaXzM3hwkWA47hSzzfel6Pw==
X-Google-Smtp-Source: ACHHUZ6ltTmBcEmc6ra7RXQIFPm3nD026L5Oiar11un/XedEAE/88qZiBIBzWQk2h06gO9CvWul6ig==
X-Received: by 2002:a17:902:ba86:b0:1a6:bd5c:649d with SMTP id k6-20020a170902ba8600b001a6bd5c649dmr539297pls.56.1683271402127;
        Fri, 05 May 2023 00:23:22 -0700 (PDT)
Received: from [192.168.1.8] ([223.233.65.180])
        by smtp.gmail.com with ESMTPSA id v4-20020a1709029a0400b001aafe56ea70sm959277plp.5.2023.05.05.00.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 00:23:21 -0700 (PDT)
Message-ID: <00fbdc3d-901d-e3f7-9128-ddf070242217@linaro.org>
Date:   Fri, 5 May 2023 12:53:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 1/4] dt-bindings: phy: qcom,qmp-usb: Drop legacy
 bindings and move to newer one (SM6115 & QCM2290)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, kishon@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org
References: <20230502053534.1240553-1-bhupesh.sharma@linaro.org>
 <20230502053534.1240553-2-bhupesh.sharma@linaro.org>
 <faefbbed-0f62-e569-455d-0d21b363f8f3@linaro.org>
 <CAH=2NtzfH+7XMFdCq0JENgpJymsHNUfzwhWmDx=g8xBJ4aACpA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH=2NtzfH+7XMFdCq0JENgpJymsHNUfzwhWmDx=g8xBJ4aACpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 5/4/23 10:42 PM, Bhupesh Sharma wrote:
> On Wed, 3 May 2023 at 21:55, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 02/05/2023 07:35, Bhupesh Sharma wrote:
>>> 'qcom,msm8996-qmp-usb3-phy.yaml' defines bindings for several PHYs
>>> which predate USB -> USB+DP migration. Since SM6115 and QCM2290
>>> nodes for USB QMP phy are being added to dtsi files by followup patches,
>>> move these bindings instead to the newer style
>>> 'qcom,sc8280xp-qmp-usb3-uni-phy.yaml' file.
>>>
>>
>>
>>>     clock-names:
>>> -    items:
>>> -      - const: aux
>>> -      - const: ref
>>> -      - const: com_aux
>>> -      - const: pipe
>>> +    maxItems: 4
>>>
>>>     power-domains:
>>>       maxItems: 1
>>> @@ -71,6 +69,42 @@ required:
>>>
>>>   additionalProperties: false
>>>
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,qcm2290-qmp-usb3-phy
>>> +              - qcom,sm6115-qmp-usb3-phy
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          maxItems: 4
>>> +        clock-names:
>>> +          items:
>>> +            - const: cfg_ahb
>>> +            - const: ref
>>> +            - const: com_aux
>>> +            - const: pipe
>>
>> I am pretty sure I acked it and there were no changes here... but since
>> you did not include it, then lets keep the clock order the same as
>> sc8280xp. ABI is anyway affected, right?
> 
> Yes, I forgot to include your Ack in this version :(
> Ok, I will fix the clock order in v11.

I just noticed that the clock orders are actually the same as sc8280xp.
The only clock diff between sm6115 and sc8280xp is actually 'cfg_ahb' 
clock used by sm6115 instead of 'aux' used by sc8280xp.

So, the clock order for sc8280xp is:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: pipe

whereas the same for sm6115 is:
+            - const: cfg_ahb
+            - const: ref
+            - const: com_aux
+            - const: pipe


Or, am I missing something? If not, may be I can include your Ack to 
help get this applied :)

Thanks,
Bhupesh

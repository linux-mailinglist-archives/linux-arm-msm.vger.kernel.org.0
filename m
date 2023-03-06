Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD1D6ABAC6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 11:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjCFKGs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 05:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjCFKGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 05:06:44 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312B824123
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 02:06:33 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id f16so8983358ljq.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678097191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qL3HmAMZXbE+tU4cZr71bQvnmInTwDDVr78Hu6G/gXg=;
        b=Mwk82bE/GvduM3fFm6qfsIX9+p4RxWtbJurmbG4xt14UF18rx/cX6FXxf6IPH9Yh1j
         aRV3aIqG6zDJ8rOGcp3VYx+I/cICrTugpgj4syvgXyJSs1b8gX4LGiNGIcXmj99DCMUI
         sci658j5zlOHUBrJJUA1bSdCalnUbLFNS+AjBlB6bTD2rKLREJdh0EkhivGUaMu2vaR6
         hOqoat2PBSJkaTtl7KQNK5lIAzgF/1zubcGICjhU9me+EUUl/DxeO4TMLRM0m7YkSSl+
         s08BrtGOIKxKwms2GuH+JqOzqd8SvXjvMm7YktyvXD9zeQ4Xjbvl17t/mXU196VO6DhC
         tfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qL3HmAMZXbE+tU4cZr71bQvnmInTwDDVr78Hu6G/gXg=;
        b=p0oojqpE+duyq5KdP4O7ytEH4nTWYXHjqWYztu8WFaUTMHvWjCiO1dd/ughtRjSNuz
         fNKjZ9bQKTRPMWf8kn+IQibnNieHP3iXJFMFbVjPxypRATX7hOwEjsC/EnWujgcZe1mq
         sYC3F7WvUSmiEAxKDeae4NrtsK5UXfYqDEi+CU86gkMjS+EHO/TGG2+/xcfVcvlTPCYu
         YS9HSvDnb9yvG1YM/5AVgT61g8b/uNXlcptQIy4rwah6o1in6dZEUWZWDPmgQnV4Ttav
         Iz7I5V7ipzv7C4n6eTtuqe2YT6OSafvnpyu4PXZytDZ9s4zepElHrAfZOhQl4Mmgg9kl
         cFLQ==
X-Gm-Message-State: AO0yUKU+lBJDexQK6Q29lpSrvdPAaG4n/b43dxIAAlJyYRJxVg5G0eMI
        Ma58We6xRqFZsNpFxtj0LqCL0Q==
X-Google-Smtp-Source: AK7set/6RjJM9RgwapIiqqa60HrY2H4DbY07gJyWtciss4OLaEuYasLPM3YqalZX5PUaz9yx85GM0A==
X-Received: by 2002:a2e:98d6:0:b0:295:bab7:c7df with SMTP id s22-20020a2e98d6000000b00295bab7c7dfmr2797895ljj.38.1678097191451;
        Mon, 06 Mar 2023 02:06:31 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id s2-20020a2e98c2000000b002934fce87bfsm1586710ljj.108.2023.03.06.02.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 02:06:31 -0800 (PST)
Message-ID: <4b8745d8-144f-fb82-3e54-5ce6bd3162e6@linaro.org>
Date:   Mon, 6 Mar 2023 11:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] dt-bindings: display: msm: sm6115-mdss: Fix DSI
 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-2-b8565944d0e6@linaro.org>
 <e105eff0-816e-b9e8-b47a-5c85731c9ba0@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <e105eff0-816e-b9e8-b47a-5c85731c9ba0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.03.2023 09:57, Krzysztof Kozlowski wrote:
> On 04/03/2023 16:55, Konrad Dybcio wrote:
>> Since the DSI autodetection is bound to work correctly on 6115 now,
>> switch to using the correct per-SoC + generic fallback compatible
>> combo.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml         | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>> index 2491cb100b33..605b1f654d78 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
>> @@ -40,7 +40,13 @@ patternProperties:
>>      type: object
>>      properties:
>>        compatible:
>> -        const: qcom,dsi-ctrl-6g-qcm2290
>> +        oneOf:
>> +          - items:
>> +              - const: qcom,sm6115-dsi-ctrl
>> +              - const: qcom,mdss-dsi-ctrl
> 
> Does it actually work? You did not define qcom,sm6115-dsi-ctrl in
> dsi-controller-main?
Check the "Depends on" in the cover letter.

Konrad
> 
>> +          - description: Old binding, please don't use
>> +            deprecated: true
>> +            const: qcom,dsi-ctrl-6g-qcm2290
>>  
>>    "^phy@[0-9a-f]+$":
>>      type: object
>>
> 
> Best regards,
> Krzysztof
> 

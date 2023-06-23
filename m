Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A4873B1A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 09:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjFWH3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 03:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjFWH3p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 03:29:45 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7AE273D
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 00:29:15 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3094910b150so386339f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 00:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687505343; x=1690097343;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=74Pt8y9BLYayYvuaPPOjFJX++4vBERPSGc1K1bOgfPc=;
        b=Y4LcbyKKH4D6Sc646yqtnsdFR8fsUfhWH/1ZHEzwtdsJ2yk8zc1Id8XVlOltQkHnRw
         QOEMIZF8lARJZ6DwtHrkXJUM5ppaxzuno9eMOajvNiVVRauJQjgfI5z77h+YaaWHm0Pb
         LIT/8+VGo1gkux9Gm0eWNJy5t2FQLi4gwjAy+/ASpPay5cTlS+kJA/Is381aaoo+z1TY
         Bbq4uJmoUVRTHpOROfa+YIir1CtWiCJQBPgcqnIhQ42xSvYK2+2KRJtNbVv+Aq6b7+c/
         7MqkFZv+o4R2+ucZPy/9fmXkuqzADq6kWRKTrQ5dkRxIZZPM8eJLdvaj6Ooo80jPhybu
         VN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687505343; x=1690097343;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74Pt8y9BLYayYvuaPPOjFJX++4vBERPSGc1K1bOgfPc=;
        b=WIhSBNPGAA23dQPwRN2iA1FCGXW1AVjFydgag9aAJ9iDFlQgxPaG+T9QsSBhZRzwPw
         gFbmZF4hrOo1PPjC1C3JR/UY7cnhmhakNHR+np5KjR+9uHgFoz3QPiiLSFS3VDI6d8rH
         ZYd617edYpKlmkwI8Th66kugiuOb3ucVhwvZT3sweD1LvaIjYJzAWJUb+ATQxw0QBxEP
         6M0pvO6Uq5CLsWPCQ17ipF7RagxKw58IYvadyBSCl1kDmG9d7OZanWYzgpQ6AFLKbYvu
         /b+Nf1GmL5vvr/qcEifiiAPbd9t/gzKdgMScmu7zjo7fAfIzhDxoOoKGatStNgd3ZxNq
         hx9w==
X-Gm-Message-State: AC+VfDzXMvzjDJrPJfiZmnySvGD9A3aUKAnkUR4XdQgUAZd53Yam83/S
        XK0iCnU0kzxDqV5zdpef3ENb9Q==
X-Google-Smtp-Source: ACHHUZ5R9hJ3wXhPhvbJVcGIHlACR3cX0dSORBCPRA3xKj+G+lmLhEIxWe2HnM4i26WPrqPkabi7bA==
X-Received: by 2002:adf:f6c8:0:b0:311:d7d:e831 with SMTP id y8-20020adff6c8000000b003110d7de831mr15478208wrp.48.1687505343048;
        Fri, 23 Jun 2023 00:29:03 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id p9-20020adfcc89000000b003113f0ba414sm8822488wrj.65.2023.06.23.00.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 00:29:02 -0700 (PDT)
Message-ID: <b4b1552d-67ab-3ab4-641a-1e190ed4a707@linaro.org>
Date:   Fri, 23 Jun 2023 09:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: sm8350-mdss: document
 displayport controller subnode
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
 <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
Organization: Linaro Developer Services
In-Reply-To: <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 23/06/2023 09:27, Marijn Suijten wrote:
> On 2023-06-21 11:26:25, Neil Armstrong wrote:
>> Document the optional document displayport controller subnode
> 
> document the optional *document*?  Same in the other patches IIRC.

oops, will re-spin with this fixed

thanks!

> 
> - Marijn
> 
>> of the SM8350 MDSS.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> index 79a226e4cc6a..f2cbeb435f1b 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
>> @@ -52,6 +52,12 @@ patternProperties:
>>         compatible:
>>           const: qcom,sm8350-dpu
>>   
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: qcom,sm8350-dp
>> +
>>     "^dsi@[0-9a-f]+$":
>>       type: object
>>       properties:
>>
>> -- 
>> 2.34.1
>>


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 986B359695A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 08:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238884AbiHQGRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 02:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233977AbiHQGRV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 02:17:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6186CD09
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 23:17:20 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l21so12632926ljj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Aug 2022 23:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=u4TyGnpFImFVWzeLtgSn9hdAlwn6xtuxeRH7ihJ09pc=;
        b=zoxAksbIBjky7k2llS1H0n9UlrANEmgCDtJqGToMTf4FNpc7pc5H/qMP8fidrb48Jz
         m9U/J/+lm6ZNP22mWbW5dKPuaBDcWtn+wgko5RkoKSFsxUmy7SN3iK57qdeP98emgtKW
         S1XnHdKOcFpaf9DKHfUsSUhwEBnZhIguQ2JDxInksCUl7JGg+G+ZXjtpQJpXFIDO2PwQ
         ukjZJp8tuF64s1a9e5Z/Q0uP+G8GQ+tZPb+Q1oKAET/JLKCUPlkgITECL96fonGaK/2Y
         cjmYkfg9/FygvwFaqPai90lxNVjwxzdEOuLQ5OTItxgS8QsKjvv/BFPrpxRMQwO6swIV
         IfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=u4TyGnpFImFVWzeLtgSn9hdAlwn6xtuxeRH7ihJ09pc=;
        b=Fg8ebqGUKAmVczHnPl36xfrFuolxXRX19AO+Ce2rfhY/7Tij9EJgXpeKM1M9LeTnWF
         p6AeZaHEvSnN7SEDkKDJmkn0xMICzKF9mvRigb0Y5dI60jq0p0Llqls2x/Kb25gsi3Rx
         p6ZaTbtriEanE+VRVJSa8iwm386uur5G9E+YD3oEj0BGu95Rxz8vufdTNZm1evGhqrS7
         ZubY75/dgimgaEoyqNBuQgHpbQ7vBQIYwFqQCOV7R6J04OHpQZcMjWQcCky56KDy0au7
         ifGYz2JpeJvsfpGq0q72a8ZYXZVTGptD8O3sZOk4D7aViPmrP9HbvwMXksFJjnGT8JAO
         2E7g==
X-Gm-Message-State: ACgBeo2AGAI/IyQKqMS7hnarCbVK4WQyvaweSgBQaE6vURtuH6Ne0IYE
        uTF9Q8WHxmVflLYLUa/iDXC2Tg==
X-Google-Smtp-Source: AA6agR4cxp1hoQnc8GR+guva3+Gp9Pvrn5cW9PIK9UFl/ZQ3hhX7zJlDtyitNNPx+HuzBRwQH0iXAA==
X-Received: by 2002:a2e:92c4:0:b0:25d:9d30:5d61 with SMTP id k4-20020a2e92c4000000b0025d9d305d61mr7847790ljh.202.1660717038843;
        Tue, 16 Aug 2022 23:17:18 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v8-20020ac25928000000b0048a918717c3sm1579654lfi.57.2022.08.16.23.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 23:17:18 -0700 (PDT)
Message-ID: <e20ebf8d-8efd-eb28-ccd1-07795feb63a0@linaro.org>
Date:   Wed, 17 Aug 2022 09:17:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dpu-msm8998: add missing
 DPU opp-table
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
 <20220811084331.83715-2-krzysztof.kozlowski@linaro.org>
 <20220814212517.GA716652-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220814212517.GA716652-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/08/2022 00:25, Rob Herring wrote:

>>      properties:
>>        compatible:
>> @@ -105,6 +106,8 @@ patternProperties:
>>          maxItems: 1
>>  
>>        operating-points-v2: true
>> +      opp-table: true
> 
> type: object
> 
> Otherwise, 'opp-table;' would be accepted.
> 

Thanks, I'll fix it.


Best regards,
Krzysztof

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7825F6BC656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 07:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjCPGwh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 02:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjCPGwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 02:52:36 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54595ADD4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 23:52:34 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r11so3596571edd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678949553;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yDwcFhaglD9ZblUjfqRWfAkGmbeU601dCSliwkSidio=;
        b=QhWlqAaSYay4qQh+PyIZoJnEqeJpgLcD5wLkFWR14psLl8K2kPx+vKEybsmlfMBOLa
         G9EB2ivHAvFg5yV9FeacdSq6nrvjiUCX61hwJeJCKiYahTFJOoO4FOU54EGB1e5NhSVa
         b+ARDzL/DzxPc8Whg9jOb0wWfWPEk+wIgoVT9KcXun1O8w3dvmeN6GImJ766mAVM5ZUF
         Or/QSV7MYTu/O2NB2ddVPCB0wrc14BvG9ZyY/18rX04cgpzx6JmI9YF/xXwpW6UWq7tH
         L+RAOHVXVgdvbrgRXx+FzK+esykam1LvOaBKYFWVZZj+80Jcit1q+Fsaby5MDnMGnUEz
         yRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678949553;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yDwcFhaglD9ZblUjfqRWfAkGmbeU601dCSliwkSidio=;
        b=Yid5d+F1qMPMqNhU8VlkdQZ8BhiyBb5sBVui4YVGHNgiBofEZ60x9115nORUlwEqan
         E+XKNdCcwIQg63YdyDdmhGvsaF/sbG3V0tgAO/XXwykSwW7OXURlJe3PPACSvBR0e4+c
         o95AskkiY+hTeg2CuSmwm2ZNF8j9hOrsIlDiN0QTGUEB0jQFGjKOplVKpM1KDn9/X9EU
         oCgSZZ/Ks/yo18EMsFff1WY7H3+FxVfUuW4EJjBYAc8BDLoTW6PIy/Sgf+KQ+uZJolSl
         6gvQux++yDRLC1xiT7mrlqga9MZBZXlRoaf0Eaq4Sxwp79xrRizHeBuTvXNt1fVG26tC
         XYUA==
X-Gm-Message-State: AO0yUKW42AT9MiMOvSWcfpg8bZAQohkmFYKMutCOvotkqpLH+NIzfIW+
        MySWjIFcsItorKS2UyyAyhItNg==
X-Google-Smtp-Source: AK7set+zESAdNb4+mITVojQI4XtD8Bu60zKmFg+VVW2czRdtRcVmnEQYuB8E7uRTrBU3fmtoGPs5VA==
X-Received: by 2002:a17:906:1351:b0:924:576b:b145 with SMTP id x17-20020a170906135100b00924576bb145mr8865256ejb.55.1678949553248;
        Wed, 15 Mar 2023 23:52:33 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id v10-20020a50a44a000000b004fd204d180dsm3358273edb.64.2023.03.15.23.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 23:52:32 -0700 (PDT)
Message-ID: <290b9b19-a320-38a1-4426-51f5725dd54f@linaro.org>
Date:   Thu, 16 Mar 2023 07:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/13] mailbox/arm64/ qcom: rework compatibles for
 fallback
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
 <c35fd641-12ff-beba-341c-4d0305bcaa40@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c35fd641-12ff-beba-341c-4d0305bcaa40@linaro.org>
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

On 14/03/2023 13:16, Dmitry Baryshkov wrote:
> On 14/03/2023 10:09, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Changes since v1
>> ================
>> 1. Rebase
>> 2. Make msm8994 fallback for several variants, not msm8953, because the latter
>>     actually might take some clocks.
> 
> Although the approach looks correct, I think that in some cases it tries 
> to mark devices compatible judging from the current driver, not from the 
> hardware itself.

Which is what compatibility is about...

> 
> For the reference, on msm8994 the apcs is a clock controller for the l2 
> clocks (which we do not support yet). If I'm not mistaken, on msm8976 
> the apcs region contains a mux for the cluster1 clocks. On sdm630/660 
> the apcs region also seems to be involved in CPU clocks scaling.

The question is this means they are incompatible?

> 
> On the other hand, the sc7180/sm8150 part seems logical.
> 


Best regards,
Krzysztof


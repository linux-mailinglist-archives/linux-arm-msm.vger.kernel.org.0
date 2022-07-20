Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB1857BC17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 18:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235739AbiGTQzd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 12:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235512AbiGTQzc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 12:55:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC91BC8C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 09:55:30 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y11so31263353lfs.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ghsRIl9JuEUAT7RkLvrtAJh5nIX2+4oeY+8sAkTqUi8=;
        b=rrij9HiBkRbqiSHMRbuOYeDYl/1QDqdjMLDsMCllht89qyWj039D33oBZUzR62CBuK
         WdSRzgXyO41YyPlFU5drYbYssIzqcYVDxLSaBjArT9IX8nBPC5bOrphbtCbi1OHsZwRV
         ZpjYuDIhJbF9axDINZh6UiTHADnes0C+A4XibyzgKZ35/LoEpNphQlZh5SXgLvrt0A2C
         m2z9n52ly2xSKbbnUIQXocBNzuyi0/he/66ipoZrJ5fj7hRYLYMSzgz8IP07hyknjazv
         Ax/KB3y2KjPO1xHiJj0m/lGt6q3fCSEeIsAJEE5cm+B/NBsJQrxxN3bjkZlFwCac17Ss
         LN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ghsRIl9JuEUAT7RkLvrtAJh5nIX2+4oeY+8sAkTqUi8=;
        b=SZxUmte8thrUDqAH6PSEpmoyX6N+zHQCXnpuT8ELo8K5cuUSj2ZMeamRAOYntoEczV
         LU4DIWfH7pVviRNKzy+zimpDXo+bQm2FV/PkRlGrTWMeWOPsZaU+0pyB5MbV/6NeY0T9
         qSQcc+GkadEaKslnycNueO2YYhgsod+sZIDrby/qPlpB6MSWc7ZvymgG10RadSbYPk40
         fHj3bsEkh0dCWIFhUGp1L9B4e5CVlVOLAa9XD4qPkthzhhsSCHEAtn8CyWPDYyCiOEfv
         xWP71wk2liuBGz+4rkSKeOwvCVE9WoB1+7wOzGdelGlaontBl2BRWoXMGOszb82sDrLG
         +nrg==
X-Gm-Message-State: AJIora+fNyIemyrf4I784p10QKaDLLa8kGLa8dkP9T8COGhDNNjqYGYr
        iC63QFTWlmw1wWpHjs45SqY2Aw==
X-Google-Smtp-Source: AGRyM1vBII7bdjh9XymGuoIsbKTl3kq4QQ2UANvX7Rp6zTPRF7Oz9vGJ+aKWRqdUofgP5Ddq2mFV/Q==
X-Received: by 2002:a05:6512:3d15:b0:489:d97d:8927 with SMTP id d21-20020a0565123d1500b00489d97d8927mr21395907lfv.80.1658336129030;
        Wed, 20 Jul 2022 09:55:29 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id h24-20020a0565123c9800b004855e979abcsm3894307lfv.99.2022.07.20.09.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 09:55:28 -0700 (PDT)
Message-ID: <bcbca05e-2b75-a405-b1ea-21b276931a90@linaro.org>
Date:   Wed, 20 Jul 2022 18:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: Add SKU6 for
 sc7180-trogdor-pazquel-lte-parade
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220720025058.1.I5bfba8857ea0d43c747ecdc3a950875abd56927f@changeid>
 <7a04c9af-0ccb-7711-249f-73908fe7ec36@linaro.org>
 <CAD=FV=V1MqQzNxq_L8sGtu2JwAAL_FWKXkw9bhCHcD0DycFMUw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=V1MqQzNxq_L8sGtu2JwAAL_FWKXkw9bhCHcD0DycFMUw@mail.gmail.com>
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

On 20/07/2022 17:13, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jul 19, 2022 at 11:10 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/07/2022 04:51, Yunlong Jia wrote:
>>> SKU6 is LTE(w/o eSIM)+WIFI+Parade
>>>
>>> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
>>> ---
>>>
>>>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
>>> index 764c451c1a857..4649eaec6318d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel-lte-parade.dts
>>> @@ -14,7 +14,7 @@
>>>
>>>  / {
>>>       model = "Google Pazquel (Parade,LTE)";
>>> -     compatible = "google,pazquel-sku4", "qcom,sc7180";
>>> +     compatible = "google,pazquel-sku4", "google,pazquel-sku6", "qcom,sc7180";
>>
>> You miss binding change and sku6 should be rather added before sku4 as
>> it is more specific, isn't it?
> 
> Just to close the loop: the order doesn't matter at all. Neither sku4
> nor sku6 is "more specific". One has the eSIM stuffed and one doesn't.

Thanks Doug. Then the commit description could be improved, so reviewer
does not have to ask such questions. Otherwise it is confusing to see a
board which says it is for LTE version but it is actually not for LTE
version (or whatever combination you have).

Best regards,
Krzysztof

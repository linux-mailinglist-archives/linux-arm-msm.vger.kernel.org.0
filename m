Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C1852FF08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 21:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345165AbiEUTog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 15:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244562AbiEUTof (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 15:44:35 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A33D6210A
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 12:44:34 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 27so8013201ljw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J4Kh+2UVktysEZz8Svixt4GFp/EX0ebHeDHECRVVv60=;
        b=rWMJ2LvEnRWyYhc05dc4atzntl4IVwj3jrzk/9ZzqnIgjfGRTZwcYO/Kup4k6B8DIW
         uWyU/RNbeph2KTDPxm3mx8SEpDUpTtQBgb9oijkYcOv/jdA7pb1Lfrkr5acHpTv8ajPn
         nkZRJHZIfmFIONNSdWCu+2CZta02edkcjGUPd1/wJEMpgNXytRy5sgDyheOd/t7bqZm4
         dd6r/tJiO5cC5elT+WxUjHC2TIDD4gOjx/kXNBY1hGdRyXlpQTbVo3DWU16qhGmn2KvO
         FYMMSzTiGJ8VWYkzQbqTGBiEeRh1eXGWsUHbmccBuFFw4VZ/bsoRmlLNQ4Ac6SS0RFgw
         uF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J4Kh+2UVktysEZz8Svixt4GFp/EX0ebHeDHECRVVv60=;
        b=UedT4JdDGqM6PIlzsSxbvvO7QJcrjuwHv+hPbYOaZJp2ugd6bTnC+iLEPdT2xnlcuE
         Hri65fY7P4QZG591smDgkqZT70vMBi8AoPktaL6tX0bHC0kN7lNnGEOgorEXsnvoQXye
         LIl6Jpm+FozowQmHWDwyNs45VUD8tE7KmHWqPETRiMSF9W6zEUTtm5g8uU9llz8EXZjA
         ytgAoEmJmv7VfCBx0t8XeTmpk6xSjOs2k9QLYi3WDkY7QtYUpEwB+9v0zJhbiqef5iU3
         yKj70P+l3k/UIdaOtvqaBgwtYg0+SzO0FDrxuOKkyPzYlh9tX40GkKVG+YRjoxMLpTbF
         6BmQ==
X-Gm-Message-State: AOAM533XFckylvr+U6jFnqTVEYJ9J0Yb6JTSwRoNvPiCllz9tNf6ejBM
        GSHdvxJ+vjyIXCXM1emSl8O9Ow==
X-Google-Smtp-Source: ABdhPJxvURIqwrmBDRNotFEhy5SbdES8aH1odhld9ZUGw3PVwoGw1B1x5BL39alpU/qmQUZEXLf+Vw==
X-Received: by 2002:a05:651c:211a:b0:253:df5a:f821 with SMTP id a26-20020a05651c211a00b00253df5af821mr4406439ljq.414.1653162272561;
        Sat, 21 May 2022 12:44:32 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id c11-20020a056512104b00b00477ce466e59sm894916lfb.153.2022.05.21.12.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 12:44:32 -0700 (PDT)
Message-ID: <dd817f29-74d3-bff4-c7d8-5b2fe1190d2a@linaro.org>
Date:   Sat, 21 May 2022 22:44:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] dt-bindings: clock: gcc-apq8084: merge to gcc-other.yaml
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220521150835.1488683-1-dmitry.baryshkov@linaro.org>
 <d09435fd-8216-ad01-05f2-d2c2c6b98aaa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d09435fd-8216-ad01-05f2-d2c2c6b98aaa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 18:26, Krzysztof Kozlowski wrote:
> On 21/05/2022 17:08, Dmitry Baryshkov wrote:
>> There is no need to have separate bindings file for the
>> qcom,gcc-apq8084, merge it to qcom,gcc-other.yaml.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This makes sense and we already discussed it was preferred over my patch.

Yes, but for some reason Bjorn has merged your patch, so I had to rebase 
this one.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


-- 
With best wishes
Dmitry

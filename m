Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369D45FB202
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 14:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJKMHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 08:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiJKMHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 08:07:08 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B9A4DB5D
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 05:07:00 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id a18so5392548qko.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhPGevqSzqibqgd/vwJP8Td87JD8l5NLBMf17yZuOLk=;
        b=SvLQDgWIQMBN2ynGQgGS86FJak4gVhl4lKseaec29ZOYSMRNI6NpM8AZUWrpih7WaE
         T7OFgsG+y9AJ+GjCjKK2U5q7WQQrbSTIgBdqrG/VLdjPnPwRf9sCZDscyZ0Oa1acMAlH
         TKJWz1DGwU0INMN711f3Oh72PYox/1X7PYgW8vt8UU9WlZw5lOPf6EQ/hl7ladfW8qCe
         QxGaGtnkQWTlInBDMx35U0/3fGN8Go9GoH6vdFLLlITIKwR9L0cnn363EEnTlJ+i16UC
         zULEARG/kZYZV8YKqZzSsb/Yf2GCi1XGkd+8vU7qV8+IuZLnQooTn3WrecSLQOSH+mfb
         baSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhPGevqSzqibqgd/vwJP8Td87JD8l5NLBMf17yZuOLk=;
        b=3SGFfp8DOXAXieH2RbVKDW+PQMR5P0Tf5nGvQZSVb3N7nu+q4lXMLVdx6RpWM2m9f3
         ueAaIQROMNNviDLWwLUs8c3kUIUmiFSIhvqTboYgO1yeGlh7FdLaqMS8VArgbJFVMkWp
         GAFq0EqUTlkDBYSMj9ojeSP78lwocRtTMrk8c5CjLRLFeAhiE1FZRwU/DiF6LvT+BxIk
         EYzBlTv181PNlRU8Idg/7jMqIK/hZ6aTglB63nrwIUGxAhdzMXBpc1f/MSww5KhFbPfe
         9g+obwe/7UWkPTexlH+WSuORrxTWOFNvMoCgzjqSKQBvoqNwpqNNeI4IBVdN8xsDypE0
         ZXfQ==
X-Gm-Message-State: ACrzQf3MrD/5dogXreh9OcJutiWZ31PNoAax3lm07SXJm1dZRxPU3G5Q
        FXf6UKae8W4pbmNaoSfO8ycquA==
X-Google-Smtp-Source: AMsMyM5b7GFYwAPsgxTr/Cv/cVXl6z8IZHNqcX/niaD9yWf2bf96abSPTyBoyjzKL6lld470m4fQAQ==
X-Received: by 2002:a05:620a:6084:b0:6ce:342e:5c31 with SMTP id dx4-20020a05620a608400b006ce342e5c31mr15553325qkb.404.1665490018771;
        Tue, 11 Oct 2022 05:06:58 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id x4-20020a05620a448400b006cebda00630sm13346818qkp.60.2022.10.11.05.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:06:57 -0700 (PDT)
Message-ID: <112ada96-f742-8d06-dc90-a422d3636e06@linaro.org>
Date:   Tue, 11 Oct 2022 08:06:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 10/16] arm64: dts: qcom: sm6125: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
 <20220930192954.242546-11-krzysztof.kozlowski@linaro.org>
 <20221011074512.anifehocqjnxuf35@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011074512.anifehocqjnxuf35@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2022 03:45, Marijn Suijten wrote:
> On 2022-09-30 21:29:48, Krzysztof Kozlowski wrote:
>> DT schema expects TLMM pin configuration nodes to be named with
>> '-state' suffix and their optional children with '-pins' suffix.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Thanks!
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> Perhaps mention more clearly that this is fixing up an earlier patch
> that tried to address missing `-pins`?

It is not fixing only that patch, but also nodes added later without suffix.

Best regards,
Krzysztof


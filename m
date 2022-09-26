Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F005EA1DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 12:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236816AbiIZK7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 06:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237024AbiIZK6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 06:58:36 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99894F199
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 03:30:14 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id j24so6903524lja.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 03:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eG0TdrPxhkIbH4nT2ZB1rVox+ssVaYjya+NBPT1aYHc=;
        b=Eht4h4WK4DP25MBt5Sh5FNwN3HAjo3DHFLnYeVJVp58bpmreQTsOyfjuOnGG9ogpy2
         4lHTuXwolFrLY1i23R4StEuCSbu4B4UPrKVj2QnBBVin7FlQM67/jxrqlcXOTZNeDm66
         epVWfGw7SWI3ve2OMaieQHOJ1+nQx9eqAI9yqHr+TWCP/yRq3L1pN2klGLltejLIGfc9
         F48fhzRQXtDnXxAHiKNB42Q02YhigR3+9Oj0nmoExW65csD1mcm4yQk5Ea33NyvHi8Db
         0gEbxVkN7zJSpTYYsiTqbbvJq0P4dPwUwa5+6ff9YjmxNHcIQn1nYOk/Qa5cJH67Dapl
         XKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eG0TdrPxhkIbH4nT2ZB1rVox+ssVaYjya+NBPT1aYHc=;
        b=dYq7WGLyKWNd9F/mCN9oJlRWXaBiIb02mJrbJFA0UIZigymQfpi9a4GlqAfIOtDGjH
         EsLXySM/oZGzSwO+38FsGcQx8r6hIuwMoaRwA/l+K2JjfGcyCuZcKUcOv5y7pr2LZsxx
         SD0liWmWMlWFFfPAg+Q92kxylvCxFEesCG5+SgEnp8jxMY0dpRhz53QDozYJ7zC4vs8A
         V5Mcs7VvhlBKtJhjB20/GOCD9sSZsfFusbdvTnSBY79uEBkaHL7aATqAA7iERAeUGc1W
         GTJJqqx3WCtIwoVheuq0ZfOPyQwTdS3l/pWuK+zCtxFW7hnf/B0/tLscmHkN0iemsmVC
         UigQ==
X-Gm-Message-State: ACrzQf1fvJuhSs9ALtECKlFpeHKa7euHbGvUe2RHD8ahBpNdAu+5/qFh
        nWY7xtDjQQIWQl7KQyRTYD8Peg==
X-Google-Smtp-Source: AMsMyM51/T6s8y6v+BDWSNH67sFG5OfefILMT5fIWZKtFrxTyMCmSBQ7lyt1WwOBN+BzLnKPXn1xbA==
X-Received: by 2002:a2e:3905:0:b0:26c:3550:bc14 with SMTP id g5-20020a2e3905000000b0026c3550bc14mr7215915lja.43.1664188153679;
        Mon, 26 Sep 2022 03:29:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b00494a11c5f52sm2489867lfj.256.2022.09.26.03.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 03:29:12 -0700 (PDT)
Message-ID: <3dda8e86-b92b-488a-5afb-0cb49e7e52ae@linaro.org>
Date:   Mon, 26 Sep 2022 12:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] ARM: dts: qcom: pm8941: adjust node names to bindings
Content-Language: en-US
To:     neil.armstrong@linaro.org, Luca Weiss <luca@z3ntu.xyz>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925210229.128462-1-luca@z3ntu.xyz>
 <20220925210229.128462-2-luca@z3ntu.xyz>
 <ec8cc121-9814-cd52-fb49-c33ab1376f89@linaro.org>
 <3070538e-fa8d-4506-bbf8-c2770d092eb5@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3070538e-fa8d-4506-bbf8-c2770d092eb5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/09/2022 12:04, Neil Armstrong wrote:
> On 26/09/2022 11:22, Krzysztof Kozlowski wrote:
>>>   		};
>>>   
>>> -		usb_id: misc@900 {
>>> +		usb_id: extcon@900 {
>>
>> Why? extcon is Linux specific name and should not be added to DTS.
>> Anything requires it?
> 
> It matches the current dt bindings:

Then instead maybe let's fix it in the bindings and DTS?

Best regards,
Krzysztof


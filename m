Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09F7874C6A7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jul 2023 19:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjGIRZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 9 Jul 2023 13:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjGIRZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 9 Jul 2023 13:25:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D909FA
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 10:25:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9939fbb7191so718401166b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jul 2023 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688923528; x=1691515528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dpp3G23d1UMv8kjbjiwhc4d7WJR736PVunLF1S6v/yU=;
        b=sUtrySA7WHUatdcE1Ior9IcnJmaMZQkZBLJmGq+jRkeO4gvk8BATD/KOrXK79LLa+t
         ZHQmS1NVOsaZinWRBxqtW/cq6gIvFMBCWKzZXq7QpikvyH0zOJy6kXlO3SEIm6kzENe7
         QzjUao9FwYwzwum308wA4N/gr4VJnZSPFJNZ0NaAaS8BUneK53wYwh89p1ViwOWzLhPl
         DHn0X8DKU/eKChol/ZAX1gFTtkHMYSOva2tM1ezm/MdjybJYmcwHYunBToCtaEdHKVF8
         pivYp3R2IwTfK1l+rxb5kXMzAFL+H8L8TWTSXMQ7DuznKIHm52wyEPdoJFJVg6s2us63
         6F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688923528; x=1691515528;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dpp3G23d1UMv8kjbjiwhc4d7WJR736PVunLF1S6v/yU=;
        b=Qzouw/Asabm5vWyopjdSnSDwtT4rfGnzOp+5UAtdR/fqD7ViWhrog5DhtXyU++feRM
         A2K+aiZXPFlmU+eaE8+peSisfZip9m6XxovMkUCCweZpG3iS8R9S4JTTd0Wd7SgZH4CU
         /Up22/1JTrfWJWx9893QzncEvs7e+4o6Idxwx++0LQ+ekCjjdTFqKzWKB5NBHuEy96Ap
         LgrpAJSlmBepCeGR5qjoC1iIBfRgXUfvowkOAeGnn3uloYlRsEXShVuEFFZOo2GkGHlz
         sazugOTg/jmAX5sSxI4PwVY/b+eUUcK4cEs/YV1mnS2BCeap4pMYLHytlb5Bh5wsNPJB
         A/Tg==
X-Gm-Message-State: ABy/qLZDB4VkMe6K9ij/sGkUgGCHtio8eax7hmh9iz1AUqCrn6I+4+t9
        nVs5TMiLV/1sW0A1IVUF+7wyEg==
X-Google-Smtp-Source: APBJJlHqbRiIps+tbnWMbB8QFAlN9qDjjxb/xg9uB1z05BEAHvBQ6tmFaz1UkRToJpAIFcSmWNxeVw==
X-Received: by 2002:a17:907:d15:b0:992:103c:43fa with SMTP id gn21-20020a1709070d1500b00992103c43famr15849207ejc.30.1688923528140;
        Sun, 09 Jul 2023 10:25:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id g21-20020a1709063b1500b00988781076e2sm4965791ejf.78.2023.07.09.10.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jul 2023 10:25:27 -0700 (PDT)
Message-ID: <730fa9bd-560f-e91e-d0be-3e73f9e56999@linaro.org>
Date:   Sun, 9 Jul 2023 19:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/11] dt-bindings: iio: adc: Copy QCOM ADC bindings files
Content-Language: en-US
To:     Jishnu Prakash <quic_jprakash@quicinc.com>, agross@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, Jonathan.Cameron@huawei.com,
        sboyd@kernel.org, dmitry.baryshkov@linaro.org,
        quic_subbaram@quicinc.com, quic_collinsd@quicinc.com,
        quic_kamalw@quicinc.com, quic_jestar@quicinc.com,
        marijn.suijten@somainline.org, andriy.shevchenko@linux.intel.com,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Luca Weiss <luca@z3ntu.xyz>,
        linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     linux-arm-msm-owner@vger.kernel.org
References: <20230708072835.3035398-1-quic_jprakash@quicinc.com>
 <20230708072835.3035398-9-quic_jprakash@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230708072835.3035398-9-quic_jprakash@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 09:28, Jishnu Prakash wrote:
> At present, the QCOM ADC bindings files are located in the
> dt-bindings/iio folder. As they are all specifically for
> ADC, copy them into the dt-bindings/iio/adc folder.

Copy? I expect moving. Either description does not make any sense or
your created a lot of duplicated code.



Best regards,
Krzysztof


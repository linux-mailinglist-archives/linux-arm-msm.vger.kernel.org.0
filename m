Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229D14EDE51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 18:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbiCaQFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 12:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239562AbiCaQFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 12:05:50 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B536177
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 09:04:02 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id c10so219890ejs.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=i8exGV0bEfz7fockPDZIKH4DGjNDQmL1A2DdSanaA7k=;
        b=IhU2wwo68dPixujjFS6hH/gAYbuctadDiy/If18pSZUCMCNprATz0oYCXVL5pSvVAG
         bhDMnPn5qkBHVe8jw2TCF2PXVjYKf+ieCgLJFAK6XGGN2nQFld+ECzvY/SIPJYcK9gar
         LISOK+NThskRi1GE4JJnYnqto41X30GBteiG5ZwKxGoXY8/tim9YCiR3yi5dQhOOL/M5
         95UR5fxHjsJ1VVqVnffDD40i8cbp2LyeElS1YoxqN1KS5PdwyUb/8vJ+OQMuuSSRixW3
         EZUrjFuKmD2ALNe0zmGdJdq/2/wIlD0BaWp7f89F18JUF4/hWybszVCMB3SaCCqcNn8x
         iJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i8exGV0bEfz7fockPDZIKH4DGjNDQmL1A2DdSanaA7k=;
        b=7wT9cCsl828/v89qKb4qtjkNlnAqIhs0zHicQoYQLfizIK6w+uHLAgGXM98JnO76S3
         2+KE3DliZCyGxfoJXzAB8xKO782qNQBDpyVhRh2e7rzbT6/CTRd99jOjTRjpTjo5U7B3
         3QZpjQh5lT+4jdJCNsLO7dDtk/kRAjHklmQ6gG/1PRQTvQ0NIAC37dhpPYrGp41tNQlI
         glX0ufEythTVyh84TR42ggz6uEuSW2NU9uz0KVYClgDUtVvfLJ5WsjRFcJ8ka6ooqy3u
         vw963L+JkCNDpQOmUMRCIAALz9s8Cb5wFkMADsCyREDgIv42xl6ervVj9AWl7JmOHOod
         0nPg==
X-Gm-Message-State: AOAM5322BM4/4kf4vQk3LZuu1cs37tFPuGSRSJrsshAEYNgLDC+Ir3F1
        c81fLCrUPD01iQ8zpKIquwzlRQ==
X-Google-Smtp-Source: ABdhPJy69ag8KVOrx4BRxgGGK2T7r/5GAGO/MSehpQqn+sTUWTGcI/9ZWNOTYQpCVeKhWbd54mQOjw==
X-Received: by 2002:a17:907:1b07:b0:6e4:b202:db8f with SMTP id mp7-20020a1709071b0700b006e4b202db8fmr2701516ejc.76.1648742641536;
        Thu, 31 Mar 2022 09:04:01 -0700 (PDT)
Received: from [192.168.0.167] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id b25-20020a056402139900b0041904036ab1sm11452823edv.5.2022.03.31.09.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 09:04:01 -0700 (PDT)
Message-ID: <1e2a48f8-e6b5-abf9-0996-3b8d2d97b4de@linaro.org>
Date:   Thu, 31 Mar 2022 18:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] spi: dt-bindings: qcom: convert qcom,spi-qup to DT
 schema
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>
References: <20220331155320.714754-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220331155320.714754-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2022 17:53, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1
> ================
> 1. Fix path in com/qcom,gsbi.txt.
> 2. Merge clock-names in example, correct $ref path (Kuldeep).
> 
> Merging
> =======
> The DTS patches are independent and silence warnings pointed
> out by schema.
> 
> Best regards,
> Krzysztof
> 
> Cc: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> 

I forgot to add the ack from Kuldeep:

Acked-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>


Best regards,
Krzysztof

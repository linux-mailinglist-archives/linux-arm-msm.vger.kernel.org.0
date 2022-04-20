Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B375086BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 13:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352540AbiDTLOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 07:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354697AbiDTLOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 07:14:43 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F7441612
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 04:11:57 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 11so1864426edw.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dd68attu6wu8SnkuJQL45TqfDMtpPSRWGhXsotp4fTY=;
        b=lEJ8p5ElATv5tyFZAbGsc745hOouC6LTxXrw9Bkb6v+j3URODF22aXFXhG0dmZOnoc
         xcMHtdlUaMadbQ/J25dUNYqM2fNIkTQrGq8CcT/N0qdiv4dSUSdSuVtC09352RKkQndt
         RdDPDX+kGDgldVfnXnoKtpkoZ40JA9Thp+nhrPHdiyildt36YwnDEmGxDTBGrdKH3l7G
         bnfrN0Auidp/galrNajKjI+u5XlZXs+jbq35cvIXSJB1146d0+yXgGCSV98n67lreBnY
         vQoHy0fQa47z+y8SEVVb+Q0v8W0OYKa7HzLbLYm4/rEFPuS6hB0JfBORr7y7NNYmy9/k
         DD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dd68attu6wu8SnkuJQL45TqfDMtpPSRWGhXsotp4fTY=;
        b=1YU9ZFNimiVTLhQ1x0S1+KmToQr3fv7hMcvOMl6FKfuVs3Y8/UppCt4a2CsbtcS4rv
         Gpf2mvmROD6mBcSMTPtjvlOOrnWNuqDBDhbr08NGKbhSq0zMOMIP7XIRAxayMfriQtaN
         2Q8ChNTfLbjut3CEc+51qOHGrAgnRNqNEoxoAWRUAZrTs0pzUoarQkmO8rDScNQvVDfC
         3tsSvd/VfF3UEX1e4mnY9I7aknpxjQdqycbcSjV5kctAYLWmGMRF9AUrO3ynvAKPFKFw
         X9nZYz+pCBXkpS7AdxRhl1P2IOEcfiareG3tzgngBlvKf6ciII/UJ3uFmL4/iK9rwKux
         omtA==
X-Gm-Message-State: AOAM531Qd+PXu2Vr2du0DkdV61UdoQ6kltk0LLXufW4aS9SqeojLB6hY
        m/wdz5Vsce8i8tXpQ2kQegbH7Q==
X-Google-Smtp-Source: ABdhPJxY1Yx1+CTh4SZOnb1fxoaQucy1q7RvAqB3GBbl9vKfDQMW6ddMc084uEsY/jIiGh/MJqYQew==
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id ec12-20020a0564020d4c00b00410a415fd95mr22513317edb.288.1650453116311;
        Wed, 20 Apr 2022 04:11:56 -0700 (PDT)
Received: from [192.168.0.225] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lo15-20020a170906fa0f00b006e8a81cb623sm6637533ejb.224.2022.04.20.04.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Apr 2022 04:11:55 -0700 (PDT)
Message-ID: <e08a8f96-54a7-60be-0bd4-7a74fdcd627e@linaro.org>
Date:   Wed, 20 Apr 2022 13:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: dmaengine: qcom: gpi: Add minItems for
 interrupts
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220414064235.1182195-1-vkoul@kernel.org>
 <0598d1bb-cd7c-1414-910c-ae6bedc8295d@linaro.org> <Ylf2gsJ+Ks0wz6i3@matsya>
 <9d35e76e-5d98-b2d8-a22c-293adcbaadf0@linaro.org> <Yl/iElIfHhmoOYOU@matsya>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yl/iElIfHhmoOYOU@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/04/2022 12:36, Vinod Koul wrote:
>> If the choice is per SoC-controller, then the best would be to limit in
>> allOf:if:then. However maybe the number of channels depends also on
>> other factor (e.g. secure world configuration)?
> 
> That is quite right. So we wont know how many channels are made
> available..
> 
> So is min 1 acceptable or do you have an alternate ?

minItems:1 is ok.


Best regards,
Krzysztof

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B1251A378
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 17:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352037AbiEDPSB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 11:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352024AbiEDPSA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 11:18:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4416E42ED2
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 08:14:22 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k2so2464131wrd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KM/f7jaQBkBOPOANIitdndZ91PcsmrJZUNaTAD99MtE=;
        b=VGv/dRbrno6dRtybyhCo6tVYSECgWk/uGSPimj7FJXI3Hd7JHFDss9JMWMtotIZJUL
         kdOF+HOlvsNH2X7v3TXeRcfJU8WPxezGQJ3KDALwkMEmo36A03BHVQdGT6WCy7SgsjQ7
         RPrWWn87kswU4wJG6r3QXZAu7E+E9lcNqej+Bi8DButV6oDkSfaRVQmgNC0rT21O6WlY
         55AqsuGChj8okZP1ncFV+wPM+lyD/OOWfkKKTh1pWCwpLmOhrdhrM1YN/BbGgs0CmAua
         UkrcJx/LFC1RPDG240qKdmR0bJOIwKXteWHJ/HEBVHoZsPZ/I/QJUE7AhgydZ4MtQ3cC
         1lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KM/f7jaQBkBOPOANIitdndZ91PcsmrJZUNaTAD99MtE=;
        b=bctAui25EXv8it5NzdM0ZCeGEVvg+3Ifp3oAoSU+MFsgFoiit3XnjRQiFIGB+VTU30
         8Q1HzVwLV9kc1oP+krkbsZCT6D1e6ZGC1GMtGOntYGvFhPFGr9GQDSerNt5/THgHzME0
         uqmvBJU6qq1tV47BdWhkstiFAxKJM5kCRYLm2G446oLU/XmQ35+1nr3BdoEWA1lWxUp5
         s2AR9Yps0pr+nguSWsIdQPKQqXLC04y9rM/QsUjri9s7qgYeB6uoc33jAajk/J9aW/WD
         RZnN6/YSyYeZUnghOzhxyHKT+oPwc2o4mE3FVeffb2w6XguOaijswqNL+GQl+xV2hJ9F
         4HUw==
X-Gm-Message-State: AOAM531fqttGo3fk/kZ6IpURMWQ7LCvInECKzwfuzElsJH2U4aHUeyKi
        +EbsvfL9T3HJpjci7oe+TaASkA==
X-Google-Smtp-Source: ABdhPJzCmKKVgbh2e5QU/zVYFY0v3QjNxas3G4hk2DGXqAw/s2IbQ58xh1hyQJlUzAElG2BcOVMdaA==
X-Received: by 2002:a5d:6d05:0:b0:20c:64fd:f98a with SMTP id e5-20020a5d6d05000000b0020c64fdf98amr10370797wrq.474.1651677260856;
        Wed, 04 May 2022 08:14:20 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v19-20020a1cf713000000b00394431ac1a3sm3904584wmh.17.2022.05.04.08.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 08:14:20 -0700 (PDT)
Message-ID: <cfba178d-ff36-910b-3067-ce32b701b643@linaro.org>
Date:   Wed, 4 May 2022 17:14:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] spi: dt-bindings: qcom,spi-geni-qcom: allow three
 interconnects
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220504125119.190526-1-krzysztof.kozlowski@linaro.org>
 <YnKVLxmz0hhQGNzI@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YnKVLxmz0hhQGNzI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/05/2022 17:01, Mark Brown wrote:
> On Wed, May 04, 2022 at 02:51:19PM +0200, Krzysztof Kozlowski wrote:
>> Recent Qualcomm Geni SPI nodes, e.g. on SM8450, come with three
>> interconnects.  This fixes dtbs_check warnings like:
> 
> This doesn't apply against current code, please check and resend.

Thanks Mark, but as explained in commit below "---" - this is a fix for
commit in Qualcomm/Bjorn tree. Could you ack it instead?

Best regards,
Krzysztof

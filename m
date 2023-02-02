Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D66426889B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 23:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbjBBW1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 17:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbjBBW1L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 17:27:11 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDE911664
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 14:27:09 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id v10so3520466edi.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 14:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=htsoF+0dAV+soqelwMOxu8OLAjWrlwNcAr2UdCMs8v4=;
        b=H44bIUH3EWCmyadBXYgygjbXAYlG952xbCVe1R1Lu41LfJ1MmT88QhdPiPtdCYjY/O
         YN7AIIIYhSd8vN0BMDcOk85ky+avOHAvXDS8YwOJ70AQNwRum7QO+1uCqgRcP4Q9/0XB
         tTnYzrDXzovj4h/qsdjE4ONlN94GjXrWB6cGW4GvssCqAl1M129TpWzB4mwtdIVG7bz0
         9LfJEw01Htor7po8vMgfUnmp1Gqexw/Q3+T3KrFFyhMafMeWKZnmEH1SyFVmjt+p4SA4
         IJEcaU5aZL61WgoCPjWbnR0EBZWkl4JCk/lAX8UNAUSoIWR4CcCugFsTKWb8u0S+eTdk
         EWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=htsoF+0dAV+soqelwMOxu8OLAjWrlwNcAr2UdCMs8v4=;
        b=bwAaz29idRVt5sMU+eNobysikzHeDGQt7L6yP+X6k/Gfgmzxlt3DWAR07rwx/bU8Ee
         0gk5K5W5WP24zrHBJCYTju6OeRzBXLX6/UH3tYIYPmlqxllMS585/4MBK/fFmWfRR8al
         Ma9VnDLQ7qRGIO6J2joSuyWCj2Qa/6WakIIQFheHxlUK3sUVKxPTmsCrlpbbNDmTlUF7
         yvbTHTEs5Hp+drnY684avrpfA0n4YJV57Ma6tutXFMFETLRFxqBZnEqH+/SAeYUOfGnZ
         LYiJd9NrDtqx1r0ovawBaHN0B2Jf7n6tLJyzH4nZ4dD2fO8QepnInnFAXXRbUdihlFml
         o32g==
X-Gm-Message-State: AO0yUKXI6CStux9JQIGsfQY9806MAD1BJJEaL7QB3vHydwCjKm4x9pFV
        pmK9Mfvr7UziaSMEOzme9WNyag==
X-Google-Smtp-Source: AK7set/yLIBMIxVVa09c0abZawIa36KcE8yzXqO5U2V8ePOTwQhiJEGkap+3ftH4iHbY8R7Pb99vPw==
X-Received: by 2002:a05:6402:34cc:b0:49b:67c5:3044 with SMTP id w12-20020a05640234cc00b0049b67c53044mr9046173edc.4.1675376828243;
        Thu, 02 Feb 2023 14:27:08 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id s22-20020aa7cb16000000b004a236384909sm303300edt.10.2023.02.02.14.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 14:27:07 -0800 (PST)
Message-ID: <22f191c4-5346-8fe7-690d-9422775bb2d5@linaro.org>
Date:   Fri, 3 Feb 2023 00:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On 2/2/23 15:53, Krzysztof Kozlowski wrote:
> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>> default by security firmware.
> 
> Then probably we should not require them only on these variants.

the rationale is clear, but here comes a minor problem, older platforms
require clocks, when newer ones do not. When a generic SoC-specific compatible
is introduced, let say "qcom,ipq4019-qce", it itself requires the clocks,
but then newer platforms can not be based on this particular compatible,
otherwise they will require clocks and this comes as invalid.

How to resolve it properly, shall there be another generic SoC-specific
compatible without clocks and NOT based on that "qcom,ipq4019-qce" compatible?

By the way, QCE on SM8150 also shall not need the clocks.

--
Best wishes,
Vladimir

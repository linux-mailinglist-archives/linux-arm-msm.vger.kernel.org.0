Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B373C687F80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjBBOEr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjBBOEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:04:45 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C21F65F3F
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:04:44 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v13so2069712eda.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHoq9f2Zn1W/sDuV+jwgMU21s17dLAzi7cnmxQ0SwVY=;
        b=Wt5jAtgjIU5sShKC+90oRxtl9+uKs299qm41mg8RYE5+oZRS8v0PwHVFIJRDDwSw1Q
         Q6Y2p1GcEiQTWqg3JEx8rXNayMuCTykK4wS+e0eCqNNXoHnvuG6ypvG3zRAxAHh+AUpv
         JnftM4VKEGbTiLH5OiUBrqRmWKGfwFwD7JvTUPsUMq1Zi8xvDFX70YLJGbRODPsIeVHM
         ggpCHIa7fmbdLqBFBiRfcCihXGGPMFXQykkv7qh9S/vKrgVLK/EjZI6HLC4TzkBhp87u
         Ha7Mky28YrDeuh48sHckdv6OQLrKTnKZml4SA7CQXL2t4WQwUA6gGKZtfoWEgtRV8BZq
         Xahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHoq9f2Zn1W/sDuV+jwgMU21s17dLAzi7cnmxQ0SwVY=;
        b=D6/jLjSwh4BQl+t5AVTnHofFjqKqSG/fI+xBBMlzaknjsyPTwvxlbKpIVXwrENiH7I
         k+wLrLrHQMGuSLVOhy5eEF942W9hR9sCbevh2M5vq7jEV/6XBP9224e47+ikcDJs8tMp
         NCEqAwGZLa+9QYhg+eN8zYWp78hQi6QQcjK5nfTfQ0eZHp9EcwJM7ksBx5R+DAL7Ithj
         US7Bf27U8Vbn6VsnScEriic9dNgCMRMQnOMXFUco11SoBdQYxV7XJy+b+DmMVImvj1w+
         aaYg7XkcrDHNSuvEasphUPXPgoQsGoCxY89tU3hSsdR6CD0bOsv6POagd/+aCgx13eOp
         CrNQ==
X-Gm-Message-State: AO0yUKXjnHllJbAVZFC4QwnxLrgVUqgC4Z6PF2cNB8PfRd8HqmubCkQZ
        20bLp/mxVqEBn6SNYrDe3w6K1w==
X-Google-Smtp-Source: AK7set9WK3ACkL/53gGbV+RFwL/EDOb4g+fxVkmMOxficxwf2qunm3jwyTTN1RoC22CyidgHU46TiQ==
X-Received: by 2002:a50:c350:0:b0:4a2:2e8a:14dc with SMTP id q16-20020a50c350000000b004a22e8a14dcmr7262915edb.3.1675346682681;
        Thu, 02 Feb 2023 06:04:42 -0800 (PST)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id l11-20020aa7d94b000000b004954c90c94bsm11390101eds.6.2023.02.02.06.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:04:41 -0800 (PST)
Message-ID: <36b6f8f2-c438-f5e6-b48f-326e8b709de8@linaro.org>
Date:   Thu, 2 Feb 2023 16:04:40 +0200
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

I don't have the exact list of the affected SoCs, I believe Neil can provide
such a list, if you find it crucial.

--
Best wishes,
Vladimir

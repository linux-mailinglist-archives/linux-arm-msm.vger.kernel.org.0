Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 361C6687FDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 15:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjBBOXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 09:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjBBOXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 09:23:09 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358E9241F1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 06:23:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so4128625wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB4h/C/CtbFY4rXmucKBqG0MqbmHC4KWkwhlRlIb+2I=;
        b=bzo3nwG7ZmwfN9KX3sxXEcPruFfXZNJTO5B2WFHTKCYsxSVEzj+Y6q35NuOHb84umr
         cq5wnf0sUjSTAleMT8Fum8Iac+2tBlg/2F486oM7FdVjQ66EpIRpraiRWfW0MhFXeU4W
         nF3gmIXQl9wLgpOnwKz5/7Z+4G4Lj/RZza1yZC7x/l6Li/ar9PVMLZ5aBuoN7t2GLphI
         wB5hNk5q1rqAKAL5bgKJJInH72Rjrm2dg5u0oKufxSGEtvcQ52jknKvSGfdrGNAreO1p
         zsRd9kBWMQTolj1TajyH0FlTmRxpGIyfVUD+2DgXd+c8V16+T1Ss69clGoqAHFXwxLho
         kCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YB4h/C/CtbFY4rXmucKBqG0MqbmHC4KWkwhlRlIb+2I=;
        b=f2/CrQVfrKNDhUc+dJr2C16RGgLJjLrXSbecEoN4tEAqfckNclrmecXEgBM9Yvi1LA
         VU0jhFRFzLPHH8JM5wDBWt3Eo10lhQw6GMGXqsGYJvIciQgbkAit/nVyCuNxRhp4arSm
         Ma1lazd8Tq+WFAyvJeMPP4IPDcsvGTYb/2t1zfDtP7jrQWngiDvlJhB27IThyIs4NGNX
         UHQ+SruCYbHqcpOvGFWteY2YuX4tEzIMw5998IgZ7/grAnvhZnGLBx5np+QgKUZgG6DP
         JSIm7V8x883o8sGrMHflwVTDwSIDve9GM71eYXGlfVnLbIROvU+syyLjZZes9gh7QWGz
         r/3w==
X-Gm-Message-State: AO0yUKVPn9wGOh53HD3yRTNvpA/8J/Vo7L7p1e3QvR/p2jXxsk2NOs6Y
        9RhKAVHCmhU+S+fmU8ljAWlY9Q==
X-Google-Smtp-Source: AK7set/HE5p2w/dzpHWaV2sxuNs7PJNgTft5opkJSpseRkiLmxy5Popw8z4rysmsYdiYCtz3baLOrQ==
X-Received: by 2002:a05:600c:5491:b0:3dc:16d3:8c95 with SMTP id iv17-20020a05600c549100b003dc16d38c95mr6366493wmb.30.1675347783631;
        Thu, 02 Feb 2023 06:23:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u6-20020a5d4346000000b002bc84c55758sm21647028wrr.63.2023.02.02.06.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 06:23:03 -0800 (PST)
Message-ID: <cc0cc6a0-2403-82e5-fff0-630dcce99b89@linaro.org>
Date:   Thu, 2 Feb 2023 15:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 5/9] dt-bindings: qcom-qce: document clocks and
 clock-names as optional
Content-Language: en-US
To:     neil.armstrong@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
 <20230202135036.2635376-6-vladimir.zapolskiy@linaro.org>
 <32c23da1-45f0-82a4-362d-ae5c06660e20@linaro.org>
 <36b6f8f2-c438-f5e6-b48f-326e8b709de8@linaro.org>
 <a2e4dff0-af8f-dccb-9074-8244b054c448@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a2e4dff0-af8f-dccb-9074-8244b054c448@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2023 15:21, Neil Armstrong wrote:
> On 02/02/2023 15:04, Vladimir Zapolskiy wrote:
>> Hi Krzysztof,
>>
>> On 2/2/23 15:53, Krzysztof Kozlowski wrote:
>>> On 02/02/2023 14:50, Vladimir Zapolskiy wrote:
>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>
>>>> On certain Snapdragon processors, the crypto engine clocks are enabled by
>>>> default by security firmware.
>>>
>>> Then probably we should not require them only on these variants.
>>
>> I don't have the exact list of the affected SoCs, I believe Neil can provide
>> such a list, if you find it crucial.
> 
> It's the case for SM8350, SM8450 & SM8550.

So let's keep them required for explicit list of compatibles (older
devices).

Best regards,
Krzysztof


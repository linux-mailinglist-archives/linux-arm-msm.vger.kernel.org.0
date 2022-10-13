Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA465FD948
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 14:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiJMMi6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 08:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiJMMi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 08:38:57 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBA711D9A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 05:38:56 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id r19so868277qtx.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Oct 2022 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5kz9tUsFqTbeOstAmkjMnqXNuAGfE9Jg+Fa6WSlHaXY=;
        b=ZK8VDKTZB/G6KzUx18/x7iGXsNCnhmsEUHjFq/DOGq3C+2rzQ/onKPlyoiLxY3kr6u
         vmvmQTeAHzrP7zl8Cq8dRTULBmrnfhxqFAi2p74AvAI/iw89aODcguStpcU8iM0RAC4l
         i0WtaMk1sA7rak0Go/GCe7uQYyXkVU3nJ39s17YsxyblW0OHO6ltbHSHwTc+0QaH0iNL
         XFap/X+b5TxlTZPpUzZcWR1leFsj6UF0ApCD11XqHYW5BDM4tJdzENUx1dnvo+NaDHhW
         9YCg/g6zV/tYFGch21jEvfbTGotqlXqbVKw2ZUxtF98WTzs7jx3k7tqe8qvZxama4pi7
         zJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kz9tUsFqTbeOstAmkjMnqXNuAGfE9Jg+Fa6WSlHaXY=;
        b=g3NaPBAx5GmWi3jLxjuYmMhp9XmDSobDNGgXFe3W42Pom9pQgnT4EC/PgtErwXVP77
         9sa91zt0NXbLatqsOgdAc7hUk6vnSkJT2qfuO95NqDf0vJEOLDOFEz7347dnz0oRLA6X
         eBSnFhZRoeV0ogQ+JvJhn9M4jwW7ketg6tUq7EQu0MFiQ5n/NbeP3nipWd2L7awqzZkz
         kmzjDn7brXnHD6W0O55XRD390GD+8CWW4LXnfNdQi2qLQSApAckJ3W0Tw+Nfq9PTYXed
         6BN3d6/504jXFR9uBsRQrMt01TKIKyF3CoCIp7cntwxtTEjwclgqtpRy+VDJXNGZeHOQ
         xB8A==
X-Gm-Message-State: ACrzQf2AwKwTDVAqHzeS2YcyUKbK8UVfwpg6iVnnfAetGhjioZLVG1Lg
        Oi5iX6Sw8qGBP3Qdc2aaFPa9TW9Zn8NoHw==
X-Google-Smtp-Source: AMsMyM7QGWwq2TvteduWwhCjLEthvj2mVj02Nsr1AAZ/3O3uzKlIbcCYr5JBhY8RY7/i+vnIKYW/Sg==
X-Received: by 2002:ac8:7d45:0:b0:396:ce08:4b49 with SMTP id h5-20020ac87d45000000b00396ce084b49mr25163847qtb.650.1665664734315;
        Thu, 13 Oct 2022 05:38:54 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id o15-20020a05620a2a0f00b006ce40fbb8f6sm18877024qkp.21.2022.10.13.05.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 05:38:53 -0700 (PDT)
Message-ID: <ee305dbb-0714-4d7c-437f-66b66842370f@linaro.org>
Date:   Thu, 13 Oct 2022 08:36:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: qcom,sc7180: convert to
 dtschema
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221007145116.46554-1-krzysztof.kozlowski@linaro.org>
 <20221007145116.46554-2-krzysztof.kozlowski@linaro.org>
 <CAD=FV=WN+9DJp-3Ny04NmOLau2RYibeJayEtB7x0uT-YoizFQA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=WN+9DJp-3Ny04NmOLau2RYibeJayEtB7x0uT-YoizFQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 13:42, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 7, 2022 at 7:51 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> +      drive-strength:
>> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
>> +        default: 2
>> +        description:
>> +          Selects the drive strength for the specified pins, in mA.
> 
> The "default" of 2 is not correct. Please see commit 768f8d8e45f9
> ("dt-bindings: pinctrl: drive-strength doesn't default to 2 if
> unspecified")

Uh, you're right. This was copied to one binding and then I copied to
another, and another...

> 
> In fact, are you sure this even needs to be replicated here? This is
> part of the common "qcom,tlmm-common.yaml" bindings file, isn't it?

If the value was correct, it might be per-SoC specific, but that's
another question. The default value is actually unknown, so I'll remove it.

Best regards,
Krzysztof


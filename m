Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A568557D204
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 18:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiGUQwQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 12:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbiGUQwQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 12:52:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC2F8BABC
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:52:14 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q7so2487519lji.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 09:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eZWePtkmW38ghd0Ghj4mqIdKzqnUwv6l+PWxC4PR9Fo=;
        b=xIqk2NDONVGSt9CFDj74RXp3+ZhVTqdS38QUbdoe4QPu+U55MQTbtXruHio+rZkGeR
         JhJkHIMD4STN9fefcql3MRiZERzo0EJvviBKQbafQmj8+wu7B+0xyCKVVgRP2LVsWODz
         ObofyXcSbFP6eeQAaqC7rU7QT0xCdwL+y7cyZG/rDVKZAXb0iKJJEgXCZBunpx2XcUJz
         uOtd/d9kysS88KAO6okDLe/0WWPcSLI6tyNrXmGvlV0u92LrkY9LVFjwB0OGrWDbavt7
         L6g0Xoz9ffMmXBYezMDBjIYfl6iZgLumW4RRNIASfYRBr8rLWMK78A0zGzYF37n8260t
         gyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eZWePtkmW38ghd0Ghj4mqIdKzqnUwv6l+PWxC4PR9Fo=;
        b=CMaapLN2KYugo9tom8tQyluyvN9Su8RGXHZB2aBQct3TUB3k2Ms56NuXYR+uhXw4fw
         SwP2ykM7+qruIHRySPmGPFjk6V8wxpl4qUfvcBjs+oB+IVOHlh9WGkWg8RZvvGruUrlq
         V/fs+5xHfK5NNPZS0ZSSEHPZ2xECVuRbvFPrV6mAogXvn0s0MS6/kSlihtGKHY93fwSu
         DJeCce6TGuKN/dmKp3uuhU6O/0owtbsOTuHJHCiPeYpYimXe+q7WPZlNy+lZPpk2dwhm
         ldfslvBawLuJg2FyXotZJ2DYbnoR+bzQ6sRQb0iOEerPrL0CQIrBO1AH9/asfDJ4Z3SW
         gZkQ==
X-Gm-Message-State: AJIora9jApl3odgw8qzZKht+eUUOa54vCj+eK/qV0id0Ml0PDENWBVY5
        SQl6vENp2x7r6jvMqUTv1JxF9g==
X-Google-Smtp-Source: AGRyM1sLupBygsiOlOL5jneEivZDUqHn/Fu625JHyf7f6wLB6zZW09v4ma4/XP/dJfkD+HSowAvxNg==
X-Received: by 2002:a05:651c:12c6:b0:25b:cab8:cc2a with SMTP id 6-20020a05651c12c600b0025bcab8cc2amr21022982lje.110.1658422332971;
        Thu, 21 Jul 2022 09:52:12 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id b9-20020ac24109000000b004870f517c89sm543394lfi.33.2022.07.21.09.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 09:52:12 -0700 (PDT)
Message-ID: <c2b03863-2249-13e6-98e0-731c1b40d0a9@linaro.org>
Date:   Thu, 21 Jul 2022 18:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: qcom: Document additional sku6
 for sc7180 pazquel
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
 <20220721033918.v3.2.I7ecbb7eeb58c5e6a33e32a3abf4d6874e6cb725c@changeid>
 <CAD=FV=WSBgupLFMCZgianck6uTkAyqrG0WK2ChSbNbJdhOPdLA@mail.gmail.com>
 <4b2fe9d0-f590-0fac-79fa-bb05da1d61df@linaro.org>
 <CAD=FV=XmaNdc9k98vAwbcN-sm0w_WeqhRsK_AUm3h4LZ5-egmQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=XmaNdc9k98vAwbcN-sm0w_WeqhRsK_AUm3h4LZ5-egmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/2022 18:43, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 21, 2022 at 9:33 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 21/07/2022 15:37, Doug Anderson wrote:
>>>
>>> Not worth sending a new version for, but normally I expect the
>>> bindings to be patch #1 and the dts change to be patch #2. In any
>>> case:
>>>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> I would say worth v4, because otherwise patches is not bisectable.
> 
> You're saying because `dtbs_check` will fail between the two?

Yes

> How does
> flipping the order help? If `dtbs_check` needs to be bisectable then
> these two need to be one patch, but I was always under the impression
> that we wanted bindings patches separate from dts patches.

I don't think anyone said that bindings patches must be separate from
DTS. The only restriction is DTS cannot go with drivers.

Bindings for boards go pretty often with DTS (subarch). This is exactly
what maintainers do, e.g.:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=arm64-for-5.20
Bindings for hardware should go via subsystem maintainer (drivers).

Best regards,
Krzysztof

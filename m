Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178B663AEF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 18:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbiK1Rao (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 12:30:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232991AbiK1Ral (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 12:30:41 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7C927B3C
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:30:25 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so18444819lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhEjwc4mqouPVkAuK+T25Gj3BiX3BsYurojhBq8+1Jk=;
        b=pI+BhIMxbk+h+cP4L+1FEwbDmHI8K/vSSG/lcecYbITp56Pg0Nska6LrkxnzCv0Tmp
         /OOuAKZ3u7m7ahcc0pWZNo/2C84ZmptNphCxtilC3SuK3meJu7S2FUzprL7Vwx/brpPV
         LpCwYVfzYd4bJuhKL+duRvD1W1cLMESCPPCfoH0NqVAC+Lx0bIfvS9zYo8Q/aW1pfhtv
         9XwHrWChTAsbVrYyjHX14rlspQxjuA4ysnGZWr9dhJQIO45beNwnln+Juw4MqciwXiyJ
         wsgZPS+0EF1KHKCxX4Z07svkML4yYb7SjzmxWEoK9l+jSYnyuK3XXKD2om88VwUPFJIA
         X85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhEjwc4mqouPVkAuK+T25Gj3BiX3BsYurojhBq8+1Jk=;
        b=SBL+XiLLGquEWkmdIVG5nimGnOojE8V1I0iL3+7+B0v6zQCnIPqcu5Szs8RhtdHFJD
         YqafiLKRWaGuFdUxZ7RhwnkqXGxEkLxFX4y5sXXaAtGLjy8P++yvxxuZx64elSjt5zw/
         3qzhYjTd9UFTNL+J3R4GhLu5z1OqDIos5sjSRSUO+J3vqCxQodZHDOsu8dJEEqO2JW15
         ZzxHppKq8vaIgKimzV4HoxazvsqfY+HAVmB43KnuJaBESW8x2oSZ8fb4gLcrbPd+ClfB
         pzcTetGJ5GuV82qnyqbUhVtUz8XX+Z6YYu3SKYQ0LRWJlRx1uX3agZyhgBjOiiaLnsWn
         A9iQ==
X-Gm-Message-State: ANoB5pkaGmMZbxBFABjatuBL7eLnYo+QvhMROGZkq1hkly5TDgXRLs2z
        mpehhgGkApE5Mm+GigO7A9CPNA==
X-Google-Smtp-Source: AA0mqf62sknFvt4nP4VmTAbIFMbdp5F66aTO6/SCZnd7pUyBz2bSlf34136D0CJ3Jgi7AlEOtbFhJw==
X-Received: by 2002:a05:6512:3c89:b0:4a2:bfd2:b218 with SMTP id h9-20020a0565123c8900b004a2bfd2b218mr17778188lfv.228.1669656623997;
        Mon, 28 Nov 2022 09:30:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t1-20020ac25481000000b0048a982ad0a8sm1820836lfk.23.2022.11.28.09.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 09:30:23 -0800 (PST)
Message-ID: <9fea68d5-cdae-dc94-bd3b-71ba12a23a9b@linaro.org>
Date:   Mon, 28 Nov 2022 18:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Add zombie
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     =?UTF-8?B?5qWK5a6X57+w?= <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Gavin.Lee@ecs.com.tw,
        Darren.Chen@ecs.com.tw, Abner.Yen@ecs.com.tw, Vicy.Lee@ecs.com.tw,
        Jason.Huang@ecs.com.tw
References: <20221124115712.v4.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <CAPao8GK93KMrtaXw7mNWOCE60zk=uCENLfBXhNRVxJXEnnaGFg@mail.gmail.com>
 <f58866c8-0164-2e59-4ff3-f9a4f9334e49@linaro.org>
 <CAD=FV=UtiBYg_S-n7ZGFEChQcaMiima19qfYPibyW9DbQEsivA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=UtiBYg_S-n7ZGFEChQcaMiima19qfYPibyW9DbQEsivA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/11/2022 16:51, Doug Anderson wrote:
> Hi,
> 
> On Thu, Nov 24, 2022 at 1:29 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>> 2.
>>> I notice Kryzysztof say he didn't in cc mail loop at beggin, and below is
>>> my updated mail list:
>>> ---
>>> Series-to: LKML <linux-kernel@vger.kernel.org>
>>> Series-cc: Douglas Anderson <dianders@chromium.org>
>>> Series-cc: Bob Moragues <moragues@chromium.org>
>>> Series-cc: Harvey <hunge@google.com>
>>> Series-cc: Stephen Boyd <swboyd@chromium.org>
>>> Series-cc: Matthias Kaehlcke <mka@chromium.org>
>>> Series-cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>> Is there anyone I missed?
>>
>> These are not correct addresses and not complete list of them. Don't
>> invent the entries, don't add there some weird addresses.
>>
>> Use get_maintainers.pl. That's it. Nothing more, nothing less.
> 
> Just to give context here, I think Owen is using `patman` [0] to send
> patches. Yes, it's part of the u-boot tree but it's designed for
> sending Linux patches too.
> 
> By default, that means that get_maintainer is automatically called on
> all patches and those entries are CCed. The extra "Series-cc" just
> lets you add extra people. It's fine to add extra people to patches if
> you think that those people are interested in getting it.

The tool is just the tool, if it uses get_maintainers.pl, then result
would be correct. The problem was that CC list on v1 and v2:

https://lore.kernel.org/linux-devicetree/20221117094251.2.Ibfc4751e4ba044d1caa1f88a16015e7c45c7db65@changeid/

https://lore.kernel.org/linux-devicetree/20221122203635.v2.1.Ie05fd439d0b271b927acb25c2a6e41af7a927e90@changeid/

As you can notice there easily:
1. Bjorn's address is wrong
2. My and Konrad's are missing

So if you say that get_maintainers.pl were used and tree is not v5.15,
then what else?


Best regards,
Krzysztof


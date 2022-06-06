Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8511653E9E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jun 2022 19:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241209AbiFFP5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jun 2022 11:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241183AbiFFP5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jun 2022 11:57:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D302125B
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jun 2022 08:57:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id s6so23949826lfo.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jun 2022 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YdNQsAh0qlk4u0zBBVjDkzwiH9R4DqegW0uwFh+QZew=;
        b=Ry/wQFW21izQYCGVPxoTTQkGOePxLZ94A6g0x0GNQyIisRWf063vJSA9VrU6GHiNBJ
         8tX5GNA2Q/evL4mMqDhUdJP/XblS2pNXJtKFL8BB5v4nSP+/BNMhEhM9eY7ndE8sqpEd
         NkWhDGj2l5I1giLnh5G/k9ykB4AhicZpUHfTpl4a7itRpZQZCBNjxW0TpeS0DEfpLCEq
         7t7VYoei6nEklWuuJEgdUFWGJf+1zQYE2oQABaGRbJMLdBv33H3GUPn4rT1nEKFh3veh
         RPLBYhzEFDxkR+/0tKBtIVmloJoLJgeszvSZkxPXZxRz3EfvLAY/vnmGSAsT1MzflzY2
         jsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YdNQsAh0qlk4u0zBBVjDkzwiH9R4DqegW0uwFh+QZew=;
        b=XsBBzTMKthi6xanYYDcYfMg1juKLp46fgbjQFdBNXUynhH9VzF5hgXKfnjiegkj102
         cVqnsOefYjFBtj/fXPhBDHPLyaqWbF3/0DnhqtHB0mWRPYmAcWu838CjjYkqWBovR0Y6
         sOgo+Tre7yCTEa609thmBy25YL+39qzj0Iyphrtxaeyq6PVVIoy+NLqmU8ui9K/nbY3O
         II5SSQKnKvJR6uxVVP5KtVks5xYB4IPQ0+V2SoK32EqErqqh65Mw5kGTlnlwpSllvUav
         /MEkSSs08eQO72T1C6fFu/YGTQd6IoafSk6HVoiU30/ZOrXQlwfgAais37mBXem2kyIq
         S4UQ==
X-Gm-Message-State: AOAM531qAj3SN88B4dQ7s3n4bnYwhwfO6CgyTfIeRBZbAGaiijpL79tv
        BvbKjOfNYq8VsAQr4ZZmhXXH3zl88By7OLYL
X-Google-Smtp-Source: ABdhPJxanyqAWNvCGkqFfFiDr0g6eEVU9GfHoKUKyz3jwWQBwP8oldiA+lJj0xPi8o4Z+6YdMBM3Yw==
X-Received: by 2002:ac2:5b08:0:b0:479:16ed:e624 with SMTP id v8-20020ac25b08000000b0047916ede624mr11946145lfn.618.1654531025868;
        Mon, 06 Jun 2022 08:57:05 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j22-20020a056512345600b00478ed85bc92sm2906342lfr.249.2022.06.06.08.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 08:57:04 -0700 (PDT)
Message-ID: <9872153f-8f46-23c3-6eb7-154d20fdee5b@linaro.org>
Date:   Mon, 6 Jun 2022 18:57:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
 <dbe6d9c5-f717-785f-e65d-baa1328cea2b@linaro.org> <Ykx6NWrcf4IA2Mam@ripper>
 <CAA8EJpqrJr5RB8E6CQ+cAgp6bad4m_LSG6CPeMsf+Ws0jqFf1Q@mail.gmail.com>
 <YlTlZa35A4lu02oI@builder.lan>
 <2af9a8a7-0904-df31-7c1a-21705bcda8d6@linaro.org> <YlVf13E+AI4JAgkp@matsya>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YlVf13E+AI4JAgkp@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 14:17, Vinod Koul wrote:
> On 12-04-22, 09:34, Vladimir Zapolskiy wrote:
>> Hi Bjorn,
>>
>> On 4/12/22 05:35, Bjorn Andersson wrote:
>>> On Tue 05 Apr 12:38 CDT 2022, Dmitry Baryshkov wrote:
>>>
>>>> On Tue, 5 Apr 2022 at 20:17, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>>>>>
>>>>> On Tue 05 Apr 08:38 PDT 2022, Dmitry Baryshkov wrote:
>>>>>
>>>>>> On 11/03/2022 01:19, Vladimir Zapolskiy wrote:
>>>>>>> All interconnect device tree nodes on sm8450 are 2-cells, however in
>>>>>>> UFS node they are handled as 1-cells, fix it.
>>>>>>>
>>>>>>> Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>
>>>>>> Bjorn, could you please this pick for the -rc kernel?
>>>>>>
>>>>>
>>>>> The change is obviously correct, but what difference does this change
>>>>> make with the current implementation?
>>>>
>>>> it makes interconnect paths probe correctly. All NoC have
>>>> #interconnec-cells = <2> now.
>>>>
>>>
>>> But there's no code in the UFS driver that calls of_icc_get(), so what
>>> does this actually do? (Other than correcting the dtb for the day when
>>> we add that support to the driver).
>>
>> FWIW the change also has a runtime effect, it fixes a parsing of the board dtb,
>> otherwise a warning in the kernel log appears:
>>
>>    OF: /soc@0/ufshc@1d84000: could not get #interconnect-cells for /clocks/sleep-clk
>>
>> Why /clocks/sleep-clk is mentioned here at all??
>> Its phandle value is 0x26, which is equal to SLAVE_UFS_MEM_CFG from the array.
> 
> We should either apply this fix or a patch to drop this line from dts.
> Either would be apt and latter would make more sense..

So, neither of the patches were applied. I'd suggest to apply this one 
now during the -rc stage.

-- 
With best wishes
Dmitry

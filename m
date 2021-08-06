Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC503E2E3F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 18:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhHFQTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 12:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbhHFQTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 12:19:02 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E49CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 09:18:46 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id a19so12786691oiw.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Aug 2021 09:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MmXvZWNepFYv47Q/7EcvmBVHj1K7E06LdFI39fL5IbU=;
        b=hWIpiVwzEc7fKZUSteTFD1bBQvGogbzHJbkxYJP9TiXJJf9XFFXvkPJE5+zqPxH5dM
         Wz1kuEA+L4+jKfCkzJCzsuAR+gJkm8lupEwzuUf0JWa/F40cLkvFCmqhhyhRuK6WrjRp
         aNiRXkFAxbGWnICjuOzvnjDSId2luKPomvkggRTjDLRiUZpI0j8+qn3ZCWeaDTWxNuEV
         6rO0jtrC/Kr66+tTKzftFtAjTbAfpSpzDcVQgXAkTXUzmZjO5rDJkx1F0O5P1QVQsmoG
         OdxmM7RW4JQ15YmGf17fzIBL7x1FNh1GiLtiYNqZpnqNl3Q5GXqLZi2Tc3k9mlLcqYih
         VQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MmXvZWNepFYv47Q/7EcvmBVHj1K7E06LdFI39fL5IbU=;
        b=fhL0xQGUEntY5ej6ykW1w14dA6IvZr0WIFOV//l9jxGHHESjN6u8Jsg+gT1ocU88uD
         3AoTsO1ubWxuKMFdwn7tZzFGeFIA8lFaV5okB5bE5n+Sp7jTyg5hPC4LUmyx3vGjYoHe
         evhh0GuVaJavicgnQdPde4DRXYYiT/GSSe3Gm/6nnMnz1zVsgl7bvM7cFYiaj1RcDmBb
         OCwGCg+8YGqfEx34o/ZwNq+0r0QEGVTgObWUcWO2K9sVgY/CHKDFUAFxuYoIBUZQi05n
         3RIKb4fN5WCN+IiwLlpE7ef7n3mw+K9Kelk1HmxHD6rUOguME7Z5MBINaELAAf2AEH4Y
         L4sA==
X-Gm-Message-State: AOAM531Voi6a/44lrT76IlL9cfRfCG7FqAYYe0M0zS+Mormm6BYmjDXO
        0wxKCgTkicRYsZiizAD2lL+/oyMqy/HiNg==
X-Google-Smtp-Source: ABdhPJzcNJwM7dusZc9oJTJbQAO67RbAqTwnkj1MThIBPbmuQFM8XaVd1ZL2CwiRCrkkMoXL6VejiA==
X-Received: by 2002:a05:6808:68d:: with SMTP id k13mr7548276oig.83.1628266725755;
        Fri, 06 Aug 2021 09:18:45 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id w5sm1626054ots.53.2021.08.06.09.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 09:18:45 -0700 (PDT)
Subject: Re: disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        abhinavk@codeaurora.org
References: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
 <3892649f-4748-b712-c28d-477e40aa8007@linaro.org>
 <30c5756d-790f-894b-d84b-8c4173e7fad5@kali.org>
 <8947d8ba-bed0-aadb-084e-e03029b6fe33@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <7b334e55-5632-5e58-6742-802bffdb8fef@kali.org>
Date:   Fri, 6 Aug 2021 11:18:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8947d8ba-bed0-aadb-084e-e03029b6fe33@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On 8/6/21 2:04 AM, Dmitry Baryshkov wrote:
> Hi Steev,
> Could you please check if the following kernel commits also show this
>>> behaviour:
>>>
>>> - 170b763597d3a0a79f135e4d83a38462c3964fdf
>>>
>>> - f4b43ac0b0af1d115effd08133046a694ac33dc2
>>>
>> Yes, I have both of those commits, and the issue still shows up.  This
>> is with 5.13.8 - additionally, I have a Lenovo Flex 5G which is running
>> a tree based on 5.14.0-rc2-next-20210721 and it shows a similar issue,
>> with the message being
>>
>> disp_cc_mdss_edp_pixel_clk_src: rcg didn't update its configuration.
>>
> Thus I have asked you to check if the issue shows up if you build one
> of the mentioned commits (they are between 5.12 and 5.13). We are
> trying to narrow down which of the changes broke your system.
>
Apologies for misunderstanding, I thought you meant make sure I had
those commits in my tree.  I have tried reverting both individually, as
well as both together and the issue still shows up.

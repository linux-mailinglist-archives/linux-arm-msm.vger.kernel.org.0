Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C77468221
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Dec 2021 04:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384141AbhLDDUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 22:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384139AbhLDDUP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 22:20:15 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4184AC061359
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 19:16:50 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso5882534ots.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Dec 2021 19:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=YmLyXgmtxlMO+L5DYAu6LZZ3Lz1Tih5zRqjYLEDPQpE=;
        b=mY26ZkDvw5nZ7tN1moPi2UpMRaI7wJaNa0C2/TzJ0u7h4Hl0RPvqZsSO1PCEd8fyfC
         jXChgp2m1scwNWIqh3qC+k3IinN/v6jdGcq5FVbdejVWfdUdRgbacX8L7bOG6r3mCBCn
         v2pV1618UPGa0w8BJ4CAY3RIe27Ypo1x1mL5x2StyrEWh8dA+/wLM2qWsauzJRBPceeF
         do8Lz8KM9xT8XlI6lxG/30+lKdMVZ2CVey0hWBVGvOYKNeI/GYuS9W8nWW1/Is6aMBdf
         MQ0Zl1ImQ32Y/4ndoxQRMyjWbP5fZarxp0o60GxmWgCo9IrxcWi2Avis3uKtH51rJFyT
         FW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=YmLyXgmtxlMO+L5DYAu6LZZ3Lz1Tih5zRqjYLEDPQpE=;
        b=0988zZUgvSa9sQrBicMrI+rwWe3Gg5DygIjWQDUCXXcKcL4YIZH5ok/ZcVlJ9Zgval
         zr8lqUVZgemcftHXdkacQ7zhE8ULffKfOIQEmeNz5qynY8wmqXrV7kfv+suLL3+dhrTY
         pckEnSO9NencorvfeFiPvJtvsLfhFSvOpTzB8VtpTF57Pl6Fy1kSUDyD+7OwqlZpEhsI
         HOOdHRakz2XcpYxEmUi2Krv38Gov90vA+PCdQz+0uEiLJqTG3WsmCKxTt2+5RoPPQFZb
         pNOP39eRFUUDvbqNBM2p97cs6F0Ryz9q1JrQWIXZPlLvv3GmqT8a6Z4oLxfsQWtSFkcr
         HbHA==
X-Gm-Message-State: AOAM532aMN0nVOKfILvd3eEa24C/BGk4z1uTH8B7dOe8RBOyhZ+smZAi
        G8ESKnnBoVl8nwOTZWdzcw3tWg==
X-Google-Smtp-Source: ABdhPJwjYwFZypL6KKboRlPe127KlLQjOWE+b/dda4B6oFxcNi0mgQEwYRXwPkU/7XQIPgPzVRQqRw==
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr19525756otn.128.1638587809540;
        Fri, 03 Dec 2021 19:16:49 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id d3sm977300otc.0.2021.12.03.19.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 19:16:49 -0800 (PST)
Message-ID: <1c366d77-49aa-07f3-4801-9374ad7e6016@kali.org>
Date:   Fri, 3 Dec 2021 21:16:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] clk: qcom: rcg2: Cache rate changes for parked RCGs
Content-Language: en-US
From:   Steev Klimaszewski <steev@kali.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Amit Nischal <anischal@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211203035601.3505780-1-bjorn.andersson@linaro.org>
 <9f9ad753-a97c-b11c-4b8b-5ddad0508e0e@kali.org>
In-Reply-To: <9f9ad753-a97c-b11c-4b8b-5ddad0508e0e@kali.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/3/21 6:39 PM, Steev Klimaszewski wrote:
>
> On 12/2/21 9:56 PM, Bjorn Andersson wrote:
>> As GDSCs are turned on and off some associated clocks are momentarily
>> enabled for house keeping purposes. Failure to enable these clocks seems
>> to have been silently ignored in the past, but starting in SM8350 this
>> failure will prevent the GDSC to turn on.
>>
>> At least on SM8350 this operation will enable the RCG per the
>> configuration in CFG_REG. This means that the current model where the
>> current configuration is written back to CF_REG immediately after
>> parking the RCG doesn't work.
>>
>> Instead, keep track of the currently requested rate of the clock and
>> upon enabling the clock reapply the configuration per the saved rate.
>>
>> Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source 
>> as needed")
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-rcg.h  |  2 ++
>>   drivers/clk/qcom/clk-rcg2.c | 32 +++++++++++++++++---------------
>>   2 files changed, 19 insertions(+), 15 deletions(-)
>>
>> <snip patch>
>
> With this applied, I'm getting
> <snip>

Actually turns out, I had a testing patch in from Dmitry that I'd never 
taken back out when it was decided it wasn't good enough. Apologies for 
the useless message.  This does not actually cause the issue, just the 
combination of them does.

Tested on the Lenovo Yoga C630

Tested-By: Steev Klimaszewski <steev@kali.org>


Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC31F3460F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 15:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhCWOGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 10:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhCWOF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 10:05:56 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5703C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 07:05:55 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id g20so11126083wmk.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FGQszURNN3ev57/k0mRYpKJWJ2DIvtGsVjnrCpq6R/0=;
        b=Auh2M8cDZeZqmtNX1r8y5EMKvIzWkBLxSE/9DBFuWMQ6I/QrWvKn8Gjnk5L8X0gwNX
         il3s9s65xwjeEq0BERAVDXGtxFI+N9YlRNLDn/MpwpYnAmiq3Krl/H1MQySHWSgyBQ5w
         EhBaKuKJ314mShYrfrPJaKR8YZQywrN5VBp1Zr1WnQxVQw1ooeAHa6WF1phZ3p3e7htV
         04JBMfmG1f9aSKY+OvuAE00NZgLyh5KERcyO3HhhAJUYZRF0PvPKAzrieitsc1lyBQVr
         73/PPs5uGdzMV1tkSitiKkYpR5RZjWe3QfmRi1WcLnDQD/xPALTeMdjINGN7cZb3SEmv
         PlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FGQszURNN3ev57/k0mRYpKJWJ2DIvtGsVjnrCpq6R/0=;
        b=lxVnA9CPwakAVTn5VhPwAvY2I1QmliLTIXlzrHaWaYx2v8rlN+cq7h2XkBMsOX22By
         SeMk/+7EPeI4DyULtlU76teL4OtBvoPebRR890RUwWYJx4ySjKEpx56MCfISmG6enZjN
         pFVMNI9Bfk98V3RlM+dgiLFvWTU8npX4kuJLyWPyB09CykgaBVrJqcPtnAblSN/vjT5n
         PGtX/bCq0m9g9OXeLBIwo1/tAcy1o44pltGi7Eri5pwrFRoa18Hs7EaiDRBC1jmC3L8g
         ipzaNPIrVCxyG8jyXvfVxCfsFTKxHTY7DhxkcSVmF1VQ9QDbbGcB5OOSSQGnIwaq9itD
         qA4Q==
X-Gm-Message-State: AOAM5307CeTiOZokKOzOvfRRRHpjCmJcvzJGwl0rwJnEofjBJFOsjwmE
        9nq58GXzSw5pZ7M8EuzK4E5gcw==
X-Google-Smtp-Source: ABdhPJzU0nJ1xvGRSbNly8oKfADTBlwc21dSGg8TMqshGY90kGQkW4LXPcVbhcD09Ru/R3xi5IKnZg==
X-Received: by 2002:a1c:e18b:: with SMTP id y133mr3583474wmg.22.1616508354572;
        Tue, 23 Mar 2021 07:05:54 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i16sm2299684wmq.3.2021.03.23.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 07:05:52 -0700 (PDT)
Subject: Re: [PATCH v2 00/25] media: venus: Enable 6xx support
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
 <d7f250f7-65dd-9dc5-7b6e-d304a879f5e7@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <d9424934-9594-33bb-e109-d727df03741c@linaro.org>
Date:   Tue, 23 Mar 2021 14:07:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d7f250f7-65dd-9dc5-7b6e-d304a879f5e7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2021 12:20, Stanimir Varbanov wrote:
> Hi Bryan,
> 
> Thanks for your work!
> 
> On 3/12/21 7:30 PM, Bryan O'Donoghue wrote:
>> V2:
>> - Adds Acked-by as indicated - Stan
>> - Fixes typo in patch #1 22000000 -> 220000000 - Stan
>> - Fixes setting of clk_set_rate in core_clks_enable
>>    unbreaks regression for 1xx/db410c - Stan
>> - "Add 6xx AXI halt logic"
>>    * Polled read removed - Stan
>>    * Redundant comments removed - Stan
>>    * Delay assocaited with LPI write removed entirely
>>      experimentation shows a delay is not required - Stan/Bryan
>> - Unifies intbuf_types_6xx_enc and intbuf_types_6xx_dec into
>>    intbuf_types_6xx
>>    Looking at the code the separate arrays was a NOP anyway - Stan/Bryan
>> - Ensures venus_helper_set_format_constraints() runs for 6xx only
>> - Differentiates stop address between 6xx and >= 4xx
>>    0xdeadb000 >= 4xx
>>    0x00000000 == 6xx - Stan
>>
>> With the fixes in place for db410c I've verified this code now on
>> sm8250/rb5 sdm845/rb3 and msm8916/db410c
> 
> You have my ack for all patches
> 
> Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> except 21/25 and 24/25 who have comments.
> 
>>
>> yaml: pending - acked waiting application
>> https://www.spinics.net/lists/devicetree/msg406892.html
> 
> I'll take this through media-tree once driver patchset is ready.
> 

Thanks Stan.

I'll get something re-posted this week after Connect.

---
bod

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDA03E23B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 09:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240863AbhHFHFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 03:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241273AbhHFHEx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 03:04:53 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A66C061798
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 00:04:37 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u3so16021968lff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Aug 2021 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rymKF/NnWpbcpoQUjrMp8mg4XD4Yif9iZA0sojeEitQ=;
        b=jIY7wRSAr4Mk8CJ3YcfMkv+glcC+0bTO75LD8Lf24e5I1JQaTFTJbOvgA/BRMwZUL9
         +a5z6vdzfGdmvMlbIhNU8VjS+srZdmGh+nX1631y64pso4jCBkIl+zgW6iCZtiIsaQEi
         stOuTPEvZGmWGG9Vk2aq15oa1rxnVA5U59KwozgVMrtzFSIPvhE60+7+I9otPtMTmUca
         G11o3oI7404KQyGFJHUxPFxCIbrUVZmiVoQ799L+oCUBKL8Gx0YhlXWoodufpcFHqntn
         6ThYPN3SoOnjYmT9ELPnJA+JbDldHsS8I6dtQ3QirwXItdjC3ApTF+cysVqyIxcA9n12
         U0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rymKF/NnWpbcpoQUjrMp8mg4XD4Yif9iZA0sojeEitQ=;
        b=UC9xrF379Nj3pjIKntDgdlmQohEfLiRs7jZvPuE0eL7jH7p1HVKpt/6b8cZgx2AON5
         KA88sivZIs352YkJlpP2ZFZIWDUJ7hvSnN8yu5uMWuld7wPbjoBqF/aJO/ugI0TxASou
         GrjX7NBtMiO3QsrxmJeF20Nolcme+xoGOMfRSpZJLNNh0yBkbHI30U8RK/wgYf0A2SDg
         kVe3/IbgKyxdvZWsgkJbzDHE7iFEbwBKbHUkc9Q6/Vbgdzs6/+mGNEMdjSPwsnO+7Ljw
         +Jk3RIQXQpaXV1VMEds7SnIDWQGUHZ/XYdhypfG5cZ1cDhNW1BtmKZAFbTTu2SIbUI3o
         +RSQ==
X-Gm-Message-State: AOAM532x6tHISDHU/GO68wnPODb0AkZrBjVFXKHD4MnYPklyIMcZhVL6
        aqRiH9xV5khNkTPvT8Bdnw8YdA==
X-Google-Smtp-Source: ABdhPJwIWTGrhBFBFgAWGdYauSCVZaV2u1ARoWC2qDsqjxZhPjG2WcHt2WXa3MyIyTMgJxX8CJt2HQ==
X-Received: by 2002:a05:6512:a8d:: with SMTP id m13mr6807615lfu.544.1628233475532;
        Fri, 06 Aug 2021 00:04:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c13sm747049lfm.208.2021.08.06.00.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 00:04:35 -0700 (PDT)
Subject: Re: disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration
To:     Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        abhinavk@codeaurora.org
References: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
 <3892649f-4748-b712-c28d-477e40aa8007@linaro.org>
 <30c5756d-790f-894b-d84b-8c4173e7fad5@kali.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <8947d8ba-bed0-aadb-084e-e03029b6fe33@linaro.org>
Date:   Fri, 6 Aug 2021 10:04:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <30c5756d-790f-894b-d84b-8c4173e7fad5@kali.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steev,

On 06/08/2021 06:31, Steev Klimaszewski wrote:
> 
> On 8/5/21 11:50 AM, Dmitry Baryshkov wrote:
> Hi,
>> Hi,
>>
>> On 23/07/2021 20:43, Steev Klimaszewski wrote:
>>> Hi,
>>>
>>>
>>> As of 5.13 kernels, I've been seeing the following output in my dmesg -
>>>
>>> Jul 22 21:41:37 limitless kernel: [    5.676335] ------------[ cut
>>> here ]------------
>>> Jul 22 21:41:37 limitless kernel: [    5.676337]
>>> disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
>>
>> Just wanted to check if you still have this issue?
>>
>> Could you please check if the following kernel commits also show this
>> behaviour:
>>
>> - 170b763597d3a0a79f135e4d83a38462c3964fdf
>>
>> - f4b43ac0b0af1d115effd08133046a694ac33dc2
>>
> Yes, I have both of those commits, and the issue still shows up.  This
> is with 5.13.8 - additionally, I have a Lenovo Flex 5G which is running
> a tree based on 5.14.0-rc2-next-20210721 and it shows a similar issue,
> with the message being
> 
> disp_cc_mdss_edp_pixel_clk_src: rcg didn't update its configuration.
> 
> I wasn't able to test a newer version of a next tree as it would spit me
> into a busybox shell and the display didn't come up properly enough to
> view it.
> 
> I have a 5.12 kernel and the issue doesn't show up at all, it started
> with 5.13.

Thus I have asked you to check if the issue shows up if you build one of 
the mentioned commits (they are between 5.12 and 5.13). We are trying to 
narrow down which of the changes broke your system.

-- 
With best wishes
Dmitry

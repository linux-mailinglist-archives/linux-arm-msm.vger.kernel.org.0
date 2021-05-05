Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C87374B9C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 01:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhEEXBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 19:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhEEXBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 19:01:34 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5118C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 16:00:37 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id jm10so2167466qvb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 16:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/l1NHZWpnnb1oM5FmH4ACLg0nnosxzW/bCk3+E+1Wsk=;
        b=KjEaX8UjqtoV4BWI2sW0jFGAlY8VfgEMfivVB/hTpMwg7i/uY3N+QYeIcNKVussk0M
         aZ5AxpLWfJ+edPvjdbYRL4ovUN8XTKc+vrzo3s2DC0Km4h3fKWCLzq/3OHDx3nQqqauj
         rzSTXzLDj1LE0YxibqZZ4rIkbvk4bqWXU/fkzh2GltlNMZCKDCTOwAXRHV5Vuz/zlF0X
         FLmJC1q1hnu6205vTRxwRbvCjBZq0lpNuAYptWm0Ix4LWKJh+hlGrUsV9gigxrdD7U0M
         bddav17MI2IrrBEJK/am6eSIyE1DNV/Ie3FR5dGsXoD7kN+MpczUMNz8aEXIUH70mmUG
         CcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/l1NHZWpnnb1oM5FmH4ACLg0nnosxzW/bCk3+E+1Wsk=;
        b=QLZQCnau0azeQXba9kr71YYZtTvYapZv1/zbLrnJdTn3ViMr9DsbT02D5s8G8KS6z/
         DjRCR3lqXgYqpQibYrS0MMyzZudY6sQhbN8igNpsUMQ6nXDrir8ArFLZEbZWIubpFZZ+
         qXceh4SyOkuYtnEssh+voDm/o1p+xIVmt9CZIZu4eulB4TUfWhEoyeLiV3BKsGA/lew6
         XmmGip9Eo6Gpdgxd8ib9i8x2EKYfnNKxL3Rua5PjuVxCWVESLkXnQbwPujq7zOEtv40U
         hsLVVjE2VNmo00MdQWrHOZs8IV+1gRe2K0D7r0V+SfwRq+D7Dj39kbR+95iW0Zyw6FMm
         rhsQ==
X-Gm-Message-State: AOAM530wQjkuDZ/Doc7EtGHvr1uB4HVkD6jZdnh5KqtHnKiKtk+EIHw6
        hf77ICoPHLTh8PLCc6y0RXok0FdM9OfdMmGY
X-Google-Smtp-Source: ABdhPJxns5jy4Vyfex+ZvHz8ZMr24XdAaVLeobaxhMJY4w6woowacxdPvACRk2aCmn3VILSQU48anw==
X-Received: by 2002:ad4:5c63:: with SMTP id i3mr1134865qvh.36.1620255635179;
        Wed, 05 May 2021 16:00:35 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id d84sm661783qke.131.2021.05.05.16.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 16:00:34 -0700 (PDT)
Subject: Re: [Patch v4 0/7] Add support for AEAD algorithms in Qualcomm Crypto
 Engine driver
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     davem@davemloft.net, bjorn.andersson@linaro.org,
        ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
 <48d51bb5-a107-4756-4767-f62131d28505@linaro.org>
 <20210505225839.uy6zlj3gtp77uuqk@gondor.apana.org.au>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <b56e7025-eb83-0512-d5d5-5086eb8f3f6f@linaro.org>
Date:   Wed, 5 May 2021 19:00:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210505225839.uy6zlj3gtp77uuqk@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/5/21 6:58 PM, Herbert Xu wrote:
> On Wed, May 05, 2021 at 06:54:18PM -0400, Thara Gopinath wrote:
>>
>>
>> On 4/29/21 11:07 AM, Thara Gopinath wrote:
>>> Enable support for AEAD algorithms in Qualcomm CE driver.  The first three
>>> patches in this series are cleanups and add a few missing pieces required
>>> to add support for AEAD algorithms.  Patch 4 introduces supported AEAD
>>> transformations on Qualcomm CE.  Patches 5 and 6 implements the h/w
>>> infrastructure needed to enable and run the AEAD transformations on
>>> Qualcomm CE.  Patch 7 adds support to queue fallback algorithms in case of
>>> unsupported special inputs.
>>>
>>> This patch series has been tested with in kernel crypto testing module
>>> tcrypt.ko with fuzz tests enabled as well.
>>
>> Hi Herbert,
>>
>> I have fixed all the review comments on this series and fuzz tests pass as
>> well. Do you think this can be merged ?
> 
> We're still in the merge window, no new features are accepted
> at this point.  Please be patient.

Ok, thanks!

> 
> Thanks,
> 

-- 
Warm Regards
Thara

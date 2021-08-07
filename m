Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835C83E35C7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Aug 2021 16:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhHGOE0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Aug 2021 10:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbhHGOEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Aug 2021 10:04:23 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89549C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Aug 2021 07:04:05 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id w6so16642309oiv.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Aug 2021 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RFiPqimL7iWIcVyXsOh4zO7Sdg3GbKEKKWSuzwDE35c=;
        b=IHIa2oou2h/M5o2s5U20yLVMuq4EQXeO4H3ldOlgHdLeYe3/3KSxnjx0hhL8IOH1Tf
         HkJd3ZVtl7fbygKmrylLfvLejK4KZiYtlZ72VqAED1yvV3tmevkpDuJnol4Fp8/A5Ved
         Gv6lohvRwO/+6GbJP6hYPXoPiXCCzJB0Y1/5FnxZcDZHLu3isEJQ7AVj3Nn7lU17ROo3
         v18T6QbJ2wZm7qhEktWU40LjTpRU9qOmAyGDgGXjv4AbjpQBrOo9HUOjSkKsa8zOStfo
         bUp6PsJZpLyHbJCI78M/fPgUGZQ211wZlXc99XjIedF7TCp0OeIY0wPmgWqFMwdvC6Io
         x4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RFiPqimL7iWIcVyXsOh4zO7Sdg3GbKEKKWSuzwDE35c=;
        b=EsUGYevSrmsIqGZmkpa16LNAhgQG2tm7dIDKBeoGCCgOZFZrTvhwuFg89Qe3hoYmLq
         5Ir6xho3dKTLny3QwqkCUk0J53e78f/epcG1JitWX66cwHkkx5+JnsS0mVbtfpAYOkkl
         0uP0o2UVHJBlsm2ueaH6uoc7BE1rvqVYPiIUuDok0vnBs/76JaWa4+R/7B0K5iEHhrLQ
         iIFN+faCgfhb6aNDPYuqewFUI0VLY3DLorB8AO917jx7C1mdmGLfgWDC7En7YX1NNa3d
         mjWVkztwwMM2pLvWl88YkB90ZCheLe7i+Anhow+2TNcg3lkmQK//u7R+rSe3//9IJZaP
         mBww==
X-Gm-Message-State: AOAM533+nH6Czf3dFWI0mFSLh/X3vHXrCFNxJI4JeuPH25ZuNMnVw2Ix
        IHIVcX9a2r+y82z+qbM/BOSRfg==
X-Google-Smtp-Source: ABdhPJzXgJO5BniZcdFBLp10Tc8l5GQ6yvRz46jun0A0lwufIQdc9E63c+UKZ2I7qnAHvqcLyLu2hg==
X-Received: by 2002:aca:c416:: with SMTP id u22mr3934574oif.71.1628345044901;
        Sat, 07 Aug 2021 07:04:04 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id h60sm678112oth.76.2021.08.07.07.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Aug 2021 07:04:04 -0700 (PDT)
Subject: Re: disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
References: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
 <3892649f-4748-b712-c28d-477e40aa8007@linaro.org>
 <30c5756d-790f-894b-d84b-8c4173e7fad5@kali.org>
 <8947d8ba-bed0-aadb-084e-e03029b6fe33@linaro.org>
 <7b334e55-5632-5e58-6742-802bffdb8fef@kali.org>
 <CAA8EJppTtEn+HuJuMj7jUGs5KDq4H3Xv--ML4uRVxe94XP5PEA@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <c8481c70-9b26-92ec-80f6-9d7655013346@kali.org>
Date:   Sat, 7 Aug 2021 09:04:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJppTtEn+HuJuMj7jUGs5KDq4H3Xv--ML4uRVxe94XP5PEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/6/21 11:47 AM, Dmitry Baryshkov wrote:
> On Fri, 6 Aug 2021 at 19:18, Steev Klimaszewski <steev@kali.org> wrote:
>> Hi Dmitry,
>>
>> On 8/6/21 2:04 AM, Dmitry Baryshkov wrote:
>>> Hi Steev,
>>> Could you please check if the following kernel commits also show this
>>>>> behaviour:
>>>>>
>>>>> - 170b763597d3a0a79f135e4d83a38462c3964fdf
>>>>>
>>>>> - f4b43ac0b0af1d115effd08133046a694ac33dc2
>>>>>
>>>> Yes, I have both of those commits, and the issue still shows up.  This
>>>> is with 5.13.8 - additionally, I have a Lenovo Flex 5G which is running
>>>> a tree based on 5.14.0-rc2-next-20210721 and it shows a similar issue,
>>>> with the message being
>>>>
>>>> disp_cc_mdss_edp_pixel_clk_src: rcg didn't update its configuration.
>>>>
>>> Thus I have asked you to check if the issue shows up if you build one
>>> of the mentioned commits (they are between 5.12 and 5.13). We are
>>> trying to narrow down which of the changes broke your system.
>>>
>> Apologies for misunderstanding, I thought you meant make sure I had
>> those commits in my tree.  I have tried reverting both individually, as
>> well as both together and the issue still shows up.
> Uhm. Could you please just checkout (note, checkout, not revert) each
> of those commits, build the kernel and try the resulting kernel?
>
> Two additional commits to try (checkout, build, try):
>
> - c68da22dc9cc39ced8fc30b65fca5ce2f9583735
>
> - b2150cab9a97c1fcc15684200a6020b6d231106d
>
> Also just to be sure, could you please also build the v5.13-rc1 and
> try running that kernel?
>
> So in the end I'm asking you to try 5 kernel builds.

So, doing it correctly...

170b763597d3a0a79f135e4d83a38462c3964fdf 

- does not show the error 


f4b43ac0b0af1d115effd08133046a694ac33dc2 

- does not show the error, there is some dpu_runtime_resume spam though


c68da22dc9cc39ced8fc30b65fca5ce2f9583735

- does not show the error


b2150cab9a97c1fcc15684200a6020b6d231106d

- does not show the error


v5.13-rc1

- shows the message



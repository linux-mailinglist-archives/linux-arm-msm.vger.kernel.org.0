Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6073E2F3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 20:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242905AbhHFSY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 14:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242870AbhHFSY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 14:24:56 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DBCC061799
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Aug 2021 11:24:39 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id f20-20020a9d6c140000b02904bb9756274cso9915711otq.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Aug 2021 11:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BIGIcPlIeaE0SThFbEeerqemMrj65dYRWTJCVJhF4yo=;
        b=DDx8dp2V5qXj6i+0JlOs6OmhY1Ua80Sh2NcN3a++q6yT+TxYulaPAwVFNpl/6zmA1R
         XzBfjl/oipFFg8ZikWdyqh4fI5J+LFzSLEqfjWWHud3ps6q8+ThufI99NokK9VCrbiEz
         YHqzKtgrrwOsfvwTHefuiV0c6JU/AgpTerOUAIHtG4IBVTAAMDUbiZ9AL4BlXW9Un4B2
         eMDXaarkX4Fdmsni+JkAFroQgMSe4rD8OkF1XipdFsQDX3XPRbuDl4AvfArmqZAsATc2
         CaL3wHwradChmKchv+Rx743p9gxq3nj2f1RaSwFm4ln7KDLQ0gNa1sffMGG5AV3PkgDG
         6ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BIGIcPlIeaE0SThFbEeerqemMrj65dYRWTJCVJhF4yo=;
        b=srUag/AqulXrg91/urj1okOiM0g41msh2M+Z/j0I9pTH46xcYmkULcSyiZQ6zmxPYI
         nn7sGQGwnx/kq4Rm4QzEzPHNSbAo9ln50BmNj3Up1UjuqzLrw/jjW27iXkJS9RNg8US4
         aGGAaciLFCN0xU/RKD3dX8Cewzrq94pJf31Ddzp8WQc0+OTncE23LqkPkA6ON5Onu/iJ
         1nVGCDQwPd1a0K/XDORTEr+5BWQMH1/Fb9rFx/AYXBCIefyFgiReOrOjENwadOW0tbvM
         q+FRv/mfmUJ19elU3rv9/QuyNNZ946KAQresc8X1ZwGdhJ4GXoNt3n7KB0kX9NhvsA7w
         JMaQ==
X-Gm-Message-State: AOAM531YYSyLqfJeds7c6aKB+02KrFbXzJQ/YEVaYREDN+Kyj0hYNfe+
        cVkFJNZ6o23/MF1t8pAyPtzbQA==
X-Google-Smtp-Source: ABdhPJxUIBx9Jj8X5BK0eS89AxvYVNgpBf1fuWZWaUzWOZ/cjZFUo5G8EXIXQ8Lil12VvXTYVyoyhQ==
X-Received: by 2002:a9d:3bc3:: with SMTP id k61mr8342925otc.355.1628274278516;
        Fri, 06 Aug 2021 11:24:38 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id p2sm1813144oip.35.2021.08.06.11.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 11:24:38 -0700 (PDT)
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
Message-ID: <4fda301e-7965-7122-92dc-9cffc91270fa@kali.org>
Date:   Fri, 6 Aug 2021 13:24:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJppTtEn+HuJuMj7jUGs5KDq4H3Xv--ML4uRVxe94XP5PEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Oh!  My apologies, now I understand what you want, and I can definitely
run those tests.  Thank you for the instructions :)

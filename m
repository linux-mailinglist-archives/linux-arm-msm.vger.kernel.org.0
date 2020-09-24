Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D511A276574
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 02:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgIXA4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 20:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgIXA43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 20:56:29 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0192C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 17:56:29 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id d20so1689975qka.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 17:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4m4w+Ywq7BaCVSVWBYAbvGB8+AqmqBDmtowl+8MplpM=;
        b=gP6k2LuQqHYL3LJIMbEuX3uzH0S3s6FMSUtihtfRAolAmLVudW0oJC4sXKs/jh0OoK
         QfASk2ZwwETwgqRC2pPPvOFs9Tg+AFO3IlgszTjepDZkvY2GfapLMHU24Pj1WZWFHDil
         xY6dYYe3ZE2fbJ7l3S2fyG3x/Sdn+Dc4+rA2e9YrB0F9zmpZoqSH6ydKfWgnOY8H3Yaz
         OQOBb+QmI077pGw6AanTWw1UUHzApXD0pRBhqNObFAcrmNw31JaqpGCOV/TLdn/C5rcB
         gx+oAuGK59j/veHq2QSbL6KQsVk4k5gInLw3F3wJOog0fcl+i7d0dCdM1UpY3Y0/HMQB
         sLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4m4w+Ywq7BaCVSVWBYAbvGB8+AqmqBDmtowl+8MplpM=;
        b=AT31oHXPMTlrHxmVmJ4aYwEkhusaKX12b6wJWTUJxhBciSZ3UI7mhLCgIMoXGsQXce
         YKkNesS0yVW+lBAGW0E6AqFh92un9jqzH957w1F/7GztvOQlmvfuG01MTX6R8zjdQzyQ
         EgeOLD4RoNMz3PWgl+b8WZl3TsEyFm+e0/mUBiBP8+u5GUFz8fRalBP4GOg9ZgksaBqh
         6HmPTuUPf6eDo8KVH8ji3Ehm294QCpzFVpKKsrsFLiWVJ+YtKpTMpvImqbDJpH2mVDwh
         l3BvhwYkbI73PML1BppgLX8drMbFrAfje/Cg30+S+gu6L84J6xiKXZDd+p5ugk1t4IIi
         xz+g==
X-Gm-Message-State: AOAM531e39gfsduckmhNaA/e/5KC2FzAlmr7brBapnttr6UqAQjc+Q6M
        0+KUVC8EUOg/zoeFR4LVfdCzmA==
X-Google-Smtp-Source: ABdhPJxWKoryUyrPE2o58ZX+HOKq4A+VggQTBi1+/RDEpKIZntnYAdXUiWef1AsEUtBG9B/yIKDnBw==
X-Received: by 2002:a05:620a:40d0:: with SMTP id g16mr2551371qko.282.1600908988803;
        Wed, 23 Sep 2020 17:56:28 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id w44sm1147494qth.9.2020.09.23.17.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 17:56:28 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] clk: qcom: add video clock controller driver for
 SM8250
To:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20200904030958.13325-1-jonathan@marek.ca>
 <20200904030958.13325-6-jonathan@marek.ca>
 <160080040123.310579.8471841951357841843@swboyd.mtv.corp.google.com>
 <0ce9fdb6-e224-ced7-ec32-fe67b2ca6127@marek.ca>
 <160090383364.310579.1979253418505275623@swboyd.mtv.corp.google.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <d7207c1c-c4e4-f994-cacb-bdfb7952732b@marek.ca>
Date:   Wed, 23 Sep 2020 20:54:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <160090383364.310579.1979253418505275623@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/23/20 7:30 PM, Stephen Boyd wrote:
> Quoting Jonathan Marek (2020-09-23 09:07:16)
>> On 9/22/20 2:46 PM, Stephen Boyd wrote:
>>> Quoting Jonathan Marek (2020-09-03 20:09:54)
>>>
>>>> +                       .ops = &clk_branch2_ops,
>>>> +               },
>>>> +       },
>>>> +};
>>>> +
>>>> +static struct clk_branch video_cc_mvs0_clk = {
>>>> +       .halt_reg = 0xd34,
>>>> +       .halt_check = BRANCH_HALT_SKIP, /* TODO: hw gated ? */
>>>
>>> Is this resolved?
>>>
>>
>> Downstream has this clock as BRANCH_HALT_VOTED, but with the upstream
>> venus driver (with patches to enable sm8250), that results in a
>> "video_cc_mvs0_clk status stuck at 'off" error. AFAIK venus
>> enables/disables this clock on its own (venus still works without
>> touching this clock), but I didn't want to remove this in case it might
>> be needed. I removed these clocks in the v3 I just sent.
>>
> 
> Hmm. Does downstream use these clks? There have been some clk stuck
> problems with venus recently that were attributed to improperly enabling
> clks before enabling interconnects and power domains. Maybe it's the
> same problem.
> 

Yes, downstream uses these clks.

The "stuck" problem still happens if GSDCS/interconnects are always on, 
and like I mentioned, venus works even with these clocks completely 
removed.

I think venus controls these clocks (and downstream just happens to try 
enabling it at a point where venus has already enabled it?). I'm not too 
sure about this, it might have something to do with the GDSC having the 
HW_CTRL flag too..

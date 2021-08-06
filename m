Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6613E3E2236
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 05:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbhHFDhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 23:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbhHFDhX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 23:37:23 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9186AC061798
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 20:37:07 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id u25so10294694oiv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 20:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sEXmiwYq53Y1HjEXgEeAZ259q+n9FszyQlWien/EeGk=;
        b=LkJPD56Ltd0iFCOGqko//11VwW4jy3peFprVLEPTTJavpWlXUH49yDeCaspkCPXa0n
         tKZFY8eEnw9c0Hb2dy6o6f8gstuFJ3f+fvCptM9/iYTiOD5EOlKJwQncPIU7SB2uAyS7
         KRVzBLGjcs0Nue2QZdu2QaACanRNw6XysA4MJtqcYjfpOVKMX6m517RSP/ZQb7cpL1j7
         go7nH4w334AiHOmW5xUPNpkElzfC04JcvbC8ts10fEkr8pS5miUW747Nj6OHAJ1lDJ+b
         1NXDsJYVEI0ZuZOhcMaAck5ztiZgrQLfPXczN23nNV3hguM7kgn7p2eK1AYH8L2XFYiX
         EfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sEXmiwYq53Y1HjEXgEeAZ259q+n9FszyQlWien/EeGk=;
        b=p3rivKGaxcJodmJvl2Mwik1iekIutg1PEGGMe2e7z48wZ2AfQta0maagALsZfbASn6
         dXzWUBC+xBUQRvaPd4uKSsprl8T9TScab1I3O1cGnQ1IN7Ddx8MhEb2WfdEFnW2iqWdi
         Pshr+Hw28iDOK7OBiLPAiBgs6ly8pP6sRA7v26s/U/Fx1G/lZQB28X+Tf4bNbAHiySjW
         H1sykrBFmMG32mMksq/XEl6jVhC7e58pezjL0O2Apmjnrx/Oi5m6eqsv4fQJZ4QVqTaU
         Qu3rVV9dIpWHMbmrzFg1WeuYC4+Ru4Z09TzXnUa4eFfDAbGaTNdmPEr2tD+4osFTckRe
         oBBw==
X-Gm-Message-State: AOAM53377asx8ySEfOXrLcrHBZ9X24SAgvIucU/VTD0zm4wuGnUP1hrY
        dG/45fIjo4Z3k8OBecyZBJRetoHsaWYx6A==
X-Google-Smtp-Source: ABdhPJyjvThr90CU9keRzKYHVvrd25VJa9zqyIN9Co0x5nbvPT9nn12kFYc7LF/FOQdFw3KkOUxleg==
X-Received: by 2002:a54:4803:: with SMTP id j3mr12224248oij.133.1628220697090;
        Thu, 05 Aug 2021 20:31:37 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id f23sm1192556oou.5.2021.08.05.20.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 20:31:36 -0700 (PDT)
Subject: Re: disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        abhinavk@codeaurora.org
References: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
 <3892649f-4748-b712-c28d-477e40aa8007@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
Message-ID: <30c5756d-790f-894b-d84b-8c4173e7fad5@kali.org>
Date:   Thu, 5 Aug 2021 22:31:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3892649f-4748-b712-c28d-477e40aa8007@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 8/5/21 11:50 AM, Dmitry Baryshkov wrote:
Hi,
> Hi,
>
> On 23/07/2021 20:43, Steev Klimaszewski wrote:
>> Hi,
>>
>>
>> As of 5.13 kernels, I've been seeing the following output in my dmesg -
>>
>> Jul 22 21:41:37 limitless kernel: [    5.676335] ------------[ cut
>> here ]------------
>> Jul 22 21:41:37 limitless kernel: [    5.676337]
>> disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
>
> Just wanted to check if you still have this issue?
>
> Could you please check if the following kernel commits also show this
> behaviour:
>
> - 170b763597d3a0a79f135e4d83a38462c3964fdf
>
> - f4b43ac0b0af1d115effd08133046a694ac33dc2
>
Yes, I have both of those commits, and the issue still shows up.  This
is with 5.13.8 - additionally, I have a Lenovo Flex 5G which is running
a tree based on 5.14.0-rc2-next-20210721 and it shows a similar issue,
with the message being

disp_cc_mdss_edp_pixel_clk_src: rcg didn't update its configuration.

I wasn't able to test a newer version of a next tree as it would spit me
into a busybox shell and the display didn't come up properly enough to
view it.

I have a 5.12 kernel and the issue doesn't show up at all, it started
with 5.13.

-- steev


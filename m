Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5C910129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 22:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfD3Uwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Apr 2019 16:52:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40608 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfD3Uwn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Apr 2019 16:52:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5D2B96086B; Tue, 30 Apr 2019 20:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556657562;
        bh=ggeviOtdBH4/GOHpOq3caG1b2ST1eJy4nFGiOudL/4Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EftjXGkxkBH2PtuwGWYcGpcgRVxADRG0cz3ZHqVazACJgV/60007FHaTCDrhKhLpo
         Kl+c2B0BsaYgJsBEbXokvr+Hmr9I1Y9QKRYkmC1jRBLo3rFK3YPdsUmIH0RDaXFKWz
         jLK92W/EteQo8EOX9fwFbRfn//RcUsPSZ/Xj8F9A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 855BB602DC;
        Tue, 30 Apr 2019 20:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556657561;
        bh=ggeviOtdBH4/GOHpOq3caG1b2ST1eJy4nFGiOudL/4Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DpFnD4yLwZm8KxnStREaRY+CNwUKY70c2YjKEj1xhOJ3f3oeh8tEMuOU1y/8w9fSk
         KHGyRM13bLymITp9IgL++H+NSeXkXxx2C/Q92qCK1REGwfUhqICin6WdhvC+Wm+inv
         BMKYT6c50OzNWL0MvrCt1zhHJfI7ofvf3zpXLT7c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 855BB602DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v1] clk: Probe defer clk_get() on orphans
To:     Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc:     bjorn.andersson@linaro.org, georgi.djakov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1549911467-2465-1-git-send-email-jhugo@codeaurora.org>
 <155598074927.15276.327474594450313045@swboyd.mtv.corp.google.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <db550aa0-ed92-8e25-10bf-06a78d771048@codeaurora.org>
Date:   Tue, 30 Apr 2019 14:52:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <155598074927.15276.327474594450313045@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/22/2019 6:52 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-02-11 10:57:47)
>> If a parent to a clock comes from outside that clock's provider, the parent
>> may not be present at the time the clock is registered (ie the parent comes
>> from another driver that has not yet probed).  The clock can still be
>> registered, and a reference to it obtained, however that clock may not be
>> fully functional - ie get_rate might return an invalid value.
>>
>> This has been a problem that has resulted in the UART console breaking on
>> some Qualcomm SoCs, as the UART baud rate is based on a clock that is the
>> child of XO.  Due to the large chain of dependencies, its possible that the
>> RPM has not provided XO by the time that the UART driver probes, gets the
>> baud rate clock, and calls get_rate - which returns 0 and results in a bad
>> configuration.
>>
>> An orphan clock is a clock that is missing a parent or some other ancestor.
>> Since the parent is defined, we can assume that it is expected to appear at
>> some point in a properly configured system (all bets are off if a required
>> driver is not compiled, etc), and it is unlikely that the clock can be
>> properly consumed during the time the clock is an orphan.  Therefore,
>> return EPROBE_DEFER for orphan clocks so that consumers wait until the
>> parent chain is established, and proper clock operation can occur.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>
>> This is based upon the "Rewrite clk parent handling" series at [1], and assumes
>> that the suspected missing line commented on at [2] is added.
>>
>> The idea for this solution came from [3] and [4].
>>
>> [1] https://lore.kernel.org/lkml/20190129061021.94775-1-sboyd@kernel.org/T/#u
>> [2] https://lkml.org/lkml/2019/2/11/1634
>> [3] https://lkml.org/lkml/2019/2/6/382
>> [4] https://lkml.org/lkml/2015/12/27/209
> 
> There have been multiple attempts over the years to support probe defer
> for clks that don't have parents. If you search the kernel mailing list
> archives I'm sure you'll come across them (for example
> https://patchwork.kernel.org/patch/6313051/). That's why we have the
> first part of the code to indicate if a clk is an orphan or not, i.e.
> commit e6500344edbb ("clk: track the orphan status of clocks and their
> children"), but not this patch that you've sent.
> 
> There are a couple requirements that we need to make sure we don't break
> first.
> 
>   1. clk_get() should work for clks on the orphan list if that clk is
>   parented to something that will never be registered with the framework
> 
>   2. We need a way for drivers to express that the parent of a clk
>   won't exist
> 
>   3. Critical clks need to turn clks on even if they'll never get
>   parents registered
> 
> We've had problems in the past
> (http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/343007.html)
> where bootloaders configure clks in certain ways that the kernel doesn't
> care to even consider as possible. In these cases we either need to let
> clk_set_rate() reparent them when consumers are ready or we need to
> convert drivers that are forcing on clks early to use the
> CLK_IS_CRITICAL flag to turn on clks even if they're never going to find
> their parents.
> 
> Last time we tried to do this in 2015 (wow so many years ago!) we were
> blocked on not having the critical clks infrastructure and the legacy
> sunxi clk driver needed to convert to DT and critical clks flag to keep
> working. I think we could have done it a year or two ago, because sunxi
> moved to a new design, but then we got more use-cases where clks may
> never get the parent they're currently configured for in the bootloader
> and then the kernel would never hand out the clk to consumers and the
> clk_set_rate() case would fail.
> 
> To fix that last part, I'm proposing we introduce the .get_parent_hw()
> op and then rely on drivers to tell the framework that the parent is
> there either with a direct pointer reference or by knowing that the
> DT/firmware is telling us the parent is valid. If we just rely on string
> names and a u8 to indicate parents then we don't have enough information
> to figure out how the parent is provided and if it will ever appear at
> some point in the future. Once we have a way to describe this through
> DT/firmware then we're able to indicate the clk is an orphan when that's
> actually the case vs. when the clk is configured in hardware for
> something that we won't know about. You can see this work in the
> clk-parent-rewrite series in clk.git.
> 
> There's also one more problem, which is what we do with clks that we've
> handed out to consumers and then the driver for the parent of that clk
> is removed and the parent is unregistered. Right now, we move these clks
> to the orphan list and set the clk_nodrv_ops on the parent that's
> unregistered. We probably need to set clk_nodrv_ops on all the children
> that get orphaned, and remove the cached clk_core pointer in all the
> clk_core::parents members (even ones that aren't currently using it!),
> and stash away the original clk_ops so we can restore them later when
> the clk is properly reparented if the parent comes back. It's a lot of
> book keeping to remove the dangling references and let it come back
> later. I haven't started on this part, but it's on my radar.
> 

Ugh.  Ok.  Much more work to be done.  I guess we live with the fake XO 
in GCC hack for a while yet then.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 998F214CE0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 17:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgA2QNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 11:13:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:37306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726679AbgA2QNq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 11:13:46 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7BB32070E;
        Wed, 29 Jan 2020 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580314426;
        bh=e1Wn9NnIjMDIS6BdQ81ViUrFBu9BQanXV+r3mteDX/8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NDoLZjcmTgTmmUvwERtMDcO6tlEHh3Q96S5jpo96owMURxgnSb9sBIeTNQPAGKcHp
         cE+e+lfn02eON+YzD4l3aiAm9xF6mEaBfMtZRHuJc8Dcam+do9KbQWv8q8T5EnlvSV
         qZ8ZLXHEB8aAb5Urm61xCkyDmLnJNpzsG8g8fJLI=
Date:   Wed, 29 Jan 2020 16:13:41 +0000
From:   Will Deacon <will@kernel.org>
To:     Srinivas Ramana <sramana@codeaurora.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>, maz@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Set SSBS for user threads while creation
Message-ID: <20200129161341.GA32275@willie-the-truck>
References: <1577106146-8999-1-git-send-email-sramana@codeaurora.org>
 <20200102180145.GE27940@arrakis.emea.arm.com>
 <0c5cd234-5cfb-d093-06e4-a0edb5c68bf8@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c5cd234-5cfb-d093-06e4-a0edb5c68bf8@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 05:18:53PM +0530, Srinivas Ramana wrote:
> On 1/2/2020 11:31 PM, Catalin Marinas wrote:
> > On Mon, Dec 23, 2019 at 06:32:26PM +0530, Srinivas Ramana wrote:
> > > Current SSBS implementation takes care of setting the
> > > SSBS bit in start_thread() for user threads. While this works
> > > for tasks launched with fork/clone followed by execve, for cases
> > > where userspace would just call fork (eg, Java applications) this
> > > leaves the SSBS bit unset. This results in performance
> > > regression for such tasks.
> > > 
> > > It is understood that commit cbdf8a189a66 ("arm64: Force SSBS
> > > on context switch") masks this issue, but that was done for a
> > > different reason where heterogeneous CPUs(both SSBS supported
> > > and unsupported) are present. It is appropriate to take care
> > > of the SSBS bit for all threads while creation itself.
> > > 
> > > Fixes: 8f04e8e6e29c ("arm64: ssbd: Add support for PSTATE.SSBS rather than trapping to EL3")
> > > Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
> > 
> > I suppose the parent process cleared SSBS explicitly. Isn't the child
> 
> Actually we observe that parent(in case of android, zygote that launches the
> app) does have SSBS bit set. However child doesn't have the bit set.

On which SoC? Your commit message talks about heterogeneous systems (wrt
SSBS) as though they don't apply in your case. Could you provide us with
a reproducer?

> > after fork() supposed to be nearly identical to the parent? If we did as
> > you suggest, someone else might complain that SSBS has been set in the
> > child after fork().
> 
> I am also wondering why would a userspace process clear SSBS bit loosing the
> performance benefit.

I guess it could happen during sigreturn if the signal handler wasn't
careful about preserving bits in pstate, although it doesn't feel like
something you'd regularly run into.

But hang on a sec -- it looks like the context switch logic in
cbdf8a189a66 actually does the wrong thing for systems where all of the
CPUs implement SSBS. I don't think it explains the behaviour you're seeing,
but I do think it could end up in situations where SSBS is unexpectedly
*set*.

Diff below.

Will

--->8

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index bbb0f0c145f6..e38284c9fb7b 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -466,6 +466,13 @@ static void ssbs_thread_switch(struct task_struct *next)
 	if (unlikely(next->flags & PF_KTHREAD))
 		return;
 
+	/*
+	 * If all CPUs implement the SSBS instructions, then we just
+	 * need to context-switch the PSTATE field.
+	 */
+	if (cpu_have_feature(cpu_feature(SSBS)))
+		return;
+
 	/* If the mitigation is enabled, then we leave SSBS clear. */
 	if ((arm64_get_ssbd_state() == ARM64_SSBD_FORCE_ENABLE) ||
 	    test_tsk_thread_flag(next, TIF_SSBD))

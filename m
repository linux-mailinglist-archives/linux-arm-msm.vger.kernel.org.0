Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7511812E9A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 19:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgABSBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 13:01:49 -0500
Received: from foss.arm.com ([217.140.110.172]:49046 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727890AbgABSBt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 13:01:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0DBB328;
        Thu,  2 Jan 2020 10:01:48 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4A73F703;
        Thu,  2 Jan 2020 10:01:47 -0800 (PST)
Date:   Thu, 2 Jan 2020 18:01:45 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Srinivas Ramana <sramana@codeaurora.org>
Cc:     will@kernel.org, maz@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Set SSBS for user threads while creation
Message-ID: <20200102180145.GE27940@arrakis.emea.arm.com>
References: <1577106146-8999-1-git-send-email-sramana@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577106146-8999-1-git-send-email-sramana@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 23, 2019 at 06:32:26PM +0530, Srinivas Ramana wrote:
> Current SSBS implementation takes care of setting the
> SSBS bit in start_thread() for user threads. While this works
> for tasks launched with fork/clone followed by execve, for cases
> where userspace would just call fork (eg, Java applications) this
> leaves the SSBS bit unset. This results in performance
> regression for such tasks.
> 
> It is understood that commit cbdf8a189a66 ("arm64: Force SSBS
> on context switch") masks this issue, but that was done for a
> different reason where heterogeneous CPUs(both SSBS supported
> and unsupported) are present. It is appropriate to take care
> of the SSBS bit for all threads while creation itself.
> 
> Fixes: 8f04e8e6e29c ("arm64: ssbd: Add support for PSTATE.SSBS rather than trapping to EL3")
> Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>

I suppose the parent process cleared SSBS explicitly. Isn't the child
after fork() supposed to be nearly identical to the parent? If we did as
you suggest, someone else might complain that SSBS has been set in the
child after fork().

I think the fix is for user space to set SSBS in the child if it no
longer needs it.

-- 
Catalin

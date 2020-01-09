Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11C95135C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 16:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731088AbgAIPSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 10:18:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:39444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727945AbgAIPSD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 10:18:03 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 418E4206ED;
        Thu,  9 Jan 2020 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578583082;
        bh=wwTkulcWNrf8/WnDIcLNGlEiuiK3aNjEJ0Ao6P3jLx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6tQ2nfhWozNQ3WNBxLm/6dfX9TD28B9GdBZdjeTZQ6hOapDoVOaApZajf9G8DOWE
         +eISC137+7dtioAZSNt3iRl/UVkOQKuB/W8iThl/6EcKMphY/hp2e6LQc+anmIdiEh
         Ijd6kQgGCuGIeuG2Y5cPSqWBV0qUYoPUkn7Y/UTs=
Date:   Thu, 9 Jan 2020 15:17:57 +0000
From:   Will Deacon <will@kernel.org>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Srinivas Ramana <sramana@codeaurora.org>, maz@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Set SSBS for user threads while creation
Message-ID: <20200109151756.GG12236@willie-the-truck>
References: <1577106146-8999-1-git-send-email-sramana@codeaurora.org>
 <20200102180145.GE27940@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102180145.GE27940@arrakis.emea.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 02, 2020 at 06:01:45PM +0000, Catalin Marinas wrote:
> On Mon, Dec 23, 2019 at 06:32:26PM +0530, Srinivas Ramana wrote:
> > Current SSBS implementation takes care of setting the
> > SSBS bit in start_thread() for user threads. While this works
> > for tasks launched with fork/clone followed by execve, for cases
> > where userspace would just call fork (eg, Java applications) this
> > leaves the SSBS bit unset. This results in performance
> > regression for such tasks.
> > 
> > It is understood that commit cbdf8a189a66 ("arm64: Force SSBS
> > on context switch") masks this issue, but that was done for a
> > different reason where heterogeneous CPUs(both SSBS supported
> > and unsupported) are present. It is appropriate to take care
> > of the SSBS bit for all threads while creation itself.
> > 
> > Fixes: 8f04e8e6e29c ("arm64: ssbd: Add support for PSTATE.SSBS rather than trapping to EL3")
> > Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
> 
> I suppose the parent process cleared SSBS explicitly. Isn't the child
> after fork() supposed to be nearly identical to the parent? If we did as
> you suggest, someone else might complain that SSBS has been set in the
> child after fork().

Right, I'd expect the parent SSBS to be inherited when we copy the pstate
field along with the other regs, and I think this is the correct behaviour.

Is that broken somehow?

Will

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A052C2F1585
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 14:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733247AbhAKNle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 08:41:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:47962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733235AbhAKNlb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 08:41:31 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9137D221FD;
        Mon, 11 Jan 2021 13:40:50 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1kyxRA-006gvt-Gn; Mon, 11 Jan 2021 13:40:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Jan 2021 13:40:48 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Srinivas Ramana <sramana@codeaurora.org>
Cc:     catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: cpufeature: Add filter function to control
In-Reply-To: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
References: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <6dfdf691b5ed57df81c4c61422949af5@misterjones.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sramana@codeaurora.org, catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Srinivas,

On 2021-01-09 00:29, Srinivas Ramana wrote:
> This patchset adds a control function for cpufeature framework
> so that the feature can be controlled at runtime.
> 
> Defer PAC on boot core and use the filter function added to disable
> PAC from command line. This will help toggling the feature on systems
> that do not support PAC or where PAC needs to be disabled at runtime,
> without modifying the core kernel.
> 
> The idea of adding the filter function for cpufeature is taken from
> https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-25-catalin.marinas@arm.com/
> https://lore.kernel.org/linux-arm-kernel/20200515171612.1020-24-catalin.marinas@arm.com/
> 
> Srinivas Ramana (3):
>   arm64: Defer enabling pointer authentication on boot core
>   arm64: cpufeature: Add a filter function to cpufeature
>   arm64: Enable control of pointer authentication using early param
> 
>  Documentation/admin-guide/kernel-parameters.txt |  6 +++
>  arch/arm64/include/asm/cpufeature.h             |  8 +++-
>  arch/arm64/include/asm/pointer_auth.h           | 10 +++++
>  arch/arm64/include/asm/stackprotector.h         |  1 +
>  arch/arm64/kernel/cpufeature.c                  | 53 
> +++++++++++++++++++------
>  arch/arm64/kernel/head.S                        |  4 --
>  6 files changed, 64 insertions(+), 18 deletions(-)

I've been working for some time on a similar series to allow a feature
set to be disabled during the early boot phase, initially to prevent
booting a kernel with VHE, but the mechanism is generic enough to
deal with most architectural features.

I took the liberty to lift your first patch and to add it to my 
series[1],
further allowing PAuth to be disabled at boot time on top of BTI and 
VHE.

I'd appreciate your comments on this.

Thanks,

         M.

[1] https://lore.kernel.org/r/20210111132811.2455113-1-maz@kernel.org
-- 
Jazz is not dead. It just smells funny...

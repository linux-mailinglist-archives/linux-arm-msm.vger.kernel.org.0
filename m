Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3151075F72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 09:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfGZHEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 03:04:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGZHEd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 03:04:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B33C2189F;
        Fri, 26 Jul 2019 07:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564124672;
        bh=k/UOBs057nzqvM8wDXVsdhD34rUb8UosI2e9mYaPZcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hj2bqG3OC26tesrJHal/PYw3vjXJCXPcVlmZ/mvwcK60gprjxKzanyetOieQalQtC
         /Az1cdpFMBj1pj7fD6vzLZAQk3QkKKBYhyCBP0bowOvh4Z2hvHgTjIArDV9mZEW1at
         xZaN09LLnZSxwlkmcNlcEhZwoiJWK9WeJZ3uacKE=
Date:   Fri, 26 Jul 2019 09:04:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Regression] Missing device nodes for ETR, ETF and STM after
 CONFIG_UEVENT_HELPER=n
Message-ID: <20190726070429.GA15714@kroah.com>
References: <cfe09a46-462f-633a-37c2-52f8bfc0ffb2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfe09a46-462f-633a-37c2-52f8bfc0ffb2@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 26, 2019 at 11:49:19AM +0530, Sai Prakash Ranjan wrote:
> Hi,
> 
> When trying to test my coresight patches, I found that etr,etf and stm
> device nodes are missing from /dev.

I have no idea what those device nodes are.

> Bisection gives this as the bad commit.
> 
> 1be01d4a57142ded23bdb9e0c8d9369e693b26cc is the first bad commit
> commit 1be01d4a57142ded23bdb9e0c8d9369e693b26cc
> Author: Geert Uytterhoeven <geert+renesas@glider.be>
> Date:   Thu Mar 14 12:13:50 2019 +0100
> 
>     driver: base: Disable CONFIG_UEVENT_HELPER by default
> 
>     Since commit 7934779a69f1184f ("Driver-Core: disable /sbin/hotplug by
>     default"), the help text for the /sbin/hotplug fork-bomb says
>     "This should not be used today [...] creates a high system load, or
>     [...] out-of-memory situations during bootup".  The rationale for this
>     was that no recent mainstream system used this anymore (in 2010!).
> 
>     A few years later, the complete uevent helper support was made optional
>     in commit 86d56134f1b67d0c ("kobject: Make support for uevent_helper
>     optional.").  However, if was still left enabled by default, to support
>     ancient userland.
> 
>     Time passed by, and nothing should use this anymore, so it can be
>     disabled by default.
> 
>     Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  drivers/base/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> 
> Any idea on this?

That means that who ever created those device nodes is relying on udev
to do this, and is not doing the correct thing within the kernel and
using devtmpfs.

Any pointers to where in the kernel those devices are trying to be
created?

thanks,

greg k-h

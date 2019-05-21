Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7F3C24C59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 12:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfEUKLe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 06:11:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:43218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727637AbfEUKLe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 06:11:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F01DF217F4;
        Tue, 21 May 2019 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558433493;
        bh=pB4vYOvoQdUctKCDFo00xaDwJ+g03s/7GcI40ZPm0ys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B1iwgC4zg3zUDfZDgqx02UdkgmKtZZMnb0Uw8KOL8iFKi/eKl9L6nVpSrZm6CM8gz
         ynklPDXRHVvmikJPbL2/6Hm8hq9hqMlXn0Btv6GBq2MwUK6LdFpK31COmopt129Qe+
         R2YrYhF0gCKQ5/TDad/Wz+wAyZgXYDajqpkO9wm4=
Date:   Tue, 21 May 2019 12:11:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        david.brown@linaro.org, sboyd@kernel.org, jslaby@suse.com,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tty: serial: msm_serial: Fix XON/XOFF
Message-ID: <20190521101131.GC13612@kroah.com>
References: <20190520183848.27719-1-jorge.ramirez-ortiz@linaro.org>
 <20190520185008.GX2085@tuxbook-pro>
 <ef705e54-78bb-27e2-5060-31056234dad3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef705e54-78bb-27e2-5060-31056234dad3@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 20, 2019 at 08:57:39PM +0200, Jorge Ramirez wrote:
> On 5/20/19 20:50, Bjorn Andersson wrote:
> > On Mon 20 May 11:38 PDT 2019, Jorge Ramirez-Ortiz wrote:
> > 
> >> When the tty layer requests the uart to throttle, the current code
> >> executing in msm_serial will trigger "Bad mode in Error Handler" and
> >> generate an invalid stack frame in pstore before rebooting (that is if
> >> pstore is indeed configured: otherwise the user shall just notice a
> >> reboot with no further information dumped to the console).
> >>
> >> This patch replaces the PIO byte accessor with the word accessor
> >> already used in PIO mode.
> >>
> >> Fixes: 68252424a7c7 ("tty: serial: msm: Support big-endian CPUs")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > You missed Stephen's
> > 
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> argh sorry Stephen. can the maintainer add it when it gets merged or
> shall I post V3?

I'll fix it up...

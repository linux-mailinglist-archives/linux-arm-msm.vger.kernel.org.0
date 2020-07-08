Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD52218B82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbgGHPkd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 11:40:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:47324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729022AbgGHPkd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 11:40:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C2392063A;
        Wed,  8 Jul 2020 15:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594222832;
        bh=f9OKByRreJnmzYiKqsCux5rcWp4GaOz8dutrQOUlyIc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SWOLpOll+7GeFajDdGkhB89ANQgz/DpR82Trf7v+WRGsdd6bSA+b++wqiRWoPKjv+
         GpK+QyNPriDDBYbfb4T6TvqT4DPq40vdmFa+sQo3voNCP1zXxrOqnBst/N8bRBPzu7
         do4KgnUhKI9QMKTNXTeHdcyDIQj2IxwR8tFiq/Jg=
Date:   Wed, 8 Jul 2020 17:40:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Akash Asthana <akashast@codeaurora.org>, saravanak@google.com,
        sspatil@google.com, tkjos@google.com,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6] serial: msm_geni_serial_console : Add Earlycon support
Message-ID: <20200708154028.GC715257@kroah.com>
References: <1592820512-1225-1-git-send-email-akashast@codeaurora.org>
 <20200623194936.GE128451@builder.lan>
 <c2752c91-b203-4224-9ddf-1e5a03b6488b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2752c91-b203-4224-9ddf-1e5a03b6488b@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 08, 2020 at 08:06:52PM +0530, Mukesh, Savaliya wrote:
> 
> On 6/24/2020 1:19 AM, Bjorn Andersson wrote:
> > On Mon 22 Jun 03:08 PDT 2020, Akash Asthana wrote:
> > 
> > > From: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
> > > 
> > > This change enables earlyconsole support as static driver for geni
> > > based UART. Kernel space UART console driver will be generic for
> > > console and other usecases of UART.
> > > 
> > Is this hardware different from the qcom,geni-debug-uart which we
> > already have EARLYCON support for?
> > 
> > Why is this a separate driver?
> 
> The Hardware is same, but for the Generic kernel image we are using
> downstream driver which can't be a static compiled driver.

Why not?  Why not fix that?

> The same driver file has  1.earlyconsole, 2.kernel console and 3.HSUART
> driver parts.
> 
> To make Generic image, 2 and 3 are internal downstream driver and 1st one i
> am trying to get upstreamed, so that can be pulled into the ACK.

That has nothing to do with us, please do it correctly so that everyone
benifits.

> The one with the qcom,genu-debug-uart is not being used for our products.

So we can just delete it from the tree?

thanks,

greg k-h

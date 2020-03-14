Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4FB1858CF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2020 03:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgCOCYO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Mar 2020 22:24:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:39096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727916AbgCOCYN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Mar 2020 22:24:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1D4620665;
        Sat, 14 Mar 2020 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584173902;
        bh=UxRNdDswoc+aYFNAIDNEbP0gH8SJJcjUu+LoTnQeirI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JQa6Y5NVSKrELT+Y7cEdvdggf5WFlqVXME9mu6Vc7SzTiy/bijWQK2zuQrNjdTPQh
         96MB1sI64568Sw82CYaOe0lYUf55L6W59tFTnamAYWz04Zu+wmBmTD5q3YS3EKsl5e
         0+JBu3wjWCsqS92+Nya4gSpTq5DOaYD8SpBj8Y5U=
Date:   Sat, 14 Mar 2020 09:07:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     skakit@codeaurora.org
Cc:     swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        akashast@codeaurora.org, rojay@codeaurora.org,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 2/2] tty: serial: qcom_geni_serial: Fix RX cancel
 command failure
Message-ID: <20200314080742.GA6509@kroah.com>
References: <1583477228-32231-1-git-send-email-skakit@codeaurora.org>
 <1583477228-32231-3-git-send-email-skakit@codeaurora.org>
 <20200312091041.GA198954@kroah.com>
 <436ae3cfb957b11b0d7aa3b1dbb0adf2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <436ae3cfb957b11b0d7aa3b1dbb0adf2@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 13, 2020 at 07:23:50PM +0530, skakit@codeaurora.org wrote:
> On 2020-03-12 14:40, Greg KH wrote:
> > On Fri, Mar 06, 2020 at 12:17:08PM +0530, satya priya wrote:
> > > RX cancel command fails when BT is switched on and off multiple times.
> > > 
> > > To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS
> > > register
> > > instead of SE_GENI_S_CMD_CTRL_REG.
> > > 
> > > As per the HPG update, handle the RX last bit after cancel command
> > > and flush out the RX FIFO buffer.
> > > 
> > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  drivers/tty/serial/qcom_geni_serial.c | 18 ++++++++++++++----
> > >  1 file changed, 14 insertions(+), 4 deletions(-)
> > 
> > This patch didn't apply :(
> 
> V1 of this patch is already picked in tty-next tree(commit id:
> 679aac5ead2f18d223554a52b543e1195e181811). There is no change in this patch
> from V1 to V3[2/2].
> There is a crash reported by Stephen with V1, to resolve that we posted next
> versions adding this patch https://patchwork.kernel.org/patch/11423231/,
> that is, V3[1/2]. So now only V3[1/2] needs to be picked.

Ok, and I picked that up already, right?

Please be kind to maintainers and make it obvious what you want them to
do...

thanks,

greg k-h

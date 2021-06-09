Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A023A1B75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 19:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhFIRGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 13:06:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231225AbhFIRGc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 13:06:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 768A7613C7;
        Wed,  9 Jun 2021 17:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623258277;
        bh=dGcTtxqqWrrTv7jkKWpp8RX54dwnPJA5qlbS3WKY1dA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GSVjfPhRQLUP5yyJCxY+UyoVvImOiF0+643Lz3Gm/LOBf4OALIdCZyYtxCPAgp60Y
         3J5dR8VZhGYIFVEmhSjhjcUJZj2bgdu+jv78gHJPY0oa+7ZT6S00GTBZ9D85/VGev+
         Lvi9X8reL00C+yqHALofpIuWVr/teWuTXbo37qXo=
Date:   Wed, 9 Jun 2021 19:04:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jarvis.w.jiang@gmail.com, loic.poulain@linaro.org,
        Shujun Wang <wsj20369@163.com>
Subject: Re: [PATCH 3/3] bus: mhi: pci-generic: Fix hibernation
Message-ID: <YMD0o26UzZ72mdDp@kroah.com>
References: <20210606153741.20725-1-manivannan.sadhasivam@linaro.org>
 <20210606153741.20725-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606153741.20725-4-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 06, 2021 at 09:07:41PM +0530, Manivannan Sadhasivam wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> This patch fixes crash after resuming from hibernation. The issue
> occurs when mhi stack is builtin and so part of the 'restore-kernel',
> causing the device to be resumed from 'restored kernel' with a no
> more valid context (memory mappings etc...) and leading to spurious
> crashes.
> 
> This patch fixes the issue by implementing proper freeze/restore
> callbacks.
> 
> Reported-by: Shujun Wang <wsj20369@163.com>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Link: https://lore.kernel.org/r/1622571445-4505-1-git-send-email-loic.poulain@linaro.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 36 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)

Also needs a stable link, right?  I'll go add it by hand.  Please be
more careful next time...

greg k-h

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED32727A077
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 12:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgI0KXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 06:23:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:34598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgI0KXA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 06:23:00 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD2F523977;
        Sun, 27 Sep 2020 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601202180;
        bh=CqLwxaQAm8VgPpIJfqcU6NKANuRG4GyWBpOvkI5a1yI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SsqZZ8s9H2sSMoZXm4bjECLL0VJEjXWOsElk7M8QynIJFnXJJyt0Lez8OpURGuf9p
         4KEJsyNLBfIlU0eK+i/m4ExTDnB20e2sVjHHQCQuD8WvZFNQNSylkkYK1LR8poUrTq
         WZMZC+bNyEZk+VAOdukv1qVY2k1BfLWtxOCJvfAw=
Date:   Sun, 27 Sep 2020 12:23:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] bus: mhi: core: debugfs: Use correct format
 specifiers for addresses
Message-ID: <20200927102310.GB87283@kroah.com>
References: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
 <20200927033652.11789-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200927033652.11789-2-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 09:06:48AM +0530, Manivannan Sadhasivam wrote:
> For exposing the addresses of read/write pointers and doorbell register,
> let's use the correct format specifiers. This fixes the following issues
> generated using W=1 build in ARM32 and reported by Kbuild bot:
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
>                               mhi_event->db_cfg.db_val);
>                               ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
>                               mhi_chan->db_cfg.db_val);
>                               ^~~~~~~~~~~~~~~~~~~~~~~
>    2 warnings generated.
> 
> drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
> drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>    seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
>                                                    ^
> drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
> drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>        (u64)ring->rp, (u64)ring->wp,
>        ^
> drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>        (u64)ring->rp, (u64)ring->wp,
>                       ^
> drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
>    seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
>                                                            ~~~^
>                                                            %x
> drivers/bus/mhi/core/debugfs.c:123:7:
>        mhi_chan->db_cfg.db_val);
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/debugfs.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Ah, this is against your first set of patches, that's the confusion on
my part.

Please just fix them all up and resend 1 series of patches, that isn't
broken, and I will be glad to review and take that.

thanks,

greg k-h

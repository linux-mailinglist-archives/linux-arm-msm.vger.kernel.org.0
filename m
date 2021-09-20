Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A41494111C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 11:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235006AbhITJPa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 05:15:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230360AbhITJPJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 05:15:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 488D560FC0;
        Mon, 20 Sep 2021 09:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632128920;
        bh=G0xk/In77HKWUFgN+ffEjb+8ar4ZJgT3XWv0U2UYhcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DU9PtqkPUzHI6qosiweJrMLwhY9jT6bfPnE6zWk4APz9IcNXvdXAEvqN1wcPRnTtB
         jaP8bwO2YivOtDZPGYlpM8LD7Ok7ZDY3oTqQ2ZTQXZbpNgIkuPKUzp5wmU/CL1HXBE
         SMyIb7VyDVhdMK75gmEu2OfknNQf8WFcT7lpXJ2A=
Date:   Mon, 20 Sep 2021 11:08:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH] misc: fastrpc: fix improper packet size calculation
Message-ID: <YUhPlj8eeszBNZTE@kroah.com>
References: <1632125731-18768-1-git-send-email-jeyr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632125731-18768-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 20, 2021 at 01:45:31PM +0530, Jeya R wrote:
> The buffer list is sorted and this is not being
> considered while calculating packet size. This
> would lead to improper copy length calculation
> for non-dmaheap buffers which would eventually
> cause sending improper buffers to DSP.

You do have the full 72 columns to use :)

> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---
>  drivers/misc/fastrpc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

What commit does this fix?

thanks,

greg k-h

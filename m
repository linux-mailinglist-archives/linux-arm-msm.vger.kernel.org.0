Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E258A4132D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 13:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbhIULxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 07:53:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232387AbhIULxp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 07:53:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCF9861178;
        Tue, 21 Sep 2021 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1632225137;
        bh=M7aG/OqpQwhK9zNCrDbAoJPSoqqij4FtrHWoIqJuwko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OWfCkI84ze2jWcRRUNK1pXwU2hki4phgAc8uQV7ykEQm8nhA8ovodzhpiWWaip5pc
         UU9orG2mYFu+Oxm9OwjkLoum6ELQN/AedzKrt/RvD5B8A+Na+5jx+99kKzqpzWD5TI
         PiSjMMnK7GfoVPNObJXS6bXLils1imtwUtuIcxXI=
Date:   Tue, 21 Sep 2021 13:52:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: fix improper packet size calculation
Message-ID: <YUnHbiQDZK/+tTAp@kroah.com>
References: <1632224895-32661-1-git-send-email-jeyr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632224895-32661-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 21, 2021 at 05:18:15PM +0530, Jeya R wrote:
> The buffer list is sorted and this is not being considered while
> calculating packet size. This would lead to improper copy length
> calculation for non-dmaheap buffers which would eventually cause
> sending improper buffers to DSP.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Does this also need to go to the stable kernels?

> ---
> Changes in v3:
> - relocate patch change list
> 
> Changes in v2:
> - updated commit message to proper format
> - added fixes tag to commit message
> - removed unnecessary variable initialization
> - removed length check during payload calculation
> 
>  drivers/misc/fastrpc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610..69d45c4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -719,16 +719,18 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  static u64 fastrpc_get_payload_size(struct fastrpc_invoke_ctx *ctx, int metalen)
>  {
>  	u64 size = 0;
> -	int i;
> +	int oix;

What does "oix" stand for?  What was wrong with i?

thanks,

greg k-h

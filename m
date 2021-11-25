Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FBF45DDE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 16:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356125AbhKYPvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 10:51:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:59936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356235AbhKYPtH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 10:49:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDC9960FE8;
        Thu, 25 Nov 2021 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637855156;
        bh=W1kgA3ufPR8JBBGf/LdYl7SFwjgVz1hgPBD1H3E3C48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XGnqb+eHsw353INyJPufxlud/PadeJxiCHWeeQlkFbiqUtX/9i2ZDaNhSYG4Bakh+
         s01oG333v491+eyjFuurGDTkSwbWQdpKZI2EwtTmLD5Pi4TsLLZlfCjAAOlGQp1ySC
         BFf+0l63dRGLHAINGdScmPSOHJ3179UNsaUCY4Ic=
Date:   Thu, 25 Nov 2021 16:45:51 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeya R <jeyr@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: Re: [PATCH 2/5] misc: fastrpc: Add secure device node support
Message-ID: <YZ+vr+ahkzvWU+Wd@kroah.com>
References: <1637849744-24844-1-git-send-email-jeyr@codeaurora.org>
 <1637849744-24844-3-git-send-email-jeyr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637849744-24844-3-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 25, 2021 at 07:45:41PM +0530, Jeya R wrote:
> Register and deregister secure device node. Check for device name during
> device open get proper channel context.
> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>
> ---
>  drivers/misc/fastrpc.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 39aca77..0775554e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -79,6 +79,7 @@
>  #define SENSORS_PD	(2)
>  
>  #define miscdev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, miscdev)
> +#define securedev_to_cctx(d) container_of(d, struct fastrpc_channel_ctx, securedev)
>  
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>  						"sdsp", "cdsp"};
> @@ -213,6 +214,7 @@ struct fastrpc_channel_ctx {
>  	struct idr ctx_idr;
>  	struct list_head users;
>  	struct miscdevice miscdev;
> +	struct miscdevice securedev;
>  	struct kref refcount;

Wow, you now have 3 structures with reference counts all trying to
manage the same structure.  That's 2 more than you need.

This is not ok, please do not do that.

greg k-h

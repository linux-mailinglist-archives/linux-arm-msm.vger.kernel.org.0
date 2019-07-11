Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63B1B65DD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 18:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbfGKQti (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 12:49:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52510 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfGKQti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 12:49:38 -0400
Received: from pendragon.ideasonboard.com (softbank126163157105.bbtec.net [126.163.157.105])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9128F31C;
        Thu, 11 Jul 2019 18:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562863776;
        bh=LoR2g2XS7GgKN9XWxIyf9Qtnhr3+f3A2ozL+HHxPIyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QVwtxWHK5+cwWwak52s3iKytaDhY6/SeGYNM/YrTlepIBisZT4ki2OESwB5BrjmZB
         J4Doki+FWESXM5ScBEol/URQP9HFIMIAgMZrq3FwTYaEEv57iHhtxPAXKjB0itFkkq
         qY2PoKLZYCa7baYnCUnnem7b/TaIT4WYkey8EqBc=
Date:   Thu, 11 Jul 2019 19:49:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: use dev name for debugfs
Message-ID: <20190711164908.GO5247@pendragon.ideasonboard.com>
References: <20190706203105.7810-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190706203105.7810-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Sat, Jul 06, 2019 at 01:31:02PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This should be more future-proof if we ever encounter a device with two
> of these bridges.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index c8fb45e7b06d..9f4ff88d4a10 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -204,7 +204,7 @@ DEFINE_SHOW_ATTRIBUTE(status);
>  
>  static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
>  {
> -	pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
> +	pdata->debugfs = debugfs_create_dir(dev_name(pdata->dev), NULL);

That should work, but won't it become quite confusing for users ? I
wonder if the directory name shouldn't be prefixed with the driver name.
Something like "ti_sn65dsi86:%s", dev_name(pdata->dev).

>  	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
>  			&status_fops);

-- 
Regards,

Laurent Pinchart

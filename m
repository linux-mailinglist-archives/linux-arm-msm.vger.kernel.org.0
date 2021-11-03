Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24C04445FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 17:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbhKCQgk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 12:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbhKCQgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 12:36:40 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4095C061203
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 09:34:03 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id m21so2811891pgu.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=slIukMnGdEjFvYLnsgPyMFQpuRCWCSMtQookMpWIfvo=;
        b=el2xkxJfACIM7oCJT65CebNCQ8WmNxVQ2DB/EionnHAb40T4ku3HmRR9z64gnxsfll
         vaX6PXIKcm+L7nuNIE7UwoFKA3Rc+r5Rfm/Ltum2UK48CXz+uWGDl3EXFCMu8N0E+nuF
         CmbqdqbzF6EXQH+J+Yt0mTHpkN7aUekgRdoPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=slIukMnGdEjFvYLnsgPyMFQpuRCWCSMtQookMpWIfvo=;
        b=doJ6jgr4Fhmvk1n7YvdgvIMqLIbmRsJlTnQ3EbJK2ZtNC/+ang3NzYwBmgdV9M9aAT
         Fwa3Iz761Gek/xPdH9I7T8vBVEPCHfHDsTOkDeCBGBsIqIzPtuH839ybEaBTpqF0NC6y
         kbm4b5BhqL5ITSb8I2pjyGgfuwDZAVnQGWoA3eRAYrJYRupAWX1qimPFa6mJITXIM+7w
         bqjKXdibLeaveVEdXQJ68Yz4B6+JkG4AwHPZDKpaaw2lkfmiMQSc9ry7q/KOg7sBrN8U
         IxDqFJcv8k+4Qj7WzgR7hOXon65qpiQHWXl2daIPxN9jTcF5DKY2UbD2mEW8zRNxP2tD
         G57A==
X-Gm-Message-State: AOAM5334+3mtIj4agV0ccpKnaX/jLNsxynjyqP1egJidv7UiDxdjlor2
        s4XYBIBb1x8diVYmRMha0B35Yw==
X-Google-Smtp-Source: ABdhPJySZdnjD6oZ6jsH9vBRx+o0Q6ebKk/YPLXkYbMgxUsRQJ4Dv6pdhVl4g0C3Ex4PS3dI0dvFew==
X-Received: by 2002:a63:7516:: with SMTP id q22mr19387601pgc.24.1635957243446;
        Wed, 03 Nov 2021 09:34:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b5cc:11fb:70c8:786f])
        by smtp.gmail.com with UTF8SMTPSA id e8sm2967610pfv.183.2021.11.03.09.34.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 09:34:02 -0700 (PDT)
Date:   Wed, 3 Nov 2021 09:34:01 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rpmsg: glink: Fix use-after-free in
 qcom_glink_rpdev_release()
Message-ID: <YYK5+WrJqF2J/nPo@google.com>
References: <20211102235147.872921-1-sujitka@chromium.org>
 <20211102165137.v3.1.I2858f54e737295d746ea67e1dc0068fe63913ae5@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211102165137.v3.1.I2858f54e737295d746ea67e1dc0068fe63913ae5@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sujit,

On Tue, Nov 02, 2021 at 04:51:49PM -0700, Sujit Kautkar wrote:
> qcom_glink_rpdev_release() sets channel->rpdev to NULL. However, with
> debug enabled kernel, qcom_glink_rpdev_release() gets delayed due to
> delayed kobject release and channel gets released by that time and
> triggers below kernel warning. To avoid this use-after-free, clear ept
> pointers during ept destroy and channel release and add a new condition
> in qcom_glink_rpdev_release() to access channel
> 
> | BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
> | Write of size 8 at addr ffffffaba438e8d0 by task kworker/6:1/54
> |
> | CPU: 6 PID: 54 Comm: kworker/6:1 Not tainted 5.4.109-lockdep #16
> | Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
> | Workqueue: events kobject_delayed_cleanup
> | Call trace:
> |  dump_backtrace+0x0/0x284
> |  show_stack+0x20/0x2c
> |  dump_stack+0xd4/0x170
> |  print_address_description+0x3c/0x4a8
> |  __kasan_report+0x144/0x168
> |  kasan_report+0x10/0x18
> |  __asan_report_store8_noabort+0x1c/0x24
> |  qcom_glink_rpdev_release+0x54/0x70
> |  device_release+0x68/0x14c
> |  kobject_delayed_cleanup+0x158/0x2cc
> |  process_one_work+0x7cc/0x10a4
> |  worker_thread+0x80c/0xcec
> |  kthread+0x2a8/0x314
> |  ret_from_fork+0x10/0x18
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
> Changes in v3:
> - Clear ept pointers and add extra conditions
> 
> Changes in v2:
> - Fix typo in commit message
> 
>  drivers/rpmsg/qcom_glink_native.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index e1444fefdd1c0..0c64a6f7a4f09 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -269,6 +269,9 @@ static void qcom_glink_channel_release(struct kref *ref)
>  	idr_destroy(&channel->riids);
>  	spin_unlock_irqrestore(&channel->intent_lock, flags);
>  
> +	if (channel->rpdev)
> +		channel->rpdev->ept = NULL;
> +
>  	kfree(channel->name);
>  	kfree(channel);
>  }
> @@ -1214,6 +1217,8 @@ static void qcom_glink_destroy_ept(struct rpmsg_endpoint *ept)
>  	channel->ept.cb = NULL;
>  	spin_unlock_irqrestore(&channel->recv_lock, flags);
>  
> +	channel->rpdev->ept = NULL;
> +
>  	/* Decouple the potential rpdev from the channel */
>  	channel->rpdev = NULL;
>  
> @@ -1371,9 +1376,12 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
>  static void qcom_glink_rpdev_release(struct device *dev)
>  {
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> -	struct glink_channel *channel = to_glink_channel(rpdev->ept);
> +	struct glink_channel *channel = NULL;

no need to initialize the pointer, it is assigned in the path that uses it.

>  
> -	channel->rpdev = NULL;
> +	if (rpdev->ept) {
> +		channel = to_glink_channel(rpdev->ept);
> +		channel->rpdev = NULL;
> +	}
>  	kfree(rpdev);
>  }

Looks like this is already fixed in -next by:

commit 343ba27b6f9d473ec3e602cc648300eb03a7fa05
Author: Chris Lew <clew@codeaurora.org>
Date:   Thu Jul 30 10:48:15 2020 +0530

    rpmsg: glink: Remove channel decouple from rpdev release

    If a channel is being rapidly restarting and the kobj release worker is
    busy, there is a chance the rpdev_release function will run after the
    channel struct itself has been released.

    There should not be a need to decouple the channel from rpdev in the
    rpdev release since that should only happen from the close commands.

    Signed-off-by: Chris Lew <clew@codeaurora.org>
    Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
    Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
    Link: https://lore.kernel.org/r/1596086296-28529-6-git-send-email-deesin@codeaurora.org

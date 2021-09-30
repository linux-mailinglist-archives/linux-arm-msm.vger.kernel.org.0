Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC4841DF23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 18:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352028AbhI3QiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 12:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352007AbhI3QiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 12:38:12 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B345C06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:36:29 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id a3so8046965oid.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=YLNQN4UIBLgIxsaAyY5e+qsF4GYVsk+RnVC8CY1VgXQ=;
        b=SChrTpZeJO36IrVgRGFu+4OzzLK9x7NS9ZHKnu/V1SaFcj1Dl0qZF36kIKgQEVAiYi
         KQRwek+8y64lPlVn0aNNEu7uhc7n1qtmrM02mNkoLQ3v+DrbAvW6+8eta9yRJ9cDiaD2
         1l2kLzWZDg4VOUyGKj2SDAnX1jVOB9B7GDrEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=YLNQN4UIBLgIxsaAyY5e+qsF4GYVsk+RnVC8CY1VgXQ=;
        b=5yABY0UPUlMMC/tdKsax8UiMrx9ozMIQoSnbjHUslN7r8kLrZ1kvu0ZwYZFsf0hHFC
         AUluIy5YdReweES+vi9rkwvUx+8voD0k0cLdwuSQYpGP0k26ZONWgRVirvLIBMup9GG7
         3gc39+QMGHG725p8lIw8+aE/8vdKasHoe+ermFUvijMfTjaTjjucg8eEYUpZIftlKnCa
         g7KCgG5HJgya4N46VRxC5GAVO7879A6gzunyTQdrtfG9FGKC1dWI2LBJzI57MUYUrBxG
         7ypEM4GAXstQDoFLO36bFHHZRGxpPSQr1YN7d3CgmARDpNpSeTQeogGLG7UlhJfybkbN
         lYgA==
X-Gm-Message-State: AOAM532JdNJQNJV0j2djTwP5q6mB1quMXGEbzynot/zJWXAsjuIL6a9i
        4enV+yis/AtKXNkfKypz4CNoGo9ghpyXBzkLUSW39E/dnRw=
X-Google-Smtp-Source: ABdhPJzFbOWJdP3wcC29hCKejMnkAXwgEkkcl9dc+T9uX90YcE8WEepACBJwwr7v4YMHhg2tLm2yOLCiPljroNZyX2U=
X-Received: by 2002:a05:6808:f8f:: with SMTP id o15mr162552oiw.164.1633019788653;
 Thu, 30 Sep 2021 09:36:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Sep 2021 09:36:28 -0700
MIME-Version: 1.0
In-Reply-To: <1633015924-881-5-git-send-email-deesin@codeaurora.org>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org> <1633015924-881-5-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 30 Sep 2021 09:36:28 -0700
Message-ID: <CAE-0n538vv-P-MWXNL=MixHy9sfH20XYk=i_AJXWwGKS2_bFxw@mail.gmail.com>
Subject: Re: [PATCH V1 3/3] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-30 08:32:04)
> Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes
> to get/set the low level transport signals.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>

Is Chris the author? Because if so then there should be a From: Chris
line before the commit text starts.

> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/rpmsg/rpmsg_char.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 2bebc9b..60a889b 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -19,6 +19,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/skbuff.h>
>  #include <linux/slab.h>
> +#include <linux/termios.h>
>  #include <linux/uaccess.h>
>  #include <uapi/linux/rpmsg.h>
>
> @@ -76,6 +77,9 @@ struct rpmsg_eptdev {
>         spinlock_t queue_lock;
>         struct sk_buff_head queue;
>         wait_queue_head_t readq;
> +
> +       u32 rsigs;
> +       bool sig_pending;
>  };
>
>  static int rpmsg_eptdev_destroy(struct device *dev, void *data)
> @@ -120,6 +124,18 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
>         return 0;
>  }
>
> +static int rpmsg_sigs_cb(struct rpmsg_device *rpdev, void *priv, u32 sigs)
> +{
> +       struct rpmsg_eptdev *eptdev = priv;
> +
> +       eptdev->rsigs = sigs;
> +       eptdev->sig_pending = true;
> +
> +       /* wake up any blocking processes, waiting for signal notification */

Comment would be better if it indicated what function these waiters are
in instead of saying what wake_up_interruptible() does. Also, what is
interruptible for?

> +       wake_up_interruptible(&eptdev->readq);

Nitpick: Add newline here.

> +       return 0;
> +}
> +
>  static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  {
>         struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> @@ -276,10 +297,32 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
>                                unsigned long arg)
>  {
>         struct rpmsg_eptdev *eptdev = fp->private_data;
> +       bool set;
> +       u32 val;
> +       int ret;
>
>         if (cmd != RPMSG_DESTROY_EPT_IOCTL)
>                 return -EINVAL;

This should be deleted?

>
> +       switch (cmd) {
> +       case TIOCMGET:
> +               eptdev->sig_pending = false;
> +               ret = put_user(eptdev->rsigs, (int __user *)arg);
> +               break;
> +       case TIOCMSET:
> +               ret = get_user(val, (int __user *)arg);
> +               if (ret)
> +                       break;
> +               set = (val & TIOCM_DTR) ? true : false;
> +               ret = rpmsg_set_flow_control(eptdev->ept, set);
> +               break;
> +       case RPMSG_DESTROY_EPT_IOCTL:
> +               ret = rpmsg_eptdev_destroy(&eptdev->dev, NULL);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +       }
> +
>         return rpmsg_eptdev_destroy(&eptdev->dev, NULL);

This should be replaced with return ret?

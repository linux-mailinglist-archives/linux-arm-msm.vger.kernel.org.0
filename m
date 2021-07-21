Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF1A3D0906
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 08:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbhGUF42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 01:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbhGUF40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 01:56:26 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AB2C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 23:37:02 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id a132so1835354oib.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jul 2021 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xg3baJSSBULP8s6ey/O8ReuSv+AoFJkVvjtwGenuU0k=;
        b=kXGmni1VKYHTUVqZGBpShBqHRT1NGxkYWjaeE4Yoz8Yf9Sxt8zaXvYUsWwtorXQlvl
         GxIK3bAsQQh+eUoDIHprCtQoNNQRGEFr2uKUeAtpBRf2HOBlpw7KJeeydqV6mvMjHGMk
         oAQi1upFx/Y7Y8W8mwKo4LaL33mM4XFxbW57M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xg3baJSSBULP8s6ey/O8ReuSv+AoFJkVvjtwGenuU0k=;
        b=FuAhpXRgMdtvWuZ1vrLxOvjRm90FytqNWkrBtWweK0jbAwp1QXE4aL6cD0yHnHY8Qk
         ftPpqO29sIyOje9DsfplvEaV19irpSQgKECtRimPuPHLgAK992oTWB/9FdR2Mk3kYi2u
         YqDogJZ9xLg32SlkrMcab9Ut+9tfmKJ7+dbQhpWOviaKUqNRRr1Th4Let8lvLiI5fHfW
         jtwNeXt8y26Sz2nj7tbIHZ/0JKHii8iYRDWmcItX9YTzfs3eJ+HOhPHDU9MBeIoOVgDi
         67SXuzrSz1o6oSJOmpCScRSVKK+IumqxOrcsN/j/8Um5dZJuWZPjsH0eH91llgPK5xs3
         TlrA==
X-Gm-Message-State: AOAM532Qz8AF7Rr9/fmjo6f6oFWhPR3gzcAUIfFBqtRE86Z5MEIQBEnB
        Rt0t2e0mnHQECT/Y4UzPA4jO+FlcGa0+AGCg0JB6aw==
X-Google-Smtp-Source: ABdhPJzcNJtXaU4mxLcOiKcsBbqckZF4qM/fa1zRB0il4/3/dBl84zA90FB2mCHkJmTOT1Oe1lq8zvGKyevhIyNv99E=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr4916864oiu.19.1626849421461;
 Tue, 20 Jul 2021 23:37:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 06:37:01 +0000
MIME-Version: 1.0
In-Reply-To: <1623237532-20829-2-git-send-email-sibis@codeaurora.org>
References: <1623237532-20829-1-git-send-email-sibis@codeaurora.org> <1623237532-20829-2-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 06:37:00 +0000
Message-ID: <CAE-0n506v5cmyUb+Ge-H7t1HsqNatgxDmq28rqdyGZDbsM4pXg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: aoss: Expose send for generic usecase
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Chris Lew <clew@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-06-09 04:18:51)
> From: Deepak Kumar Singh <deesin@codeaurora.org>
>
> Not all upcoming usecases will have an interface to allow the aoss
> driver to hook onto. Expose the send api and create a get function to
> enable drivers to send their own messages to aoss.
>
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> v4:
>  * Fix compilation error due to missing qmp_put
>  * Minor typos [s/tarcks/tracks]
>
>  drivers/soc/qcom/qcom_aoss.c       | 70 ++++++++++++++++++++++++++++++++++++--
>  include/linux/soc/qcom/qcom_aoss.h | 36 ++++++++++++++++++++
>  2 files changed, 104 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/soc/qcom/qcom_aoss.h
>
> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
> index 934fcc4d2b05..e8f48760bac8 100644
> --- a/drivers/soc/qcom/qcom_aoss.c
> +++ b/drivers/soc/qcom/qcom_aoss.c
> @@ -522,13 +582,14 @@ static int qmp_probe(struct platform_device *pdev)
>         int irq;
>         int ret;
>
> -       qmp = devm_kzalloc(&pdev->dev, sizeof(*qmp), GFP_KERNEL);
> +       qmp = kzalloc(sizeof(*qmp), GFP_KERNEL);
>         if (!qmp)
>                 return -ENOMEM;
>
>         qmp->dev = &pdev->dev;
>         init_waitqueue_head(&qmp->event);
>         mutex_init(&qmp->tx_lock);
> +       kref_init(&qmp->refcount);
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         qmp->msgram = devm_ioremap_resource(&pdev->dev, res);
> @@ -569,6 +630,8 @@ static int qmp_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, qmp);
>
> +       atomic_set(&qmp->orphan, 0);
> +
>         return 0;
>
>  err_remove_qdss_clk:
> @@ -577,6 +640,7 @@ static int qmp_probe(struct platform_device *pdev)
>         qmp_close(qmp);
>  err_free_mbox:
>         mbox_free_channel(qmp->mbox_chan);
> +       kfree(qmp);
>
>         return ret;
>  }
> @@ -590,7 +654,9 @@ static int qmp_remove(struct platform_device *pdev)
>         qmp_cooling_devices_remove(qmp);
>
>         qmp_close(qmp);
> +       atomic_set(&qmp->orphan, 1);

This looks odd. Why are we letting the device be removed while it is in
use by other drivers? Can't we pin the device with get_device() so it
can't be removed and then prevent the driver from being removed until
all the consumer drivers drop the reference, i.e. suppress sysfs unbind?

Otherwise it looks like a generic problem that all provider devices,
clks, regulators, gpios, etc. have to deal with and thus this
hand-rolled mechanism can't be right.

>         mbox_free_channel(qmp->mbox_chan);
> +       kref_put(&qmp->refcount, qmp_handle_release);
>
>         return 0;
>  }

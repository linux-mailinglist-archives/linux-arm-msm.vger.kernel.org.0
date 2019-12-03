Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB38110322
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 18:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfLCREu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 12:04:50 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:35969 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfLCREu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 12:04:50 -0500
Received: by mail-vk1-f196.google.com with SMTP id i4so1281087vkc.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2019 09:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKEl7qNFIi9X+QXW3XmiWYr6gtYvjeFPeIzark7e3Kc=;
        b=SjVDebo2l6qnq7mYoXHOBDv0TSRRFcvV4BhItzIdS86qcLi/YIVmYbcnMxfknlqYhD
         H52BgHICLzr/0f1O9mYTSo7jipwh5XdXG2e43ThUq/cg5K/QXemoWUoN1FeNo0mJ7jbH
         NbX3nBYGI//sD+fqG/anKzbDV+iTxAlPVbm/OMzcNs7NqScICyX16MbERmNKyg37k6b6
         7ypUIEYiPBPmYNlPgSBSN0mANQvs4b+JZgWjrUVRSN7+oqZSY5Z+qmmnBgf8J0rGztgl
         odsRuDHvduZxdG4alX06JadsjaAZ0e6hbxAWq9Tu4Bv9CU0R7G1vkNXBxt4M9VDoyt+p
         O+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKEl7qNFIi9X+QXW3XmiWYr6gtYvjeFPeIzark7e3Kc=;
        b=eS30NnvWVjMQyF3Lm9YUSnMzeeSUPAe27KsmEM0mL8B50BGj/3oLsQPJe4ReOrtIl6
         JjTxBvNGZTnDU0RZbP5/tQsp/6KYPLivAr3d/XCXz6r6gPFPWZ1q4zjqzk6Pvs0tlo67
         91zkSE7ugB/4Wq3MrQf3s3XaAYxJ1a2VKvQYytcWJzD07OtIxrR2eilnnN41241GjIWT
         KKwNgUjczGdrd7hcomGU0HRuFmboUqPosEVzPXBiW3LN/UrOs0f+WxjUiXP05XuDsBWp
         2fIEGRpyR8cw+MCG8Apy1DzX70eT7hTtYNyLZb7dxxvK6TKCiEC+PT/evTt9AS3V4A2S
         Vifg==
X-Gm-Message-State: APjAAAXwrN9sekPKpBWZK36n/wEjTP3UdrZ8elQ3CGP2PR2b1p8pdven
        Brvcnwdm9pKceZGOksUwfKlTGswVVzb7fFDxn6xAcw==
X-Google-Smtp-Source: APXvYqwKm8MpMl1siagRD/fOyBMzpEUip8dDd1vpjLe8Sx3Hl6Aa61T3XqlZpKdBWWKGOA+Cc/OEYNbwz3q/Vz2Kliw=
X-Received: by 2002:ac5:c4f8:: with SMTP id b24mr3242890vkl.79.1575392688846;
 Tue, 03 Dec 2019 09:04:48 -0800 (PST)
MIME-Version: 1.0
References: <1571254641-13626-1-git-send-email-thara.gopinath@linaro.org> <1571254641-13626-4-git-send-email-thara.gopinath@linaro.org>
In-Reply-To: <1571254641-13626-4-git-send-email-thara.gopinath@linaro.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 3 Dec 2019 22:34:37 +0530
Message-ID: <CAHLCerOCt9VBizAHu+y+CmzFmz-ktqCJgcB_NeC3WC4W9YBvAQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] thermal: core: Add late init hook to cooling
 device ops
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 17, 2019 at 1:07 AM Thara Gopinath
<thara.gopinath@linaro.org> wrote:
>
> Add a hook in thermal_cooling_device_ops to be called after
> the cooling device has been initialized and registered
> but before binding it to a thermal zone.
>
> In this patch series it is used to hook up a power domain
> to the device pointer of cooling device.
>
> It can be used for any other relevant late initializations
> of a cooling device as well.

Please describe WHY this hook is needed.

> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  drivers/thermal/thermal_core.c | 13 +++++++++++++
>  include/linux/thermal.h        |  1 +
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 886e8fa..c2ecb73 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -994,6 +994,19 @@ __thermal_cooling_device_register(struct device_node *np,
>         list_add(&cdev->node, &thermal_cdev_list);
>         mutex_unlock(&thermal_list_lock);
>
> +       /* Call into cdev late initialization if defined */
> +       if (cdev->ops->late_init) {
> +               result = cdev->ops->late_init(cdev);
> +               if (result) {
> +                       ida_simple_remove(&thermal_cdev_ida, cdev->id);
> +                       put_device(&cdev->device);
> +                       mutex_lock(&thermal_list_lock);
> +                       list_del(&cdev->node);
> +                       mutex_unlock(&thermal_list_lock);
> +                       return ERR_PTR(result);
> +               }
> +       }
> +
>         /* Update binding information for 'this' new cdev */
>         bind_cdev(cdev);
>
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index e45659c..e94b3de 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -125,6 +125,7 @@ struct thermal_cooling_device_ops {
>                            struct thermal_zone_device *, unsigned long, u32 *);
>         int (*power2state)(struct thermal_cooling_device *,
>                            struct thermal_zone_device *, u32, unsigned long *);
> +       int (*late_init)(struct thermal_cooling_device *);
>  };
>
>  struct thermal_cooling_device {
> --
> 2.1.4
>

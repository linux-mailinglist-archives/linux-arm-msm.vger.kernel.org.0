Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1C09179C56
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 00:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388407AbgCDXW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 18:22:28 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36761 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388511AbgCDXW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 18:22:27 -0500
Received: by mail-vk1-f194.google.com with SMTP id y125so1100983vkc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 15:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qzbOBxoGlvw5OWNW1Ah6l3VKMPsLHTnZb9jh0xdhap8=;
        b=Xr+duYjsrVDjQpHtpWtSC1yYT91JeMgIM1acnVzC2D4m4WcgTMM+UHuRMU8jF6RJ59
         RaYhze0GcrEMvt8LPmaR6Av3j139t1PD1ShBMBbpNYzfsc0Pw32MzaHTVL0bSxj+oHd2
         euArYs4SRYFMJZ6vMnk8s2litzY57UNAn3BNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qzbOBxoGlvw5OWNW1Ah6l3VKMPsLHTnZb9jh0xdhap8=;
        b=h2pMNpEl9waFslrJQF4iBhIwCxlFSMMurEHn7DR7TNMUzuFlkPyJYsEeO/BqnmKZbe
         8LJQyPUmeEP06o2R7a8nQgyZI0PGyEpmvCgbozL8vZhtNKcjRsxkjBsCVKL46gl4ggBU
         PJ3gKGDsDshGpS/JWRsMizHEJ9zdk8nbaea7Krv+z6du9/uNZrX17z0UP0UFEW9ZaO99
         qg6MyPfsaMsZJEScOpXPIvMJobfb3e0yYClY9rXNB0Etbxh8XMJsjVIS5D8KgjMq6Se4
         hFmINrPmzxzokmmBj59/brnwSLE/UD7EYbtbvYCi81OXs9G6Nj3srd3jAYgx90bfrHAz
         RSRw==
X-Gm-Message-State: ANhLgQ2rOgcAzTT1eYBPRf71UXH3Nt5F7sfM0ptl69SOjSAMBDALmOjp
        beUebjunZ02D12EXm61MQbP0nhGYOE8=
X-Google-Smtp-Source: ADFU+vsfd1QWDpI9q1wmk9TldosAnqegkkH10EInChRh3Qpe2HbIrCqj8OAoVmRm+nN2WY1DDgxFoA==
X-Received: by 2002:a1f:9e86:: with SMTP id h128mr2962634vke.44.1583364144250;
        Wed, 04 Mar 2020 15:22:24 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id n196sm6243951vkn.27.2020.03.04.15.22.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2020 15:22:23 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id d19so1382479uak.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 15:22:22 -0800 (PST)
X-Received: by 2002:ab0:1653:: with SMTP id l19mr3087910uae.8.1583364142386;
 Wed, 04 Mar 2020 15:22:22 -0800 (PST)
MIME-Version: 1.0
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org> <1583238415-18686-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583238415-18686-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 4 Mar 2020 15:22:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VG2dirykoGB93s3xCW8CKJjrGDS76koTyww_gy-jv7RQ@mail.gmail.com>
Message-ID: <CAD=FV=VG2dirykoGB93s3xCW8CKJjrGDS76koTyww_gy-jv7RQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 3, 2020 at 4:27 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add changes to invoke rpmh flush() from within cache_lock when the data
> in cache is dirty.
>
> This is done only if OSI is not supported in PSCI. If OSI is supported
> rpmh_flush can get invoked when the last cpu going to power collapse
> deepest low power mode.
>
> Also remove "depends on COMPILE_TEST" for Kconfig option QCOM_RPMH so the
> driver is only compiled for arm64 which supports psci_has_osi_support()
> API.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> ---
>  drivers/soc/qcom/Kconfig |  2 +-
>  drivers/soc/qcom/rpmh.c  | 37 ++++++++++++++++++++++---------------
>  2 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e7..2e581bc 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -105,7 +105,7 @@ config QCOM_RMTFS_MEM
>
>  config QCOM_RPMH
>         bool "Qualcomm RPM-Hardened (RPMH) Communication"
> -       depends on ARCH_QCOM && ARM64 || COMPILE_TEST
> +       depends on ARCH_QCOM && ARM64
>         help
>           Support for communication with the hardened-RPM blocks in
>           Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index f28afe4..dafb0da 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/psci.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> @@ -158,6 +159,13 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>         }
>
>  unlock:
> +       if (ctrlr->dirty && !psci_has_osi_support()) {
> +               if (rpmh_flush(ctrlr)) {
> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +       }
> +
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>
>         return req;
> @@ -285,26 +293,35 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>  }
>  EXPORT_SYMBOL(rpmh_write);
>
> -static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
> +static int cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>  {
>         unsigned long flags;
>
>         spin_lock_irqsave(&ctrlr->cache_lock, flags);
> +
>         list_add_tail(&req->list, &ctrlr->batch_cache);
>         ctrlr->dirty = true;
> +
> +       if (!psci_has_osi_support()) {
> +               if (rpmh_flush(ctrlr)) {

The whole API here is a bit unfortunate.  From what I can tell,
callers of this code almost always call rpmh_write_batch() in
triplicate, AKA:

rpmh_write_batch(active, ...)
rpmh_write_batch(wake, ...)
rpmh_write_batch(sleep, ...)

...that's going to end up writing the whole sleep/wake sets twice
every single time, right?  I know you talked about trying to keep
separate dirty bits for sleep/wake and maybe that would help, but it
might not be so easy due to the comparison of "sleep_val" and
"wake_val" in is_req_valid().

I guess we can keep the inefficiency for now and see how much it hits
us, but it feels ugly.


> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> +                       return -EINVAL;

nit: why not add "int ret = 0" to the top of the function, then here:

if (rpmh_flush(ctrl))
  ret = -EINVAL;

...then at the end "return ret".  It avoids the 2nd copy of the unlock?

Also: Why throw away the return value of rpmh_flush and replace it
with -EINVAL?  Trying to avoid -EBUSY?  ...oh, should you handle
-EBUSY?  AKA:

if (!psci_has_osi_support()) {
  do {
    ret = rpmh_flush(ctrl);
  } while (ret == -EBUSY);
}


> +               }
> +       }
> +
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> +
> +       return 0;
>  }
>
>  static int flush_batch(struct rpmh_ctrlr *ctrlr)
>  {
>         struct batch_cache_req *req;
>         const struct rpmh_request *rpm_msg;
> -       unsigned long flags;
>         int ret = 0;
>         int i;
>
>         /* Send Sleep/Wake requests to the controller, expect no response */
> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>         list_for_each_entry(req, &ctrlr->batch_cache, list) {
>                 for (i = 0; i < req->count; i++) {
>                         rpm_msg = req->rpm_msgs + i;
> @@ -314,7 +331,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>                                 break;
>                 }
>         }
> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>
>         return ret;
>  }
> @@ -386,10 +402,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>                 cmd += n[i];
>         }
>
> -       if (state != RPMH_ACTIVE_ONLY_STATE) {
> -               cache_batch(ctrlr, req);
> -               return 0;
> -       }
> +       if (state != RPMH_ACTIVE_ONLY_STATE)
> +               return cache_batch(ctrlr, req);
>
>         for (i = 0; i < count; i++) {
>                 struct completion *compl = &compls[i];
> @@ -455,9 +469,6 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>   * Return: -EBUSY if the controller is busy, probably waiting on a response
>   * to a RPMH request sent earlier.
>   *
> - * This function is always called from the sleep code from the last CPU
> - * that is powering down the entire system. Since no other RPMH API would be
> - * executing at this time, it is safe to run lockless.

nit: you've now got an extra "blank" (just has a "*" on it) line at
the end of your comment block.

nit: in v9, Evan suggested "We should probably replace that with a
comment indicating that we assume ctrlr->cache_lock is already held".
Maybe you could do that?

Also: presumably you _will_ still be called by the sleep code from the
last CPU on systems with OSI.  Is that true?  If that's not true then
you should change your function to static.  If that is true, then your
comment should be something like "this function will either be called
from sleep code on the last CPU (thus no spinlock needed) or with the
spinlock already held".


-Doug

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8134C17ECC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 00:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbgCIXnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 19:43:22 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38396 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727242AbgCIXnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 19:43:22 -0400
Received: by mail-vs1-f67.google.com with SMTP id k26so7277506vso.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FibW53f2XxatAXzQLRanxzBiW2G6Q3K28hu/UJkitds=;
        b=VY4SMTk6vsGRDhLZYbbrzvskYLAv0dyBIz+L42LJnUmMdfdX0NdQF2RMFNvZ4PDpiN
         5/WGDXg0GwWQ4hEwLcG3snpjszaIYRKkYksKOPa0UV4q2zgJHCwUB59wWedTBR4q4J9a
         tHYO9L6w1lFciwSG0kzyawq617UecGBS0iYRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FibW53f2XxatAXzQLRanxzBiW2G6Q3K28hu/UJkitds=;
        b=LAzdwo0jlV7QbG+Ux4S8xVDTdbxMjTiDXOptBJ078dTpCpF2tBlJ/aibvDUODNpNHn
         XTl/m9+d37qWJerBh0DKj4cJIvESufYY+HmKDMJR/Ni9wbq2AttzyADx/keISLfJ2Y4+
         I67Gzxuk4Ix1Qn1QAKlBsg24jdiq6IvJRK2j5bvzPpfMYa60LWxwdXmJ48bILcsD0NCh
         lgDPWLqKg7ZTJ2xa5CA8a1wCs4+4t23O8esjCOp0LfsHALRXwFzei954SHcBioYC6ZEW
         7Grbyli/Q1ivTE848v0by4tEICvwY5RhVeBFH50zrtPflgVNYB1gcNlkwylIOfHRNRAk
         cTVg==
X-Gm-Message-State: ANhLgQ1tn8VL1WFNdn663RFieEryavH7FtLz8LhW80/vFeSYWn8wWUj6
        W1rHeMLgTz/gAUQWTEXHHsj/atPEOI0=
X-Google-Smtp-Source: ADFU+vvAjwP4dXJZTe7w9hsAGn13Eu3mPnaTbGzNcnC8XEJc30oUH0+oRZRdTLRQgpyEBn2lWAT6Ww==
X-Received: by 2002:a67:e954:: with SMTP id p20mr11895687vso.194.1583797400482;
        Mon, 09 Mar 2020 16:43:20 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id f1sm10222353vkc.41.2020.03.09.16.43.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 16:43:19 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id a19so7257937vsp.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:43:19 -0700 (PDT)
X-Received: by 2002:a67:694f:: with SMTP id e76mr9520510vsc.73.1583797399296;
 Mon, 09 Mar 2020 16:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org> <1583746236-13325-5-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583746236-13325-5-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Mar 2020 16:43:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
Message-ID: <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/5] soc: qcom: rpmh: Invoke rpmh_flush() for dirty caches
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

On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Add changes to invoke rpmh flush() from within cache_lock when the data in
> cache is dirty.
>
> Introduce two new APIs for this. Clients can use rpmh_start_transaction()
> before any rpmh transaction once done invoke rpmh_end_transaction() which
> internally invokes rpmh_flush() if the caches has become dirty.
>
> Add support to control this with flush_dirty flag.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh-internal.h |  4 +++
>  drivers/soc/qcom/rpmh-rsc.c      |  6 +++-
>  drivers/soc/qcom/rpmh.c          | 64 ++++++++++++++++++++++++++++++++--------
>  include/soc/qcom/rpmh.h          | 10 +++++++
>  4 files changed, 71 insertions(+), 13 deletions(-)

As mentioned previously but not addressed [3], I believe your series
breaks things if there are zero ACTIVE TCSs and you're using the
immediate-flush solution.  Specifically any attempt to set something's
"active" state will clobber the sleep/wake.  I believe this is hard to
fix, especially if you want rpmh_write_async() to work properly and
need to be robust to the last man going down while rpmh_write_async()
is running but hasn't finished.  My suggestion was to consider it to
be an error at probe time for now.

Actually, though, I'd be super surprised if the "active == 0" case
works anyway.  Aside from subtle problems of not handling -EAGAIN (see
another previous message that you didn't respond to [2]), I think
you'll also get failures because you never enable interrupts in
RSC_DRV_IRQ_ENABLE for anything other than the ACTIVE_TCS.  Thus
you'll never get interrupts saying when your transactions on the
borrowed "wake" TCS finish.

Speaking of previous emails that you didn't respond to, I think you
still have these action items:

* Document that rpmh_write(active) and rpmh_write_async(active) also
updates wake state. [1]

* Change is_req_valid() to still return true if (sleep == wake), or
keep track of "active" and return true if (sleep != wake || wake !=
active). [1]

* Document that for batch a write to active doesn't update wake. [1]


> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
> index 6eec32b..d36be3d 100644
> --- a/drivers/soc/qcom/rpmh-internal.h
> +++ b/drivers/soc/qcom/rpmh-internal.h
> @@ -70,13 +70,17 @@ struct rpmh_request {
>   *
>   * @cache: the list of cached requests
>   * @cache_lock: synchronize access to the cache data
> + * @active_clients: count of rpmh transaction in progress
>   * @dirty: was the cache updated since flush
> + * @flush_dirty: if the dirty cache need immediate flush
>   * @batch_cache: Cache sleep and wake requests sent as batch
>   */
>  struct rpmh_ctrlr {
>         struct list_head cache;
>         spinlock_t cache_lock;
> +       u32 active_clients;
>         bool dirty;
> +       bool flush_dirty;
>         struct list_head batch_cache;
>  };
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index e278fc1..b6391e1 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -61,6 +61,8 @@
>  #define CMD_STATUS_ISSUED              BIT(8)
>  #define CMD_STATUS_COMPL               BIT(16)
>
> +#define FLUSH_DIRTY                    1
> +
>  static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int cmd_id)
>  {
>         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET * tcs_id +
> @@ -670,13 +672,15 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>         INIT_LIST_HEAD(&drv->client.cache);
>         INIT_LIST_HEAD(&drv->client.batch_cache);
>
> +       drv->client.flush_dirty = device_get_match_data(&pdev->dev);
> +
>         dev_set_drvdata(&pdev->dev, drv);
>
>         return devm_of_platform_populate(&pdev->dev);
>  }
>
>  static const struct of_device_id rpmh_drv_match[] = {
> -       { .compatible = "qcom,rpmh-rsc", },
> +       { .compatible = "qcom,rpmh-rsc", .data = (void *)FLUSH_DIRTY },

Ick.  This is just confusing.  IMO better to set
'drv->client.flush_dirty = true' directly in probe with a comment
saying that it could be removed if we had OSI.

...and while you're at it, why not fire off a separate patch (not in
your series) adding the stub to 'include/linux/psci.h'.  Then when we
revisit this in a year it'll be there and it'll be super easy to set
the value properly.


>         { }
>  };
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 5bed8f4..9d40209 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -297,12 +297,10 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
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
> @@ -312,7 +310,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>                                 break;
>                 }
>         }
> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>
>         return ret;
>  }
> @@ -433,16 +430,63 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>  }
>
>  /**
> + * rpmh_start_transaction: Indicates start of rpmh transactions, this
> + * must be ended by invoking rpmh_end_transaction().
> + *
> + * @dev: the device making the request
> + */
> +void rpmh_start_transaction(const struct device *dev)
> +{
> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> +       unsigned long flags;
> +
> +       if (!ctrlr->flush_dirty)
> +               return;
> +
> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> +       ctrlr->active_clients++;

Wouldn't hurt to have something like:

/*
 * Detect likely leak; we shouldn't have 1000
 * people making in-flight changes at the same time.
 */
WARN_ON(ctrlr->active_clients > 1000)


> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> +}
> +EXPORT_SYMBOL(rpmh_start_transaction);
> +
> +/**
> + * rpmh_end_transaction: Indicates end of rpmh transactions. All dirty data
> + * in cache can be flushed immediately when ctrlr->flush_dirty is set
> + *
> + * @dev: the device making the request
> + *
> + * Return: 0 on success, error number otherwise.
> + */
> +int rpmh_end_transaction(const struct device *dev)
> +{
> +       struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> +       unsigned long flags;
> +       int ret = 0;
> +
> +       if (!ctrlr->flush_dirty)
> +               return ret;
> +
> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);

WARN_ON(!active_clients);


> +
> +       ctrlr->active_clients--;
> +       if (ctrlr->dirty && !ctrlr->active_clients)
> +               ret = rpmh_flush(ctrlr);

As mentioned previously [2], I don't think it's valid to call
rpmh_flush() with interrupts disabled.  Specifically (as of your
previous patch) rpmh_flush now loops if rpmh_rsc_invalidate() returns
-EAGAIN.  I believe that the caller needs to enable interrupts for a
little bit before trying again.  If the caller doesn't need to enable
interrupts for a little bit before trying again then why was -EAGAIN
even returned?  tcs_invalidate() could have just looped itself and all
the code would be much simpler.


> +
> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL(rpmh_end_transaction);
> +
> +/**
>   * rpmh_flush: Flushes the buffered active and sleep sets to TCS
>   *
>   * @ctrlr: controller making request to flush cached data
>   *
> - * Return: -EBUSY if the controller is busy, probably waiting on a response
> - * to a RPMH request sent earlier.
> + * Return: 0 on success, error number otherwise.
>   *
> - * This function is always called from the sleep code from the last CPU
> - * that is powering down the entire system. Since no other RPMH API would be
> - * executing at this time, it is safe to run lockless.
> + * This function can either be called from sleep code on the last CPU
> + * (thus no spinlock needed) or with the ctrlr->cache_lock already held.
>   */
>  int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>  {
> @@ -464,10 +508,6 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>         if (ret)
>                 return ret;
>
> -       /*
> -        * Nobody else should be calling this function other than system PM,
> -        * hence we can run without locks.
> -        */
>         list_for_each_entry(p, &ctrlr->cache, list) {
>                 if (!is_req_valid(p)) {
>                         pr_debug("%s: skipping RPMH req: a:%#x s:%#x w:%#x",
> diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
> index f9ec353..85e1ab2 100644
> --- a/include/soc/qcom/rpmh.h
> +++ b/include/soc/qcom/rpmh.h
> @@ -22,6 +22,10 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>
>  int rpmh_invalidate(const struct device *dev);
>
> +void rpmh_start_transaction(const struct device *dev);
> +
> +int rpmh_end_transaction(const struct device *dev);
> +
>  #else
>
>  static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
> @@ -41,6 +45,12 @@ static inline int rpmh_write_batch(const struct device *dev,
>  static inline int rpmh_invalidate(const struct device *dev)
>  { return -ENODEV; }
>
> +void rpmh_start_transaction(const struct device *dev)
> +{ return -ENODEV; }

Unexpected return from void function.


> +
> +int rpmh_end_transaction(const struct device *dev)
> +{ return -ENODEV; }
> +
>  #endif /* CONFIG_QCOM_RPMH */
>
>  #endif /* __SOC_QCOM_RPMH_H__ */

[1] https://lore.kernel.org/r/CAD=FV=VzNnRdDN5uPYskJ6kQHq2bAi2ysEqt0=taagdd_qZb-g@mail.gmail.com
[2] https://lore.kernel.org/r/CAD=FV=UYpO2rSOoF-OdZd3jKfSZGKnpQJPoiE5fzH+u1uafS6g@mail.gmail.com
[3] https://lore.kernel.org/r/CAD=FV=VNaqwiti+UB8fLgjF5r2CD2xeF_p7qHS-_yXqf+ZDrBg@mail.gmail.com



-Doug

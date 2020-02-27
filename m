Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19EE21726DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 19:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgB0SSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 13:18:49 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41991 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729306AbgB0SSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 13:18:48 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so264986ljl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 10:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIrZq7zfi9d8Q+fOa28AhByDzOWhjJxxZS3b+/HMQXg=;
        b=U4P8uy/s4Ds1EkDDNGaWi1K9er6AUfeAf4VVGIvriAPWIb8H7ZO9oXIIyRLW+mfi8n
         mQb4nT0l6ksb6++c3tZjqKnQzqlPkj/Z0cbluKLEh2/M+IFiKQXtdTTDnavsmBv6PATU
         ZHd+VHFOeA9D8ICg70R5qVFgQEJnlAq7kzz0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIrZq7zfi9d8Q+fOa28AhByDzOWhjJxxZS3b+/HMQXg=;
        b=RKgcH3Fx0AZmk39dv0KiFPZREMErNUUz+SIgsg7Js/+7oGNnIu9pq55MmAdZBo2iLY
         d3/eiYqFoKHU3JTAyXyN7FcHJD8lz+/ktsv/4qSfSwT/+yn4i/LXp+JU5q9lEwF2LCHh
         4k1lWxmmGrL1ZfVClGJmZI73wZKKCqGSpc+rP1suFLT59Mvhb9L3o3qIPMlnl+5A2vRZ
         blcp4fD8VGBbEdqLR85LHEgKg1oyW1aiARsKwtOTHndV8KBs+Ihiqlxqvfn55olM2U3b
         BLysflJ7A43Py9NDcTESuA3UE9PGA5v8SRjXJ5NdO4U8xpuIVY0Zrtbq4pkuWC7DWib6
         spiQ==
X-Gm-Message-State: ANhLgQ0WC+izSz28zUXIarPRawUYLLhZF8MKQn82RtPyMDnkzmIPuC0M
        GTGhSDXZmmrrbfa9VnHRnTpkOU5LRk8=
X-Google-Smtp-Source: ADFU+vv+PBuhsb7Si/WjxTzSIkj3vXSIvK9e9MIrSSp71Y9Qw06usLUgzIDCEy32HJwxDTzkjEZQBA==
X-Received: by 2002:a2e:5454:: with SMTP id y20mr202495ljd.23.1582827525731;
        Thu, 27 Feb 2020 10:18:45 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id r12sm3797442ljh.105.2020.02.27.10.18.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 10:18:43 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id r19so309190ljg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2020 10:18:43 -0800 (PST)
X-Received: by 2002:a2e:81c7:: with SMTP id s7mr201688ljg.3.1582827523002;
 Thu, 27 Feb 2020 10:18:43 -0800 (PST)
MIME-Version: 1.0
References: <1582793785-22423-1-git-send-email-mkshah@codeaurora.org> <1582793785-22423-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1582793785-22423-3-git-send-email-mkshah@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 27 Feb 2020 10:18:06 -0800
X-Gmail-Original-Message-ID: <CAE=gft6VDMoTZ4mW7d7scUCtDowfJiCbOzx_1FaFkoz8tm99DQ@mail.gmail.com>
Message-ID: <CAE=gft6VDMoTZ4mW7d7scUCtDowfJiCbOzx_1FaFkoz8tm99DQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] soc: qcom: rpmh: Update dirty flag only when data changes
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 12:57 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Currently rpmh ctrlr dirty flag is set for all cases regardless of data
> is really changed or not. Add changes to update dirty flag when data is
> changed to newer values.
>
> Also move dirty flag updates to happen from within cache_lock and remove
> unnecessary INIT_LIST_HEAD() call and a default case from switch.
>
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index eb0ded0..3f5d9eb 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -133,26 +133,30 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>
>         req->addr = cmd->addr;
>         req->sleep_val = req->wake_val = UINT_MAX;
> -       INIT_LIST_HEAD(&req->list);

Thanks!

>         list_add_tail(&req->list, &ctrlr->cache);
>
>  existing:
>         switch (state) {
>         case RPMH_ACTIVE_ONLY_STATE:
> -               if (req->sleep_val != UINT_MAX)
> +               if (req->sleep_val != UINT_MAX) {
>                         req->wake_val = cmd->data;
> +                       ctrlr->dirty = true;
> +               }
>                 break;
>         case RPMH_WAKE_ONLY_STATE:
> -               req->wake_val = cmd->data;
> +               if (req->wake_val != cmd->data) {
> +                       req->wake_val = cmd->data;
> +                       ctrlr->dirty = true;
> +               }
>                 break;
>         case RPMH_SLEEP_STATE:
> -               req->sleep_val = cmd->data;
> -               break;
> -       default:
> +               if (req->sleep_val != cmd->data) {
> +                       req->sleep_val = cmd->data;
> +                       ctrlr->dirty = true;
> +               }
>                 break;
>         }
>
> -       ctrlr->dirty = true;
>  unlock:
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>
> @@ -287,6 +291,7 @@ static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>
>         spin_lock_irqsave(&ctrlr->cache_lock, flags);
>         list_add_tail(&req->list, &ctrlr->batch_cache);
> +       ctrlr->dirty = true;
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>  }
>
> @@ -323,6 +328,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>         list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>                 kfree(req);
>         INIT_LIST_HEAD(&ctrlr->batch_cache);
> +       ctrlr->dirty = true;
>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>  }
>
> @@ -456,13 +462,9 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>  int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>  {
>         struct cache_req *p;
> +       unsigned long flags;
>         int ret;
>
> -       if (!ctrlr->dirty) {
> -               pr_debug("Skipping flush, TCS has latest data.\n");
> -               return 0;
> -       }
> -
>         /* First flush the cached batch requests */
>         ret = flush_batch(ctrlr);
>         if (ret)
> @@ -488,7 +490,9 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>                         return ret;
>         }
>
> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>         ctrlr->dirty = false;
> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);

You're acquiring a lock around an operation that's already inherently
atomic, which is not right. If the comment earlier in this function is
still correct that "Nobody else should be calling this function other
than system PM, hence we can run without locks", then you can simply
remove this hunk and the part moving ->dirty = true into
invalidate_batch.

However, if rpmh_flush() can now be called in a scenario where
pre-emption is enabled or multiple cores are alive, then ctrlr->cache
is no longer adequately protected. You'd need to add a lock
acquire/release around the list iteration above, and fix up the
comment.
-Evan

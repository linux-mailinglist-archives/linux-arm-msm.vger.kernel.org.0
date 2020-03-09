Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCEA17ECC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 00:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgCIXmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 19:42:44 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:40163 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbgCIXmo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 19:42:44 -0400
Received: by mail-vs1-f67.google.com with SMTP id c18so7254886vsq.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x/VkJDKvRwJ+qDbezBGZ4EAcxAnQeHrUS0YtzNe55OQ=;
        b=DffnC1G0RiMJ83ClulTUgVa6/8ydY2lac0+x2+f7iNT8mtQGQ26SMlH26sGK94FmXR
         gqwKGF9y3HjEiDOLL7OZBAyOUtd4XHl5ySXNIHlIWYKn6JQHkZs8vOZkhDa0Rxm2Lpm9
         vLUWdtcGnx9Z+I2TCIPbzBDhDg1m8rgKMgQZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x/VkJDKvRwJ+qDbezBGZ4EAcxAnQeHrUS0YtzNe55OQ=;
        b=Vr1lGdxrq5ZfRV7QXJ5DlSffcyy58plk4rbZSNF6w1xAK6YST22YxtLzjxPnqRcWRS
         N1H8U4pOgNqQfVODOysQdlWfXFR65mb939+ztMeOCMyB+sUcHbKWAFMhr4b3YZeQcSMN
         LYY0yjnujfBM6qepa5NeXksVgzOT8Mg2nv6LbximXtdwzODns7jEgdgE0mlYU+ijFHbH
         Obg5HZ2PYhUwsuL9GPbd+Zu+b/69QyXh/2Tx8MXCARhvwEmpbGM2HnStIsP44o20UnHL
         3WD0ih96ihgdu2Fk2PE9tzUkMFV9BctfGQZEkHkXh4K5nu5OyfdL+NH54WdQcONWM1fg
         3HCg==
X-Gm-Message-State: ANhLgQ2byHsjKvDCGAzDrpJW0Uu0LlO9PKQrXAotuNHfj+al27eDKumU
        ruIYFrw0dE6O3LWQdAh/NmrtnoljEXw=
X-Google-Smtp-Source: ADFU+vu8hldfM2EKt5+cda9oGvxVxiii8AyiKBiF5l/nk1EtMXn5mKeE+ssGg+sLo52laxV8KGalFA==
X-Received: by 2002:a05:6102:85:: with SMTP id t5mr11528827vsp.134.1583797363040;
        Mon, 09 Mar 2020 16:42:43 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id o36sm9798504uao.15.2020.03.09.16.42.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2020 16:42:42 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id a1so1745650vko.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 16:42:41 -0700 (PDT)
X-Received: by 2002:a1f:97c8:: with SMTP id z191mr10591470vkd.0.1583797361399;
 Mon, 09 Mar 2020 16:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org> <1583746236-13325-4-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1583746236-13325-4-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Mar 2020 16:42:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xkqquyk907zAE-v7_QK_dOSmn1ooTzuXxP5Fckmhaw+Q@mail.gmail.com>
Message-ID: <CAD=FV=Xkqquyk907zAE-v7_QK_dOSmn1ooTzuXxP5Fckmhaw+Q@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] soc: qcom: rpmh: Invalidate SLEEP and WAKE TCSes
 before flushing new data
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
> TCSes have previously programmed data when rpmh_flush is called.
> This can cause old data to trigger along with newly flushed.
>
> Fix this by cleaning SLEEP and WAKE TCSes before new data is flushed.
>
> With this there is no need to invoke rpmh_rsc_invalidate() call from
> rpmh_invalidate().
>
> Simplify rpmh_invalidate() by moving invalidate_batch() inside.
>
> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index 03630ae..5bed8f4 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -317,19 +317,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>         return ret;
>  }
>
> -static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
> -{
> -       struct batch_cache_req *req, *tmp;
> -       unsigned long flags;
> -
> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> -       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
> -               kfree(req);
> -       INIT_LIST_HEAD(&ctrlr->batch_cache);
> -       ctrlr->dirty = true;
> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> -}
> -
>  /**
>   * rpmh_write_batch: Write multiple sets of RPMH commands and wait for the
>   * batch to finish.
> @@ -467,6 +454,11 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>                 return 0;
>         }
>
> +       /* Invalidate the TCSes first to avoid stale data */
> +       do {
> +               ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
> +       } while (ret == -EAGAIN);
> +

You forgot to actually check the return value.

if (ret)
  return ret;


>         /* First flush the cached batch requests */
>         ret = flush_batch(ctrlr);
>         if (ret)
> @@ -503,19 +495,21 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>   *
>   * @dev: The device making the request
>   *
> - * Invalidate the sleep and active values in the TCS blocks.
> + * Invalidate the sleep and wake values in batch_cache.

Thanks for updating this.  It was on my todo list.  Can you also
update the function description, which still says "Invalidate all
sleep and active sets sets."  While you're at it, remove the double
"sets".

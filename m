Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AEBB1741AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 22:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgB1Vu5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 16:50:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37130 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgB1Vu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 16:50:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id q23so4989816ljm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fXH0XTxwssZu/l+4X5oAuR9SqggcCROpsGbcXwJvrqA=;
        b=mW96jfeglAZLByoAMZs51HsXxurOLdnvn7/kJk4cPKSvtrtzEcwPh/WcuUR/n4ZimP
         gJ1STaJE3Z4gZgXPb6McgLe7AtbFfpPrQQIJRswAqfL3U5p+fCb50cCBBaX2x24doKSG
         Jg3CW6nijHV9T+v2JiW7idDsQD33C1YopjdVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXH0XTxwssZu/l+4X5oAuR9SqggcCROpsGbcXwJvrqA=;
        b=sDfJPY63+a9v15TRbXIOGoDOsnatslm5Th6O8YXKbO78RekJjgGISWOFT3Ib8RvAvR
         j9bTEc6OFaM4sjdO6P0FuwVvdczd8CjFWINvpHEr0z0pj4QdRMv1KqFCSAUUFM7H9+os
         iXhdN02gzGGWwnXmOli+qvpJBYQa+bZ71zsY12A1adwNYx2YCPDFJ1fHfEbPrUeKzlAO
         u5egMO6Dfjhe8NWOKKQtFmo8VjLjeOXdK2PUjqBECQa7p3UhP1DLQxSfut000cXzKKI0
         x0841c+4mHl2fKM/qEf1voxpFWR4yHdBzoxrUJSB+O4Eh57a7bswb3lXhtSgpeYhesXn
         6w6w==
X-Gm-Message-State: ANhLgQ3tNrlog2GXjzVOxumhEkK7gJC3Pc9OQ3F2wBaReTXtCDzCz3YM
        RTie29C+DJqUBRBFDwEpXeFU4vwQA7M=
X-Google-Smtp-Source: ADFU+vttByyiS9wm7FUUlMEJ2FVk07MQRTtjleS/FBS1+silgaXPGZCBLOvsb7Jh3E0Ixa4O6PlpNA==
X-Received: by 2002:a05:651c:502:: with SMTP id o2mr4231274ljp.150.1582926654572;
        Fri, 28 Feb 2020 13:50:54 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id x8sm4025485lfa.75.2020.02.28.13.50.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2020 13:50:53 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id w22so2180624lfk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 13:50:53 -0800 (PST)
X-Received: by 2002:a19:c611:: with SMTP id w17mr3806178lff.59.1582926652932;
 Fri, 28 Feb 2020 13:50:52 -0800 (PST)
MIME-Version: 1.0
References: <1582889903-12890-1-git-send-email-mkshah@codeaurora.org> <1582889903-12890-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1582889903-12890-3-git-send-email-mkshah@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 28 Feb 2020 13:50:16 -0800
X-Gmail-Original-Message-ID: <CAE=gft5aOtOx6MyuNuv3ebc6ZHmG_W3i0EA3HJjKceYMr7Nx3A@mail.gmail.com>
Message-ID: <CAE=gft5aOtOx6MyuNuv3ebc6ZHmG_W3i0EA3HJjKceYMr7Nx3A@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] soc: qcom: rpmh: Update dirty flag only when data changes
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

On Fri, Feb 28, 2020 at 3:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
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
>  drivers/soc/qcom/rpmh.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index eb0ded0..f28afe4 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -133,26 +133,30 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>
>         req->addr = cmd->addr;
>         req->sleep_val = req->wake_val = UINT_MAX;
> -       INIT_LIST_HEAD(&req->list);
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

Is this fixing a case where we were not previously marking the
controller dirty but should have? I notice there's a fixes tag, but it
would be helpful to add something to the commit text indicating that
you're fixing a missing case where the controller should have been
marked dirty. With that fixed, you can add my tag:

Reviewed-by: Evan Green <evgreen@chromium.org>

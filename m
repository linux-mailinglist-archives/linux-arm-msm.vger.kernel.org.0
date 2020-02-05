Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83F6152416
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 01:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbgBEAcH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 19:32:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39560 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgBEAcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 19:32:06 -0500
Received: by mail-lf1-f66.google.com with SMTP id t23so168592lfk.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 16:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FOrKuN0ED2H3+K7/MfL1jj30xOUJqnID7Rv6ou7TKFY=;
        b=VEKzGAYhTb7M/mx+Guc5+woSDVaydZ5An3TOikWW3R1znjKO87uULt/b6/1PZFjpU0
         QwEzhypIiQ/YDXIOpxfBEZVMPN6uvKBU22thp2ABFii1yC6O71wxAXGexpqMWKjBLskb
         1y/pmrlsM03ytGkalYQ8xOVCqcjNRu2oT+qkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOrKuN0ED2H3+K7/MfL1jj30xOUJqnID7Rv6ou7TKFY=;
        b=AVMSodRm3jz1P5974KKqA4ltV11xcvktGIrvnQ9dRZS3zBw+PA58utuRd0MPLpMsI/
         /Zsapw1ZmvkXbXica0ZOk3VfJ0mwj6X/eL5kCoJ8TdOalwxtfBtSawLNoWIP+n/nSRjv
         s/LMeLWXeOtT8XYR+Kb11bxJei0afJbQPR6045mgrlczwERzsNW745sYo5G9hdQTN+Wk
         CD7FAdQwiofhUjmcO+2F98PYnksqI7mBjcxtkR3EZjV+jm5vTsGusAs1s9sFO5caNpTC
         IPACxNKgx4KNpRwkYx7pbkgAN2no/cioR9XVx9Yo3IiJaVNWORV3zmw3ESL4VsZ4GHCA
         YVMw==
X-Gm-Message-State: APjAAAUHOZfn6c7g2eFrBeS2nZSm2IFst/Lj7TOMVey21QF599i1sr/q
        gUFZMoPcAlHp9wTnKpFh2WC0AIq6p3E=
X-Google-Smtp-Source: APXvYqzlKy3sq1h0c3DeScI+Q243vhUDa6/R9YsIIiaJOZFNeC9dfwX6jKTXlNYHCaswvEfQ2pwqKA==
X-Received: by 2002:a19:22cc:: with SMTP id i195mr15464173lfi.148.1580862724409;
        Tue, 04 Feb 2020 16:32:04 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 126sm11236425lfm.38.2020.02.04.16.32.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 16:32:03 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id f25so493355ljg.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 16:32:03 -0800 (PST)
X-Received: by 2002:a2e:8702:: with SMTP id m2mr18879289lji.278.1580862722808;
 Tue, 04 Feb 2020 16:32:02 -0800 (PST)
MIME-Version: 1.0
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org> <1580796831-18996-3-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1580796831-18996-3-git-send-email-mkshah@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 4 Feb 2020 16:31:26 -0800
X-Gmail-Original-Message-ID: <CAE=gft7gPS+hhnDP+uTn3is6s9=Nspbb4PL0bZ025Tq1Zpth8Q@mail.gmail.com>
Message-ID: <CAE=gft7gPS+hhnDP+uTn3is6s9=Nspbb4PL0bZ025Tq1Zpth8Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: qcom: rpmh: Update rpm_msgs offset address and
 add list_del
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> rpm_msgs are copied in continuously allocated memory during write_batch.
> Update request pointer to correctly point to designated area for rpm_msgs.
>
> While at this also add missing list_del before freeing rpm_msgs.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index c3d6f00..04c7805 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -65,7 +65,7 @@ struct cache_req {
>  struct batch_cache_req {
>         struct list_head list;
>         int count;
> -       struct rpmh_request rpm_msgs[];
> +       struct rpmh_request *rpm_msgs;
>  };
>
>  static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
> @@ -327,8 +327,10 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>         unsigned long flags;
>
>         spin_lock_irqsave(&ctrlr->cache_lock, flags);
> -       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list) {
> +               list_del(&req->list);
>                 kfree(req);
> +       }
>         INIT_LIST_HEAD(&ctrlr->batch_cache);

Hm, I don't get it. list_for_each_entry_safe ensures you can traverse
the list while freeing it behind you. ctrlr->batch_cache is now a
bogus list, but is re-inited with the lock held. From my reading,
there doesn't seem to be anything wrong with the current code. Can you
elaborate on the bug you found?

>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>  }
> @@ -377,10 +379,11 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>                 return -ENOMEM;
>
>         req = ptr;
> +       rpm_msgs = ptr + sizeof(*req);
>         compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
>
>         req->count = count;
> -       rpm_msgs = req->rpm_msgs;
> +       req->rpm_msgs = rpm_msgs;

I don't really understand what this is fixing either, can you explain?

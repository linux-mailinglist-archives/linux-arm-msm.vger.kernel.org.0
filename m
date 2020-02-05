Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 751721537DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 19:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgBESWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 13:22:06 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41718 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgBESWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 13:22:05 -0500
Received: by mail-lf1-f65.google.com with SMTP id m30so2184001lfp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYSq2gM0rxvbmer1jk84xhZ3+qMB/quMixgOKAh7Q9E=;
        b=Z0ShGgYBzv9MqLGK+lDZ3hvGS5qTENbW1JXO05EKWQZuZetpcDYVGGVN7l+G4akJO8
         5e7m6Du4pK1vyp8UKVSQRLOHxisKBQGV+mtKzKCAKh1UAPKL78ueLGukubKe7K1nSwav
         9WR1ZoHQtd6YZlovje7nP9OxYEqpJ9EzHrwbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYSq2gM0rxvbmer1jk84xhZ3+qMB/quMixgOKAh7Q9E=;
        b=Cr7DJ0Xs9D0nrFk1mOmhh6NHmOkCIKiekqZr//cTQLDhGlmcwktInZ0BOlKgjiyZQz
         6e4PmpnZsJzTfP4UCvZJnMZ5ReNm/eI4mbkt7ywgP+4xptwTxWewWRQGCzU8Fp8S+80/
         5gJVHAgClYLA6acjKiUOQGV3tqt3hskXKrOmdYCx0U23r9PLpkMYe24s+psOSlR5SDSL
         SpWN8u1jL5/5Jb1Snl6IFssqC50bqTwYFUJEh8aItnIlxopoYnxULXNu1LV+niwEDP+k
         ju+XD4Ojl5gQRn9h/og6aJS5h3jXpMtA5+Vlh1GZGUQIYtMSxnxQ+aeWoHbU2mXDs928
         ABXg==
X-Gm-Message-State: APjAAAWTZj1BKwBv9TQ4fLE+CytIlS7UBvWr8I9IQ1werqfEGpO+nlym
        CuP1VGXwyiNIJB3S1BC/4ZumXkLrGms=
X-Google-Smtp-Source: APXvYqyDsABcrGDUj2axmYqjg0PTYTDenQ4stdtc1BWNXSs0ZgylvWnXGXDUICQx1K/GggcSRsN1IA==
X-Received: by 2002:a19:4208:: with SMTP id p8mr18815512lfa.160.1580926922921;
        Wed, 05 Feb 2020 10:22:02 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id r26sm114692lfm.82.2020.02.05.10.22.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 10:22:02 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id n25so2207005lfl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2020 10:22:02 -0800 (PST)
X-Received: by 2002:a19:c205:: with SMTP id l5mr18227021lfc.159.1580926921198;
 Wed, 05 Feb 2020 10:22:01 -0800 (PST)
MIME-Version: 1.0
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org>
 <1580796831-18996-3-git-send-email-mkshah@codeaurora.org> <CAE=gft7gPS+hhnDP+uTn3is6s9=Nspbb4PL0bZ025Tq1Zpth8Q@mail.gmail.com>
 <7db81eed-d46d-8131-f471-6f57c0335ace@codeaurora.org>
In-Reply-To: <7db81eed-d46d-8131-f471-6f57c0335ace@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 5 Feb 2020 10:21:24 -0800
X-Gmail-Original-Message-ID: <CAE=gft6zEKYoMabmRbO55BSAt-4oOuwRRZZD6BcSbe7Xp15Vnw@mail.gmail.com>
Message-ID: <CAE=gft6zEKYoMabmRbO55BSAt-4oOuwRRZZD6BcSbe7Xp15Vnw@mail.gmail.com>
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

On Tue, Feb 4, 2020 at 9:12 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>
> On 2/5/2020 6:01 AM, Evan Green wrote:
> > On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> >> rpm_msgs are copied in continuously allocated memory during write_batch.
> >> Update request pointer to correctly point to designated area for rpm_msgs.
> >>
> >> While at this also add missing list_del before freeing rpm_msgs.
> >>
> >> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >> ---
> >>   drivers/soc/qcom/rpmh.c | 9 ++++++---
> >>   1 file changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> >> index c3d6f00..04c7805 100644
> >> --- a/drivers/soc/qcom/rpmh.c
> >> +++ b/drivers/soc/qcom/rpmh.c
> >> @@ -65,7 +65,7 @@ struct cache_req {
> >>   struct batch_cache_req {
> >>          struct list_head list;
> >>          int count;
> >> -       struct rpmh_request rpm_msgs[];
> >> +       struct rpmh_request *rpm_msgs;
> >>   };
> >>
> >>   static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
> >> @@ -327,8 +327,10 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
> >>          unsigned long flags;
> >>
> >>          spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >> -       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
> >> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list) {
> >> +               list_del(&req->list);
> >>                  kfree(req);
> >> +       }
> >>          INIT_LIST_HEAD(&ctrlr->batch_cache);
> > Hm, I don't get it. list_for_each_entry_safe ensures you can traverse
> > the list while freeing it behind you. ctrlr->batch_cache is now a
> > bogus list, but is re-inited with the lock held. From my reading,
> > there doesn't seem to be anything wrong with the current code. Can you
> > elaborate on the bug you found?
>
> Hi Evan,
>
> when we don't do list_del, there might be access to already freed memory.
> Even after current item free via kfree(req), without list_del, the next
> and prev item's pointer are still pointing to this freed region.
> it seem best to call list_del to ensure that before freeing this area,
> no other item in list refer to this.

I don't think that's true. the "_safe" part of
list_for_each_entry_safe ensures that we don't touch the ->next member
of any node after freeing it. So I don't think there's any case where
we could touch freed memory. The list_del still seems like needless
code to me.

>
> >
> >>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >>   }
> >> @@ -377,10 +379,11 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
> >>                  return -ENOMEM;
> >>
> >>          req = ptr;
> >> +       rpm_msgs = ptr + sizeof(*req);
> >>          compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
> >>
> >>          req->count = count;
> >> -       rpm_msgs = req->rpm_msgs;
> >> +       req->rpm_msgs = rpm_msgs;
> > I don't really understand what this is fixing either, can you explain?
> the continous memory allocated via below is for 3 items,
>
> ptr = kzalloc(sizeof(*req) + count * (sizeof(req->rpm_msgs[0]) +
> sizeof(*compls)), GFP_ATOMIC);
>
> 1. batch_cache_req,  followed by
> 2. total count of rpmh_request,  followed by
> 3. total count of compls
>
> current code starts using (3) compls from proper offset in memory
>          compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
>
> however for (2) rpmh_request it does
>
>          rpm_msgs = req->rpm_msgs;
>
> because of this it starts 8 byte before its designated area and overlaps
> with (1) batch_cache_req struct's last entry.
> this patch corrects it via below to ensure rpmh_request uses correct
> start address in memory.
>
>          rpm_msgs = ptr + sizeof(*req);

I don't follow that either. The empty array declaration (or the
GCC-specific version of it would be  "struct rpmh_request
rpm_msgs[0];") is a flexible array member, meaning the member itself
doesn't take up any space in the struct. So, for instance, it holds
true that &(req->rpm_msgs[0]) == (req + 1). By my reading the existing
code is correct, and your patch just adds a needless pointer
indirection. Check out this wikipedia entry:

https://en.wikipedia.org/wiki/Flexible_array_member

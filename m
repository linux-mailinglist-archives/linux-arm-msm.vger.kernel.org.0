Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95662166C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 02:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgBUBF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 20:05:59 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45628 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729419AbgBUBF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 20:05:59 -0500
Received: by mail-lj1-f195.google.com with SMTP id e18so395519ljn.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 17:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMbaRhE8Xlg+e8gfJFL0zQMEcgClDiX27cTjJlb40Bc=;
        b=YSkqVb73r5DSVqQkay/Ui5BWA0DyeR/AuYz0xcCx9V88M+7gS80kZ1UCA2rTjEylfE
         iBFCpuLDoiJCoqCTbAbVyRibf9vYvC/5h1aifNOiOq2CA/wu+sHybJA5FDBgJjsNQ2jA
         g0IcuArCwGqX+OTG4kKIV/CazBMvVN9wGuVl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMbaRhE8Xlg+e8gfJFL0zQMEcgClDiX27cTjJlb40Bc=;
        b=KPuFUqUevQGrPmV+sQzlCMgv+UgHAdgakTknck0THINJmCuCmuVIXjquL+qFDXn4l1
         bMJAX97Hg17+y4RGMyPWn8jGxbhkUUQPkNOVn9hi+lggxhknMUvMAS+/5FvcUDIm8zhK
         vlas9DogQ1R5rDIHYO1bP43PaoWF+sC1yqtBldJI/cHyqlLgJpV3t51uRn63d3xkdCgK
         8e3Dwd5y3AJMDyVJkWc5FNFJgpv9duJdKTC7d6bCwI2c54XyvJfk6q36ETgni1trC3CW
         IHNS+LtdR83xF2n4A4HtAcpS46QUQvjNp7Hy9up+3UWL+NfewzGpfInpcQ+nvnIREy6U
         PE8Q==
X-Gm-Message-State: APjAAAWK9eLGTkKT78DZ4hIHD+x2tAxrxioDNTGi0kT400ws/TC0Gx4o
        lM+rgr6l1LyDi6wQ27mN1dRpoCuvf2A=
X-Google-Smtp-Source: APXvYqye7VWhFHSTpiTRtVrdWQDyTfaJWx1JnE0/01qKka3ojUur+unEZRRk+QdJwT40BxLwbLdiUw==
X-Received: by 2002:a2e:761a:: with SMTP id r26mr20864133ljc.135.1582247156349;
        Thu, 20 Feb 2020 17:05:56 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id l22sm571391ljb.2.2020.02.20.17.05.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 17:05:54 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id b15so228236lfc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 17:05:54 -0800 (PST)
X-Received: by 2002:ac2:523c:: with SMTP id i28mr18016930lfl.104.1582247153877;
 Thu, 20 Feb 2020 17:05:53 -0800 (PST)
MIME-Version: 1.0
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org>
 <1580796831-18996-3-git-send-email-mkshah@codeaurora.org> <CAE=gft7gPS+hhnDP+uTn3is6s9=Nspbb4PL0bZ025Tq1Zpth8Q@mail.gmail.com>
 <7db81eed-d46d-8131-f471-6f57c0335ace@codeaurora.org> <CAE=gft6zEKYoMabmRbO55BSAt-4oOuwRRZZD6BcSbe7Xp15Vnw@mail.gmail.com>
 <8914a4c0-db3c-371c-d875-afd4b3b6870c@codeaurora.org>
In-Reply-To: <8914a4c0-db3c-371c-d875-afd4b3b6870c@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Thu, 20 Feb 2020 17:05:15 -0800
X-Gmail-Original-Message-ID: <CAE=gft6GMQa=fbTF=zrPyy48RdgbNgwZYM36O6iFdzrATG+LYA@mail.gmail.com>
Message-ID: <CAE=gft6GMQa=fbTF=zrPyy48RdgbNgwZYM36O6iFdzrATG+LYA@mail.gmail.com>
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

On Wed, Feb 12, 2020 at 4:15 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> On 2/5/2020 11:51 PM, Evan Green wrote:
> > On Tue, Feb 4, 2020 at 9:12 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> >>
> >> On 2/5/2020 6:01 AM, Evan Green wrote:
> >>> On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
> >>>> rpm_msgs are copied in continuously allocated memory during write_batch.
> >>>> Update request pointer to correctly point to designated area for rpm_msgs.
> >>>>
> >>>> While at this also add missing list_del before freeing rpm_msgs.
> >>>>
> >>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >>>> ---
> >>>>    drivers/soc/qcom/rpmh.c | 9 ++++++---
> >>>>    1 file changed, 6 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> >>>> index c3d6f00..04c7805 100644
> >>>> --- a/drivers/soc/qcom/rpmh.c
> >>>> +++ b/drivers/soc/qcom/rpmh.c
> >>>> @@ -65,7 +65,7 @@ struct cache_req {
> >>>>    struct batch_cache_req {
> >>>>           struct list_head list;
> >>>>           int count;
> >>>> -       struct rpmh_request rpm_msgs[];
> >>>> +       struct rpmh_request *rpm_msgs;
> >>>>    };
> >>>>
> >>>>    static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
> >>>> @@ -327,8 +327,10 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
> >>>>           unsigned long flags;
> >>>>
> >>>>           spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >>>> -       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
> >>>> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list) {
> >>>> +               list_del(&req->list);
> >>>>                   kfree(req);
> >>>> +       }
> >>>>           INIT_LIST_HEAD(&ctrlr->batch_cache);
> >>> Hm, I don't get it. list_for_each_entry_safe ensures you can traverse
> >>> the list while freeing it behind you. ctrlr->batch_cache is now a
> >>> bogus list, but is re-inited with the lock held. From my reading,
> >>> there doesn't seem to be anything wrong with the current code. Can you
> >>> elaborate on the bug you found?
> >> Hi Evan,
> >>
> >> when we don't do list_del, there might be access to already freed memory.
> >> Even after current item free via kfree(req), without list_del, the next
> >> and prev item's pointer are still pointing to this freed region.
> >> it seem best to call list_del to ensure that before freeing this area,
> >> no other item in list refer to this.
> > I don't think that's true. the "_safe" part of
> > list_for_each_entry_safe ensures that we don't touch the ->next member
> > of any node after freeing it. So I don't think there's any case where
> > we could touch freed memory. The list_del still seems like needless
> > code to me.
>
> Hmm, ok. i can drop list_del.
>
> see the reason below to include list_del.
>
> >>>>           spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >>>>    }
> >>>> @@ -377,10 +379,11 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
> >>>>                   return -ENOMEM;
> >>>>
> >>>>           req = ptr;
> >>>> +       rpm_msgs = ptr + sizeof(*req);
> >>>>           compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
> >>>>
> >>>>           req->count = count;
> >>>> -       rpm_msgs = req->rpm_msgs;
> >>>> +       req->rpm_msgs = rpm_msgs;
> >>> I don't really understand what this is fixing either, can you explain?
> >> the continous memory allocated via below is for 3 items,
> >>
> >> ptr = kzalloc(sizeof(*req) + count * (sizeof(req->rpm_msgs[0]) +
> >> sizeof(*compls)), GFP_ATOMIC);
> >>
> >> 1. batch_cache_req,  followed by
> >> 2. total count of rpmh_request,  followed by
> >> 3. total count of compls
> >>
> >> current code starts using (3) compls from proper offset in memory
> >>           compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
> >>
> >> however for (2) rpmh_request it does
> >>
> >>           rpm_msgs = req->rpm_msgs;
> >>
> >> because of this it starts 8 byte before its designated area and overlaps
> >> with (1) batch_cache_req struct's last entry.
> >> this patch corrects it via below to ensure rpmh_request uses correct
> >> start address in memory.
> >>
> >>           rpm_msgs = ptr + sizeof(*req);
> > I don't follow that either. The empty array declaration (or the
> > GCC-specific version of it would be  "struct rpmh_request
> > rpm_msgs[0];") is a flexible array member, meaning the member itself
> > doesn't take up any space in the struct. So, for instance, it holds
> > true that &(req->rpm_msgs[0]) == (req + 1). By my reading the existing
> > code is correct, and your patch just adds a needless pointer
> > indirection. Check out this wikipedia entry:
> >
> > https://en.wikipedia.org/wiki/Flexible_array_member
> Thanks Evan,
>
> Agree that code works even without this.
>
> However from the same wiki,
>
>  >>It is common to allocate sizeof(struct) + array_len*sizeof(array
> element) bytes.
>
>  >>This is not wrong, however it may allocate a few more bytes than
> necessary:
>
> this is what i wanted to convery above, currently it allocated 8 more
> bytes than necessary.
>
> The reason for the change was one use after free reported in rpmh driver.
>
> After including this change, we have not seen this reported again.

Hm, I would not expect that an allocaton of too many bytes would
result in a use-after-free warning. If you still have the warning and
are able to share it, I'm happy to take a look.

>
> I can drop this change in new revision if we don't want it.

Yes, let's drop it for now.
-Evan

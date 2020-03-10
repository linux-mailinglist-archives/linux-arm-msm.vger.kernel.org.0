Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC1F118023E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgCJPqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:46:49 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:42297 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgCJPqt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:46:49 -0400
Received: by mail-vk1-f193.google.com with SMTP id e20so3314066vke.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zf61j0iV1BoTbcwhHQe3SJ8F2eJXo+6FDC8kLN28d8g=;
        b=eN49RWB7vX6naiAn7F/nXVFP1zephsuQ4Oi4IR+RPhQXbi7iYxNk8k9d+p4NYzeYGQ
         UIFg2YV0sx7B10UUyPTNc7fXsKFlG/yexDkIOc92nGIBK5UP7rbnAwZ4Dv6FBzzpRmEL
         cDI6hm2FDPvVoR1WJ2K3X54r0yMYi3nHfkGY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zf61j0iV1BoTbcwhHQe3SJ8F2eJXo+6FDC8kLN28d8g=;
        b=slXTMwBrt4LpiG7u2Z84mhPga0p2rTOui/+4x6lzfzI2Vu7h/H2PZzLPvedYdBKeUe
         guMPlj8gjXZU6VUiftPi/j5vuuNBcU1UVK6akgUxPsItHQ4oJPnj3lGWXWn7TnGOCl+3
         MN1nvVk1HAUsvsZZsRM6RtmtjD1r8feqLq8+p0lOdvfU1HrRT32v/0uFpL8DhIRFmPcq
         RiEVg42bcJK3Lq82NGP1NtVE86w+njKcgm0tXs1MOke4hPUX6YT/OG/zm/3KmWQlohyf
         AH4konWLYMDTol4wezWlB/yoQ+PFDOweUBbEsCakJgD8Cye8IN2Hng2EB49D/VAyuUT5
         aatg==
X-Gm-Message-State: ANhLgQ3Xj0Vfgi1uwaxkrlPbkhlnjxxB4KMnW/8tUjn3pnD4deQqhvlF
        H3Go4u1dFOGowjK6bMpjxpih9JF6ceI=
X-Google-Smtp-Source: ADFU+vudNtBUvmdxZOWTXmds19UowrE34i+tYTRR0JPsf9vKjzKbLK7+98gdBm6gP1zTcr8z1rIeng==
X-Received: by 2002:a1f:310d:: with SMTP id x13mr12684035vkx.38.1583855206263;
        Tue, 10 Mar 2020 08:46:46 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id c206sm2427159vkc.0.2020.03.10.08.46.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 08:46:43 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id o24so5234147vsp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:46:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2dc:: with SMTP id h28mr13662345vsh.169.1583855202770;
 Tue, 10 Mar 2020 08:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <1583746236-13325-1-git-send-email-mkshah@codeaurora.org>
 <1583746236-13325-5-git-send-email-mkshah@codeaurora.org> <CAD=FV=VknUHs8R6pu3pBCR-D50ibeuSVVp9=_t7NLa4U+06XKQ@mail.gmail.com>
 <8810b558-f552-19dc-a5dc-4e64b37f35d8@codeaurora.org>
In-Reply-To: <8810b558-f552-19dc-a5dc-4e64b37f35d8@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Mar 2020 08:46:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XajZ5V_uZryghaBkH=4jv4T-ifuQE2NKbU4RgNVho_9A@mail.gmail.com>
Message-ID: <CAD=FV=XajZ5V_uZryghaBkH=4jv4T-ifuQE2NKbU4RgNVho_9A@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Mar 10, 2020 at 4:19 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
>
> On 3/10/2020 5:13 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Mar 9, 2020 at 2:31 AM Maulik Shah <mkshah@codeaurora.org> wrot=
e:
> >> Add changes to invoke rpmh flush() from within cache_lock when the dat=
a in
> >> cache is dirty.
> >>
> >> Introduce two new APIs for this. Clients can use rpmh_start_transactio=
n()
> >> before any rpmh transaction once done invoke rpmh_end_transaction() wh=
ich
> >> internally invokes rpmh_flush() if the caches has become dirty.
> >>
> >> Add support to control this with flush_dirty flag.
> >>
> >> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> >> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
> >> ---
> >>  drivers/soc/qcom/rpmh-internal.h |  4 +++
> >>  drivers/soc/qcom/rpmh-rsc.c      |  6 +++-
> >>  drivers/soc/qcom/rpmh.c          | 64 +++++++++++++++++++++++++++++++=
+--------
> >>  include/soc/qcom/rpmh.h          | 10 +++++++
> >>  4 files changed, 71 insertions(+), 13 deletions(-)
> > As mentioned previously but not addressed [3], I believe your series
> > breaks things if there are zero ACTIVE TCSs and you're using the
> > immediate-flush solution.  Specifically any attempt to set something's
> > "active" state will clobber the sleep/wake.  I believe this is hard to
> > fix, especially if you want rpmh_write_async() to work properly and
> > need to be robust to the last man going down while rpmh_write_async()
> > is running but hasn't finished.  My suggestion was to consider it to
> > be an error at probe time for now.
> >
> > Actually, though, I'd be super surprised if the "active =3D=3D 0" case
> > works anyway.  Aside from subtle problems of not handling -EAGAIN (see
> > another previous message that you didn't respond to [2]), I think
> > you'll also get failures because you never enable interrupts in
> > RSC_DRV_IRQ_ENABLE for anything other than the ACTIVE_TCS.  Thus
> > you'll never get interrupts saying when your transactions on the
> > borrowed "wake" TCS finish.
>
> No, it shouldn=E2=80=99t effect even with "non-OSI-mode + 0 ACTIVE TCS"
>
> i just replied on v9, pasting same on v13 as well.
>
> After taking your suggestion to do rpmh start/end transaction() in v13, r=
pmh_end_transaction()
> invokes rpmh_flush() only for the last client and by this time expecting =
all of rpmh_write()
> and rpmh_write_batch() will be already =E2=80=9Cfinished=E2=80=9D as clie=
nt first waits for them to finish
> and then only invokes end.
>
> So driver is good to handle rpmh_write() and rpmh_write_batch() calls.

Ah, right.  In the previous version of the patch it was a problem
because you flushed in cache_rpm_request() and then clobbered it right
away in __rpmh_write() when you did rpmh_rsc_send_data().  With v13
that is not the case anymore.  So this case should be OK.


> Regarding rpmh_write_async() call, which is a fire-n-forget request from =
SW and client driver
> may immediately invoke rpmh_end_transaction() after this.
>
> this case is also handled properly=E2=80=A6
> Lets again take an example for understanding this..
>
> 1.    Client invokes rpmh_write_async() to send ACTIVE cmds for targets w=
hich has zero ACTIVE TCS
>
>     Rpmh driver Re-purposes one of SLEEP/WAKE TCS to use as ACTIVE, inter=
nally this also sets
>     drv->tcs_in_use to true for respective SLEEP/WAKE TCS.
>
> 2.    Client now without waiting for above to finish, goes ahead and invo=
kes rpmh_end_transaction()
>     which calls rpmh_flush() (in case cache become dirty)

I guess we'd have to confirm that there's no way for the cache to
_not_ become dirty but you do an "active" transaction.  Let's imagine
this case:

start transaction
rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x11);
rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99);
end transaction

start transaction
rpmh_write(RPMH_ACTIVE_ONLY_STATE, addr=3D0x10, data=3D0x99);
rpmh_write(RPMH_SLEEP_STATE, addr=3D0x10, data=3D0x11);
rpmh_write(RPMH_WAKE_ONLY_STATE, addr=3D0x10, data=3D0x99);
end transaction

In other words the client does the same sequence twice in a row with
no change in data.  After the first set I think you'd be fine.  ...but
after the second set you'll be in trouble.  That's because none of the
calls in the second set would cause the "dirty" to be set.  ...but for
"active only" calls we don't have any sort of cache--we just fire it
off.  When we fire off the active only we'll clobber the sleep/wake
TCS.  ...and then nothing will write them again because the cache
isn't dirty.


>     Now if re-purposed TCS is still in use in HW (transaction in progress=
), we still have
>     drv->tcs_in_use set. So the rpmh_rsc_invalidate() (invoked from rpmh_=
flush()) will keep on
>     returning -EAGAIN until that TCS becomes free to use and then goes ah=
ead to finish its job.

Ah, interesting.  I still think you have problems I pointed out in
another response because you never enable interrupts for the "WAKE
TCS", but I can see how this could be made to work.  In this case
"async" becomes a little silly here because the flush will essentially
be forced to wait until the transaction is totally done (so the TCS is
free again), but it should be able to work.  This might actually point
out something that needs to be changed in my "clean up" series since I
guess "tcs_in_use" could sometimes be present in a wake TCS now.


> >> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> >> index e278fc1..b6391e1 100644
> >> --- a/drivers/soc/qcom/rpmh-rsc.c
> >> +++ b/drivers/soc/qcom/rpmh-rsc.c
> >> @@ -61,6 +61,8 @@
> >>  #define CMD_STATUS_ISSUED              BIT(8)
> >>  #define CMD_STATUS_COMPL               BIT(16)
> >>
> >> +#define FLUSH_DIRTY                    1
> >> +
> >>  static u32 read_tcs_reg(struct rsc_drv *drv, int reg, int tcs_id, int=
 cmd_id)
> >>  {
> >>         return readl_relaxed(drv->tcs_base + reg + RSC_DRV_TCS_OFFSET =
* tcs_id +
> >> @@ -670,13 +672,15 @@ static int rpmh_rsc_probe(struct platform_device=
 *pdev)
> >>         INIT_LIST_HEAD(&drv->client.cache);
> >>         INIT_LIST_HEAD(&drv->client.batch_cache);
> >>
> >> +       drv->client.flush_dirty =3D device_get_match_data(&pdev->dev);
> >> +
> >>         dev_set_drvdata(&pdev->dev, drv);
> >>
> >>         return devm_of_platform_populate(&pdev->dev);
> >>  }
> >>
> >>  static const struct of_device_id rpmh_drv_match[] =3D {
> >> -       { .compatible =3D "qcom,rpmh-rsc", },
> >> +       { .compatible =3D "qcom,rpmh-rsc", .data =3D (void *)FLUSH_DIR=
TY },
> > Ick.  This is just confusing.  IMO better to set
> > 'drv->client.flush_dirty =3D true' directly in probe with a comment
> > saying that it could be removed if we had OSI.
> Done.
> i will keep this bit earlier in probe with commet, so later if we detect =
rsc to be in hierarchy
> from [1], we can override this to be 0 within rpmh_probe_power_domain().
>
> [1] https://patchwork.kernel.org/patch/11391229/

I don't really understand, but maybe it'll be obvious when I see the code.



> > ...and while you're at it, why not fire off a separate patch (not in
> > your series) adding the stub to 'include/linux/psci.h'.  Then when we
> > revisit this in a year it'll be there and it'll be super easy to set
> > the value properly.
>
> With above approch to set it in probe accordingly PSCI change won't be re=
quired.
>
> it will be simple, cleaner and without any resistance from PSCI perspecti=
ve.
>
> >
> >>         { }
> >>  };
> >>
> >> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> >> index 5bed8f4..9d40209 100644
> >> --- a/drivers/soc/qcom/rpmh.c
> >> +++ b/drivers/soc/qcom/rpmh.c
> >> @@ -297,12 +297,10 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
> >>  {
> >>         struct batch_cache_req *req;
> >>         const struct rpmh_request *rpm_msg;
> >> -       unsigned long flags;
> >>         int ret =3D 0;
> >>         int i;
> >>
> >>         /* Send Sleep/Wake requests to the controller, expect no respo=
nse */
> >> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >>         list_for_each_entry(req, &ctrlr->batch_cache, list) {
> >>                 for (i =3D 0; i < req->count; i++) {
> >>                         rpm_msg =3D req->rpm_msgs + i;
> >> @@ -312,7 +310,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
> >>                                 break;
> >>                 }
> >>         }
> >> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >>
> >>         return ret;
> >>  }
> >> @@ -433,16 +430,63 @@ static int send_single(struct rpmh_ctrlr *ctrlr,=
 enum rpmh_state state,
> >>  }
> >>
> >>  /**
> >> + * rpmh_start_transaction: Indicates start of rpmh transactions, this
> >> + * must be ended by invoking rpmh_end_transaction().
> >> + *
> >> + * @dev: the device making the request
> >> + */
> >> +void rpmh_start_transaction(const struct device *dev)
> >> +{
> >> +       struct rpmh_ctrlr *ctrlr =3D get_rpmh_ctrlr(dev);
> >> +       unsigned long flags;
> >> +
> >> +       if (!ctrlr->flush_dirty)
> >> +               return;
> >> +
> >> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> >> +       ctrlr->active_clients++;
> > Wouldn't hurt to have something like:
> >
> > /*
> >  * Detect likely leak; we shouldn't have 1000
> >  * people making in-flight changes at the same time.
> >  */
> > WARN_ON(ctrlr->active_clients > 1000)
> Not necessary change.

Yes, but it will catch buggy clients much more quickly.  What are the downs=
ides?


> >> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> >> +}
> >> +EXPORT_SYMBOL(rpmh_start_transaction);
> >> +
> >> +/**
> >> + * rpmh_end_transaction: Indicates end of rpmh transactions. All dirt=
y data
> >> + * in cache can be flushed immediately when ctrlr->flush_dirty is set
> >> + *
> >> + * @dev: the device making the request
> >> + *
> >> + * Return: 0 on success, error number otherwise.
> >> + */
> >> +int rpmh_end_transaction(const struct device *dev)
> >> +{
> >> +       struct rpmh_ctrlr *ctrlr =3D get_rpmh_ctrlr(dev);
> >> +       unsigned long flags;
> >> +       int ret =3D 0;
> >> +
> >> +       if (!ctrlr->flush_dirty)
> >> +               return ret;
> >> +
> >> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
> > WARN_ON(!active_clients);
> Why? when active_clients become zero, we want to finally call rpmh_flush(=
), i don't see a reason to warn and then flush.
>
> Or do you want to make a check if client really called rpmh_start_transac=
tion() first before calling rpmh_end_transaction() then when we do
> ctrlr->active_clients--;
>
> it shouldn't go to negative value at the end. in that case let me know, i=
 will make those changes.

Right, I want to warn on underflow.  AKA:

WARN_ON(!ctrlr->active_clients);
ctrlr->active_clients--;

Generally it's handy to detect mismatches of start/end.  It could be
that someone accidentally starts twice and ends once.  Starts zero
times and ends once.  Starts once and ends twice.  All of these are
interesting cases to warn about.



-Doug

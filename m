Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318BD20A88B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 01:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407657AbgFYXDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 19:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407656AbgFYXDd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 19:03:33 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84327C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 16:03:33 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id h1so1725547vkn.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 16:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3VtPFTB+Wpbzd1i3IyK1rrMeUVt8KSTDwr4ll4m6Cmg=;
        b=f4Jtsc+yoKFWylTXom0wu50L/1FtuyV1rd2hB3zcE2TJIt0lHmuc801eowo7+Q1zTS
         1tx4q5xIJcgbnHP62pEfXDTUFs/XGpHOA2ddFrGYHYLE+rhpOzTPI0JKt06J4S7rIPhx
         ogMUJQxEiFq1QjGbo0rWMI4mir+eGnQR2DtJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3VtPFTB+Wpbzd1i3IyK1rrMeUVt8KSTDwr4ll4m6Cmg=;
        b=RkhUGQ+TauPP7X3n47wH59wWv0sgMNSqOcmzvmG3vIA/VYUKgWIzAMX7LQPFny0Ro1
         jRRlG3x9vzNGyRzWm1iVFDhjC/92AIfVBtsSiPeZnwtozrZsAcKey3liH+gJJR9lQqJg
         nv70x20grYvXThFwKPIKhFyYzlDEjbSyoQi3za8yzwzk5OYn3X50ZGtXWnx1bQcMOXHo
         d3nEd5/VvLmWdDpKTmGypauVFZjB43xTVtE6R56TOdUZHg3YONnjb1zWXaSVli5szF5y
         Ri1zXryH4rPjchOUGwVdJ8HaaqaKzhiy4o5PWc8jvpr/EtAapx7LUX44ouHFuCkPvt4R
         UR8w==
X-Gm-Message-State: AOAM531edUjyUtcRThAjZhALBtVEUvdQc03+DaMb/yyGVnKxAkTDvqvb
        Pt75e0YgwmWRCdVeHL+641zTFkqfzNE=
X-Google-Smtp-Source: ABdhPJxcQ9MkhY+A6IzANe2CJr+RX/cw6Wg1zhbuRd+hLDJPc3TW0qZN+xGX7QWqV4VcIEOVALDawg==
X-Received: by 2002:ac5:c94b:: with SMTP id s11mr154551vkm.8.1593126212272;
        Thu, 25 Jun 2020 16:03:32 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id w8sm3067979vsk.4.2020.06.25.16.03.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 16:03:31 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id r7so1812222vkf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 16:03:31 -0700 (PDT)
X-Received: by 2002:a1f:19cd:: with SMTP id 196mr152813vkz.0.1593126210678;
 Thu, 25 Jun 2020 16:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1590749507-1440-1-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=VccaN-65KT+PEL9z-Hrp2kriQHmdOywK0chcL6c4sA=w@mail.gmail.com> <c9e32a49-2642-b3e4-3fe7-1b40781d2577@codeaurora.org>
In-Reply-To: <c9e32a49-2642-b3e4-3fe7-1b40781d2577@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 25 Jun 2020 16:03:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoDAt17FDtwN+5BgimXZEm7Bh-_q8D1U+U4bFtmUURyA@mail.gmail.com>
Message-ID: <CAD=FV=XoDAt17FDtwN+5BgimXZEm7Bh-_q8D1U+U4bFtmUURyA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh: Remove serialization of TCS commands
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 25, 2020 at 3:22 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> Hi,
>
> On 6/19/2020 9:57 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 29, 2020 at 3:52 AM Maulik Shah <mkshah@codeaurora.org> wrote:
> >> From: Lina Iyer <ilina@codeaurora.org>
> >>
> >> Requests sent to RPMH can be sent as fire-n-forget or response required,
> >> with the latter ensuring the command has been completed by the hardware
> >> accelerator. Commands in a request with tcs_cmd::wait set, would ensure
> >> that those select commands are sent as response required, even though
> >> the actual TCS request may be fire-n-forget.
> >>
> >> Also, commands with .wait flag were also guaranteed to be complete
> >> before the following command in the TCS is sent. This means that the
> >> next command of the same request blocked until the current request is
> >> completed. This could mean waiting for a voltage to settle or series of
> >> NOCs be configured before the next command is sent. But drivers using
> >> this feature have never cared about the serialization aspect. By not
> >> enforcing the serialization we can allow the hardware to run in parallel
> >> improving the performance.
> >>
> >> Let's clarify the usage of this member in the tcs_cmd structure to mean
> >> only completion and not serialization. This should also improve the
> >> performance of bus requests where changes could happen in parallel.
> >> Also, CPU resume from deep idle may see benefits from certain wake
> >> requests.
> >>
> >> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > You are posting the patch and so you need your SoB too.
> sure, i will add and re-spin.
> >
> >
> >> ---
> >>   drivers/soc/qcom/rpmh-rsc.c | 19 ++++++++-----------
> >>   include/soc/qcom/tcs.h      |  5 +++--
> >>   2 files changed, 11 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> >> index 076fd27..d99e639 100644
> >> --- a/drivers/soc/qcom/rpmh-rsc.c
> >> +++ b/drivers/soc/qcom/rpmh-rsc.c
> >> @@ -413,8 +413,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
> >>                          cmd = &req->cmds[j];
> >>                          sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
> >>                          if (!(sts & CMD_STATUS_ISSUED) ||
> >> -                          ((req->wait_for_compl || cmd->wait) &&
> >> -                          !(sts & CMD_STATUS_COMPL))) {
> >> +                          (cmd->wait && !(sts & CMD_STATUS_COMPL))) {
> > I don't quite understand this part of the change.  Why don't you need
> > to check "req->wait_for_compl" anymore?  You are still setting
> > "CMD_MSGID_RESP_REQ" if "req->wait_for_compl" is set and none of the
> > code in your patch actually sets "cmd->wait" (unlike what's implied in
> > your change to the header file).  Maybe some previous version of the
> > patch _was_ actually setting "cmd->wait" and when you stopped doing
> > that you forgot to restore this part of the change?
> TCS cmd->wait, will be set by the callers of rpmh APIs. We don't set in
> our driver.

I still don't understand.  In your patch in __tcs_buffer_write(), if
"wait_for_compl" is set then "CMD_MSGID_RESP_REQ" will be added for
every message in the request, right?  That's because you have this bit
of code:

/* Convert all commands to RR when the request has wait_for_compl set */
cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;

That means that if _either_ "cmd->wait" or "req->wait_for_compl" is
set then you expect the "sts" to have "CMD_STATUS_COMPL", right?
That's exactly the code that used to be there.

Said another way, if "req->wait_for_compl" was set then it's an error
if any of our commands are missing the "CMD_STATUS_COMPL" bit, right?


> >
> >
> >>                                  pr_err("Incomplete request: %s: addr=%#x data=%#x",
> >>                                         drv->name, cmd->addr, cmd->data);
> >>                                  err = -EIO;
> >> @@ -433,7 +432,6 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
> >>   skip:
> >>                  /* Reclaim the TCS */
> >>                  write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
> >> -               write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);
> > Should you also be removing the write to RSC_DRV_CMD_WAIT_FOR_CMPL in
> > both tcs_write() and tcs_invalidate()?  Those are the only two places
> > left that set this register and they both always set it to 0.
> Thanks for pointing this, yes both of these places it can be removed.
> >
> >
> >>                  writel_relaxed(BIT(i), drv->tcs_base + RSC_DRV_IRQ_CLEAR);
> >>                  spin_lock(&drv->lock);
> >>                  clear_bit(i, drv->tcs_in_use);
> >> @@ -465,23 +463,23 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
> >>   static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
> >>                                 const struct tcs_request *msg)
> >>   {
> >> -       u32 msgid, cmd_msgid;
> >> +       u32 msgid;
> >> +       u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> >>          u32 cmd_enable = 0;
> >> -       u32 cmd_complete;
> >>          struct tcs_cmd *cmd;
> >>          int i, j;
> >>
> >> -       cmd_msgid = CMD_MSGID_LEN;
> >> +       /* Convert all commands to RR when the request has wait_for_compl set */
> >>          cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> >> -       cmd_msgid |= CMD_MSGID_WRITE;
> >> -
> >> -       cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
> >>
> >>          for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
> >>                  cmd = &msg->cmds[i];
> >>                  cmd_enable |= BIT(j);
> >> -               cmd_complete |= cmd->wait << j;
> >>                  msgid = cmd_msgid;
> >> +               /*
> >> +                * Additionally, if the cmd->wait is set, make the command
> >> +                * response reqd even if the overall request was fire-n-forget.
> >> +                */
> >>                  msgid |= cmd->wait ? CMD_MSGID_RESP_REQ : 0;
> >>
> >>                  write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
> >> @@ -490,7 +488,6 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
> >>                  trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
> >>          }
> >>
> >> -       write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
> >>          cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
> >>          write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
> >>   }
> >> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
> >> index 7a2a055..d1c87fd 100644
> >> --- a/include/soc/qcom/tcs.h
> >> +++ b/include/soc/qcom/tcs.h
> >> @@ -1,6 +1,6 @@
> >>   /* SPDX-License-Identifier: GPL-2.0 */
> >>   /*
> >> - * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> >> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> >>    */
> >>
> >>   #ifndef __SOC_QCOM_TCS_H__
> >> @@ -30,7 +30,7 @@ enum rpmh_state {
> >>    *
> >>    * @addr: the address of the resource slv_id:18:16 | offset:0:15
> >>    * @data: the resource state request
> >> - * @wait: wait for this request to be complete before sending the next
> >> + * @wait: Ensure that this command is complete before returning
> > I have a hard time understanding what you're trying to convey here.
> > Do we even need the "wait" in this structure?
> Yes we need.
> >
> > When you call rpmh_write() we use DEFINE_RPMH_MSG_ONSTACK which sets
> > "wait_for_compl", right?
> Right.
> >
> > ...so I guess you're expecting this to be used for rpmh_write_async()?
> Correct and also for rpmh_write_batch().
> >   ...but we never wait in that case, do we?
>
> tcs cmd->wait will be set by callers of rpmh API.
>
> >
> > ...or are you expecting rpmh_write_batch() to take advantage of this somehow?
>
> Yes.
>
> Lets me take an example,
>
> a caller is sending below data in rpmh_write_batch()
>
> CMD0: addr=a, data=x, wait=0,
> CMD1: addr=b, data=y, wait=1,
> CMD2: addr=c, data=z, wait=0,
>
> now __tcs_buffer_write()  with current code is setting two things,
>
> 1. serialize sending the commands (by setting RSC_DRV_CMD_WAIT_FOR_CMPL
> for CMD1)
> This ensured that CMD1 is waited to complete before triggering any new
> command (CMD2 of TCS) to the HW.
>
> 2. wait for completion of commands before returning (by setting
> CMD_MSGID_RESP_REQ for CMD1)
> This ensured that CMD1 is complete before generating completion interrupt.

OK, but I guess my question is: who exactly cares about the completion
interrupt?

For rpmh_write_async() as soon as the commands are in the queue the
function returns.  There's no callback and rpmh_write_async() doesn't
set the "completion" to anything so there's nobody that cares at all,
right?  That means, effectively, it's not useful for anyone to set the
"wait" member when calling rpmh_write_async().

Ah, I see.  So the "wait" value _only_ matters for the batch case and
only for "active only" transfers.  I guess another thing that would be
nice to have in a comment somewhere, assuming I understood it all
correctly.


> This patch drops serialization part (1), so that all the commands can be
> triggered at once and can parallelly be finished.
> if wait=1 is set for some command, the completion interrupt will be
> generated once those commands are complete in HW.
> >
> >
> >>    */
> >>   struct tcs_cmd {
> >>          u32 addr;
> >> @@ -43,6 +43,7 @@ struct tcs_cmd {
> >>    *
> >>    * @state:          state for the request.
> >>    * @wait_for_compl: wait until we get a response from the h/w accelerator
> >> + *                  (sets the cmd->wait for all commmands in the request)
> > s/commmands/scommands
> >
> > Also: I don't think this actually goes and modifies "cmd->wait" for
> > all the commands in the request, does it?  Maybe say "same as setting
> > cmd->wait for all the commands in the request"?
> ok, i will update in next revision.
> >
> >
> > -Doug
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
>

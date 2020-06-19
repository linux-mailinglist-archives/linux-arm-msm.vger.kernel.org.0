Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E5A200137
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 06:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgFSE1f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 00:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgFSE1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 00:27:33 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D3CC0613EE
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 21:27:31 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id m25so4882051vsp.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 21:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A6ju9PAXB7E51Dg5D1WCwptxK/OZbrBHXve+qD2jKwo=;
        b=Z6F5IF9BNWnbLgEEhixHQiEM/5aeDSTq+4IdTTviAgaZfHWVlURu9CXtBVypY5YXao
         HSiPKTkQ/wcz8jPvghvbyXOIYgpJt//g3a4Pe2LTeC5gpsd2tlVSie+x6AynODoy2D1l
         v+sxP3jJImrEqx86C+xPkZMRpWb0S9vqEEuV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A6ju9PAXB7E51Dg5D1WCwptxK/OZbrBHXve+qD2jKwo=;
        b=cSpkWy+0MksA6UA63JezKdLhln9g8NfzXyLZ8YjAnDSBQG4BbXQaJ2b8nVDLIQB5RO
         FAbIyWFpL+0P94EIzdGo12KvpvUGy8K3j+3S2SsX5EQpNEc37K4n+KWUKMEQ6aWPwa8d
         VYkzrBCrnJ6s0xpF9eEm1rUhTefkyUWXBDwVY4IwpZnskDMeFWepqv+F3jVOJr8+cyV/
         CxLqX91JJfUVWJ1p2dFTuBh2YS7fYsb7xHo1KCPZRndp9ZV9lDLPLian/rEyjoPcv/0T
         3MaoFicH35RhYIjilOzOX2U68aZbRe5wu1T4pkqlXavrcp/rmRjEY2KIpVQbxowXKY0D
         ABcQ==
X-Gm-Message-State: AOAM532qImvRMb6CS7Am2Jvl2ntz7AQAZ1QnkKR+4yY43EtnlauKq1Zh
        V5TJ/betn7W4j/ft+8o6H/ARgnZxbx0=
X-Google-Smtp-Source: ABdhPJwyDHnVt1wmx3X2xKxC01dEU6kbAyf/GKG8th5zv27xcot50/dJCB4w2Ysge6rsXOkseyM/vw==
X-Received: by 2002:a05:6102:15b:: with SMTP id a27mr6343334vsr.141.1592540850371;
        Thu, 18 Jun 2020 21:27:30 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id q13sm630473vka.23.2020.06.18.21.27.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 21:27:29 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id r11so4876044vsj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 21:27:28 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr6175976vsm.73.1592540848276;
 Thu, 18 Jun 2020 21:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <1590749507-1440-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1590749507-1440-1-git-send-email-mkshah@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 21:27:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VccaN-65KT+PEL9z-Hrp2kriQHmdOywK0chcL6c4sA=w@mail.gmail.com>
Message-ID: <CAD=FV=VccaN-65KT+PEL9z-Hrp2kriQHmdOywK0chcL6c4sA=w@mail.gmail.com>
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

On Fri, May 29, 2020 at 3:52 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> From: Lina Iyer <ilina@codeaurora.org>
>
> Requests sent to RPMH can be sent as fire-n-forget or response required,
> with the latter ensuring the command has been completed by the hardware
> accelerator. Commands in a request with tcs_cmd::wait set, would ensure
> that those select commands are sent as response required, even though
> the actual TCS request may be fire-n-forget.
>
> Also, commands with .wait flag were also guaranteed to be complete
> before the following command in the TCS is sent. This means that the
> next command of the same request blocked until the current request is
> completed. This could mean waiting for a voltage to settle or series of
> NOCs be configured before the next command is sent. But drivers using
> this feature have never cared about the serialization aspect. By not
> enforcing the serialization we can allow the hardware to run in parallel
> improving the performance.
>
> Let's clarify the usage of this member in the tcs_cmd structure to mean
> only completion and not serialization. This should also improve the
> performance of bus requests where changes could happen in parallel.
> Also, CPU resume from deep idle may see benefits from certain wake
> requests.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

You are posting the patch and so you need your SoB too.


> ---
>  drivers/soc/qcom/rpmh-rsc.c | 19 ++++++++-----------
>  include/soc/qcom/tcs.h      |  5 +++--
>  2 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 076fd27..d99e639 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -413,8 +413,7 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>                         cmd = &req->cmds[j];
>                         sts = read_tcs_cmd(drv, RSC_DRV_CMD_STATUS, i, j);
>                         if (!(sts & CMD_STATUS_ISSUED) ||
> -                          ((req->wait_for_compl || cmd->wait) &&
> -                          !(sts & CMD_STATUS_COMPL))) {
> +                          (cmd->wait && !(sts & CMD_STATUS_COMPL))) {

I don't quite understand this part of the change.  Why don't you need
to check "req->wait_for_compl" anymore?  You are still setting
"CMD_MSGID_RESP_REQ" if "req->wait_for_compl" is set and none of the
code in your patch actually sets "cmd->wait" (unlike what's implied in
your change to the header file).  Maybe some previous version of the
patch _was_ actually setting "cmd->wait" and when you stopped doing
that you forgot to restore this part of the change?


>                                 pr_err("Incomplete request: %s: addr=%#x data=%#x",
>                                        drv->name, cmd->addr, cmd->data);
>                                 err = -EIO;
> @@ -433,7 +432,6 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  skip:
>                 /* Reclaim the TCS */
>                 write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i, 0);
> -               write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, i, 0);

Should you also be removing the write to RSC_DRV_CMD_WAIT_FOR_CMPL in
both tcs_write() and tcs_invalidate()?  Those are the only two places
left that set this register and they both always set it to 0.


>                 writel_relaxed(BIT(i), drv->tcs_base + RSC_DRV_IRQ_CLEAR);
>                 spin_lock(&drv->lock);
>                 clear_bit(i, drv->tcs_in_use);
> @@ -465,23 +463,23 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
>  static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>                                const struct tcs_request *msg)
>  {
> -       u32 msgid, cmd_msgid;
> +       u32 msgid;
> +       u32 cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
>         u32 cmd_enable = 0;
> -       u32 cmd_complete;
>         struct tcs_cmd *cmd;
>         int i, j;
>
> -       cmd_msgid = CMD_MSGID_LEN;
> +       /* Convert all commands to RR when the request has wait_for_compl set */
>         cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -       cmd_msgid |= CMD_MSGID_WRITE;
> -
> -       cmd_complete = read_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id);
>
>         for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>                 cmd = &msg->cmds[i];
>                 cmd_enable |= BIT(j);
> -               cmd_complete |= cmd->wait << j;
>                 msgid = cmd_msgid;
> +               /*
> +                * Additionally, if the cmd->wait is set, make the command
> +                * response reqd even if the overall request was fire-n-forget.
> +                */
>                 msgid |= cmd->wait ? CMD_MSGID_RESP_REQ : 0;
>
>                 write_tcs_cmd(drv, RSC_DRV_CMD_MSGID, tcs_id, j, msgid);
> @@ -490,7 +488,6 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>                 trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
>         }
>
> -       write_tcs_reg(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, cmd_complete);
>         cmd_enable |= read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
>         write_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id, cmd_enable);
>  }
> diff --git a/include/soc/qcom/tcs.h b/include/soc/qcom/tcs.h
> index 7a2a055..d1c87fd 100644
> --- a/include/soc/qcom/tcs.h
> +++ b/include/soc/qcom/tcs.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> - * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
>   */
>
>  #ifndef __SOC_QCOM_TCS_H__
> @@ -30,7 +30,7 @@ enum rpmh_state {
>   *
>   * @addr: the address of the resource slv_id:18:16 | offset:0:15
>   * @data: the resource state request
> - * @wait: wait for this request to be complete before sending the next
> + * @wait: Ensure that this command is complete before returning

I have a hard time understanding what you're trying to convey here.
Do we even need the "wait" in this structure?

When you call rpmh_write() we use DEFINE_RPMH_MSG_ONSTACK which sets
"wait_for_compl", right?

...so I guess you're expecting this to be used for rpmh_write_async()?
 ...but we never wait in that case, do we?

...or are you expecting rpmh_write_batch() to take advantage of this somehow?


>   */
>  struct tcs_cmd {
>         u32 addr;
> @@ -43,6 +43,7 @@ struct tcs_cmd {
>   *
>   * @state:          state for the request.
>   * @wait_for_compl: wait until we get a response from the h/w accelerator
> + *                  (sets the cmd->wait for all commmands in the request)

s/commmands/scommands

Also: I don't think this actually goes and modifies "cmd->wait" for
all the commands in the request, does it?  Maybe say "same as setting
cmd->wait for all the commands in the request"?


-Doug

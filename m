Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC4B10ED4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2019 17:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfLBQhx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Dec 2019 11:37:53 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:46246 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfLBQhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Dec 2019 11:37:53 -0500
Received: by mail-il1-f193.google.com with SMTP id t17so186307ilm.13;
        Mon, 02 Dec 2019 08:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2h8wdrXvnncmWCF77v8dSWf6+7HM1jrsdePjMP6K/Bo=;
        b=TXlfLkNQjoEHdXaQVklK3Uw+gGemK6Mwc1vT8jIQsfyYpzHmNyYPA69GnOfcwaTlSF
         /OD/sgq4o+c/VtZwFAfZCpFSPkG46jbjpuAz8NHVfUvVCN3TS+NihpI0H9AwAyk5/Ag4
         sHWcRXNc1WB6HIU3ZrGKfzgcWrEdXauhRg5a46qqDicILaqGpbFk+3I3NfEYjq9XUH0/
         CZl2b6d04Bde4lILMwDLrhIAOIpB6edUvXTuv+ABmaoXv1MAAcnLZtDgjxA/fDdMp0SN
         ufwP7Yq4x8lpCflJYiBzDJ37vpRKfFzJeM66N0/l6IKyodBrFMx++srRheGKhfV14O39
         9O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2h8wdrXvnncmWCF77v8dSWf6+7HM1jrsdePjMP6K/Bo=;
        b=FXj4rLRde5ftZzofdF8sFngzkXdZsrBLbNoTt+U9S/c/+D5oAXyzNiR1OxMn8sOfS+
         vzNoyFglpmjZmzseR8py5vH9vzuqnK2jKWhLlseucRuoTPbkWkx6f4rpopbHyQ0UB7VM
         9wJZjY1QfWQBfXN3XjFm1cHrBKdC779tNnf88sjNeA3GSb+r6JJbhqYHuefJFdJG8MIu
         wkoYCA5aZBv2TnUlxHtcrgl3xU3rMTt9LOUn9MEae1Yqi+diW1uM7Yx2F0iMeXDfMh41
         ltEbVgkEkFl7mFKfp1Rei0av1k3e6Q6JApAi5ajG99OcQxsltmRoUWnfc02n4iy6p38n
         /KTQ==
X-Gm-Message-State: APjAAAX/oSpwsY4DTx8orOnAwRX8GRweo0OLS3gB7kMeMdxOtAJR6EhA
        HiuVxdof5LebJg0nqXegIcSh47lok9bcBQe8uwI=
X-Google-Smtp-Source: APXvYqzp1Xd703HeRlD50En4AyiDZ1bxrwk+Gf7H2uCn/NWWWtxiWGhbFN7PzEyUWULIA67Tyq2FAV0tgpPc0osRBJ4=
X-Received: by 2002:a92:b60e:: with SMTP id s14mr68353788ili.178.1575304672579;
 Mon, 02 Dec 2019 08:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20191127141544.4277-1-leo.yan@linaro.org> <20191127141544.4277-2-leo.yan@linaro.org>
In-Reply-To: <20191127141544.4277-2-leo.yan@linaro.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 2 Dec 2019 09:37:41 -0700
Message-ID: <CAOCk7NryqvGjkWYKcHp+bNxqfG7AWsN5tvhx71ZWObvssXV3mA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tty: serial: msm_serial: Fix lockup for sysrq and oops
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 27, 2019 at 7:16 AM Leo Yan <leo.yan@linaro.org> wrote:
>
> As the commit 677fe555cbfb ("serial: imx: Fix recursive locking bug")
> has mentioned the uart driver might cause recursive locking between
> normal printing and the kernel debugging facilities (e.g. sysrq and
> oops).  In the commit it gave out suggestion for fixing recursive
> locking issue: "The solution is to avoid locking in the sysrq case
> and trylock in the oops_in_progress case."
>
> This patch follows the suggestion (also used the exactly same code with
> other serial drivers, e.g. amba-pl011.c) to fix the recursive locking
> issue, this can avoid stuck caused by deadlock and print out log for
> sysrq and oops.
>
> Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Looks sane to me
Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

> ---
>  drivers/tty/serial/msm_serial.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 3657a24913fc..889538182e83 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -1576,6 +1576,7 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>         int num_newlines = 0;
>         bool replaced = false;
>         void __iomem *tf;
> +       int locked = 1;
>
>         if (is_uartdm)
>                 tf = port->membase + UARTDM_TF;
> @@ -1588,7 +1589,13 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>                         num_newlines++;
>         count += num_newlines;
>
> -       spin_lock(&port->lock);
> +       if (port->sysrq)
> +               locked = 0;
> +       else if (oops_in_progress)
> +               locked = spin_trylock(&port->lock);
> +       else
> +               spin_lock(&port->lock);
> +
>         if (is_uartdm)
>                 msm_reset_dm_count(port, count);
>
> @@ -1624,7 +1631,9 @@ static void __msm_console_write(struct uart_port *port, const char *s,
>                 iowrite32_rep(tf, buf, 1);
>                 i += num_chars;
>         }
> -       spin_unlock(&port->lock);
> +
> +       if (locked)
> +               spin_unlock(&port->lock);
>  }
>
>  static void msm_console_write(struct console *co, const char *s,
> --
> 2.17.1
>

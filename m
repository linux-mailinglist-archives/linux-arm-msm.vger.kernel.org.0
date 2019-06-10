Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D06103BB64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2019 19:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388458AbfFJRxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jun 2019 13:53:25 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37848 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388174AbfFJRxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jun 2019 13:53:25 -0400
Received: by mail-ed1-f67.google.com with SMTP id w13so15711010eds.4;
        Mon, 10 Jun 2019 10:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v1cwCImDOstaAdDepmaoSdovcsMeX1QCpfpK/bKSfWg=;
        b=rOOXWNQJxx/m8GcJW8LlP4CvbEPV9w2vljn+BGcYXxzMTbnfupXJdGgFGVdxkbdfD3
         3R5ik6Zyy8LXupk4G/vjgRcR6uHM9xYgw0CHAbuyviyt+mhXoe1U8mkTo6EGpZ3d+aJy
         2oRWPregGxv9aOV5NpfIKdHTe1OdddrI1aR7vEnLMhI3Ibc4KM3JqZJlpd1sXyJBxxvr
         jUvnf0Q6iDy+7HZ+IIoC9uSrrz37Ec6MF3/YHVHOlBQSE9oircXZqdU9eFj2uHBMw1Mz
         M9zitjjGyqNXx3fgeddHMnSfGP5gWixqsVXUg4cSuBpTGM4dRAxSEJqfSNFoefAIRvSk
         ssfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v1cwCImDOstaAdDepmaoSdovcsMeX1QCpfpK/bKSfWg=;
        b=Nc5UM2J6dbNyMdZhqHm22e2Rp1LEco/f4iCWb8qadnqK6hmLn7g3YjCoW7HoYBOasV
         5bMHJTKFj8nVwPZ0s/0PGhUErogJHEY01uiMWvHSlB9+WGpVqW/DzHSZfMlMzkmuyO/S
         32No18hwaz8aWWbS2lh5DWjMpOmgrp+aKQZS5TlZ1kTKLXdfTszUJar3fUSEPlrzej9t
         WGP8SiUiSVfRF4gN3Sp0L5xFwUh5v0BmrE/o4Vp+4uJH0tCcNGyhfb4Rp2pOXRXJ6xIJ
         JmirivlA/kCkdf/uQODObMvz4Kn4605Tg+vA/34obIaP8GBu/Dg0mNsnHmWqobzrZHDE
         n/sw==
X-Gm-Message-State: APjAAAW1tziCGhd/0H78DC0uB4ptO51NVH0fnQ32SLn1sYXleiX3T+oa
        sFWSz3rSY4GLM7EpMqrZnQ3HRkBnpi6DFGp0hrI=
X-Google-Smtp-Source: APXvYqza5AvXqQv6lJCZftZ7ng0sD7CUY06mSZD508SbQGK3VJgsRzDxMDimvEwZ8zJZOftWgr1DjsQszfluQLPurrM=
X-Received: by 2002:a50:d1d8:: with SMTP id i24mr69636414edg.57.1560189203181;
 Mon, 10 Jun 2019 10:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190610172308.21129-1-jorge.ramirez-ortiz@linaro.org>
In-Reply-To: <20190610172308.21129-1-jorge.ramirez-ortiz@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 10 Jun 2019 10:53:09 -0700
Message-ID: <CAF6AEGuAPurGcRh42iRkt3paD=kWLJw-ic_LL1QGY=ws8_00XA@mail.gmail.com>
Subject: Re: [PATCH v3] tty: serial: msm_serial: avoid system lockup condition
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, agross@kernel.org,
        David Brown <david.brown@linaro.org>, jslaby@suse.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        khasim.mohammed@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 10, 2019 at 10:23 AM Jorge Ramirez-Ortiz
<jorge.ramirez-ortiz@linaro.org> wrote:
>
> The function msm_wait_for_xmitr can be taken with interrupts
> disabled. In order to avoid a potential system lockup - demonstrated
> under stress testing conditions on SoC QCS404/5 - make sure we wait
> for a bounded amount of time.
>
> Tested on SoC QCS404.
>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>


I had observed that heavy UART traffic would lockup the system (on
sdm845, but I guess same serial driver)?

But a comment from the peanut gallary:  wouldn't this fix lead to TX
corruption, ie. writing more into TX fifo before hw is ready?  I
haven't looked closely at the driver, but a way to wait without irqs
disabled would seem nicer..

BR,
-R

> ---
>  v2: fix exit condition (timeout --> !timeout)
>  v3: add these clarification messages
>
>  drivers/tty/serial/msm_serial.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
> index 23833ad952ba..3657a24913fc 100644
> --- a/drivers/tty/serial/msm_serial.c
> +++ b/drivers/tty/serial/msm_serial.c
> @@ -383,10 +383,14 @@ static void msm_request_rx_dma(struct msm_port *msm_port, resource_size_t base)
>
>  static inline void msm_wait_for_xmitr(struct uart_port *port)
>  {
> +       unsigned int timeout = 500000;
> +
>         while (!(msm_read(port, UART_SR) & UART_SR_TX_EMPTY)) {
>                 if (msm_read(port, UART_ISR) & UART_ISR_TX_READY)
>                         break;
>                 udelay(1);
> +               if (!timeout--)
> +                       break;
>         }
>         msm_write(port, UART_CR_CMD_RESET_TX_READY, UART_CR);
>  }
> --
> 2.21.0
>

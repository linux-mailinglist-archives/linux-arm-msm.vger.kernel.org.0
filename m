Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD3621BC8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 19:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgGJRqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 13:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgGJRqJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 13:46:09 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD629C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 10:46:08 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id bm28so3326270edb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 10:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/CMHk4w6+cNFzgYJXIzp3UU76Y8y9UeHEGOkUVbXTU=;
        b=ILDYVm0LcXLZZrfmAxtURkQprTX9skjAShvhFipQKJAKbFGyoFEeZfJniL4uh1sJtQ
         6GQsddyIJ/M36EE7v0/XiEEynwtBixNj1dz7zWXkp46lP3Sbmpdp/lJneh5gVSnuRIoP
         uDZ95SWe4tPPb6v31ajhDIGF2FUlWNiVlWd+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/CMHk4w6+cNFzgYJXIzp3UU76Y8y9UeHEGOkUVbXTU=;
        b=iu4TEbxW0pC+TMF2ehmI2IdqoxOeyhpFYBTm6HrwZPpMaoshfW/9+fWA3lMFbTwOB+
         cF1Hs81ctfq03tooEc3yk9OOx/S2MSHnGu3YbIlYuGFa+PlNQQoLKFJR6lj2hjPBNtVW
         d8oXkCWs+wKs1eNASU8g92Cv9Qsa+OGz7CqcJKnevYSe6B4K+B/voxc21ySJCJ54G1m9
         5uGYRABHRTbwS6IGXVo0MiMSqbsQGC4WeXu3UxgH8lfes4kNtfcddNloFo2q2wZT6vdx
         raDej58WJLIf5yH50WwPnJmEkt6tx1XcXxDGThBBIhAXbLbKBAmg7qHIf1O8zbLXD9Ph
         ZSdA==
X-Gm-Message-State: AOAM5326N+hMwVR3uKcbADF7j7nAiECOx/3qrAAOP1OeRxYN/CxdZjg+
        jKCxYu0RoCMEWl8OK1cVz3k6c50A21Jn0Q==
X-Google-Smtp-Source: ABdhPJwRkzFh91d3ml5CtDDdhTQgdTdXkTeUjKpxljOgGPVBWBolNXeGXUjx33cax9TSAHArShdVPw==
X-Received: by 2002:a05:6402:1a42:: with SMTP id bf2mr69907707edb.292.1594403167219;
        Fri, 10 Jul 2020 10:46:07 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id dn15sm4211996ejc.26.2020.07.10.10.46.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 10:46:07 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id y10so7025347eje.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 10:46:06 -0700 (PDT)
X-Received: by 2002:ac2:44b2:: with SMTP id c18mr42517426lfm.99.1594402767378;
 Fri, 10 Jul 2020 10:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200033.1528052-1-dianders@chromium.org> <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
In-Reply-To: <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 10 Jul 2020 10:38:50 -0700
X-Gmail-Original-Message-ID: <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
Message-ID: <CAE=gft504BAm2sr0S32kSO2xoQWhjrXLXa9+uqgkcPO6wjNhrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: qcom_geni_serial: Always use 4 bytes per TX
 FIFO word
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        daniel.thompson@linaro.org,
        Akash Asthana <akashast@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        kgdb-bugreport@lists.sourceforge.net,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sumit.garg@linaro.org, Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 26, 2020 at 1:01 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The geni serial driver had a rule that we'd only use 1 byte per FIFO
> word for the TX FIFO if we were being used for the serial console.
> This is ugly and a bit of a pain.  It's not too hard to fix, so fix
> it.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/tty/serial/qcom_geni_serial.c | 57 +++++++++++++++++----------
>  1 file changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 4610e391e886..583d903321b5 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -103,12 +103,18 @@
>  #define DEFAULT_IO_MACRO_IO2_IO3_MASK          GENMASK(15, 4)
>  #define IO_MACRO_IO2_IO3_SWAP          0x4640
>
> +/* We always configure 4 bytes per FIFO word */
> +#define BYTES_PER_FIFO_WORD            4
> +
>  struct qcom_geni_private_data {
>         /* NOTE: earlycon port will have NULL here */
>         struct uart_driver *drv;
>
>         u32 poll_cached_bytes;
>         unsigned int poll_cached_bytes_cnt;
> +
> +       u32 write_cached_bytes;
> +       unsigned int write_cached_bytes_cnt;
>  };
>
>  struct qcom_geni_serial_port {
> @@ -121,8 +127,6 @@ struct qcom_geni_serial_port {
>         bool setup;
>         int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
>         unsigned int baud;
> -       unsigned int tx_bytes_pw;
> -       unsigned int rx_bytes_pw;
>         void *rx_fifo;
>         u32 loopback;
>         bool brk;
> @@ -390,13 +394,25 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
>  #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
>  static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
>  {
> -       writel(ch, uport->membase + SE_GENI_TX_FIFOn);
> +       struct qcom_geni_private_data *private_data = uport->private_data;
> +
> +       private_data->write_cached_bytes =
> +               (private_data->write_cached_bytes >> 8) | (ch << 24);
> +       private_data->write_cached_bytes_cnt++;
> +
> +       if (private_data->write_cached_bytes_cnt == BYTES_PER_FIFO_WORD) {
> +               writel(private_data->write_cached_bytes,
> +                      uport->membase + SE_GENI_TX_FIFOn);
> +               private_data->write_cached_bytes_cnt = 0;
> +       }
>  }
>
>  static void
>  __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
>                                  unsigned int count)
>  {
> +       struct qcom_geni_private_data *private_data = uport->private_data;
> +
>         int i;
>         u32 bytes_to_send = count;
>
> @@ -431,6 +447,15 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
>                                                         SE_GENI_M_IRQ_CLEAR);
>                 i += chars_to_write;
>         }
> +
> +       if (private_data->write_cached_bytes_cnt) {
> +               private_data->write_cached_bytes >>= BITS_PER_BYTE *
> +                       (BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
> +               writel(private_data->write_cached_bytes,
> +                      uport->membase + SE_GENI_TX_FIFOn);
> +               private_data->write_cached_bytes_cnt = 0;
> +       }

How does this not end up sending stray zeros? In other words, how does
the hardware know which bytes of this word are valid?

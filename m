Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F04241ECB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 19:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbgHKRAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 13:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728906AbgHKRAH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 13:00:07 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEADC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 10:00:07 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x6so6985697pgx.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdCN+EFlBoYxXAxI6GQmydGxHxnnk0sb8TB0qb8FPBM=;
        b=gfocM8GFiLlhQY5QDxnSWQvvsMemkNQMNTijiRI++hlF04JK+lq/WJkDQBSJKriHz1
         Pn8pX84/Wg3yE94kWAE0MBj1kjrF8d8t35Rb/23nnMsqN3Ev/8bR3BUN8WqLzRkRMIWc
         2W3gcQopnYr/DZkNqnvyAL48CLciKBgVyftCQqOka3P1X3JlpAjhb/w3V6JvLDuTCPtV
         +GszNsAkg0Fu/pTMH0ug2kdxooiK2M8Rs7d3NsavW3WgOYHpmkwwHvZjZ0okbosMFd0n
         QhY5/ek6TQ+1enoMbDkQRxRtb+/9EKpXsP3Bv01xh+EbnJA7uy+/cgtuIwvgfYpYKO8p
         l5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdCN+EFlBoYxXAxI6GQmydGxHxnnk0sb8TB0qb8FPBM=;
        b=IJ3DU5ByrQBLIs21T/BsTvZIzD9Ex0P6qs74X9Q7pZXUW70LbwxR0tA+GpngjWkQWe
         WhnCmo/H1PM9+qQKIXYVT0CNgP020BwBZExFq6WDmN3sStbdqDUNHVRFyLLgzTGQu78n
         4qpGiFOBQkHD8M4qhQ48/W7T3VohuACtmiwuPs08Nu93yrfGwhI5b1oAWqbCgANCMwJ1
         DzyBDDVCGDv6iA4O5nPofxTWAWeXsR8gYrp3YTo1McLwQfDtA3ycJf+gRN0XyQKj2y/d
         TTMY9No1H9Fs4h7KQpA6/+KiRMkFITKqvDYVWFSPDMOIQvet8yI+U71Euzswd2AyxEwG
         oH1g==
X-Gm-Message-State: AOAM530QlUuYjpF0G31XmBqEy+WKpI3IAeVhZ+RyWTZ3bpqUXWbOl5eN
        2Fjjx27r5YFl/oF5DkkkWh5q5yTHolo43nkfI64tmg==
X-Google-Smtp-Source: ABdhPJwlflsnhvVydVvQnH8y4HXhtOWtkwKRg+wFTfdywoYortT+tTcwiOHiCdYjh5A2VH7q9yaxD/7l6ETd7xvlbgg=
X-Received: by 2002:a63:fa09:: with SMTP id y9mr1581444pgh.0.1597165206144;
 Tue, 11 Aug 2020 10:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200811025044.70626-1-john.stultz@linaro.org>
In-Reply-To: <20200811025044.70626-1-john.stultz@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 11 Aug 2020 09:59:30 -0700
Message-ID: <CAGETcx8qjnVNNB_z-Ar8gxKAy7Sc8kcj8oAWQ76mXcBpaqnagg@mail.gmail.com>
Subject: Re: [RFC][PATCH] tty: serial: qcom_geni_serial: Drop __init from qcom_geni_console_setup
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 7:50 PM John Stultz <john.stultz@linaro.org> wrote:
>
> When booting with heavily modularized config, the serial console
> may not be able to load until after init when modules that
> satisfy needed dependencies have time to load.
>
> Unfortunately, as qcom_geni_console_setup is marked as __init,
> the function may have been freed before we get to run it,
> causing boot time crashes such as:

Btw, I thought non-__init functions calling __init functions would be
caught by the build system. Is that not correct? If it's correct, do
we know how this gets past that check?

-Saravana

>
> [    6.469057] Unable to handle kernel paging request at virtual address ffffffe645d4e6cc
> [    6.481623] Mem abort info:
> [    6.484466]   ESR = 0x86000007
> [    6.487557]   EC = 0x21: IABT (current EL), IL = 32 bits
> [    6.492929]   SET = 0, FnV = 0g
> [    6.496016]   EA = 0, S1PTW = 0
> [    6.499202] swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000008151e000
> [    6.501286] ufshcd-qcom 1d84000.ufshc: ufshcd_print_pwr_info:[RX, TX]: gear=[3, 3], lane[2, 2], pwr[FAST MODE, FAST MODE], rate = 2
> [    6.505977] [ffffffe645d4e6cc] pgd=000000017df9f003, p4d=000000017df9f003, pud=000000017df9f003, pmd=000000017df9c003, pte=0000000000000000
> [    6.505990] Internal error: Oops: 86000007 [#1] PREEMPT SMP
> [    6.505995] Modules linked in: zl10353 zl10039 zl10036 zd1301_demod xc5000 xc4000 ves1x93 ves1820 tuner_xc2028 tuner_simple tuner_types tua9001 tua6100 1
> [    6.506152]  isl6405
> [    6.518104] ufshcd-qcom 1d84000.ufshc: ufshcd_find_max_sup_active_icc_level: Regulator capability was not set, actvIccLevel=0
> [    6.530549]  horus3a helene fc2580 fc0013 fc0012 fc0011 ec100 e4000 dvb_pll ds3000 drxk drxd drx39xyj dib9000 dib8000 dib7000p dib7000m dib3000mc dibx003
> [    6.624271] CPU: 7 PID: 148 Comm: kworker/7:2 Tainted: G        W       5.8.0-mainline-12021-g6defd37ba1cd #3455
> [    6.624273] Hardware name: Thundercomm Dragonboard 845c (DT)
> [    6.624290] Workqueue: events deferred_probe_work_func
> [    6.624296] pstate: 40c00005 (nZcv daif +PAN +UAO BTYPE=--)
> [    6.624307] pc : qcom_geni_console_setup+0x0/0x110
> [    6.624316] lr : try_enable_new_console+0xa0/0x140
> [    6.624318] sp : ffffffc010843a30
> [    6.624320] x29: ffffffc010843a30 x28: ffffffe645c3e7d0
> [    6.624325] x27: ffffff80f8022180 x26: ffffffc010843b28
> [    6.637937] x25: 0000000000000000 x24: ffffffe6462a2000
> [    6.637941] x23: ffffffe646398000 x22: 0000000000000000
> [    6.637945] x21: 0000000000000000 x20: ffffffe6462a5ce8
> [    6.637952] x19: ffffffe646398e38 x18: ffffffffffffffff
> [    6.680296] x17: 0000000000000000 x16: ffffffe64492b900
> [    6.680300] x15: ffffffe6461e9d08 x14: 69202930203d2064
> [    6.680305] x13: 7561625f65736162 x12: 202c363331203d20
> [    6.696434] x11: 0000000000000030 x10: 0101010101010101
> [    6.696438] x9 : 4d4d20746120304d x8 : 7f7f7f7f7f7f7f7f
> [    6.707249] x7 : feff4c524c787373 x6 : 0000000000008080
> [    6.707253] x5 : 0000000000000000 x4 : 8080000000000000
> [    6.707257] x3 : 0000000000000000 x2 : ffffffe645d4e6cc
> [    6.744223] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate: failed to find OPP for freq 102400000 (-34)
> [    6.744966] x1 : fffffffefe74e174 x0 : ffffffe6462a5ce8
> [    6.753580] qcom_geni_serial 898000.serial: dev_pm_opp_set_rate: failed to find OPP for freq 102400000 (-34)
> [    6.761634] Call trace:
> [    6.761639]  qcom_geni_console_setup+0x0/0x110
> [    6.761645]  register_console+0x29c/0x2f8
> [    6.767981] Bluetooth: hci0: Frame reassembly failed (-84)
> [    6.775252]  uart_add_one_port+0x438/0x500
> [    6.775258]  qcom_geni_serial_probe+0x2c4/0x4a8
> [    6.775266]  platform_drv_probe+0x58/0xa8
> [    6.855359]  really_probe+0xec/0x398
> [    6.855362]  driver_probe_device+0x5c/0xb8
> [    6.855367]  __device_attach_driver+0x98/0xb8
> [    7.184945]  bus_for_each_drv+0x74/0xd8
> [    7.188825]  __device_attach+0xec/0x148
> [    7.192705]  device_initial_probe+0x24/0x30
> [    7.196937]  bus_probe_device+0x9c/0xa8
> [    7.200816]  deferred_probe_work_func+0x7c/0xb8
> [    7.205398]  process_one_work+0x20c/0x4b0
> [    7.209456]  worker_thread+0x48/0x460
> [    7.213157]  kthread+0x14c/0x158
> [    7.216432]  ret_from_fork+0x10/0x18
> [    7.220049] Code: bad PC value
> [    7.223139] ---[ end trace 73f3b21e251d5a70 ]---
>
> Thus this patch removes the __init avoiding crash in such
> configs.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 3aa29d201f54..f7c6c7466520 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1098,7 +1098,7 @@ static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
>  }
>
>  #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
> -static int __init qcom_geni_console_setup(struct console *co, char *options)
> +static int qcom_geni_console_setup(struct console *co, char *options)
>  {
>         struct uart_port *uport;
>         struct qcom_geni_serial_port *port;
> --
> 2.17.1
>

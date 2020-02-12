Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E557415B415
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 23:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgBLWtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 17:49:20 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44501 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729132AbgBLWtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 17:49:19 -0500
Received: by mail-pf1-f196.google.com with SMTP id y5so1948721pfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 14:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=5VbKLkfPH8db+tDfl0W96JCz90PyOtNfa4s5IUcV6hU=;
        b=H5/REBRi+xtWl6KzofHGWgs5eR99ee6i83fXwQbNMKs5ecrgZyeNfol5UOcCMQYfyS
         vEOpqkKsCcLfnFuRIgsXLo3MpT1e4bgURtblOcwXug7AUd9761XQG78SokGCtM2FRXKn
         Xb4xkl0KB35yOxioPJCMZKqfBF9+lMHL4EmZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=5VbKLkfPH8db+tDfl0W96JCz90PyOtNfa4s5IUcV6hU=;
        b=Hona81DXmBZnNyVufQBKwx50hPaAok4ypEprIAfX4szyGRtLtLz8OCfzyN74pG2rUb
         57UiukqJWzRXJd86f0HF4yu4rmhekM+OtfSUmVE8jvKDG5pxPEjZcM21w99EHSJ8qaBp
         OtvvIGfIQRpS0AImV/m2eVgZgzfBmdwCTDcu5Rf/V4QlAd53eAYHZZmXsOTN0OI5w6i4
         NL0Y8SWPW+2psTjtxnyc4hmqY9zG0Z+uqxhEAYU3NNX3X72sB6O+JFmDGjNaEmUlKfZM
         iaHKVjH0/0aCqE8AfEklmCsUuWvEyM9DOk4nK+XdYnBrDXANHlXHZLOdsY5TgpYkDOJ5
         X2IA==
X-Gm-Message-State: APjAAAXwSiTDg8HehyStIGLCnHa0fsecZSUj4/ACOVOUKG7IhECGfFBg
        OqQxSCPowUFbm0CLORp14lQv0u9cq88=
X-Google-Smtp-Source: APXvYqxnqZasF+34DXy2Y+08uc5Z4EWTHHYp5kxcBO45Y4J1xFA0uE+4kkJ82AjYqoz84TVVDS4Big==
X-Received: by 2002:a63:2309:: with SMTP id j9mr14746259pgj.54.1581547757785;
        Wed, 12 Feb 2020 14:49:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b12sm282204pfr.26.2020.02.12.14.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 14:49:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581415982-8793-1-git-send-email-skakit@codeaurora.org>
References: <1581415982-8793-1-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Fix RX cancel command failure
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, akashast@codeaurora.org,
        satya priya <skakit@codeaurora.org>
To:     gregkh@linuxfoundation.org, satya priya <skakit@codeaurora.org>
Date:   Wed, 12 Feb 2020 14:49:16 -0800
Message-ID: <158154775640.184098.13898240474253130921@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting satya priya (2020-02-11 02:13:02)
> RX cancel command fails when BT is switched on and off multiple times.
>=20
> To handle this, poll for the cancel bit in SE_GENI_S_IRQ_STATUS register
> instead of SE_GENI_S_CMD_CTRL_REG.
>=20
> As per the HPG update, handle the RX last bit after cancel command
> and flush out the RX FIFO buffer.
>=20
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---

I'm pretty sure I saw an oops with this patch.

   Unable to handle kernel NULL pointer dereference at virtual address 0000=
000000000000
   Mem abort info:
     ESR =3D 0x96000046
     EC =3D 0x25: DABT (current EL), IL =3D 32 bits
   Bluetooth: hci_ldisc.c:hci_uart_register_proto() HCI UART protocol QCA r=
egistered
     SET =3D 0, FnV =3D 0
     EA =3D 0, S1PTW =3D 0
   Data abort info:
     ISV =3D 0, ISS =3D 0x00000046
     CM =3D 0, WnR =3D 1
   user pgtable: 4k pages, 39-bit VAs, pgdp=3D00000001b4645000
   [0000000000000000] pgd=3D00000001ac579003, pud=3D00000001ac579003, pmd=
=3D0000000000000000
   Internal error: Oops: 96000046 [#1] PREEMPT SMP
   Modules linked in: hci_uart(+) qcom_spmi_temp_alarm btqca qcom_spmi_adc5=
 qcom_vadc_common bluetooth ecdh_generic ecc venus_core v4l2_mem2mem videob=
uf2_v4l2 videobuf2_common ipa qcom_q6v5_mss qcom_q6v5_ipa_notify qcom_commo=
n qcom_q6v5 xt_MASQUERADE fuse rmtfs_mem iio_trig_sysfs cros_ec_sensors_rin=
g cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_=
buf cros_ec_sensorsupport ath10k_snoc qmi_helpers ath10k_core ath lzo_rle l=
zo_compress mac80211 zram cfg80211 joydev
   CPU: 7 PID: 258 Comm: kworker/u16:3 Tainted: G S      W         5.4.17 #=
19
   Workqueue: events_unbound async_run_entry_fn
   pstate: 60c00009 (nZCv daif +PAN +UAO)
   pc : handle_rx_uart+0x64/0x278
   lr : qcom_geni_serial_handle_rx+0x84/0x90
   sp : ffffff814348f960
   x29: ffffff814348f960 x28: ffffffd01ac24288
   x27: 0000000000000018 x26: 0000000000000002
   x25: 0000000000000001 x24: ffffff8146341348
   x23: ffffff8146341000 x22: ffffffd01accc978
   x21: ffffff8146341000 x20: 0000000000000001
   x19: 0000000000000001 x18: ffffffd01b22d000
   x17: 0000000000008000 x16: 00000000000000b0
   x15: ffffffd01afdbdd0 x14: ffffffd01b3edde0
   x13: ffffffd01b7fb000 x12: 0000000000000001
   x11: 0000000000000000 x10: 0000000000000000
   x9 : ffffffd010344780 x8 : 0000000000000000
   x7 : ffffffd019d8e768 x6 : 0000000000000000
   x5 : ffffffd01adbb000 x4 : 0000000000008004
   x3 : 0000000000000001 x2 : 0000000000000001
   x1 : 0000000000000001 x0 : ffffffd01accc978
   Call trace:
    handle_rx_uart+0x64/0x278
    qcom_geni_serial_handle_rx+0x84/0x90
    qcom_geni_serial_stop_rx+0x110/0x180
    qcom_geni_serial_port_setup+0x68/0x1b0
    qcom_geni_serial_startup+0x24/0x70
    uart_startup+0x164/0x28c
    uart_port_activate+0x6c/0xbc
    tty_port_open+0xa8/0x114
    uart_open+0x28/0x38
    ttyport_open+0x7c/0x164
    serdev_device_open+0x38/0xe4
    hci_uart_register_device+0x54/0x2e8 [hci_uart]
    qca_serdev_probe+0x1c4/0x374 [hci_uart]
    serdev_drv_probe+0x3c/0x64
    really_probe+0x144/0x3f8
    driver_probe_device+0x70/0x140
    __driver_attach_async_helper+0x7c/0xa8
    async_run_entry_fn+0x60/0x178
    process_one_work+0x33c/0x640
    worker_thread+0x2a0/0x470
    kthread+0x128/0x138
    ret_from_fork+0x10/0x18
   Code: 1aca096a 911e0129 b940012b 7100054a (b800450b)

> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 191abb1..0bd1684 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -599,7 +600,7 @@ static void qcom_geni_serial_stop_rx(struct uart_port=
 *uport)
>         u32 irq_en;
>         u32 status;
>         struct qcom_geni_serial_port *port =3D to_dev_port(uport, uport);
> -       u32 irq_clear =3D S_CMD_DONE_EN;
> +       u32 s_irq_status;
> =20
>         irq_en =3D readl(uport->membase + SE_GENI_S_IRQ_EN);
>         irq_en &=3D ~(S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN);
> @@ -615,10 +616,19 @@ static void qcom_geni_serial_stop_rx(struct uart_po=
rt *uport)
>                 return;
> =20
>         geni_se_cancel_s_cmd(&port->se);
> -       qcom_geni_serial_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
> -                                       S_GENI_CMD_CANCEL, false);
> +       qcom_geni_serial_poll_bit(uport, SE_GENI_S_IRQ_STATUS,
> +                                       S_CMD_CANCEL_EN, true);
> +       /*
> +        * If timeout occurs secondary engine remains active
> +        * and Abort sequence is executed.
> +        */
> +       s_irq_status =3D readl(uport->membase + SE_GENI_S_IRQ_STATUS);
> +       /* Flush the Rx buffer */
> +       if (s_irq_status & S_RX_FIFO_LAST_EN)
> +               qcom_geni_serial_handle_rx(uport, true);

This seems to be the problematic line. We didn't call handle_rx() from
the stop_rx() path before. And this qcom_geni_serial_stop_rx() function
is called from qcom_geni_serial_startup(), but most importantly, we call
into this function from startup before we allocate memory for the
port->rx_fifo member (see the devm_kcalloc() later in
qcom_geni_serial_port_setup() and see how it's after we stop rx).

Why do we need to flush the rx buffer by reading it into the software
buffer? Can't we simply ack any outstanding RX interrupts in the
hardware when we're stopping receive?

> +       writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
> +
>         status =3D readl(uport->membase + SE_GENI_STATUS);
> -       writel(irq_clear, uport->membase + SE_GENI_S_IRQ_CLEAR);
>         if (status & S_GENI_CMD_ACTIVE)
>                 qcom_geni_serial_abort_rx(uport);

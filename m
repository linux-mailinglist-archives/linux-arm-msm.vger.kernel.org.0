Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2D9B80B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 20:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391334AbfISSV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 14:21:26 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45756 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388700AbfISSV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 14:21:26 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so2814491pfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=fUmoOPRZi5RQiXCOcrZadGCPanGs+taMVA4xIJYeTgg=;
        b=N09/JqMAQarJVy2xmqV240gl6fF8H83MxMa8AjZ9kEym9VaFg1ipQCdLbtTFsw5j8A
         GW80sjHDG6HTMfli4Qm5dc5KEu4lHu2/EF+Ok11Tgh+hcLPn6rkMuZ4xV6PuE+j93JeM
         c98SS59abcRYXnjg/teYhDL923Graq2z7Axxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=fUmoOPRZi5RQiXCOcrZadGCPanGs+taMVA4xIJYeTgg=;
        b=YOBPuYfj0Te3mUWRbccEDzLVM+C9qhwFiemammzMChyfkxQiI6v48pxqhNFlEPRE+L
         EVQaIcIhNv46stjRQMrWywlmzv3EdFU1rMpnp0cpyvXKNFXhYqCXGEy49/VzPLm9pmJL
         x3rlV8Uyqix+FJtcDJDrL+PbhBrwViFditikp1jMG3zN+Ny15Icz6zFT2IogAU6T05gD
         xLvDEcQLwvLYbLyB7hA4VHLhgI8COnSn7F6jdRRW08trDd2h1aFpSl6NCKHk3+thQgL8
         HH54LOjALNvLVpxsNQ2AI9Mf+Rf3nOfsXjsws53aWl3RhV0rumroVphhj1IT3/M0EJ14
         YITg==
X-Gm-Message-State: APjAAAWSvgycqnUSh67ircQdbnxvs7vqd8Kw9DkpxVNW3eFZbtV3ytfA
        QPsv8+/RNb1yLLTBPAKLLX8IOhDqHX0=
X-Google-Smtp-Source: APXvYqwX4XRr0BR0BlJpeELolzq0P57QnpLZaD991bS3iCQGI89+yUHTZAfC3EblSUmWDONI04skKw==
X-Received: by 2002:a65:4002:: with SMTP id f2mr10533562pgp.447.1568917285625;
        Thu, 19 Sep 2019 11:21:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s1sm19647733pjs.31.2019.09.19.11.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 11:21:25 -0700 (PDT)
Message-ID: <5d83c725.1c69fb81.9e57a.5569@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1568877366-1758-1-git-send-email-akashast@codeaurora.org>
References: <1568877366-1758-1-git-send-email-akashast@codeaurora.org>
Cc:     mgautam@codeaurora.org, jslaby@suse.com,
        bjorn.andersson@linaro.org, Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] tty: serial: qcom_geni_serial: Wakeup over UART RX
User-Agent: alot/0.8.1
Date:   Thu, 19 Sep 2019 11:21:24 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-09-19 00:16:06)
> Add system wakeup capability over UART RX line for wakeup capable UART.
> When system is suspended, RX line act as an interrupt to wakeup system
> for any communication requests from peer.
>=20
> Cleanup of IRQ registration, moving it to probe from startup function.

Probably should be a different patch than the one that adds wakeup irq
handling.

>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 73 +++++++++++++++++++++++++++++=
------
>  1 file changed, 62 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 35e5f9c..43d1da4 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -19,6 +19,8 @@
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/irq.h>

Can you sort these includes alphabetically? Or at least attempt to place
this somewhere in there alphabetically?

> =20
>  /* UART specific GENI registers */
>  #define SE_UART_LOOPBACK_CFG           0x22c
> @@ -98,6 +100,8 @@
>  #define CONSOLE_RX_BYTES_PW 4
>  #endif
> =20
> +#define WAKEUP_EVENT_MSEC   2000

This is used one place. Just inline it and drop this define.

> +
>  struct qcom_geni_serial_port {
>         struct uart_port uport;
>         struct geni_se se;
> @@ -115,6 +119,7 @@ struct qcom_geni_serial_port {
>         bool brk;
> =20
>         unsigned int tx_remaining;
> +       int wakeup_irq;
>  };
> =20
>  static const struct uart_ops qcom_geni_console_pops;
> @@ -756,6 +761,15 @@ static void qcom_geni_serial_handle_tx(struct uart_p=
ort *uport, bool done,
>                 uart_write_wakeup(uport);
>  }
> =20
> +static irqreturn_t qcom_geni_serial_wakeup_isr(int isr, void *dev)
> +{
> +       struct uart_port *uport =3D dev;
> +
> +       pm_wakeup_event(uport->dev, WAKEUP_EVENT_MSEC);
> +
> +       return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
>  {
>         u32 m_irq_en;
> @@ -1290,6 +1297,8 @@ static int qcom_geni_serial_probe(struct platform_d=
evice *pdev)
>         port->rx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
>         port->tx_fifo_width =3D DEF_FIFO_WIDTH_BITS;
> =20
> +       scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s%d",
> +               (uart_console(uport) ? "console" : "uart"), uport->line);

This looks like an unrelated change?

>         irq =3D platform_get_irq(pdev, 0);
>         if (irq < 0) {
>                 dev_err(&pdev->dev, "Failed to get IRQ %d\n", irq);
> @@ -1297,6 +1306,39 @@ static int qcom_geni_serial_probe(struct platform_=
device *pdev)
>         }
>         uport->irq =3D irq;
> =20
> +       irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(uport->dev, uport->irq, qcom_geni_serial=
_isr,
> +                               IRQF_TRIGGER_HIGH, port->name, uport);
> +       if (ret) {
> +               dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (!console) {
> +               port->wakeup_irq =3D platform_get_irq(pdev, 1);

Can you use dev_pm_set_wake_irq() instead?

> +               if (port->wakeup_irq < 0) {
> +                       dev_err(&pdev->dev, "Failed to get wakeup IRQ %d\=
n",
> +                                                       port->wakeup_irq);
> +               } else {
> +                       dev_info(&pdev->dev, "wakeup_irq =3D%d\n",
> +                               port->wakeup_irq);

Please no dev_info() messages like this.

> +                       irq_set_status_flags(port->wakeup_irq, IRQ_NOAUTO=
EN);
> +                       ret =3D devm_request_irq(uport->dev, port->wakeup=
_irq,
> +                               qcom_geni_serial_wakeup_isr,
> +                               IRQF_TRIGGER_FALLING, "uart_wakeup", upor=
t);
> +                       if (ret) {
> +                               dev_err(uport->dev, "Failed to register w=
akeup "
> +                                       "IRQ ret %d\n", ret);

Don't split format strings across many lines. The arguments can go to a
different line, but the string can be on a single line.

> +                               return ret;
> +                       }
> +
> +                       device_init_wakeup(&pdev->dev, true);
> +                       ret =3D enable_irq_wake(port->wakeup_irq);
> +                       if (unlikely(ret))
> +                               dev_err(uport->dev, "%s:Failed to set IRQ=
 "
> +                                       "wake:%d\n", __func__, ret);
> +               }
> +       }
>         uport->private_data =3D drv;
>         platform_set_drvdata(pdev, port);
>         port->handle_rx =3D console ? handle_rx_console : handle_rx_uart;
> @@ -1311,6 +1353,7 @@ static int qcom_geni_serial_remove(struct platform_=
device *pdev)
>         struct uart_driver *drv =3D port->uport.private_data;
> =20
>         uart_remove_one_port(drv, &port->uport);
> +
>         return 0;
>  }
> =20

This hunk shouldn't be here. Please drop


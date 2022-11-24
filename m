Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 340AA637BE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 15:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbiKXOwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 09:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiKXOwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 09:52:01 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C1114F9D5
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 06:51:25 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id 128so1714719vsz.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=saSlvoXli5roPdfQjc0COfGftVZoPty/RFt6GhCwe+A=;
        b=gT/QVfsW8Jl2L3jgcVaSPpWfvSeebUi7AcuC3qu3LlVAS2DGxJdK+PnuuXxT0gD8VY
         0oOuk5VbTWrgiO6pPWuBMVRnpuPhIcgSkiGrLNM05oeNdRkaRqh5WAAZNP2LQQWVzSKl
         C6Mr577QeXYx8iILSUTpUXfZ/BJ3fvhqazsIx3OVr2fEhRBGVqWpvyPF2OIzVVKHCHtH
         xMaVAowkY26QvHEIe0hxKO0Z09LWMDDMOeo9rfgGxdnwcCdr53+TMjech2S78WLA0ajr
         s/V5naZIBTmMJ0Aqj3mmL/IY7zibk7sdBrx5QAljtihMolDjJ2ndvzmzxCaVCtBsWI4q
         mDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saSlvoXli5roPdfQjc0COfGftVZoPty/RFt6GhCwe+A=;
        b=fk0JjPbKNQOTmcoayZWXzVkQXaD5QiwbDDrKfThl9/gnWGIvSDOEQ/T7E/LJBzz4Bc
         4sEYe9YoNIajuWo6IDnicRc7yFcxYvj4Gn14vd/0H5P1Loxa4xNs+ZEivJKiqne35Mq4
         usMUpWcqYHkbMjvRTR0s9Du/JX3PEGqfe6nFk1h55OHJwMlXJqnBngID6gtKqnW5tFe+
         BLg9XXeW5rgRGcQxglnruzLMlkany8edVKWfhCVhv6BeYd1+6dq5hTOTaON6P75iMb+0
         +8iauqKLm3WZHCNg5UhoC49NhAmzQwO13tZJrb9zDiajDbzQYvFi2Lc8O1NEdK94u5W5
         6jMA==
X-Gm-Message-State: ANoB5pkz0Wg265sGr5fUpAvKXjqxNnYI4BHAEOVeThq807/MFhDPxJRH
        Jb/FvcNk9GWRyguQBdaPwBDLQBdBmPtt/USAY/G5Wg==
X-Google-Smtp-Source: AA0mqf4oF0Md4QcSPaayMyHgMPSBM2LSp+i9R9Gs2DPnZ7VBAOmLy6vOz3lur+ZZfsybqDsBIkg0QgAnxYqJY4w8KqY=
X-Received: by 2002:a67:e8d7:0:b0:3b0:767f:e291 with SMTP id
 y23-20020a67e8d7000000b003b0767fe291mr3351904vsn.47.1669301484092; Thu, 24
 Nov 2022 06:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20221123110759.1836666-1-brgl@bgdev.pl> <20221123110759.1836666-9-brgl@bgdev.pl>
 <4f4b7e8b-8017-2a6f-f756-46c60fba8a3c@kernel.org>
In-Reply-To: <4f4b7e8b-8017-2a6f-f756-46c60fba8a3c@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 24 Nov 2022 15:51:13 +0100
Message-ID: <CAMRc=Me2ofiOs4Ue5oa+a6ngdf-NC8JuUC77XVnucoGR=C3zag@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] tty: serial: qcom-geni-serial: refactor qcom_geni_serial_handle_tx()
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 24, 2022 at 8:18 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 23. 11. 22, 12:07, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > qcom_geni_serial_handle_tx() is pretty big, let's move the code that
> > handles the actual writing of data to a separate function which makes
> > sense in preparation for introducing a dma variant of handle_tx().
> >
> > Let's also shuffle the code a bit, drop unneeded variables and use
> > uart_xmit_advance() instead of handling tail->xmit manually.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   drivers/tty/serial/qcom_geni_serial.c | 54 +++++++++++++--------------
> >   1 file changed, 27 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index 68a1402fbe58..658b6d596f58 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -704,19 +704,42 @@ static void qcom_geni_serial_start_rx(struct uart_port *uport)
> >       writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
> >   }
>
> I know you just shuffle the code, but:
>
> > +static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
> > +                                          unsigned int chunk)
> > +{
> > +     struct qcom_geni_serial_port *port = to_dev_port(uport);
> > +     struct circ_buf *xmit = &uport->state->xmit;
> > +     u8 buf[BYTES_PER_FIFO_WORD];
> > +     size_t remaining = chunk;
>
> Why size_t when the others are uints? Well, BYTES_PER_FIFO_WORD should
> be defined as 4U.

Good point.

>
> > +     unsigned int tx_bytes;
> > +     int c;
> > +
> > +     while (remaining) {
> > +             memset(buf, 0, sizeof(buf));
> > +             tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
>
> Then, no need for min_t.
>

Same.

> > +
> > +             for (c = 0; c < tx_bytes ; c++) {
> > +                     buf[c] = xmit->buf[xmit->tail];
> > +                     uart_xmit_advance(uport, 1);
> > +             }
> > +
> > +             iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
>
> I wonder, why is _rep variant used to transfer a single word? Only to
> hide the cast?
>

Even if - using writel() with a cast doesn't seem to improve the
performance and this one looks prettier IMO.

Bartosz

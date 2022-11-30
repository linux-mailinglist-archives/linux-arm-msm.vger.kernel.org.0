Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C42663D5E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 13:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235084AbiK3MoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 07:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbiK3MoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 07:44:08 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECCB4F183
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 04:44:08 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id q128so845863vsa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 04:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MNA7eZi9VQf69CeBVlQwZ04/y+5gTO1SaFbD25OjShk=;
        b=uSk5JtGDkFtZkUVlSh2i3p7XW+BEpm0qle2Qeku5sBhEFvEtjxwJcJO/dKAIH6mtnM
         ihCM776HxUIm9bISIC0XuUG2ntUDh43aYrOMKAm8kyIKgsGhNiQWX3jWqJ7nrDkcrJux
         P6HiyheNg1ARMUwTofYkN+5TdwWAD+Ief4jrVs3kTBRmPfEJV+1Fj/Kobmxo1TAft8FS
         86v6pEod24fy4y15bRVI/fgHouGGWPW/5cHlox5WDNAg1oMIcSXrXjoxUuke9vjsCIUJ
         /Tk2xkrcwu9Rx5yVD7NwJ2YtxgrQifkgBuMZI59vLsuMVQHnRn7y6HHSroWm49Z+GqcQ
         dgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNA7eZi9VQf69CeBVlQwZ04/y+5gTO1SaFbD25OjShk=;
        b=sD7yLk0NyEZ2bqRAWvbfiafXqfKOislcs+f9HHLE7s83ou/fmDxFUmHGrRkAayXFgB
         tFX1zHfTbiJkoBCfJrLeZe71OSw9wG6AnwEvSFXtAO7obtfwDd2D+C+V+e8G/gorUGsA
         obGtsh/MgCWxY5xJpUjx0gEp3RrTuwV7FmeUDOMhs0PrFKDB2NvvGF9N624Eo10HFNxn
         IgKqZ7tK2SlgNzXcnxRxF588O7oC4NrOsyDFjO1DJ4pOfZ/NdGcJm6qUBcalkD1uOZcg
         u1Qw9AYQMmGYOPfHko3nSGYZvOLFayThDhT+0l7R83M66X8D9dTHBdDLdl9L/7pyXNvg
         3mBA==
X-Gm-Message-State: ANoB5pkR2GMJ/1dOwuSeE1/Sw8x6mS2q2KdBkJ2++hCYi+TaBLZRh5ki
        SHWhrzcobuECJZ7b23f3CpnUFPO90c+CWJ+qnx1AnQ==
X-Google-Smtp-Source: AA0mqf54Z2CrPKxSRMlbr73gv+438gnoVt/fuaLT9AfACCSJrTBHJXFmdawHwFRgJOYgsFogG3EQ+yCbag8p/gkY3HY=
X-Received: by 2002:a67:eb11:0:b0:3b0:c9bc:7abe with SMTP id
 a17-20020a67eb11000000b003b0c9bc7abemr3394360vso.61.1669812247176; Wed, 30
 Nov 2022 04:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20221129110012.224685-1-brgl@bgdev.pl> <20221129110012.224685-12-brgl@bgdev.pl>
 <22332676-9d3a-1e21-aa70-e9c367b19bd9@kernel.org>
In-Reply-To: <22332676-9d3a-1e21-aa70-e9c367b19bd9@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Nov 2022 13:43:56 +0100
Message-ID: <CAMRc=MczfMKYEWfV_WOazXni9FbXX8x_iwjm4URD7-WWQQmUsA@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] tty: serial: qcom-geni-serial: stop operations
 in progress at shutdown
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 30, 2022 at 10:37 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 29. 11. 22, 12:00, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > We don't stop transmissions in progress at shutdown. This is fine with
> > FIFO SE mode but with DMA it causes trouble so fix it now.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >   drivers/tty/serial/qcom_geni_serial.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > index fe15fc0e1345..c0270eec2a66 100644
> > --- a/drivers/tty/serial/qcom_geni_serial.c
> > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > @@ -864,6 +864,9 @@ static void get_tx_fifo_size(struct qcom_geni_serial_port *port)
> >
> >   static void qcom_geni_serial_shutdown(struct uart_port *uport)
> >   {
> > +     qcom_geni_serial_stop_tx(uport);
> > +     qcom_geni_serial_stop_rx(uport);
> > +
> >       disable_irq(uport->irq);
>
> I'm just asking without actually looking into the code: cannot the
> interrupt reschedule/restart the above?
>

It can actually, good catch, thanks.

Bart

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E78A4D80B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 22:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbfJOUKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 16:10:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43110 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfJOUKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 16:10:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id a2so13162752pfo.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=yxjs1RvXnbn1IZBgaNqgR5bQ9+stKTuRJlL019UWCRA=;
        b=Qm5KveM00WDQPp4pK8aE3SWqNiZl+ACQSVu64EPYprz81eVox+SaWcBCvyNhb4cSVR
         r9awCxhEces9anLtucD6llKsQBMGQvGyOir0bvw+JHhcPJ+568dUJrTQxjsiFaMTdEes
         aE/LjYbFPN86X+t+JKkhBtIfzQvu12WIjlGpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=yxjs1RvXnbn1IZBgaNqgR5bQ9+stKTuRJlL019UWCRA=;
        b=nJ7alBHFW8J0mQMGiPsc6DflsWk/1dm88s5LS0mGiMZtRGLDxcpruilBqB/ISV1KsY
         y/uHtxELaTwmSP0RlZthQz0e4a9gUyuHcXo73ZdhHtkAy3i252c15t3TdZ8Faeiyjn3G
         fFnfWMyOc8vl5TcZP7KEuYU+go/52+Hy+heLeG/h7h+BDU42FnNUTwqxnrrMhMp2G+Jx
         sj5jX4IClW1evHPczWH/bGJZfRPqC0cBfhPXa+Z5w5u9RXFQszT1NQakeX5KWs/dDIIz
         0lqjOXAemImGdTi2yz/D/jJ4rQGjKDLfFE4DG0km5Av1QzEW6WXnPbyEzkDy2WpPnpzs
         7ASQ==
X-Gm-Message-State: APjAAAUQHj1q+a/MHEomsI4m7pIeGfrDHoFovRnYQrEXMUwHcGv6pft2
        jgWDY9XyxI9qYHQNy6VwuD4pyw==
X-Google-Smtp-Source: APXvYqxQYkIuEQpbk0mFhe3JVUXLFIUm1OCu5Ltes0M3GteYJ2gUoWmBllyjB+oNfbeZTzAMIl+fCg==
X-Received: by 2002:a65:66c6:: with SMTP id c6mr26343960pgw.250.1571170219131;
        Tue, 15 Oct 2019 13:10:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h1sm23712189pfk.124.2019.10.15.13.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 13:10:18 -0700 (PDT)
Message-ID: <5da627aa.1c69fb81.e2d51.203d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a7dabb1d-b6af-acc5-ba4e-923ee5fc6ee3@codeaurora.org>
References: <1570700803-17566-1-git-send-email-akashast@codeaurora.org> <5d9f3f4f.1c69fb81.5120f.b90e@mx.google.com> <a7dabb1d-b6af-acc5-ba4e-923ee5fc6ee3@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH V2 2/2] tty: serial: qcom_geni_serial: Wakeup over UART RX
User-Agent: alot/0.8.1
Date:   Tue, 15 Oct 2019 13:10:17 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-10-11 02:48:42)
>=20
> On 10/10/2019 7:55 PM, Stephen Boyd wrote:
> > Quoting Akash Asthana (2019-10-10 02:46:43)
> >> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/seria=
l/qcom_geni_serial.c
> >> index 5180cd8..ff63728 100644
> >> --- a/drivers/tty/serial/qcom_geni_serial.c
> >> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >> @@ -1306,6 +1317,29 @@ static int qcom_geni_serial_probe(struct platfo=
rm_device *pdev)
> >> +               if (port->wakeup_irq < 0) {
> >> +                       dev_err(&pdev->dev, "Failed to get wakeup IRQ =
%d\n",
> >> +                                       port->wakeup_irq);
> >> +               } else {
> >> +                       irq_set_status_flags(port->wakeup_irq, IRQ_NOA=
UTOEN);
> >> +                       ret =3D devm_request_irq(uport->dev, port->wak=
eup_irq,
> >> +                               qcom_geni_serial_wakeup_isr,
> >> +                               IRQF_TRIGGER_FALLING, "uart_wakeup", u=
port);
> >> +                       if (ret) {
> >> +                               dev_err(uport->dev, "Failed to registe=
r wakeup IRQ ret %d\n",
> >> +                                               ret);
> >> +                               return ret;
> >> +                       }
> >> +
> >> +                       device_init_wakeup(&pdev->dev, true);
> >> +                       ret =3D dev_pm_set_wake_irq(&pdev->dev, port->=
wakeup_irq);
> > Why can't we use dev_pm_set_dedicated_wake_irq() here?
>=20
> If we use this API then handler "handle_threaded_wake_irq" uses device=20
> specific pm_runtime functions to wake the device and currently this
>=20
> driver don't support runtime PM callbacks. Also, we want to register=20
> "qcom_geni_serial_wakeup_isr" as our IRQ handler for wakeup scenario.
>=20

Why can't we make this driver use runtime PM?


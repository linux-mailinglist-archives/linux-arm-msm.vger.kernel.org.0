Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 046ECD80B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 22:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732990AbfJOULG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 16:11:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42743 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfJOULF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 16:11:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so10098502pls.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 13:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=gfgRNlSBMuDArnM9WrkHT8iAonunUiE1DNvm69cqm9Q=;
        b=oFyIjarCcM+JvUEnOibvPfV4IgwdSzExgdwb1VNULLZx/A0O/fVxpkuIpfwTMlB2/q
         igdwkc30RR8oOhlHrioHWBkabtYSVpLgOBM1RuRn+vG46hPz/puamZ8KBfNx+iX7X8rg
         fY4p0665JwpIuFNrXy1hoxbE9RgHIMv8g5d1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=gfgRNlSBMuDArnM9WrkHT8iAonunUiE1DNvm69cqm9Q=;
        b=Oic+Fyz6q6Ucj+l0PCMDzTZ9unwXqj/La9MYQKVzGlocnV0QTui6WUcgoWiIDNMv6T
         uG9d44pCMoFhbzJsp9fiOtCy9nuBtStIzcuK8QNfT0nr1h5lFGnZbOQAWzb0DANMgrBC
         fbN0DJ9nt6bk+EUkNV+eXTgfzD3+4UE2qB2zxdlJYonSLTOtTXQA8X+yVwXmDhE7yuZz
         mPP2BXswYbSdZ+Ke5R3d/ruCU22HqiiRESO8Q7CjLWz/zYA4Xpx9Yctsy9xee5qHgzyE
         KQQhmD6rB/7kTR5FZCp1Lceax2gS4mY4IJhAizIxKggtd+fUMv/oo+YtPIDSeTkTQlfc
         ddNg==
X-Gm-Message-State: APjAAAXMocfTEzQc+zZlp5kOGaUKNUeH+CSufjqJNBYKfnu9Z74XXGVm
        Qj2RNh6AP9PAFW/QTZQMprTanw==
X-Google-Smtp-Source: APXvYqzVzWLptLblvOAErFGvG3ccz3nn5xkPAnAfkc2zeM2iCnFtoGOf8szncLcImzvlalAtIhCiRQ==
X-Received: by 2002:a17:902:7891:: with SMTP id q17mr13527184pll.241.1571170265257;
        Tue, 15 Oct 2019 13:11:05 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m68sm24112693pfb.122.2019.10.15.13.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 13:11:04 -0700 (PDT)
Message-ID: <5da627d8.1c69fb81.82267.2a50@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <010dd569-d172-fdcf-0bfa-8caaf41a4d46@codeaurora.org>
References: <1570700763-17319-1-git-send-email-akashast@codeaurora.org> <5d9f3dfa.1c69fb81.84c4b.30bf@mx.google.com> <010dd569-d172-fdcf-0bfa-8caaf41a4d46@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH V2 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
User-Agent: alot/0.8.1
Date:   Tue, 15 Oct 2019 13:11:03 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-10-11 00:39:06)
>=20
> On 10/10/2019 7:49 PM, Stephen Boyd wrote:
> > Quoting Akash Asthana (2019-10-10 02:46:03)
> >> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/seria=
l/qcom_geni_serial.c
> >> index 14c6306..5180cd8 100644
> >> --- a/drivers/tty/serial/qcom_geni_serial.c
> >> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >> @@ -1297,11 +1291,21 @@ static int qcom_geni_serial_probe(struct platf=
orm_device *pdev)
> >>          port->rx_fifo_depth =3D DEF_FIFO_DEPTH_WORDS;
> >>          port->tx_fifo_width =3D DEF_FIFO_WIDTH_BITS;
> >>  =20
> >> +       scnprintf(port->name, sizeof(port->name), "qcom_geni_serial_%s=
%d",
> >> +               (uart_console(uport) ? "console" : "uart"), uport->lin=
e);
> > Drop useless parenthesis. Also, it might make more sense to make this a
> > devm_kasprintf() call now.
>=20
> OK
>=20
> >>          irq =3D platform_get_irq(pdev, 0);
> >>          if (irq < 0)
> >>                  return irq;
> >>          uport->irq =3D irq;
> >>  =20
> >> +       irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> > Is there a reason why we can't always leave the irq enabled and request
> > it later once the uart structure has been fully initialized?
>=20
> According to current design we are requesting IRQ handler in probe, and=20
> we enable and disable it from the startup(port open) and shutdown(port=20
> close) function respectively.
>=20
> We need to call for disable_irq in shutdown function because client has=20
> closed the port and we don't expect any transfer requests after it.
>=20
> >>request it later once the uart structure has been fully initialized?
>=20
>  =C2=A0=C2=A0=C2=A0 Is the ask is to move request irq later in probe afte=
r the uport is=20
> fully initialized?

Yes I'm wondering if we can get rid of the IRQ_NOAUTOEN and
irq_enable/disable bits in here and leave the interrupt enabled all the
time.


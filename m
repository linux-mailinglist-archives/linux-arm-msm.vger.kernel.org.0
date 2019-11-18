Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4721007D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 16:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfKRPEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 10:04:08 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:36543 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfKRPEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 10:04:08 -0500
Received: by mail-io1-f66.google.com with SMTP id s3so19115360ioe.3;
        Mon, 18 Nov 2019 07:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+oZ6XBVVe7I1cX+s2sXIa4IM62fmxh9531yoCFXPTGM=;
        b=lSF53An03LtCGNOi36GN9iCZ2FyJft6Lik0Rk7cyOReJNpl9VO5hN52HU9NTwc+LdP
         dESjXptW4UJYEC/AuVVPapfonwMb3ZYrfdJZ1mvWq46f8ilQPc7NPApBJkPxhXTetZUS
         c0/W50PPQfFqvWjcbYy1rtgjtZwWo8yeC5dp9oXmIA8T8KlVybAbIYNtnMT75Syr5i1B
         RJiy6UXyhvXH8AoOue873uvKsH1TqguUtNpNcHJFsx5ePlpWuGexKOrMP2dRWZI9vuUX
         VYIt6+1bu6kIH0yxCfXX/cFwEWriUvp0pQcxTHx4xUy4BJG+TMVTxL8Rbwg6gCcXtUtn
         TAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+oZ6XBVVe7I1cX+s2sXIa4IM62fmxh9531yoCFXPTGM=;
        b=r5jezo/KG79KG+5BBgM2IT70Kh4qHAcTwiMciUEidn0zdl/GQH0RNddcbQxomtI/Uf
         p9xHY2k6v3b1hPbz8Ivlkv3wojZd58Lm/4mz+O+aLSPD/Q88O8xLRpP40fIhS+rLvNOg
         yg8QudjeB0pXWbbFUGQHklU7nKM1hRhakxCXiKTMrd0DC4GiKJBhshzrdIJaR/S0akHB
         qqGhb06Ec1lsgWOxiypYeFHwQgX1x1wWXEqtFYqTM9oWBDDrqDvDqIRct3wWtMpkM8Ub
         XlMm60gkRm2W6MMz2kNUCa9BgB3Vv7al9Hn55mfYm0XYoDaGoUaNcb4KlUkg8rElMr96
         AP3Q==
X-Gm-Message-State: APjAAAXZoSEIy0HbLjy0syHTM1fhYQ3vcH+UCbWkMDQ9czI+ZKqmIQhx
        i2gQWC9qUdJjt1MWuDEW4kkrHXApOrNQNtiD7oJeTw==
X-Google-Smtp-Source: APXvYqyFD76RdMxNtH9QSsm4I2faOgXkxZzcI2NcZCJGSGNQ/Z/74ydbBjpOOw5pDA4LFIo37UsslQXGhKPxptOIV78=
X-Received: by 2002:a5d:8195:: with SMTP id u21mr13641994ion.178.1574089447316;
 Mon, 18 Nov 2019 07:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20191116064415.159899-1-bjorn.andersson@linaro.org>
 <CAOCk7Nov_HvZe1Z6COd2z=VUf=mVbvqS4wjqU4Ee=F1qR_KKww@mail.gmail.com> <20191118024145.GC25371@yoga>
In-Reply-To: <20191118024145.GC25371@yoga>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 18 Nov 2019 08:03:56 -0700
Message-ID: <CAOCk7Np=SfjThR3mTJDsHMAKsisemYRUzKr6BawNCEy8jPPkdQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-mtp: Add alias for blsp1_uart3
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 17, 2019 at 7:41 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 16 Nov 14:24 PST 2019, Jeffrey Hugo wrote:
>
> > On Fri, Nov 15, 2019 at 11:44 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > The msm_serial driver uses a simple counter to determine which port to
> > > use when no alias is defined, but there's no logic to prevent this from
> >
> > Which port to use for what, the default console?
> >
>
> The driver defines three (3) struct uart_ports (wrapped in struct
> msm_ports), see msm_uart_port[] around line 1538 in msm_serial.c
>
> This means that you can have a whooping 3 instances of msm_serial in the
> system and per the logic found in msm_serial_probe() the allocation
> follows the serial%d aliases defined and for entries without an alias a
> simple counter, starting at 0 is used.

Ah.  Clearly no one needs more than 64k of memory, err 3 uart ports  :)

>
> > > not colliding with what's defined by the aliases. As a result either
> > > none or all of the active msm_serial instances must be listed as
> > > aliases.
> > >
> > > Define blsp1_uart3 as "serial1" to mitigate this problem.
> > >
> > > Fixes: 4cffb9f2c700 ("arm64: dts: qcom: msm8998-mtp: Enable bluetooth")
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > That driver behavior seems like a strange thing to be doing.
> >
> > If you clarify the question above, -
> > Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >
>
> Thanks, I'll respin the message to properly document this behavior.

Sounds good.

>
> Regards,
> Bjorn
>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > index 5f101a20a20a..e08fcb426bbf 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
> > > @@ -9,6 +9,7 @@
> > >  / {
> > >         aliases {
> > >                 serial0 = &blsp2_uart1;
> > > +               serial1 = &blsp1_uart3;
> > >         };
> > >
> > >         chosen {
> > > --
> > > 2.23.0
> > >

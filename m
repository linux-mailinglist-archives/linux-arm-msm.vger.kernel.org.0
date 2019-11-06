Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8B8F1B58
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 17:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfKFQdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 11:33:12 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33664 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbfKFQdM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 11:33:12 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay6so4680414plb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 08:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=00V3WJFb5rO82O7XfR0kzDjatLtK55P+gD7GWSvuxzw=;
        b=B6O+Xc9zGMlVC1YNQXYFKtnVpIBbZxa3Ii/+adCcenjr/PWjvgerHxjCzOc9ccsy5L
         SwdURhnl/eiUtGKg95qOGHzUrLQ8vLCt4H5ZDOO426HPCLfs4749oFrwa5qUdnAz0/An
         V1PfOdjsKeADhGFvSV04CV4W68I8r2+wEcGMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=00V3WJFb5rO82O7XfR0kzDjatLtK55P+gD7GWSvuxzw=;
        b=RyqxtYNA8UVVFf2nJ2jzjlHUtxAYLZmQFCJSMEWoVcl8LcmMOmE9YZSp0H8ZPrE8qq
         iddff86j4a6dk7zEuPjaG5T+3t8vyKeZvXUKeLJP0nAKjOAtdhQUT+55tc/nE2KiWw3Y
         iyWBDzyRsrcmleKtYjPzS6RNAHeKayX28xX2DflPcdR6CwwxSkykpmV8Mq+3zu+bu09u
         akW2QouuFgN14UH0RPKHgWmXjpRDTuG3N4J4pRlPiTS/2HOgRrBapdPMVG0SYfwVNE7v
         dJTbiW+62hwQNhI1sBrk0xoSJFBOQlQSYPSX8xSfNSZwBgL2E9nh4gAK582QKiVV7td7
         vLAQ==
X-Gm-Message-State: APjAAAVhy+zKFcyMCjsaJTAgzIB4hRtiJtYIoz4VymLpBRrsQvuwgAGW
        oAXnhHalc/1COueDWXrz2WPD0w==
X-Google-Smtp-Source: APXvYqwHOEOe6CHxy2Z9R86lbCs0kFodo0CzKU9DU05UAn8fpB29aTVrwpNDhSZ/swcEhvQ1LUhMVw==
X-Received: by 2002:a17:902:521:: with SMTP id 30mr3515849plf.37.1573057991258;
        Wed, 06 Nov 2019 08:33:11 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w62sm26735110pfb.15.2019.11.06.08.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 08:33:10 -0800 (PST)
Message-ID: <5dc2f5c6.1c69fb81.3483d.c535@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106121600.GA3105139@kroah.com>
References: <1572947835-30600-1-git-send-email-akashast@codeaurora.org> <20191105171705.GB2815774@kroah.com> <5dc21b1d.1c69fb81.8f924.e6e1@mx.google.com> <20191106121600.GA3105139@kroah.com>
Subject: Re: [PATCH v4 1/2] tty: serial: qcom_geni_serial: IRQ cleanup
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 08:33:09 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Greg KH (2019-11-06 04:16:00)
> On Tue, Nov 05, 2019 at 05:00:12PM -0800, Stephen Boyd wrote:
> > Quoting Greg KH (2019-11-05 09:17:05)
> > > On Tue, Nov 05, 2019 at 03:27:15PM +0530, Akash Asthana wrote:
> > > > @@ -1307,7 +1307,21 @@ static int qcom_geni_serial_probe(struct pla=
tform_device *pdev)
> > > >       port->handle_rx =3D console ? handle_rx_console : handle_rx_u=
art;
> > > >       if (!console)
> > > >               device_create_file(uport->dev, &dev_attr_loopback);
> > > > -     return uart_add_one_port(drv, uport);
> > > > +
> > > > +     ret =3D uart_add_one_port(drv, uport);
> > > > +     if (ret)
> > > > +             return ret;
> > >=20
> > > What is going to remove the sysfs file you just created above (in a r=
acy
> > > way, it's broken and needs to be fixed, but that's a different issue
> > > here...)?
> > >=20
> > >=20
> > > > +
> > > > +     irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
> > > > +     ret =3D devm_request_irq(uport->dev, uport->irq, qcom_geni_se=
rial_isr,
> > > > +                     IRQF_TRIGGER_HIGH, port->name, uport);
> > > > +     if (ret) {
> > > > +             dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret=
);
> > > > +             uart_remove_one_port(drv, uport);
> > > > +             return ret;
> > >=20
> > > Does this remove the sysfs file?
> > >=20
> >=20
> > The loopback file isn't documented. It isn't removed when the driver is
> > removed either. Can we just remove the whole thing? It would be nicer if
> > that sort of thing was supported in the tty layer somehow. Is it?
>=20
> I don't know what that file does, so yes, please delete it :)
>=20
> And as for support in the tty layer itself, if you figure out what it
> does, sure, we can add support if needed.
>=20

I think it may be supported in the tty layer with TIOCM_LOOP already.
Akash, can you confirm?


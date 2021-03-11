Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BDA337A75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 18:07:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhCKRG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 12:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhCKRGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 12:06:46 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4346AC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 09:06:46 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id bt4so3768387pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 09:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U3BaAUXKM5qmSJ7940UEU1xJ4TluyNCp4PSxxj53kDg=;
        b=ny5cwkw3g2zRRtrm+uf/wRSBPIgP4TgrjNtnWW2wany289CJ8ewDMOUzjr2ZWQ4ZRS
         YoJHoAuUk3fXX8XWSzWBRKTXB5spI9mcN/lUPohrrjb1h0qEPx8sqjdKEerm8cZXQq4/
         wfRPkhQgiGLhuJejGZjGQEbKPv46Q9OCvqIDtJ7yh/27CaWzYCUwv2EWRdYRWAEnH7BW
         SPc6p9NXeZtieBGs2C6f6p18dQvL10vgLbUWMiGivIMsng9+4UhCc6n3qZZBsg6Vfvne
         c0RCgfLOiqTyt/591cSdEDC7wNRr84dzLo7nx8fuVutP1aNWP+SPBo8L6EcOBMMTTAhz
         98xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U3BaAUXKM5qmSJ7940UEU1xJ4TluyNCp4PSxxj53kDg=;
        b=iRof78F6izeyJnkqwdYJMaW8WYpRIPSV8mcM+wY1xd7vd5aQWe8go30+f7WOfv+Let
         pG5ymAziyu8hnTuFae8smwX6FjLS7BOB+cOkCLzNmYSmnGD+nMdBreVGtfb+Cn/sZegW
         kylohUOAQEFUnR85iLdLreBA2RAOXjOmQMOEay4vcnkuMZ38muqoXw2PDDW8nH8faBZV
         At/RghU5xoNFR0rZYFZAXuD1ZU2l4X25O8uIpdBVNU1ppcXhjW8UH++tTA4KDuGy6Tx1
         tVnv9gJc4OSyP3DSWWOiRqG5oRVayKtoxlRYIxFkePEFD2+Zb+1vpM1pVxyEl4f4plPb
         qRtA==
X-Gm-Message-State: AOAM530wZUfVSY5n+FoRN+Div2DW+tllu3vAvW1IalYgva5TzesXp2fv
        iuVX9RPiCC/PZ38tYikMpq8abZ4fSF0/QfqBI73vjQ==
X-Google-Smtp-Source: ABdhPJxLtJVoaCQ+Hy+PqYl1Lrz2ZKWrSXJsEVR+RomEnKh59UDPuVbbiOnU/IsIs4sZT4spP5GmtFc+imPcoiZr2k8=
X-Received: by 2002:a17:90b:4008:: with SMTP id ie8mr10220269pjb.231.1615482405656;
 Thu, 11 Mar 2021 09:06:45 -0800 (PST)
MIME-Version: 1.0
References: <1615480746-28518-1-git-send-email-loic.poulain@linaro.org> <YEpJwsSy52HFB/IY@kroah.com>
In-Reply-To: <YEpJwsSy52HFB/IY@kroah.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 11 Mar 2021 18:14:45 +0100
Message-ID: <CAMZdPi82NpijmiAd2-Fku5ZzcrpZpDsi-8h9qgAu=Xz6VWVQhQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] net: Add a WWAN subsystem
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        open list <linux-kernel@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Mar 2021 at 17:48, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Mar 11, 2021 at 05:39:05PM +0100, Loic Poulain wrote:
> > This change introduces initial support for a WWAN subsystem. Given the
> > complexity and heterogeneity of existing WWAN hardwares and interfaces,
> > there is no strict definition of what a WWAN device is and how it should
> > be represented. It's often a collection of multiple components/devices
> > that perform the global WWAN feature (netdev, tty, chardev, etc).
> >
> > One usual way to expose modem controls and configuration is via high
> > level protocols such as the well known AT command protocol, MBIM or
> > QMI. The USB modems started to expose that as character devices, and
> > user daemons such as ModemManager learnt how to deal with that. This
> > initial version adds the concept of WWAN port, which can be registered
> > by any driver to expose one of these protocols. The WWAN core takes
> > care of the generic part, including character device creation and lets
> > the driver implementing access (fops) to the selected protocol.
> >
> > Since the different components/devices do no necesserarly know about
> > each others, and can be created/removed in different orders, the
> > WWAN core ensures that devices being part of the same hardware are
> > also represented as a unique WWAN device, relying on the provided
> > parent device (e.g. mhi controller, USB device). It's a 'trick' I
> > copied from Johannes's earlier WWAN subsystem proposal.
> >
> > This initial version is purposely minimalist, it's essentially moving
> > the generic part of the previously proposed mhi_wwan_ctrl driver inside
> > a common WWAN framework, but the implementation is open and flexible
> > enough to allow extension for further drivers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/net/Kconfig          |   2 +
> >  drivers/net/Makefile         |   1 +
> >  drivers/net/wwan/Kconfig     |  19 ++++++
> >  drivers/net/wwan/Makefile    |   8 +++
> >  drivers/net/wwan/wwan_core.c | 150 +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/net/wwan/wwan_core.h |  20 ++++++
> >  drivers/net/wwan/wwan_port.c | 136 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/wwan.h         | 121 ++++++++++++++++++++++++++++++++++
> >  8 files changed, 457 insertions(+)
> >  create mode 100644 drivers/net/wwan/Kconfig
> >  create mode 100644 drivers/net/wwan/Makefile
> >  create mode 100644 drivers/net/wwan/wwan_core.c
> >  create mode 100644 drivers/net/wwan/wwan_core.h
> >  create mode 100644 drivers/net/wwan/wwan_port.c
> >  create mode 100644 include/linux/wwan.h
>
> What changed from the last version(s)?  That should be below the ---
> somewhere, right?
>
> v5?

Yes sorry, I've overwritten my changelog with my last format-patch,
going to address your comment and add that in the next series.

Regards,
Loic

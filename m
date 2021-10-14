Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DBC42E2B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 22:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhJNU1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 16:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhJNU1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 16:27:23 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C542C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 13:25:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w19so28911773edd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bkxjTR1KnmIhT6ZNgvKYudVen7eddwxMu8qscC8uiwI=;
        b=PzsmfUTvcKs5wyBbdBw2QjKRcPRy/fFzWfau0s5sfSl5+wZBnL/mxVihk1V+s9SmAE
         Tu7N4QC1nyAB2aO2BFpdBDORUEi4E+h8Jgb59fRWsEjqXcxAYGgKtdKAFydG/guodyXa
         iWss0W2353rb1DlDR7tPqQkuiKGvDDEYUKVYAor7P0UgCCLZ9wLMGOK7AMImKjRGizN1
         4hObK2rfm0KpDkFu/Xcv/JLnH00XAM+G19uZWu/dIMC16fB7uHmNlDic23aS659TUITH
         DGX/Rlnp/FxxffHPrjyTxQXxixMr627nUc4lvdYl+3s7+EgofEMtHTBjoOdn06cyAlmW
         /Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bkxjTR1KnmIhT6ZNgvKYudVen7eddwxMu8qscC8uiwI=;
        b=D8CjD0Luu7rTm8jku0VUDdsZX3NAXVhlczgwEZtkbLrklio5E1mV+sOMRSCkKaN5Uw
         xuI83njwZgIeEH2M+DHkVMA2DIuXP2MTMxNoDxmKa/d7dY3FjIxVe26dHTd/h8aWO/Ul
         HJmaCvYWUzjMO1jOmJTddslNEAN+SIjvFP77cDN4UaJsD00WkkqIm7tLopNolSlVKv/o
         drvgenE4Z3F5IM3DjMdZNzRT8zDtgOIqOcnRaGTHg6NhQsinRkjgDcdRuGnELS26RkvM
         ChWtF0vN2aIWwLoXE4+WOpBPbnTkUo2OBuP9McrF98p7v7d5a3hxXSdOlZAGGf1N42jS
         5Mdg==
X-Gm-Message-State: AOAM533VeBdmS92GJuOvCyQtdW4WGUfDOuhXSaQZ/ayaOaF2xNSbOZGA
        6x5FghAA4dna1A1Gcq+zLhUJM9E3WbYqAX6ObcxIsw==
X-Google-Smtp-Source: ABdhPJziwshqRwu1FyA9j5zDTapJT2buVGrYaDGZ7Oz40aLty2W6XkvLiaMK1aDorQhX6BdkPN3OZI5acDBb4Q5AlrA=
X-Received: by 2002:a50:e041:: with SMTP id g1mr11811450edl.4.1634243116916;
 Thu, 14 Oct 2021 13:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com> <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
In-Reply-To: <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Thu, 14 Oct 2021 22:25:05 +0200
Message-ID: <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Loic,

> > > > > Otherwise, when responses are received, we also can observe strange
> > > > > things: unexpected messages, response to previous commands or queue
> > > > > buffer issue.
> > > > >
> > > >
> > > > Are you testing this with qmicli + mbimcli + ModemManager? And if so,
> > > > are you running the qmicli/mbimcli commands with the "-p" option in
> > > > order to always use the intermediate qmi-proxy/mbim-proxy? I'd
> > > > suggest
> > > > to always do that to avoid having multiple processes talking to the
> > > > ports at the same time.
> > > >
> > >
> > > In first, I'm testing with qmicli/mbimcli commands with the "-p" option
> > > in order to always use the intermediate qmi-proxy/mbim-proxy that that
> > > I run in debug mode beforehand.
> > >
> >
> > Ah, nice, that helps to clarify. When using the proxies, there should
> > be always one single process accessing the ports.
> >
> > > >
> > > > > I updated the topic opened on the Sierra Wireless forum, with our
> > > > > latest progress and as well as additional information.
> > > > >
> > > > > In addition, we observed some strange behavior of the EM919x after
> > > > > warm
> > > > > reboots.
> > > > >
> > > >
> > > > Is the log after the warm reboots similar to the one I showed in my
> > > > first email, i.e. with the 2 reported "firmware crashes"? Or does it
> > > > look totally different?
> > >
> > > After warm reboots, we observe no explain message indicating an error,
> > > but we use an old firmware version.
> > >
> >
> > Ok.
> >
> > > > And, do you always see the module booting properly on cold boots? Or
> > > > do you see failed boots like the one i showed in my first email?
> > >
> > > The module doesn't always booting properly, you see failed boots like
> > > the one you showed.
> >
> > This is good, because it confirms that our fully different platforms
> > running the same kernel driver show the same symptoms. So it shouldn't
> > be an issue of the platform, it's likely either the driver or the
> > module firmware.
>
> So it looks like the device is not in the state expected by MHI core,
> not sure however if it's a bad interpretation of MHI implementation or
> a specific issue in that firmware. Maybe one thing you could try is to
> call mhi_soc_reset(); msleep(1000); just after
> mhi_register_controller() in pci_generic probe() function... it is
> supposed to hard reset the modem CPU, and maybe getting it in better
> shape?
>

I've tried your suggestion:

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 1499226c6cef..eaf5243d44f0 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -783,6 +783,10 @@ static int mhi_pci_probe(struct pci_dev *pdev,
const struct pci_device_id *id)
     if (err)
         goto err_disable_reporting;

+    /* Hard reset modem CPU */
+    mhi_soc_reset(mhi_cntrl);
+    msleep(1000);
+
     /* MHI bus does not power up the controller by default */
     err = mhi_prepare_for_power_up(mhi_cntrl);
     if (err) {
-- 
2.33.0

But didn't help :/ The logs look quite similar:

[    7.056113] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.063298] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.071846] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.078671] mhi-pci-generic 0000:01:00.0: using shared MSI
[    8.100563] mhi mhi0: Requested to power ON
[    8.104971] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[   10.979537] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: SYS ERROR
[   10.988331] mhi mhi0: System error detected
[   10.992553] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
[   10.998399] mhi mhi0: Power on setup success
[   11.002710] mhi mhi0: Handling state transition: SYS ERROR
[   11.008198] mhi mhi0: Transitioning from PM state: Linkdown or
Error Fatal Detect to: SYS ERROR Process
[   11.017597] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
[   11.023430] mhi mhi0: Failed to transition from PM state: Linkdown
or Error Fatal Detect to: SYS ERROR Process
[   11.033433] mhi mhi0: Exiting with PM state: Linkdown or Error
Fatal Detect, MHI state: RESET
[   11.041958] mhi mhi0: Handling state transition: PBL
[   11.046922] mhi mhi0: Device MHI is not in valid state
[   11.052060] mhi mhi0: Handling state transition: DISABLE
[   11.057370] mhi mhi0: Processing disable transition with PM state:
Linkdown or Error Fatal Detect
[   11.066243] mhi mhi0: Waiting for all pending event ring processing
to complete
[   11.073561] mhi mhi0: Waiting for all pending threads to complete
[   11.079653] mhi mhi0: Reset all active channels and remove MHI devices
[   11.086181] mhi mhi0: Resetting EV CTXT and CMD CTXT
[   11.091146] mhi mhi0: Exiting with PM state: DISABLE, MHI state: RESET
[   11.097734] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
[   11.104937] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110


This is with Sierra's latest firmware for the device, BTW, version 03.04.03.00

-- 
Aleksander
https://aleksander.es

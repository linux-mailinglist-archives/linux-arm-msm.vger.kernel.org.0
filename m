Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C2F4253A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 15:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240954AbhJGNG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 09:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbhJGNGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 09:06:55 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA1AC061570
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 06:05:00 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id l7so23106989edq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=0+hdZx8z8H2qo9C8aFQUZoFEogRKFiNOVXMBEJOTQgY=;
        b=k5jtdjAzmhTyr2xbQJ45IXDZYAixHjVtvUr1+OWKqfrgnKSqdkZpvNbIWjc0w8Znm9
         OW9q5H1ZyzOXxUoqhGkJqf61ZTHucoQJQlY+xUIsx2QSi4pdg52hHnk4oqTGgRd5EK4c
         v46EMPqhIzncHZSY9kW47GdNlC8h91KeogZk2WjAT3USSBDjLH8c4L9nkLiVNELxxov7
         Sqvn+5ONe81xJ/9vHdKMLUY/nulYe5GXpcVNITYb3efEVSzSY/ADIm3ZWj6eD1i8jSnO
         wqzNSSybCO56pMlTbm0VOAX5o4OcFEW5nmc0Tu9KBTsRZQVtfVk3WZnWiuH+ErFM9wdV
         wM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0+hdZx8z8H2qo9C8aFQUZoFEogRKFiNOVXMBEJOTQgY=;
        b=cQMgd529mdj6LLzc7anYZpREr5ynIS2oyZLXnBkU3WN6ezpvICkmniZYGUphsLQJHg
         gzooyunwlZzQnWUF4FEHYHRXKxsmJQN+n6N5US19yMGAmoxmxEkfxhwDmxWikeXHIw1a
         V+cszYAVoQGqIk99/7Rv2NbeKqu74gls0/qmekW8/6sOQHE2baXEQmQsoUGSn6qTQH7P
         LAgLNgmGGLrfd+CrrCL3vmIUeNML+tka4bixkMo7x4UkowPuxSDfnlYo/D1GK1SZD1RF
         5P6asc3hzsLv/XpCkOlm7ZiBtJkfZQ7nXim7//UVLdnNN7/+tob1cUSy6x+RRzlV7wkf
         sCTw==
X-Gm-Message-State: AOAM533i+bvnt1peboKpLXul70ZPf90/YLRgeXjnbL1CfIW8e7wLGyfn
        FFW6Ar67FybW20t70esUzMwPdR6fCmTZXt4KcMqqJ8gai7s1aw==
X-Google-Smtp-Source: ABdhPJz75tS2eMrwsZ1ZbCe9QmrvIFGUHBdF0HBTesxKuS2c37R7bwCjtDigbQKFjI+WacR4fr3xoWArUCokMFL3fh4=
X-Received: by 2002:a17:906:5e17:: with SMTP id n23mr5595005eju.258.1633611895532;
 Thu, 07 Oct 2021 06:04:55 -0700 (PDT)
MIME-Version: 1.0
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Thu, 7 Oct 2021 15:04:44 +0200
Message-ID: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
Subject: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey all,

I'm working on a setup using a RPi CM4 based board and a Sierra
Wireless EM9191 module, running OpenWRT 21.02 and backported mhi+wwan
drivers (from latest 5.15 rc). The kernel also has the
mhi_pci_dev_info entry written by Thomas, as per
https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-support/24927

The EM9191 is now running 02.08.01.00 (latest firmware from Sierra),
upgraded in several steps back from the original 01.04.01.02 the
module came with. The firmware upgrades were done with
qmi-firmware-update and the module in USB mode  in a desktop PC.

Most of the system boots end up with the mhi driver reporting that the
module firmware crashed in different ways:

[    7.060730] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
[    7.067906] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.076455] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
[    7.083277] mhi-pci-generic 0000:01:00.0: using shared MSI
[    7.089508] mhi mhi0: Requested to power ON
[    7.094080] mhi mhi0: Attempting power on with EE: PASS THROUGH,
state: SYS ERROR
[    7.180371] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
PASS THROUGH state: SYS ERROR
[    7.187146] mhi mhi0: Power on setup success
[    7.187219] mhi mhi0: Handling state transition: PBL
[    7.189165] mhi mhi0: System error detected
[    7.189178] mhi mhi0: Device MHI is not in valid state
[    7.189189] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
[    7.213682] mhi mhi0: Handling state transition: SYS ERROR
[    7.219183] mhi mhi0: Transitioning from PM state: Linkdown or
Error Fatal Detect to: SYS ERROR Process
[    7.228590] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
[    7.234429] mhi mhi0: Failed to transition from PM state: Linkdown
or Error Fatal Detect to: SYS ERROR Process
[    7.244433] mhi mhi0: Exiting with PM state: Linkdown or Error
Fatal Detect, MHI state: RESET
[    7.252963] mhi mhi0: Handling state transition: DISABLE
[    7.258278] mhi mhi0: Processing disable transition with PM state:
Linkdown or Error Fatal Detect
[    7.267155] mhi mhi0: Waiting for all pending event ring processing
to complete
[    7.274480] mhi mhi0: Waiting for all pending threads to complete
[    7.280576] mhi mhi0: Reset all active channels and remove MHI devices
[    7.287110] mhi mhi0: Resetting EV CTXT and CMD CTXT
[    7.292077] mhi mhi0: Exiting with PM state: DISABLE, MHI state: RESET
[    7.298683] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
[    7.306184] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110

Some of the boots successfully finish and I can talk to both the QMI
and MBIM ports exposed by the WWAN subsystem, but the success rate is
extremely low.

Thomas, are you seeing similar issues in your setup?

-- 
Aleksander
https://aleksander.es

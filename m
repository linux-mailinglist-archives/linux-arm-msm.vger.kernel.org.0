Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79C8427926
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 12:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhJIKxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 06:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbhJIKxe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 06:53:34 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A6EC061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 03:51:38 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n11so7406403plf.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 03:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i5m1bDZX6BzubWql3UAIuZA6GltWOA4c/7s9u8XQ6cA=;
        b=AFQ7SZWA1Pthmuhzgoq8UkZaFcvAlCpzVaOgk0X/rXg/EsbHx8XINbxua2aHIlfCWp
         SRCNFnqosXE+aksvq8WsRoJRJQKr71wEzFDLI3Ec7a2hJOaW+RBJAROZmJZ1h7kXsZAx
         nmkCTXAvd4e8hETRNSLi6FsskjRPyFcOmOW2QQZiju13v3MRTUVCXylyDKHozJbKKexr
         jIHESozBiKOKnvqOnegfZlJ19nrEw2f0A2GuLfgZtPo9msliqKBLgGl2dMJkgELp4lRr
         WyC8AzPhJwv9j2wgQSJZ9U8CGUTzTGN/HPWVyL5aIWCMt1eplvhGQfI3GUpr+nEU26Ok
         qR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i5m1bDZX6BzubWql3UAIuZA6GltWOA4c/7s9u8XQ6cA=;
        b=1EDcVw7bvOwAbJEi8SIFkA0Za7GsDw98uHAWwD6nsbKvjpU9MQtzKqephM2TlX0iNl
         oe3AafYb4Wod/vd4GS47VckpnakZcuRT2Oh7zatOrq237MIxIZXb+ExKLVX0O+WVgJe6
         lMkCi5PgJZPNpZMBD7yQQsGy4xN+noaJ4m8u7y38L5187FgS5zKLPel6pMhUBbcP18el
         lEapiHmk5OeD26bTwWDDccMSDyzBoLk0ohx93uYRQ0UmanjHhDgsFQ9Mhc5HPS2DkLGy
         QDGAIFfo9Iv/WeIjA0xXkbQfbdHxl34auThHJP4oHZYU/Kt+ni9UE0SPSziM4INAr2uG
         p+XQ==
X-Gm-Message-State: AOAM533xdOf/gFUQjlNLP3c4sW1h7dzdntr6ON11tR9DxjgEgbsgWryb
        kJgyFwD9Bkfb/0tyBibbVPBjQbyesOhs
X-Google-Smtp-Source: ABdhPJzHQNce6Kko7wnqx/rnh5MRsP67c20EdBFFfG4bvqMj5ouDl5+dM/ldap7lS+C2Gz8BnFIOwA==
X-Received: by 2002:a17:90b:38c3:: with SMTP id nn3mr17680562pjb.110.1633776697048;
        Sat, 09 Oct 2021 03:51:37 -0700 (PDT)
Received: from thinkpad ([117.215.115.53])
        by smtp.gmail.com with ESMTPSA id e7sm1899950pfc.114.2021.10.09.03.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 03:51:36 -0700 (PDT)
Date:   Sat, 9 Oct 2021 16:21:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        hemantk@codeaurora.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        bbhatt@codeaurora.org
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Message-ID: <20211009105132.GA204538@thinkpad>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Bhaumik

On Thu, Oct 07, 2021 at 03:04:44PM +0200, Aleksander Morgado wrote:
> Hey all,
> 
> I'm working on a setup using a RPi CM4 based board and a Sierra
> Wireless EM9191 module, running OpenWRT 21.02 and backported mhi+wwan
> drivers (from latest 5.15 rc). The kernel also has the
> mhi_pci_dev_info entry written by Thomas, as per
> https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-support/24927
> 
> The EM9191 is now running 02.08.01.00 (latest firmware from Sierra),
> upgraded in several steps back from the original 01.04.01.02 the
> module came with. The firmware upgrades were done with
> qmi-firmware-update and the module in USB mode  in a desktop PC.
> 
> Most of the system boots end up with the mhi driver reporting that the
> module firmware crashed in different ways:
> 
> [    7.060730] mhi-pci-generic 0000:01:00.0: MHI PCI device found: sierra-em919x
> [    7.067906] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> 0x600000000-0x600000fff 64bit]
> [    7.076455] mhi-pci-generic 0000:01:00.0: enabling device (0000 -> 0002)
> [    7.083277] mhi-pci-generic 0000:01:00.0: using shared MSI
> [    7.089508] mhi mhi0: Requested to power ON
> [    7.094080] mhi mhi0: Attempting power on with EE: PASS THROUGH,
> state: SYS ERROR
> [    7.180371] mhi mhi0: local ee: INVALID_EE state: RESET device ee:
> PASS THROUGH state: SYS ERROR
> [    7.187146] mhi mhi0: Power on setup success
> [    7.187219] mhi mhi0: Handling state transition: PBL
> [    7.189165] mhi mhi0: System error detected
> [    7.189178] mhi mhi0: Device MHI is not in valid state
> [    7.189189] mhi-pci-generic 0000:01:00.0: firmware crashed (7)
> [    7.213682] mhi mhi0: Handling state transition: SYS ERROR
> [    7.219183] mhi mhi0: Transitioning from PM state: Linkdown or
> Error Fatal Detect to: SYS ERROR Process
> [    7.228590] mhi-pci-generic 0000:01:00.0: firmware crashed (6)
> [    7.234429] mhi mhi0: Failed to transition from PM state: Linkdown
> or Error Fatal Detect to: SYS ERROR Process
> [    7.244433] mhi mhi0: Exiting with PM state: Linkdown or Error
> Fatal Detect, MHI state: RESET
> [    7.252963] mhi mhi0: Handling state transition: DISABLE
> [    7.258278] mhi mhi0: Processing disable transition with PM state:
> Linkdown or Error Fatal Detect
> [    7.267155] mhi mhi0: Waiting for all pending event ring processing
> to complete
> [    7.274480] mhi mhi0: Waiting for all pending threads to complete
> [    7.280576] mhi mhi0: Reset all active channels and remove MHI devices
> [    7.287110] mhi mhi0: Resetting EV CTXT and CMD CTXT
> [    7.292077] mhi mhi0: Exiting with PM state: DISABLE, MHI state: RESET
> [    7.298683] mhi-pci-generic 0000:01:00.0: failed to power up MHI controller
> [    7.306184] mhi-pci-generic: probe of 0000:01:00.0 failed with error -110
> 
> Some of the boots successfully finish and I can talk to both the QMI
> and MBIM ports exposed by the WWAN subsystem, but the success rate is
> extremely low.
>

Can you share the success log also?

Thanks,
Mani
 
> Thomas, are you seeing similar issues in your setup?
> 
> -- 
> Aleksander
> https://aleksander.es

Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C6C442BDA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 11:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhKBKxT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 06:53:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:60430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhKBKxT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 06:53:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E747860E74;
        Tue,  2 Nov 2021 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635850244;
        bh=4dFVD/eGPy9NnReAmUfAaRs1W2CTfIQNvwBazC2iawo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rLOdHGyNl3Rk/S4gFloWP9Sn3428ivMGcLEj9cXeFMkD8Q8bLiQXBH18B/f2A/SLQ
         EReKRfG4aNhjl/cxyJ+QCplcuctIQ9asQO3F8H4MX6JzvIJCx603lp4mkMg/DnwLU6
         uymoGKTWcbhAq19e2xpz1hsvPl5vpgsQMz0u9I6PzaeYFaL6+3KmP94GNlA1K/CJ3h
         D5SU3pkPdWrWdgXNdzGVPiF1TkWW8DcJaa64DOevLNO9cbuI2PtA9DnyVR6kiAv2ym
         iJx0Dr8uXTqPTCwjgZNZEZJEw7ddQtk6zDYtpp/ECFsnkrLBCeTmei/7mPxODRuIXE
         pKhJeJ9ySyAgg==
Date:   Tue, 2 Nov 2021 16:20:35 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Thomas Perrot <thomas.perrot@bootlin.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
Message-ID: <20211102105035.GB5646@thinkpad>
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <20211009105132.GA204538@thinkpad>
 <CAAP7uc+kPCyASq1ki_qZdft7W9rJxnx4-4TmhRJjMDQuQAHsFA@mail.gmail.com>
 <20211022044229.GD3138@workstation>
 <CAAP7ucJrj1HSvqeoXGOc3F2_z2tv5ZgTTexmX8xr57La=_H4ow@mail.gmail.com>
 <20211022144026.GA7657@thinkpad>
 <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAP7ucJGkAKqyvUJJnCgX8AejsHSaY0AeAxKoCJahAeVLw5ThQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey,

On Mon, Oct 25, 2021 at 10:10:48AM +0200, Aleksander Morgado wrote:
> Hey Mani,
> 
> [    7.189547] mhi mhi0: Transitioning from PM state: Linkdown or
> Error Fatal Detect to: SYS ERROR Process

Hmm, I think the use of sync_power_up might be causing the issue here as it
forces the MHI state to fatal error.

Ignore the previous diff and try the below one:

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 59a4896a8030..b1e8c7de4e54 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -637,7 +637,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
        if (err)
                goto err_try_reset;
 
-       err = mhi_sync_power_up(mhi_cntrl);
+       err = mhi_async_power_up(mhi_cntrl);
        if (err)
                goto err_unprepare;


Thanks,
Mani

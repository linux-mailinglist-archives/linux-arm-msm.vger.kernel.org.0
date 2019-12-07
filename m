Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF3F115DFF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 19:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfLGSjy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 13:39:54 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41640 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbfLGSjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 13:39:53 -0500
Received: by mail-pg1-f195.google.com with SMTP id x8so4993018pgk.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2019 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eQC46zUXoRh+5bOFwtXWqx1ahYOsHB5mbDAmeqI8leM=;
        b=Izl4EylOI1zBgFgzl6x33N8oNEithLHBo240ORARPyUId01Wrl89d1cWpcdP0DQGCH
         Ur7prQEBBkOqfNISI8jZwsJjx+/Tka+VJ/V9oR1H9YmcznhR6PWm/rLh80ayjb542tas
         0cVGiXaXIuE7C8XPJwzc8DB4KUtP8SFJYHuacAXSmNC8NvBGkKJlic4gy3wQ8/U751nk
         dtirOEOj6m7gfLrtQD38vQTI+YAueMh4YSvOnZzESGtazdpbn3UVbRycx6V6/gChNimu
         4pFMZ3ltaW1Pe/ZQnle1ISnAakJz3dxZchcac7OMhXAcHVa4EIcLPJTN4l2N90eFjYnW
         /lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eQC46zUXoRh+5bOFwtXWqx1ahYOsHB5mbDAmeqI8leM=;
        b=Ehv5vuwNg3ZPgSSbBtcWsbw/2oEd1vJaaqNcY0zOu8OP7Xr88DDRHcRiWUt0gjJLup
         /sI/tV3KouPPYZFPqdZpWaKe7/DgnHsMPD7fFGMheFEi6bi0s+uINA7HJNld/B+k+mcT
         efJjjYJZ1LyIms+eot8zN3zSzQxA7f3RtNXpChesnFDDLQI/0ZqURslPjBdIWg8k8UAE
         9rkD2dZTfjQjo5xfZvbu5sI4naesnIznarKtr7Hz+TcDmAdqk0pITyMBCVKoHJufxFvr
         NpNAPnc6yMMWE6G32Ua0JUEWD4klA3T9+201oX3rEMHRGQA3V8ZC8n265cloJYKE1gPq
         zeIw==
X-Gm-Message-State: APjAAAVblzguioM9aWDpT1niiEpP8MyEdd8eYvUZom1xP5pBB4XD3R2E
        hJbBwYOPQbP+riAap8a0BAH2UA==
X-Google-Smtp-Source: APXvYqw1nVvDZ3RsTcWDIZ4H669CNlKptO7I2KbOTiYgOqIW97tQzW3e5dkGUMy+dVn3F0Luwsk5YA==
X-Received: by 2002:aa7:94b0:: with SMTP id a16mr21024211pfl.35.1575743992661;
        Sat, 07 Dec 2019 10:39:52 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f13sm21148561pfa.57.2019.12.07.10.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 10:39:51 -0800 (PST)
Date:   Sat, 7 Dec 2019 10:39:49 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] Revert "phy: qcom-qmp: Correct ready status, again"
Message-ID: <20191207183949.GB314059@yoga>
References: <20191205161505.15295-1-p.pisati@gmail.com>
 <20191205161505.15295-7-p.pisati@gmail.com>
 <20191206070705.GD289401@yoga>
 <20191206100006.GA18896@harukaze>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206100006.GA18896@harukaze>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 06 Dec 02:00 PST 2019, Paolo Pisati wrote:

> On Thu, Dec 05, 2019 at 11:07:05PM -0800, Bjorn Andersson wrote:
> > On Thu 05 Dec 08:15 PST 2019, Paolo Pisati wrote:
> > 
> > > This reverts commit 14ced7e3a1ae9bed7051df3718c8c7b583854a5c.
> > > 
> > > Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> > 
> > Thanks for the patch Paolo, but reverting this commit means we're
> > checking for the wrong status bit and thereby relies on timing of that
> > bit having an appropriate value again.
> > 
> > The problem at hand seems to be that some resources are missing while
> > trying to initialize the PHY, which causes it to not become ready. I saw
> > the same problem when bringing up PCIe on SDM845, but failed to validate
> > MSM8996, as this was not booting since mid-summer.
> > 
> > I verified that this is the case by applying:
> > https://lore.kernel.org/linux-arm-msm/20191107000917.1092409-4-bjorn.andersson@linaro.org/
> 
> Thanks Bjorn,
> 
> indeed replacing the revert and leaving the rest of the series intact, my db820c
> boots fine.
> 
> One thing though - i removed the =y config changes, and now the board crash
> while, it appears, powering on qmp-phy - no stacktrace, unfortunately:
> 

The sudden reboot is caused by UFS not being able to find it's PHY, in
which case it will disable RPM_SMD_LN_BB_CLK, which causes
GCC_PCIE_CLKREF_CLK to stop ticking, so we get an unclocked access.

Together with the patch above I get working PCIe and UFS with both =m.
I'll send out a patch that properly describes this dependency. 


I will also propose a set of patches that migrates the 8996 UFS PHY to
phy-qcom-qmp, instead of the UFS-specific QMP driver.

Regards,
Bjorn

> ...
> [  OK  ] Reached target Local File Systems (Pre).
>          Starting Flush Journal to Persistent Storage...
> [  OK  ] Started Load/Save Random Seed.
> [  OK  ] Started udev Coldplug all Devices.
> [  OK  ] Started udev Kernel Device Manager.
> [   13.550757] dwc3 7600000.dwc3: Failed to get clk 'ref': -2
> [   13.552251] dwc3 6a00000.dwc3: Failed to get clk 'ref': -2
> [   13.580749] dwc3 7600000.dwc3: Failed to get clk 'ref': -2
> [   13.582802] dwc3 6a00000.dwc3: Failed to get clk 'ref': -2
> [   13.595811] dwc3 6a00000.dwc3: Failed to get clk 'ref': -2
> [   13.596502] hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)
> [   13.636319] ufshcd-qcom 624000.ufshc: ufshcd_variant_hba_init: variant qcom init failed err -517
> [   13.638919] ufshcd-qcom 624000.ufshc: Initialization failed
> [  OK  ] Found device /dev/ttyMSM0.
> [   13.675328] ufshcd-qcom 624000.ufshc: ufshcd_pltfrm_init() failed -517
> [   13.693300] qcom-qmp-phy 34000.phy: phy common block init timed-out
> [   13.693390] phy phy-34000.phy.2: phy poweron failed --> -110
> [   13.698831] qcom-pcie 600000.pcie: cannot initialize host
> 
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
> S - IMAGE_VARIANT_STRING=M8996LAB
> S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
> S - Boot Interface: UFS
> S - Secure Boot: Off
> ...
> - 
> bye,
> p.

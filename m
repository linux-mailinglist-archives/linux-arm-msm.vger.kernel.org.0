Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D8E114E8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 11:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbfLFKAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 05:00:10 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38233 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbfLFKAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 05:00:10 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so6723128wmi.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 02:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xorKEGg9vg7MVfH4aysy6wZnzPeG+YYvWTnbgNI11/Q=;
        b=Gvc9UIYkLRmnlhdun82nxgYDmyfaOWhF9QWj54EfFZmXQ+EMUJ+vpCnRW9My5bxDcP
         dcZzFKwmYAYXSCeCLcN7N/b7thK+N7887oJ6NfrL9iqvJSfSq7v69kTU0BeitIWtrFe+
         /jI4FOBcZ5T1ugvWvCISX3WU1CwDgMG8xY7xCX5/u5vyZs35vHJ/nd5bcU/ePSESoBkg
         Wh1xj1RdgTyWXgq4UFeZ6DDi9LNdB+ShPc/umMapbuqAGlXmJ9yvDNKGQ45/SYPm5Gwj
         3XHLQcAgD2x0+MDqKjwBKiLCC9CSHO6lkxgA80ZAfNWKk1dBmHJkp292+kXYy4VtwkZh
         6Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xorKEGg9vg7MVfH4aysy6wZnzPeG+YYvWTnbgNI11/Q=;
        b=MkLZQocM1fxj8T9B3DNqp6OCVHXbTCmMX3kyGKiJ9yJLkDIFFP9YsOAuQ6zfSRWI+m
         5uqG2XhsFaNJvwiFH7hLS8ssH/hM9WB4Ne8IyaQgBLWXHxbDTzXn97N78HeEcG8nPb8Q
         D4tPn1LydQspXje/tAMZp/744Mbt3Fl8Doy4ri3byHgRnQM7UMj8bmIXn2l2K5FTPYFz
         FkQydk2Jo2cAkTbtQSkWlZruJKgQmu+rAuETekMZbLdrCSbaaIoPR8LFN/ptN8bKcp5K
         DawfI4geXWfycsYfw+11ZLVIicFnh7ptfuOQqcUURUYvj3R/B+Wa6Lml+KDrDOxbfvoe
         nmCA==
X-Gm-Message-State: APjAAAXNJY+Gpmzed0UVkAtMa4K3dOkYWT+n7tLw3akwecNIe2MsC3nD
        EISEbBiNN/GCy4Aa3cKNGOw=
X-Google-Smtp-Source: APXvYqzbY6ZA9BApDXy6EJxiEVwYWeqlpIoCgNeaA6UJVsNPiNkRs3kDY3Q1u4el03fqbMiyS6Fe7Q==
X-Received: by 2002:a1c:a70e:: with SMTP id q14mr9674444wme.142.1575626407924;
        Fri, 06 Dec 2019 02:00:07 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id g23sm2845438wmk.14.2019.12.06.02.00.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 02:00:07 -0800 (PST)
Date:   Fri, 6 Dec 2019 11:00:06 +0100
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Paolo Pisati <p.pisati@gmail.com>, Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] Revert "phy: qcom-qmp: Correct ready status, again"
Message-ID: <20191206100006.GA18896@harukaze>
References: <20191205161505.15295-1-p.pisati@gmail.com>
 <20191205161505.15295-7-p.pisati@gmail.com>
 <20191206070705.GD289401@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191206070705.GD289401@yoga>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 05, 2019 at 11:07:05PM -0800, Bjorn Andersson wrote:
> On Thu 05 Dec 08:15 PST 2019, Paolo Pisati wrote:
> 
> > This reverts commit 14ced7e3a1ae9bed7051df3718c8c7b583854a5c.
> > 
> > Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
> 
> Thanks for the patch Paolo, but reverting this commit means we're
> checking for the wrong status bit and thereby relies on timing of that
> bit having an appropriate value again.
> 
> The problem at hand seems to be that some resources are missing while
> trying to initialize the PHY, which causes it to not become ready. I saw
> the same problem when bringing up PCIe on SDM845, but failed to validate
> MSM8996, as this was not booting since mid-summer.
> 
> I verified that this is the case by applying:
> https://lore.kernel.org/linux-arm-msm/20191107000917.1092409-4-bjorn.andersson@linaro.org/

Thanks Bjorn,

indeed replacing the revert and leaving the rest of the series intact, my db820c
boots fine.

One thing though - i removed the =y config changes, and now the board crash
while, it appears, powering on qmp-phy - no stacktrace, unfortunately:

...
[  OK  ] Reached target Local File Systems (Pre).
         Starting Flush Journal to Persistent Storage...
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Started udev Kernel Device Manager.
[   13.550757] dwc3 7600000.dwc3: Failed to get clk 'ref': -2
[   13.552251] dwc3 6a00000.dwc3: Failed to get clk 'ref': -2
[   13.580749] dwc3 7600000.dwc3: Failed to get clk 'ref': -2
[   13.582802] dwc3 6a00000.dwc3: Failed to get clk 'ref': -2
[   13.595811] dwc3 6a00000.dwc3: Failed to get clk 'ref': -2
[   13.596502] hub 2-0:1.0: config failed, hub doesn't have any ports! (err -19)
[   13.636319] ufshcd-qcom 624000.ufshc: ufshcd_variant_hba_init: variant qcom init failed err -517
[   13.638919] ufshcd-qcom 624000.ufshc: Initialization failed
[  OK  ] Found device /dev/ttyMSM0.
[   13.675328] ufshcd-qcom 624000.ufshc: ufshcd_pltfrm_init() failed -517
[   13.693300] qcom-qmp-phy 34000.phy: phy common block init timed-out
[   13.693390] phy phy-34000.phy.2: phy poweron failed --> -110
[   13.698831] qcom-pcie 600000.pcie: cannot initialize host

Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
S - IMAGE_VARIANT_STRING=M8996LAB
S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
S - Boot Interface: UFS
S - Secure Boot: Off
...
- 
bye,
p.

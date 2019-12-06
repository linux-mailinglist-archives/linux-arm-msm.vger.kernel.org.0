Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F3F1157F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2019 20:51:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfLFTvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 14:51:17 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41579 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbfLFTvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 14:51:17 -0500
Received: by mail-pl1-f193.google.com with SMTP id bd4so3137055plb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E2l/mxg26gHD/r4Kv0IGJtWE/qir3b8bBhWdrQ1eYic=;
        b=LNYFVeSk0jYYiujjS16Fo9dALsSk38yX6/Fi5AkXplsjM8Kzs/WtBEP1rO9SwrYJLC
         cC8KOYFQJB+nxtDrhYV9a6x+xmGIMfTLppLrKOfr86mktacRUnoEZQM7clkz0KU3+fdr
         VQS0pVYadPyxuYgVcHahICbKpHtYW7ObQe1v/Y+xb3UnTOKTbG3DD7MmHTuntAfKlkJ4
         Mc1FC+vLUqeN759nhLhPuhltjAwD50NppilwSB9GtnDzRxzz/AxbskwtN/UOcE7GZI24
         edOGqzfHiVY9TBICIzZoIZiHhOQo55WXqDAppedjSPtPUpIGkUcCEEaNHTXkhpIUtOL2
         vfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E2l/mxg26gHD/r4Kv0IGJtWE/qir3b8bBhWdrQ1eYic=;
        b=XbfGYhyWn2GLuwtjiNo6qlpulUSAhHZE7F6NhiliJCgQG68VstLkt/j4PD7KyP5Lv6
         YhU/M9Cl3CmTkgyou+X8+UuQigXLz4FRFkPvqA+qjkBpxpAa7m8ZkGAkZWm1cgRZRNX8
         bXkIwFrFfo7f+G92xY5+ZqL0JeswNXDTuOI9RsUjj8zvgKi+sr2TGIBy6Uc4WPLLE6qz
         kAG/lDEfw4mQiOIzvbVIymULtJsBAFXt66lS6Wyi0ZTKT51JMsunGAVgk6HBd3/4DEzi
         pRrkQHn5YMCFhDQopGxfmA/EmLYeBcV0fSMgZ14yLGy6VmoIr7rq1E1+NAyYHnlxtXuT
         2hUg==
X-Gm-Message-State: APjAAAV8MN/IitdPGbfaGQBZHhYxE+W+wo0EbCZIw85xehH+KHVzGSdz
        4sSJ3j4LVSFGHzakz6RM0h6dUg==
X-Google-Smtp-Source: APXvYqzmz2Xgsc0t3WRX6XjbCZMKGZAgxhuEBuB5/EwDX+nA+g7XMBugoxT5LF0op/BBYdP0SZfj3A==
X-Received: by 2002:a17:902:9891:: with SMTP id s17mr16366726plp.101.1575661876606;
        Fri, 06 Dec 2019 11:51:16 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u67sm5038642pfu.28.2019.12.06.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 11:51:15 -0800 (PST)
Date:   Fri, 6 Dec 2019 11:51:13 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] Revert "phy: qcom-qmp: Correct ready status, again"
Message-ID: <20191206195113.GF289401@yoga>
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

Sorry, forgot to mention this part.

With this patch the PHY driver powers on nicely and I'm able to get PCIe
up and running, but only if both the host and phy drivers are builtin.

I also tried to revert the patch, as you suggest, but unless I make the
QMP driver builtin I simply get timeouts during initialization.

So we need to figure out what resource changes state between the two
cases (builtin vs module based probing).

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

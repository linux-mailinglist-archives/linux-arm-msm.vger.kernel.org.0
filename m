Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39B47180816
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 20:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbgCJTar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 15:30:47 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:55518 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgCJTar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 15:30:47 -0400
Received: by mail-pj1-f68.google.com with SMTP id a18so840583pjs.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AJRSlX8ACsNJYHeYADgE5H8uhXcF0mJHjX5CwOONp+U=;
        b=tNa2jovN2/9sEj+6L+LwQ89bUm6qQeL5msJv6lU9KS/ceeZ43FUB09Flmsn6bgDHj4
         aAZ1SXH+4BR3x+lnlFZj+jZ4zGtboFb18SrT62j0SZ/0dzyG4C3e8vqirT3qBl+vQyFY
         FmhEfWDKOmwrZAbmVMS89aVn9svg7eNR81bzxT1otZKw7VXyHPfGicxpnBlFOj+tLr3E
         oPBY4Y/Zd97bn7KYmCDKZJ3hekzFzeu2r+vXpUsxmHsjV9c2f+eH3NBdTzCO2HkVBdqT
         z3Nt7KOgDUJ3b5vWXwF5iZzGRN7QlM583joEbUXkF7mdmeWDZbrljNYf8dGuJmwiiI++
         H2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AJRSlX8ACsNJYHeYADgE5H8uhXcF0mJHjX5CwOONp+U=;
        b=blmtQZlDlpH1GBwwnJ8BXa3TZWNP3Z70L2CECh1WpFer0zgqATwYgZlTf5cO38dY3Q
         HWwETT9dOkOML4V5cXlvnA6a3RQ0ALgJgkueJlji/4FdEr2uZnbRzSlYN3fIllV3FP1k
         Cc+gLRErojUh3OiQXIY754J0UmM5zi9JhjvLSXWHCjWnAAGpx1bkERfScWq80LadgLYI
         k2cY2Eo2bvD4ykkmxT/bDz+9YDGlwErVkjvp/DClItwzJDF/ICJz+3ScbVHUz5u2qAma
         mBy1Un0shpEqhTHb2S+2cKCda7p2OyyGV64FZZRGVJS5ZNMBiYS3wrT+5OLesb6YbocG
         ntvA==
X-Gm-Message-State: ANhLgQ2UIkkPsbSr3i6LL5KrXOOul02J73YRNe6wGo8V+nlUbU8hFIvt
        vxCCD2qBPnYMep/h73x3/M6XGA==
X-Google-Smtp-Source: ADFU+vsVDVUGxR6MJs+LL+a6nlg/iZNbc1sWFgPhY/gWhW0iz8LwAh/F6g2cpRAUdwBA/bEkQ0opQA==
X-Received: by 2002:a17:90b:4903:: with SMTP id kr3mr3246307pjb.3.1583868646154;
        Tue, 10 Mar 2020 12:30:46 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 19sm27050061pfn.30.2020.03.10.12.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 12:30:45 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:30:42 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Cl?ment Leger <cleger@kalrayinc.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>
Subject: Re: [PATCH v5 5/8] remoteproc: Rename rproc_elf_sanity_check for
 elf32
Message-ID: <20200310193042.GK264362@yoga>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
 <20200302093902.27849-6-cleger@kalray.eu>
 <20200302231342.GE262924@yoga>
 <482678048.7666348.1583222551942.JavaMail.zimbra@kalray.eu>
 <20200310000005.GF14744@builder>
 <20200310152031.GA25781@xps15>
 <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371773363.9138477.1583854699708.JavaMail.zimbra@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Mar 08:38 PDT 2020, Cl?ment Leger wrote:

> Hi Mathieu,
> 
> ----- On 10 Mar, 2020, at 16:20, Mathieu Poirier mathieu.poirier@linaro.org wrote:
> 
> > On Mon, Mar 09, 2020 at 05:00:05PM -0700, Bjorn Andersson wrote:
> >> On Tue 03 Mar 00:02 PST 2020, Cl?ment Leger wrote:
> >> 
> >> > Hi Bjorn,
> >> > 
> >> > ----- On 3 Mar, 2020, at 00:13, Bjorn Andersson bjorn.andersson@linaro.org
> >> > wrote:
> >> > 
> >> > > On Mon 02 Mar 01:38 PST 2020, Clement Leger wrote:
> >> > > 
> >> > >> Since this function will be modified to support both elf32 and elf64,
> >> > >> rename the existing one to elf32 (which is the only supported format
> >> > >> at the moment). This will allow not to introduce possible side effect
> >> > >> when adding elf64 support (ie: all backends will still support only
> >> > >> elf32 if not requested explicitely using rproc_elf_sanity_check).
> >> > >> 
> >> > > 
> >> > > Is there a reason for preventing ELF64 binaries be loaded?
> >> > 
> >> > I decided to go this way to let driver maintainer decide if they want
> >> > to support elf64 to avoid problems with 64bits addresses/sizes which do
> >> > not fit in their native type (size_t for instance). This is probably
> >> > not going to happen and there are additionnal checks before calling
> >> > rproc_da_to_va. And addresses should be filtered by rproc_da_to_va.
> >> > So, actually it seems there is no reason to forbid supporting elf32/64
> >> > for all drivers.
> >> > 
> >> 
> >> I was hoping to hear some additional feedback on this from others.
> > 
> > I didn't follow up on this one because I agreed with your assesment and didn't
> > think it was needed.
> > 
> > Simply put I would rather see rproc_elf_sanity_check() gain support for elf64
> > and let the platform code decide what to do with format they don't support
> > rather than spinning a new function.
> > 
> >> 
> >> I've merge the patch as is, but think it would be nice to clean this up
> >> and just have the driver ignore if fed a 32 or 64-elf.
> > 
> > It would be really nice to see this cleaned up in time for the coming merge
> > window...
> 
> I could have sent a V7, but Bjorn was faster than my comment ;)

I figured it had been maturing on the list long enough and expected the
cleanup to be a nice incremental patch.

> Bjorn, Is there any way to revert that or it's already pushed ?
> I already have a clean V7.
> 

Please base your changes on what's in rproc-next (and today's
linux-next).

Thank you,
Bjorn

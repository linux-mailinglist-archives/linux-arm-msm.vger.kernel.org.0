Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAC4146917
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 14:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgAWNaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 08:30:19 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40301 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgAWNaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 08:30:19 -0500
Received: by mail-pl1-f194.google.com with SMTP id s21so1362151plr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2020 05:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c3Jf7YornRWAcLPIhzKeqbQgyPavsrhhAxYWXcZAFbQ=;
        b=DEyMGAeWS1/dCHnfqvubuElHzwpwoHrxLr1c2h4oYR0RbGR2X54v5m7I+bXyLqI9uI
         JnzxuyDNAjCST4K/hvvOD9FKhuv/2UYfvOFmzW0VtSna7dqiCx54Cd88hrfME/wG1ivG
         cDlLbz63wJt517U3IpkeOnCXc5p+jukIT88/29CqI360gZCzQv6Q3gAPXpOJTE6KEXl/
         vpgPT4LAYpscBQaNh/aJUfHH2dHFIvvFtpJBb8R86G5Cn+iyU6YnafU3TNpJVRfaxOub
         cPtxmYWWY6ka7GINgvGUcANfLVQGXMeeBkW8ThFAYvxXUFNByRYGnrUT/q9d/btyjnpT
         +6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c3Jf7YornRWAcLPIhzKeqbQgyPavsrhhAxYWXcZAFbQ=;
        b=qzdEZWwdTtA1GLX+aCya5uAje9z9EJRrcm1CBT5ZW6N9IuaVepummzd/yVa430tnUX
         8Lvhxvpn/PdcRWo3E8MCS7fDN0Zv84bG8XlWXiN+vuiiB5o+pLs/gS534p5PZm3Q3d5h
         H+aptuWbEaP1WJM6y0SX/Fk0LvVeOh2A7N2BKMPlEL3+yfT5eWqgBLiJ1QHMTvz0EK/Z
         T47LvlcQg+0bzF3/kdvuHWXkAdexKfAbwUrwLqgPqqfOyczlGGhkXZAyhsOl2mHxBSVm
         i06koxqnLMzaStyd2AphL0bOW5i0qPggRU/8050vq6LqVrtzi460Rj4OeRO28BT/27Yc
         G5pg==
X-Gm-Message-State: APjAAAW+5/QVSd1rlOsY+9glY8H652nYRfD3OMUQvXp6SrUKCFSIdjoU
        /gcfJq02BHxp9typNUAdmJ9y
X-Google-Smtp-Source: APXvYqzRrhC1Pol+miUZIGuk11fLm1hNtBXeyIm++eRIHyMx6m2gejJxb0JJSeRXLweMpEAMiTxILg==
X-Received: by 2002:a17:90a:8001:: with SMTP id b1mr4503509pjn.39.1579786218610;
        Thu, 23 Jan 2020 05:30:18 -0800 (PST)
Received: from mani ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r6sm2755819pfh.91.2020.01.23.05.30.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 05:30:17 -0800 (PST)
Date:   Thu, 23 Jan 2020 19:00:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     gregkh <gregkh@linuxfoundation.org>, smohanad@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        hemantk@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 01/16] docs: Add documentation for MHI bus
Message-ID: <20200123133010.GB11366@mani>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-2-manivannan.sadhasivam@linaro.org>
 <CAK8P3a3Nxr3yqDjZDV1b0e0mdWEEsktwrmKXxZgsnq7Kv82mhw@mail.gmail.com>
 <20200123131015.GA11366@mani>
 <CAK8P3a1z7mVEpxbk47Q3A-tLDhqHUid2_S4tE3NQuf_2_UCOcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1z7mVEpxbk47Q3A-tLDhqHUid2_S4tE3NQuf_2_UCOcg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 23, 2020 at 02:19:51PM +0100, Arnd Bergmann wrote:
> On Thu, Jan 23, 2020 at 2:10 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Thu, Jan 23, 2020 at 01:58:22PM +0100, Arnd Bergmann wrote:
> > > On Thu, Jan 23, 2020 at 12:18 PM Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >
> > > I don't see any callers of mhi_register_controller(). Did I just miss it or did
> > > you not post one? I'm particularly interested in where the configuration comes
> > > from, is this hardcoded in the driver, or parsed from firmware or from registers
> > > in the hardware itself?
> > >
> >
> > I have not included the controller driver in this patchset. But you can take a
> > look at the ath11k controller driver here:
> > https://git.linaro.org/people/manivannan.sadhasivam/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=ath11k-qca6390-mhi#n13
> >
> > So the configuration comes from the static structures defined in the controller
> > driver. Earlier revision derived the configuration from devicetree but there are
> > many cases where this MHI bus is being used in non DT environments like x86.
> > So inorder to be platform agnostic, we chose static declaration method.
> >
> > In future we can add DT/ACPI support for the applicable parameters.
> 
> What determines the configuration? Is this always something that is fixed
> in hardware, or can some of the properties be changed based on what
> firmware runs the device?
> 

AFAIK, these configurations are fixed in hardware (this could come from
the firmware I'm not sure but they don't change with firmware revisions
for sure)

The reason for defining in the driver itself implies that these don't
change. But I'll confirm this with Qcom folks.

Thanks,
Mani

> If this is determined by the firmware, maybe the configuration would also
> need to be loaded from the file that contains the firmware, which in turn
> could be a blob in DT.
> 
>      Arnd

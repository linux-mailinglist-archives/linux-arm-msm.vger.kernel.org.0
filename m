Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DDE21F874
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 19:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgGNRpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 13:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgGNRpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 13:45:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58E7C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 10:45:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cm21so1951863pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2020 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tVliAqqQDVvhnzfDBoh+v8KAMLuUTT7NGBnmCPc2FXg=;
        b=Fz2CaHw4Q8pZ7Z72Ik9NVLGcBXRdhwUyIAXQRNSyBTAvvdjOPzD2EAZk2Xw/nNqCwG
         RAmtngscT9rF07IQ6vHRYBtB8LCz45HKWhF8muTECEpavS82XcBdLD9R/hHdKQWpHA9L
         gpjaDsMdlOhiFRa/7rvz2/KyTqBJNPl2CmuXU/wqiwXxuUipa47K0WWB4E2/w6tmrc+t
         6Tt1ZmQXADleUj3nD7sSGoZVggaKElgmLa+wYub0Jgw/ujmO6M5FMh3c8ewVZnR+0ZRM
         WnIHovwOfRb/WFuGC0bbUXHvzjbfyUQesvjq2G4kzl5/xzC4M1X75fI6a8bRwdf45R17
         E7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tVliAqqQDVvhnzfDBoh+v8KAMLuUTT7NGBnmCPc2FXg=;
        b=I6x+6Yl+w1D5sL8zBYBPzx+MvmxZ2DtfSHC0Cf57Lx7zplMHY1V9HBYJ0YtMFRz0Yh
         Z/zfQLjLxteHZYoHhLUzmGA3MjGWlDP7sKH6hX7dW1khKmtN4Cf94rGuDbt5Qc8+7s0q
         uA+5P8gZMGTxM3fvuABrqWs57LtWffO7ahh81JDjnHGGGXX8vkjIdOV9NIgfXzzIKuIF
         GcnoKnmPrDAz2U8TaH3864Ecq9ezaRi5170QRg4dPWgcRLe0SgL8EdauQ7VZK6++n6K7
         m00T6nBB5vlM15UGwO4qC6lIgcigXcWNbLd9u+sa+tNNvDubtMDThI2B7lXxOmEsKHcz
         DPdg==
X-Gm-Message-State: AOAM533vFwhjKI8u1oIA+wyx7PjlVLiS8XDSvmE7B3iheH91jj6KUwWQ
        dIE+NuFnSGulAXuc6OmW9k2U+g==
X-Google-Smtp-Source: ABdhPJxSfb0jOWvlwrBgf0dTH54bqHKW54WeTjK2DbDxwPq4jh0TErDAWVVDYcAhKyV1B+Ax+52Ieg==
X-Received: by 2002:a17:90a:368c:: with SMTP id t12mr5851799pjb.90.1594748752811;
        Tue, 14 Jul 2020 10:45:52 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c125sm18072972pfa.119.2020.07.14.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 10:45:52 -0700 (PDT)
Date:   Tue, 14 Jul 2020 10:43:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        SCSI <linux-scsi@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-fscrypt@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
        Can Guo <cang@codeaurora.org>,
        Elliot Berman <eberman@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Satya Tangirala <satyat@google.com>,
        Steev Klimaszewski <steev@kali.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v6 3/5] arm64: dts: sdm845: add Inline Crypto Engine
 registers and clock
Message-ID: <20200714174345.GE1218486@builder.lan>
References: <20200710072013.177481-1-ebiggers@kernel.org>
 <20200710072013.177481-4-ebiggers@kernel.org>
 <yq1ft9uqj6u.fsf@ca-mkp.ca.oracle.com>
 <20200714161516.GA1064009@gmail.com>
 <CAL_Jsq+t1h4w8C361vguw1co_vnbMKs3q4qWR4=jwAKr1Vm80g@mail.gmail.com>
 <20200714164353.GB1064009@gmail.com>
 <CAL_JsqK-wUuo6azYseC35R=Q509=h9-v4gFvcvy8wXrDgSw5ZQ@mail.gmail.com>
 <20200714171203.GC1064009@gmail.com>
 <20200714173111.GG388985@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714173111.GG388985@builder.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Jul 10:31 PDT 2020, Bjorn Andersson wrote:

> On Tue 14 Jul 10:12 PDT 2020, Eric Biggers wrote:
> 
> > On Tue, Jul 14, 2020 at 10:59:44AM -0600, Rob Herring wrote:
> > > On Tue, Jul 14, 2020 at 10:43 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > On Tue, Jul 14, 2020 at 10:35:12AM -0600, Rob Herring wrote:
> > > > > On Tue, Jul 14, 2020 at 10:15 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, Jul 14, 2020 at 10:16:04AM -0400, Martin K. Petersen wrote:
> > > > > > >
> > > > > > > Eric,
> > > > > > >
> > > > > > > > Add the vendor-specific registers and clock for Qualcomm ICE (Inline
> > > > > > > > Crypto Engine) to the device tree node for the UFS host controller on
> > > > > > > > sdm845, so that the ufs-qcom driver will be able to use inline crypto.
> > > > > > >
> > > > > > > I would like to see an Acked-by for this patch before I merge it.
> > > > > > >
> > > > > >
> > > > > > Andy, Bjorn, or Rob: can you give Acked-by?
> > > > >
> > > > > DTS changes should go in via the QCom tree.
> > > > >
> > > >
> > > > So, the DTS patch can't be applied without the driver patches since then the
> > > > driver would misinterpret the ICE registers as the dev_ref_clk_ctrl registers.
> > > 
> > > That sounds broken, but there's no context here for me to comment
> > > further. DTS changes should work with old/stable kernels. I'd suggest
> > > you get a review from Bjorn on the driver first.
> > > 
> > 
> > The "breaking" change is that the dev_ref_clk_ctrl registers are now identified
> > by name instead of assumed to be index 1.
> > 
> > A reviewer had complained about the device-mapper bindings of this driver before
> > (https://lkml.kernel.org/r/158334171487.7173.5606223900174949177@swboyd.mtv.corp.google.com).
> > Changing to identifying the registers by name seemed like an improvement.
> > 
> > If needed I can add a hole at index 1 to make the DTS changes work with
> > old/stable kernels too, but I didn't know that is a requirement.  (Normally for
> > Linux kernel development, kernel-internal refactoring is always allowed
> > upstream.)  If I do this, would this hack have to be carried forever, or would
> > we be able to fix it up eventually?  Is there any deprecation period for DTS, or
> > do the latest DTS have to work with a 20 year old kernel?
> > 
> 
> The problem here is that DT binding refactoring is not kernel-internal.
> It's two different projects living in the same git.
> 
> There's a wish from various people that we make sure that new DTS
> continues to work with existing kernels. This is a nice in theory
> there's a lot of examples where we simply couldn't anticipate how future
> bindings would look. A particular example is that this prohibits most
> advancement in power management.
> 
> 
> But afaict what you describe above would make a new kernel failing to
> operate with the old DTS and that we have agreed to avoid.
> So I think the appropriate way to deal with this is to request the reg
> byname to detect the new binding and if that fails then assume that
> index 1 is dev_ref_clk_ctrl.
> 

I took another look at the git history and I can't find a single dts -
either upstream or in any downstream tree - that specifies that second
reg.

So per my argument below, if you could include a patch that just removes
the "dev_ref_clk_ctrl_mem" reference from the binding and driver I would
be happy to r-b that and ack this patch.

Regards,
Bjorn

> 
> There are cases where we just decide not to be backwards compatible, but
> it's pretty rare. As for deprecation, I think 1-2 LTS releases is
> sufficient, at that time scale it doesn't make sense to sit with an old
> DTB anyways (given the current pace of advancements in the kernel).
> 
> Regards,
> Bjorn

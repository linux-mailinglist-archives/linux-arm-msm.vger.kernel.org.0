Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2112D21053D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 09:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgGAHnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 03:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbgGAHnV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 03:43:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3C6C061755
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 00:43:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x11so9576239plo.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 00:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mMc4j54dN6DGlrcAqYRepJM/zjg8dpWwhkXIc71CpRM=;
        b=pLKbZZQz699m9ep5n7JNbNAW4iGjn2GzhIMO1VK8z6xG7jJZllkF9eJQxZvqQakG+r
         cCvgzmQKi/fxXwLUEdpmpejSjMhUUICNjC/7HeBymyCTd7XOTB2BjQA5sUy5z8/Axb3P
         +66uKaLYAMCpL+/uPEEQpxqBngQCJ/p7fYumOT0oj4XzuUIIVkhtycpIInKz6c/yR9XD
         dzqT6OpazBf171fl16G0U02U9b4oMTQE8i3BvOVdYq3zAl0pSsouU8kYG8KdQ7+VZKxw
         k+nLQMyo4LLaiQsKdxK2TLGqSm2ZPtP1R9JH93n8ROP10RGmsHqj/c/b7g03l9oAcYiK
         ZXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mMc4j54dN6DGlrcAqYRepJM/zjg8dpWwhkXIc71CpRM=;
        b=kmvJZHU/E4if0vjUD8BZA4SJQ/S7lOoF5grK3Agd6qFocUtxd34lXFoxBU/v9OIuf/
         m/Kg3OmtxsJ04RGa0SgufiEFTtWakzs9otJd7cP8VBfH9SB+xgMIXC95Kl0vXXbwSwHz
         UlSZfVuvhX0F72lcDgKyhjssAjG14CYw0U0Hm3GeRPx9ZMcD2zK/ya+tjI9+DYh+5nL5
         zsOPk7KbkBkFIzL24sP2HcTfdDLkbNV2/4Fc5hDKrTPI86mDJRAiZAOWJWRnSXXNaciU
         985oHoNbsbM0QJE9gL1LSAqHGf7sbqirmmx4jBVaYVLok7HJcDoVoRSiR/1YOEEOAizS
         /NLw==
X-Gm-Message-State: AOAM533XxoWxdjcAl/J5uOrBBao5WZHzUTkViIWWoEIad4dAbI7TZFDE
        LJcnHfBbfxxL5+je/wfKWQbPH29ouk0=
X-Google-Smtp-Source: ABdhPJyg3Qti0THsh6aqjIZZdBzHaPEk786n7W2tpFF3WMt35frdw7VtGVYf8BCKUT6IxdM9ULX4SQ==
X-Received: by 2002:a17:902:8c8a:: with SMTP id t10mr18544088plo.153.1593589401062;
        Wed, 01 Jul 2020 00:43:21 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 25sm4804965pfi.7.2020.07.01.00.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 00:43:20 -0700 (PDT)
Date:   Wed, 1 Jul 2020 00:40:50 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-tegra@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200701074050.GO388985@builder.lan>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602063210.GT11847@yoga>
 <a1f9ee83-66cd-1f04-3e78-3281b3cafd07@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1f9ee83-66cd-1f04-3e78-3281b3cafd07@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Jun 04:00 PDT 2020, Robin Murphy wrote:

> On 2020-06-02 07:32, Bjorn Andersson wrote:
> > On Wed 27 May 04:03 PDT 2020, Will Deacon wrote:
> > 
> > > Hi John, Bjorn,
> > > 
> > > On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
> > > > On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
> > > > > 
> > > > > On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
> > > > > 
> > > > > Rob, Will, we're reaching the point where upstream has enough
> > > > > functionality that this is becoming a critical issue for us.
> > > > > 
> > > > > E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> > > > > mainline with display, GPU, WiFi and audio working and the story is
> > > > > similar on several devboards.
> > > > > 
> > > > > As previously described, the only thing I want is the stream mapping
> > > > > related to the display controller in place, either with the CB with
> > > > > translation disabled or possibly with a way to specify the framebuffer
> > > > > region (although this turns out to mess things up in the display
> > > > > driver...)
> > > > > 
> > > > > I did pick this up again recently and concluded that by omitting the
> > > > > streams for the USB controllers causes an instability issue seen on one
> > > > > of the controller to disappear. So I would prefer if we somehow could
> > > > > have a mechanism to only pick the display streams and the context
> > > > > allocation for this.
> > > > > 
> > > > > 
> > > > > Can you please share some pointers/insights/wishes for how we can
> > > > > conclude on this subject?
> > > > 
> > > > Ping? I just wanted to follow up on this discussion as this small
> > > > series is crucial for booting mainline on the Dragonboard 845c
> > > > devboard. It would be really valuable to be able to get some solution
> > > > upstream so we can test mainline w/o adding additional patches.
> > > 
> > > Sorry, it's been insanely busy recently and I haven't had a chance to think
> > > about this on top of everything else. We're also carrying a hack in Android
> > > for you :)
> > > 
> > 
> > Thanks for taking the time to get back to us on this!
> > 
> > > > The rest of the db845c series has been moving forward smoothly, but
> > > > this set seems to be very stuck with no visible progress since Dec.
> > > > 
> > > > Are there any pointers for what folks would prefer to see?
> > > 
> > > I've had a chat with Robin about this. Originally, I was hoping that
> > > people would all work together towards an idyllic future where firmware
> > > would be able to describe arbitrary pre-existing mappings for devices,
> > > irrespective of the IOMMU through which they master and Linux could
> > > inherit this configuration. However, that hasn't materialised (there was
> > > supposed to be an IORT update, but I don't know what happened to that)
> > > and, in actual fact, the problem that you have on db845 is /far/ more
> > > restricted than the general problem.
> > > 
> > > Could you please try hacking something along the following lines and see
> > > how you get on? You may need my for-joerg/arm-smmu/updates branch for
> > > all the pieces:
> > > 
> > >    1. Use the ->cfg_probe() callback to reserve the SMR/S2CRs you need
> > >       "pinning" and configure for bypass.
> > > 
> > >    2. Use the ->def_domain_type() callback to return IOMMU_DOMAIN_IDENTITY
> > >       for the display controller
> > > 
> > > I /think/ that's sufficient, but note that it differs from the current
> > > approach because we don't end up reserving a CB -- bypass is configured
> > > in the S2CR instead. Some invalidation might therefore be needed in
> > > ->cfg_probe() after unhooking the CB.
> > > 
> > > Thanks, and please yell if you run into problems with this approach.
> > > 
> > 
> > This sounded straight forward and cleaner, so I implemented it...
> > 
> > Unfortunately the hypervisor is playing tricks on me when writing to
> > S2CR registers:
> > - TRANS writes lands as requested
> > - BYPASS writes ends up in the register as requested, with type FAULT
> > - FAULT writes are ignored
> > 
> > In other words, the Qualcomm firmware prevents us from relying on
> > marking the relevant streams as BYPASS type.
> 
> Sigh...

I agree.

> at that point I'm inclined to suggest we give up and stop trying to
> drive these things with arm-smmu. The XZR thing was bad enough, but if
> they're not even going to pretend to implement the architecture correctly
> then I'm not massively keen to continue tying the architectural driver in
> further knots if innocent things like CONFIG_IOMMU_DEFAULT_PASSTHROUGH are
> going to unexpectedly and catastrophically fail. We have qcom-iommu for
> hypervisor-mediated SMMUs, and this new hypervisor behaviour sounds to me
> more like "qcom-iommu++" with reassignable stream-to-context mappings,
> rather than a proper Arm SMMU emulation.
> 

I've been going through over and over, hoping to perhaps be able to
evolve qcom_iommu into a qcom-iommu++, but afaict the new hypervisor is
different enough that this isn't feasible. In particular, the platforms
using qcom_iommu relies entirely on the hypervisor to configure stream
mapping etc - and we can't even read most of the registers.

On the other hand I agree with you that we're messing around quite a bit
with the arm-smmu driver, and I'm uncertain where we are on supporting
the various GPU features, so I'm adding Jordan to the thread.

So, afaict we have the options of either shoehorning this too into the
arm-smmu driver or we essentially fork arm-smmu.c to create a
qcom-smmu.c.

While I don't fancy the code duplication, it would allow us to revert
the Qualcomm quirks from arm-smmu and would unblock a number of
activities that we have depending on getting the SMMU enabled on various
platforms.


NB. As mentioned briefly before, "this" means: for a given compatible,
search SMR for a specific stream mapping and ensure it remains after
initialization and make sure the associated context bank is "allocated".

> > Instead Qualcomm seems to implement "bypass" by setting up stream
> > mapping, of TRANS type, pointing to a context bank without
> > ARM_SMMU_SCTLR_M set.
> 
> ...which arm-smmu specifically does not do because it's a silly waste of
> resources - typically context banks are even scarcer than S2CRs.
> 

Agreed.

Thanks,
Bjorn

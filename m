Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0C112597
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2019 02:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfECAij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 20:38:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44074 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfECAij (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 20:38:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id l2so1812165plt.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 May 2019 17:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+v/56MN/wx/RgbEucH/g+XxGkSN1si/dHCVEeh/ziQM=;
        b=jfbIyqeVbzZ0HHtoV2tsdGfPVGWAWPoWlO4/U2cwmIQ8CZPTPVu7a1z6astBMkpCBw
         XJW5SsUO+6V1Ks9sQ6Dw/Xvfh7zjFnjViBakOFqiqNmNcFBshPaTC5UtNAY924jQ7imK
         m9st7ROAwPPWPcP0ggR0Cjcc/cdZxQjDXe4ANcoa3y9D66DgwCkBUKASi2MBbPCq8MjE
         v0eqD5ANcOOXM8k50T0flQDqqrTBTqGGFScrHkilDDPxbiqZTzurs0sokLngMlEd4JYk
         f8pSYtsAJSGU0w0Qtjnix77+GeVS+e723Nw2gnqy4W/XaWF287TfGYpk+L5MSy4bRhhs
         fTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+v/56MN/wx/RgbEucH/g+XxGkSN1si/dHCVEeh/ziQM=;
        b=hCb7T7kgBt0cT8chn/s46rD/px14T+kjrBheRL8f5G1KfuGiY80LeVrAyUiEYmQlnU
         nWDTzJac4RlbznNi+Kn1hIz5GFgNPX5YsxWTMesIIwAsA0CrHsr+9JdgCSusqyAK5So5
         P5JJPy0H+W+JlGJuClo08WnnCwgUNGztnKr0AgUstyVfqZsMDomVlhsWrzhgGq4Q2rbQ
         4kd+FqZNPACJwQxwEoRZRXlV+wxRpVWcNLDOyNHILG4qnlvxg1k5+wuN89nLkkjlQMg4
         lYWDFykhyk61CIT/qqg8TTrXd+WVYu16r78Bs9esPL+m8kWUV6/3DFIIQf3uCtNz7dT4
         CUaQ==
X-Gm-Message-State: APjAAAXCf2HFR+tjVEnhuS5aWK77djEsNOmHuVoUGgD7QmQqlCcsP598
        Ytz+ss43ydvSTme+Nde2bHb24w==
X-Google-Smtp-Source: APXvYqw5D55PLQpsAt44Gs32kc+CYBAQ+K+FlX3VU8+QIbFddOdMH4vHAFXyDH6JucbEv1nfVVVj5A==
X-Received: by 2002:a17:902:7689:: with SMTP id m9mr6866087pll.274.1556843917299;
        Thu, 02 May 2019 17:38:37 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z22sm463270pgv.23.2019.05.02.17.38.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 17:38:36 -0700 (PDT)
Date:   Thu, 2 May 2019 17:38:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: Re: [PATCH] arm64/io: Don't use WZR in writel
Message-ID: <20190503003833.GI31438@minitux>
References: <38d8965a-cd41-17cf-1b95-8dd58c079be4@arm.com>
 <874c702b8af760aa8fae38d478c79e3ecba00515.camel@gmail.com>
 <235d20ef-3054-69d9-975d-25aebf32aad3@arm.com>
 <20190223181254.GC572@tuxbook-pro>
 <86zhqm8i6d.wl-marc.zyngier@arm.com>
 <20190224035356.GD572@tuxbook-pro>
 <33d765b5-1807-fa6c-1ceb-99f09f7c8d5a@free.fr>
 <8eb4f446-6152-ffb6-9529-77fb0bcc307f@arm.com>
 <7b5e8bb1-d339-07f7-66f6-7f09df2107c4@free.fr>
 <3757fc2d-0587-be46-8f75-6d79906be8bd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3757fc2d-0587-be46-8f75-6d79906be8bd@arm.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 02 May 09:33 PDT 2019, Robin Murphy wrote:

> On 02/05/2019 17:05, Marc Gonzalez wrote:
> > On 18/03/2019 17:04, Robin Murphy wrote:
> > 
> > > On 12/03/2019 12:36, Marc Gonzalez wrote:
> > > 
> > > > On 24/02/2019 04:53, Bjorn Andersson wrote:
> > > > 
> > > > > On Sat 23 Feb 10:37 PST 2019, Marc Zyngier wrote:
> > > > > 
> > > > > > On Sat, 23 Feb 2019 18:12:54 +0000, Bjorn Andersson wrote:
> > > > > > > 
> > > > > > > On Mon 11 Feb 06:59 PST 2019, Marc Zyngier wrote:
> > > > > > > 
> > > > > > > > On 11/02/2019 14:29, AngeloGioacchino Del Regno wrote:
> > > > > > > > 
> > > > > > > > > Also, just one more thing: yes this thing is going ARM64-wide and
> > > > > > > > > - from my findings - it's targeting certain Qualcomm SoCs, but...
> > > > > > > > > I'm not sure that only QC is affected by that, others may as well
> > > > > > > > > have the same stupid bug.
> > > > > > > > 
> > > > > > > > At the moment, only QC SoCs seem to be affected, probably because
> > > > > > > > everyone else has debugged their hypervisor (or most likely doesn't
> > > > > > > > bother with shipping one).
> > > > > > > > 
> > > > > > > > In all honesty, we need some information from QC here: which SoCs are
> > > > > > > > affected, what is the exact nature of the bug, can it be triggered from
> > > > > > > > EL0. Randomly papering over symptoms is not something I really like
> > > > > > > > doing, and is likely to generate problems on unaffected systems.
> > > > > > > 
> > > > > > > The bug at hand is that the XZR is not deemed a valid source in the
> > > > > > > virtualization of the SMMU registers. It was identified and fixed for
> > > > > > > all platforms that are shipping kernels based on v4.9 or later.
> > > > > > 
> > > > > > When you say "fixed": Do you mean fixed in the firmware? Or by adding
> > > > > > a workaround in the shipped kernel?
> > > > > 
> > > > > I mean that it's fixed in the firmware.
> > > > > 
> > > > > > If the former, is this part of an official QC statement, with an
> > > > > > associated erratum number?
> > > > > 
> > > > > I don't know, will get back to you on this one.
> > > > > 
> > > > > > Is this really limited to the SMMU accesses?
> > > > > 
> > > > > Yes.
> > > > > 
> > > > > > > As such Angelo's list of affected platforms covers the high-profile
> > > > > > > ones. In particular MSM8996 and MSM8998 is getting pretty good support
> > > > > > > upstream, if we can figure out a way around this issue.
> > > > > > 
> > > > > > We'd need an exhaustive list of the affected SoCs, and work out if we
> > > > > > can limit the hack to the SMMU driver (cc'ing Robin, who's the one
> > > > > > who'd know about it).
> > > > > 
> > > > > I will try to compose a list.
> > > > 
> > > > FWIW, I have just been bitten by this issue. I needed to enable an SMMU to
> > > > filter PCIe EP accesses to system RAM (or something). I'm using an APQ8098
> > > > MEDIABOX dev board. My system hangs in arm_smmu_device_reset() doing:
> > > > 
> > > > 	/* Invalidate the TLB, just in case */
> > > > 	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> > > > 	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
> > > > 
> > > > 
> > > > With the 'Z' constraint, gcc generates:
> > > > 
> > > > 	str wzr, [x0]
> > > > 
> > > > without the 'Z' constraint, gcc generates:
> > > > 
> > > > 	mov	w1, 0
> > > > 	str w1, [x0]
> > > > 
> > > > 
> > > > I can work around the problem using the following patch:
> > > > 
> > > > diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> > > > index 045d93884164..93117519aed8 100644
> > > > --- a/drivers/iommu/arm-smmu.c
> > > > +++ b/drivers/iommu/arm-smmu.c
> > > > @@ -59,6 +59,11 @@
> > > >    #include "arm-smmu-regs.h"
> > > > +static inline void qcom_writel(u32 val, volatile void __iomem *addr)
> > > > +{
> > > > +	asm volatile("str %w0, [%1]" : : "r" (val), "r" (addr));
> > > > +}
> > > > +
> > > >    #define ARM_MMU500_ACTLR_CPRE		(1 << 1)
> > > >    #define ARM_MMU500_ACR_CACHE_LOCK	(1 << 26)
> > > > @@ -422,7 +427,7 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
> > > >    {
> > > >    	unsigned int spin_cnt, delay;
> > > > -	writel_relaxed(0, sync);
> > > > +	qcom_writel(0, sync);
> > > >    	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
> > > >    		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
> > > >    			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
> > > > @@ -1760,8 +1765,8 @@ static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
> > > >    	}
> > > >    	/* Invalidate the TLB, just in case */
> > > > -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> > > > -	writel_relaxed(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
> > > > +	qcom_writel(0, gr0_base + ARM_SMMU_GR0_TLBIALLH);
> > > > +	qcom_writel(0, gr0_base + ARM_SMMU_GR0_TLBIALLNSNH);
> > > >    	reg = readl_relaxed(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0);
> > > > 
> > > > 
> > > > 
> > > > Can a quirk be used to work around the issue?
> > > > Or can we just "pessimize" the 3 writes for everybody?
> > > > (Might be cheaper than a test anyway)
> > > 
> > > If it really is just the SMMU driver which is affected, we can work
> > > around it for free (not counting the 'cost' of slightly-weird-looking
> > > code, of course). If the diff below works as expected, I'll write it up
> > > properly.
> > 
> > Here's another take on the subject. I find it minimally intrusive.
> > (But I might have overlooked better options.)
> 
> Both Angelo's and your reports strongly imply that the previous
> constant-folding debate was a red herring and the trivial fix[1] should
> still be sufficient, but nobody's given me actual confirmation of whether it
> is or isn't :(
> 
> Robin.
> 
> [1] http://linux-arm.org/git?p=linux-rm.git;a=commitdiff;h=a13e3239f0c543f1f61ce5f7f5c06320e521701c
> 

Sorry for not getting back to you in a timely manner. I have not been
able to figure out the details, but I can confirm that the issue only
covers a subset of the registers and that [1] seems to work fine on the
Dragonboard 820c (MSM8996 based).

So for [1] you have my:

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

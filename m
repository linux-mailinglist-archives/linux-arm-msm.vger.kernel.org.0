Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45FFA13F1F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2020 19:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436737AbgAPSb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jan 2020 13:31:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:38014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436645AbgAPSb2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jan 2020 13:31:28 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2D86C206D7;
        Thu, 16 Jan 2020 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579199487;
        bh=n9w+eEwrwKaNFIfJ2uLhExYF95MkN3KncmP+Uf276UI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uxCDOQukU1DhBrpSDVnWCsaQAvjOUjLxlFvtr/Si8XX4qjWwO5+kvOjQYJvYJbUZy
         wyVyxAbmtbScN9ahtoFyN+Nk/a1IMI8TtLXR2Z6Bq9+SbJFFdjoYIMTVp0RdowTi59
         bz0/1+mmMQgW+RhvSzbjNRfefuFbK2bFDC9upZ8s=
Date:   Thu, 16 Jan 2020 18:31:22 +0000
From:   Will Deacon <will@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        James Morse <james.morse@arm.com>
Subject: Re: [PATCH] arm64: Add KRYO{3,4}XX CPU cores to spectre-v2 safe list
Message-ID: <20200116183121.GE22420@willie-the-truck>
References: <20200116141912.15465-1-saiprakash.ranjan@codeaurora.org>
 <20200116153235.GA18909@willie-the-truck>
 <1a3f9557fa52ce2528630434e9a49d98@codeaurora.org>
 <CAD=FV=WP1T7gGC=m5FOwuLvZdwrg5f7K6tDuYFT=0BgCQMZf7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WP1T7gGC=m5FOwuLvZdwrg5f7K6tDuYFT=0BgCQMZf7A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 16, 2020 at 10:27:08AM -0800, Doug Anderson wrote:
> On Thu, Jan 16, 2020 at 8:11 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
> > On 2020-01-16 21:02, Will Deacon wrote:
> > > On Thu, Jan 16, 2020 at 07:49:12PM +0530, Sai Prakash Ranjan wrote:
> > >> KRYO3XX silver CPU cores and KRYO4XX silver, gold CPU cores
> > >> are not affected by Spectre variant 2. Add them to spectre_v2
> > >> safe list to correct ARM_SMCCC_ARCH_WORKAROUND_1 warning and
> > >> vulnerability sysfs value.
> > >>
> > >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > >> ---
> > >>  arch/arm64/include/asm/cputype.h | 6 ++++++
> > >>  arch/arm64/kernel/cpu_errata.c   | 3 +++
> > >>  2 files changed, 9 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/include/asm/cputype.h
> > >> b/arch/arm64/include/asm/cputype.h
> > >> index aca07c2f6e6e..7219cddeba66 100644
> > >> --- a/arch/arm64/include/asm/cputype.h
> > >> +++ b/arch/arm64/include/asm/cputype.h
> > >> @@ -85,6 +85,9 @@
> > >>  #define QCOM_CPU_PART_FALKOR_V1             0x800
> > >>  #define QCOM_CPU_PART_FALKOR                0xC00
> > >>  #define QCOM_CPU_PART_KRYO          0x200
> > >> +#define QCOM_CPU_PART_KRYO_3XX_SILVER       0x803
> > >> +#define QCOM_CPU_PART_KRYO_4XX_GOLD 0x804
> > >> +#define QCOM_CPU_PART_KRYO_4XX_SILVER       0x805
> > >
> > > Jeffrey is the only person I know who understands the CPU naming here,
> > > so
> > > I've added him in case this needs either renaming or extending to cover
> > > other CPUs. I wouldn't be at all surprised if we need a function call
> > > rather than a bunch of table entries...
> > >
> > > That said, the internet claims that KRYO4XX gold is based on
> > > Cortex-A76,
> > > and so CSV2 should be set...
> > >
> >
> > Yes the internet claims are true and CSV2 is set. SANITY check logs in
> > here show ID_PFR0_EL1 - https://lore.kernel.org/patchwork/patch/1138457/
> 
> I'm probably just being a noob here and am confused, but if CSV2 is
> set then why do you need your patch at all?  The code I see says that
> if CSV2 is set then we don't even check the spectre_v2_safe_list().

You're not being a noob at all -- you're making the same point that I was
trying to make :)

So I think we can take this patch with the KRYO_4XX_GOLD part dropped.

Will

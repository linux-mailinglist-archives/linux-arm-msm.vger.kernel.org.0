Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570171ACC36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 17:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442854AbgDPP5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 11:57:08 -0400
Received: from foss.arm.com ([217.140.110.172]:36780 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442848AbgDPP5F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 11:57:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2620A30E;
        Thu, 16 Apr 2020 08:57:05 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94EA73F237;
        Thu, 16 Apr 2020 08:57:03 -0700 (PDT)
Date:   Thu, 16 Apr 2020 16:56:56 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Robert Richter <rrichter@marvell.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] [RFC] arm64: Add dependencies to vendor-specific
 errata
Message-ID: <20200416155655.GA7155@lakrids.cambridge.arm.com>
References: <20200416115658.20406-1-geert+renesas@glider.be>
 <20200416115658.20406-3-geert+renesas@glider.be>
 <20200416125630.GF4987@lakrids.cambridge.arm.com>
 <CAMuHMdWRW4+YLR8fz0hUTAPupRkM4Y5c82XHuOWSvNYOh-BZ0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWRW4+YLR8fz0hUTAPupRkM4Y5c82XHuOWSvNYOh-BZ0A@mail.gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 16, 2020 at 05:38:07PM +0200, Geert Uytterhoeven wrote:
> On Thu, Apr 16, 2020 at 2:56 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > On Thu, Apr 16, 2020 at 01:56:58PM +0200, Geert Uytterhoeven wrote:
> > > Currently the user is asked about enabling support for each and every
> > > vendor-specific erratum, even when support for the specific platform is
> > > not enabled.
> > >
> > > Fix this by adding platform dependencies to the config options
> > > controlling support for vendor-specific errata.

> > I'm not su1re that it makes sense to do this in general, becaose the
> > ARCH_* platform symbols are about plactform/SoC support (e.g. pinctrl
> > drivers), and these are (mostly) CPU-local and/or VM-visible.
> >
> > I think that it makes sense for those to be independent because:
 
> > * It prevents building a minimal VM image with all (non-virtualized)
> >   platform support disabled, but all possible (VM-visible) errata
> >   options enabled. I do that occassionally for testing/analysis, and I
> >   can imagine this is useful for those building images that are only
> >   intended to be used in VMs.
> 
> Oh, you also want to build a "generic" guest kernel, with all ARCH_*
> symbols disabled. 

Yup! As above I do this today for building test kernels I run on a
number of different hosts, and I'm aware of other use-cases (e.g. WSL2
or docker for mac) where you may want to do this to minimize the core
kernel either for size or security reasons.

> Let's hope a maleficent user cannot disable errata mitigations in the
> guest kernel and break the host ;-)

Indeed ;)

For cases where a malicious guest could cause harm we've added
workarounds in KVM, so unless we've missed something that shouldn't be
the case.

Otherwise, a guest missing these is just shooting itself in the foot.

> And perhaps you do want to enable some platform-specific drivers for
> VFIO pass-through?  Hence having ARCH_* dependencies on those drivers
> means they cannot be enabled :-( Hmm...

IIRC platform device passthrough requires an corresponding VFIO platform
driver in the host to handle reset and so on, but it does seem a shame
to not allow the user to select a driver if they really want it.

I guess there might be platform-specific PCIe drivers too, which might
work with VFIO regardless.

Thanks,
Mark.

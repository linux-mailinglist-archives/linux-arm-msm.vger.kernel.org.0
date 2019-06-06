Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05F03720A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 12:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfFFKuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 06:50:23 -0400
Received: from foss.arm.com ([217.140.101.70]:45292 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfFFKuX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 06:50:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA9FFA78;
        Thu,  6 Jun 2019 03:50:22 -0700 (PDT)
Received: from e105550-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 383063F690;
        Thu,  6 Jun 2019 03:50:20 -0700 (PDT)
Date:   Thu, 6 Jun 2019 11:50:17 +0100
From:   Morten Rasmussen <morten.rasmussen@arm.com>
To:     Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Quentin Perret <quentin.perret@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: sdm845: Add CPU topology
Message-ID: <20190606105017.GD10919@e105550-lin.cambridge.arm.com>
References: <CAHLCerPZ0Y-rkeMa_7BJWtR4g5af2vwfPY9FgOuvpUTJG3rf7g@mail.gmail.com>
 <155786856719.14659.2902538189660269078@swboyd.mtv.corp.google.com>
 <CAHLCerP69Jw27VyO+ek4Fe3-2fDiOejtz6XZPykPSRA2G1831w@mail.gmail.com>
 <5cdf2dc8.1c69fb81.521c8.9339@mx.google.com>
 <20190605172048.ahzusevvdxrpnebk@queper01-ThinkPad-T460s>
 <CAKfTPtCR360osDz3oW+XhHT1R12SacAuJ44W_NfFOPWxJFjOPg@mail.gmail.com>
 <20190606074921.43mbinemk3j565yu@queper01-ThinkPad-T460s>
 <CAKfTPtA9WDOH3UzU-Qz4AqhLNGkOPo9EFkTHXGqTq7qsrec_JA@mail.gmail.com>
 <9267b9ed-89b0-7b71-88a2-ca1894d4c497@arm.com>
 <CAKfTPtAc=aOD=ukuPKhEL_gBSeb9DJaK-oYAPg1MWNcr-6HLQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtAc=aOD=ukuPKhEL_gBSeb9DJaK-oYAPg1MWNcr-6HLQw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 06, 2019 at 10:44:58AM +0200, Vincent Guittot wrote:
> On Thu, 6 Jun 2019 at 10:34, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
> >
> > On 6/6/19 10:20 AM, Vincent Guittot wrote:
> > > On Thu, 6 Jun 2019 at 09:49, Quentin Perret <quentin.perret@arm.com> wrote:
> > >>
> > >> Hi Vincent,
> > >>
> > >> On Thursday 06 Jun 2019 at 09:05:16 (+0200), Vincent Guittot wrote:
> > >>> Hi Quentin,
> > >>>
> > >>> On Wed, 5 Jun 2019 at 19:21, Quentin Perret <quentin.perret@arm.com> wrote:
> > >>>>
> > >>>> On Friday 17 May 2019 at 14:55:19 (-0700), Stephen Boyd wrote:
> > >>>>> Quoting Amit Kucheria (2019-05-16 04:54:45)
> > >>>>>> (cc'ing Andy's correct email address)
> > >>>>>>
> > >>>>>> On Wed, May 15, 2019 at 2:46 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > >>>>>>>
> > >>>>>>> Quoting Amit Kucheria (2019-05-13 04:54:12)
> > >>>>>>>> On Mon, May 13, 2019 at 4:31 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
> > >>>>>>>>>
> > >>>>>>>>> On Tue, Jan 15, 2019 at 12:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >>>>>>>>>>
> > >>>>>>>>>> The 8 CPU cores of the SDM845 are organized in two clusters of 4 big
> > >>>>>>>>>> ("gold") and 4 little ("silver") cores. Add a cpu-map node to the DT
> > >>>>>>>>>> that describes this topology.
> > >>>>>>>>>
> > >>>>>>>>> This is partly true. There are two groups of gold and silver cores,
> > >>>>>>>>> but AFAICT they are in a single cluster, not two separate ones. SDM845
> > >>>>>>>>> is one of the early examples of ARM's Dynamiq architecture.
> > >>>>>>>>>
> > >>>>>>>>>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > >>>>>>>>>
> > >>>>>>>>> I noticed that this patch sneaked through for this merge window but
> > >>>>>>>>> perhaps we can whip up a quick fix for -rc2?
> > >>>>>>>>>
> > >>>>>>>>
> > >>>>>>>> And please find attached a patch to fix this up. Andy, since this
> > >>>>>>>> hasn't landed yet (can we still squash this into the original patch?),
> > >>>>>>>> I couldn't add a Fixes tag.
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> I had the same concern. Thanks for catching this. I suspect this must
> > >>>>>>> cause some problem for IPA given that it can't discern between the big
> > >>>>>>> and little "power clusters"?
> > >>>>>>
> > >>>>>> Both EAS and IPA, I believe. It influences the scheduler's view of the
> > >>>>>> the topology.
> > >>>>>
> > >>>>> And EAS and IPA are OK with the real topology? I'm just curious if
> > >>>>> changing the topology to reflect reality will be a problem for those
> > >>>>> two.
> > >>>>
> > >>>> FWIW, neither EAS nor IPA depends on this. Not the upstream version of
> > >>>> EAS at least (which is used in recent Android kernels -- 4.19+).
> > >>>>
> > >>>> But doing this is still required for other things in the scheduler (the
> > >>>> so-called 'capacity-awareness' code). So until we have a better
> > >>>> solution, this patch is doing the right thing.
> > >>>
> > >>> I'm not sure to catch what you mean ?
> > >>> Which so-called 'capacity-awareness' code are you speaking about ? and
> > >>> what is the problem ?
> > >>
> > >> I'm talking about the wake-up path. ATM select_idle_sibling() is totally
> > >> unaware of capacity differences. In its current form, this function
> > >> basically assumes that all CPUs in a given sd_llc have the same
> > >> capacity, which would be wrong if we had a single MC level for SDM845.
> > >> So, until select_idle_sibling() is 'fixed' to be capacity-aware, we need
> > >> two levels of sd for asymetric systems (including DynamIQ) so the
> > >> wake_cap() story actually works.
> > >>
> > >> I hope that clarifies it :)
> > >
> > > hmm... does this justifies this wrong topology ?

No, it doesn't. It relies heavily on how nested clusters are interpreted
too, so it is quite fragile.

> > > select_idle_sibling() is called only when system is overloaded and
> > > scheduler disables the EAS path
> > > In this case, the scheduler looks either for an idle cpu or for evenly
> > > spreading the loads
> > > This is maybe not always optimal and should probably be fixed but
> > > doesn't justifies a wrong topology description IMHO
> >
> > The big/Little cluster detection in wake_cap() doesn't work anymore with
> > DynamIQ w/o Phanton (DIE) domain. So the decision of going sis() or slow
> > path is IMHO broken.
> 
> That's probably not the right thread to discuss this further but i'm
> not sure to understand why wake_cap() doesn't work as it compares the
> capacity_orig of local cpu and prev cpu which are the same whatever
> the sche domainœ

We have had this discussion a couple of times over the last couple of
years. The story, IIRC, is that when we introduced capacity awareness in
the wake-up path (wake_cap()) we realised (I think it was actually you)
that we could use select_idle_sibling() in cases where we know that the
search space is limited to cpus with sufficient capacity so we didn't
have to take the long route through find_idlest_cpu(). Back then, big
and little were grouped by clusters so it was "safe" to use
select_idle_sibling() on cpu or prev_cpu if they have sufficient
capacity.

With DynamiQ the true topology on many systems is just one cluster and
hence using select_idle_sibling() there means search space includes all
cpu types which isn't "safe" if you have a task requiring more capacity
than can be offered by any cpu in the system. We need to use the
find_idlest_cpu() path on more cases than we do today.

All the code is there I think, we just have to tweak some conditions. I
can try to come up with a simple fix we can discuss and refine as
necessary.

Morten

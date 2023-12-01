Return-Path: <linux-arm-msm+bounces-2917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75465800FE8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A65861C208BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126554BAB9;
	Fri,  1 Dec 2023 16:18:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CCF11BC5;
	Fri,  1 Dec 2023 08:18:00 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6408A1007;
	Fri,  1 Dec 2023 08:18:46 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4F043F6C4;
	Fri,  1 Dec 2023 08:17:58 -0800 (PST)
Date: Fri, 1 Dec 2023 16:17:56 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_mdtipton@quicinc.com, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com, Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix frequency truncation by
 promoting multiplier to u64
Message-ID: <ZWoHNPlxs-WnVAFe@pluto>
References: <20231130204343.503076-1-sudeep.holla@arm.com>
 <20231201143935.be6wzjzxmyl5vpz6@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201143935.be6wzjzxmyl5vpz6@bogus>

On Fri, Dec 01, 2023 at 02:39:35PM +0000, Sudeep Holla wrote:
> On Thu, Nov 30, 2023 at 08:43:42PM +0000, Sudeep Holla wrote:
> > Fix the frequency truncation for all values equal to or greater 4GHz by
> > updating the multiplier 'mult_factor' to u64 type. It is also possible
> > that the multiplier itself can be greater than or equal to 2^32. So we need
> > to also fix the equation computing the value of the multiplier.
> > 
> > Fixes: a9e3fbfaa0ff ("firmware: arm_scmi: add initial support for performance protocol")
> > Reported-by: Sibi Sankar <quic_sibis@quicinc.com>
> > Closes: https://lore.kernel.org/all/20231129065748.19871-3-quic_sibis@quicinc.com/
> > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/perf.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> > index 81dd5c5e5533..8ce449922e55 100644
> > --- a/drivers/firmware/arm_scmi/perf.c
> > +++ b/drivers/firmware/arm_scmi/perf.c
> > @@ -152,7 +152,7 @@ struct perf_dom_info {
> >  	u32 opp_count;
> >  	u32 sustained_freq_khz;
> >  	u32 sustained_perf_level;
> > -	u32 mult_factor;
> > +	u64 mult_factor;
> 
> I have now changed this to unsigned long instead of u64 to fix the 32-bit
> build failure[1].

Right, I was caught a few times too by this kind of failures on v7 :D

... but this 32bit issue makes me wonder what to do in such a case...

...I mean, on 32bit if the calculated freq oveflows, there is just
nothing we can do on v7 without overcomplicating the code...but I suppose
it is unplausible to have such high freq on a v7... as a palliative I can
only think of some sort of overflow check (only on v7) that could trigger
a warning ... but it is hardly worth the effort probably..

Thanks,
Cristian


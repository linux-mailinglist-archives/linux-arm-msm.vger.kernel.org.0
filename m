Return-Path: <linux-arm-msm+bounces-2923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA4801070
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 17:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8579B20D6C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 16:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AC24D112;
	Fri,  1 Dec 2023 16:43:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 31F20A6;
	Fri,  1 Dec 2023 08:43:06 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5371C1007;
	Fri,  1 Dec 2023 08:43:52 -0800 (PST)
Received: from bogus (unknown [10.57.42.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199DB3F6C4;
	Fri,  1 Dec 2023 08:43:03 -0800 (PST)
Date: Fri, 1 Dec 2023 16:41:02 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_mdtipton@quicinc.com, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com, Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_scmi: Fix frequency truncation by
 promoting multiplier to u64
Message-ID: <20231201164102.lb2o3mgdgjmtfknk@bogus>
References: <20231130204343.503076-1-sudeep.holla@arm.com>
 <20231201143935.be6wzjzxmyl5vpz6@bogus>
 <ZWoHNPlxs-WnVAFe@pluto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWoHNPlxs-WnVAFe@pluto>

On Fri, Dec 01, 2023 at 04:17:56PM +0000, Cristian Marussi wrote:
> On Fri, Dec 01, 2023 at 02:39:35PM +0000, Sudeep Holla wrote:
> > On Thu, Nov 30, 2023 at 08:43:42PM +0000, Sudeep Holla wrote:
> > > Fix the frequency truncation for all values equal to or greater 4GHz by
> > > updating the multiplier 'mult_factor' to u64 type. It is also possible
> > > that the multiplier itself can be greater than or equal to 2^32. So we need
> > > to also fix the equation computing the value of the multiplier.
> > > 
> > > Fixes: a9e3fbfaa0ff ("firmware: arm_scmi: add initial support for performance protocol")
> > > Reported-by: Sibi Sankar <quic_sibis@quicinc.com>
> > > Closes: https://lore.kernel.org/all/20231129065748.19871-3-quic_sibis@quicinc.com/
> > > Cc: Cristian Marussi <cristian.marussi@arm.com>
> > > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > > ---
> > >  drivers/firmware/arm_scmi/perf.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
> > > index 81dd5c5e5533..8ce449922e55 100644
> > > --- a/drivers/firmware/arm_scmi/perf.c
> > > +++ b/drivers/firmware/arm_scmi/perf.c
> > > @@ -152,7 +152,7 @@ struct perf_dom_info {
> > >  	u32 opp_count;
> > >  	u32 sustained_freq_khz;
> > >  	u32 sustained_perf_level;
> > > -	u32 mult_factor;
> > > +	u64 mult_factor;
> > 
> > I have now changed this to unsigned long instead of u64 to fix the 32-bit
> > build failure[1].
> 
> Right, I was caught a few times too by this kind of failures on v7 :D
>

😄

> ... but this 32bit issue makes me wonder what to do in such a case...
>

Same here, but the frequency calculations are also unsigned long in higher
layers, so I don't see any point in making it u64(also 32-bit doesn't
support 32bit value to be divided by a 64bit value which adds unnecessary
complications here).

> ...I mean, on 32bit if the calculated freq oveflows, there is just
> nothing we can do on v7 without overcomplicating the code...but I suppose
> it is unplausible to have such high freq on a v7...

Yes this is exactly the argument I made myself and got convinced to keep
it unsigned long(KISS approach) unless we need it on v7.

> as a palliative I can only think of some sort of overflow check (only on v7)
> that could trigger a warning ... but it is hardly worth the effort
> probably..
>

Not sure myself.

--
Regards,
Sudeep


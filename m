Return-Path: <linux-arm-msm+bounces-2736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0C7FF517
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 17:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 885AA1F20F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 16:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF8554F92;
	Thu, 30 Nov 2023 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C8EE198;
	Thu, 30 Nov 2023 08:25:49 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EACC81042;
	Thu, 30 Nov 2023 08:26:35 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11E1B3F6C4;
	Thu, 30 Nov 2023 08:25:46 -0800 (PST)
Date: Thu, 30 Nov 2023 16:25:44 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-kernel@lists.infradead.org, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Fix freq/power truncation in the
 perf protocol
Message-ID: <ZWi3iN3HDc92eMFO@pluto>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-3-quic_sibis@quicinc.com>
 <ZWh6cuApg-sRbA2s@bogus>
 <ZWiE5nM83TZd3drT@pluto>
 <ZWiUqGJ8FaA1GBjm@bogus>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWiUqGJ8FaA1GBjm@bogus>

On Thu, Nov 30, 2023 at 01:56:56PM +0000, Sudeep Holla wrote:
> On Thu, Nov 30, 2023 at 12:49:42PM +0000, Cristian Marussi wrote:
> > On Thu, Nov 30, 2023 at 12:05:06PM +0000, Sudeep Holla wrote:
> > > On Wed, Nov 29, 2023 at 12:27:47PM +0530, Sibi Sankar wrote:
> > > > Fix frequency and power truncation seen in the performance protocol by
> > > > casting it with the correct type.
> > > >
> > > 
> > > While I always remembered to handle this when reviewing the spec, seem to
> > > have forgotten when it came to handling in the implementation :(. Thanks
> > > for spotting this.
> > > 
> > > However I don't like the ugly type casting. I think we can do better. Also
> > > looking at the code around the recently added level index mode, I think we
> > > can simplify things like below patch.
> > > 
> > > Cristian,
> > > What do you think ?
> > > 
> > 
> > Hi
> > 
> > the cleanup seems nice in general to compact the mult_factor multipliers
> > in one place, and regarding addressing the problem of truncation without
> > the need of the explicit casting, should not be enough to change to
> > additionally also change mult_factor to be an u64 ?
> >
> 
> I started exactly with that, but when I completed the patch, there was no
> explicit need for it, so dropped it again. I can bump mult_factor to be
> u64 but do you see any other place that would need it apart from having
> single statement that does multiplication and assignment ? I am exploiting
> the conditional based on level_indexing_mode here but I agree it may help
> in backporting if I make mult_factor u64.
> 

Ah right

   freq *= dom->multi_fact;

does the trick..but cannot this by itself (under unplausibl conds)
overflow and does not fit into a u32 mult_factor ?

 dom_info->mult_factor =
 	(dom_info->sustained_freq_khz * 1000UL)
	/ dom_info->sustained_perf_level;


Thanks,
Cristian



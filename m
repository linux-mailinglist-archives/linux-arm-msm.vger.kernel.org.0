Return-Path: <linux-arm-msm+bounces-2760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E427FFBD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C02872818CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 19:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C2C537ED;
	Thu, 30 Nov 2023 19:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 74DA1DD;
	Thu, 30 Nov 2023 11:53:57 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA3CE1042;
	Thu, 30 Nov 2023 11:54:43 -0800 (PST)
Received: from bogus (unknown [10.57.42.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69BDF3F73F;
	Thu, 30 Nov 2023 11:53:55 -0800 (PST)
Date: Thu, 30 Nov 2023 19:51:54 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com, linux-arm-kernel@lists.infradead.org,
	quic_asartor@quicinc.com, quic_lingutla@quicinc.com
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Fix freq/power truncation in the
 perf protocol
Message-ID: <20231130195154.hid7darksc4skxqp@bogus>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-3-quic_sibis@quicinc.com>
 <ZWh6cuApg-sRbA2s@bogus>
 <ZWiE5nM83TZd3drT@pluto>
 <ZWiUqGJ8FaA1GBjm@bogus>
 <ZWi3iN3HDc92eMFO@pluto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWi3iN3HDc92eMFO@pluto>

On Thu, Nov 30, 2023 at 04:25:44PM +0000, Cristian Marussi wrote:
> On Thu, Nov 30, 2023 at 01:56:56PM +0000, Sudeep Holla wrote:
> > I started exactly with that, but when I completed the patch, there was no
> > explicit need for it, so dropped it again. I can bump mult_factor to be
> > u64 but do you see any other place that would need it apart from having
> > single statement that does multiplication and assignment ? I am exploiting
> > the conditional based on level_indexing_mode here but I agree it may help
> > in backporting if I make mult_factor u64.
> > 
> 
> Ah right
> 
>    freq *= dom->multi_fact;
> 
> does the trick..but cannot this by itself (under unplausibl conds)
> overflow and does not fit into a u32 mult_factor ?
> 
>  dom_info->mult_factor =
>  	(dom_info->sustained_freq_khz * 1000UL)
> 	/ dom_info->sustained_perf_level;

Agreed. Also thinking about backports, I think making it u64 is simple
fix. I will also thinking of splitting the changes so that fixes are
more appropriate. I will try to post something soonish.

--
Regards,
Sudeep


Return-Path: <linux-arm-msm+bounces-2762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E05E7FFC56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 21:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A422281844
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 20:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2924E53E23;
	Thu, 30 Nov 2023 20:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 381591BC6;
	Thu, 30 Nov 2023 12:16:59 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB9321042;
	Thu, 30 Nov 2023 12:17:45 -0800 (PST)
Received: from bogus (unknown [10.57.42.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9D1F3F73F;
	Thu, 30 Nov 2023 12:16:56 -0800 (PST)
Date: Thu, 30 Nov 2023 20:14:54 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	linux-arm-kernel@lists.infradead.org, quic_asartor@quicinc.com,
	quic_lingutla@quicinc.com
Subject: Re: [PATCH 2/3] firmware: arm_scmi: Fix freq/power truncation in the
 perf protocol
Message-ID: <20231130201454.jhh72rmrf6bumw2x@bogus>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
 <20231129065748.19871-3-quic_sibis@quicinc.com>
 <ZWh6cuApg-sRbA2s@bogus>
 <ZWiE5nM83TZd3drT@pluto>
 <ZWiUqGJ8FaA1GBjm@bogus>
 <ZWi3iN3HDc92eMFO@pluto>
 <c8e1adbf-a63e-5a6f-9b4a-e68a2af67779@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e1adbf-a63e-5a6f-9b4a-e68a2af67779@quicinc.com>

On Fri, Dec 01, 2023 at 01:02:25AM +0530, Sibi Sankar wrote:
>
> On 11/30/23 21:55, Cristian Marussi wrote:
> >
> > Ah right
> >
> >     freq *= dom->multi_fact;
> >
> > does the trick..but cannot this by itself (under unplausibl conds)
> > overflow and does not fit into a u32 mult_factor ?
> >
> >   dom_info->mult_factor =
> >   	(dom_info->sustained_freq_khz * 1000UL)
>
> wouldn't having the 1000UL ensure that we don't truncate though?

Correct but the point was mult_factor itself can be >= 2^32

> Anyway will drop the patch when I re-spin the series.
>

Are you re-spining just to change 24 to 32 in PATCH 3/3, if so no need.
I have already applied 1 and 3 here[1]. Just waiting for the builder
results to confirm it

--
Regards,
Sudeep

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/log/?h=for-next/scmi/updates


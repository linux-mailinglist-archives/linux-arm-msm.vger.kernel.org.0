Return-Path: <linux-arm-msm+bounces-42589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 817379F5591
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 19:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCC3D18862EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 18:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FB71F8ADD;
	Tue, 17 Dec 2024 17:59:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2D01F890F;
	Tue, 17 Dec 2024 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458398; cv=none; b=gjcXioMC+/9iHmuqjGJKcqxP5c6R/ePi3I7RaT9HGg1HwFsXTBeBKFm1P+2RKbPoMtRS9e/TwA++p7/jCgd6WkjdiD6rNdMGAxRy7AGQwOt1dD6W06nfdlQtoUZLOsDGYXRhzkn1vy6CiJJwi+5PW8ZENWAGnZYTO+D4pTYDr+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458398; c=relaxed/simple;
	bh=q1wnIV+XUCsIOA06WG9udBt0E7fj0Mo8pgtgHjlTPKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGIA8AS1Paf+MVvsZH+Szrhw64ttoSxE2loCoaOSNuCUv9JjfgctT+los13pREgHokzFp0nDjnHBdunpmpXzBOR47TWAoNCux7ftzrEgdzulHY5hdXrodFOgFFKVzguq2F6WWWbiUSI646VjjZEm1X8t4Ewxb0uCOSBKxm1JKbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0A4BFEC;
	Tue, 17 Dec 2024 10:00:22 -0800 (PST)
Received: from bogus (unknown [10.57.92.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6C13F7B4;
	Tue, 17 Dec 2024 09:59:50 -0800 (PST)
Date: Tue, 17 Dec 2024 17:59:34 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <20241217175934.GC2016149@bogus>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
 <Z1HceQegfMl07qj_@bogus>
 <d313e40b-fa8f-a534-5037-98536ee25044@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d313e40b-fa8f-a534-5037-98536ee25044@quicinc.com>

On Tue, Dec 17, 2024 at 05:55:35PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/5/24 22:31, Sudeep Holla wrote:
> > On Fri, Nov 22, 2024 at 09:37:47AM +0100, Johan Hovold wrote:
> > > On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
> > > > On 11/8/24 20:44, Johan Hovold wrote:
> > > 
> > > > > > On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
> > > 
> > > > > > > Second, after loading the protocol and client drivers manually (in that
> > > > > > > order, shouldn't the client driver pull in the protocol?), I got:
> > > > > > > 
> > > > > > > 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> > > > > > > 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> > > > > > > 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> > > > > > > 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> > > > > > > 
> > > > > > > which seems to suggest that the firmware on my CRD does not support this
> > > > > > > feature. Is that the way this should be interpreted? And does that mean
> > > > > > > that non of the commercial laptops supports this either?
> > > 
> > > > > Yeah, hopefully Sibi can shed some light on this. I'm using the DT
> > > > > patch (5/5) from this series, which according to the commit message is
> > > > > supposed to enable bus scaling on the x1e80100 platform. So I guess
> > > > > something is missing in my firmware.
> > > > 
> > > > Nah, it's probably just because of the algo string used.
> > > > The past few series used caps MEMLAT string instead of
> > > > memlat to pass the tuneables, looks like all the laptops
> > > > havn't really switched to it yet. Will revert back to
> > > > using to lower case memlat so that all devices are
> > > > supported. Thanks for trying the series out!
> > > 
> > > I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> > > there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> > > and the memlat driver probes successfully.
> > > 
> > > On the other hand, this series seems to have no effect on a kernel
> > > compilation benchmark. Is that expected?
> > > 
> > 
> > Hijacking this thread to rant about state of firmware implementation on
> > this platform that gives me zero confidence in merging any of these without
> > examining each of the interface details in depth and at lengths.
> > 
> 
> Hey Sudeep,
> 
> Thanks for taking time to review the series.
> 
> > Also I see the standard protocol like PERF seem to have so many issues which
> > adds to my no confidence. I can't comment on that thread for specific reasons.
> 
> ^^ is largely untrue, a lot of finger pointing and a gross
> misrepresentation of reality :/
>

Sorry if I was not clear, I just said I don't have confidence yet and if
the firmware is stable, then it is just the impression I have arrived based
on the discussions.

> crash in the LEVEL_GET regular message implementation. This
> pretty much went unnoticed because of messaging in perf implementation
> in kernel.

OK, is there any scope to improve in your opinion ? Please suggest and
discuss or post a patch to have separate discussion.

> Given the fastchannel implementation isn't mandatory
> according to spec, the kernel clearly says it switches to
> regular messaging when it clearly doesn't do that and uses
> stale data structures instead.

Interesting, it sounds like a bug. Please provide details or patch to
fix the bug. That would probably fix it on whatever platform we are
concerned here.

> This ensured that level get regular messaging never got tested.
>

You seem to point at this bug several time now, we need to get it fixed,
but we need to understand it first if you want us to fix it or as mentioned
before you can as well post the patch.

> We pretty much have been good upstream citizens, finding bugs and
> sending fixes wherever we can. We clearly don't deserve such a hostile
> stance.
>

Not sure what made you think we are hostile towards your contributions.
We just need a maintainable solution merged upstream and we are working
towards the same. The documents written as part of this series is not
there yet to help me understand the protocol yet. I have asked questions
and answer to those can be made part of the next version to improve it
IMO.

> > I will briefly mention my suspicion here. This Lenovo ThinkPad T14s being
> > primarily targeting other OS using ACPI might have just implemented what is
> > required for ACPI CPPC which conveniently doesn't have to discover lot of
> > fastchannel details since they are supplied in the tables straight away.
> > But that also would mean it could be not fully compliant to SCMI spec.
>
> Not fully compliant to the spec? I am pretty sure this series would
> have been shot down completely and NAKd on the list by you if that
> was the case lol.
>

Honestly I am still trying to make any sense out of this vendor protocols.
The documents produced as part of this series doesn't help me understand
the same and that is my main feedback so far on this thread. I haven't
looked at the code yet so I can't comment on the same as I first need
to understand the vendor protocol document/specification.

-- 
Regards,
Sudeep


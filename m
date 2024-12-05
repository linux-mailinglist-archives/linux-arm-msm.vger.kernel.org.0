Return-Path: <linux-arm-msm+bounces-40591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F909E5C6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC846168A96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA04A224AFE;
	Thu,  5 Dec 2024 17:01:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B13221D5BF;
	Thu,  5 Dec 2024 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418113; cv=none; b=jC6y7kI66yNiOMavHRoUNuPz3s9CUfCiw0bG1/69qgo4+eFWZrYaAoewAaLP8ig0OY8iapx51P2It+ws/0Mr6lAToGfDLxPmjdDJ4i2LMh1Ty9JjhqW9kt8z2SAh/VHTtZvPWW+36y8S+Q0DuDqHhy7D/WrPRysgJAOgDX1WNyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418113; c=relaxed/simple;
	bh=SxMB6BwXsFojNCGkMY3rAOT/oOfqMXxnGDu7nBRSkQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CT8qQjhTKKcHqC00pK5h5p5Hregp3CBU+NDOyQW5KVxcK7l9hATEOnPkTEDIjHknYpuvTcQbiaxUC/7btDDX3qFg4cw1xrOYqS7Ghteu4fxA+mTngcvBi0b4kb987KaWMhS+SeuF3kJVMT+AXWLcGYAwuVJAgK80M6jJASNFG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6A101063;
	Thu,  5 Dec 2024 09:02:18 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EC2D3F71E;
	Thu,  5 Dec 2024 09:01:48 -0800 (PST)
Date: Thu, 5 Dec 2024 17:01:45 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z1HceQegfMl07qj_@bogus>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
 <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
 <8d42682b-0fa7-3962-da12-728cfe64903b@quicinc.com>
 <Z0BC203BhGEmXcJi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0BC203BhGEmXcJi@hovoldconsulting.com>

On Fri, Nov 22, 2024 at 09:37:47AM +0100, Johan Hovold wrote:
> On Thu, Nov 14, 2024 at 09:52:12AM +0530, Sibi Sankar wrote:
> > On 11/8/24 20:44, Johan Hovold wrote:
>
> > >> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
>
> > >>> Second, after loading the protocol and client drivers manually (in that
> > >>> order, shouldn't the client driver pull in the protocol?), I got:
> > >>>
> > >>> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> > >>> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> > >>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> > >>> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> > >>>
> > >>> which seems to suggest that the firmware on my CRD does not support this
> > >>> feature. Is that the way this should be interpreted? And does that mean
> > >>> that non of the commercial laptops supports this either?
>
> > > Yeah, hopefully Sibi can shed some light on this. I'm using the DT
> > > patch (5/5) from this series, which according to the commit message is
> > > supposed to enable bus scaling on the x1e80100 platform. So I guess
> > > something is missing in my firmware.
> >
> > Nah, it's probably just because of the algo string used.
> > The past few series used caps MEMLAT string instead of
> > memlat to pass the tuneables, looks like all the laptops
> > havn't really switched to it yet. Will revert back to
> > using to lower case memlat so that all devices are
> > supported. Thanks for trying the series out!
>
> I have a Lenovo ThinkPad T14s set up now so I gave this series a spin
> there too, and there I do *not* see the above mentioned -EOPNOSUPP error
> and the memlat driver probes successfully.
>
> On the other hand, this series seems to have no effect on a kernel
> compilation benchmark. Is that expected?
>

Hijacking this thread to rant about state of firmware implementation on
this platform that gives me zero confidence in merging any of these without
examining each of the interface details in depth and at lengths.

Also I see the standard protocol like PERF seem to have so many issues which
adds to my no confidence. I can't comment on that thread for specific reasons.

I will briefly mention my suspicion here. This Lenovo ThinkPad T14s being
primarily targeting other OS using ACPI might have just implemented what is
required for ACPI CPPC which conveniently doesn't have to discover lot of
fastchannel details since they are supplied in the tables straight away.
But that also would mean it could be not fully compliant to SCMI spec.

Either we need to run some compliance test suite(which again may need more
work as it is unfortunately make platform specific - referring to [1])
or use the raw interface in the kernel and throw /dev/random at it and see
how well it can cope up.

--
Regards,
Sudeep

[1] https://gitlab.arm.com/tests/scmi-tests (Not so great and needs platform
     specific vectors to check compliance)


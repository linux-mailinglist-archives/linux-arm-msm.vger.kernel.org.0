Return-Path: <linux-arm-msm+bounces-42554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBD89F4E22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DB851887E64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39A51F668E;
	Tue, 17 Dec 2024 14:45:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B769B1F6666;
	Tue, 17 Dec 2024 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446736; cv=none; b=mwv68H2vkcy/sXwClqiaJNWMNfP9c+yPArEQ8JdeUj5qXBviG/i84REDpQCao378Pljlf8YCHXvQnKyNwvmXVfd+YIylypakEzQDZ9e8Yhym+By5+TzFTlaUQ6KtgrCckF0UkEYjO6vchGi8NFCrCPlXFem3GNka+cU3LcL4mq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446736; c=relaxed/simple;
	bh=IAwqtMs7TqeoxBD46ND3JggXmA/k0dq0HPg7U+aaru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV7iIL9KBYOT/ZB0ZRYNb8jNTS/7D7PtcDQQEqsPMPRGKqc1YfmE29Tae1UzL/JfRDnj3gRz44fWS8l06467DNNWfEBNsBb3+7GBnYx4P6SfhmA5NciPFpY0BetCRgCF4BfeoGR8AT0WqhPP/SIeaQQN+JecKWVBSeXaWmL6vzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 360D21063;
	Tue, 17 Dec 2024 06:46:02 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D59123F58B;
	Tue, 17 Dec 2024 06:45:31 -0800 (PST)
Date: Tue, 17 Dec 2024 14:45:24 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Johan Hovold <johan@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Z2GOLFqnexEalBx_@pluto>
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

Hi Sibi,

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
> The only major problem that X1E perf protocol has is a firmware
> crash in the LEVEL_GET regular message implementation. This
> pretty much went unnoticed because of messaging in perf implementation
> in kernel. Given the fastchannel implementation isn't mandatory
> according to spec, the kernel clearly says it switches to
> regular messaging when it clearly doesn't do that and uses
> stale data structures instead. This ensured that level get regular
> messaging never got tested.

You claimed this a couple of times here and on IRC, but sincerely,
looking at the fastchannel implementation in SCMI core and Perf, I could
not track down where this could have happened in the recent code
(i.e. with or without your recent, welcomed, patches...)

When FC initialization fails and bailout it says:
	
	"Failed to get FC for protocol %X [MSG_ID:%u / RES_ID:%u] - ret:%d. Using regular messaging."

... and it clears any gathered address for that FC, so that in __scmi_perf_level_get()
you end up skipping the FC machinery and use messaging

	if (dom->fc_info && dom->fc_info[PERF_FC_LEVEL].get_addr) {
		...
	}

	return scmi_perf_msg_level_get(ph, dom->id, level, poll);

Now this is done ONLY for the FC that specifically failed
initialization, i.e. identified by the tuple PROTO_ID/MSG_ID/RES_ID
(as stated in the noisy message above where MSG_ID is specified) NOT for
all Fastchannel, so you can have an FC successfully initialized only on
the GET but failing in the SET, so only the GET FC will be used.

I dont really understand how the Kernel was misbehaving and using
instead stale data, neither, if this was the case, I can see where this
issue would have been fixed.

To be clear, I am not really interested in throwing an argument here, but
I sincerely dont see where the alleged problem was and how was fixed (kernel
side), so I fear it could be still there, hidden maybe by a change in the
platform fw.

Apologies if I missed something along the history of this..

Thanks,
Cristian


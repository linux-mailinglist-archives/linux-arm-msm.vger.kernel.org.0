Return-Path: <linux-arm-msm+bounces-37183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B474F9BF7BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 21:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75F0F2832B8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 20:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D58E20A5F6;
	Wed,  6 Nov 2024 20:03:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B52204086;
	Wed,  6 Nov 2024 20:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730923430; cv=none; b=WhQG4/F/o1M4Ty6Vgdkt+fjcP8E4arz6hPkLWTFpVCoGZk7ZJQXiZCNcfndpXUXCco6qPL3UEHsrZfOkdcdjp+y/NlKnojWvZLB2DELMNn1MmUZb/IKdJYQLu4AzNiOqM8MsxjlaAuF1B4BBT9psyXVAVIy5myY27S7SteLa2Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730923430; c=relaxed/simple;
	bh=ivX4CiQTotWMPINucszsfz9xCMxcsuzikA7zdx2o5fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP3GN2PJpIaKP6ucR6PUEa5u3Fjtms0ghV+Cf2rVw1Hs/GoCFQZ3JKeCLjQK0v3oPEOpJErwh1fyv2QZjB6gfKSzMlvqI6nle2oh2I2TgxWylsj9EDUx57r6EORdGzE9M9DgP5eGXIgqnHjL4o70rADe2lhndKjpHHRMgd/fB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ADD7497;
	Wed,  6 Nov 2024 12:04:16 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 490D43F528;
	Wed,  6 Nov 2024 12:03:43 -0800 (PST)
Date: Wed, 6 Nov 2024 20:03:30 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <ZyvLktLUZOGP-LH5@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZytnRc94iKUfMYH0@hovoldconsulting.com>

On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:
> On Mon, Oct 07, 2024 at 11:40:18AM +0530, Sibi Sankar wrote:
> > The QCOM SCMI vendor protocol provides a generic way of exposing a
> > number of Qualcomm SoC specific features (like memory bus scaling)
> > through a mixture of pre-determined algorithm strings and param_id
> > pairs hosted on the SCMI controller. Introduce a client driver that
> > uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> > to detect memory latency workloads and control frequency/level of
> > the various memory buses (DDR/LLCC/DDR_QOS).
> > 
> > QCOM SCMI Generic Vendor protocol background:
> > It was found that a lot of the vendor protocol used internally was
> > for debug/internal development purposes that would either be super
> > SoC specific or had to be disabled because of some features being
> > fused out during production. This lead to a large number of vendor
> > protocol numbers being quickly consumed and were never released
> > either. Using a generic vendor protocol with functionality abstracted
> > behind algorithm strings gave us the flexibility of allowing such
> > functionality exist during initial development/debugging while
> > still being able to expose functionality like memlat once they have
> > matured enough. The param-ids are certainly expected to act as ABI
> > for algorithms strings like MEMLAT.
> 
> I wanted to give this series a quick spin on the x1e80100 CRD, but ran
> into some issues.
> 
> First, I expected the drivers to be loaded automatically when built as
> modules, but that did not happen so something appears to be missing.
> 

Hi Johan,

so the SCMI stack is fully modularizable as of this release, i.e.

 - SCMI core (scmi-core + scmi-module)
 - SCMI transports (scmi_transport_{mailbox,virtio,smc,optee}
 - optional SCMI Vendor protos
 - Std and Vendor SCMI Drivers on top of protos

....on the other side the SCMI standard protocols are still embedded
in scmi-module (or builtin) as of now...

Even though, module usage is tracked by the core AND when an SCMI Vendor
driver tries to use protocol_X, it causes protocol_X to be initialized
(calling its protocol_init), there is NO auto-loading for SCMI Vendor
Protocols when bult as LKM...because there were really no ask till now
and this stuff is in general needed so very early dburing boot...so the
usecase of all these LKM modules is just debug/test as in your case
(or in mine frequently)....

...and I am NOT saying with this that is necessarily right or must be
stay like this...just explaining how it is now....

....anyway...it is mostly trivial to add vendor/protocols autoloading
transparently...today I was experimenting with a patch that triggers
autoloading based on a generic common alias pattern in the form
'scmi-protocol-0x<NN>' (with NN the specific protocol ID of course)
that triggers the loading as soon as the SCMI Vendor driver tries to
access the protocol during its probe...

....I will post it for the next cycle once it is clean.
(unless I am missing something else that you want to add...)

> Second, after loading the protocol and client drivers manually (in that
> order, shouldn't the client driver pull in the protocol?), I got:
> 
> 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> 
> which seems to suggest that the firmware on my CRD does not support this
> feature. Is that the way this should be interpreted? And does that mean
> that non of the commercial laptops supports this either?

This seems like FW rejecting the command, maybe just only for the specific
Linux OSPM agent since it is not allowed to ask for that specific setup,
and only Sibi can shed a light here :D

...but this Vendor protocol, if I am not mistaken, AFAIU, uses a bunch
of "algo strings" coming from tokens it picks from DT and use thsoe as
params for the set_param() VendorProtocol ops...cannot be that a bad/missing
DT value could cause the FW to reject the command due to the params ?
(even if the command is supported)...

...just a guess ah... I have no real knowledge of this venndor proto...


Thanks,
Cristian



Return-Path: <linux-arm-msm+bounces-37345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 957EB9C2025
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 16:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42EDD1F24AB5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 15:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB4B51F6671;
	Fri,  8 Nov 2024 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPU8BB2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68121F5831;
	Fri,  8 Nov 2024 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731078843; cv=none; b=hXyXLnF1oySuE3iJQmKSgnLNIWMQ6laOPfGuD9eJmjShQnTwQDJabNjDWoOdc002tDlayHDcv/2oNDYwE+6PGO5TnpBBAvIMda0h/lN2TXGmeUcWR2HQPfTPEHqvtkGwEXe33iNguVduBOihkPEIzJ6j/hTQi6DhawFg2i8RoUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731078843; c=relaxed/simple;
	bh=D1KdnZEqwOBAkW2gdT2OYagXEMiuHefSlBOJ+Jlh4Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5yMgbhFvNWNUOCGCaYeSL5+fBLeTMDJF6esoefPICvgYYCdVdKbg6u81R1A8TDuAjXJtDgifBFSRKW0MsfL2iBkbQsJlR3+8rvNwZqdg1Tg1Hcg9lNQGUtSz1+dC3KwmvJSoDW9UQqMkPj5KHcni/kyeA3BdcOB+WAI6yr+4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPU8BB2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40592C4CECD;
	Fri,  8 Nov 2024 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731078843;
	bh=D1KdnZEqwOBAkW2gdT2OYagXEMiuHefSlBOJ+Jlh4Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPU8BB2hxklea4mlCBAKGkUL1VXNzNev8Gf9OaXw4U4XGqGcnoDJCLJ1RAq+pOQcF
	 osWdPeKLF3P4DCtV+h+eH4tWiDBKObPNj7OHVMgACVScEwKOO4SFjKVCXp1JYCYukr
	 sVx89JzBiAyqB/PODaA6dInFqMi0a03hdPBj8/4ns1ajaDltqGbsSAU8frDpbRps8H
	 BeT7Jn/rFmDn7OQLQDMHkrVjJNEtU0+7bCU2mFY1ycXfSwpjpDIxTUWrQ62JrrQJFW
	 UCL5yvHklEPA9Mnf5ac3fTh/r5tMZ8oGYjY2XgK/0PyB+FZcPmu72bBYpIdX7qp5ij
	 MkxqdymErTbWw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9QgX-000000005v6-0BX0;
	Fri, 08 Nov 2024 16:14:05 +0100
Date: Fri, 8 Nov 2024 16:14:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <Zy4qvedrmkRdPR3x@hovoldconsulting.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <ZytnRc94iKUfMYH0@hovoldconsulting.com>
 <ZyvLktLUZOGP-LH5@pluto>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyvLktLUZOGP-LH5@pluto>

On Wed, Nov 06, 2024 at 08:03:30PM +0000, Cristian Marussi wrote:
> On Wed, Nov 06, 2024 at 01:55:33PM +0100, Johan Hovold wrote:

> > First, I expected the drivers to be loaded automatically when built as
> > modules, but that did not happen so something appears to be missing.

> Even though, module usage is tracked by the core AND when an SCMI Vendor
> driver tries to use protocol_X, it causes protocol_X to be initialized
> (calling its protocol_init), there is NO auto-loading for SCMI Vendor
> Protocols when bult as LKM...because there were really no ask till now
> and this stuff is in general needed so very early dburing boot...so the
> usecase of all these LKM modules is just debug/test as in your case
> (or in mine frequently)....
> 
> ...and I am NOT saying with this that is necessarily right or must be
> stay like this...just explaining how it is now....

Ok, thanks for clarifying.

> ....anyway...it is mostly trivial to add vendor/protocols autoloading
> transparently...today I was experimenting with a patch that triggers
> autoloading based on a generic common alias pattern in the form
> 'scmi-protocol-0x<NN>' (with NN the specific protocol ID of course)
> that triggers the loading as soon as the SCMI Vendor driver tries to
> access the protocol during its probe...
> 
> ....I will post it for the next cycle once it is clean.
> (unless I am missing something else that you want to add...)

Sounds like that would solve the issue. I was just expecting the memlat
client driver and its protocol dependency to be loaded automatically
when built as modules on machines that can use them (e.g. as we don't
want to have every vendor protocol driver built into distro kernels,
etc).

> > Second, after loading the protocol and client drivers manually (in that
> > order, shouldn't the client driver pull in the protocol?), I got:
> > 
> > 	scmi_module: Loaded SCMI Vendor Protocol 0x80 - Qualcomm  20000
> > 	arm-scmi arm-scmi.0.auto: QCOM Generic Vendor Version 1.0
> > 	scmi-qcom-generic-ext-memlat scmi_dev.5: error -EOPNOTSUPP: failed to configure common events
> > 	scmi-qcom-generic-ext-memlat scmi_dev.5: probe with driver scmi-qcom-generic-ext-memlat failed with error -95
> > 
> > which seems to suggest that the firmware on my CRD does not support this
> > feature. Is that the way this should be interpreted? And does that mean
> > that non of the commercial laptops supports this either?
> 
> This seems like FW rejecting the command, maybe just only for the specific
> Linux OSPM agent since it is not allowed to ask for that specific setup,
> and only Sibi can shed a light here :D
> 
> ...but this Vendor protocol, if I am not mistaken, AFAIU, uses a bunch
> of "algo strings" coming from tokens it picks from DT and use thsoe as
> params for the set_param() VendorProtocol ops...cannot be that a bad/missing
> DT value could cause the FW to reject the command due to the params ?
> (even if the command is supported)...
> 
> ...just a guess ah... I have no real knowledge of this venndor proto...

Yeah, hopefully Sibi can shed some light on this. I'm using the DT
patch (5/5) from this series, which according to the commit message is
supposed to enable bus scaling on the x1e80100 platform. So I guess
something is missing in my firmware.

Johan


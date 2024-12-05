Return-Path: <linux-arm-msm+bounces-40506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 464119E55A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270C8164B14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9BB217F3A;
	Thu,  5 Dec 2024 12:40:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911A725765;
	Thu,  5 Dec 2024 12:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733402402; cv=none; b=mOAa7MS5sV0/s4AdCMOSh7g91MQNcu5sfBgsB4mZvnM1Kc0NALKm3BUs7uZaGT7jbCLsrW9SZBFuUWIyWjRppY8fqOoAwOQtIwIFrZ0f7Y8Oxs6bg6gQ/3AMBazZT+HZv8WKsH6XiyjvwOlNpCHEFQxHKU9c+RFnMckTzS6AZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733402402; c=relaxed/simple;
	bh=v1EqMLSlZanAzYMgZwBrTAsWBYWjrDI0vK366MbX4M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZcHQCKUkk/MNBhayX+/mPpuaR+bv9VCnZSMHbvlzloBKskNrCw7oZACF/M5u1M5VdDD2f97zzu1sysIKLzSGlqy4DJcHHGnecrVN4cFngCOagvTNp4iLe1rjFIx/9Wcl+lj1UZP5e2ZLGFGsgvx8DjWnlzhLPA40TR/c/74Euk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EADE91063;
	Thu,  5 Dec 2024 04:40:26 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 040FA3F5A1;
	Thu,  5 Dec 2024 04:39:56 -0800 (PST)
Date: Thu, 5 Dec 2024 12:39:54 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Shivnandan Kumar <quic_kshivnan@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	conor+dt@kernel.org, arm-scmi@vger.kernel.org,
	Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat (Memory
 Latency) governor
Message-ID: <Z1GfGk0yQAVQKEVL@pluto>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-5-quic_sibis@quicinc.com>
 <2e9614de-1a93-4e17-a10c-945c50fb3f1a@quicinc.com>
 <61ce8618-cb08-06bc-9159-4ca26d703b14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61ce8618-cb08-06bc-9159-4ca26d703b14@quicinc.com>

On Thu, Dec 05, 2024 at 04:33:05PM +0530, Sibi Sankar wrote:
> 
> 
> On 11/29/24 15:27, Shivnandan Kumar wrote:
> > 
> >

Hi Sibi,

some rants down below :P
 
> > On 10/7/2024 11:40 AM, Sibi Sankar wrote:
> > > Introduce a client driver that uses the memlat algorithm string
> > > hosted on QCOM SCMI Generic Extension Protocol to detect memory
> > > latency workloads and control frequency/level of the various
> > > memory buses (DDR/LLCC/DDR_QOS).
> > > 

[snip]

> > > +    /* Set the effective cpu frequency calculation method */
> > > +    ret = ops->set_param(ph, &cpucp_freq_method,
> > > sizeof(cpucp_freq_method), MEMLAT_ALGO_STR,
> > > +                 MEMLAT_SET_EFFECTIVE_FREQ_METHOD);
> > > +    if (ret < 0)
> > > +        return dev_err_probe(&sdev->dev, ret,
> > > +                     "failed to set effective frequency calc method\n");
> > > +
> > 
> > Hi Sibi,
> 
> Hey Shiv,
> 
> Thanks for taking time to review the series!
> 
> > Since the MEMLAT_SET_EFFECTIVE_FREQ_METHOD command is not supported in
> > the legacy CPUCP firmware, it should be kept optional. This way, if the
> > legacy firmware is used, the driver will not return an error when the
> > CPUCP firmware returns -EOPNOTSUPP.
> 
> The vendor protocol with the current major/minor version is
> expected to work as is on x1e platforms. What legacy firmware
> are you referring to? All future SoCs that plan to adhere to
> it are expected to maintain this abi and can decide to make
> use of alternate mechanisms to calculating frequency based
> on additional dt properties set.
> 

Normally in the SCMI world you could leverage protocol versioning and
the standard PROTOCOL_MESSAGE_ATTRIBUTES(0x2) command to let the agent
investigate if the SCMI server it is speaking to implements or NOT a
specific command and which specific version of that command is understood
(with possibly varying size and fields)...

...BUT since your vendor protocol is 'Generic' and, as it stands, it
basically piggybacks any kind of binary payload (i.e. subcommands of
some kind of subprotocols of yours) into the same 4 get/set/start/stop
'Generic' ops, without even specifying the transmitted/received payload
sizes into the message itself....all of the possible SCMI versioning
autodiscovery and backward-compatibility capabilities happily go out of
the window because:

- your versioning refers to the generic protocol and you cannot possibly
  describe all the possible future subcommands (opaque payloads) variations
  and/or subcommands addition/removals purely on the major/minor version, AND
  even if you did that, NONE of such future variations will be documented
  anywhere since you are hiding all of this inside a bunch of binary blobs

- you dont even specify the payload sizes of the tx/rx 'Generic' payload
  subcommands so it becomes even difficult for both the server and the
  client to safely handle your 'Generic' subcommand message payloads

- you cannot issue a PROTOCOL_MESSAGE_ATTRIBUTE() to see if a specific
  subcommand is supported, because your subcommand is NOT really a protocol
  command but it is just one of the payloads of one of the 'Generic' protocol:
  you commmands are only set/get/start/stop (maybe some sort of hack
  could be doen around these...bit all will be even more flaky...)

- you dont implement NEGOTIATE_PROTOCOL_VERSION and so you cannot even
  check if the SCMI server that you are speaking to will agree to
  downgrade and 'speak' your Kernel SCMI agent (possibly older) 'Generic'
  protocol version

All of this basically defeats all of the SCMI general capabilities
around versioning and auto-discovery when it comes to your 'Generic' vendor
protocol, with the end result that you will have to be EXTREMELY confident
to perfectly match and keep in sync at all times your SCMI Server(FW) and
Client(Kernel) sides, without any possibility of coping with a such a mismatch
on the field by using some of the fallback/downgrade mechanism that you
threw out of the window...
(...and sorry but looking at the above xchange about 'legacy firmware' I am
 a bit skeptic about this as of now :D)

...as I said initially when reviewing this series, you can do whatever
you want within your Vendor protocol, but abusing the SCMI Vendor extensions
capabilities in such a way could end up bringing to the table more cons
(the above) than pros (some supposed 'simplification')

Thanks,
Cristian


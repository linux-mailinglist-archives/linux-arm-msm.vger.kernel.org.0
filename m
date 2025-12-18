Return-Path: <linux-arm-msm+bounces-85626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AB456CCA3F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 05:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 657FE301245A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB76279DC2;
	Thu, 18 Dec 2025 04:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QT7wbs1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF163BBF0;
	Thu, 18 Dec 2025 04:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766031981; cv=none; b=jgw3+BmE2ujanqsZjL3VpUGQU9tjygbbsTWHxbsDT5FwdSXwh4ETwDbRev0JIK4foqQ3D+JiXfdb05xMeCEctIHkGKUcyElfbox9XXTmDPI3azJxFwEFqcpUzcdK6PCy/fHRqpuxiKSyjP3ZGaE6hh1B6xt4F2YeSstcdIUGSsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766031981; c=relaxed/simple;
	bh=fGL7OVk0DIMGWevc972TbD9UWVyLujfhZMU0fnty0T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LeP9LKV+B8JmtcWdfNPUoKbaMQ/Y83FGyCdJ5sYhrXfUJ2lsrfbzjeHFDELKw6l+fx0kY60WwEbR5YNCCZey1ThnHBccOAlIgdIGxaPS5QhQQ9R/rPgO0z6kZd0l7PRxSanIaZPVUu022qpv1b04hV8XYjR8R4kgasqM0VhgsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QT7wbs1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E649C4CEFB;
	Thu, 18 Dec 2025 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766031981;
	bh=fGL7OVk0DIMGWevc972TbD9UWVyLujfhZMU0fnty0T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QT7wbs1oLrSY1jRBirUI42b0iTCStAxql/q/gnlO+dxsYKywELfQI3ka6/dJX3sea
	 lS/oCgoVLsWceATO6vO5sMtmGy8LAKPP9d/93m/m5THD+vRzHMPzZg+R/N+CXNixmy
	 aNDibzwk1ViGnXb51hLIG+HIKbZAHDAtScwFU4m3nlxiWn6Rw4isB+CijxmqxA0pKM
	 ocH60HOnDnnbhp0QHlRuOMbnnZBFcEdO3d+0AYKDIWZVEGCVMJrDciFi7e9mr7/S1w
	 ZYJdMpMC6jbYkKx7O50n0YpLM3w488yvui0LADWagTNXWSh970g6FozzCsMyks/f/S
	 zSbJG7vhq1xwg==
Date: Wed, 17 Dec 2025 22:26:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
Message-ID: <vqije2t5ckhvquisgioidjhjfc7km7ro5yqfavdx5y3hy4rzgj@w35xlablr2by>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
 <20250328-lively-axiomatic-starfish-f9c0df@krzk-bin>
 <321e1d4a-5aa3-49cb-8a85-e05dbaa08e78@quicinc.com>
 <2b132133-9c03-4b7a-b59a-e0f701dfbd01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b132133-9c03-4b7a-b59a-e0f701dfbd01@quicinc.com>

On Tue, Apr 15, 2025 at 04:38:44PM +0530, Sricharan Ramabadhran wrote:
> 
> 
> On 4/1/2025 12:59 PM, Sricharan Ramabadhran wrote:
> > 
> > 
> > On 3/28/2025 1:32 PM, Krzysztof Kozlowski wrote:
> > > On Thu, Mar 27, 2025 at 11:47:49PM +0530, Sricharan R wrote:
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - qcom,ipq5424-tmel
> > > 
> > > blank line
> > ok
> > 
> > > 
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  mboxes:
> > > > +    maxItems: 1
> > > 
> > > Why mbox is having an mbox? This does not look right and suggest the
> > > block is misrepresented. I read the diagram and description two times
> > > and still do not see how this fits there.
> > TMEL/QMP secure functionalities are exposed to clients (like rproc) by
> > registering TMEL as mailbox controller. The IPC bit to communicate with
> > the TMEL/QMP controller itself is handled by the apcs mailbox. Hence
> > it looks like a mbox inside mbox.
> > 
> > Alternatively, would it be fine to fold the IPC bit handling in this
> > driver itself for doing the regmap_write (instead of connecting to
> > apcs mailbox separately) ?
> > 

The APCS provides the interface for triggering interrupts on the remote
processors, and mailbox with NULL messages is how we expose this to the
clients. On some platforms this mechanism is exposed in the form of IPCC
instead, i.e. another mailbox provider.

It might not be a mailbox, but it's the closest thing we had and it's
what we use everywhere else.

> > Also, there are couple of other ways of designing this as well.
> > Earlier i mentioned this in the RFC post [1] for getting the design
> > sorted out.
> > 
> > [1] https://lore.kernel.org/lkml/20241205080633.2623142-1-
> > quic_srichara@quicinc.com/T/
> > 
> > -------------------------------------------------------------
> > Had the below mentioned in the RFC earlier.
> > 
> > The intention of posting this is to get the design reviewed/corrected
> > since there are also other possible ways of having this SS support like:
> > 
> > a) Make TMEL QMP as a 'rpmsg' driver and clients can connect using
> >     rmpsg_send
> > 
> > b) Keep TMEL APIs seperately in drivers/firmware which would export APIs
> >     and QMP mailbox seperately.
> >     Clients can then call the exported APIS.
> > 
> > c) Combine both TMEL and QMP as mailbox (this is the approach used here)
> > 
> 
> Hi Krysztof,
> 
> Can you kindly provide your suggestion on how to proceed for the above ?
> Would want to align on the design approach before posting the next
> version.
> 

How does the TME QMP interface differ from the QMP implementation in
drivers/qcom/qcom_aoss.c?

In the AOSS QMP case we determined that there was no benefit to
abstracting this interface through the mailbox API - and a _hardware_
mailbox doesn't take variable length strings as input...


The concept of posting variable length messages onto a communication
channel resembles rpmsg, but at least the AOSS QMP is a single-channel
mechanism and there's no mapping to "rpmsg clients" in this model.

Will the TMEL QMP interface be used by anything but the TMEL driver? Why
should the TMEL and QMP drivers be separated?

Why is the mailbox API the proper abstraction of the TMEL interface?

Regards,
Bjorn


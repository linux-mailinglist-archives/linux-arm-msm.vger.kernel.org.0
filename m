Return-Path: <linux-arm-msm+bounces-44722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03065A08D15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 235263A1622
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99BB207DFC;
	Fri, 10 Jan 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MplwDqb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB3E1ACEA5;
	Fri, 10 Jan 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502768; cv=none; b=fJ212nMBTUI2yzGX3cUJ3rVjRO0ks6xARcrJRZywHmhXq0bMFYd3h/Uuiep3KBkJ+XImpTZwXvtXLSGH/4igOKEtH8RVXExeBST5AhmdZ3PtQywU+VS6sN6xVlXg2PxcyobymBWrRdB+m0oRVamY1Zqb/dOLaNsLPCndUY6c7K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502768; c=relaxed/simple;
	bh=qqUQR4lnK8ppw/d7FTUYw/DcLO90Gxoctv6bG8EHtqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJDEtuJX3LrqdLA0mKSnQkmLdKFCrfmK5Qx3kD+tnxkAUl5utU9KLrj4n8W3UxSnUSLs0eShQuc1HTuklncytpQYX2kn4il+1/IN5D0RxmqkMbCiTAjyhgOIpZEsApVyEg92y21yzWZdVe0dNwKPa1SHCXCtHAG4G201Czx9MXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MplwDqb+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19988C4CED6;
	Fri, 10 Jan 2025 09:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736502768;
	bh=qqUQR4lnK8ppw/d7FTUYw/DcLO90Gxoctv6bG8EHtqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MplwDqb+PhQx89ciXSz5v6KLy4A/b2Wi56EwELcx2YE/adwflY+Rg650BPpRjEx9N
	 of1j6cUbnS+bZkPaGPqo876cR/Q72JOASJgH2AvLo/d+VbDRL68chYz0PhsfCRdcQB
	 1Ir4TpclZrBInpfKZUpNtoVCb7ozaO+nwnGrkg/dAZ4FWHIjO5Jc4gxesOhkf8/X+Y
	 nDNBRyHqkvBCD2ycpAwW7EnwEM4+wgh3PZ22rQif9t5wsVIEhnghweDa6a7NFNdLHT
	 aUTgwCQcBNC6XE43GWt52Gw4FIO2UNpYF6AHHUB2oEfPPpiDhpppV7SXnxzpDTBDI3
	 Qczg8RDu9YLaA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tWBhA-000000004Tk-2Xbn;
	Fri, 10 Jan 2025 10:52:48 +0100
Date: Fri, 10 Jan 2025 10:52:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Marc Zyngier <maz@kernel.org>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	quic_nkela@quicinc.com, quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: [PATCH V7 0/2] qcom: x1e80100: Enable CPUFreq
Message-ID: <Z4Dt8E7C6upVtEGV@hovoldconsulting.com>
References: <20241030130840.2890904-1-quic_sibis@quicinc.com>
 <ZyTQ9QD1tEkhQ9eu@hovoldconsulting.com>
 <86plnf11yf.wl-maz@kernel.org>
 <ZyTjiiGc2ApoID9Y@hovoldconsulting.com>
 <86o72z10b6.wl-maz@kernel.org>
 <ZypOY-NCDN9fdMAR@hovoldconsulting.com>
 <86ed3p1rdq.wl-maz@kernel.org>
 <0fd14fb1-736d-cf7f-128f-658bda0de583@quicinc.com>
 <Z1HK4qIF9dT3x1OY@hovoldconsulting.com>
 <f504b325-e4a8-c297-a09f-6a2158fa1a1b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f504b325-e4a8-c297-a09f-6a2158fa1a1b@quicinc.com>

On Mon, Jan 06, 2025 at 05:52:48PM +0530, Sibi Sankar wrote:
> On 12/5/24 21:16, Johan Hovold wrote:

> > As Marc said, it seems you need to come up with a way to detect and work
> > around the broken firmware.
> 
> The perf protocol version won't have any changes so detecting
> it isn't possible :(

But there could be other ways, see below.

> > We want to get the fast channel issue fixed, but when we merge that fix
> > it will trigger these crashes if we also merge cpufreq support for x1e.
> > 
> > Can you expand the on the PERF_LEVEL_GET issue? Is it possible to
> > implement some workaround for the buggy firmware? Like returning a dummy
> > value? How exactly are things working today? Can't that be used a basis
> > for a quirk?
> 
> The main problem is the X1E firmware supports fast channel level get
> but when queried it says it doesn't support it :|. The PERF_LEVEL_GET
> regular messaging which gets used as a fallback has a bug which causes
> the device to crash. So we either enable cpufreq only on platforms
> that has the fix in place or live with the warning that certain messages
> don't support fast channel which I don't think will fly. I've also been
> told the crash wouldn't show up if we have all sleep states disabled.

We certainly want cpufreq enabled also on the current/older firmware
which have these bugs.

Based on the above, it sounds like your fix:

	https://lore.kernel.org/lkml/20241030125512.2884761-2-quic_sibis@quicinc.com/

is correct even if it triggers the crash on machines with buggy firmware.

Why can't you add a quirk for x1e platforms that makes sure that the
driver always uses fastchannel level get?

You know it is supported (and as has to be used) even if the buggy
firmware says it's not. Just set the corresponding attribute bit
unconditionally based on the DT machine compatible (or fall back to the
current implementation which theoretically other broken fw
implementations may also be relying on), or similar.

Johan


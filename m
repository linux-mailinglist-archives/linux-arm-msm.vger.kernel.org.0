Return-Path: <linux-arm-msm+bounces-85064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8707ECB6275
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 15:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EADE930155E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 14:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7732C17B4;
	Thu, 11 Dec 2025 14:07:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF142C178D;
	Thu, 11 Dec 2025 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765462034; cv=none; b=nsMFCT41O1JIvKXAMIfzHUokGdqsZEjPTecETYdw4+5oVMoVp6kyTJTgCUTuZRb+ZvkdwGkgaGJPIKjTJfCBoUP2ZWFZ1sXrgkLZT6FOKwFxlGWVPiOTJNaGnMXYL4X/GyEietzNkrXbuz+JvRqekW6kEeFVPGMlEYOMRYCwvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765462034; c=relaxed/simple;
	bh=sXEpDRhxy23RTHAjDVos6S9t1GSytKX3geT1GHNiWPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nazOsJbxsnjfmDjZ5zp3CeSKUN7Y6ld3GoueYxzb6GFjilTH0eAvmv9VjMCVRA3TnytNwQkDCyvwOsb4goJPtCX7YuXr2f6v76ERvUSb/zcu51riw7xeJFlMbGzBg4gTN/LIB2cBqn6zJu06BqZVWNTXPZt1c9SK8rWQfxXKE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFE4E1688;
	Thu, 11 Dec 2025 06:07:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CDC143F73B;
	Thu, 11 Dec 2025 06:07:10 -0800 (PST)
Date: Thu, 11 Dec 2025 14:07:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Alexey Klimov" <alexey.klimov@linaro.org>,
	"Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>
Cc: <cristian.marussi@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Message-ID: <20251211-wandering-magnificent-yak-5fb19e@sudeepholla>
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
 <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
 <20251211-masterful-caterpillar-of-love-bc2d4c@sudeepholla>
 <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEVFS1MAP8J6.2263USIPE4Y74@linaro.org>

On Thu, Dec 11, 2025 at 01:54:01PM +0000, Alexey Klimov wrote:
> On Thu Dec 11, 2025 at 1:48 PM GMT, Sudeep Holla wrote:
> > On Thu, Dec 11, 2025 at 01:14:06PM +0000, Alexey Klimov wrote:
> >> > On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
> >> >> Some upcoming SoCs define more than 32 operating performance points (OPPs),
> >> >> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
> >> >> (next power of 2) to support these configurations.
> >> 
> >> Didn't touch for a while. The way it is stated confuses me a bit.
> >> Should the value defined by protocol be updated out of the blue?
> >> Should the protocol (defined by spec) be changed first?
> >> 
> >
> > Ah good point on confusing commit message. I just assumed it is limitation
> > of the implementation. I can update the log when applying. It is not spec
> > or protocol limitation for sure.
> >
> > How about this ?
> >
> >   | firmware: arm_scmi: Increase performance MAX_OPPS limit to 64
> >   |
> >   | Some platforms expose more than 32 operating performance points (OPPs)
> >   | per performance domain via the SCMI performance protocol, but the
> >   | driver currently limits the number of OPPs it can handle to 32 via
> >   | MAX_OPPS.
> >   |
> >   | Bump MAX_OPPS to 64 so that these platforms can register all their
> >   | performance levels. This is an internal limit in the driver only and
> >   | does not affect the SCMI protocol ABI.
> >   |
> >   | 64 is chosen as the next power of two above the existing limit.
> 
> Yeah, that sounds better :)
> 

Thanks!

> I also thought that this was a driver limitation, not the protocol/spec one
> as stated in the original patch.
> 
> I don't mind updating the commit message like this (but I am not the author
> of the original patch).
> 

Vivek, are you happy with the above edited commit message ?

-- 
Regards,
Sudeep


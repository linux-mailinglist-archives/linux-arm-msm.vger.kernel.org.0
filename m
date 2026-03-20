Return-Path: <linux-arm-msm+bounces-98912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEziHUErvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:10:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98E2D955D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7597030420B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F783803DC;
	Fri, 20 Mar 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aP54ksD2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562036EAB1;
	Fri, 20 Mar 2026 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005055; cv=none; b=MiqEaNcP845bAlXo2GKUlBOoGT67i0AHWf3RgZ1M+5fia9x6uDAAY79Gxk88Kp3UL5dSJmP1Uh5l58tj+2d602yoYtYpICM+ajFgUx69huk/ScpTCqPtTCyFqM0BrrnCCH7pWwNuAovshNuf/yhF3uRvWLjNtw4/V89+rA2qhJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005055; c=relaxed/simple;
	bh=+y+avXhMzYG0CBSofwymbat0oAWsHpSMzB8CErtsq08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhYJs9uHkfD0A//cbWzMyXJrA3r5WhM7YAPUAwquYjGbXwk+rc4f4CXuGWxGjfvs/xPJkFXlgj7YFphcSGI16QFzJO+NmgK6wtR398rG17n+ZiNldCWHL04JXwCEBSJ2mAgT6TVQZTrfUnBE7fmACQ1vy3yd892XzUwqu4babyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aP54ksD2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF24C4CEF7;
	Fri, 20 Mar 2026 11:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774005054;
	bh=+y+avXhMzYG0CBSofwymbat0oAWsHpSMzB8CErtsq08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aP54ksD2KLlfd/RAHI2AlfY5DDKcULhMSgnNeFgDLAuwJx7SxqNxPraPv2X2MMTBS
	 +CC7wsCzXIBwShmRmAorCvj/8C6UbvJbpqJ+iCTuaszJvi/mRBbZx8v0gi96MH8XSu
	 twIN9Vk20aRzFC1xs42ApKcy62aTfeRTbCCTzkiCEndOJfHNrtKomwT+6WZeYymBkD
	 EYpekVGyJCkqsZ9YzJ2sAUakSZbWoCwbZhnkbFgmUoTVSN+XTDFHIkAYiyGn3s/CZp
	 sl9KFu4/A4WkCOO7uOdWHVrv+JdC/KzsQ0hA/cPldiPc0WIEowDCwEnUEU3iEPfHqf
	 zCs77tai9JULg==
Date: Fri, 20 Mar 2026 11:10:50 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <20260320-spirited-gentle-swift-86f50e@sudeepholla>
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
 <ab0dtAC+bPtc9gdT@lpieralisi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab0dtAC+bPtc9gdT@lpieralisi>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98912-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CD98E2D955D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:13:08AM +0100, Lorenzo Pieralisi wrote:
> On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
> > On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
> > > On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
> > > > Successful cpu_suspend() may not always want to return to cpu_resume() to
> > > > save the work and latency involved.
> > > > 
> > > > consider a scenario,
> > > > 
> > > > when single physical CPU (pCPU) is used on different virtual machines (VMs)
> > > > as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
> > > > saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
> > > > requesting a shallower than powerdown state. The hypervisor aggregates to a
> > > > non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
> > > > resume the execution at the same place instead of jumping to cpu_resume()
> > > > as the HW never reached till powerdown state which would have lost the
> > > > context.
> > > > 
> > > 
> > > Though I don't fully understand the intention/use-case for presenting the
> > > VMs with powerdown states ....
> > > 
> > > > While the vCPU of VM-x had latency impact of saving the context in suspend
> > > > entry path but having the return to same place saves the latency to restore
> > > > the context in resume path.
> > > > 
> > > 
> > > I understand the exit-latency aspect, though the register set involved is not
> > > very large unless the driver notifier list is sizable on some platforms. This
> > > is typically the case in Platform Coordinated mode.
> > > 
> > > > consider another scenario,
> > > > 
> > > > Newer CPUs include a feature called “powerdown abandon”. The feature is
> > > > based on the observation that events like GIC wakeups have a high
> > > > likelihood of happening while the CPU is in the middle of its powerdown
> > > > sequence (at wfi). Older CPUs will powerdown and immediately power back
> > > > up when this happens. The newer CPUs will “give up” mid way through if
> > > > no context has been lost yet. This is possible as the powerdown operation
> > > > is lengthy and a large part of it does not lose context [1].
> > > > 
> > > 
> > > When you say "large part" above, do you mean that none of the CPU context, as
> > > visible to software, is lost? Otherwise, we would need to discuss that "large
> > > part" in more detail. From the kernel point of view, this is a simple boolean:
> > > context is either lost or retained. Anything in between is not valid, as we do
> > > not support partial context loss.
> > > 
> > > > As the wakeup arrived after SW powerdown is done but before HW is fully
> > > > powered down. From SW view this is still a successful entry to suspend
> > > > and since the HW did not loose the context there is no reason to return at
> > > > entry address cpu_resume() to restore the context.
> > > > 
> > > 
> > > Yes, that may be worth considering from an optimization perspective. However,
> > > if the hardware aborts the transition, then returning success regardless of the
> > > software state should still be counted as a failure. That would keep the
> > > cpuidle entry statistics more accurate than returning success. And it is
> > > a failure as the OS expected to enter that powerdown state but there was
> > > as H/W abort.
> > > 
> > > > Remove forcing the failure at kernel if the execution does not resume at
> > > > cpu_resume() as kernel has no reason to treat such returns as failures
> > > > when the firmware has already filled in return as success.
> > > > 
> > > 
> > > This is not possible with the current PSCI spec:
> > > "Powerdown states do not return on success because restart is through the
> > > entry point address at wakeup."
> > > 
> > 
> > OK, my bad. Sorry for that.
> > For some reason, I read "do not return" as "must not return".
> > 
> > The spec allows this:
> >   |  The caller must not assume that a powerdown request will return using the
> >   |  specified entry point address. The powerdown request might not complete due,
> >   |  for example, to pending interrupts. It is also possible that, because of
> >   |  coordination with other cores, the actual state entered is shallower
> >   |  than the one requested. Because of this it is possible for an
> >   |  implementation to downgrade the powerdown state request to a standby
> >   |  state. In the case of a downgrade to standby, the implementation
> >   |  returns at the instruction following the PSCI call, at the Exception
> >   |  level of the caller, instead of returning by the specified entry point
> >   |  address. The return code in this case is SUCCESS. In the case of an
> >   |  early return due to a pending wakeup event, the implementation can
> >   |  return at the next instruction, with a return code of SUCCESS, or
> >   |  resume at the specified entry point address
> > 
> > So we need to dig and check if there was any reason for returning "NOT
> > SUPPORTED" when the call returned success.
> 
> Because we have no clue whatsoever about what happened. We need to get
> back to the cpu_suspend() caller and either say "we entered state X instead
> of Y" or report a failure (because an interrupted power down sequence *is* a
> failure for Linux - unless we want to make things up), we just can't know so
> to me the code seems good as it is (we can debate about the error code, yes
> but the gist does not change).
>

Completely agreed. The current code clearly survives a successful return, so,
in my opinion, nothing is broken. It is really just a matter of exploring
whether there is a better way to express this error condition. I doubt that is
possible, since it is either success or error; it cannot be both.

Just to clarify, my earlier comment was purely about the error code, not about
success versus error.

> Is that we want to tell CPUidle that entering the state was successful even if
> the power down sequence was interrupted or the state demoted ?

That sounds like the ask to me, but that would be incorrect.

> That's tantamount to lying IMO and would skew the power stats, no ?
>

Yes, I agree.

> Let me know, I am just trying to understand this patch's goal.
>

I will let Maulik present his opinion, as I am aligned with you, Lorenzo.

-- 
Regards,
Sudeep


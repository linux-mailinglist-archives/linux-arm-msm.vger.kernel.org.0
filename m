Return-Path: <linux-arm-msm+bounces-98906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKHuL3kevWnG6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:16:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D72D8917
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:16:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 539A630FC91E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 10:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3BC384250;
	Fri, 20 Mar 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTNi6hTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A27337FF49;
	Fri, 20 Mar 2026 10:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001593; cv=none; b=pKmya7sjVGDLCDzNpoeIR5Y4ANOpYrgIFOHF58qLO/isUdCDmtNFX/kWqPfnw5wenbupQFNEdddquSXEBlC3GMGSzmyUMn/bpywB4PA8zZydJGhXHBg8/w9M9gqWcINEstsf0AO2ObMl/PGHTYbfw+aVwR6eM25uTj3etlXAbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001593; c=relaxed/simple;
	bh=ZwbBNSo83pouV3Csn61jySfToNOWWduestB2AflPyUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENicqgyzB+K6wyOuk7jPe5KRnJt1FSQuQOvxehyA2R01F/9nHw72mgob23PkEMJypOszonFE/JzerZubt7cywHdg/1PpDk8L3lw2aTddS5aqtPZIuZB4DQWjBevkiL9lRtfG89+kgNFdW0it6iV+T6aPMityd8MGPjWi0gvT9yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTNi6hTA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B85C4CEF7;
	Fri, 20 Mar 2026 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774001593;
	bh=ZwbBNSo83pouV3Csn61jySfToNOWWduestB2AflPyUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTNi6hTAzEaVkOpmWbokSZiVnOZViao7GhgHx8v9+wKEVCMjO3EkeZDUzLkV2XJX4
	 sOk49OqTj3PZ4+N8wrtzhU/HyNwSjNDyGwxP72C622Gqu/7T7T0Cg5dq0XzmVII/sc
	 VHPFwg1TYWnZoWR4PPwxysLqRXxC9N79GE36ZiEpkfetuxzLY070fsUpsIB2RnQhBW
	 qO+AgiQJzCbh+paJPRAS+5SVaB4bHDYDSBmcHHayxwxhwpiLuOmdWQAFPj8n4VuyHF
	 ooF22AzSVLDyvdOAk9UpNswGdjkV/vhVtwJHxK5yK9+/MpAXpYlPgvOGq2WIL8WVOM
	 QxTL5wYpm7Ecg==
Date: Fri, 20 Mar 2026 11:13:08 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <ab0dtAC+bPtc9gdT@lpieralisi>
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
 <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
 <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319-ruddy-fierce-honeybee-8fc7b9@sudeepholla>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-98906-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lpieralisi@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D2D72D8917
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 04:52:18PM +0000, Sudeep Holla wrote:
> On Thu, Mar 19, 2026 at 03:14:01PM +0000, Sudeep Holla wrote:
> > On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
> > > Successful cpu_suspend() may not always want to return to cpu_resume() to
> > > save the work and latency involved.
> > > 
> > > consider a scenario,
> > > 
> > > when single physical CPU (pCPU) is used on different virtual machines (VMs)
> > > as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
> > > saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
> > > requesting a shallower than powerdown state. The hypervisor aggregates to a
> > > non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
> > > resume the execution at the same place instead of jumping to cpu_resume()
> > > as the HW never reached till powerdown state which would have lost the
> > > context.
> > > 
> > 
> > Though I don't fully understand the intention/use-case for presenting the
> > VMs with powerdown states ....
> > 
> > > While the vCPU of VM-x had latency impact of saving the context in suspend
> > > entry path but having the return to same place saves the latency to restore
> > > the context in resume path.
> > > 
> > 
> > I understand the exit-latency aspect, though the register set involved is not
> > very large unless the driver notifier list is sizable on some platforms. This
> > is typically the case in Platform Coordinated mode.
> > 
> > > consider another scenario,
> > > 
> > > Newer CPUs include a feature called “powerdown abandon”. The feature is
> > > based on the observation that events like GIC wakeups have a high
> > > likelihood of happening while the CPU is in the middle of its powerdown
> > > sequence (at wfi). Older CPUs will powerdown and immediately power back
> > > up when this happens. The newer CPUs will “give up” mid way through if
> > > no context has been lost yet. This is possible as the powerdown operation
> > > is lengthy and a large part of it does not lose context [1].
> > > 
> > 
> > When you say "large part" above, do you mean that none of the CPU context, as
> > visible to software, is lost? Otherwise, we would need to discuss that "large
> > part" in more detail. From the kernel point of view, this is a simple boolean:
> > context is either lost or retained. Anything in between is not valid, as we do
> > not support partial context loss.
> > 
> > > As the wakeup arrived after SW powerdown is done but before HW is fully
> > > powered down. From SW view this is still a successful entry to suspend
> > > and since the HW did not loose the context there is no reason to return at
> > > entry address cpu_resume() to restore the context.
> > > 
> > 
> > Yes, that may be worth considering from an optimization perspective. However,
> > if the hardware aborts the transition, then returning success regardless of the
> > software state should still be counted as a failure. That would keep the
> > cpuidle entry statistics more accurate than returning success. And it is
> > a failure as the OS expected to enter that powerdown state but there was
> > as H/W abort.
> > 
> > > Remove forcing the failure at kernel if the execution does not resume at
> > > cpu_resume() as kernel has no reason to treat such returns as failures
> > > when the firmware has already filled in return as success.
> > > 
> > 
> > This is not possible with the current PSCI spec:
> > "Powerdown states do not return on success because restart is through the
> > entry point address at wakeup."
> > 
> 
> OK, my bad. Sorry for that.
> For some reason, I read "do not return" as "must not return".
> 
> The spec allows this:
>   |  The caller must not assume that a powerdown request will return using the
>   |  specified entry point address. The powerdown request might not complete due,
>   |  for example, to pending interrupts. It is also possible that, because of
>   |  coordination with other cores, the actual state entered is shallower
>   |  than the one requested. Because of this it is possible for an
>   |  implementation to downgrade the powerdown state request to a standby
>   |  state. In the case of a downgrade to standby, the implementation
>   |  returns at the instruction following the PSCI call, at the Exception
>   |  level of the caller, instead of returning by the specified entry point
>   |  address. The return code in this case is SUCCESS. In the case of an
>   |  early return due to a pending wakeup event, the implementation can
>   |  return at the next instruction, with a return code of SUCCESS, or
>   |  resume at the specified entry point address
> 
> So we need to dig and check if there was any reason for returning "NOT
> SUPPORTED" when the call returned success.

Because we have no clue whatsoever about what happened. We need to get
back to the cpu_suspend() caller and either say "we entered state X instead
of Y" or report a failure (because an interrupted power down sequence *is* a
failure for Linux - unless we want to make things up), we just can't know so
to me the code seems good as it is (we can debate about the error code, yes
but the gist does not change).

Is that we want to tell CPUidle that entering the state was successful even if
the power down sequence was interrupted or the state demoted ? That's
tantamount to lying IMO and would skew the power stats, no ?

Let me know, I am just trying to understand this patch's goal.

Thanks,
Lorenzo


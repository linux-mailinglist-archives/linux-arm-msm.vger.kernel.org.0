Return-Path: <linux-arm-msm+bounces-98784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJdiA6ATvGnbrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:17:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BEA2CD8F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04CC1307A111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F993E1D12;
	Thu, 19 Mar 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/HpPYRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771CE3E1CFB;
	Thu, 19 Mar 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933245; cv=none; b=eE9yJsg+rxDBiv73TF9APvvgHQ5emEz1rUBE3D3qSbBoL+F8D7LO7B6ZYKmps2mYqN4WBwmaKAP8Cnznd+DyWtmi4ALsagGUWXKpyXzpodd8tYEgn9XpxiTMyM6bKagzJo+Nyr7hAuLTS1CPPxNnBGCzpWUkEl7DlasAEBBXnrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933245; c=relaxed/simple;
	bh=6uAt7ubzV2O3BI/pAFzPDP4tAXyo8E4m0NbhLWXLX7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btBRzKBPRVhGimHlVdoaY3TefE31MM3Hhsn/dwRBog0A0g2NG7nsfApY8c6hTWIwhRQkygYL3IaubVJUz1xTImZTkSluYaYrIRanmlg1bUo6P0jP5Q9rPNApbpi0TFw8uy97EFkOlsk5Yee8ILH59lxHMDPzp45RudapwJXkAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/HpPYRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83877C19424;
	Thu, 19 Mar 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773933245;
	bh=6uAt7ubzV2O3BI/pAFzPDP4tAXyo8E4m0NbhLWXLX7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/HpPYRyB1SSEB7/oIXSgbd20NyZpWHxgE6iK9aXcxf7ZlW8BUYcrc9wij9EqMvb5
	 xRVeI3EbFJ9OoCT3uWu1Vt45sa19+Jp0jYuI3wSr58j2hX3inuVS+nUxgJe/VJ/448
	 n162+qsfyZykdrUgrKFEBUmiIkV+LtXjGxs+x3Mj6TwmnJy7oRdfsFKx9VPRQ5ss6I
	 sqb4buK5yBLSLBv20U8zzN57XlEC9xZ+SiuwxgmikGuS/UTwBGa9Gk2OnHmZj3/EkY
	 rZgaCHWSf867C9KVxGZLrVbfcEDL6EEERx9l3FfIFA6zBPOZoOpyh71oW+8NU84k81
	 wmK0mRFe/YreA==
Date: Thu, 19 Mar 2026 15:14:01 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <20260319-tiny-coucal-of-tranquility-ce0bd4@sudeepholla>
References: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316-suspend_ret-v1-1-1a30b110bb7d@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98784-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95BEA2CD8F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:18:18PM +0530, Maulik Shah wrote:
> Successful cpu_suspend() may not always want to return to cpu_resume() to
> save the work and latency involved.
> 
> consider a scenario,
> 
> when single physical CPU (pCPU) is used on different virtual machines (VMs)
> as virtual CPUs (vCPUs). VM-x's vCPU can request a powerdown state after
> saving the context by invoking __cpu_suspend_enter() whereas VM-y's vCPU is
> requesting a shallower than powerdown state. The hypervisor aggregates to a
> non powerdown state for pCPU. A wakeup event for VM-x's vCPU may want to
> resume the execution at the same place instead of jumping to cpu_resume()
> as the HW never reached till powerdown state which would have lost the
> context.
> 

Though I don't fully understand the intention/use-case for presenting the
VMs with powerdown states ....

> While the vCPU of VM-x had latency impact of saving the context in suspend
> entry path but having the return to same place saves the latency to restore
> the context in resume path.
> 

I understand the exit-latency aspect, though the register set involved is not
very large unless the driver notifier list is sizable on some platforms. This
is typically the case in Platform Coordinated mode.

> consider another scenario,
> 
> Newer CPUs include a feature called “powerdown abandon”. The feature is
> based on the observation that events like GIC wakeups have a high
> likelihood of happening while the CPU is in the middle of its powerdown
> sequence (at wfi). Older CPUs will powerdown and immediately power back
> up when this happens. The newer CPUs will “give up” mid way through if
> no context has been lost yet. This is possible as the powerdown operation
> is lengthy and a large part of it does not lose context [1].
> 

When you say "large part" above, do you mean that none of the CPU context, as
visible to software, is lost? Otherwise, we would need to discuss that "large
part" in more detail. From the kernel point of view, this is a simple boolean:
context is either lost or retained. Anything in between is not valid, as we do
not support partial context loss.

> As the wakeup arrived after SW powerdown is done but before HW is fully
> powered down. From SW view this is still a successful entry to suspend
> and since the HW did not loose the context there is no reason to return at
> entry address cpu_resume() to restore the context.
> 

Yes, that may be worth considering from an optimization perspective. However,
if the hardware aborts the transition, then returning success regardless of the
software state should still be counted as a failure. That would keep the
cpuidle entry statistics more accurate than returning success. And it is
a failure as the OS expected to enter that powerdown state but there was
as H/W abort.

> Remove forcing the failure at kernel if the execution does not resume at
> cpu_resume() as kernel has no reason to treat such returns as failures
> when the firmware has already filled in return as success.
> 

This is not possible with the current PSCI spec:
"Powerdown states do not return on success because restart is through the
entry point address at wakeup."

-- 
Regards,
Sudeep


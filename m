Return-Path: <linux-arm-msm+bounces-98768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB/JAT4FvGmurAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:16:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6F52CC8D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7290D3248F84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB973033D6;
	Thu, 19 Mar 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OP14Xpa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA553033D5;
	Thu, 19 Mar 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929495; cv=none; b=uevtUeebdKhgCFFMLU3dfMp3J9X67BxYtu+VdSl86yWjLqBWeNI3JLbtta0RcKZnhCJnmBKLxXEVnXkh61YE1bT0gvIaI82f+lR5YKHjRZCu10n0NkW7gEHYVs8jaJScJtDXDQNXruLWjcaUyZbfUCUaz+0UCLkBUEXakGUnIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929495; c=relaxed/simple;
	bh=zMrJUy/hP5SmU717SITFjsj9J8MxF1hEn+wiN6agSEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBM2LQyWNNBWalVXuXFOL9SfhygkCffwa+Nx720PBzdwlTmpKQ65BKZbyGbCPgBmjgQ3sZwn/SEPKV6n3x3YFhS67GkxdXRCugQsxJxHaMwN3iRZ9Dy/pkXbUQC6lrzMO1DZNQeEzGLP8VIsUOBqA/zbkSVSj10WxTXAANkqhxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OP14Xpa9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A97C19424;
	Thu, 19 Mar 2026 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773929495;
	bh=zMrJUy/hP5SmU717SITFjsj9J8MxF1hEn+wiN6agSEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OP14Xpa9HduHeRMzydVXWw9vyItMhaQiYW4Y9QcbkgPUNUe/rl13yu4mWVwk2CZsp
	 hugx+oKUkpm1yr0gLtC4BndZ8JC4EbCh0WN0pg4fRSlJ2sxgueST0AfTvyhMUE6F7p
	 RJ/E0uJsSO86X69a9mDt2BrdAQPPeBQAeoZyeaCGgsqZfTehzn7V1meSe4xKTCOfIt
	 o+KBmi8KKV3T60g7ewI+itr89unD3e8fy2kOVl1s/amM8frRoXHxQ75xvoSPAF58DU
	 fJIyAKqIlnov1xO1XxnnnQ28e1VC0H9P5/+uknHycN2YgntOfXbS1Cv6v1clQxj1iK
	 adJVMzXVwj7Gg==
Date: Thu, 19 Mar 2026 14:11:29 +0000
From: Will Deacon <will@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
	lpieralisi@kernel.org, sudeep.holla@kernel.org
Subject: Re: [PATCH] arm64: suspend: Remove forcing error from suspend
 finisher
Message-ID: <abwEETSDOPRpgtum@willie-the-truck>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98768-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5B6F52CC8D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[+Mark, Lorenzo and Sudeep]

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
> While the vCPU of VM-x had latency impact of saving the context in suspend
> entry path but having the return to same place saves the latency to restore
> the context in resume path.
> 
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
> As the wakeup arrived after SW powerdown is done but before HW is fully
> powered down. From SW view this is still a successful entry to suspend
> and since the HW did not loose the context there is no reason to return at
> entry address cpu_resume() to restore the context.
> 
> Remove forcing the failure at kernel if the execution does not resume at
> cpu_resume() as kernel has no reason to treat such returns as failures
> when the firmware has already filled in return as success.
> 
> [1] https://trustedfirmware-a.readthedocs.io/en/v2.14.0/design/firmware-design.html#cpu-specific-operations-framework
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/kernel/suspend.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
> index eaaff94329cddb8d1fb8d1523395453f3501c9a5..b54e578f0f8b03c1dba38157c6012bb064adaa12 100644
> --- a/arch/arm64/kernel/suspend.c
> +++ b/arch/arm64/kernel/suspend.c
> @@ -144,15 +144,14 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
>  		ret = fn(arg);
>  
>  		/*
> -		 * Never gets here, unless the suspend finisher fails.
> -		 * Successful cpu_suspend() should return from cpu_resume(),
> -		 * returning through this code path is considered an error
> -		 * If the return value is set to 0 force ret = -EOPNOTSUPP
> -		 * to make sure a proper error condition is propagated
> +		 * Successful HW power down should return at cpu_resume()
> +		 * however successful SW power down may still want to
> +		 * return here to save the work and latency involved in
> +		 * restoring the context when the HW never lost it.
> +		 *
> +		 * If the return value is set to 0 do not force failure
> +		 * from here.
>  		 */
> -		if (!ret)
> -			ret = -EOPNOTSUPP;
> -

This doesn't look right to me.

afaict, the only suspend finisher we get here on arm64 is for PSCI. The
PSCI spec returns SUCCESS if a shallower state is entered than the one
requested, in which case we should return an error back to cpuidle rather
than pretend to have entered a deeper state than we actually did.

I wonder if we could remove the 'fn' paramater from cpu_suspend()
altogether for arm64 and hardwire PSCI directly, given that it's the
only one we seem to support?

Will


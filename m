Return-Path: <linux-arm-msm+bounces-116337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GTMuKbHHR2qxfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:31:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB917036C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:31:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=sgpwwyrA;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116337-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116337-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F44A301C974
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 14:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBF43E0C4C;
	Fri,  3 Jul 2026 14:29:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283F634FF79;
	Fri,  3 Jul 2026 14:29:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088941; cv=none; b=qJl9dyLNtlmeFU5thcXpy/7U+SEvEZIbhO6/43Ja3UV+UgYMzQw6jtK/xaDJjZ+YTAkO7NcRKyC9BEOIeH4Z7mqf+Pc2iKN+AtKZ4/LQCyippYJKNrN8RbL3YnD5TlHQKXMX16kVSknuWQ7UO8o0w+DRaPTc0D9nzYqiA+mtbNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088941; c=relaxed/simple;
	bh=nv3+ueVUIqGIKl6icFEdZ93kbNEcdpBz4MyhQ3JR4po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7LqaXHXqxFPPn2lSL8b3zaKaX2kT1ZE6OYfO116G/wqwyfKgbz9PuzwDurdCP5ag0xIelh76b7xaw7KwwthLmdmmBznthUXeTU0PCNoqV4YH6B1L6E07ZNOvIGnk6tBtNoUJBwJHvCXSAhxmQx9yYUF4bfEpQZLqjbxzqApFqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sgpwwyrA; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D44B1EA6;
	Fri,  3 Jul 2026 07:28:55 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C2863F905;
	Fri,  3 Jul 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783088939; bh=nv3+ueVUIqGIKl6icFEdZ93kbNEcdpBz4MyhQ3JR4po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgpwwyrA/S1qdbCYzbpunx+YSOi/jbPy7mBef/QF23F8VqcSZmHV4PamfxqlyayUB
	 sq2PIBc7rIVuruoOoPtnyLYPY+bSDlQGmACa4RDkTcGSIIPiF6xcDbM7b2i+disHMG
	 NSjNMHHWVx90IeXhriurCRV5kA4+6xDVTZCTt0Hs=
Date: Fri, 3 Jul 2026 15:28:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
Message-ID: <akfHIH_dZrr5bosu@J2N7QTR9R3>
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116337-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:tglx@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,J2N7QTR9R3:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DB917036C2

On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
> The Qualcomm SoCs like LeMans, Monaco 

Are those released products?

Are those mobile phone parts, or somthing else?

> support suspend to ram which leads the SoC to ACPI S3 similar state
> where SoC is turned off and DDR is retained. The hardware design on
> these SoCs forces a constraint to suspend and resume the system on
> boot CPU / CPU0.
> 
> If CPU0 is already offline before starting suspend to ram the
> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
> proceed further to invoke PSCI SYSTEM_SUSPEND.
> This leads to a system crash.

Ok, so that's a firmware bug.

Why does the FW permit CPU0 to be offlined in the first place if it
can't handle this?

What does PSCI_MIGRATE_INFO_TYPE report?

Ideally it'd report Uniprocessor (UP) not migrate capable (1), which
would prevent CPU_OFF on that CPU, and would force suspend to happen
there...

> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
> config and when enabled prohibit the CPU0 from getting disabled.

I don't think it makes sense for this to be a config option.

This is a platform-specific property, and it's possible to build a
kernel that boots on this platform and/or other platforms.

> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
> Changes in v2:
> - Moved the check to arm64 specific code.
> - Link to v1: https://lore.kernel.org/r/20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com
> ---
>  arch/arm64/Kconfig       | 9 +++++++++
>  arch/arm64/kernel/psci.c | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index fe60738e5943ba279e5571862423df4fed3db661..21697a535a25d286a2f8afe4921a41b13cc32c0a 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -263,6 +263,15 @@ config ARM64
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> +config PM_SLEEP_SMP_CPU_ZERO_STRICT
> +       bool "Disallow boot CPU (CPU0) offline"
> +       depends on ARCH_QCOM

Why can't others select this?

> +       depends on HOTPLUG_CPU
> +       depends on SUSPEND
> +       help
> +         Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
> +         has to be executed by boot CPU.

As above, I don't think this makse sense as a config option.

Either we handle the FW bug, or we do not.

Mark.

> +
>  config RUSTC_SUPPORTS_ARM64
>  	def_bool y
>  	depends on CPU_LITTLE_ENDIAN
> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
> index fabd732d0a2dfee37074ef4ebb6ce5894871c8bd..4ad90ae6f8bacf0cbd3203d66580107d467ea232 100644
> --- a/arch/arm64/kernel/psci.c
> +++ b/arch/arm64/kernel/psci.c
> @@ -49,6 +49,12 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
>  #ifdef CONFIG_HOTPLUG_CPU
>  static bool cpu_psci_cpu_can_disable(unsigned int cpu)
>  {
> +#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
> +	if (cpu == get_boot_cpu_id()) {
> +		pr_info("Disabling boot CPU is not supported\n");
> +		return false;
> +	}
> +#endif
>  	return !psci_tos_resident_on(cpu);
>  }
>  
> 
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
> 
> Best regards,
> -- 
> Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> 
> 


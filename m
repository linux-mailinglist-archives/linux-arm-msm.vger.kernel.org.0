Return-Path: <linux-arm-msm+bounces-94892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DqjI0J0pWkNBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:28:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F27411D77AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA9EF3035A94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7482361DBE;
	Mon,  2 Mar 2026 11:23:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29393331A41;
	Mon,  2 Mar 2026 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450626; cv=none; b=SeILxGkeFTS0XNpQMRwGtAnRiL8Om2TPxl52saHB4Vf/2b+Oswikz0Hy1iQd9+mGExIbty38esnE6hALNmvHR6x9niCNFoyd5yUc3eeQfyi9dW+Lgsee+/yUJg5YHVvZOf9JJDg5hMvy+UKH17h34vldI6nta7hPlfC7zwUOOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450626; c=relaxed/simple;
	bh=n8GhNqh9Z5M15liUm+3khHHLKWTvm8qSjLa2AKBaq88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrQqKYQ9XzZzx7dr1oB9uXTinsOu8P0viV3zPVbMqluuxZbAeKij1gIpvkukYkTRxqlsTuM9nbB6lhWI2p0X9GS/qBAOUV2aG6SiqQBsOsO68KKibDjJuEDeoZOj2gyrtNjOoT6xmuMcyAfqWtJNk8+aT3Cw6fZwDo999lXjsGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 515CF14BF;
	Mon,  2 Mar 2026 03:23:38 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDD853F73B;
	Mon,  2 Mar 2026 03:23:42 -0800 (PST)
Date: Mon, 2 Mar 2026 11:23:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
Cc: ada.coupriediaz@arm.com, catalin.marinas@arm.com, dev.jain@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhiramat@kernel.org, will@kernel.org,
	yang@os.amperecomputing.com
Subject: Re: [PATCH v3 0/1] kernel: kprobes: fix cur_kprobe corruption during
Message-ID: <aaVzOfAKhQ-uLG06@J2N7QTR9R3>
References: <aZSdkGjy2BXUL0bT@J2N7QTR9R3.cambridge.arm.com>
 <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302105347.3602192-1-khaja.khaji@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94892-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.rutland@arm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.831];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F27411D77AC
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:23:46PM +0530, Khaja Hussain Shaik Khaji wrote:
> This patch fixes a kprobes failure observed due to lost current_kprobe
> on arm64 during kretprobe entry handling under interrupt load.
> 
> v1 attempted to address this by simulating BTI instructions as NOPs and 
> v2 attempted to address this by disabling preemption across the
> out-of-line (XOL) execution window. Further analysis showed that this
> hypothesis was incorrect: the failure is not caused by scheduling or
> preemption during XOL.
> 
> The actual root cause is re-entrant invocation of kprobe_busy_begin()
> from an active kprobe context. On arm64, IRQs are re-enabled before
> invoking kprobe handlers, allowing an interrupt during kretprobe
> entry_handler to trigger kprobe_flush_task(), which calls
> kprobe_busy_begin/end and corrupts current_kprobe and kprobe_status.
> 
> [ 2280.630526] Call trace:
> [ 2280.633044]  dump_backtrace+0x104/0x14c
> [ 2280.636985]  show_stack+0x20/0x30
> [ 2280.640390]  dump_stack_lvl+0x58/0x74
> [ 2280.644154]  dump_stack+0x20/0x30
> [ 2280.647562]  kprobe_busy_begin+0xec/0xf0
> [ 2280.651593]  kprobe_flush_task+0x2c/0x60
> [ 2280.655624]  delayed_put_task_struct+0x2c/0x124
> [ 2280.660282]  rcu_core+0x56c/0x984
> [ 2280.663695]  rcu_core_si+0x18/0x28
> [ 2280.667189]  handle_softirqs+0x160/0x30c
> [ 2280.671220]  __do_softirq+0x1c/0x2c
> [ 2280.674807]  ____do_softirq+0x18/0x28
> [ 2280.678569]  call_on_irq_stack+0x48/0x88
> [ 2280.682599]  do_softirq_own_stack+0x24/0x34
> [ 2280.686900]  irq_exit_rcu+0x5c/0xbc
> [ 2280.690489]  el1_interrupt+0x40/0x60
> [ 2280.694167]  el1h_64_irq_handler+0x20/0x30
> [ 2280.698372]  el1h_64_irq+0x64/0x68
> [ 2280.701872]  _raw_spin_unlock_irq+0x14/0x54
> [ 2280.706173]  dwc3_msm_notify_event+0x6e8/0xbe8
> [ 2280.710743]  entry_dwc3_gadget_pullup+0x3c/0x6c
> [ 2280.715393]  pre_handler_kretprobe+0x1cc/0x304
> [ 2280.719956]  kprobe_breakpoint_handler+0x1b0/0x388
> [ 2280.724878]  brk_handler+0x8c/0x128
> [ 2280.728464]  do_debug_exception+0x94/0x120
> [ 2280.732670]  el1_dbg+0x60/0x7c

The el1_dbg() function was removed in commit:

  31575e11ecf7 ("arm64: debug: split brk64 exception entry")

... which was merged in v6.17.

Are you able to reproduce the issue with v6.17 or later?

Which specific kernel version did you see this with?

The arm64 entry code has changed substantially in recent months (fixing
a bunch of latent issues), and we need to know which specific version
you're looking at. It's possible that your issue has already been fixed.

Mark.

> [ 2280.735815]  el1h_64_sync_handler+0x48/0xb8
> [ 2280.740114]  el1h_64_sync+0x64/0x68
> [ 2280.743701]  dwc3_gadget_pullup+0x0/0x124
> [ 2280.747827]  soft_connect_store+0xb4/0x15c
> [ 2280.752031]  dev_attr_store+0x20/0x38
> [ 2280.755798]  sysfs_kf_write+0x44/0x5c
> [ 2280.759564]  kernfs_fop_write_iter+0xf4/0x198
> [ 2280.764033]  vfs_write+0x1d0/0x2b0
> [ 2280.767529]  ksys_write+0x80/0xf0
> [ 2280.770940]  __arm64_sys_write+0x24/0x34
> [ 2280.774974]  invoke_syscall+0x54/0x118
> [ 2280.778822]  el0_svc_common+0xb4/0xe8
> [ 2280.782587]  do_el0_svc+0x24/0x34
> [ 2280.785999]  el0_svc+0x40/0xa4
> [ 2280.789140]  el0t_64_sync_handler+0x8c/0x108
> [ 2280.793526]  el0t_64_sync+0x198/0x19c



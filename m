Return-Path: <linux-arm-msm+bounces-110437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KgpDcO0G2pVFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E986145F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B00E830459FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD8630E0D6;
	Sun, 31 May 2026 04:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="dh7LQijA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DCA2D0C64;
	Sun, 31 May 2026 04:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200567; cv=none; b=W+/0UpcIfjI4VdwsclXZ0y4ZlU57A4gYOs5sHgbtZmV5sK7vnpR3gGdoGOCPo4Lg3OHHFc9d4j0nw5NiOde+xjTI/qeicZlE8cFOoI5D5Le+fVCbukEDzNZuqhf7EdeUP3u/oE6Lkgtm+9wv66q+pjF2HjZJUVMq+ADlPJ7+0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200567; c=relaxed/simple;
	bh=8jFx2EfHA/j1MYHywm1IJI7M7Nx1G4RjikfGNeK1t+Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXUKPr91Ffz73xdZhhb3ZXxYNsKwYxGnzJkdAAZMmgB24gazRp33KuWL5wj69RqRzA1icoqbDvdRtApiNel6rbXLluKSKfjdgBaF3jDknSGK6oPjwYnLdOE90dwcVN5IYVsMULPirvWxgeyzFiqf8LVAK6XgHByWERMscb2gu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=dh7LQijA; arc=none smtp.client-ip=149.210.149.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission1.mail.transip.nl (unknown [10.100.4.70])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gSkB06z75zRhjc;
	Sun, 31 May 2026 06:09:12 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission1.mail.transip.nl (Postfix) with ESMTPA id 4gSkB00f6FzJjhXx;
	Sun, 31 May 2026 06:09:12 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@kernel.org>,
	van Hazendonk <github.com@herrie.org>
Subject: [PATCH v2 0/2] irqchip: add MSM8x60 MPM wakeup interrupt controller
Date: Sun, 31 May 2026 06:09:09 +0200
Message-ID: <cover.1780195817.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission1.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200552; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=n6KVD8QjDPvusnMvLoUlxwwYj06x0h+adODibnesU8A=;
 b=dh7LQijAqAVXTgLeLbLSzbPINlCxAzrM44NwUjGguEN7MP0mo4wPV8kYjCl5RczpaxtVt3
 UHE8tc03jpotyhMoyMc++9MY+NaHYECSVyEkNU0ADHOCBqlOniVwJnWTZElNSHCFSoStc5
 Gz2yJ/9LDA608o1wjXdRUbR9HOaD4vH8nMY+e4HesDXw5MYOBu2tSnDiOAgmfoLv985gGP
 H2REXNT3xQiVzNkcv8JQKZlO4ur4tI+tT9u0WnGaelf78tQTy0sVSeaPIOPLjJihhhljFn
 vzNw7t4wITvZlvjUpCw18gs8tivcFKFqiWh068hdYg3zS2b2/ubbKpYhrTsV8g==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-110437-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herrie.org];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,herrie.org:mid,herrie.org:dkim]
X-Rspamd-Queue-Id: D1E986145F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Self-review (with Sashiko AI assist) caught eight real issues in v1
before maintainer review reached them; re-rolling promptly. v1:

  https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/

v2 changes:

  - PREEMPT_RT: drop the syscon regmap and ioremap the vMPM sub-region
    of the RPM control block directly. The IRQ core invokes the
    irqchip mask/unmask/set_type/set_wake callbacks with the irq_desc
    raw_spinlock_t held, and syscon regmaps use a sleepable
    spinlock_t that becomes an rt_mutex on PREEMPT_RT. Direct MMIO
    (readl_relaxed/writel_relaxed) is what every other SoC irqchip
    in tree does for the same reason (qcom-pdc, gic-v3, ...).

  - RPM doorbell: after every vMPM register write, send a message
    through the qcom-apcs-ipc mailbox. v1 acquired the mailbox
    channel but never used it, so the RPM kept running with its
    cached enable / detect / polarity state and our configuration
    changes had no effect.

  - Teardown order: v1 used devm_request_irq() and then called
    irq_domain_remove() manually in ->remove(); the devres-managed
    handler outlives the domain, so an IRQ arriving in the removal
    window would dereference a freed domain. Switch to plain
    request_irq() / free_irq() and remove in strict reverse-init
    order (free_irq, free mailbox, irq_domain_remove).

  - .irq_set_wake: implement it (toggle the MPM enable bit + delegate
    to irq_chip_set_wake_parent for the GIC) and drop
    IRQCHIP_SKIP_SET_WAKE. v1 declared SKIP and provided no
    callback, so enable_irq_wake() was a silent no-op for every
    consumer.

  - Clear-before-dispatch: in the IPC IRQ handler, write CLEAR for
    the pending bits before calling generic_handle_domain_irq() for
    each pin. v1 cleared after the handler returned, racing against
    a fresh edge latched during dispatch and silently dropping it.

  - DT pin-map bounds check: validate each qcom,mpm-pin-map pin
    entry against MSM8660_MPM_PIN_COUNT before storing it, so a
    malformed DT cannot induce out-of-bounds register accesses in
    later set_type/enable paths.

  - Consumer API lifetime: msm8660_mpm_get() now takes a consumer
    device argument and establishes a DL_FLAG_AUTOREMOVE_CONSUMER
    device link to the MPM device. Without this, an unbind of the
    MPM driver would free the devres-managed struct while consumers
    still hold pointers, causing UAF on the next call.

  - regmap_read return check: moot now that we use readl_relaxed,
    but the original Sashiko finding (uninitialised val on regmap
    error) is closed.

DT binding: drop qcom,rpm-syscon and qcom,mpm-offset; replace with a
single reg property pointing at the vMPM window inside the RPM
control block. dt_binding_check passes on the example.

Driver passes checkpatch with zero warnings or errors.

Thanks,
Herman

Herman van Hazendonk (2):
  dt-bindings: interrupt-controller: qcom: add msm8660-mpm
  irqchip: add MSM8x60 MPM wakeup interrupt controller driver

 .../qcom,msm8660-mpm.yaml                     | 122 +++
 drivers/irqchip/Kconfig                       |  23 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-msm8660-mpm.c             | 740 ++++++++++++++++++
 include/soc/qcom/msm8660-mpm.h                |  83 ++
 5 files changed, 969 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,msm8660-mpm.yaml
 create mode 100644 drivers/irqchip/irq-msm8660-mpm.c
 create mode 100644 include/soc/qcom/msm8660-mpm.h

-- 
2.43.0



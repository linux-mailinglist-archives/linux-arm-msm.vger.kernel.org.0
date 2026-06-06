Return-Path: <linux-arm-msm+bounces-111508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nphcB1cUJGoc2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:36:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C9864D73A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:36:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=herrie.org header.s=transip-a header.b=OdzQVzNE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAAF1302E790
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C5539F165;
	Sat,  6 Jun 2026 12:35:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587E3A5434;
	Sat,  6 Jun 2026 12:34:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749301; cv=none; b=EBaQeMdQ+hbJ3Iu+LHAioChj5lVWC8IpxUmAmBrd++moUcgBgufRudpBWGcDfHy+tGVkpvNwYExBAbOysE0bmwvmZWpsh8ZdcMcBx48ORDio4MUW9hQZJl/bEkkD/XwOcGPGtW0zKZqXMhN8xVp7eFPaK/Iv2zUYqYv4VFGnVJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749301; c=relaxed/simple;
	bh=/sdLYb7HiwW41ku/waMHD09EcecKAyZhUtgaLIYVZPQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ibnd1ur/2CIVT17+JlYrXk0d2vY3qPd3kacQa48ml00MfJCKrxxNedp4TfmCglRYlJYjKSGUzPNAq11pmavHNrmJsY2nqNezxaJAiCLrZHoAqnZdE6VnpVxwX8OYYHLtxOB4OAOa/gokd9B5Z4DFuPuL2kzCrdh5dPYm/agji3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=OdzQVzNE; arc=none smtp.client-ip=136.144.136.2
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4gXd6f4xMyzwPPl;
	Sat,  6 Jun 2026 14:34:50 +0200 (CEST)
Received: from [127.0.1.1] (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission2.mail.transip.nl (Postfix) with ESMTPA id 4gXd6d5mM7zJjhYB;
	Sat,  6 Jun 2026 14:34:49 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH v3 0/2] interconnect: qcom: add MSM8x60 NoC driver
Date: Sat, 06 Jun 2026 14:34:49 +0200
Message-Id: <20260606-submit-interconnect-msm8660-v3-0-f9da0158cdf8@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOkTJGoC/x3MwQqDMAyA4VeRnBeoVYL6KrJD7TLNoVGabgjiu
 6+M//Rd/guMs7DB1FyQ+Ssmu1Z0jwbiFnRllFc1eOfJ1dA+S5KCooVz3FU5FkyWBiKH5HvvYjv
 2CwWohyPzW87/fX7e9w9BTaODbQAAAA==
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Herman van Hazendonk <github.com@herrie.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780749289; l=4513;
 i=github.com@herrie.org; s=20240417; h=from:subject:message-id;
 bh=/sdLYb7HiwW41ku/waMHD09EcecKAyZhUtgaLIYVZPQ=;
 b=CkyX1dS0mZn0EzOup9y+ZObwAS7bXKUkJVZvwMxGwQeQwDCMSDsCOyliZH003lsUAWp8fkIRg
 Wi8D5cnrmltDZCmqKe+jg7Ltj9YwK8jlIvYXj2dZKf6QccX2mXfwTH4
X-Developer-Key: i=github.com@herrie.org; a=ed25519;
 pk=YYxdq8fb5O9vhkW3n2dCH044FPZZO5718v/du7fRhFw=
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780749290; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=l0eQSqyJnMG+PBzP9ncSMISaaSFS2QO9XZhcyls2bGE=;
 b=OdzQVzNEUwcgUo6K5WDyix1nAN1Vhe+GszRqMhL/pZmqdtWAC0l4VKk9bn/T25Knb3TJQh
 bqQciDr2YZxPL6hetV5cAC5pCJe6Gx1+Vx0fopb4nniF52TsQxmEo3WQ5ItUuapyhKmNzs
 RKRcUw/T942N0xxHO5LwhflKRtqJiRc8dv1RAxoWDdWWNWk6M0c3JnofPgoFGK9FndJ3DT
 vUMd3v16JC4zUetzyIjHT7ue+5a1s9M+xRPakKw7jmb2dvnMSDtA/dNVV3j5cKztVWD9cV
 9tDrU5ihBGCZy8yGrBWAqt1d33sH1/3FGmHTqFyElJ96/7baMUs9QnVOrfBLZg==
X-Report-Abuse-To: abuse@transip.nl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111508-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[herrie.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:github.com@herrie.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:mid,herrie.org:dkim,herrie.org:from_mime,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68C9864D73A

Add an interconnect provider for the MSM8x60 family (MSM8260 / MSM8660
/ APQ8060). The driver describes the four NoC fabrics (System, Apps,
MMSS, Daytona) and the RPM-managed fabric arbitration tables that
program per-master / per-tiered-slave bandwidth budgets via
QCOM_RPM_*_FABRIC_ARB resources.

v3 folds one High Sashiko finding (msm8660_rpm_commit() concurrent
access on shared per-fabric scratch buffers) on top of the v2 patchset
that addressed the maintainer / LKP feedback from v1.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
Changes in v3:

  - [High Sashiko] msm8660_rpm_commit() ran with no synchronisation.
    The shared per-fabric scratch buffers (qp->arb, qp->bwsum,
    qp->rpm_buf) are allocated once at probe and reused across all
    ICC set operations. The ICC core can dispatch provider->set
    concurrently from different CPUs, so two msm8660_rpm_commit()
    instances could interleave their memset()s and overlapping
    per-node writes, producing a corrupted packet on the
    qcom_rpm_write() to RPM firmware. Added a 'struct mutex
    commit_lock' to msm8660_icc_provider, initialised via
    devm_mutex_init() in probe, taken across the entire
    memset -> iterate -> pack -> qcom_rpm_write sequence with a
    scoped guard(mutex)().

Changes in v2 (already sent 2026-06-04):

Maintainer / LKP feedback on v1:

  - [Medium] dt-bindings: add explicit '#interconnect-cells: const: 1'.
    The common rpm-common.yaml permits both 1- and 2-cell phandles for
    historical reasons; without an explicit const here a 2-cell consumer
    would pass schema validation but then fail of_icc_xlate_onecell()
    at runtime.

  - [High] msm8660_get_rpm(): drop the manual device_link_remove()
    before the EPROBE_DEFER return path. The link is added with
    DL_FLAG_AUTOREMOVE_CONSUMER, so the driver core releases its kref
    when our probe ultimately fails. The manual remove dropped an
    extra kref -> potential UAF on the supplier device.

  - [Low] devm_clk_bulk_get_optional(): drop the dead ret == -ENOENT
    branch. The helper internally masks per-clock ENOENT to NULL
    handles before returning, so the branch is unreachable.

  - [High] static msm8660_qnode .node cache pointers: on probe
    failure icc_nodes_remove() frees the dynamic icc_node but the
    cache field still points at freed memory. A subsequent
    probe-retry (or unbind/rebind) would then dereference the stale
    pointer. Added msm8660_clear_node_cache() helper, called from
    both err_remove_nodes: and msm8660_icc_remove(). Same latent bug
    exists in the icc-rpmh.c template; we keep it local for now.

  - [High] icc_link_nodes(): check the return value. Failure
    (-ENOMEM from krealloc) was silently ignored -> partially-linked
    topology with no error path. Now goto err_remove_nodes on
    failure.

Test results (v3, HP TouchPad APQ8060, kernel 7.1.0-rc1):

  - All four fabrics probe clean at boot
    (4096000.qnoc, 4400000.qnoc, 4500000.qnoc, 4540000.qnoc).
    Real bandwidth votes flow through slv_ebi_ch0 (DDR), MDP,
    video-codec, camss.

  - 120s concurrent multi-subsystem load
    (camera stream loop + dd to eMMC + /dev/urandom + filesystem
    walk + USB I/O): zero qcom_rpm errors, zero icc warnings,
    USB stayed up, MDP stayed active, no display glitches or
    USB stalls.

  - dmesg post-load: 0 WARN, 0 BUG, 0 Oops. Specifically no
    "qcom_rpm: ARB write failed" and no "interconnect: ... failed"
    messages.

  - Kernel build clean (ARCH=arm, CONFIG_INTERCONNECT_QCOM_MSM8660=y).

- Link to v1: https://lore.kernel.org/r/20260603163410.2312712-1-github.com@herrie.org
- Link to v2: https://lore.kernel.org/r/20260604184400.801543-1-github.com@herrie.org

---
Herman van Hazendonk (2):
      dt-bindings: interconnect: qcom: add msm8660 NoC
      interconnect: qcom: add MSM8x60 NoC driver

 .../bindings/interconnect/qcom,msm8660.yaml        |  166 ++
 drivers/interconnect/qcom/Kconfig                  |   14 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/msm8660.c                | 1663 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,msm8660.h    |  156 ++
 5 files changed, 2001 insertions(+)
---
base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
change-id: 20260606-submit-interconnect-msm8660-62420c194b6a

Best regards,
-- 
Herman van Hazendonk <github.com@herrie.org>



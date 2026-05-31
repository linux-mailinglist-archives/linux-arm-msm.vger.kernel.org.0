Return-Path: <linux-arm-msm+bounces-110441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGHPL6K0G2pXFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED06145B7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15C1E302F6B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F4C329E79;
	Sun, 31 May 2026 04:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="DztoHCe/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5F026F46F;
	Sun, 31 May 2026 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200585; cv=none; b=Thmiel8LpXan/nzVOINrQk/BqgzS9S8Jbm37vlOHdF1JCfSpIfP8Ba3YF7saJJeiZYdo13MyV2tvh3YhvbwTo2Ydc7NEg1cSWdJsDe+Pfcb/HOMEp98cI/MgoeqgFyCs+FrG464p0NK17VYxtepHiD4sBikbNDTyL4ct8A1bsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200585; c=relaxed/simple;
	bh=36NhuOVHY5OtaVczkA7Bdp6fFKvM65k1mtw8NRYVGJM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEZmsvu61ndKFXykdYROfKSTXt7BpSxsTkUP4p30nFK4atvkDSTQ7tei6A9MrzhAviHRYCMA7C/nRNMXLEJ3VKb9NRD5NaanGBv8CorRa0NlHZV5EdXehW3BsH0VXCCneoPxHxGrbilZCBVYTpBTHbDpwXo6ICsp/xw/CL13qLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=DztoHCe/; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission3.mail.transip.nl (unknown [10.100.4.72])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gSk9w3ZYhzY75ZZ;
	Sun, 31 May 2026 06:09:08 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission3.mail.transip.nl (Postfix) with ESMTPA id 4gSk9v4ppGzf52b6;
	Sun, 31 May 2026 06:09:07 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Georgi Djakov <djakov@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] interconnect: qcom: add MSM8x60 NoC driver
Date: Sun, 31 May 2026 06:09:05 +0200
Message-ID: <cover.1780197411.git.github.com@herrie.org>
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
X-Scanned-By: ClueGetter at submission3.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200547; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=NlW9i/XlXywCqjlGWse0QjhnP2pj35gx6iynqe3HBOA=;
 b=DztoHCe/hVyufbESPee0DHTn8VM3g73jwxtq6fa/KLnjMFWRzQ54Z0r9U+bdw/gAnn3Yqs
 fcHkffhpxngFqbk3bRIj6qOTJjiaTwfciFwJ1/MTUtb0sIqSZbcn67lL/X4shqkkxZinlP
 XccuOY+nTj7P4CStJt8HJdtIc9UD47+IlfuIRap5xDbqbiPR5SNBJ0051y+8kr6jCp/XaI
 gy8BZBM5QGbWWUZ1f5CYxxmqJokgR2bU5SOYLRwgjjBF8vskTn5EBS4l5g89nMDW6z+YkE
 iEFREv7JQzu6bgwvXg//XKe6R+1RgrclxxOT4LYETrJwPkZGYyLHRVaOXjkuLw==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110441-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,herrie.org:mid,herrie.org:dkim]
X-Rspamd-Queue-Id: 3CED06145B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

Self-review (with Sashiko AI assist) caught five real issues in v1's
NoC driver before the maintainer review cycle reached them, so
re-rolling promptly. v1:

  https://lore.kernel.org/linux-arm-msm/cover.1780148149.git.github.com@herrie.org/

v2 changes (driver patch only; the binding header is unchanged from v1):

  - MMFAB master port collision: mmfab_to_appss claimed port 2, but
    that port was already owned by mmfab_mas_adm1_port0. Per the
    fabric's port table the APPS_FAB gateway lives at port 11; fix
    the DEFINE_QNODE so ADM1 DMA's arbitration vote on MMFAB is no
    longer overwritten by the gateway.

  - msm8660_rpm_commit() double-converted bandwidth units: it called
    icc_units_to_bps() (which already returns bytes/s) and then
    immediately divided by 8 "bits -> bytes", asking RPM for 1/8 of
    the bandwidth that consumers had requested. Drop the spurious
    divide.

  - Fabric rate cache hoisted to provider scope and divided by the
    fabric's own bus width rather than the triggering node's local
    buswidth. A fabric has one shared hardware clock; using each
    master's local buswidth makes the requested clk rate oscillate
    depending on which master called icc_set_bw() last, and caching
    the result on the node lets a subsequent update skip clk_set_rate
    even though a different node has already moved the hardware. The
    new layout adds desc->bus_width per fabric (AFAB/SFAB/DFAB=8,
    MMFAB=16) and qp->rate as the single source of truth.

  - msm8660_get_rpm() rewritten:
      * returns ERR_PTR(-EPROBE_DEFER) when the RPM phandle resolves
        but the device hasn't probed yet, instead of returning NULL
        and silently disabling ARB forever;
      * adds a device_link to the RPM device so the devres-managed
        qcom_rpm struct can't be freed out from under us if the RPM
        driver is unbound at runtime (previously a use-after-free
        risk because we kept a pointer past put_device()).
    Probe propagates IS_ERR(qp->rpm) up so the framework retries.

  - devm_clk_bulk_get_optional() now distinguishes -EPROBE_DEFER
    (propagated) from real "no clocks" (continue without scaling).
    Previously every error was swallowed, which permanently disabled
    clock scaling if the icc driver happened to probe before the
    clock provider - which it usually does, given the core_initcall
    ordering.

No functional change intended on the working paths; this is purely
correctness work.

Thanks,
Herman

Herman van Hazendonk (2):
  dt-bindings: interconnect: qcom: add msm8660 fabric IDs
  interconnect: qcom: add MSM8x60 NoC driver

 drivers/interconnect/qcom/Kconfig             |   10 +
 drivers/interconnect/qcom/Makefile            |    2 +
 drivers/interconnect/qcom/msm8660.c           | 1069 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,msm8660.h   |  156 +++
 4 files changed, 1237 insertions(+)
 create mode 100644 drivers/interconnect/qcom/msm8660.c
 create mode 100644 include/dt-bindings/interconnect/qcom,msm8660.h

-- 
2.43.0


